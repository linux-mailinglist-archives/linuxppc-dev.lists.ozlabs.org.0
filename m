Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF89735B844
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 03:49:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJWr248rBz3bxR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 11:49:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jXw/0pSP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jXw/0pSP; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJWqd35LNz3004
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 11:48:59 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id l123so8164749pfl.8
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 18:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aLyKsyw9sIoArVGBtYw5cRtydAgVXgDSKIe0OwzaCV4=;
 b=jXw/0pSPTFSGWIdK+HT4jurvmUaZzcuX7h66cpcjF3Sjg5rO7ma6aElWYfxb6fA2EK
 xHRHvjFCi8716ayxrFTXzww59CY1hpcGiLrRG4WMUxzupX81p1L0ZZega/toc1mEa8t/
 AAjBj1TbZTOAgWui7684KS5z4NXThpRjzCkHj24xtPH4oApe9+wbgkT5VKPCy0Eiad30
 LU5nn8u96bG/YPJo53hTmZW7lbuglZ+r6ak2avNU6CAWhKLpvJ6AJ2EZkY6p5whrUuy5
 02Tu4rSZjlMEZOLgB3vUrTJEfpuLtBOt2Ce32+Pmc0S9LwB3LSlRWMauQNLHnFxRS5RU
 SMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aLyKsyw9sIoArVGBtYw5cRtydAgVXgDSKIe0OwzaCV4=;
 b=Y478ABUYH0aqdlrYy0SUQuGPz2mWh7Nz81On1dzVAuInJk99tsA2ylUph2aKlRZ91F
 C50YzwXUTVkTKKma1jsiIE71MCybSkv/Qfw0cTM2oz/DNeJLSUP/W5gaY7m2gSpVLEeI
 JWrQTHYesSmpM1mZEEPXovwOuthwgvlpsJWduWZ+y3htwhDOoi+kENCaEmkrsm7nndxg
 ld0APbtRTnnWCT1XysYARQGkVRcI1pMocye64GZfXcJYGNc+Y7MjihbMmiyMtkp5QCyt
 ezXUck6WalRBOBBqM4cET0T7JU7/TBwMZsN2crLhkxSsdZ6xbKqhgAvIc4KVG2YbfmKT
 x+cg==
X-Gm-Message-State: AOAM530Kz8C68DGKSnqEsadH+N6tidZBNB+LK6oc/nFbGkowGbiWjliQ
 eliiY3HduBuAPpEv5S4DvukAra/tqHA=
X-Google-Smtp-Source: ABdhPJwVVgyG2pNezNnGPNdHbgDY56uIPCUnZowGZA2eA7iggYrIDec+aRlb9vDLZxXwYU/wXMudRg==
X-Received: by 2002:a62:5cc7:0:b029:24b:3525:9dbd with SMTP id
 q190-20020a625cc70000b029024b35259dbdmr5561696pfb.3.1618192136638; 
 Sun, 11 Apr 2021 18:48:56 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id m9sm9502345pgt.65.2021.04.11.18.48.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Apr 2021 18:48:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v1 01/12] KVM: PPC: Book3S HV P9: Restore host CTRL SPR after
 guest exit
Date: Mon, 12 Apr 2021 11:48:34 +1000
Message-Id: <20210412014845.1517916-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210412014845.1517916-1-npiggin@gmail.com>
References: <20210412014845.1517916-1-npiggin@gmail.com>
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

The host CTRL (runlatch) value is not restored after guest exit. The
host CTRL should always be 1 except in CPU idle code, so this can result
in the host running with runlatch clear, and potentially switching to
a different vCPU which then runs with runlatch clear as well.

This has little effect on P9 machines, CTRL is only responsible for some
PMU counter logic in the host and so other than corner cases of software
relying on that, or explicitly reading the runlatch value (Linux does
not appear to be affected but it's possible non-Linux guests could be),
there should be no execution correctness problem, though it could be
used as a covert channel between guests.

There may be microcontrollers, firmware or monitoring tools that sample
the runlatch value out-of-band, however since the register is writable
by guests, these values would (should) not be relied upon for correct
operation of the host, so suboptimal performance or incorrect reporting
should be the worst problem.

Fixes: 95a6432ce9038 ("KVM: PPC: Book3S HV: Streamlined guest entry/exit path on P9 for radix guests")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index 13bad6bf4c95..208a053c9adf 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3728,7 +3728,10 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 	vcpu->arch.dec_expires = dec + tb;
 	vcpu->cpu = -1;
 	vcpu->arch.thread_cpu = -1;
+	/* Save guest CTRL register, set runlatch to 1 */
 	vcpu->arch.ctrl = mfspr(SPRN_CTRLF);
+	if (!(vcpu->arch.ctrl & 1))
+		mtspr(SPRN_CTRLT, vcpu->arch.ctrl | 1);
 
 	vcpu->arch.iamr = mfspr(SPRN_IAMR);
 	vcpu->arch.pspb = mfspr(SPRN_PSPB);
-- 
2.23.0

