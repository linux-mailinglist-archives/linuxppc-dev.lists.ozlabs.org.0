Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CCE1F2CEC03
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 11:20:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CnTHK20DzzDr9T
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Dec 2020 21:20:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lu132nVP; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CnTFY2W5FzDqwy
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Dec 2020 21:18:56 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B4AA1I8104752; Fri, 4 Dec 2020 05:18:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=czuqcmkC/LZJLw7j4nXZR6bOYFd90nt1+Hi8oPivdY8=;
 b=lu132nVPj4LzWwetS+fwacKmGZAtBxSn6y7cB6haWgT64wP3kZHZldZ2x3RlcMesYKAg
 x5Qmwwx8D2GhwSEOChO6MbYnPvpUE8FYY25g3V4K25Cmy5Kny15qveRwyo9T8rNqY8W8
 M6riGnHJ1fKDw9yMQhdwtlUWWJmxlfzOBhInfpFgdVCNr7L1Ko5ep78OgUuRHq8RNEKz
 sHLO3WDCLokBfCo3enFVn5FDAgCnyAkryxi90ZB7PPTbou4bw6xy35BYbH0WYIlKIj02
 xxb62f8daGAlq7FszHHSQbi6Y8Ix/3E1KICGGq+NBrFHDsHGOxrQR/GcTYE2rbArLuN6 Hg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 357jc6s7ye-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 05:18:49 -0500
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B4AHpgm023039;
 Fri, 4 Dec 2020 10:18:47 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3573v9rpa4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 04 Dec 2020 10:18:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0B4AIjoo9175688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 4 Dec 2020 10:18:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D62311C050;
 Fri,  4 Dec 2020 10:18:45 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3231311C04C;
 Fri,  4 Dec 2020 10:18:44 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.71.48])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  4 Dec 2020 10:18:44 +0000 (GMT)
Date: Fri, 4 Dec 2020 15:48:41 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Alistair Popple <alistair@popple.id.au>
Subject: Re: [PATCH] powerpc/book3s_hv_uvmem: Check for failed page migration
Message-ID: <20201204101841.GA621541@in.ibm.com>
References: <20201203050812.5234-1-alistair@popple.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201203050812.5234-1-alistair@popple.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-12-04_03:2020-12-04,
 2020-12-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 clxscore=1011 lowpriorityscore=0 malwarescore=0 suspectscore=1
 mlxlogscore=999 spamscore=0 mlxscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012040057
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
Reply-To: bharata@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, Ram Pai <linuxram@us.ibm.com>
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

Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>

Did you actually hit this scenario with secure VMs where a UV-paged-in
page was later found to be not migratable?

Regards,
Bharata.
