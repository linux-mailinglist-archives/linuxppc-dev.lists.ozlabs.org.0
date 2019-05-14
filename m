Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 359D31E530
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 00:36:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453Xc60yB7zDqPM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:36:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=tyreld@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453XZs6qdnzDqLt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 08:35:49 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4EMQuuH076938
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 18:35:45 -0400
Received: from e17.ny.us.ibm.com (e17.ny.us.ibm.com [129.33.205.207])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sg31106h1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 18:35:45 -0400
Received: from localhost
 by e17.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <tyreld@linux.vnet.ibm.com>;
 Tue, 14 May 2019 23:35:44 +0100
Received: from b01cxnp22036.gho.pok.ibm.com (9.57.198.26)
 by e17.ny.us.ibm.com (146.89.104.204) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 May 2019 23:35:42 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4EMZfJ617367254
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 22:35:41 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56E7CAC066;
 Tue, 14 May 2019 22:35:41 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82C97AC06C;
 Tue, 14 May 2019 22:35:40 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.80.212.150])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 22:35:40 +0000 (GMT)
Subject: Re: [RFC PATCH 1/3] powerpc/mm: Handle page table allocation failures
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, npiggin@gmail.com,
 paulus@samba.org, mpe@ellerman.id.au
References: <20190514145041.7836-1-aneesh.kumar@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Date: Tue, 14 May 2019 15:35:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190514145041.7836-1-aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19051422-0040-0000-0000-000004EFA535
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011099; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01203386; UDB=6.00631654; IPR=6.00984309; 
 MB=3.00026893; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-14 22:35:43
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051422-0041-0000-0000-000008FBB38F
Message-Id: <b633907a-453f-a96f-b23d-4981e936e885@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=998 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140147
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/14/2019 07:50 AM, Aneesh Kumar K.V wrote:
> This fixes the below crash that arises due to not handling page table allocation
> failures while allocating hugetlb page table.

Was there supposed to be a oops stack trace attached here in the commit log?

-Tyrel

> 
> Fixes: e2b3d202d1db ("powerpc: Switch 16GB and 16MB explicit hugepages to a different page table format")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/mm/hugetlbpage.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
> index c5c9ff2d7afc..ae9d71da5219 100644
> --- a/arch/powerpc/mm/hugetlbpage.c
> +++ b/arch/powerpc/mm/hugetlbpage.c
> @@ -130,6 +130,8 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz
>  	} else {
>  		pdshift = PUD_SHIFT;
>  		pu = pud_alloc(mm, pg, addr);
> +		if (!pu)
> +			return NULL;
>  		if (pshift == PUD_SHIFT)
>  			return (pte_t *)pu;
>  		else if (pshift > PMD_SHIFT) {
> @@ -138,6 +140,8 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz
>  		} else {
>  			pdshift = PMD_SHIFT;
>  			pm = pmd_alloc(mm, pu, addr);
> +			if (!pm)
> +				return NULL;
>  			if (pshift == PMD_SHIFT)
>  				/* 16MB hugepage */
>  				return (pte_t *)pm;
> @@ -154,12 +158,16 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz
>  	} else {
>  		pdshift = PUD_SHIFT;
>  		pu = pud_alloc(mm, pg, addr);
> +		if (!pu)
> +			return NULL;
>  		if (pshift >= PUD_SHIFT) {
>  			ptl = pud_lockptr(mm, pu);
>  			hpdp = (hugepd_t *)pu;
>  		} else {
>  			pdshift = PMD_SHIFT;
>  			pm = pmd_alloc(mm, pu, addr);
> +			if (!pm)
> +				return NULL;
>  			ptl = pmd_lockptr(mm, pm);
>  			hpdp = (hugepd_t *)pm;
>  		}
> 

