Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B59742138F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:05:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQXf0lbpz3dbx
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:05:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FCziMgI9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FCziMgI9; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQSG4hlxz2ynt
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:01:18 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 rj12-20020a17090b3e8c00b0019f88e44d85so5970308pjb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P62UrD3SpPpaMK7k10CAwEFBjd5vnrhxdqO8ECNd8U0=;
 b=FCziMgI9AaGEovNt/QKLpPFBLgnJjYeeHh/KRLugwuD861QiK50nr058K9Ls+5nXL8
 UDc74nFKDZj3TyN7Uw/4khxZgSYpf9hzyl5DI8pnjlCX09GqR223NcD7CMd8sdwDRYn2
 +JTQw/COgcHOgNRbr4JdWEhgBSQlBl1SrgiEbEF3iPsz1Aa2ZlPmmSe1DnuNRrBct5Hw
 5zXQP40YyvrWnAVvY/An/Htk3lvjbz7omdInkk5LRsjpqtGKffTNEt+NBLKKiUh5QQlF
 Mq0/gl9YnVp83uV6Kw5KFsf42AHwSDZQ+pZGQNTKAHHI81OhFbwkHkWnopV26/Yvpw/K
 cOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P62UrD3SpPpaMK7k10CAwEFBjd5vnrhxdqO8ECNd8U0=;
 b=1OnenjDx42S4+ICDICutfTaGT6fATK4V6sQIAErXtBOXRPv7xrXIqHs0xVkCMyGitK
 IImp42GhNFiRzd9n8Bl1HRkN0SKEaQPjq+sRlwB0NeDOH2739U/w0UJ0HIefxVIkZGX8
 Ky4fmyf5dcBCizCGQR7cu9atUqmv55RiHAC7ivebOaGGZCeqViNovRd2Icn/L6lGPx37
 3dmC+ivz+TbE+FA/A8l6ppO+9t5+xxEryZcfBgs1SkhLWy9JIcZPMnUqbkW7dfO4a/s7
 c1vnsbnGtXmhEggJqs4yDFJIGvty81eULEifmoHZgKuwd7d5qwP+m3gzuwiEa4oTlYat
 NfZQ==
X-Gm-Message-State: AOAM530OrvDVRvZFyMH4BWVuKKxlpLvMl4uqcp63OxZfbJGkCVBy7NQw
 RDXu1D/T7uNx/Z1bpHaSof82NrAqaR4=
X-Google-Smtp-Source: ABdhPJyK1bPWSFe9put/M7hNKFj8s2/NB8n6YBriVYPsFRbJTuQrzXDQSsX+VXK8hzI3gEdXK27xzw==
X-Received: by 2002:a17:90b:1d8f:: with SMTP id
 pf15mr30069847pjb.200.1633363276385; 
 Mon, 04 Oct 2021 09:01:16 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.01.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:01:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 06/52] KVM: PPC: Book3S HV P9: Reduce mftb per guest
 entry/exit
Date: Tue,  5 Oct 2021 02:00:03 +1000
Message-Id: <20211004160049.1338837-7-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mftb is serialising (dispatch next-to-complete) so it is heavy weight
for a mfspr. Avoid reading it multiple times in the entry or exit paths.
A small number of cycles delay to timers is tolerable.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c          | 4 ++--
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 30d400bf161b..e4482bf546ed 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3927,7 +3927,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	 *
 	 * XXX: Another day's problem.
 	 */
-	mtspr(SPRN_DEC, vcpu->arch.dec_expires - mftb());
+	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
 
 	if (kvmhv_on_pseries()) {
 		/*
@@ -4050,7 +4050,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->in_guest = 0;
 
 	next_timer = timer_get_next_tb();
-	set_dec(next_timer - mftb());
+	set_dec(next_timer - tb);
 	/* We may have raced with new irq work */
 	if (test_irq_work_pending())
 		set_dec(1);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 0ff9ddb5e7ca..bd8cf0a65ce8 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -203,7 +203,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	unsigned long host_dawr1;
 	unsigned long host_dawrx1;
 
-	hdec = time_limit - mftb();
+	tb = mftb();
+	hdec = time_limit - tb;
 	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 
@@ -215,7 +216,7 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	vcpu->arch.ceded = 0;
 
 	if (vc->tb_offset) {
-		u64 new_tb = mftb() + vc->tb_offset;
+		u64 new_tb = tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
 		tb = mftb();
 		if ((tb & 0xffffff) < (new_tb & 0xffffff))
-- 
2.23.0

