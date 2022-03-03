Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEDA4CB676
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 06:35:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8KSZ3xHcz3c20
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 16:35:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=q0fLnkaJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036;
 helo=mail-pj1-x1036.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=q0fLnkaJ; dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8KQc1NBjz3bNs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Mar 2022 16:33:27 +1100 (AEDT)
Received: by mail-pj1-x1036.google.com with SMTP id m22so3778024pja.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Mar 2022 21:33:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=99wjFivJowPi1af36l9hN0HkNWL4HRXYrvhwt+iU+v0=;
 b=q0fLnkaJresUdBHchJoruArWL703DPkN54zw6e/frbSghM5MHxky+6hk6cnkdwNvFs
 i66A54BIL1oS9L8bpbD3uL4vyf6FfXs0Am/jmJbqPzYjkRvYs7x9qBuyuCAZA0j5LRJn
 xk/5+oCTtyf6v66WV+dW5S1wK65QY7k/ep/L1U/u2ruyJ91YdQMdojg9aaZ326vTYHzV
 1tD5QmJWQxzw9AEkgI+HmNmMUAaAd8FNAOXoz53geMAAPVcHKAz0arJ4mUOMqmlago+Z
 KPcko7mDQnB5s9pi80iz05cyUD+L0mReWFen0Mss2f4itY1XxOapEeUdbHaVFICLp+8z
 H6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=99wjFivJowPi1af36l9hN0HkNWL4HRXYrvhwt+iU+v0=;
 b=Cine8qvsJHxtlqzg+/sfsUQplZkLjPIDcBwB5o841STOGdUmotQ8R3CmZS7JHUSe0r
 2loe0qj8ccIhl66jLQb1dNEgup+j8pz2iSVs0Ah/RlVOLUVXqVykp0JooCMrKhiXRqWr
 fDICjH4C98QBJmEO83Ktuq3DwcSm0A8jJ0tpZf1uvbfA9sH9ADI2PwdB5rtnqYVJ+DHQ
 do0+jGDLkK0LX1ka3POh7jlC4RwmcoAWOXh8gWCxzJwbi1RUymzky+vyYib3ZvKNZH3J
 roRj7iXy++tUdL+5F1IZmX6vkkMqgw60R8Zyb+/s2Ro5mpkQUBLZMWAb2GP/BhHu0UT0
 6fqg==
X-Gm-Message-State: AOAM533YKi7zuRE3OvlXamZsxM9Q3hnSrEqublWBlHJ0sPWHObT4XWHn
 LlvI/eD1k83U5y2DgJiXsv6I4bH+5B5pLA==
X-Google-Smtp-Source: ABdhPJxBMQphYw/Pe6YGhdkwdzb/NeoNp70isx98EpIZ0z8oB8UG254F1G8F7YauHOxF04GQvnpPmA==
X-Received: by 2002:a17:902:ec8a:b0:151:43f8:f114 with SMTP id
 x10-20020a170902ec8a00b0015143f8f114mr26754439plg.96.1646285606695; 
 Wed, 02 Mar 2022 21:33:26 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-90-129.tpgi.com.au.
 [193.116.90.129]) by smtp.gmail.com with ESMTPSA id
 t7-20020a17090a024700b001bf12386db4sm170300pje.47.2022.03.02.21.33.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 21:33:26 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/6] KVM: PPC: Book3S HV P9: Inject pending xive interrupts at
 guest entry
Date: Thu,  3 Mar 2022 15:33:11 +1000
Message-Id: <20220303053315.1056880-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20220303053315.1056880-1-npiggin@gmail.com>
References: <20220303053315.1056880-1-npiggin@gmail.com>
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If there is a pending xive interrupt, inject it at guest entry (if
MSR[EE] is enabled) rather than take another interrupt when the guest
is entered. If xive is enabled then LPCR[LPES] is set so this behaviour
should be expected.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index f8c0f1f52a1e..5df359053147 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -4524,9 +4524,14 @@ int kvmhv_run_single_vcpu(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	if (!nested) {
 		kvmppc_core_prepare_to_enter(vcpu);
-		if (test_bit(BOOK3S_IRQPRIO_EXTERNAL,
-			     &vcpu->arch.pending_exceptions))
+		if (vcpu->arch.shregs.msr & MSR_EE) {
+			if (xive_interrupt_pending(vcpu))
+				kvmppc_inject_interrupt_hv(vcpu,
+						BOOK3S_INTERRUPT_EXTERNAL, 0);
+		} else if (test_bit(BOOK3S_IRQPRIO_EXTERNAL,
+			     &vcpu->arch.pending_exceptions)) {
 			lpcr |= LPCR_MER;
+		}
 	} else if (vcpu->arch.pending_exceptions ||
 		   vcpu->arch.doorbell_request ||
 		   xive_interrupt_pending(vcpu)) {
-- 
2.23.0

