Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1B888327AD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 11:31:11 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=rAD1fCKz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGbW14xs4z3cWq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 21:31:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=merlin.20170209 header.b=rAD1fCKz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1234::107; helo=merlin.infradead.org; envelope-from=geoff@infradead.org; receiver=lists.ozlabs.org)
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1234::107])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGbRP4rWdz3bYQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jan 2024 21:28:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=merlin.20170209; h=Date:To:Subject:From:References:
	In-Reply-To:Message-Id:Sender:Reply-To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bKr74nA05HjNGZfvRaBr/46bGGKPOW5N/hV/HPvdgGg=; b=rAD1fCKz1TArEBtyFSCTLVjs8c
	oROWFHn1DgosrlQhi+r/mlMb8Ho6yeqzNko6TcOvQZs2fQ0L/OT1XZURTwr6wV8QxylhLHu9T9Ngo
	grF57QyCir/VTMpbk+C3s48sEMtni1nx/71cnvAksJCgoQhBMxlQUTz2wTXJr7r1iPLREq1FvRnur
	YhLnUgpy5fq1eVqZzpXJx8tbydZ6q5M5FBQHNneqcTN3dSSChZ43wt72zEL24E3q//9naJYL/QVgT
	M4o81morIhkHoDGuosiugLp0Mkew/BVYVonnWC4cYoy02K7YZibmwKAqXtZumcdE73Z5k7DP4ulk8
	PNF4+1gw==;
Received: from geoff by merlin.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rQm6L-00000000FAH-3xY6;
	Fri, 19 Jan 2024 10:27:54 +0000
Message-Id: <983836405df1b6001a2262972fb32d1aee97d6f5.1705654669.git.geoff@infradead.org>
In-Reply-To: <cover.1705654669.git.geoff@infradead.org>
References: <cover.1705654669.git.geoff@infradead.org>
From: Geoff Levand <geoff@infradead.org>
Patch-Date: Fri, 19 Jan 2024 17:16:07 +0900
Subject: [PATCH 4/4] Revert "powerpc/ps3_defconfig: Disable
 PPC64_BIG_ENDIAN_ELF_ABI_V2"
To: Michael Ellerman <mpe@ellerman.id.au>,
    Nicholas Piggin <npiggin@gmail.com>,
    linuxppc-dev@lists.ozlabs.org
Date: Fri, 19 Jan 2024 10:27:53 +0000
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

Patches provided by Nicholas Piggin enable PS3
support for ELFv2.

Signed-off-by: Geoff Levand <geoff@infradead.org>
---
 arch/powerpc/configs/ps3_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/powerpc/configs/ps3_defconfig b/arch/powerpc/configs/ps3_defconfig
index aa8bb0208bcc..2b175ddf82f0 100644
--- a/arch/powerpc/configs/ps3_defconfig
+++ b/arch/powerpc/configs/ps3_defconfig
@@ -24,7 +24,6 @@ CONFIG_PS3_VRAM=m
 CONFIG_PS3_LPM=m
 # CONFIG_PPC_OF_BOOT_TRAMPOLINE is not set
 CONFIG_KEXEC=y
-# CONFIG_PPC64_BIG_ENDIAN_ELF_ABI_V2 is not set
 CONFIG_PPC_4K_PAGES=y
 CONFIG_SCHED_SMT=y
 CONFIG_PM=y
-- 
2.34.1

