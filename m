Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F05E742137A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:02:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQTg6jfRz3cMY
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:02:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i/i7wLrh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e;
 helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=i/i7wLrh; dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQS45DkLz2yHy
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:01:08 +1100 (AEDT)
Received: by mail-pg1-x52e.google.com with SMTP id s11so16963855pgr.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Cnfzayer/odaC20bEu/UMo0Ban8qAMEc7NkYV1p/hU8=;
 b=i/i7wLrhPuKj8xef4HNo0yzJAzxsWagLSCJZEm2GVybli0EMdfz1v0EvYh1rvtdAMK
 PLyzi991XdldSAV+o6uOOVlzLSqyfh+k8aIerL+yZDMox4vzWj/LomQ+KnqRV3s3+Oek
 i1t8GJa5GNdzvqTDX5xMZoy05HUBMbmm5eQwrs/aXw/hzHFNA/RhdSQAubcyf3Gzlyep
 Ua5O2JFnzZWaIL3PwVCwlZdadpUfWPJjAuDVAkWCXd64OfFQtqImKxg+9BPLgXC/FL9P
 f9nSXHwj396vz0WBj1QEEpxS0NZ6iT9uAVgh9MXbbycTMzyLVU3TPn4jK0eLNgnylV3z
 wlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Cnfzayer/odaC20bEu/UMo0Ban8qAMEc7NkYV1p/hU8=;
 b=jZlCsh9fovRPqNtGPhJ3NWFHgi6GyWGc89NGEBknXcc9pNW8r++l0oYt/if4jv8bEn
 2xIN6Opioo4DTfLubs4GyQmRMRY12IWnxwFM/fqttMNCcWqG1grcqVPvFg2zvfJPBLJ/
 38SLai+5FwJ2l0ynJ9p54pGpyHJszpex/RaCkJKBFhrQiZ8lebQzSdLsPodnwgjAxQdE
 Lb0Jf7N5E0i2bVcrtreHHzeTmFK/qd7sWLOs1wCMERhXoVDHlc7YZ5yB4sW3AO8D122w
 almJiEbIChkjBS5rd5fkI7f93C9qAkjcUDg85qLX9qA3hU2ks+RwFndPRLRBdxCAXSCA
 RHaA==
X-Gm-Message-State: AOAM5312lOWWfqI5b1a9y9IOW2NTx3F9BU2yEdxtuXzCvHxgsF/8qBww
 vsGgW8S0LxR6rhbWhiAY2Eo=
X-Google-Smtp-Source: ABdhPJzQidBs0IfBrm6laNxRLmaLqZy0ljGZ98570y7F4m7cBL+iegV6TmHqU8fyrzqwkoW3aFxXdw==
X-Received: by 2002:aa7:8891:0:b0:44c:255d:391f with SMTP id
 z17-20020aa78891000000b0044c255d391fmr15502813pfe.26.1633363266698; 
 Mon, 04 Oct 2021 09:01:06 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.01.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:01:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 02/52] powerpc/64s: guard optional TIDR SPR with CPU ftr
 test
Date: Tue,  5 Oct 2021 01:59:59 +1000
Message-Id: <20211004160049.1338837-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The TIDR SPR only exists on POWER9. Avoid accessing it when the
feature bit for it is not set.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 12 ++++++++----
 arch/powerpc/xmon/xmon.c     | 10 ++++++++--
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 2acb1c96cfaf..f4a779fffd18 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3767,7 +3767,8 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
 	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
 	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
 	mtspr(SPRN_BESCR, vcpu->arch.bescr);
-	mtspr(SPRN_TIDR, vcpu->arch.tid);
+	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+		mtspr(SPRN_TIDR, vcpu->arch.tid);
 	mtspr(SPRN_AMR, vcpu->arch.amr);
 	mtspr(SPRN_UAMOR, vcpu->arch.uamor);
 
@@ -3793,7 +3794,8 @@ static void store_spr_state(struct kvm_vcpu *vcpu)
 	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
 	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
 	vcpu->arch.bescr = mfspr(SPRN_BESCR);
-	vcpu->arch.tid = mfspr(SPRN_TIDR);
+	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+		vcpu->arch.tid = mfspr(SPRN_TIDR);
 	vcpu->arch.amr = mfspr(SPRN_AMR);
 	vcpu->arch.uamor = mfspr(SPRN_UAMOR);
 	vcpu->arch.dscr = mfspr(SPRN_DSCR);
@@ -3813,7 +3815,8 @@ struct p9_host_os_sprs {
 static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 {
 	host_os_sprs->dscr = mfspr(SPRN_DSCR);
-	host_os_sprs->tidr = mfspr(SPRN_TIDR);
+	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+		host_os_sprs->tidr = mfspr(SPRN_TIDR);
 	host_os_sprs->iamr = mfspr(SPRN_IAMR);
 	host_os_sprs->amr = mfspr(SPRN_AMR);
 	host_os_sprs->fscr = mfspr(SPRN_FSCR);
@@ -3827,7 +3830,8 @@ static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 	mtspr(SPRN_UAMOR, 0);
 
 	mtspr(SPRN_DSCR, host_os_sprs->dscr);
-	mtspr(SPRN_TIDR, host_os_sprs->tidr);
+	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+		mtspr(SPRN_TIDR, host_os_sprs->tidr);
 	mtspr(SPRN_IAMR, host_os_sprs->iamr);
 
 	if (host_os_sprs->amr != vcpu->arch.amr)
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index dd8241c009e5..7958e5aae844 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -2107,8 +2107,14 @@ static void dump_300_sprs(void)
 	if (!cpu_has_feature(CPU_FTR_ARCH_300))
 		return;
 
-	printf("pidr   = %.16lx  tidr  = %.16lx\n",
-		mfspr(SPRN_PID), mfspr(SPRN_TIDR));
+	if (cpu_has_feature(CPU_FTR_P9_TIDR)) {
+		printf("pidr   = %.16lx  tidr  = %.16lx\n",
+			mfspr(SPRN_PID), mfspr(SPRN_TIDR));
+	} else {
+		printf("pidr   = %.16lx\n",
+			mfspr(SPRN_PID));
+	}
+
 	printf("psscr  = %.16lx\n",
 		hv ? mfspr(SPRN_PSSCR) : mfspr(SPRN_PSSCR_PR));
 
-- 
2.23.0

