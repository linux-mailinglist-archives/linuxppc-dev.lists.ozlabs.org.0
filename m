Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 200476DD285
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 08:15:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwbF360czz3cd9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 16:15:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=A2b515Qp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1036; helo=mail-pj1-x1036.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=A2b515Qp;
	dkim-atps=neutral
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwbD8129bz2xrC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Apr 2023 16:15:02 +1000 (AEST)
Received: by mail-pj1-x1036.google.com with SMTP id o2-20020a17090a0a0200b00246da660bd2so1045047pjo.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Apr 2023 23:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1681193698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=40ATmUkELs3v2phkdscWCg0Eyb8UJbsAcFnoSmj4j6A=;
        b=A2b515QpMfBXsiswPjWbR+ZdamIPJrVisa0qXF/MV4M75LGcRECaX8svgLkomuoMDI
         5wbIYWnyq3heLwnRVHmRcCl1bFghNQlvKC6jnj7JaUlJox2Kt+VXj/c3F1phR2Smc6x2
         tcBo4dsAQoq4lOJ7CuJoDw8EbbEsYWTuNboGfYo3+xbqOOsB6K7/VhrxiroKpKhscW4I
         WmMs7sqBhg0OXB1jBSy4Yhd0hlzIr9Ejz6nnrpsvUH9vhEaezOSn9yQlHrRQ0Etx7kTD
         N/cLFDu33sOmNU1ZwHI+evkVWeH0Qn52GG+Etq04uUWsYDjquRSn0H+Sf6VMPZwReebs
         yCwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681193698;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40ATmUkELs3v2phkdscWCg0Eyb8UJbsAcFnoSmj4j6A=;
        b=8E/B94PoMqh0/qDL3Yal1obnKAayZHdcelcnjeQzWnEcBTN1M3bAFe20+HIAz+Rtcj
         /t9H2wyjRAMwno4LXXtUHEQKeLJcY9fxKUYuNpGc1cHH1T180NMNNEPjtfCs0t5fm/p2
         NHxKXI6BOWfwsp3Un1thxvc/LbfPV1m3pTZFrRLclk3pkNvZm1ksy+mJpOzt+AfsGim5
         p1oCicBg9AQLDQaBhQUAWxn6wTdzTKow5EQqDS6hu5aBASwLpZZMwLH5nsc9um7DTJPo
         ZiWA6WP1iaTuRlLLHr8dy6f+fVZDdHR22IEDEs1BltBh+/AQS+ufmrcfPXQ40e2fsW4Y
         r7Vg==
X-Gm-Message-State: AAQBX9dTrzcZRhV+KRqxo7/jeT4DrZBcvkpaji0ndT3aSVUmH2F2llfe
	QsrVj9sIuDJgj4eEvjGbKJY=
X-Google-Smtp-Source: AKy350YZHOcuClKKBy6/sDrm+6rHkQUS2d88QMXIEvzrBQIUtKtzaxhtkjjHJohUURDSp1hh6GhyTA==
X-Received: by 2002:a17:902:c40e:b0:1a6:52f9:d4c7 with SMTP id k14-20020a170902c40e00b001a652f9d4c7mr2788877plk.60.1681193697493;
        Mon, 10 Apr 2023 23:14:57 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id jj4-20020a170903048400b001a64a2b790fsm2194180plb.164.2023.04.10.23.14.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Apr 2023 23:14:56 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Fix documentation for ppc mmu caps
Date: Tue, 11 Apr 2023 15:44:46 +0930
Message-Id: <20230411061446.26324-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.2
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
Cc: Jonathan Corbet <corbet@lwn.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The documentation mentions KVM_CAP_PPC_RADIX_MMU, but the defines in the
kvm headers spell it KVM_CAP_PPC_MMU_RADIX. Similarly with
KVM_CAP_PPC_MMU_HASH_V3.

Fixes: c92701322711 ("KVM: PPC: Book3S HV: Add userspace interfaces for POWER9 MMU")
Signed-off-by: Joel Stanley <joel@jms.id.au>
---
There is also the copy of the uapi header in tools/ that needs updating,
but that seems to be manually kept in sync so I didn't patch that.
---
 Documentation/virt/kvm/api.rst | 8 ++++----
 include/uapi/linux/kvm.h       | 4 ++--
 tools/include/uapi/linux/kvm.h | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index a5c803f39832..979a5f7b545e 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -4237,7 +4237,7 @@ operating system that uses the PIT for timing (e.g. Linux 2.4.x).
 4.100 KVM_PPC_CONFIGURE_V3_MMU
 ------------------------------
 
-:Capability: KVM_CAP_PPC_RADIX_MMU or KVM_CAP_PPC_HASH_MMU_V3
+:Capability: KVM_CAP_PPC_MMU_RADIX or KVM_CAP_PPC_MMU_HASH_V3
 :Architectures: ppc
 :Type: vm ioctl
 :Parameters: struct kvm_ppc_mmuv3_cfg (in)
@@ -4271,7 +4271,7 @@ the Power ISA V3.00, Book III section 5.7.6.1.
 4.101 KVM_PPC_GET_RMMU_INFO
 ---------------------------
 
-:Capability: KVM_CAP_PPC_RADIX_MMU
+:Capability: KVM_CAP_PPC_MMU_RADIX
 :Architectures: ppc
 :Type: vm ioctl
 :Parameters: struct kvm_ppc_rmmu_info (out)
@@ -7701,7 +7701,7 @@ capability via KVM_ENABLE_CAP ioctl on the vcpu fd. Note that this
 will disable the use of APIC hardware virtualization even if supported
 by the CPU, as it's incompatible with SynIC auto-EOI behavior.
 
-8.3 KVM_CAP_PPC_RADIX_MMU
+8.3 KVM_CAP_PPC_MMU_RADIX
 -------------------------
 
 :Architectures: ppc
@@ -7711,7 +7711,7 @@ available, means that the kernel can support guests using the
 radix MMU defined in Power ISA V3.00 (as implemented in the POWER9
 processor).
 
-8.4 KVM_CAP_PPC_HASH_MMU_V3
+8.4 KVM_CAP_PPC_MMU_HASH_V3
 ---------------------------
 
 :Architectures: ppc
diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
index d77aef872a0a..69f90989bfc8 100644
--- a/include/uapi/linux/kvm.h
+++ b/include/uapi/linux/kvm.h
@@ -1533,9 +1533,9 @@ struct kvm_s390_ucas_mapping {
 /* Available with KVM_CAP_SPAPR_RESIZE_HPT */
 #define KVM_PPC_RESIZE_HPT_PREPARE _IOR(KVMIO, 0xad, struct kvm_ppc_resize_hpt)
 #define KVM_PPC_RESIZE_HPT_COMMIT  _IOR(KVMIO, 0xae, struct kvm_ppc_resize_hpt)
-/* Available with KVM_CAP_PPC_RADIX_MMU or KVM_CAP_PPC_HASH_MMU_V3 */
+/* Available with KVM_CAP_PPC_MMU_RADIX or KVM_CAP_PPC_MMU_HASH_V3 */
 #define KVM_PPC_CONFIGURE_V3_MMU  _IOW(KVMIO,  0xaf, struct kvm_ppc_mmuv3_cfg)
-/* Available with KVM_CAP_PPC_RADIX_MMU */
+/* Available with KVM_CAP_PPC_MMU_RADIX */
 #define KVM_PPC_GET_RMMU_INFO	  _IOW(KVMIO,  0xb0, struct kvm_ppc_rmmu_info)
 /* Available with KVM_CAP_PPC_GET_CPU_CHAR */
 #define KVM_PPC_GET_CPU_CHAR	  _IOR(KVMIO,  0xb1, struct kvm_ppc_cpu_char)
diff --git a/tools/include/uapi/linux/kvm.h b/tools/include/uapi/linux/kvm.h
index d77aef872a0a..9fb12e04c93d 100644
--- a/tools/include/uapi/linux/kvm.h
+++ b/tools/include/uapi/linux/kvm.h
@@ -1533,7 +1533,7 @@ struct kvm_s390_ucas_mapping {
 /* Available with KVM_CAP_SPAPR_RESIZE_HPT */
 #define KVM_PPC_RESIZE_HPT_PREPARE _IOR(KVMIO, 0xad, struct kvm_ppc_resize_hpt)
 #define KVM_PPC_RESIZE_HPT_COMMIT  _IOR(KVMIO, 0xae, struct kvm_ppc_resize_hpt)
-/* Available with KVM_CAP_PPC_RADIX_MMU or KVM_CAP_PPC_HASH_MMU_V3 */
+/* Available with KVM_CAP_PPC_RADIX_MMU or KVM_CAP_PPC_MMU_HASH_V3 */
 #define KVM_PPC_CONFIGURE_V3_MMU  _IOW(KVMIO,  0xaf, struct kvm_ppc_mmuv3_cfg)
 /* Available with KVM_CAP_PPC_RADIX_MMU */
 #define KVM_PPC_GET_RMMU_INFO	  _IOW(KVMIO,  0xb0, struct kvm_ppc_rmmu_info)
-- 
2.39.2

