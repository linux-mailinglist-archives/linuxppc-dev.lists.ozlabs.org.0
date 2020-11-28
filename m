Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4D92C6F3D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 08:14:12 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CjjR467hjzF0dl
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Nov 2020 18:14:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GDqZAGll; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CjjHn2cBhzDsTL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Nov 2020 18:07:49 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id w202so6355983pff.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Nov 2020 23:07:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3UQ8a27frPjoA0hjZKr4P15dWLXH20x5zsQ+TlAD34E=;
 b=GDqZAGllhEk6/on6Ry3JIEm3bjK7GdmrjpnX9ekU0+dey4oI4jAtm9RPERfC7hRWFi
 hrDlBY3ygt5hNpCfh+Z+tNyEP4toki60uKrjt0csJJ9El/qFftRqgrrwLYmEVa+RA79l
 fg54s0jpjZjPNzCgX6XFlzot8MJ/8ddE/m6391an5+6eZ2A+zzbikyQj/LWz7f86FjOP
 0+R0MwfjVXR0tFjh0Es8QoE4P3x/hRG3k/1Dt+OzGDA5NmwOTVBw/xYNqppKu9o1ffS9
 37Vr5boOhl7KfwBYnLj/sq51O/PYi/I/7ofZms+l2iPbiMHlezo5EYz6yj26mk22r2NI
 ER1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3UQ8a27frPjoA0hjZKr4P15dWLXH20x5zsQ+TlAD34E=;
 b=FGtG5Qk8mdOeLMvJYp45E+CuNC6r2pOw2vR+TYVCaebdWFt3Bv5ZEjhIV71BK6COe0
 0d1rYLgjyQq5WF3VotRE3b4HFZgtTZN9rxcQLjjxUWciIptQbBS2RqycYNymgPqX5x47
 GMvF9GDo0lS0qVWipw5EfxnwETI3nooNAHIRXXUuHIVLCR2MfQ9UFVgHBd7tMXSRfG+0
 66eMOC50FmpFQaMNg9qEkHKAcCAHWyseKPNK2/bB7kbZSATb8iDprNr4UZ+UESQvtbuJ
 bagrhGHLJ6dVmLJ5qp53XMHukDWnR+wSL8KZhUUlN5RH0PSgA4L24ydmzVDWOWHafJgz
 e9Gg==
X-Gm-Message-State: AOAM530GafvWb67pb6MYpACwv0nZMA/FKegl0hhZZJwVbQMzgW0zFQzH
 4pnOU2+XtuP1mmML5H+66oUeoXEQL50=
X-Google-Smtp-Source: ABdhPJz7b8QyWG+ch6F7y8M0CFx/Tw7twwhrbhnNsuDTRpQeC5YZ5PYkkPTt/SdnoNIZQVrOh2okXg==
X-Received: by 2002:a63:902:: with SMTP id 2mr9111381pgj.192.1606547265664;
 Fri, 27 Nov 2020 23:07:45 -0800 (PST)
Received: from bobo.ibm.com (193-116-103-132.tpgi.com.au. [193.116.103.132])
 by smtp.gmail.com with ESMTPSA id e31sm9087329pgb.16.2020.11.27.23.07.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 23:07:45 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/8] KVM: PPC: Book3S HV: Don't attempt to recover machine
 checks for FWNMI enabled guests
Date: Sat, 28 Nov 2020 17:07:23 +1000
Message-Id: <20201128070728.825934-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20201128070728.825934-1-npiggin@gmail.com>
References: <20201128070728.825934-1-npiggin@gmail.com>
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
Cc: kvm-ppc@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Guests that can deal with machine checks would actually prefer the
hypervisor not to try recover for them. For example if SLB multi-hits
are recovered by the hypervisor by clearing the SLB then the guest
will not be able to log the contents and debug its programming error.

If guests don't register for FWNMI, they may not be so capable and so
the hypervisor will continue to recover for those.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_ras.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_ras.c b/arch/powerpc/kvm/book3s_hv_ras.c
index 6028628ea3ac..d4bca93b79f6 100644
--- a/arch/powerpc/kvm/book3s_hv_ras.c
+++ b/arch/powerpc/kvm/book3s_hv_ras.c
@@ -65,10 +65,9 @@ static void reload_slb(struct kvm_vcpu *vcpu)
  * On POWER7, see if we can handle a machine check that occurred inside
  * the guest in real mode, without switching to the host partition.
  */
-static void kvmppc_realmode_mc_power7(struct kvm_vcpu *vcpu)
+static long kvmppc_realmode_mc_power7(struct kvm_vcpu *vcpu)
 {
 	unsigned long srr1 = vcpu->arch.shregs.msr;
-	struct machine_check_event mce_evt;
 	long handled = 1;
 
 	if (srr1 & SRR1_MC_LDSTERR) {
@@ -106,6 +105,21 @@ static void kvmppc_realmode_mc_power7(struct kvm_vcpu *vcpu)
 		handled = 0;
 	}
 
+	return handled;
+}
+
+void kvmppc_realmode_machine_check(struct kvm_vcpu *vcpu)
+{
+	struct machine_check_event mce_evt;
+	long handled;
+
+	if (vcpu->kvm->arch.fwnmi_enabled) {
+		/* FWNMI guests handle their own recovery */
+		handled = 0;
+	} else {
+		handled = kvmppc_realmode_mc_power7(vcpu);
+	}
+
 	/*
 	 * Now get the event and stash it in the vcpu struct so it can
 	 * be handled by the primary thread in virtual mode.  We can't
@@ -122,11 +136,6 @@ static void kvmppc_realmode_mc_power7(struct kvm_vcpu *vcpu)
 	vcpu->arch.mce_evt = mce_evt;
 }
 
-void kvmppc_realmode_machine_check(struct kvm_vcpu *vcpu)
-{
-	kvmppc_realmode_mc_power7(vcpu);
-}
-
 /* Check if dynamic split is in force and return subcore size accordingly. */
 static inline int kvmppc_cur_subcore_size(void)
 {
-- 
2.23.0

