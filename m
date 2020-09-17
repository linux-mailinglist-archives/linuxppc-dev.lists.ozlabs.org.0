Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 042DF26DD04
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 15:45:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsdWL1dpFzDqcK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 23:45:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rcardoso@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oSY3C4vz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsd606350zDqSC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 23:26:32 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HDCooo110326; Thu, 17 Sep 2020 09:26:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=AKX/J3U2n+xHqkduIYJWMRzT5du8dz6ywteyqFxkjIs=;
 b=oSY3C4vz9jIVOxhHXAbPbOxMAUohkneDP7Wxj3BPSeqQlmKdHNhoQhqoiAc35xLGoOks
 IJv4IK+opvJl6UyMxyXEuh6A2F7EGVpKEfYwYfHk8f7Wt64I6zsODPxgHwYmz2lSVDry
 MYVAoOpn+zkHKgWs8xiLXVo799ua+eHbcYzJ/CzdIpmP9fykMYzKgRYH3ro4V/EBW6dn
 g/0tUzcSrp6tnvGjGYgE43eOQmF65Fm/GBMALkWqccs/sgY2jlQT6LEQcsWykC/l3iKV
 D2f/xEF4/6wXf42LB8uNjgIYYxt/GcIanLFnrVkPMy+EQ36xZUKl6Z3j7A/0EGLaNNQk oA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33m8g0ge45-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 09:26:20 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08HDHCQx135484;
 Thu, 17 Sep 2020 09:26:20 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33m8g0ge3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 09:26:20 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08HDMjob028298;
 Thu, 17 Sep 2020 13:26:19 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 33k5v9gsxn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 13:26:19 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08HDQIRX45351348
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Sep 2020 13:26:18 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 506DAAE062;
 Thu, 17 Sep 2020 13:26:18 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D067AE05C;
 Thu, 17 Sep 2020 13:26:15 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.95.89])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Sep 2020 13:26:14 +0000 (GMT)
Subject: Re: [PATCH v6 7/8] powerpc/watchpoint/ptrace: Introduce
 PPC_DEBUG_FEATURE_DATA_BP_ARCH_31
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 christophe.leroy@c-s.fr
References: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
 <20200902042945.129369-8-ravi.bangoria@linux.ibm.com>
From: Rogerio Alves <rcardoso@linux.ibm.com>
Message-ID: <6868995a-0b93-d93c-5151-486ed602ac81@linux.ibm.com>
Date: Thu, 17 Sep 2020 10:26:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902042945.129369-8-ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_09:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 malwarescore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170098
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
Cc: mikey@neuling.org, jniethe5@gmail.com, pedromfc@linux.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, rogealve@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/2/20 1:29 AM, Ravi Bangoria wrote:
> PPC_DEBUG_FEATURE_DATA_BP_ARCH_31 can be used to determine whether
> we are running on an ISA 3.1 compliant machine. Which is needed to
> determine DAR behaviour, 512 byte boundary limit etc. This was
> requested by Pedro Miraglia Franco de Carvalho for extending
> watchpoint features in gdb. Note that availability of 2nd DAWR is
> independent of this flag and should be checked using
> ppc_debug_info->num_data_bps.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Tested-by: Rogerio Alves <rcardoso@linux.ibm.com>
> ---
>   Documentation/powerpc/ptrace.rst          | 1 +
>   arch/powerpc/include/uapi/asm/ptrace.h    | 1 +
>   arch/powerpc/kernel/ptrace/ptrace-noadv.c | 2 ++
>   3 files changed, 4 insertions(+)
> 
> diff --git a/Documentation/powerpc/ptrace.rst b/Documentation/powerpc/ptrace.rst
> index 864d4b6dddd1..77725d69eb4a 100644
> --- a/Documentation/powerpc/ptrace.rst
> +++ b/Documentation/powerpc/ptrace.rst
> @@ -46,6 +46,7 @@ features will have bits indicating whether there is support for::
>     #define PPC_DEBUG_FEATURE_DATA_BP_RANGE		0x4
>     #define PPC_DEBUG_FEATURE_DATA_BP_MASK		0x8
>     #define PPC_DEBUG_FEATURE_DATA_BP_DAWR		0x10
> +  #define PPC_DEBUG_FEATURE_DATA_BP_ARCH_31		0x20
>   
>   2. PTRACE_SETHWDEBUG
>   
> diff --git a/arch/powerpc/include/uapi/asm/ptrace.h b/arch/powerpc/include/uapi/asm/ptrace.h
> index f5f1ccc740fc..7004cfea3f5f 100644
> --- a/arch/powerpc/include/uapi/asm/ptrace.h
> +++ b/arch/powerpc/include/uapi/asm/ptrace.h
> @@ -222,6 +222,7 @@ struct ppc_debug_info {
>   #define PPC_DEBUG_FEATURE_DATA_BP_RANGE		0x0000000000000004
>   #define PPC_DEBUG_FEATURE_DATA_BP_MASK		0x0000000000000008
>   #define PPC_DEBUG_FEATURE_DATA_BP_DAWR		0x0000000000000010
> +#define PPC_DEBUG_FEATURE_DATA_BP_ARCH_31	0x0000000000000020
>   
>   #ifndef __ASSEMBLY__
>   
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-noadv.c b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
> index 48c52426af80..aa36fcad36cd 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace-noadv.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace-noadv.c
> @@ -57,6 +57,8 @@ void ppc_gethwdinfo(struct ppc_debug_info *dbginfo)
>   	} else {
>   		dbginfo->features = 0;
>   	}
> +	if (cpu_has_feature(CPU_FTR_ARCH_31))
> +		dbginfo->features |= PPC_DEBUG_FEATURE_DATA_BP_ARCH_31;
>   }
>   
>   int ptrace_get_debugreg(struct task_struct *child, unsigned long addr,
> 
