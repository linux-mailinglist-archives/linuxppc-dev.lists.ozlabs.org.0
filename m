Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 153F95B0C06
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 20:02:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MN97z6Gmpz3c6R
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Sep 2022 04:02:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GtwBMc6E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com; envelope-from=shy828301@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GtwBMc6E;
	dkim-atps=neutral
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MN97P1C9Tz2xJD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Sep 2022 04:01:52 +1000 (AEST)
Received: by mail-pj1-x102f.google.com with SMTP id m3so4701908pjo.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Sep 2022 11:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=eU/KWFZN5UecQ8lbzprnvq1q98iyrbbNqlvylwkyiHU=;
        b=GtwBMc6EL/iXg66DLvtx19O/9lfPfRbzA8mc4+Xi+LrbcSCdAPV5vLH4lpomv4ciNM
         fIYzkt3IS2BPGL2ih6bmDimjFB5SB4q2SuKHQwAlcbzYHpoVNaDYxuZdsVuFFX/3T/Uc
         YXF7Rny2ZEEGby9c57HmCFy9pg3z5r8m4VTNcZVG97Uv8KyUzy/Bnxo5Um52ZTTyeAVW
         G0qCz8OCaLUh7ICyMGSrI1Jh/Jswa1I086oJypMirhyA+vvor74uUAxXhbsk+gINCKbU
         HC9fT6qRKh58VoKTe1FnhEu84oA7FZip2zriqLGw9iKZGl+voSYJs7XVmVRxS1swZU7R
         JKYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=eU/KWFZN5UecQ8lbzprnvq1q98iyrbbNqlvylwkyiHU=;
        b=YXjx6GbQnWFHR//ssR/Rt/+YbtUwnAc03wwPMaeDg+bBcmOD8r/8T0rkTzjqSI23a/
         /Rp+NS8ZJcElFiyPnOnRva375l+cAM+Otii6hnQvxYhxipvd4dEMXCQTCMKcFLIyHrSo
         1kV5AulPMikZpBjb2gepDsvvllJQK+gA+lF3uLMFG6QeCRQca9BYGQiHUXmCVi4IvG9T
         tbR1BwCOcCLf85orgG6RA8MFxrW+tEQRA7bDLebeSK/B9ZqZ48UOogyr7KgwrQ2vPT7X
         b0EitnUTyUV3wWn28OHD0t1Oo4nRNsESugdcE9/KJ53rjgUJkEt8mQHjzhfLqnQaQa9a
         sEew==
X-Gm-Message-State: ACgBeo1NMZLyTDcXyLYMUOrRIX9u2GGPT/h++jaqaMCUBXyMNKfCMPwX
	u3KvtOOExOHzVquqZX6Zb1g=
X-Google-Smtp-Source: AA6agR4jQu9kTFMCgKbNUddUbVeBrjOtp6VteymiGZOmYpTK0JnXVpNi96p1AWx0nYhR3UmigAXkAQ==
X-Received: by 2002:a17:90a:d150:b0:1fd:9336:5db3 with SMTP id t16-20020a17090ad15000b001fd93365db3mr5322933pjw.242.1662573709955;
        Wed, 07 Sep 2022 11:01:49 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-241-145.hsd1.ca.comcast.net. [67.174.241.145])
        by smtp.gmail.com with ESMTPSA id t17-20020a170902e85100b0017312bfca95sm12801664plg.253.2022.09.07.11.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 11:01:49 -0700 (PDT)
From: Yang Shi <shy828301@gmail.com>
To: david@redhat.com,
	peterx@redhat.com,
	kirill.shutemov@linux.intel.com,
	jhubbard@nvidia.com,
	jgg@nvidia.com,
	hughd@google.com,
	akpm@linux-foundation.org,
	aneesh.kumar@linux.ibm.com
Subject: [v2 PATCH 2/2] powerpc/64s/radix: don't need to broadcast IPI for radix pmd collapse flush
Date: Wed,  7 Sep 2022 11:01:44 -0700
Message-Id: <20220907180144.555485-2-shy828301@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20220907180144.555485-1-shy828301@gmail.com>
References: <20220907180144.555485-1-shy828301@gmail.com>
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
Cc: linux-mm@kvack.org, shy828301@gmail.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The IPI broadcast is used to serialize against fast-GUP, but fast-GUP
will move to use RCU instead of disabling local interrupts in fast-GUP.
Using an IPI is the old-styled way of serializing against fast-GUP
although it still works as expected now.

And fast-GUP now fixed the potential race with THP collapse by checking
whether PMD is changed or not.  So IPI broadcast in radix pmd collapse
flush is not necessary anymore.  But it is still needed for hash TLB.

Suggested-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
Signed-off-by: Yang Shi <shy828301@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 698274109c91..e712f80fe189 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -937,15 +937,6 @@ pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addre
 	pmd = *pmdp;
 	pmd_clear(pmdp);
 
-	/*
-	 * pmdp collapse_flush need to ensure that there are no parallel gup
-	 * walk after this call. This is needed so that we can have stable
-	 * page ref count when collapsing a page. We don't allow a collapse page
-	 * if we have gup taken on the page. We can ensure that by sending IPI
-	 * because gup walk happens with IRQ disabled.
-	 */
-	serialize_against_pte_lookup(vma->vm_mm);
-
 	radix__flush_tlb_collapsed_pmd(vma->vm_mm, address);
 
 	return pmd;
-- 
2.26.3

