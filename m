Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 89AA2353AD7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:32:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCnS4Gzzz3bsG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:32:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=XqqXjBva;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433;
 helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=XqqXjBva; dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCYG1RKNz3bwZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:21:38 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id a12so7199816pfc.7
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f+RLgCMRv6O15PdiYr5GNGDONEdfPWC0BUYjL4OnyJc=;
 b=XqqXjBvasFw+mvDlcQ/12Ge0gaQq5Ipff7tNUFiI3mRhX47BqpZrogoLW4VASjLw3j
 tL3M9YM3GURnZw2ivDP3VxuN0HOsRwtSQcY0APA+mrh2Jv292Afv0Y5Xgfz3//5zOlKo
 AYBcAeIzBKO2s8x3cqimf8adjZBB5tB0Zo+Dko78tC0g/wPhgmTfuCQJcmT6NzdnM0Q2
 nSQHn/ZKxKNawFQ4OLk0D5X9CZ63MKrAs+aTIz+x82dufca/xjOo+vBWkkqD9GKktmsj
 0pmi2e8IeXlB7vXQ+FUr/ng6M9whqx3GjWpvgRu3cYYSiR3xGyhd5HuQXzLh+3CeveT+
 1fBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f+RLgCMRv6O15PdiYr5GNGDONEdfPWC0BUYjL4OnyJc=;
 b=moUGGAmcx3o5dL5rBFakV5kn6AraL78TJPL0YQMVgFPkX0sCg1Mty9/cbvsHg/whcO
 7gaDvNcJ4E+FHFLxJRa0OLtsnvSFHUSuH5hLzM4nzrrjuZVt8x1W2GlMRuWDmBrYdNZ1
 Mwd3yai7zkRAq89VTj/iNwVCI4DLYMSPeQk0lY04bCn6f1RzA4YFYrxUvKfuqJ/thj+W
 eVbd5K9c5YXJ96H7ybkcmZYK5uOqLAyU6sSCwXrrFSPLmg6IheIYNz+i71QzkYV6mGcP
 dpHQMensksfqgq/w+ImKxG2MgTpNTefG/yof9P9o9OmwYVuTSnzW3cBTHQpXIXSpkqco
 dfsA==
X-Gm-Message-State: AOAM533de40rW/vvWe7yFEO6GlgIT9DaiimAf1+ZRASF45bWbuhKaTlu
 4b20JjifHZdv2e3+KG8V9J4=
X-Google-Smtp-Source: ABdhPJxhaCnIkBD0fPONlRhruTAvtVBHOrnpyr67ZOIEYp3UTwNJ2MhnxAyUI+9q04Ln6f7WDgKoyQ==
X-Received: by 2002:a65:41c6:: with SMTP id b6mr20794644pgq.7.1617585695980;
 Sun, 04 Apr 2021 18:21:35 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.21.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:21:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 27/48] KVM: PPC: Book3S HV P9: Reduce irq_work vs guest
 decrementer races
Date: Mon,  5 Apr 2021 11:19:27 +1000
Message-Id: <20210405011948.675354-28-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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

irq_work's use of the DEC SPR is racy with guest<->host switch and guest
entry which flips the DEC interrupt to guest, which could lose a host
work interrupt.

This patch closes one race, and attempts to comment another class of
races.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index f4e5a64457e6..dae59f05ef50 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3761,6 +3761,18 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	if (!(vcpu->arch.ctrl & 1))
 		mtspr(SPRN_CTRLT, mfspr(SPRN_CTRLF) & ~1);
 
+	/*
+	 * When setting DEC, we must always deal with irq_work_raise via NMI vs
+	 * setting DEC. The problem occurs right as we switch into guest mode
+	 * if a NMI hits and sets pending work and sets DEC, then that will
+	 * apply to the guest and not bring us back to the host.
+	 *
+	 * irq_work_raise could check a flag (or possibly LPCR[HDICE] for
+	 * example) and set HDEC to 1? That wouldn't solve the nested hv
+	 * case which needs to abort the hcall or zero the time limit.
+	 *
+	 * XXX: Another day's problem.
+	 */
 	mtspr(SPRN_DEC, vcpu->arch.dec_expires - tb);
 
 	if (kvmhv_on_pseries()) {
@@ -3897,6 +3909,9 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	next_timer = timer_get_next_tb();
 	mtspr(SPRN_DEC, next_timer - tb);
+	/* We may have raced with new irq work */
+	if (test_irq_work_pending())
+		set_dec(1);
 	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
 
 	kvmhv_load_host_pmu();
-- 
2.23.0

