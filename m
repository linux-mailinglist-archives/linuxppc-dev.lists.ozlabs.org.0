Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1C84C521
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 03:55:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TlJ618plzDqsN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2019 11:55:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="qgNZHp/l"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Tl7F0VwSzDqrZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jun 2019 11:47:20 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id 196so663559pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 18:47:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=mCIC2aboa3+r+s8FwQIzqoLVu7DilRd8Ln+aL0vqvn0=;
 b=qgNZHp/lhGNyohg7ZT58DH0wNF+D5EwcPHyalSMFyf7j727/HvDLykynP9BGEC4SrY
 EpU0MQeYT+JACzcMGkUhTJy59RpMLJYV/yB7RNZOdsPwZt+4h+zu9FeKxueyzEqT0+vw
 0y3n3wuaIyhCNKoh96673+B3zjlZ0p9X3wnDz/kQqRDEYmXSSgrwuZiNWrf+LLZHQyid
 WDk5CSTtan+AxUk9jibW3Qc3PfO7Ye5VRERY5TCU7vjvC7z1iXEqTOcL3VC/Z6qM5eSk
 xtn+nk4bKeFz3qLmIasf1XG0ffivOI7sFYzhWBmrrXl++VREgpZHFUSSbUrWIlWnA0hB
 LgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=mCIC2aboa3+r+s8FwQIzqoLVu7DilRd8Ln+aL0vqvn0=;
 b=OVYDdUV+0ODJTPo7V+m7rc54uS9rXn7bZSCIEB1ffRIRJDa4CJ1w0r/bGbN0l0pw9N
 GGQY8m95yt9ZFc15uzf4s9wUOsg9WloUxJm6mVh/PBiEUwAxS8/5n6qI11aupwreton3
 gQPOKN2Yx1wVmQhEt9sZz+xWGQK8DicXcGsGQCPmSPbtVZNVVg6siHx6IHko3VYkH+KM
 d7eJdbXq/0xRJSuoHncG9/4Kffije+UyIs/1DrcWVRc5QZzdAzcAkRxH1E+SSOo9IoE5
 G0RMEiW1zI81vUF+ILVk5ZVRd4KlQcmwUEMZJIOKIZK64BRyPhOdxnpDeS1SoOBH1eps
 VHYQ==
X-Gm-Message-State: APjAAAUf/EbTgMKd0U4rRBqOFQsYPeSPRZ1I8m+8Whn5mRCePwZJvvV7
 +DIVDoK/OxMyUST+lJHZsfK7j+8n
X-Google-Smtp-Source: APXvYqzxxwvput0hwtg9iKYmnq2VzDGr9V32cZn/53fXeykdeqkBTdooGW36AwvHS58s9fIbCQCIbg==
X-Received: by 2002:a17:90b:8d2:: with SMTP id
 ds18mr290574pjb.132.1560995237014; 
 Wed, 19 Jun 2019 18:47:17 -0700 (PDT)
Received: from surajjs2.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id 23sm20763528pfn.176.2019.06.19.18.47.14
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 19 Jun 2019 18:47:16 -0700 (PDT)
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] KVM: PPC: Book3S HV: Signed extend decrementer value if
 not using large decr
Date: Thu, 20 Jun 2019 11:46:50 +1000
Message-Id: <20190620014651.7645-2-sjitindarsingh@gmail.com>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <20190620014651.7645-1-sjitindarsingh@gmail.com>
References: <20190620014651.7645-1-sjitindarsingh@gmail.com>
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
Cc: clg@kaod.org, kvm-ppc@vger.kernel.org, sjitindarsingh@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On POWER9 the decrementer can operate in large decrementer mode where
the decrementer is 56 bits and signed extended to 64 bits. When not
operating in this mode the decrementer behaves as a 32 bit decrementer
which is NOT signed extended (as on POWER8).

Currently when reading a guest decrementer value we don't take into
account whether the large decrementer is enabled or not, and this means
the value will be incorrect when the guest is not using the large
decrementer. Fix this by sign extending the value read when the guest
isn't using the large decrementer.

Fixes: 95a6432ce903 "KVM: PPC: Book3S HV: Streamlined guest entry/exit path on P9 for radix guests"

Signed-off-by: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
---
 arch/powerpc/kvm/book3s_hv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index d3684509da35..719fd2529eec 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3607,6 +3607,8 @@ int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
 
 	vcpu->arch.slb_max = 0;
 	dec = mfspr(SPRN_DEC);
+	if (!(lpcr & LPCR_LD)) /* Sign extend if not using large decrementer */
+		dec = (s32) dec;
 	tb = mftb();
 	vcpu->arch.dec_expires = dec + tb;
 	vcpu->cpu = -1;
-- 
2.13.6

