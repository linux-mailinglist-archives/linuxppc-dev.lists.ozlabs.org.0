Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D6A53354C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 04:26:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L7FLZ5PZZz3bwg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 May 2022 12:26:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=JWwg+WJ1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=JWwg+WJ1; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L7FJ510DBz30BV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 May 2022 12:24:20 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id y189so2934032pfy.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 19:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=akfecTqLXRL2Zzgz/Ealq707UwMR3lHCQN1YGS4uSBw=;
 b=JWwg+WJ1dShepXxhPoelvQAIDVFH91RCFdmcLe67ZBK7f3AKBm7QbeKhhWJrRmBI/B
 7jll3PwBzJSR1cXDDSUYsRX2Uq5vm7kd3sq6VT3zkOzQojt9eoEkFcaYrZaqw6FffUC5
 CknA5w+k9hEIV07KOY9JiTUQQJJLi/nXVESSJjzEvf1fUR+lhiXp/OpJiA9c5qzei+Mw
 s/CG14I4Iuxco9zISUYjd5Di+h7Azva1cEAcDwJ1nfSgg/9k2jPjI8c0hGmfuoHGTbs0
 3HMgqJlyO9giL0103iUbtZP/pSWEDfLLehJlvG/o4cR73c3evCi6Dq0QmJao77026BhQ
 H8Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=akfecTqLXRL2Zzgz/Ealq707UwMR3lHCQN1YGS4uSBw=;
 b=CXgnDJFhWvCY7mjX2KRsXpUxsNlbR8nXmeBRKe2PUSCmuuBMzSxGXZn7Fl5uvdHBVN
 2mgK75MIQaeFbhZPArrPUUBXbfug9HzWqrEnzvdyYkzGlfeLpuqtBhH43cxCpGhXZCed
 YVEge6T3E6ffDMgzNt6ZoKK2qI0OQf0nbPasLAhEGZT8prmKCnDo4XQcF/QxZq1KIy3Q
 bbgPw0KTxxRN3gbwwUpM/B9MxnN6E4psfRYRklXRGEH7jiByONgMO0QWkJtkdHoEvlqm
 5PzgDpI/WEmprXGObYDHhbkAX03FxNohN0ep3EdISifngVC4Wa4mZ0LVmEwokIIrdvbZ
 HDVg==
X-Gm-Message-State: AOAM532SIOzv4rIES3jSQggVoHHoEuQQ/6ChGefowLEQv4G9pen9Whul
 C5G4jDFlPYUThgwp9Y+uIrG2yIq4KZg=
X-Google-Smtp-Source: ABdhPJw4lbzqT8rT2AvJeP3yoCexg1nF++QFn4fvvE8YSloSkngYe/uCg6O/xe2zBPtmFSAXto4M4w==
X-Received: by 2002:a05:6a00:1a55:b0:518:a189:8f7e with SMTP id
 h21-20020a056a001a5500b00518a1898f7emr12472308pfv.48.1653445458668; 
 Tue, 24 May 2022 19:24:18 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.209.250.103])
 by smtp.gmail.com with ESMTPSA id
 p19-20020a1709028a9300b00161a9df4de8sm7884617plo.145.2022.05.24.19.24.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 19:24:18 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc/64s: Remove spurious fault flushing for NMMU
Date: Wed, 25 May 2022 12:23:58 +1000
Message-Id: <20220525022358.780745-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220525022358.780745-1-npiggin@gmail.com>
References: <20220525022358.780745-1-npiggin@gmail.com>
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Haren Myneni <haren@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 6d8278c414cb2 ("powerpc/64s/radix: do not flush TLB on spurious
fault") removed the TLB flush for spurious faults, except when a
coprocessor (nest MMU) maps the address space. This is not needed
because the NMMU workaround in the PTE permission upgrade paths
prevents PTEs existing with less restrictive access permissions than
their corresponding TLB entries have.

Remove it and replace with a comment.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index d2e80f178b6d..ab01938f6c82 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -138,9 +138,31 @@ static inline void flush_all_mm(struct mm_struct *mm)
 static inline void flush_tlb_fix_spurious_fault(struct vm_area_struct *vma,
 						unsigned long address)
 {
-	/* See ptep_set_access_flags comment */
-	if (atomic_read(&vma->vm_mm->context.copros) > 0)
-		flush_tlb_page(vma, address);
+	/*
+	 * Book3S 64 does not require spurious fault flushes because the PTE
+	 * must be re-fetched in case of an access permission problem. So the
+	 * only reason for a spurious fault should be concurrent modification
+	 * to the PTE, in which case the PTE will eventually be re-fetched by
+	 * the MMU when it attempts the access again.
+	 *
+	 * See: Power ISA Version 3.1B, 6.10.1.2 Modifying a Translation Table
+	 * Entry, Setting a Reference or Change Bit or Upgrading Access
+	 * Authority (PTE Subject to Atomic Hardware Updates):
+	 *
+         * "If the only change being made to a valid PTE that is subject to
+         *  atomic hardware updates is to set the Reference or Change bit to
+         *  1 or to upgrade access authority, a simpler sequence suffices
+         *  because the translation hardware will refetch the PTE if an
+         *  access is attempted for which the only problems were reference
+         *  and/or change bits needing to be set or insufficient access
+         *  authority."
+	 */
+
+	/*
+	 * The nest MMU in POWER9 does not perform this PTE re-fetch, but
+	 * it avoids the spurious fault problem by flushing the TLB before
+	 * upgrading PTE permissions, see radix__ptep_set_access_flags.
+	 */
 }
 
 extern bool tlbie_capable;
-- 
2.35.1

