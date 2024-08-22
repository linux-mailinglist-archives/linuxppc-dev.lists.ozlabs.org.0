Return-Path: <linuxppc-dev+bounces-383-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CE50495B9C5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2024 17:14:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRY66pd9z3026;
	Fri, 23 Aug 2024 01:13:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.140.110.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724339610;
	cv=none; b=E/INGnOcdlc/LxyUPe2yG9EqdMrw8qClcWpqkQDw2QJJFG1Zdi01qpd3QwrJcTwiDMvioZ2TykyzYu3sTE8++iCCXREkOhV1gRmcJv/i96jux9OMCOFQSk+kJBzeHR+eoMPo4WrdeguNniSmhVxQTh1YETohQvpTJ5wXPswnVb/zIvoPV4Mtx/in8+GdE5hmQougzZHd+SwG0UgjhX53yqKNjd3JZ6WYqtTEkSIsEvlFBrCkBUyDZjVyiQv3c5NnFKfzmLztort+H1/xZgpVw4iPvHjM7QBX6KHe0KtnxrCmjG4itED19yPGIxlAvIj0gKGYzKcBHeVt5kJDtRWUuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724339610; c=relaxed/relaxed;
	bh=bb7ZCtifyjmJorc1ZP8+hQKeVmZklK/Lz7jM+D30Hqo=;
	h=Received:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding; b=HVwIcMxDATf57+kfMBASEkTPudRUmJl1gk+/y3pTLlUBMvIcdt3PEnD6KbYm0tuoopxuFm37ahrwGJcEpExWNoyRCXg8rao3wK8nzxZt4WxGk6LqfiFowsrURIjmS18OoJyitb5b/VQDEdEfFeQP8In4x71cnhVqR/8pCnAMz2BsZomrXqGYEWP64q6OBJiriPJEdhTC/UdEl7QUnvYPOYd4174scHkcjFDXV/mQEEBAflkrrSSaoKsf9qhdt75KKmtDMJz7Sda7l5AfcLKSKFVcySu3fxoA0ydgjE5y3p8gJHiRjG7/tbW0k7Ddf9z+zOf3+cJLwlcoNZ6V+oAA9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org) smtp.mailfrom=arm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=joey.gouly@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WqRY64qfjz2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Aug 2024 01:13:30 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 893C615BF;
	Thu, 22 Aug 2024 08:13:25 -0700 (PDT)
Received: from e124191.cambridge.arm.com (e124191.cambridge.arm.com [10.1.197.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6ADCB3F58B;
	Thu, 22 Aug 2024 08:12:55 -0700 (PDT)
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
Subject: [PATCH v5 22/30] arm64: enable PKEY support for CPUs with S1POE
Date: Thu, 22 Aug 2024 16:11:05 +0100
Message-Id: <20240822151113.1479789-23-joey.gouly@arm.com>
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

Now that PKEYs support has been implemented, enable it for CPUs that
support S1POE.

Signed-off-by: Joey Gouly <joey.gouly@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Acked-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/include/asm/pkeys.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git arch/arm64/include/asm/pkeys.h arch/arm64/include/asm/pkeys.h
index 32c352bb36b9..19eb1b12b7fc 100644
--- arch/arm64/include/asm/pkeys.h
+++ arch/arm64/include/asm/pkeys.h
@@ -17,7 +17,7 @@ int arch_set_user_pkey_access(struct task_struct *tsk, int pkey,
 
 static inline bool arch_pkeys_enabled(void)
 {
-	return false;
+	return system_supports_poe();
 }
 
 static inline int vma_pkey(struct vm_area_struct *vma)
-- 
2.25.1


