Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED876D3C94
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 06:54:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PqdpH6g6Fz3chK
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Apr 2023 14:53:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=De7Hu5Fx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PqdnS33lSz3bjb
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Apr 2023 14:53:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=De7Hu5Fx;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PqdnS0Jsjz4x91;
	Mon,  3 Apr 2023 14:53:16 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680497596;
	bh=vuS68/AAKNSd1m+TEtLv9bslPKbZs2f15sX3aOSETSc=;
	h=From:To:Subject:Date:From;
	b=De7Hu5FxERB03J0pyiFbgYKIsAP/IXHkfulrGK9cl5qurhgCTHW+BH9wwOFQMY0f6
	 4tRdRE2SWVDvZylZ68ZmRyxpyf6ADYE2PfBVHvOpaHXnzzNsB8zNLNLD3bij9rK2qA
	 TXiEM/FLvpyi/C6FmlVcc6b12bsYvpBkPWjUSpgGkA4r4U3R+ZRt34pcjPPAr9SWU9
	 gYCbwIh2Q8WQ5/cqWQenx1eo4JSeX3s8x4hxR5R1jB+OWIhimKq0a5UOU3nF7PWeEN
	 6Bc2tADtZ375FcaFsxuqD/E7m2INWhNvoL1rLYLpGmZF9QdQJpyqLrnGUAdcVjo4wc
	 jU0WN4y5Wk+AQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2] KVM: PPC: BookE: Fix W=1 warnings
Date: Mon,  3 Apr 2023 14:53:14 +1000
Message-Id: <20230403045314.3095410-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix various W=1 warnings in booke.c:

  arch/powerpc/kvm/booke.c:1008:5: error: no previous prototype for ‘kvmppc_handle_exit’ [-Werror=missing-prototypes]
   1008 | int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr)
        |     ^~~~~~~~~~~~~~~~~~
  arch/powerpc/kvm/booke.c:1009: warning: Function parameter or member 'vcpu' not described in 'kvmppc_handle_exit'
  arch/powerpc/kvm/booke.c:1009: warning: Function parameter or member 'exit_nr' not described in 'kvmppc_handle_exit'

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/r/202304020827.3LEZ86WB-lkp@intel.com/
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kvm/booke.c | 2 +-
 arch/powerpc/kvm/booke.h | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

v2: Rebased on my topic/ppc-kvm branch where I already had some of the
fixes queued.

diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index ce37d282be6d..a9c04073d27e 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -1000,7 +1000,7 @@ static int kvmppc_resume_inst_load(struct kvm_vcpu *vcpu,
 	}
 }
 
-/**
+/*
  * kvmppc_handle_exit
  *
  * Return value is in the form (errcode<<2 | RESUME_FLAG_HOST | RESUME_FLAG_NV)
diff --git a/arch/powerpc/kvm/booke.h b/arch/powerpc/kvm/booke.h
index be9da96d9f06..9c5b8e76014f 100644
--- a/arch/powerpc/kvm/booke.h
+++ b/arch/powerpc/kvm/booke.h
@@ -109,4 +109,7 @@ static inline void kvmppc_clear_dbsr(void)
 {
 	mtspr(SPRN_DBSR, mfspr(SPRN_DBSR));
 }
+
+int kvmppc_handle_exit(struct kvm_vcpu *vcpu, unsigned int exit_nr);
+
 #endif /* __KVM_BOOKE_H__ */
-- 
2.39.2

