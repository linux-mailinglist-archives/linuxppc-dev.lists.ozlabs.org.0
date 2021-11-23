Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7897459FFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 11:19:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz0VT5pQ4z3gbS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 21:19:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EcCIE8qE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b;
 helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=EcCIE8qE; dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HyzxZ1rtWz3cXw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:54:10 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id p18so16576907plf.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AdZU0vsaA7eoEc1W7hEx0HHSrDx68parS+Neoj58wvs=;
 b=EcCIE8qEXzPiEJCNTecjv1vzRCqD7XZtWpoPkk6PhyhxrdenmUix5QhcgVA94kOOdu
 iLJYPkYSci9JtdfZb5M+87xe5tLednhVkoJrdHAuJdlz5Z1b+3IcQRSR2Ow5T+BffHZh
 hx5PNyxv7z4rFgDh6NSY28KaJNB0WRf7TPzK1jrPmpDXIhMKsDRmRi6oKT0ek4mv5d6m
 JIBjyjNwhzn8ZzF1bd18BGfE8Qo9rTFR4z9xeJqh1TF2vyON0s6sgW/eHHcsJg6x7H+Z
 qUCl7x0iQVAYYqnx9LKk9srXn0zi+SCXnO9ZQsfJVYcftcxNFIXcFnVp7st15zkF0Nuf
 TJcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AdZU0vsaA7eoEc1W7hEx0HHSrDx68parS+Neoj58wvs=;
 b=oxV4y3+KG3FCipYqIwzzuSh4Jm7tGu5/UW5muMQ4lMEIzT66QHBjnJnMPKJwhGivyh
 SQ8GFqwj0/PIZSDF8Qb7pSCLzO8z5BjWPiXfJlv6h3enC4X8OFfGqVTaml4+t7tNx111
 DhzIPlMckW9miHipa3aQPT7WOWjTNCiIHFZhqAWwKPlkiNIk2XtiJJvcL6DgLYEe3gLX
 tyVtWsSH1T8t1RO4RaDSu85vxc5FIT6teUUNswa9lsBgkD/OxlEJGdqWgJKDnAwZhEA2
 DC50Xnc+bVzPIyrx5oYNWffd/LXrG0I6seonoiPOqUIV4vP80uRtVeH8mbWGBLvt7Uyl
 aB2A==
X-Gm-Message-State: AOAM533CytGv0YrfrqTuU0E/0DNGHP1SCEhXsjwRzhFFXeaJnkpa/8vR
 TzK/qJbA1GG1mwKvtIQaZHwam3w2AmUJAg==
X-Google-Smtp-Source: ABdhPJzIJP+bPoi3IgVMmfgDv9GiXrsCY6KYJmQFqFgryup11XCFJbFlb3E8aJ7GW4m2qt+BpE1+QA==
X-Received: by 2002:a17:902:d505:b0:141:f5f7:848e with SMTP id
 b5-20020a170902d50500b00141f5f7848emr5281606plg.72.1637661248058; 
 Tue, 23 Nov 2021 01:54:08 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:54:07 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 40/53] KVM: PPC: Book3S HV P9: Test dawr_enabled() before
 saving host DAWR SPRs
Date: Tue, 23 Nov 2021 19:52:18 +1000
Message-Id: <20211123095231.1036501-41-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some of the DAWR SPR access is already predicated on dawr_enabled(),
apply this to the remainder of the accesses.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 34 ++++++++++++++++-----------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 323b692bbfe2..0f341011816c 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -666,13 +666,16 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	host_hfscr = mfspr(SPRN_HFSCR);
 	host_ciabr = mfspr(SPRN_CIABR);
-	host_dawr0 = mfspr(SPRN_DAWR0);
-	host_dawrx0 = mfspr(SPRN_DAWRX0);
 	host_psscr = mfspr(SPRN_PSSCR);
 	host_pidr = mfspr(SPRN_PID);
-	if (cpu_has_feature(CPU_FTR_DAWR1)) {
-		host_dawr1 = mfspr(SPRN_DAWR1);
-		host_dawrx1 = mfspr(SPRN_DAWRX1);
+
+	if (dawr_enabled()) {
+		host_dawr0 = mfspr(SPRN_DAWR0);
+		host_dawrx0 = mfspr(SPRN_DAWRX0);
+		if (cpu_has_feature(CPU_FTR_DAWR1)) {
+			host_dawr1 = mfspr(SPRN_DAWR1);
+			host_dawrx1 = mfspr(SPRN_DAWRX1);
+		}
 	}
 
 	local_paca->kvm_hstate.host_purr = mfspr(SPRN_PURR);
@@ -1006,15 +1009,18 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	mtspr(SPRN_HFSCR, host_hfscr);
 	if (vcpu->arch.ciabr != host_ciabr)
 		mtspr(SPRN_CIABR, host_ciabr);
-	if (vcpu->arch.dawr0 != host_dawr0)
-		mtspr(SPRN_DAWR0, host_dawr0);
-	if (vcpu->arch.dawrx0 != host_dawrx0)
-		mtspr(SPRN_DAWRX0, host_dawrx0);
-	if (cpu_has_feature(CPU_FTR_DAWR1)) {
-		if (vcpu->arch.dawr1 != host_dawr1)
-			mtspr(SPRN_DAWR1, host_dawr1);
-		if (vcpu->arch.dawrx1 != host_dawrx1)
-			mtspr(SPRN_DAWRX1, host_dawrx1);
+
+	if (dawr_enabled()) {
+		if (vcpu->arch.dawr0 != host_dawr0)
+			mtspr(SPRN_DAWR0, host_dawr0);
+		if (vcpu->arch.dawrx0 != host_dawrx0)
+			mtspr(SPRN_DAWRX0, host_dawrx0);
+		if (cpu_has_feature(CPU_FTR_DAWR1)) {
+			if (vcpu->arch.dawr1 != host_dawr1)
+				mtspr(SPRN_DAWR1, host_dawr1);
+			if (vcpu->arch.dawrx1 != host_dawrx1)
+				mtspr(SPRN_DAWRX1, host_dawrx1);
+		}
 	}
 
 	if (vc->dpdes)
-- 
2.23.0

