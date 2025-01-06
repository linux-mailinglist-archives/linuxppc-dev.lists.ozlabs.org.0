Return-Path: <linuxppc-dev+bounces-4693-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE8CA02324
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 11:37:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRVws6q3xz2ydG;
	Mon,  6 Jan 2025 21:37:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736159821;
	cv=none; b=Jly4Ow34zvTcFDxdb6lCjWPJMRBwf1So0BvndiWGlosFG8wdVRcKxdnmNF8juIIwu3DYz+WWr1Z2BKDc/HdhOqGN2Kx7MSihS7SUsMv2pxYsCgvVAexmkAJUgrBNa5BCmHh2jM786GMdsfMAoeGimoTG8wTdwHFUf6+P+bJNjMOPJs1PASgwZ9MRkFfpRFrWtgvnQZVgW0j48vREjJk53diiSYKTuL4vyAXDR7U0E1KV0AE+FvH7HRT6+bzEJLcFOyvdEMyrJfQlJ5ffWYAEytIyGTSpPY0TL6qOuCQD5B0ZLNhDSC6Gy9e1QNTOrXXvZuWfjfEl90XG1j43ThG1Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736159821; c=relaxed/relaxed;
	bh=RryxP58J6OnCln8Pqlo5t61Qkdx5FcBQVf8+7yUkQC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j7c8NSJ1P1BEDm109maet5zvJpjoHCboZiCdE4HmPcplRn2buFg3lZKO8ASPzR1aQyFQzzFiyp948/fqZ3PxuQ9w/uTdRWeiH++4l4PxmhF3TBUzIShQqbSGzLxFUY2yS010WLb9dQUWYBAUzxH7UwBS4hfi7rM0Gn0sUzrRugt6jok+FD3wuugcDuV1nAnF7zENvOoRCsaae2xTcezTT2QwCB3K6sOjWVB/4Y1ZAxETHBT+yjcFyvZp4zMl8sIKK0+CcaDFkN2nKeWE897ZyEkGYLOHtOSlZkqFtS2RHDTGa35TDXfNYX5Nw8N/FFNm5nz+XR55TwiwIlHlGg/zgQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qBCXpVvd; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qBCXpVvd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRVwr65Q7z2y8P
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 21:37:00 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5068Lt7i026633;
	Mon, 6 Jan 2025 10:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=RryxP58J6OnCln8Pqlo5t61Qkdx5Fc
	BQVf8+7yUkQC4=; b=qBCXpVvdPbt+ywixcDwnQL6Z9ZlbqjoTKd2P0szWJ5PG7K
	HrQ1dU1lfCN1w8QdSGyr0DPgqO66Ie3q/rewjUdpPXV9XDc280aXNb7xaTJA7VBs
	Apmo4/OJijEJhq+G0tWODsOXDI0M6JF8OhuoQwzpyTtJ6p890/4l5MBsiXCoaPdA
	jWrav9CzXcn/gEDNtXvu3d6gHy7ENTCfUp3F/4dtHAicfe3a1lPqMC72/3iWTlQM
	92BjmrYfEN7dxjeYXZgtqtc4DB5H338vNnKVg4GId9wHaKoWlSUxSjz7nK2elinr
	7l9jgdC7oG1Qk16vMHzYBWtDa+b9EVRm1Gss1x4Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43yuj5360w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 10:36:31 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 506AVZkY030738;
	Mon, 6 Jan 2025 10:36:30 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43yuj5360r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 10:36:30 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5066jHrP027971;
	Mon, 6 Jan 2025 10:36:29 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yhhjw3xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Jan 2025 10:36:29 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 506AaRat55837070
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Jan 2025 10:36:28 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB29A20049;
	Mon,  6 Jan 2025 10:36:27 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6187320040;
	Mon,  6 Jan 2025 10:36:25 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.179.15.34])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  6 Jan 2025 10:36:25 +0000 (GMT)
Date: Mon, 6 Jan 2025 11:36:23 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: peterz@infradead.org, kevin.brodsky@arm.com, palmer@dabbelt.com,
        tglx@linutronix.de, david@redhat.com, jannh@google.com,
        hughd@google.com, yuzhao@google.com, willy@infradead.org,
        muchun.song@linux.dev, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
        akpm@linux-foundation.org, rientjes@google.com, vishal.moola@gmail.com,
        arnd@arndb.de, will@kernel.org, aneesh.kumar@kernel.org,
        npiggin@gmail.com, dave.hansen@linux.intel.com, rppt@kernel.org,
        ryan.roberts@arm.com, linux-mm@kvack.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-kernel@vger.kernel.org,
        x86@kernel.org, linux-arch@vger.kernel.org, linux-csky@vger.kernel.org,
        linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
        linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
        linux-openrisc@vger.kernel.org, linux-sh@vger.kernel.org,
        linux-um@lists.infradead.org
Subject: Re: [PATCH v4 12/15] s390: pgtable: also move pagetable_dtor() of
 PxD to __tlb_remove_table()
Message-ID: <Z3uyJ2BjslzsjkZI@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <cover.1735549103.git.zhengqi.arch@bytedance.com>
 <ad21b9392096336cf15aee46f68f9989a9cf877e.1735549103.git.zhengqi.arch@bytedance.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad21b9392096336cf15aee46f68f9989a9cf877e.1735549103.git.zhengqi.arch@bytedance.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RDtAwTXGBq-o50c3MhVc3_C2qJNd4B3w
X-Proofpoint-ORIG-GUID: BH90a8PnsJG6ZogqWB6Telp_r4uMcgo3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 impostorscore=0
 mlxlogscore=745 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501060093
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 30, 2024 at 05:07:47PM +0800, Qi Zheng wrote:
> To unify the PxD and PTE TLB free path, also move the pagetable_dtor() of
> PMD|PUD|P4D to __tlb_remove_table().

The above and Subject are still incorrect: pagetable_dtor() is
called from pagetable_dtor_free(), not from __tlb_remove_table().

...
> diff --git a/arch/s390/mm/pgalloc.c b/arch/s390/mm/pgalloc.c
> index 569de24d33761..c73b89811a264 100644
> --- a/arch/s390/mm/pgalloc.c
> +++ b/arch/s390/mm/pgalloc.c
> @@ -180,7 +180,7 @@ unsigned long *page_table_alloc(struct mm_struct *mm)
>  	return table;
>  }
>  
> -static void pagetable_pte_dtor_free(struct ptdesc *ptdesc)
> +static void pagetable_dtor_free(struct ptdesc *ptdesc)
>  {
>  	pagetable_dtor(ptdesc);
>  	pagetable_free(ptdesc);
> @@ -190,20 +190,14 @@ void page_table_free(struct mm_struct *mm, unsigned long *table)
>  {
>  	struct ptdesc *ptdesc = virt_to_ptdesc(table);
>  
> -	pagetable_pte_dtor_free(ptdesc);
> +	pagetable_dtor_free(ptdesc);
>  }
>  
>  void __tlb_remove_table(void *table)
>  {
>  	struct ptdesc *ptdesc = virt_to_ptdesc(table);
> -	struct page *page = ptdesc_page(ptdesc);
>  
> -	if (compound_order(page) == CRST_ALLOC_ORDER) {
> -		/* pmd, pud, or p4d */
> -		pagetable_free(ptdesc);
> -		return;
> -	}
> -	pagetable_pte_dtor_free(ptdesc);
> +	pagetable_dtor_free(ptdesc);
>  }

