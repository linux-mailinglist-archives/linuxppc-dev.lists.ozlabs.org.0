Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9385820BCB1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 00:38:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tsHV2xmqzDqGg
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 08:38:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=peterx@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=RIpITbH7; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=RIpITbH7; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tsDt1jxfzDr3P
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 08:36:29 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593210987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8qSToaPYAxy41TNCcRoZVJZv9P7/HBXlbwWJ2Rk2g+I=;
 b=RIpITbH7svrXy+/T6dgKE+cCoViK5yC/1koVCu/dySZw08mSAxf5pkXUPDeNLdm0eGE2SJ
 ab7qrMpHwIttHMUXWCSf0TYtC4gH3+1nDgb9ZzI8psAHUATKEMrDVdQ/kC2tHAXm5eHI5O
 lqeGu5vk7PcufeqoYPdtZE2y01Z7a2U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593210987;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8qSToaPYAxy41TNCcRoZVJZv9P7/HBXlbwWJ2Rk2g+I=;
 b=RIpITbH7svrXy+/T6dgKE+cCoViK5yC/1koVCu/dySZw08mSAxf5pkXUPDeNLdm0eGE2SJ
 ab7qrMpHwIttHMUXWCSf0TYtC4gH3+1nDgb9ZzI8psAHUATKEMrDVdQ/kC2tHAXm5eHI5O
 lqeGu5vk7PcufeqoYPdtZE2y01Z7a2U=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-170-PfLjrXlENRKz-A5S70LfEw-1; Fri, 26 Jun 2020 18:36:25 -0400
X-MC-Unique: PfLjrXlENRKz-A5S70LfEw-1
Received: by mail-qv1-f71.google.com with SMTP id y36so7340561qvf.21
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 15:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8qSToaPYAxy41TNCcRoZVJZv9P7/HBXlbwWJ2Rk2g+I=;
 b=g3FRtT0/YiWIAtGyp1V4PJE3K+CQ8Q6tnmkkND89lHmWJ9hcvANxitVxgKJr6UfoQx
 jjIcD9Wka5A11RyrEHUiktJvzrGGfQ4EPrJfTIa1gZ9suDNU3yFpMRWF1MpQf47rdkMa
 UfaWHBqvRcB8hx9Kr26MoUf6XdCoqna7m8K8b6aoG/owfHrctUhioEbwv8fhSqFctMdM
 24QntjC7OiFDZe/717CA6RxKJ/kbA/139LOM2+HJ+B4tGS1xSFjJt3Ht9HEFfgeHnsba
 7sHJMWnnZi7oKiahMQSeGClBDaWCkLlbP3XUfZXenGS3rytmf/Mq6tmqIkeljXP6dlFc
 mlRg==
X-Gm-Message-State: AOAM533/KBZ5CkMjrZ3KZEYrSsDjr6Zr52pokr3YDcBpVQzTdRH/dMkl
 0TqDCWtep77Air2lqynCibG9+udOr/V/AGJyYsOFcnHiIcJlwt3ngqgB+d63PM/9mJAMwJmB+EE
 6FKKQocpb2ay73bipZMxqFrP93w==
X-Received: by 2002:a37:dcc3:: with SMTP id v186mr4839647qki.393.1593210985274; 
 Fri, 26 Jun 2020 15:36:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCBCcJ2UOlHKiOErZOy/wQGbA8OVSFmjMRFnS3kp8IUFptdYH3jiRcE+pFBOUD78E2vWdkxQ==
X-Received: by 2002:a37:dcc3:: with SMTP id v186mr4839619qki.393.1593210984950; 
 Fri, 26 Jun 2020 15:36:24 -0700 (PDT)
Received: from xz-x1.redhat.com ([2607:9880:19c0:32::2])
 by smtp.gmail.com with ESMTPSA id p125sm9108324qke.78.2020.06.26.15.36.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 15:36:24 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/26] mm/powerpc: Use general page fault accounting
Date: Fri, 26 Jun 2020 18:36:22 -0400
Message-Id: <20200626223622.199765-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200626223130.199227-1-peterx@redhat.com>
References: <20200626223130.199227-1-peterx@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Peter Xu <peterx@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use the general page fault accounting by passing regs into handle_mm_fault().

CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
CC: Paul Mackerras <paulus@samba.org>
CC: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 arch/powerpc/mm/fault.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index 992b10c3761c..e325d13efaf5 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -563,7 +563,7 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 	 * make sure we exit gracefully rather than endlessly redo
 	 * the fault.
 	 */
-	fault = handle_mm_fault(vma, address, flags, NULL);
+	fault = handle_mm_fault(vma, address, flags, regs);
 
 #ifdef CONFIG_PPC_MEM_KEYS
 	/*
@@ -604,14 +604,9 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
 	/*
 	 * Major/minor page fault accounting.
 	 */
-	if (major) {
-		current->maj_flt++;
-		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ, 1, regs, address);
+	if (major)
 		cmo_account_page_fault();
-	} else {
-		current->min_flt++;
-		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1, regs, address);
-	}
+
 	return 0;
 }
 NOKPROBE_SYMBOL(__do_page_fault);
-- 
2.26.2

