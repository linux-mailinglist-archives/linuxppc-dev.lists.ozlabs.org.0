Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5909842138A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:03:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQVJ2P8nz3cWC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:03:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=IpCzKUbo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d;
 helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=IpCzKUbo; dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQS82KJvz2yTq
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:01:12 +1100 (AEDT)
Received: by mail-pf1-x42d.google.com with SMTP id m26so1652946pff.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zf9+rzXTVi8plIkKJnOaRfuWZtrpNKxJ2kRRjgEz1l0=;
 b=IpCzKUboYsufQlqofbjtwHJ26a3gG3Udd35ZcUoXYGIJVrbHWS8NvVD8VY1vS4hVFt
 sYLpF35diFkfXr6amvzmSgtVKgKMP9nNvkVFGgeB7OulGx0Txo7lxIbQbW+YqS2iLy+L
 hnhcUKn9/NDSS1crCYK/xmmsLameS/uGYbpMgJlUyyNvqzfTWV2TqwAEOH/q1sbGuYqk
 l21kz9E1Y4xdQFGtqgrXS/wfPKBLMfe9jtNmOjpR1JtHSurlnL7hzkpsV+xlRE35ciDj
 3eRykrrY7essQHMZbJ4Tnjb9rpywFVpXvl2VcQpK2lFxQbNbvANPCPtao2i8zWeuHHSP
 p+Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zf9+rzXTVi8plIkKJnOaRfuWZtrpNKxJ2kRRjgEz1l0=;
 b=23/m8GV14Ub7ku39FM1O7R4gZib9jtmJ0/blIL7UVrXZss45EgF2+fKTlIQfSW6JXG
 t8nQ/9zW8HmTwZ8lotR0SDRmE1Kda4D3mN4oOL5RsHkfC5vV3FM/7nAAt2is4gxx0Wcr
 IHNgYxmh1aaCwyl95ArGBTyB+V9jtNNS+2N+NH6idZWDW9F8UOn6YUoDKpRrpV0/slSc
 xsCuS4K7SRJQyOVrYnRNVesqdUzbArzBZqOJcqgr0yEWaIrz2IH8qLVln9Qx98OI369D
 65bKZ/VEnL/7kf+KH+5sk+uZTc+4EJYClho5fulOLqNdcmrGkdRXp9XaXTDjBEJZLC7b
 6nPw==
X-Gm-Message-State: AOAM531NCoJl1IKGMW/vQptqtVT2Oze7VkxoOOi7ME2J/gjVgTtoZ8nX
 XZELw7gVALY9VEQIJrTN1vU=
X-Google-Smtp-Source: ABdhPJxkFM4brl+777k2MPuDMiwgYuONWj7Oh1/MWWHD9rxebdH1RhU/PvAkmMgOwL/wyQRhqGgKqg==
X-Received: by 2002:a62:5804:0:b0:44b:b75b:ec8f with SMTP id
 m4-20020a625804000000b0044bb75bec8fmr25399694pfb.63.1633363269208; 
 Mon, 04 Oct 2021 09:01:09 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.01.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:01:08 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 03/52] KMV: PPC: Book3S HV P9: Use set_dec to set
 decrementer to host
Date: Tue,  5 Oct 2021 02:00:00 +1000
Message-Id: <20211004160049.1338837-4-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The host Linux timer code arms the decrementer with the value
'decrementers_next_tb - current_tb' using set_dec(), which stores
val - 1 on Book3S-64, which is not quite the same as what KVM does
to re-arm the host decrementer when exiting the guest.

This shouldn't be a significant change, but it makes the logic match
and avoids this small extra change being brought into the next patch.

Suggested-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index f4a779fffd18..6a07a79f07d8 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4050,7 +4050,7 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vc->entry_exit_map = 0x101;
 	vc->in_guest = 0;
 
-	mtspr(SPRN_DEC, local_paca->kvm_hstate.dec_expires - mftb());
+	set_dec(local_paca->kvm_hstate.dec_expires - mftb());
 	/* We may have raced with new irq work */
 	if (test_irq_work_pending())
 		set_dec(1);
-- 
2.23.0

