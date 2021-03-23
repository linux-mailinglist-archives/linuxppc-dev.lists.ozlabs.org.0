Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E0E3454C0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:15:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4D1Z4sRZz30Cb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 12:14:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=I89KPln9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=I89KPln9; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4Cnf32sSz3bxl
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 12:04:37 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so364787pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 18:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aS79WqcCihfONt9Rv6M8EC39yeudySssdM2xa8KPEFw=;
 b=I89KPln9q/1DT1IRXUIa+aSNrejoOM8vyZGox4SbR0cXapKasygle64lqtWZE5Ejmh
 OabwJcTUxvBPj1pklCMvsKxCMwdC+x2AfDPwBiotSk6AYL1xlCuV86rYVBAguS1dmhx0
 aaoL9iVsox4SLxJhDqc9oHYTcC1MzS3V7t/tkmkSjiMYtUNsN74n4LpMnToLRyTsjhUG
 LAhE/w1BytArOeTh8hlOwrDxnGsKTYbpCF7Gqc7ujt56UFfMkBGSbdMKtvFdObNfJ4Vi
 8mhhj1+GJcBw5ijVmwJrP5kB6vu0qTGZTYz9uYJor3esIKQZFfhRQqvvX/eJgrQUyXb7
 OeSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aS79WqcCihfONt9Rv6M8EC39yeudySssdM2xa8KPEFw=;
 b=Q768sLAd0q+qhJGt0uHMzA6gouodZrDmQUvcJzdYi6m/laotplNiFUDw/6wbPP6zKo
 /E8CV+sg17Av97Ul848E40rzO3HX4IRH4kAJJcpdSD/t7inXtLSqASF2ucQqZiKeCGvO
 oyhR1w+7lELA9QtsCa8I8rR83Ow+NtRnK6EdaOkewy9d2UU4HhZ+97Gmbiww4aIQHrFq
 dA4N0gTKykIZdRSlR5sMNiQ/REFZv2YwqY4gushGP/mf4uQcoejqTxgQcsgJfi2fjCmp
 8mbnT38Bysvl1IZvTAtzwAhlBRGVNtdeOvuUqiVzdpD+xCMMWWoCA5yrCniSrFt/b+/f
 jinw==
X-Gm-Message-State: AOAM532gnoLIPAjYX9ucBVK814YVGbdllbLWcc5L1PWkKM3uQAtzzKyH
 YjjxlO6c6TuLBiI+/Qwz+us=
X-Google-Smtp-Source: ABdhPJzfFNIuxjTs/RynVEa0UYHIxWTj3OjTJO6BziTB2XjQzZUErW7lb+7sWaIh3Gy/rT8vAVURmA==
X-Received: by 2002:a17:90b:344c:: with SMTP id
 lj12mr1814326pjb.208.1616461476066; 
 Mon, 22 Mar 2021 18:04:36 -0700 (PDT)
Received: from bobo.ibm.com ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id e7sm14491894pfc.88.2021.03.22.18.04.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 18:04:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 26/46] KVM: PPC: Book3S HV P9: Reduce mftb per guest
 entry/exit
Date: Tue, 23 Mar 2021 11:02:45 +1000
Message-Id: <20210323010305.1045293-27-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210323010305.1045293-1-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

mftb is serialising (dispatch next-to-complete) so it is heavy weight
for a mfspr. Avoid reading it multiple times in the entry or exit paths.
A small number of cycles delay to timers is tolerable.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index db807eebb3bd..1f38a0abc611 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3540,12 +3540,13 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		host_dawrx1 = mfspr(SPRN_DAWRX1);
 	}
 
-	hdec = time_limit - mftb();
+	tb = mftb();
+	hdec = time_limit - tb;
 	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 
 	if (vc->tb_offset) {
-		u64 new_tb = mftb() + vc->tb_offset;
+		u64 new_tb = tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
 		tb = mftb();
 		if ((tb & 0xffffff) < (new_tb & 0xffffff))
@@ -3744,7 +3745,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (!(vcpu->arch.ctrl & 1))
 		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
 
-	mtspr(SPRN_DEC, vcpu->arch.dec_expires - mftb());
+	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
 
 	if (kvmhv_on_pseries()) {
 		/*
@@ -3878,7 +3879,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - mftb());
+	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - tb);
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
 	kvmhv_load_host_pmu();
-- 
2.23.0

