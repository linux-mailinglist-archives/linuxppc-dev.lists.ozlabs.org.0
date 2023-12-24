Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A442F81D76F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Dec 2023 01:53:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pi5oeE6u;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SyMwz04KRz3c3H
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Dec 2023 11:53:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=pi5oeE6u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SyMw542BWz2xcp
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Dec 2023 11:53:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:To:Subject:From:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=SbtpzQ1mMoyOp1SxOoEEffhAWj9cVrDhMMR3qD0sCyI=; b=pi5oeE6udcispur0yrc8KqlKJR
	3QqguvulMJdtzbsKJZ7Nj4yZ7cvPvfJ3/9hUVexN3u6IysSv7h5XW5xn1mRybClHrVWcN9P3bFHZC
	rKMny3mKy6IbkkKaqPydqQ/Sd8KzIG3loXEUtdT8Yooz8ubKNgPgF7UAtBdEK7lmBPUpylBUgl1JQ
	6F6FJexBEkjmG5q614Tmvx13Y75BEH9awiqwx7U7eQxYnKMRFw/VAztKqv6QtWVWxmQ9k6U5UqkM0
	GGw9b7EBwjx9N71Xs00OZb+qGwlrq+XRaTZ8sY8rdiM0pTKT2E7nsm4f6g0vzjbNGVP9sYst3eYLG
	AXRTaXVw==;
Received: from om126166238204.28.openmobile.ne.jp ([126.166.238.204] helo=[192.168.43.165])
	by desiato.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rHCjg-00Fu86-0G;
	Sun, 24 Dec 2023 00:52:56 +0000
Message-ID: <df906ac1-5f17-44b9-b0bb-7cd292a0df65@infradead.org>
Date: Sun, 24 Dec 2023 09:52:46 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Geoff Levand <geoff@infradead.org>
Subject: [PATCH] powerpc/ps3_defconfig: Disable PPC64_BIG_ENDIAN_ELF_ABI_V2
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 8c5fa3b5c4df3d071dab42b04b971df370d99354 (powerpc/64: Make ELFv2 the
default for big-endian builds), merged in Linux-6.5-rc1 changes the calling ABI
in a way that is incompatible with the current code for the PS3's LV1 hypervisor
calls.

This change just adds the line '# CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 is not set'
to the ps3_defconfig file so that the PPC64_ELF_ABI_V1 is used.

Fixes run time errors like these:

	BUG: Kernel NULL pointer dereference at 0x00000000
	Faulting instruction address: 0xc000000000047cf0
	Oops: Kernel access of bad area, sig: 11 [#1]

	Call Trace:
	[c0000000023039e0] [c00000000100ebfc] ps3_create_spu+0xc4/0x2b0 (unreliable)
	[c000000002303ab0] [c00000000100d4c4] create_spu+0xcc/0x3c4
	[c000000002303b40] [c00000000100eae4] ps3_enumerate_spus+0xa4/0xf8

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/configs/ps3_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/ps3_defconfig b/arch/powerpc/configs/ps3_defconfig
index 2b175ddf82f0..aa8bb0208bcc 100644
--- a/arch/powerpc/configs/ps3_defconfig
+++ b/arch/powerpc/configs/ps3_defconfig
@@ -24,6 +24,7 @@ CONFIG_PS3_VRAM=m
 CONFIG_PS3_LPM=m
 # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
 CONFIG_KEXEC=y
+# CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 is not set
 CONFIG_PPC_4K_PAGES=y
 CONFIG_SCHED_SMT=y
 CONFIG_PM=y
-- 
2.34.1

