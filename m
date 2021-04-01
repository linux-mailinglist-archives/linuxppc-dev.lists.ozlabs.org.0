Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4028235160B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 17:19:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FB6KH2CBXz3cBh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Apr 2021 02:18:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=YX/oyqVO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=YX/oyqVO; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FB61W5y4Pz3cN2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Apr 2021 02:05:19 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id f29so163240pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Apr 2021 08:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aeSz2UYkwPYdoW0B1VQ6zrxPMp46nIsZCAH44O8XJ84=;
 b=YX/oyqVOl9TLJI/M8N6dyYXSttgxmMfM6jvoC2xj0WfaY73yiiDGHAdn6OEpjqoo7Y
 l4Rvq4DHFFEcymlmQQcbRhqwXabdM0DCZ4WYhQttG1/7cUUT6alaEY94AOb8pLv5doqz
 h7A5zKqo6A3bY7DumqIYavVO15sEGX+X8HzbqM4OxdVwNL/7hGY6y9Xs8pJqPETHllHd
 JLRgtS7WERYrsJ/t9YyVD87QUkPkeoeuifrJ1lcfNDV4tq4jqFTLi62z5OW/Fs3skU0B
 Il6EqiRGmO/uvbzFnPXI+ELyYftNxTwdR8iir2tbeGHEKV/vB0eCmEd3yw0ySZXJUnLJ
 IG1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aeSz2UYkwPYdoW0B1VQ6zrxPMp46nIsZCAH44O8XJ84=;
 b=BKsdKQMyYY90icsolNPECfhToQpi5z7ClgN3Lx+lVLRVDYs5LGUBUH7HQMZ3ergRSn
 WbZ42PWVNP50BRFtlaKBc2bcCztda8c4AiPNl+TA9GUEAWOJlu/Pqyz4KW0Y/cDfw52f
 vdMJkS3cgyX7cVz6Z1YlcYiHnS3oheV1iaAtq0OD+s7OJ34sULDS4t+R04aQJ/jLamJ7
 vYmXMzD+Cebw2BwSCJYc5e0+5VVUd6UMCXlzxvCeqfzwLNa9DAKJJWwpeek9AkrFctpr
 4ERz+FZg5gpipQjIm9yu7c0ulU81kSYJ+CJS1yZfAB0RCSq1dcZBW2nZ0r6xI9/fkmsY
 TISg==
X-Gm-Message-State: AOAM5302Mz2AuysbjVJPdURAZpfdNOTrS7f68wL9uaOSbNFD/jcjBfIe
 pfILx9g4bQGQ/xB/St2dolAPmhwMXNs=
X-Google-Smtp-Source: ABdhPJzSmVhqQGkO+CsjlirMUx9DKYORF+Wj+FR2Wb5j9FMRqGJZdkw0r1GKs/ZtpwuTJgVxMMbPqA==
X-Received: by 2002:a62:170e:0:b029:1fa:7161:fd71 with SMTP id
 14-20020a62170e0000b02901fa7161fd71mr7741392pfx.35.1617289518056; 
 Thu, 01 Apr 2021 08:05:18 -0700 (PDT)
Received: from bobo.ibm.com ([1.128.218.207])
 by smtp.gmail.com with ESMTPSA id l3sm5599632pju.44.2021.04.01.08.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Apr 2021 08:05:17 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v5 33/48] KVM: PPC: Book3S HV P9: Improve exit timing
 accounting coverage
Date: Fri,  2 Apr 2021 01:03:10 +1000
Message-Id: <20210401150325.442125-34-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The C conversion caused exit timing to become a bit cramped. Expand it
to cover more of the entry and exit code.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kvm/book3s_hv_interrupt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
index e419b23faa16..62cf0907e2a1 100644
--- a/arch/powerpc/kvm/book3s_hv_interrupt.c
+++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
@@ -154,6 +154,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	if (hdec < 0)
 		return BOOK3S_INTERRUPT_HV_DECREMENTER;
 
+	start_timing(vcpu, &vcpu->arch.rm_entry);
+
 	if (vc->tb_offset) {
 		u64 new_tb = tb + vc->tb_offset;
 		mtspr(SPRN_TBU40, new_tb);
@@ -204,8 +206,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 	 */
 	mtspr(SPRN_HDEC, hdec);
 
-	start_timing(vcpu, &vcpu->arch.rm_entry);
-
 	vcpu->arch.ceded = 0;
 
 	WARN_ON_ONCE(vcpu->arch.shregs.msr & MSR_HV);
@@ -349,8 +349,6 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	accumulate_time(vcpu, &vcpu->arch.rm_exit);
 
-	end_timing(vcpu);
-
 	/* Advance host PURR/SPURR by the amount used by guest */
 	purr = mfspr(SPRN_PURR);
 	spurr = mfspr(SPRN_SPURR);
@@ -415,6 +413,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 
 	switch_mmu_to_host_radix(kvm, host_pidr);
 
+	end_timing(vcpu);
+
 	return trap;
 }
 EXPORT_SYMBOL_GPL(kvmhv_vcpu_entry_p9);
-- 
2.23.0

