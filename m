Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0C3D351601
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:15:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6FV5ZfDz3g9K
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:15:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bi5PsOGv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bi5PsOGv; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB6183Ktxz3cMR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:05:00 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id f29so162610pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ka7Kgc46wNYVciwtrqBRiw3Ky/NlQuIKvsqrbXsH90U=;
 b=bi5PsOGvlpcCcOnrJi+B+I3ZXuDFDBRpvVkJ6G+mCchbMA2y9cWl3nU5KvHSEd0LkP
 i4wi0pqwBi+7LoH9L9goiFRug3OFw0hZMSSmqSr5QlAsI0OZBbJrdBnWz2GRYmLXgbKM
 22fvil8A7gpoeRz6ZKsKv7DNGCNZvKSxMaFsONnXOTh4uUECt5h/wY8gKvlOxLlQZzUL
 gimua5szjO8FgqNEavOe2uRCepHPLwAyBJqNeGqZJjiO/N3/A2aRC1DF3XiRYoz/543t
 pyuLE+2vvb9G/CFzR38vddZ+jq7UE/Xag3i94B3gefEyXtdS0SAHH+nzVLwbVSTegPl+
 nHFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ka7Kgc46wNYVciwtrqBRiw3Ky/NlQuIKvsqrbXsH90U=;
 b=gC6YHmI01frzDazPsgcTVUrxOIFvUCBVPxC9HjPIJskY1kY/KebUjZQO5+TWRoy6bx
 wcKv0lUrTU/TX3FGfxqlG2xwmspJfVjBQJSrrc2OFn45CXmZg+wUCB9g5utHkXVkfQNk
 obbpBOTHNAgeZr3P+MvFnwt046wzL/Yl34cfZOvsSBQYdmYocyaIuUyuOSDmbzKSXfLq
 3eW/kFWrCyDR2OLf6t3MMPx6ErKDQwZnHy2gsSnCaACnpNsXf6hMlBvG43G1IXxumhEz
 4XUqnMF80PKJs6NZwTGNat73IO+1C9iB6xlyhcyTRxP6Lph4fLmvdvN9SaVoaM0Wya1J
 PItg==
X-Gm-Message-State: AOAM531vwMnb7ELL2wHHiWbP0q6CyvBoPEn4MdYP5+HFk04ROVF/vKhb
 SAKVKtlw8PzuINCUh+Vm7R0tw1AhCTI=
X-Google-Smtp-Source: ABdhPJxrwqZxpqC53SQ7FKtTymSCdW6gFAJmUDQ27OqlbsVKzilP1g/WoG+WeK2n7B9/MNwfibmsHQ==
X-Received: by 2002:a63:d143:: with SMTP id c3mr7707131pgj.99.1617289498187;
 Thu, 01 Apr 2021 08:04:58 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:04:57 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 26/48] KVM: PPC: Book3S HV P9: Reduce mftb per guest
 entry/exit
Date: Fri,  2 Apr 2021 01:03:03 +1000
Message-Id: <20210401150325.442125-27-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210401150325.442125-1-npiggin@gmail.com>
References: <20210401150325.442125-1-npiggin@gmail.com>
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
index dc1232d2a198..46f457c3b828 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3551,12 +3551,13 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
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
@@ -3754,7 +3755,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (!(vcpu->arch.ctrl & 1))
 		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
 
-	mtspr(SPRN_DEC, vcpu->arch.dec_expires - mftb());
+	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
 
 	if (kvmhv_on_pseries()) {
 		/*
@@ -3889,7 +3890,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->in_guest = 0;
 
 	next_timer = timer_get_next_tb();
-	mtspr(SPRN_DEC, next_timer - mftb());
+	mtspr(SPRN_DEC, next_timer - tb);
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
 	kvmhv_load_host_pmu();
-- 
2.23.0

