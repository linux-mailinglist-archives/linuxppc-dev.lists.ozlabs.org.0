Return-Path: <linuxppc-dev+bounces-17387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIUjEyWKoWnAuAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17387-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 13:12:21 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA2EB1B6F5E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 13:12:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMnJJ6hdpz3bmR;
	Fri, 27 Feb 2026 23:12:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.172
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772194336;
	cv=none; b=cNFPZNeJM5INJWqlZFrj/bphJFXDgmNeOLZC48NnyUZ5ULDdARgALnV7TpvFraz88bNfJLAE23PDAy4bEVmbb3Iu7qt/IGhjGNLMlYje4h77J3fAU/1gre+ol4cAXzjELJKrLTXDSV5wMzaQe7MS7nnsTYiv1rP2eUFXCp4Rzt++WXFSRGSO/ZAFXFRU97VE++FQr/RwnllrmCYGetFDF9OQBaxvkoysxjnqRUP79LLi1KBeZO4Kod6iRU3QMpf31uWU5alaFd0WZEEYaBojyIRwe4TJ0k8SJdp5yShHok4RA7NRpi1b+zwU1ydc5/AwRTBFhk4Lhnbn++km/w8Uuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772194336; c=relaxed/relaxed;
	bh=A9VnUUVWt2OivEInnP/5hnH7A1kF+epUMtvXzdzCsRg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmM38Wpyf9VJrIj47XiN4p1NqqzbbV7s2TAWmuQc+nmwAEWQz4YLJ4pznjvyJV0s/aVTVkiLhEuQTfbVFRV31O9NbUyhg0OM6OXFELVPrUtIZqEUwEj0ylVV6AWEModoOKat+T4RzYGoQZxLc+prhpVUnBkDQ+GSFct+mLGHmSdrK5x3FBPJSndl738SLSSu6gZDlQ8nzfXrRXThfr5sYJ83yQJRXTizsAXE9Wc+Fz5d9yzOSAnanVIHnwV/gspW4CGHV/8/6EUNBFL5WKikwNkjn4MlFsNyYSkSXAMW11KCsYi+OIsqCulTXv4yb1sN7DyNqViyfeKJAuzzOKQ7cQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G73YvlTI; dkim-atps=neutral; spf=pass (client-ip=91.218.175.172; helo=out-172.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=G73YvlTI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.172; helo=out-172.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
Received: from out-172.mta0.migadu.com (out-172.mta0.migadu.com [91.218.175.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMnJF2MRkz30N8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 23:12:11 +1100 (AEDT)
Message-ID: <4672053f-c9d9-4694-81ad-9b5fe741013a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772194310;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=A9VnUUVWt2OivEInnP/5hnH7A1kF+epUMtvXzdzCsRg=;
	b=G73YvlTItW/u/rHPyW7CK+7PMpVtGhIzMOv1+2p9NrT7k4zRVoaOf2NzDUgdgP0DB933Kw
	FryLANPcbvAUfbuhOq0PAoZA9+6fSEp1UeRgwgS84+HZU3nq7i3sqNUZ2hl1aMgf8gchpW
	Ttxn5+wmgqiIl17kKNPBrc5OfS3bRa0=
Date: Fri, 27 Feb 2026 12:11:46 +0000
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Subject: Re: [RFC v2 13/21] mm: huge_mm: Make sure all split_huge_pmd calls
 are checked
Content-Language: en-GB
To: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org,
 lorenzo.stoakes@oracle.com, willy@infradead.org, linux-mm@kvack.org
Cc: fvdl@google.com, hannes@cmpxchg.org, riel@surriel.com,
 shakeel.butt@linux.dev, kas@kernel.org, baohua@kernel.org, dev.jain@arm.com,
 baolin.wang@linux.alibaba.com, npache@redhat.com, Liam.Howlett@oracle.com,
 ryan.roberts@arm.com, Vlastimil Babka <vbabka@kernel.org>,
 lance.yang@linux.dev, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 maddy@linux.ibm.com, mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 hca@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
 borntraeger@linux.ibm.com, svens@linux.ibm.com, linux-s390@vger.kernel.org
References: <20260226113233.3987674-1-usama.arif@linux.dev>
 <20260226113233.3987674-14-usama.arif@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260226113233.3987674-14-usama.arif@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17387-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@kernel.org,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_NEQ_ENVFROM(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,linux.dev:email]
X-Rspamd-Queue-Id: BA2EB1B6F5E
X-Rspamd-Action: no action



On 26/02/2026 11:23, Usama Arif wrote:
> Mark __split_huge_pmd(), split_huge_pmd() and split_huge_pmd_address()
> with __must_check so the compiler warns if any caller ignores the return
> value. Not checking return value and operating on the basis that the pmd
> is split could result in a kernel bug. The possibility of an order-0
> allocation failing for page table allocation is very low, but it should
> be handled correctly.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>


Kernel test bot reported that I missed one split_huge_pmd call. I will include
the below patch in the next revision.


commit 9e1bb250ea8ef0a39c738cd4137ed6c98131ebb0 (HEAD)
Author: Usama Arif <usama.arif@linux.dev>
Date:   Thu Feb 26 10:45:35 2026 -0800

    mm: proc: handle split_huge_pmd failure in pagemap_scan
    
    pagemap_scan_thp_entry() splits a huge PMD when the PAGEMAP_SCAN ioctl
    needs to write-protect only a portion of a THP. It then returns -ENOENT
    so pagemap_scan_pmd_entry() falls through to PTE-level handling.
    
    Check the split_huge_pmd() return value and propagate the error on
    failure. Returning -ENOMEM instead of -ENOENT prevents the fallthrough
    to PTE handling, and the error propagates through walk_page_range() to
    do_pagemap_scan() where it becomes the ioctl return value.
    pagemap_scan_backout_range() already undoes the buffered output, and
    walk_end is written back to userspace so the caller knows where the
    scan stopped.
    
    If the split fails, the PMD remains huge. An alternative to the approach
    in the patch is to return -ENOENT, causing the caller to proceed to
    pte_offset_map_lock(). ___pte_offset_map() detects the trans_huge PMD
    and returns NULL, which sets ACTION_AGAIN — restarting the walker on the
    same PMD by which time the system might have enough memory to satisfy
    the split from succeeding.
    
    Signed-off-by: Usama Arif <usama.arif@linux.dev>

diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index e091931d7ca19..f5f459140b5c0 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -2714,9 +2714,13 @@ static int pagemap_scan_thp_entry(pmd_t *pmd, unsigned long start,
         * needs to be performed on a portion of the huge page.
         */
        if (end != start + HPAGE_SIZE) {
+               int err;
+
                spin_unlock(ptl);
-               split_huge_pmd(vma, pmd, start);
+               err = split_huge_pmd(vma, pmd, start);
                pagemap_scan_backout_range(p, start, end);
+               if (err)
+                       return err;
                /* Report as if there was no THP */
                return -ENOENT;
        }

