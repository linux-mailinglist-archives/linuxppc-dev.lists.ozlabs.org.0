Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1A77715C9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Aug 2023 17:13:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e/FIPO3I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RJjcz6Cl9z3cQr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Aug 2023 01:13:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=e/FIPO3I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RJjYZ2cMvz2ywL
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Aug 2023 01:10:10 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C06C61132;
	Sun,  6 Aug 2023 15:10:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1F7C433CA;
	Sun,  6 Aug 2023 15:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691334607;
	bh=XWcGPs3wlJLQMOkajZ5ap0aPtwZ0AG8zS8ewAKz4h5g=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=e/FIPO3InylhjF4O3HN9gZVSNXzwJ9cahwetd+dnCssUrzzS9XLsvbyg2xWTGMMlS
	 g/4GL3XRJEAQbN2bVXVc7CNr/BytxauXZHAnzUf06iqzbriX3KWxHdjCvvLKOdIec9
	 z4hlSoJhGBazr3tWsMjiQmKIyaT15LTxr64PSjs1N5WWLWLqaaH0NBzDNDUleBC0KR
	 DtmkwXSNacaRidoD5G6HpeB0TienVDGnpiT69uZKEXHQ5kfLXYIrsonLDIh0LHJaX4
	 fwaMAtLaeoGTPjR6/BuIwwQ0Nl/CHebMVRje561j+jFi2lSkYuGVTPkcondx9xClmn
	 EXuEEnF8qLgaw==
From: Masahiro Yamada <masahiroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc: remove <asm/export.h>
Date: Mon,  7 Aug 2023 00:09:54 +0900
Message-Id: <20230806150954.394189-3-masahiroy@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230806150954.394189-1-masahiroy@kernel.org>
References: <20230806150954.394189-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: linux-arch@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

All *.S files under arch/powerpc/ have been converted to include
<linux/export.h> instead of <asm/export.h>.

Remove <asm/export.h>.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 arch/powerpc/include/asm/Kbuild | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index 419319c4963c..61a8d5555cd7 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -3,7 +3,6 @@ generated-y += syscall_table_32.h
 generated-y += syscall_table_64.h
 generated-y += syscall_table_spu.h
 generic-y += agp.h
-generic-y += export.h
 generic-y += kvm_types.h
 generic-y += mcs_spinlock.h
 generic-y += qrwlock.h
-- 
2.39.2

