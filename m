Return-Path: <linuxppc-dev+bounces-9881-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C063AEDCD0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 14:32:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bW5C934xRz2xS9;
	Mon, 30 Jun 2025 22:32:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751286741;
	cv=none; b=U1jlnmWZtjy+LpKAfdDbswILSxVk/u1K7aY/IBEBmrL2wyoIp97n2naBSTRqpCK9nmamIR+OxxtDzZncUWTcmYQ03lUM1f8jVVNlcOgS9aUDA3UEncCpzSC/d9qpwxKzyMaxtY3EAFnxuOhW4lZPLttleA6XIst0uq27hyPtaH7Mqg6cruOONMjp8JwcWTPDGvSJhHb1yAp6NhCByyXMDw/HgwOF9QF18EJ+uMVY4aS9sofHrOv0mFwo6BLS1jsnVuY9sdb+2gvnJ/BuWQesNaQJ30EHYcVR4L4YXdXunYoCkoxjMLsPaKJcCUEiJHJOXsPgCIRV/GQBC2T3G6QFDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751286741; c=relaxed/relaxed;
	bh=4/4W5HOVsxTPqI9wS6wr9RV849JR3+7l1M8P6DKnK7E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=caHNfDC+bGPrOyOQXQyBMdywNntz9+UxcaWjmM3pqbr6NgojJCLOP1YyVzkMwd2EOnm4pftchSo/kxLQJA4Ebv2m6/srEyyfaYfk0Tyvk9WrpJ5zzTGPReeE1XQ62aOE6meRuUaQRLoM6GfE6cwzypjBN6Wq3G5LjRoN3Yl1dEHtHPe816pcLJjT3FaZI/hLIk2Bhy7UJfu6T9TMHJw0tHHbA5L0vimZ6PVxzaVgt5t4bIabuCTH/vMQh6vAmkMyZPGnCRZ3DTdvjo+YpbA53IYQpCn5m6yZvritgo3g/I2RWCy5Zk/5mkolDqXj25JwBNz0dkAS7yBmfoa2ycfBZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LB8Vi2OA; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LB8Vi2OA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bW5C80gLGz2xQ4
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 22:32:19 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U6gHw4011086;
	Mon, 30 Jun 2025 12:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=4/4W5HOVsxTPqI9wS6wr9RV849JR3+
	7l1M8P6DKnK7E=; b=LB8Vi2OACgTppHxL4gQCI1A+GKWdbknClc9UVU5sjvPPbc
	dVnMk+PdxxmazNNLEQtJFsdNescZIPGdHqvmmzGuBgmu6MSVCrZlSLBO4sNnhKDC
	+TCO5g+SoawK8YYzgTA8R/AvZ5sR73DCwEG5xPkbipDLTYGjUj9bO7LbZhWQvo5s
	QBRCPI2tlSvfy5BrI8EFkTmv5L3qNiCmoCS9l4sFWI728JVtXwReVVFiMyagm30/
	557kETEAGIC1MZ/ITL0WFLL87P/j4L/6m5BHOqpRYCCxp1AQWQCJ/2kxdt46bpdH
	Op/+/fV+KYuSSWcGugl5NBqxkM2MsHlM4dqfaxJQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j82fh257-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 12:31:09 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55UCTi7R021773;
	Mon, 30 Jun 2025 12:31:09 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47j82fh254-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 12:31:08 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55U9adWG021906;
	Mon, 30 Jun 2025 12:31:08 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47juqpdspx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Jun 2025 12:31:07 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55UCV30356820034
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Jun 2025 12:31:03 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FB8B20043;
	Mon, 30 Jun 2025 12:31:03 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 35F6B2004B;
	Mon, 30 Jun 2025 12:31:02 +0000 (GMT)
Received: from li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com (unknown [9.155.204.135])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 30 Jun 2025 12:31:02 +0000 (GMT)
Date: Mon, 30 Jun 2025 14:31:00 +0200
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
Cc: ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
        dvyukov@google.com, vincenzo.frascino@arm.com, linux@armlinux.org.uk,
        catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
        kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, christophe.leroy@csgroup.eu,
        paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, hca@linux.ibm.com, gor@linux.ibm.com,
        borntraeger@linux.ibm.com, svens@linux.ibm.com, richard@nod.at,
        anton.ivanov@cambridgegreys.com, johannes@sipsolutions.net,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, chris@zankel.net, jcmvbkbc@gmail.com,
        akpm@linux-foundation.org, nathan@kernel.org,
        nick.desaulniers+lkml@gmail.com, morbo@google.com,
        justinstitt@google.com, arnd@arndb.de, rppt@kernel.org,
        geert@linux-m68k.org, mcgrof@kernel.org, guoweikang.kernel@gmail.com,
        tiwei.btw@antgroup.com, kevin.brodsky@arm.com, benjamin.berg@intel.com,
        kasan-dev@googlegroups.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        linux-s390@vger.kernel.org, linux-um@lists.infradead.org,
        linux-mm@kvack.org, llvm@lists.linux.dev
Subject: Re: [PATCH v2 01/11] kasan: unify static kasan_flag_enabled across
 modes
Message-ID: <aGKDhPBgDv2JjJZr@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com>
References: <20250626153147.145312-1-snovitoll@gmail.com>
 <20250626153147.145312-2-snovitoll@gmail.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626153147.145312-2-snovitoll@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: R7Lk-5oMpjro9s1CXJZKtYujyDGXFMxp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDEwMCBTYWx0ZWRfX2xhLgGojvA6t r8g7/ecZ+357bnq+V4oK+PEwZaj+zHbXyN+Ru1n3DrFdaSLAos0buS5jL9C1tta7atkJYiZIQaF 9sZWyxHNaJUrQqIMbo0QDjD1aBJf17TqXpAKHau1WcUR0r9MB3HXL9faXzF4lvrkQdsuGxUK17d
 z3tORR8HbmqzluxydjcIqwSK3SZaH8E4vH7dXCceoC74KSHRAZLLwuOQaLM4i+tX7f/u/Ckvpml 5uKodiLIM+IjigsvvYu04D4oduCbahyVPqy6GNw4VE+yf6xOzYsj1s/uUrTjsgyO/jp3mfjTdFr /qtf53aSQ4op7pY9TqPllefkk/R6721w5VzJc11hrTLtAQeHUx9tUD6J7VDv5TGalxp7Ob0FALy
 f7LBwFKXJq+utLCJBkCcPsmtnhAftjy9J/oYjEBrOgpvCYmkO++L/gKuaTAOTK1/jfEyvMMe
X-Authority-Analysis: v=2.4 cv=LpeSymdc c=1 sm=1 tr=0 ts=6862838d cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=kj9zAlcOel0A:10 a=6IFa9wvqVegA:10 a=mW8dxBt0ZUAMIGVGd2EA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: UVJc73yvgF4Y4S9SoMFvV1Dqh0my0GoM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_03,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 clxscore=1011
 impostorscore=0 mlxscore=0 mlxlogscore=999 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300100
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jun 26, 2025 at 08:31:37PM +0500, Sabyrzhan Tasbolatov wrote:

Hi Sabyrzhan,

> diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
> index d54e89f8c3e..32c432df24a 100644
> --- a/mm/kasan/generic.c
> +++ b/mm/kasan/generic.c
> @@ -36,6 +36,17 @@
>  #include "kasan.h"
>  #include "../slab.h"
>  
> +/*
> + * Initialize Generic KASAN and enable runtime checks.
> + * This should be called from arch kasan_init() once shadow memory is ready.
> + */
> +void __init kasan_init_generic(void)
> +{
> +	static_branch_enable(&kasan_flag_enabled);

s390 crashes at this line, when the whole series is applied.

FWIW, it looks like kasan is called while its state is not yet finalized.
E.g. whether calling __asan_report_store4_noabort() before kasan_init_generic()
is expected?

 32e0a54:       c0 e5 fe a9 70 56       brasl   %r14,80eb00 <__asan_report_store4_noabort>
 32e0a5a:       c4 28 ff cb bb a3       lgrl    %r2,2c581a0 <_GLOBAL_OFFSET_TABLE_+0x70c0>
        sort_extable(__start_amode31_ex_table, __stop_amode31_ex_table);        
 32e0a60:       a5 ac 00 1c             llihh   %r10,28                         
        init_task.kasan_depth = 0;                                              
 32e0a64:       e3 40 2b c8 01 71       lay     %r4,7112(%r2)                   
 32e0a6a:       e5 4c 40 00 00 00       mvhi    0(%r4),0                        
        kasan_init_generic();                                                   
 32e0a70:       c0 e5 00 01 e7 3c       brasl   %r14,331d8e8 <kasan_init_generic>

> +	pr_info("KernelAddressSanitizer initialized (generic)\n");
> +}

Thanks!

