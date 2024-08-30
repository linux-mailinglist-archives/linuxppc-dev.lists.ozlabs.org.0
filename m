Return-Path: <linuxppc-dev+bounces-819-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 245329664B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Aug 2024 16:58:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WwLqx0NWRz30D3;
	Sat, 31 Aug 2024 00:58:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=178.60.130.6
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725029430;
	cv=none; b=Ac390SW4QoDsEucC/cL+pPqjZ9QM0HhQeXtWg7fC9hSggt4wt911zlVfOzUYn5NwFVxzzFJ3kycuPiaK4epS6kMcifugwlTw8NHYd6QgoV2DeBsSFlVJmUu1PM5VKQ00iHpN+57fBeyqmPSoiffcZJy2raQK2Ig3ods8sseXYMyNqr4FFmE6oAPvFAH6AeoQ1sQ/ljJxTR4x6jQe/h3GSrlQy867D0kPAIvunniaSLvykrTeZPoMbIoZ+os5lLy2LFBQVz4K++6DdTkDpervttwEFn2iU1Y7nnkTjSg/m6HjhfKyHF5DNEaLgmIO3OwnBhbmvMlxBkyMMSjFDaQwIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725029430; c=relaxed/relaxed;
	bh=v6/zyvof4qMqjJ+4xzc0g1Ye/jBKn1I/cVtXd5Huwfg=;
	h=X-Greylist:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding; b=lk8n/IqcuTPgQCxGiuTyxTiPhhVtbgVfyQpPLQcWyIZwjqnz0otUAt6bHjWhVEawTYLJf748Zi8rXq0Mjsin4h9VunLagSl4vZsIRZjV8MHqB8nZGmOQFHc1DTGzN067H4D3hzChHHYTPhH7TZCaPgXIEaQrrmYnaywruj50OKKFYulBhtR2zDg3EGqq+ciqWfz4v1Mdss0WtH2QM8wv1wBIe7KCGaQoOqkg3ljyI0iXqzHAx1oeZE8n6NHgj3vjlWK7Fa7on8AYHeP5vbNy4VFLXco4UhAdtPgjJWwvBGIuYdQDSAaghSd+PFRdPJ4xkESVAVrnZWftbquNz5vyfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=igalia.com; dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=ez/ZxdhR; dkim-atps=neutral; spf=pass (client-ip=178.60.130.6; helo=fanzine2.igalia.com; envelope-from=gpiccoli@igalia.com; receiver=lists.ozlabs.org) smtp.mailfrom=igalia.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=ez/ZxdhR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=igalia.com (client-ip=178.60.130.6; helo=fanzine2.igalia.com; envelope-from=gpiccoli@igalia.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1937 seconds by postgrey-1.37 at boromir; Sat, 31 Aug 2024 00:50:28 AEST
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WwLfr3t56z3009
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 Aug 2024 00:50:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=v6/zyvof4qMqjJ+4xzc0g1Ye/jBKn1I/cVtXd5Huwfg=; b=ez/ZxdhRyaLTDXkcXt65kzdlXC
	2F44k9Z3lOfVzv7CwMwOroZhtPXAalN0AmKaIGuapFlajlqY1xlF/6PB5aRl5wk116Iao061OZ0mA
	akWE8kVPlF5imhW8ZGxMyxKcviQXCv2rKt/qZfsqSoA51I1n0N/NklNUkLUIdfLBj2fIL5M+lDtI6
	ka3De4ySH7ImuAqJ+F28rzMXkemWtdw862wGu4V8hcvcRNj7Em4oeUUu9I0/XjawFmvAZDVrwYQRX
	uBuQlkvGzuLeSY/wFa8o/crROA326Xbtg6lHoytkl4bh6lO2ccY/o9NMLPiH/RbsyhX5dH3D+gZZz
	YdxGJBgQ==;
Received: from [177.76.152.96] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1sk2Rs-007B3a-Mf; Fri, 30 Aug 2024 16:18:00 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: kexec@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Cc: bhe@redhat.com,
	vgoyal@redhat.com,
	dyoung@redhat.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	christophe.leroy@csgroup.eu,
	naveen@kernel.org,
	hbathini@linux.ibm.com,
	tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	ashish.kalra@amd.com,
	michael.roth@amd.com,
	brijesh.singh@amd.com,
	thomas.lendacky@amd.com,
	linux-kernel@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	stephen.s.brennan@oracle.com,
	kernel@gpiccoli.net,
	kernel-dev@igalia.com,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH] powerpc/fadump, x86/sev: Inform about unconditionally enabling crash_kexec_post_notifiers
Date: Fri, 30 Aug 2024 11:17:15 -0300
Message-ID: <20240830141752.460173-1-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.46.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Inspired by commit d57d6fe5bf34 ("drivers: hv: log when enabling crash_kexec_post_notifiers"),
a good idea is to signal on dmesg about unconditionally enabling the kernel
parameter crash_kexec_post_notifiers, which affects how kdump works.

By checking the source code, found 2 more cases besides Hyper-V, so let's
print that on dmesg for them as well.

Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 arch/powerpc/kernel/fadump.c | 1 +
 arch/x86/virt/svm/sev.c      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index a612e7513a4f..37dee89a0bf2 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -1819,6 +1819,7 @@ int __init setup_fadump(void)
 	 * notifiers are invoked.
 	 */
 	crash_kexec_post_notifiers = true;
+	pr_info("PPC/fadump: enabling crash_kexec_post_notifiers\n");
 
 	return 1;
 }
diff --git a/arch/x86/virt/svm/sev.c b/arch/x86/virt/svm/sev.c
index 0ce17766c0e5..ac445ad2fcc8 100644
--- a/arch/x86/virt/svm/sev.c
+++ b/arch/x86/virt/svm/sev.c
@@ -257,6 +257,7 @@ static int __init snp_rmptable_init(void)
 	 * notifier is invoked to do SNP IOMMU shutdown before kdump.
 	 */
 	crash_kexec_post_notifiers = true;
+	pr_info("AMD/SEV: enabling crash_kexec_post_notifiers\n");
 
 	return 0;
 
-- 
2.46.0


