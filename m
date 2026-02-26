Return-Path: <linuxppc-dev+bounces-17278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iBVjJ05XoGkNigQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17278-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 15:23:10 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E17641A7706
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 15:23:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMDFh4mCPz2yFd;
	Fri, 27 Feb 2026 01:23:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.174
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772115784;
	cv=none; b=ESgM5PQ3rbGf63tsWbGkUoTzW6r0m2TJQsaFtZowUDDN51fjsdIiktQzXM7SU3y8B153o23eoiR5g7JiCVS2q0aQnQUdMnJ7mwPM2cPJGC7akdcqgFbh1eMh7D+sefWBVpABvIk51QUapUPFkmu2+uxPDwcU9Kp3cXMiTtGK9TVqNUvGBxFsCDl5rCkKn+H85rlIjPQxFMgMPFUXNXST4msGAdhBcBfzsE4LKV/4BvItcOwALA4P8ODAFMB39/kehcxggU6cMRv6LDkcENm/1Pdq9Hmiw36kBKKwNFqUhhBV6osGMtqjZBo7y2fRXZ3DntsgPoC1Qr4Wg1XZGVtsDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772115784; c=relaxed/relaxed;
	bh=jb9YPiWuPBlQARNsplGopujxVA0bSVtV2JHBgzvaymY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBHKwXcm0DXDUq2mYKL9xlDIg6HYNEXfAbj3deiMjCLuyYvwyzFTIFEV7mxsDEQAsvOjv8mbeACSWLS7WMJYi+gNNrVadnj6Xl6DTjgvouwDkKsvX5DUFy4IvKVddDVPkwVikeynyJ1uNAFHF2LjrizTpSadugyZY701aY0VRXYooDbtG9ghis4CsLM4acHu6myGu9VGXURbW0RBvmPD3Swav/Vd2ocXPxA6eYl+1Gymbw2VNvwnA2p2HMElnePdo7I8FJa5lSCEeWw+kCQlnJtmKojHVwSk8fsnhlXyNySF+Dre2B/LeWtP5Alh2aHT1I6tKoRN+N8dlY1MiinZWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jKgAMrXK; dkim-atps=neutral; spf=pass (client-ip=91.218.175.174; helo=out-174.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=jKgAMrXK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.174; helo=out-174.mta0.migadu.com; envelope-from=usama.arif@linux.dev; receiver=lists.ozlabs.org)
Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMDFd5llzz2xHX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 01:23:00 +1100 (AEDT)
Message-ID: <a108bab5-9b53-4b90-a102-cc6fc22bb389@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1772115759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jb9YPiWuPBlQARNsplGopujxVA0bSVtV2JHBgzvaymY=;
	b=jKgAMrXKDp/fFQ5Qy0F4SHLZDHjfhKJDxbbLLtY+pveidJYQS4BwYY5icSGR6bqLh7c5yL
	dRolPPiOmwgxNE75HXCcD1jdE8X5lC5Ks2p9bLaV8lOOd+HsPb3Y+wLrYQFX6TZc3A8yHY
	9Srq/4+a9GOfDAKt9fJHnlcntrkPyq0=
Date: Thu, 26 Feb 2026 14:22:35 +0000
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
Subject: Re: [RFC v2 16/21] mm: thp: add THP_SPLIT_PMD_FAILED counter
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
 <20260226113233.3987674-17-usama.arif@linux.dev>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Usama Arif <usama.arif@linux.dev>
In-Reply-To: <20260226113233.3987674-17-usama.arif@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linux.dev,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[linux.dev:s=key1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17278-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[usama.arif@linux.dev,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[29];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:willy@infradead.org,m:linux-mm@kvack.org,m:fvdl@google.com,m:hannes@cmpxchg.org,m:riel@surriel.com,m:shakeel.butt@linux.dev,m:kas@kernel.org,m:baohua@kernel.org,m:dev.jain@arm.com,m:baolin.wang@linux.alibaba.com,m:npache@redhat.com,m:Liam.Howlett@oracle.com,m:ryan.roberts@arm.com,m:vbabka@kernel.org,m:lance.yang@linux.dev,m:linux-kernel@vger.kernel.org,m:kernel-team@meta.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:linuxppc-dev@lists.ozlabs.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:linux-s390@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[linux.dev:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:mid,linux.dev:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: E17641A7706
X-Rspamd-Action: no action



On 26/02/2026 11:23, Usama Arif wrote:
> diff --git a/mm/rmap.c b/mm/rmap.c
> index 2519d579bc1d8..2dae46fff08ae 100644
> --- a/mm/rmap.c
> +++ b/mm/rmap.c
> @@ -2067,8 +2067,10 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
>  				pgtable_t pgtable = prealloc_pte;
>  
>  				prealloc_pte = NULL;
> +
>  				if (!arch_needs_pgtable_deposit() && !pgtable &&
>  				    vma_is_anonymous(vma)) {
> +					count_vm_event(THP_SPLIT_PMD_FAILED);
>  					page_vma_mapped_walk_done(&pvmw);
>  					ret = false;
>  					break;
> @@ -2471,6 +2473,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
>  				prealloc_pte = NULL;
>  				if (!arch_needs_pgtable_deposit() && !pgtable &&
>  				    vma_is_anonymous(vma)) {
> +					count_vm_event(THP_SPLIT_PMD_FAILED);
>  					page_vma_mapped_walk_done(&pvmw);
>  					ret = false;
>  					break;
This will need to be guarded by CONFIG_TRANSPARENT_HUGEPAGE. Will need below diff in next series..

diff --git a/mm/rmap.c b/mm/rmap.c
index 2dae46fff08ae..9d74600951cf6 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -2070,7 +2070,9 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 
                                if (!arch_needs_pgtable_deposit() && !pgtable &&
                                    vma_is_anonymous(vma)) {
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE)
                                        count_vm_event(THP_SPLIT_PMD_FAILED);
+#endif
                                        page_vma_mapped_walk_done(&pvmw);
                                        ret = false;
                                        break;
@@ -2473,7 +2475,9 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
                                prealloc_pte = NULL;
                                if (!arch_needs_pgtable_deposit() && !pgtable &&
                                    vma_is_anonymous(vma)) {
+#if defined(CONFIG_TRANSPARENT_HUGEPAGE)
                                        count_vm_event(THP_SPLIT_PMD_FAILED);
+#endif
                                        page_vma_mapped_walk_done(&pvmw);
                                        ret = false;
                                        break;

