Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7F283FDE2A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 17:00:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H06gM4lPlz2yPT
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Sep 2021 01:00:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lO5+1LsN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=lO5+1LsN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H06fg2w5Sz2xrK
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Sep 2021 00:59:55 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 181EXajC176326; Wed, 1 Sep 2021 10:59:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=DE+zEGVSgps8UbDhuMftMtxqsMyLrYMHG/Y1RglHNuo=;
 b=lO5+1LsNAgq2jj+YeNk6nrf6n0/Uq+AtYf9r5dKoCkqc18EhyHhK9OwXae35LaNd9a5/
 gpgV+sUPeyNmz58mWQyrwmonpBPn4HyrMofNd7iFzHlV6hYy7yekZwWeHRHR6+AZBvxw
 10Z4v1FAE4a+FuLjAVx3onpraJ8w8JeSXwfUaRRTPm4eeE+gB1UvJb8q2VQ3+z0m0Bgk
 WuQqvSFqU0wtEJIBbcYRt7pOGxayAk2qSfUn7fyQrkW9Zp/26yc50O1KpV4oX3JPnEYa
 6u46ohkNAbb000IVe95ZuLLwYduihdSXViZgDSgLaHaqhxw242BAOmHR2HXGiqst8Ei0 jA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3atawast66-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 10:59:52 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 181EulqT007141;
 Wed, 1 Sep 2021 14:59:52 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 3aqcse6c63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 01 Sep 2021 14:59:51 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 181ExoXk36897200
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 1 Sep 2021 14:59:50 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC314112070;
 Wed,  1 Sep 2021 14:59:50 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AEA0D112067;
 Wed,  1 Sep 2021 14:59:49 +0000 (GMT)
Received: from localhost (unknown [9.211.58.54])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Wed,  1 Sep 2021 14:59:49 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel] KVM: PPC: Book3S: Suppress warnings when
 allocating too big memory slots
In-Reply-To: <20210901084512.1658628-1-aik@ozlabs.ru>
References: <20210901084512.1658628-1-aik@ozlabs.ru>
Date: Wed, 01 Sep 2021 11:59:47 -0300
Message-ID: <87fsuouysc.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 9DQBmeqPLuaSHabJAhppr2AOjPjnuUJ6
X-Proofpoint-ORIG-GUID: 9DQBmeqPLuaSHabJAhppr2AOjPjnuUJ6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-01_04:2021-09-01,
 2021-09-01 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxscore=0 phishscore=0 spamscore=0
 impostorscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2109010085
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> The userspace can trigger "vmalloc size %lu allocation failure: exceeds
> total pages" via the KVM_SET_USER_MEMORY_REGION ioctl.
>
> This silences the warning by checking the limit before calling vzalloc()
> and returns ENOMEM if failed.
>
> This does not call underlying valloc helpers as __vmalloc_node() is only
> exported when CONFIG_TEST_VMALLOC_MODULE and __vmalloc_node_range() is not
> exported at all.
>
> Spotted by syzkaller.
>
> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 474c0cfde384..a59f1cccbcf9 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4830,8 +4830,12 @@ static int kvmppc_core_prepare_memory_region_hv(struct kvm *kvm,
>  	unsigned long npages = mem->memory_size >> PAGE_SHIFT;
>
>  	if (change == KVM_MR_CREATE) {
> -		slot->arch.rmap = vzalloc(array_size(npages,
> -					  sizeof(*slot->arch.rmap)));
> +		unsigned long cb = array_size(npages, sizeof(*slot->arch.rmap));

What does cb mean?

> +
> +		if ((cb >> PAGE_SHIFT) > totalram_pages())
> +			return -ENOMEM;
> +
> +		slot->arch.rmap = vzalloc(cb);
>  		if (!slot->arch.rmap)
>  			return -ENOMEM;
>  	}
