Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 805A87CC0BD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 12:34:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=szyyRuQ0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S8r203Ffyz3vYG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Oct 2023 21:34:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=szyyRuQ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S8r146wlqz2xpm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Oct 2023 21:33:28 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39HATQxj021740;
	Tue, 17 Oct 2023 10:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Tlf+oTVxCcnecV21J9ROPtWMY0jET//PlIcawPM8rPk=;
 b=szyyRuQ0E4JmVuUI/lB8vjmMfqsU0X1R1LpR2JWxPvd4az5hxesqyj50QOwqs+5W/BUh
 W/vaKB/93VQCJxakFYW1CWdWK+yTFVBciezRQjYkWF29Z79IaFMKa/MxPLfKLIvE5Eaw
 O1Ugge6QvniAtEUKVr5tV/hPrjvr/045t1khPUjjoX55+x1NI/q82+0Li0ejfDnnqw3X
 p56Ci7a4ilM4z6P4Kr8Eiz64vQ347AYpuStWTHFYnjdRIBQ+er7KH0xCN69IIGMMM/im
 j3gQvUtVldwpdlUET+BSmPLJkk0kU8Cdbzc+oadHZQmhyNv2cr6UnpJO0c26/ftOWBYH rg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsrjd06eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 10:32:56 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39HATjPV023056;
	Tue, 17 Oct 2023 10:32:13 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tsrjd0550-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 10:32:08 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39H8t1vJ012871;
	Tue, 17 Oct 2023 10:31:10 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tr5py8d7j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Oct 2023 10:31:10 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39HAV6VV43713096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Oct 2023 10:31:06 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B49A92004B;
	Tue, 17 Oct 2023 10:31:06 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFC9720043;
	Tue, 17 Oct 2023 10:31:04 +0000 (GMT)
Received: from [9.43.86.173] (unknown [9.43.86.173])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 17 Oct 2023 10:31:04 +0000 (GMT)
Message-ID: <15e9830a-800f-24b3-29bc-af36fade447e@linux.ibm.com>
Date: Tue, 17 Oct 2023 16:01:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCHv9 1/2] powerpc/setup : Enable boot_cpu_hwid for PPC32
Content-Language: en-US
To: Pingfan Liu <piliu@redhat.com>, linuxppc-dev@lists.ozlabs.org
References: <20231017022806.4523-1-piliu@redhat.com>
 <20231017022806.4523-2-piliu@redhat.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <20231017022806.4523-2-piliu@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: WJ43DWB2YgHBkYCKaapMUY5DBcAXlxDQ
X-Proofpoint-GUID: oXFClmMtoBHp_6stgKRrmeldR4IApy7I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-16_13,2023-10-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxlogscore=999 adultscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 mlxscore=0 lowpriorityscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310170087
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 17/10/23 7:58 am, Pingfan Liu wrote:
> In order to identify the boot cpu, its intserv[] should be recorded and
> checked in smp_setup_cpu_maps().
> 
> smp_setup_cpu_maps() is shared between PPC64 and PPC32. Since PPC64 has
> already used boot_cpu_hwid to carry that information, enabling this
> variable on PPC32 so later it can also be used to carry that information
> for PPC32 in the coming patch.
> 
> Signed-off-by: Pingfan Liu <piliu@redhat.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Wen Xiong <wenxiong@us.ibm.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Ming Lei <ming.lei@redhat.com>
> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: kexec@lists.infradead.org
> To: linuxppc-dev@lists.ozlabs.org

LGTM.

Acked-by: Hari Bathini <hbathini@linux.ibm.com>

> ---
>   arch/powerpc/include/asm/smp.h     | 2 +-
>   arch/powerpc/kernel/prom.c         | 3 +--
>   arch/powerpc/kernel/setup-common.c | 2 --
>   3 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/smp.h
> index aaaa576d0e15..5db9178cc800 100644
> --- a/arch/powerpc/include/asm/smp.h
> +++ b/arch/powerpc/include/asm/smp.h
> @@ -26,7 +26,7 @@
>   #include <asm/percpu.h>
>   
>   extern int boot_cpuid;
> -extern int boot_cpu_hwid; /* PPC64 only */
> +extern int boot_cpu_hwid;
>   extern int spinning_secondaries;
>   extern u32 *cpu_to_phys_id;
>   extern bool coregroup_enabled;
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 0b5878c3125b..ec82f5bda908 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -372,8 +372,7 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>   	    be32_to_cpu(intserv[found_thread]));
>   	boot_cpuid = found;
>   
> -	if (IS_ENABLED(CONFIG_PPC64))
> -		boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);
> +	boot_cpu_hwid = be32_to_cpu(intserv[found_thread]);
>   
>   	/*
>   	 * PAPR defines "logical" PVR values for cpus that
> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 2f1026fba00d..707f0490639d 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -87,9 +87,7 @@ EXPORT_SYMBOL(machine_id);
>   int boot_cpuid = -1;
>   EXPORT_SYMBOL_GPL(boot_cpuid);
>   
> -#ifdef CONFIG_PPC64
>   int boot_cpu_hwid = -1;
> -#endif
>   
>   /*
>    * These are used in binfmt_elf.c to put aux entries on the stack
