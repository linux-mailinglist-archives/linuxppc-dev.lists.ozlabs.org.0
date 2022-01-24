Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC3E499CE4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 23:14:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjPRj597Nz3cRf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 09:14:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VOVXe++f;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=VOVXe++f; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjPR11hBGz2xYL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 09:14:21 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OKgMs1010615
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=irfJ4WByNTTml6Sp14UBLGICaOXXkBeBXUVEddFp3uk=;
 b=VOVXe++frwYIFNL2mtm1idQgzg9Q7ZVRNkh5WBPk7wTZUOU3nzK/d5YVyLj6gdBq4yKl
 nUaQUMgSdl7EQVcbR5BFO7s+7K3IYL6bZ9hzNt2JAMq5OrMgPzgdEsUkLFm5kPpBtRwJ
 pEIedwkVnRN4gmCaVrU1vtGi7yW9rLic6k8ydmor5o0WdVuQhI6wNOfxNqkvc3zukbSc
 mEinCarzsuzh8NRQNQFfypvEr8zyC7pTzytaH8vAo2ZKzOhb0lQwFaWUC6hyV1w4LERg
 uFlS0/Z6J8igAxi5TLwix6eIdEDSi7LG/bsGrQZc8kFNUP/TbkGWTIruOQ3Lkp9rqcL6 ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dt3cf9nvf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:14:18 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20OM7xWd023169
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 22:14:18 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dt3cf9nvd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:14:18 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OM79J8012342;
 Mon, 24 Jan 2022 22:14:17 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04dal.us.ibm.com with ESMTP id 3dr9j9srjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 22:14:17 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OMEGZJ32571816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 22:14:16 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 173A7AC062;
 Mon, 24 Jan 2022 22:14:16 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05009AC06B;
 Mon, 24 Jan 2022 22:14:14 +0000 (GMT)
Received: from localhost (unknown [9.163.24.67])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 24 Jan 2022 22:14:14 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/6] KVM: PPC: Book3S HV: Use IDA allocator for LPID
 allocator
In-Reply-To: <20220123120043.3586018-4-npiggin@gmail.com>
References: <20220123120043.3586018-1-npiggin@gmail.com>
 <20220123120043.3586018-4-npiggin@gmail.com>
Date: Mon, 24 Jan 2022 19:13:40 -0300
Message-ID: <87ilu8eq97.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 80M6lX6oc_UT4aDSdDHD7ytE57blV9Zz
X-Proofpoint-GUID: HoAFFTD-n-5kXRIS8q8dc9JYfz49FULa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_09,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=999
 suspectscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2201240143
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> This removes the fixed-size lpid_inuse array.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

>  arch/powerpc/kvm/powerpc.c | 25 +++++++++++++------------
>  1 file changed, 13 insertions(+), 12 deletions(-)
>
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 102993462872..c527a5751b46 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -2453,20 +2453,22 @@ long kvm_arch_vm_ioctl(struct file *filp,
>  	return r;
>  }
>
> -static unsigned long lpid_inuse[BITS_TO_LONGS(KVMPPC_NR_LPIDS)];
> +static DEFINE_IDA(lpid_inuse);
>  static unsigned long nr_lpids;
>
>  long kvmppc_alloc_lpid(void)
>  {
> -	long lpid;
> +	int lpid;
>
> -	do {
> -		lpid = find_first_zero_bit(lpid_inuse, KVMPPC_NR_LPIDS);
> -		if (lpid >= nr_lpids) {
> +	/* The host LPID must always be 0 (allocation starts at 1) */
> +	lpid = ida_alloc_range(&lpid_inuse, 1, nr_lpids - 1, GFP_KERNEL);
> +	if (lpid < 0) {
> +		if (lpid == -ENOMEM)
> +			pr_err("%s: Out of memory\n", __func__);
> +		else
>  			pr_err("%s: No LPIDs free\n", __func__);
> -			return -ENOMEM;
> -		}
> -	} while (test_and_set_bit(lpid, lpid_inuse));
> +		return -ENOMEM;
> +	}
>
>  	return lpid;
>  }
> @@ -2474,15 +2476,14 @@ EXPORT_SYMBOL_GPL(kvmppc_alloc_lpid);
>
>  void kvmppc_free_lpid(long lpid)
>  {
> -	clear_bit(lpid, lpid_inuse);
> +	ida_free(&lpid_inuse, lpid);
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_free_lpid);
>
> +/* nr_lpids_param includes the host LPID */
>  void kvmppc_init_lpid(unsigned long nr_lpids_param)
>  {
> -	nr_lpids = min_t(unsigned long, KVMPPC_NR_LPIDS, nr_lpids_param);
> -	memset(lpid_inuse, 0, sizeof(lpid_inuse));
> -	set_bit(0, lpid_inuse); /* The host LPID must always be 0 */
> +	nr_lpids = nr_lpids_param;
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_init_lpid);
