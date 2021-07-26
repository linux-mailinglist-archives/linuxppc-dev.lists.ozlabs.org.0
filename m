Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 207793D521B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 06:02:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GY5qZ0pmZz3gCL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Jul 2021 14:02:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=lnOzFb4Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lnOzFb4Y; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GY5Zt4dcHz3clb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Jul 2021 13:51:50 +1000 (AEST)
Received: by mail-pj1-x102d.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so12395145pjh.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Jul 2021 20:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=InnIngdCZKWqNjgAIB+VqHmGiblNFRvsyL7J2HN5wII=;
 b=lnOzFb4YJpYCfhT+K1PMdbx9Nfbf1/IjFRcap6NDJB/eSyMcf0i9r2cFi7yHEcf9Lk
 XUY9jpj3hk4Dh/bNFCvTMaogclMUopmicvdC6yu62jiws/hQnsFhprXg4BZQZzoi+2on
 oZskw7fOeWlxdEz1xWDwcMIDwJ64ZoWQnkYZDlDeFDtKT2pQVsi1LxJ9hhjahnwaBd4/
 /8e2geN76hB7FTYGmPL0+tq2sYYWrxoQtMxIwMWSSQir57FBQYmvpgYdsEGnorqtoXGt
 +glVlDmKb9rJ9sTcRsf9gdEKssTnxtBo3lq6LCDbRqtm7Ffews80srcjUB1ey3Ym9+HH
 yuWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=InnIngdCZKWqNjgAIB+VqHmGiblNFRvsyL7J2HN5wII=;
 b=HvzAoR0QVV0XV4wEOaFDCgTFHzfJruDefVgfU/Gj8/sXQp5sPopnCCUp5BD3MI+/8i
 zsh5zM3u4o3avpP5V+CrK938kssAyQqVdNPN+w/idVypfhl7J1DWILc4UrXR+a4NoU7R
 lOpA73n5VM+cti31gLU8kNsU/JErZiG9sF3spOapW3QAZRhi1IsknCFqi9q2fphiVxEO
 P6KDdwKkogykT3eU8T/+crWvtArTlJMupweSteiGY1tb6Iq4Eqhh5HXv1Fj8OplAMD1t
 xM/j14yFeirw5QSWjoTeHLHtZ0P15/tHqeKDoXqDq6nD246EUDh5Hw9gD7Y1/Let6tNQ
 s8Iw==
X-Gm-Message-State: AOAM531Knz4Qd4YxyrnoOY78z9mepjwi0Nj9n4oCsjrjQnml3Ze6oEH1
 MRDdeeVCJaP+u82eIHPcvs9lngiRUgo=
X-Google-Smtp-Source: ABdhPJzs+7y0r81P3TH9r8iY5j4AV0YnhCSDQP1XzTu7Q2upvYgtQi2kw3DNSbHWVaLRRPEqPIwk+Q==
X-Received: by 2002:a65:63d0:: with SMTP id n16mr6256947pgv.432.1627271508565; 
 Sun, 25 Jul 2021 20:51:48 -0700 (PDT)
Received: from bobo.ibm.com (220-244-190-123.tpgi.com.au. [220.244.190.123])
 by smtp.gmail.com with ESMTPSA id p33sm41140341pfw.40.2021.07.25.20.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jul 2021 20:51:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 27/55] KVM: PPC: Book3S HV P9: Move TB updates
Date: Mon, 26 Jul 2021 13:50:08 +1000
Message-Id: <20210726035036.739609-28-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210726035036.739609-1-npiggin@gmail.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Move the TB updates between saving and loading guest and host SPRs,
to improve scheduling by keeping issue-NTC operations together as
much as possible.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 36 +++++++++++++--------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 814b0dfd590f..e7793bb806eb 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -215,15 +215,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	vcpu->arch.ceded = 0;
 
-	if (vc->tb_offset) {
-		u64 new_tb = tb + vc->tb_offset;
-		mtspr(SPRN_TBU40, new_tb);
-		tb = mftb();
-		if ((tb & 0xffffff) < (new_tb & 0xffffff))
-			mtspr(SPRN_TBU40, new_tb + 0x1000000);
-		vc->tb_offset_applied = vc->tb_offset;
-	}
-
 	/* Could avoid mfmsr by passing around, but probably no big deal */
 	msr = mfmsr();
 
@@ -238,6 +229,15 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		host_dawrx1 = mfspr(SPRN_DAWRX1);
 	}
 
+	if (vc->tb_offset) {
+		u64 new_tb = tb + vc->tb_offset;
+		mtspr(SPRN_TBU40, new_tb);
+		tb = mftb();
+		if ((tb & 0xffffff) < (new_tb & 0xffffff))
+			mtspr(SPRN_TBU40, new_tb + 0x1000000);
+		vc->tb_offset_applied = vc->tb_offset;
+	}
+
 	if (vc->pcr)
 		mtspr(SPRN_PCR, vc->pcr | PCR_MASK);
 	mtspr(SPRN_DPDES, vc->dpdes);
@@ -469,6 +469,15 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	tb = mftb();
 	vcpu->arch.dec_expires = dec + tb;
 
+	if (vc->tb_offset_applied) {
+		u64 new_tb = tb - vc->tb_offset_applied;
+		mtspr(SPRN_TBU40, new_tb);
+		tb = mftb();
+		if ((tb & 0xffffff) < (new_tb & 0xffffff))
+			mtspr(SPRN_TBU40, new_tb + 0x1000000);
+		vc->tb_offset_applied = 0;
+	}
+
 	/* Preserve PSSCR[FAKE_SUSPEND] until we've called kvmppc_save_tm_hv */
 	mtspr(SPRN_PSSCR, host_psscr |
 	      (local_paca->kvm_hstate.fake_suspend << PSSCR_FAKE_SUSPEND_LG));
@@ -503,15 +512,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	if (vc->pcr)
 		mtspr(SPRN_PCR, PCR_MASK);
 
-	if (vc->tb_offset_applied) {
-		u64 new_tb = mftb() - vc->tb_offset_applied;
-		mtspr(SPRN_TBU40, new_tb);
-		tb = mftb();
-		if ((tb & 0xffffff) < (new_tb & 0xffffff))
-			mtspr(SPRN_TBU40, new_tb + 0x1000000);
-		vc->tb_offset_applied = 0;
-	}
-
 	/* HDEC must be at least as large as DEC, so decrementer_max fits */
 	mtspr(SPRN_HDEC, decrementer_max);
 
-- 
2.23.0

