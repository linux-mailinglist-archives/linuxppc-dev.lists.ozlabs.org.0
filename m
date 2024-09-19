Return-Path: <linuxppc-dev+bounces-1435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4BA97C2E8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Sep 2024 04:56:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X8Ksz2qfKz2y8l;
	Thu, 19 Sep 2024 12:56:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::636"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726714599;
	cv=none; b=UvRRVGAMq+w3h1bTb/YE4QGXWNtTYqJq4KVNmgqU7DZwNIkRfTOH/Yaazpv963wFVji436b/sk2cG8z4z5aainxJ42HKDI/LEMf5numjTjAMtq3ARgmXDXx6UYEgZklH9BYg5rCpB6kVbbYsKDcS463ixnRRfVHDSovJlz5GjZwVaKBNJXQ+ADdJCQP+T3qwI5yl51lqtJOoVNrEDNlekbp+u5TbrUk/0grkGFsGqeS+V9RFjrEpKrCiykqTe6jXR7wVaicLqYaVZ1KyMnTRO8GXpRyZNdkiWHkjEIww9gqtWdskpWee0KRCEINbp1+KSfTNpFd9pfFOt6+6AlN+fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726714599; c=relaxed/relaxed;
	bh=2IOurK7ENej5lHHiP4d73lr8yQG82cdevQPBO00m0fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ahkYxq04/Wp16Z9EuE/siqtbsL9Z1KigUH0htePClx3o1IFJhCQHDn02D/q9DTUnYivqhKEHKR/OPr7JyI8pb1kjKzYO+lN6wMsglhUXfpI+SU+vRnzS4Pd7nytMxw3hhSSjjlZ5+ujiFNTCSLf9aaknfTm/veRnhLy1/v1S99C6n7WNoKvGUP2icyEPxIdVizV40/MnFL48YjPHSxBsn/Vks70CNrRdoBfbd8xmRQvcN4yR6vI5Bv8VVhPA1mriCyU5tQ9vrDALrU+WhreAOTCEqCP8gpUw2WqTAX0qHFWzPA8N9okUpQzq/9ykc3UjZuncT/axa0rOpSjC4yudjw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ARqbyV3z; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ARqbyV3z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X8Ksz0P31z2xHl
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Sep 2024 12:56:38 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-207115e3056so3701795ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2024 19:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726714595; x=1727319395; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2IOurK7ENej5lHHiP4d73lr8yQG82cdevQPBO00m0fo=;
        b=ARqbyV3zd/dDHIDWlZyM36vx6MH5qmVZtD0WqlonOyHxMD2GxKdyuim10k7ddv4N+a
         +EwuDdv3Mt6DyFqjLhTi7D0mDt4BLvk46MgALW4+gCClfM2ZgXCaTrWJnKxkX7nJdK9r
         cJ78bzfjlCWvqloTiynPdzRkcLXqkpHNsXJK2c8sJmZwvNdZJSWWQZbR6HANfxVmdWpG
         ypES680BjxX7M35hjRbTKotl8PyMemHwMEIhPzsT+BQ4AEol/hvK54CnQy0rmlI/ao0n
         v4WpQ2gjP+Z+AqNIQ4vPibH1ylzTvqp/Va+8XZRzgi0CHqDZ3x+1dlkA1DsghmegW0/2
         FOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726714595; x=1727319395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2IOurK7ENej5lHHiP4d73lr8yQG82cdevQPBO00m0fo=;
        b=Z1tJCwwPNVCe/Ia4yvK9RSQpyw2R+PlpRCL/LGrIFlTIWDfMx9cJzl5Jhwpes46c3a
         6epClWJ5mM0HI1phrglA8aNXYdBDGrRZv79dUlTDXdcELqpDjTkXH1sRAhiZ8GJpmNC3
         PkWZ+EKbSGxQ9uigN4NK+RPFA2FP816CELMdg3cCEUC7OuKyYHBaRitOwlvquh/Gs713
         CuM2TNVbGH2DX91gWg9ZX3A0aVCYCWK086wVAo7Kw2Yj8T3/7V7E9eqg+mAzmW5O4Ukm
         j+Q3MRj2XEhjz/XUd4+CxdpDugFc1e0ufEbhTLRe50J9cAEcOCdppWb1k0bw9qkMMSOX
         XtBg==
X-Gm-Message-State: AOJu0YxoM8QJorw9HW4DK5q799o+BfZhtZxb3q9CFMVjDb3sxkAANqKt
	rU/wKJQELDaIyfQqKGQoSq81ryrcvgALy8+icmQbfUkIy9DL0m5vhK3KyQ==
X-Google-Smtp-Source: AGHT+IHfTwM1lnJEl3rUUm339wjWE2P+DCcagT96OnRmH6xTvh9VgnS8vtwxnlLDNUUy7qVft2NHpg==
X-Received: by 2002:a17:902:dad0:b0:1fd:5eab:8c76 with SMTP id d9443c01a7336-2076e462c42mr369019805ad.41.1726714595450;
        Wed, 18 Sep 2024 19:56:35 -0700 (PDT)
Received: from dw-tp.. ([171.76.85.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-207946d2823sm71389105ad.148.2024.09.18.19.56.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 19:56:34 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Hari Bathini <hbathini@linux.ibm.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Donet Tom <donettom@linux.vnet.ibm.com>,
	Pavithra Prakash <pavrampu@linux.vnet.ibm.com>,
	Nirjhar Roy <nirjhar@linux.ibm.com>,
	LKML <linux-kernel@vger.kernel.org>,
	kasan-dev@googlegroups.com,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
	Disha Goel <disgoel@linux.ibm.com>
Subject: [RFC v2 02/13] powerpc: mm: Fix kfence page fault reporting
Date: Thu, 19 Sep 2024 08:26:00 +0530
Message-ID: <87095ffca1e3b932c495942defc598907bf955f6.1726571179.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <cover.1726571179.git.ritesh.list@gmail.com>
References: <cover.1726571179.git.ritesh.list@gmail.com>
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

copy_from_kernel_nofault() can be called when doing read of /proc/kcore.
/proc/kcore can have some unmapped kfence objects which when read via
copy_from_kernel_nofault() can cause page faults. Since *_nofault()
functions define their own fixup table for handling fault, use that
instead of asking kfence to handle such faults.

Hence we search the exception tables for the nip which generated the
fault. If there is an entry then we let the fixup table handler handle the
page fault by returning an error from within ___do_page_fault().

This can be easily triggered if someone tries to do dd from /proc/kcore.
dd if=/proc/kcore of=/dev/null bs=1M

<some example false negatives>
===============================
BUG: KFENCE: invalid read in copy_from_kernel_nofault+0xb0/0x1c8
Invalid read at 0x000000004f749d2e:
 copy_from_kernel_nofault+0xb0/0x1c8
 0xc0000000057f7950
 read_kcore_iter+0x41c/0x9ac
 proc_reg_read_iter+0xe4/0x16c
 vfs_read+0x2e4/0x3b0
 ksys_read+0x88/0x154
 system_call_exception+0x124/0x340
 system_call_common+0x160/0x2c4

BUG: KFENCE: use-after-free read in copy_from_kernel_nofault+0xb0/0x1c8
Use-after-free read at 0x000000008fbb08ad (in kfence-#0):
 copy_from_kernel_nofault+0xb0/0x1c8
 0xc0000000057f7950
 read_kcore_iter+0x41c/0x9ac
 proc_reg_read_iter+0xe4/0x16c
 vfs_read+0x2e4/0x3b0
 ksys_read+0x88/0x154
 system_call_exception+0x124/0x340
 system_call_common+0x160/0x2c4

Guessing the fix should go back to when we first got kfence on PPC32.

Fixes: 90cbac0e995d ("powerpc: Enable KFENCE for PPC32")
Reported-by: Disha Goel <disgoel@linux.ibm.com>
Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 arch/powerpc/mm/fault.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 81c77ddce2e3..fa825198f29f 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -439,9 +439,17 @@ static int ___do_page_fault(struct pt_regs *regs, unsigned long address,
 	/*
 	 * The kernel should never take an execute fault nor should it
 	 * take a page fault to a kernel address or a page fault to a user
-	 * address outside of dedicated places
+	 * address outside of dedicated places.
+	 *
+	 * Rather than kfence reporting false negatives, let the fixup table
+	 * handler handle the page fault by returning SIGSEGV, if the fault
+	 * has come from functions like copy_from_kernel_nofault().
 	 */
 	if (unlikely(!is_user && bad_kernel_fault(regs, error_code, address, is_write))) {
+
+		if (search_exception_tables(instruction_pointer(regs)))
+			return SIGSEGV;
+
 		if (kfence_handle_page_fault(address, is_write, regs))
 			return 0;
 
-- 
2.46.0


