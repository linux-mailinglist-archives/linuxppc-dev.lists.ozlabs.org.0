Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8D54459F92
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 10:54:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hyzxg31gDz3cY7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 20:54:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GUOCfZgc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631;
 helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GUOCfZgc; dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzw04GgRz2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:52:48 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id z6so15413043plk.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:52:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dhajFSjo9XGLr2NNVTaKxDL3o4lbPD1thmBbldjfoco=;
 b=GUOCfZgclpfL9GeutA3qlqR6w0gFxqcdTVqVtF39ZXnk9jLLSLhbYpiuVldtYQyLx7
 e0gfOEemlhWg7RGA1YCjS5uT18os9vL5kjjWxgjvHkxktbO8aeFArhIsi4TRJVMOjbjR
 0Z5pdwbfCh9GL/Oq9LRlaXqSU/5W97osHpgEUa1eInH99FISaLX/IzoVqtJJgq6dpJc1
 5uDa5HHVCkEWR6tTBEpTsbFzxcqDIR5hBefE9OPoQ6Vk1k0Lwe+aTuqoUEutM4E7je3N
 blNXKV94iQZZ8N8GHbk0T+jb8jyLasaQ5Ab2rft9dxjWXqyGZbMGUjPcej/iboMbHsIV
 ZH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dhajFSjo9XGLr2NNVTaKxDL3o4lbPD1thmBbldjfoco=;
 b=O6zFfGhKuZVolXKn+9CZrteT4WHJaqGtlSU8YjrzkRfetjQiAWefZbCZhhcvU/YbJf
 E5YJjfCLoB7/bwzEl5+fk34YikN0ar5klyh+Xn8C7b8xIuNj4bD7w+zro0HymzA0oH8n
 0aQT+ZYIA0l4BkLA0wZRnpIHex61Q4GEygYFldcuLRW+QriAH/FVM2eMKrDddGHUEoH9
 YoWkudzumQRkPF2Q/FP7yg62QVAF6QhXTcFhoEW/0bp2F7nZ2VSOehik7Y7ceY+zg3Wf
 OFI/DXF/+13rleDFtyMxb8dgtTzWi0cPD/Sn+GfF0VTT0/fI6PmDu25zQxQ4xaraK+kk
 SgDw==
X-Gm-Message-State: AOAM532dHQUyhUM0weImSUNNIeluWQbCSzGvPkBmtZ90WZtnEv8Rb8wU
 JK6EthyUtLRKD/SkUUU/biPrXUv9K33jOQ==
X-Google-Smtp-Source: ABdhPJxMHg3AvCqsJIyAH5Pmlg0zERwRo/5M+4hwpL+6dM7RTJJflOD62U8fHEx4auJIP7tpysWvgg==
X-Received: by 2002:a17:90b:4a47:: with SMTP id
 lb7mr1265197pjb.243.1637661166335; 
 Tue, 23 Nov 2021 01:52:46 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:52:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 02/53] powerpc/64s: guard optional TIDR SPR with CPU ftr
 test
Date: Tue, 23 Nov 2021 19:51:40 +1000
Message-Id: <20211123095231.1036501-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211123095231.1036501-1-npiggin@gmail.com>
References: <20211123095231.1036501-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The TIDR SPR only exists on POWER9. Avoid accessing it when the
feature bit for it is not set.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 12 ++++++++----
 arch/powerpc/xmon/xmon.c     | 10 ++++++++--
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 7b74fc0a986b..2777f66001a8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3780,7 +3780,8 @@ static void load_spr_state(struct kvm_vcpu *vcpu)
 	mtspr(SPRN_EBBHR, vcpu->arch.ebbhr);
 	mtspr(SPRN_EBBRR, vcpu->arch.ebbrr);
 	mtspr(SPRN_BESCR, vcpu->arch.bescr);
-	mtspr(SPRN_TIDR, vcpu->arch.tid);
+	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+		mtspr(SPRN_TIDR, vcpu->arch.tid);
 	mtspr(SPRN_AMR, vcpu->arch.amr);
 	mtspr(SPRN_UAMOR, vcpu->arch.uamor);
 
@@ -3806,7 +3807,8 @@ static void store_spr_state(struct kvm_vcpu *vcpu)
 	vcpu->arch.ebbhr = mfspr(SPRN_EBBHR);
 	vcpu->arch.ebbrr = mfspr(SPRN_EBBRR);
 	vcpu->arch.bescr = mfspr(SPRN_BESCR);
-	vcpu->arch.tid = mfspr(SPRN_TIDR);
+	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+		vcpu->arch.tid = mfspr(SPRN_TIDR);
 	vcpu->arch.amr = mfspr(SPRN_AMR);
 	vcpu->arch.uamor = mfspr(SPRN_UAMOR);
 	vcpu->arch.dscr = mfspr(SPRN_DSCR);
@@ -3826,7 +3828,8 @@ struct p9_host_os_sprs {
 static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
 {
 	host_os_sprs->dscr = mfspr(SPRN_DSCR);
-	host_os_sprs->tidr = mfspr(SPRN_TIDR);
+	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+		host_os_sprs->tidr = mfspr(SPRN_TIDR);
 	host_os_sprs->iamr = mfspr(SPRN_IAMR);
 	host_os_sprs->amr = mfspr(SPRN_AMR);
 	host_os_sprs->fscr = mfspr(SPRN_FSCR);
@@ -3840,7 +3843,8 @@ static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
 	mtspr(SPRN_UAMOR, 0);
 
 	mtspr(SPRN_DSCR, host_os_sprs->dscr);
-	mtspr(SPRN_TIDR, host_os_sprs->tidr);
+	if (cpu_has_feature(CPU_FTR_P9_TIDR))
+		mtspr(SPRN_TIDR, host_os_sprs->tidr);
 	mtspr(SPRN_IAMR, host_os_sprs->iamr);
 
 	if (host_os_sprs->amr != vcpu->arch.amr)
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 8b28ff9d98d1..83100c6524cc 100644
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

