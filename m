Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 998202D2D01
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Dec 2020 15:22:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Cr2Sy6GP2zDqbs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 01:22:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=us.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=linuxram@us.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=us.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VWMaZ+r+; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Cr2QX0kHbzDqTL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 01:20:34 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B8E1asS096125; Tue, 8 Dec 2020 09:20:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 message-id : reply-to : references : mime-version : content-type :
 in-reply-to : subject; s=pp1;
 bh=z9GXfn9p6zVKDQVtxkSd2t1OXUvQ5i5LLE0iBIzfUSM=;
 b=VWMaZ+r+jRME14Suwgye7dHY4AZ4TshT4PRvjNfaxx6qeAQ0zieAOZYcM+dLg9kwk9bO
 rucGF/nUGzEHu7+sV/68IWia//NuvNqGRFNxrJv31QLxs/W1lIEJGX79VxOU63zTozd2
 nNiVS2Zd/QrGPE5btGZRgR+u1/Pa3+SbKe9e21RnRj4JUQxFl389Z1UbMf/jgjo2hsDm
 tV1UMTizRP7Qc1EOLylDbHRsEnyOCS1PIDLPLfa2UUNTWbO90XcX/BaEzBXA+Tn0RsJ8
 2UVDAwWNsFWSiFOZjAjRVNR70cOUuLeE1m0tJBE3b7tA58ottuOsyXM1xtj0nARJlU9E pQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35a5td23gw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 09:20:30 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B8EIWBd009806;
 Tue, 8 Dec 2020 14:20:29 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3581fhkn1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Dec 2020 14:20:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B8EKQcI27460056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Dec 2020 14:20:26 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 50798A4054;
 Tue,  8 Dec 2020 14:20:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4FD5BA405F;
 Tue,  8 Dec 2020 14:20:25 +0000 (GMT)
Received: from ram-ibm-com.ibm.com (unknown [9.80.235.251])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue,  8 Dec 2020 14:20:25 +0000 (GMT)
Date: Tue, 8 Dec 2020 06:20:22 -0800
From: Ram Pai <linuxram@us.ibm.com>
To: Alistair Popple <alistair@popple.id.au>
Message-ID: <20201208142022.GA4299@ram-ibm-com.ibm.com>
References: <20201203050812.5234-1-alistair@popple.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203050812.5234-1-alistair@popple.id.au>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-TM-AS-GCONF: 00
Subject: Re: [PATCH] powerpc/book3s_hv_uvmem: Check for failed page migration
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-08_09:2020-12-08,
 2020-12-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012080084
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
Reply-To: Ram Pai <linuxram@us.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, bharata@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 03, 2020 at 04:08:12PM +1100, Alistair Popple wrote:
> migrate_vma_pages() may still clear MIGRATE_PFN_MIGRATE on pages which
> are not able to be migrated. Drivers may safely copy data prior to
> calling migrate_vma_pages() however a remote mapping must not be
> established until after migrate_vma_pages() has returned as the
> migration could still fail.
> 
> UV_PAGE_IN_in both copies and maps the data page, therefore it should
> only be called after checking the results of migrate_vma_pages().
> 
> Signed-off-by: Alistair Popple <alistair@popple.id.au>
> ---
>  arch/powerpc/kvm/book3s_hv_uvmem.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_uvmem.c b/arch/powerpc/kvm/book3s_hv_uvmem.c
> index 84e5a2dc8be5..08aa6a90c525 100644
> --- a/arch/powerpc/kvm/book3s_hv_uvmem.c
> +++ b/arch/powerpc/kvm/book3s_hv_uvmem.c
> @@ -762,7 +762,10 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>  		goto out_finalize;
>  	}
> 
> -	if (pagein) {
> +	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> +	migrate_vma_pages(&mig);
> +
> +	if ((*mig.src & MIGRATE_PFN_MIGRATE) && pagein) {
>  		pfn = *mig.src >> MIGRATE_PFN_SHIFT;
>  		spage = migrate_pfn_to_page(*mig.src);
>  		if (spage) {
> @@ -773,8 +776,6 @@ static int kvmppc_svm_page_in(struct vm_area_struct *vma,
>  		}
>  	}
> 
> -	*mig.dst = migrate_pfn(page_to_pfn(dpage)) | MIGRATE_PFN_LOCKED;
> -	migrate_vma_pages(&mig);
>  out_finalize:
>  	migrate_vma_finalize(&mig);
>  	return ret;

Though this patch did not solve the specific problem, I am running into,
my tests did not expose any regression.

Tested-by: Ram Pai <linuxram@us.ibm.com>


Reviewed-by: Ram Pai <linuxram@us.ibm.com>
