Return-Path: <linuxppc-dev+bounces-371-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC4595B996
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:13:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRX34WBRz2ysv;
	Fri, 23 Aug 2024 01:12:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339555;
	cv=none; b=I31wVhAC3IQy5vEsM+u1Duxcx3rItGgl4sdGbvpkcEUyBfoACgNulmEefkEhBcpg6tfSNgNRI8E3xi7Gv7bXy20bebJZgKb2HBvL9LHOoloYVWq0+H4XPdvNi6ncnhWNc45gWfRed6JpWhGvhz8r96Txkw5Qeeozac/AISgZUWCBDjFY3gdzBHa79aUvK5PUxugBfiy3UOPgpM2ToXQPI6dTgT3DOH6RbxYYBnmGLDOjzmyUosvkZ8XAZrcx96HyrkOdoji5aG9B7VxR7wKnKgmJRXr1qPGnULqsApsh/rGX9kRz78FctzUzIg/qJe4nPkiosvNQjP4T0hki9B4pPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339555; c=relaxed/relaxed;
	bh=tGPcTPPfKkSGaPcxenC1uehrGC+VQwOEc7ex5Jc/eTc=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=XA6w/tA++pX+LVWzHQg5cb0F9YV88EEuxMAvBR/00LDzqji/7+D1cOlw9V+Dl3yhUzQLy8LvJeJ0t4hKNx6aaq633+VTdM0n3sdl09DhHl3YdIQFNMX8VSTjAz7XSJN4TkvQmAQ21jbrVrkZNxbgQ87Is4h6W+lL+YOPzv6qIed+U1ZKMuwADfjb/XgxHGwFpuX8tjTEFmBLJhitIE6kQAGrGbQ1tczfhhAkRKU1cCN+8PJprl/eB8s/ovZ4ljKgymzfqLGdn1Mn4yOhjYPSM3d3GHkwcCyZSzRDl2oj1w4V+QzdmbA4S6ZYOwtmJgD1Bk13SEP1QI62ivYyRiwXPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRX32SnGz2ynr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:12:35 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5A265DA7;
	Thu, 22 Aug 2024 08:12:29 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F69E3F58B;
	Thu, 22 Aug 2024 08:11:59 -0700 (PDT)
From: Joey Gouly <joey.gouly@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: nd@arm.com,
	akpm@linux-foundation.org,
	aneesh.kumar@kernel.org,
	aneesh.kumar@linux.ibm.com,
	anshuman.khandual@arm.com,
	bp@alien8.de,
	broonie@kernel.org,
	catalin.marinas@arm.com,
	christophe.leroy@csgroup.eu,
	dave.hansen@linux.intel.com,
	hpa@zytor.com,
	joey.gouly@arm.com,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	maz@kernel.org,
	mingo@redhat.com,
	mpe@ellerman.id.au,
	naveen.n.rao@linux.ibm.com,
	npiggin@gmail.com,
	oliver.upton@linux.dev,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	szabolcs.nagy@arm.com,
	tglx@linutronix.de,
	will@kernel.org,
	x86@kernel.org,
	kvmarm@lists.linux.dev,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v5 09/30] KVM: arm64: use `at s1e1a` for POE
Date: Thu, 22 Aug 2024 16:10:52 +0100
Message-Id: <20240822151113.1479789-10-joey.gouly@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240822151113.1479789-1-joey.gouly@arm.com>
References: <20240822151113.1479789-1-joey.gouly@arm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

FEAT_ATS1E1A introduces a new instruction: `at s1e1a`.
This is an address translation, without permission checks.

POE allows read permissions to be removed from S1 by the guest.  This means
that an `at` instruction could fail, and not get the IPA.

Switch to using `at s1e1a` so that KVM can get the IPA regardless of S1
permissions.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/fault.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git arch/arm64/kvm/hyp/include/hyp/fault.h arch/arm64/kvm/hyp/include/hyp/fault.h
index 487c06099d6f..17df94570f03 100644
--- arch/arm64/kvm/hyp/include/hyp/fault.h
+++ arch/arm64/kvm/hyp/include/hyp/fault.h
@@ -14,6 +14,7 @@
 
 static inline bool __translate_far_to_hpfar(u64 far, u64 *hpfar)
 {
+	int ret;
 	u64 par, tmp;
 
 	/*
@@ -27,7 +28,9 @@ static inline bool __translate_far_to_hpfar(u64 far, u64 *hpfar)
 	 * saved the guest context yet, and we may return early...
 	 */
 	par = read_sysreg_par();
-	if (!__kvm_at(OP_AT_S1E1R, far))
+	ret = system_supports_poe() ? __kvm_at(OP_AT_S1E1A, far) :
+	                              __kvm_at(OP_AT_S1E1R, far);
+	if (!ret)
 		tmp = read_sysreg_par();
 	else
 		tmp = SYS_PAR_EL1_F; /* back to the guest */
-- 
2.25.1


