Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A371459F9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 10:56:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hz00P3fTnz3cZk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Nov 2021 20:56:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l2zw/C4F;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=l2zw/C4F; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hyzw84zYnz2ymP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 20:52:56 +1100 (AEDT)
Received: by mail-pl1-x62c.google.com with SMTP id b13so16633478plg.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Nov 2021 01:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8PMwwqEDOPR27ECCIKy4w92qtS2Ye0TbAvTvCAlNKOk=;
 b=l2zw/C4FKchvnn7Jg3HA2tAIBxgMQ0vYS3lD76ZIDbDl0QB9Vf0A1kxP1z4ReJBh9Y
 ApO51THBpDa0x48eS4S5FU2suJwATJCHq1plfn7lpRumtnnpfpv6wC9p1v8bYyiy4Y/r
 bcWbUwHwnmFZ/zCzSC8dlPE9itO6l+yRiH0fApY2n68jevQzIjYJU/A58hL+9bdaacu0
 SA5FCXeRKKL9qc/9l6FOODBzCy8yk8R9OPipJYpH2+tLtZ8SA3QbOIerkQxhP4FYvwHE
 czky7QhkxBFlJgA/rbJYXBJjLL7qoveg6DGMdRx10oCiC0tZnE5lWisALf9dMztPD9PB
 U/nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8PMwwqEDOPR27ECCIKy4w92qtS2Ye0TbAvTvCAlNKOk=;
 b=CyjxmRamJVchJnbsTCeSN5I8U74fDE9UrForxALAvWhDrlb0SCdOjvdJqCXVjePQR7
 PpoKyVTos/RQTWL/df66MhBO2Ki/kCQq5LckEVPLbNPBbs1DlyBi85qEyV2ZSOS+I+jO
 lcgOpenq5A2Xr4yN/Kl1xlHwbsUId8R1+vVfv08/PgcSJHtrXdzQT/Z50OVhpdfesR+Y
 ZdbzZ3KLfRJZvrSRHWTkVRFuuckfKE0PmBrwEN+FFvcxGkK5bEoFFQWBxZz2+BCVLGpw
 2Qxeb2ZBWDYp8Leb1WPrNXHNGvsdOoR0TcIXfnXoB0JMD42BzMjNqXVIgtWXMD3eBu0p
 jtRg==
X-Gm-Message-State: AOAM531AmN3xhw/spto1nHxP12pJvuU+NgcrwBbZqk4uO3ZTUOxbRGoJ
 OxQChqGRyuCRKoJEDyyHKXlOHtzBGGROPA==
X-Google-Smtp-Source: ABdhPJxojIIbolujvrQLFERQ+SLN1dlbihqrTu0kq3trVD0c1amDpmJYWsv4N2y/OOujuR+OJ31iXA==
X-Received: by 2002:a17:902:d505:b0:141:f5f7:848e with SMTP id
 b5-20020a170902d50500b00141f5f7848emr5273632plg.72.1637661175039; 
 Tue, 23 Nov 2021 01:52:55 -0800 (PST)
Received: from bobo.ibm.com ([124.170.11.53])
 by smtp.gmail.com with ESMTPSA id j8sm12662176pfc.8.2021.11.23.01.52.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 01:52:54 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 06/53] KVM: PPC: Book3S HV P9: Reduce mftb per guest
 entry/exit
Date: Tue, 23 Nov 2021 19:51:44 +1000
Message-Id: <20211123095231.1036501-7-npiggin@gmail.com>
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
index 3322edbafc64..5fc0c168a39a 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3940,7 +3940,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	 *
 	 * XXX: Another day's problem.
 	 */
-	mtspr(SPRN_DEC, vcpu->arch.dec_expires - mftb());
+	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
 
 	if (kvmhv_on_pseries()) {
 		/*
@@ -4063,7 +4063,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
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

