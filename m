Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C96C393FAD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 11:16:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrzZC4FT3z3bxn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 19:16:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=CxRW/bwz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52d;
 helo=mail-pg1-x52d.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=CxRW/bwz; dkim-atps=neutral
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrzPp0nyyz3bxs
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 19:08:45 +1000 (AEST)
Received: by mail-pg1-x52d.google.com with SMTP id f22so2041421pgb.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 02:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qdLbZJS4H0W1njTybYNPIOA1CAvkdKw8pFhNmZNlDgc=;
 b=CxRW/bwzuRp4pnVGfmnBrAv5WTPlkXtoTlUCYPO5TtpoJWSLAtBbOtuJGyYpOcWC5d
 ZMqCqhzWf7lZoQbsOF5vl5bbpoQBNJ0qnUVJh69HH8bF7xOtscD2bKCsnIIIXqJQYJgw
 9fCVu6QJ2Q4meMic5WYtSvY1eWp9y1vIFGOKBRT+j3xmRYN8jrWNFy9kwskG6hwk/glM
 wUItqhICqWnTa+woOjtFi2Qykgc4iznGmUVH2XQHd0OBifat9bQRdPcvmb08qisA3CIH
 p6OGV3HCtLgODi47cFLbv5bTvdsAoZsGZuACKWSRf5ZyyaTe9gcyf83z+Qhb3TQ6b0x6
 g7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qdLbZJS4H0W1njTybYNPIOA1CAvkdKw8pFhNmZNlDgc=;
 b=aN0xTUFAl9TDlKHwk93GonL2yJHWV/7zsscFjM/SqQpvQBy7/zmy1uJ4dGGWqc+2uZ
 vv7EP+enTApp7FE+H2acuhVOA99OQt/r6UBELqVDnzGXqf/vXfhjaPW3z321AVfU57e9
 VAjjWaLtyd0oKybBIfl2g6zTtYvf9fayCQIB7yC9Tncm+61JUVHeId2c0lbLXIBIDZx5
 8/bsd9aTgnWDDSgR6N4IE8p/Fr2152Gp9zcaagyTow0UNJY7gyrkymjMYj/BgJgmf+Dg
 tKLuJHopjhwmZd3fS6qP3CScVdv5jazXnO2itonrnN31hxWcfmZ9NfKJ8lnD46tYXsjT
 cWHA==
X-Gm-Message-State: AOAM531y4X158ssYCdejlEgJP5Nm0yNekj0cVoO+A78jxJmVVNGObsXK
 OiVwoNQJ/EhJDg/U00/2Vqk=
X-Google-Smtp-Source: ABdhPJwaqblBBBesmw0zpFCEBdwfYIXQUcsUWiWn/kxdQeQIR4uUWz2YEWRm08qc+4f3LWkKaSgUWw==
X-Received: by 2002:a65:638e:: with SMTP id h14mr7967807pgv.108.1622192923911; 
 Fri, 28 May 2021 02:08:43 -0700 (PDT)
Received: from bobo.ibm.com (124-169-110-219.tpgi.com.au. [124.169.110.219])
 by smtp.gmail.com with ESMTPSA id a2sm3624183pfv.156.2021.05.28.02.08.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 May 2021 02:08:43 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v7 17/32] KVM: PPC: Book3S HV P9: Improve exit timing
 accounting coverage
Date: Fri, 28 May 2021 19:07:37 +1000
Message-Id: <20210528090752.3542186-18-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210528090752.3542186-1-npiggin@gmail.com>
References: <20210528090752.3542186-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The C conversion caused exit timing to become a bit cramped. Expand it
to cover more of the entry and exit code.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index a6f89e30040b..8a56141214c1 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -143,6 +143,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 
+	start_timing(vcpu, &vcpu->arch.rm_entry);
+
 	if (vc->tb_offset) {
 		u64 new_tb = mftb() + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
@@ -193,8 +195,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	start_timing(vcpu, &vcpu->arch.rm_entry);
-
 	vcpu->arch.ceded = 0;
 
 	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
@@ -337,8 +337,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	accumulate_time(vcpu, &vcpu->arch.rm_exit);
 
-	end_timing(vcpu);
-
 	/* Advance host PURR/SPURR by the amount used by guest */
 	purr = mfspr(SPRN_PURR);
 	spurr = mfspr(SPRN_SPURR);
@@ -402,6 +400,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	switch_mmu_to_host_radix(kvm, host_pidr);
 
+	end_timing(vcpu);
+
 	return trap;
 }
 EXPORT_SYMBOL_GPL(kvmhv_vcpu_entry_p9);
-- 
2.23.0

