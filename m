Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5307C272629
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 15:47:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bw5Mv3XcQzDqV8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 23:47:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NQD/UR4M; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bw5Jc1BGzzDqWL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 23:44:15 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08LDVlvQ137138; Mon, 21 Sep 2020 09:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=id9rJErrcsnFHTNf15KR9DYs+NEq1DNwc5GOafgjtyA=;
 b=NQD/UR4MyXTIbT/tRs/cCzgBLdG/YmIyTliRnQcU/th9cDh3Ps1FpRhxwzlRooNjC9Gy
 AoIAB5FvNEhgbJ2gd2H/ekWDcQUfSnFKx3hx3od8BgbxT6u08AZtU35yNH9FwQewTpOh
 zHKTnlu+M10sbkfyYD8kcNtolKmmu4a4mkyPB/t8B90miTTei9J7IGn4djv8aPIofnLA
 GDCIjkQR7iXtjEesojLS4jm+Se59DCxtVkOujxBAGLVgEPuUt5CRVIsf2DLF/+JmQEOY
 VxWalV+GAtM32khwJcXD6XXZ7+0xQvai6GZ+rTY0UDyYfCmTaS2Su+hgwOc2BAa27Sca 3g== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33pvvv8yqw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 09:43:54 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08LDh6qS003646;
 Mon, 21 Sep 2020 13:43:53 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma02dal.us.ibm.com with ESMTP id 33n9m8udkm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Sep 2020 13:43:53 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08LDhqBQ22151560
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Sep 2020 13:43:53 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DED95112062;
 Mon, 21 Sep 2020 13:43:52 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9BA1112061;
 Mon, 21 Sep 2020 13:43:51 +0000 (GMT)
Received: from localhost (unknown [9.85.203.227])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Mon, 21 Sep 2020 13:43:51 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Jing Xiangfeng <jingxiangfeng@huawei.com>, paulus@ozlabs.org,
 mpe@ellerman.id.au, benh@kernel.crashing.org
Subject: Re: [PATCH] KVM: PPC: Book3S: Remove redundant initialization of
 variable ret
In-Reply-To: <20200919071230.125798-1-jingxiangfeng@huawei.com>
References: <20200919071230.125798-1-jingxiangfeng@huawei.com>
Date: Mon, 21 Sep 2020 10:43:48 -0300
Message-ID: <87o8lzp7mz.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-21_05:2020-09-21,
 2020-09-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1011 phishscore=0
 mlxscore=0 suspectscore=1 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009210093
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, jingxiangfeng@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jing Xiangfeng <jingxiangfeng@huawei.com> writes:

> The variable ret is being initialized with '-ENOMEM' that is meaningless.
> So remove it.
>
> Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kvm/book3s_64_vio.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/book3s_64_vio.c b/arch/powerpc/kvm/book3s_64_vio.c
> index 1a529df0ab44..b277a75cd1be 100644
> --- a/arch/powerpc/kvm/book3s_64_vio.c
> +++ b/arch/powerpc/kvm/book3s_64_vio.c
> @@ -283,7 +283,7 @@ long kvm_vm_ioctl_create_spapr_tce(struct kvm *kvm,
>  	struct kvmppc_spapr_tce_table *siter;
>  	struct mm_struct *mm = kvm->mm;
>  	unsigned long npages, size = args->size;
> -	int ret = -ENOMEM;
> +	int ret;
>
>  	if (!args->size || args->page_shift < 12 || args->page_shift > 34 ||
>  		(args->offset + args->size > (ULLONG_MAX >> args->page_shift)))
