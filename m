Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0ED538B4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 08:16:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LC29h5Ldjz3bmr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 May 2022 16:16:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RwBGNA04;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LC2940hWMz2xss
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 16:16:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=RwBGNA04;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LC291721gz4xZ9;
	Tue, 31 May 2022 16:16:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1653977782;
	bh=L9W+Ez14jNWPvYxx5g+IS/ySPZL3FBFAy+k2BgakNiM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=RwBGNA04uOwOF57bymmd7wH/6woLNPUzxr7lLhrqbAYPZVBm2pPDxLQHQoXjz4BSu
	 ssRjypFGaeqU5VyVQ2r1BfagcsNUbrydDSkszrv4Pz6raJKwm4FwZcCP1kDwnzizZQ
	 uB8UumwCAYYXqSYYVEcrEmF7viOuv0pk10RQpJbAV6O6tay9ou7BkO6s/fDEHPJ9zn
	 7RaMVfMgWJChDOS1MUfJxlPpNg5r8xhdk5lA+nKMyNXsctdauJatym5X/VRvMhldgJ
	 w2rgYqtbbg8fb5PRRUtRz7CnaDoYjTpPporpJTQthoRlxnIhyVYuwPp5tmMIWh7LXp
	 Mqvin/cVVfnBQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/Kconfig: Force THREAD_SHIFT to at least 14 with
 KASAN
In-Reply-To: <cc1190008368a3305d424a98be756fedec6348c1.1653926503.git.christophe.leroy@csgroup.eu>
References: <cc1190008368a3305d424a98be756fedec6348c1.1653926503.git.christophe.leroy@csgroup.eu>
Date: Tue, 31 May 2022 16:16:19 +1000
Message-ID: <87h756kz0s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> Allthough 14 is the default THREAD_SHIFT when KASAN is selected,
> taking an old config may keep 13 when CONFIG_EXPERT is selected.
>
> Force it to 14 as a minimum when KASAN is selected.
>
> Also default to 15 when KASAN on PPC64.
>
> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/Kconfig | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

I was thinking of doing it in C, similar to the way arm64 handles it.

Something like below. It means we always double the stack size when
KASAN is enabled. I think it's preferable, as it will always work
regardless of whether the user has an old .config (or is bisectting)?

cheers

diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
index 125328d1b980..c9735f93f8e6 100644
--- a/arch/powerpc/include/asm/thread_info.h
+++ b/arch/powerpc/include/asm/thread_info.h
@@ -14,12 +14,17 @@
 
 #ifdef __KERNEL__
 
-#if defined(CONFIG_VMAP_STACK) && CONFIG_THREAD_SHIFT < PAGE_SHIFT
-#define THREAD_SHIFT		PAGE_SHIFT
+#ifdef CONFIG_KASAN
+#define THREAD_SHIFT		(CONFIG_THREAD_SHIFT + 1)
 #else
 #define THREAD_SHIFT		CONFIG_THREAD_SHIFT
 #endif
 
+#if defined(CONFIG_VMAP_STACK) && THREAD_SHIFT < PAGE_SHIFT
+#undef THREAD_SHIFT
+#define THREAD_SHIFT		PAGE_SHIFT
+#endif
+
 #define THREAD_SIZE		(1 << THREAD_SHIFT)
 
 /*


