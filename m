Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A4F691E2F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 12:27:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCrzz3stPz3f5k
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 22:27:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FdvYCAjy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FdvYCAjy;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCrz01Ltxz3cdW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 22:26:19 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31ABFPcq013092;
	Fri, 10 Feb 2023 11:26:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=cD/X9nIeMMmFjHYm4VPov7vFFV03gYaj32qdcgmLvJE=;
 b=FdvYCAjyH0yNGCW0O6sA94ph/wPLjudsHzWwgK/J4m7mHi5KFSbIW1t8l0C7trg6V0jb
 Ml8+/ruk5On2x38DBugRq69wh/Tzz2NZzO++E40PqcQ06pklQZJuqWtZjsQQv+llwEdg
 C8hUISmJdaSxtnz923gAoQpep+1PedMqp94b0Bh8Eeo855gQLXuSOlqHChxG9fZKMcO2
 1p2wjfzAX41N4Y+x+2DN73KhkUNV6RD9/KPhsHPp4wuFKjMzFAc+NY5PyQADiWwgBTbF
 R66r8fusXp/BCWR0spcJNhXV/Njl8704pYk2JWODP0d257Rq/xl7lOQ3dB4bFpn+jsdl yg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnmw0g8jx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 11:26:04 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31ABPDui022485;
	Fri, 10 Feb 2023 11:26:03 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnmw0g8jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 11:26:03 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 319NbWJs026034;
	Fri, 10 Feb 2023 11:26:01 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3nhf06wa04-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 11:26:01 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31ABPxlf25166532
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 11:25:59 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 424C920040;
	Fri, 10 Feb 2023 11:25:59 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 039F620049;
	Fri, 10 Feb 2023 11:25:57 +0000 (GMT)
Received: from [9.109.198.193] (unknown [9.109.198.193])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Feb 2023 11:25:56 +0000 (GMT)
Message-ID: <288e133f-f740-6818-8125-8079217ab822@linux.ibm.com>
Date: Fri, 10 Feb 2023 16:55:54 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH AUTOSEL 6.1 17/38] powerpc/85xx: Fix unannotated
 intra-function call warning
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20230209111459.1891941-1-sashal@kernel.org>
 <20230209111459.1891941-17-sashal@kernel.org>
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <20230209111459.1891941-17-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: kp2fJvuJzSqkN5r85yXu86qrvSGQXP-s
X-Proofpoint-ORIG-GUID: CYuRFdlv5KJPoQaw9Kri-fW_bNc2VOrc
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_06,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0 mlxlogscore=970
 bulkscore=0 malwarescore=0 priorityscore=1501 clxscore=1031 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302100088
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
Cc: kernel test robot <lkp@intel.com>, npiggin@gmail.com, Sathvika Vasireddy <sv@linux.ibm.com>, naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sasha,

On 09/02/23 16:44, Sasha Levin wrote:
> From: Sathvika Vasireddy <sv@linux.ibm.com>
>
> [ Upstream commit 8afffce6aa3bddc940ac1909627ff1e772b6cbf1 ]
>
> objtool throws the following warning:
>    arch/powerpc/kernel/head_85xx.o: warning: objtool: .head.text+0x1a6c:
>    unannotated intra-function call
>
> Fix the warning by annotating KernelSPE symbol with SYM_FUNC_START_LOCAL
> and SYM_FUNC_END macros.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://lore.kernel.org/r/20230128124138.1066176-1-sv@linux.ibm.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   arch/powerpc/kernel/head_85xx.S | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
> index 52c0ab416326a..d3939849f4550 100644
> --- a/arch/powerpc/kernel/head_85xx.S
> +++ b/arch/powerpc/kernel/head_85xx.S
> @@ -862,7 +862,7 @@ _GLOBAL(load_up_spe)
>    * SPE unavailable trap from kernel - print a message, but let
>    * the task use SPE in the kernel until it returns to user mode.
>    */
> -KernelSPE:
> +SYM_FUNC_START_LOCAL(KernelSPE)
>   	lwz	r3,_MSR(r1)
>   	oris	r3,r3,MSR_SPE@h
>   	stw	r3,_MSR(r1)	/* enable use of SPE after return */
> @@ -879,6 +879,7 @@ KernelSPE:
>   #endif
>   	.align	4,0
>   
> +SYM_FUNC_END(KernelSPE)
>   #endif /* CONFIG_SPE */
>   
>   /*

Please drop this patch because objtool enablement patches for powerpc 
are not a part of kernel v6.1.

Thanks,
Sathvika
