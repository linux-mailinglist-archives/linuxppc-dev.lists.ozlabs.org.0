Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D929691E35
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 12:28:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PCs191XMKz3f5L
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Feb 2023 22:28:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dw+0IO2W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Dw+0IO2W;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PCrzY3Vm7z3f49
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Feb 2023 22:26:49 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31ABG5Pi026504;
	Fri, 10 Feb 2023 11:26:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=PDlk0D7jtHg5XdCCmFXYh2WXyS9oePq9MJwop7nyH8E=;
 b=Dw+0IO2Wj3WebNM2P3EybMOhwgqEqxww5npD6gI9tWSt+2SY4vXuXr8FJ6/+LsTys6NY
 6IoMOZ1g+wdzZnjP29hY4Agcr/8+Q1ADiUJuyNPrHq0Vg7R4g96ZcELlhU+CgaLNonbu
 IMawj03koPPHSL+4SCUkvpBtLzDnFd9H9k2jsITbflKOrMFj/rlmxWztt/w3poc10dVF
 Vdur3Z6UPDbbKY1gyOkt7rIW1mg9jaEJHqxPjy7zO68b2Okn9j8+lLFA0Bz47dEPIaS5
 BII4/Fc580tZU15egAl4qCadjpW0Fi1YZO+lr+uch72avaMQP/zrUbJ9m3p8CSqobGvN Bw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnmw707vk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 11:26:40 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31ABKe6b011502;
	Fri, 10 Feb 2023 11:26:40 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nnmw707us-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 11:26:40 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31A6KK1E021016;
	Fri, 10 Feb 2023 11:26:38 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3nhemfqe0p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Feb 2023 11:26:38 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31ABQZZe46006614
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Feb 2023 11:26:35 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CAC1720040;
	Fri, 10 Feb 2023 11:26:35 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 728752004B;
	Fri, 10 Feb 2023 11:26:33 +0000 (GMT)
Received: from [9.109.198.193] (unknown [9.109.198.193])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 10 Feb 2023 11:26:33 +0000 (GMT)
Message-ID: <c6349040-17ad-6066-0f8a-8adeb9c7b48d@linux.ibm.com>
Date: Fri, 10 Feb 2023 16:56:31 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH AUTOSEL 6.1 18/38] powerpc/kvm: Fix unannotated
 intra-function call warning
Content-Language: en-US
To: Sasha Levin <sashal@kernel.org>, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20230209111459.1891941-1-sashal@kernel.org>
 <20230209111459.1891941-18-sashal@kernel.org>
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <20230209111459.1891941-18-sashal@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: e7Fi0IJtnkUsmDtiZRfCjIT8jVXwAPrS
X-Proofpoint-GUID: Nf9ZfHZLoL5hRe2ZmwEMvkHZ4HvWhx8g
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-10_06,2023-02-09_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 malwarescore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 lowpriorityscore=0 clxscore=1031 impostorscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302100093
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
Cc: kernel test robot <lkp@intel.com>, npiggin@gmail.com, Sathvika Vasireddy <sv@linux.ibm.com>, seanjc@google.com, pbonzini@redhat.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Sasha,

On 09/02/23 16:44, Sasha Levin wrote:
> From: Sathvika Vasireddy <sv@linux.ibm.com>
>
> [ Upstream commit fe6de81b610e5d0b9d2231acff2de74a35482e7d ]
>
> objtool throws the following warning:
>    arch/powerpc/kvm/booke.o: warning: objtool: kvmppc_fill_pt_regs+0x30:
>    unannotated intra-function call
>
> Fix the warning by setting the value of 'nip' using the _THIS_IP_ macro,
> without using an assembly bl/mflr sequence to save the instruction
> pointer.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Suggested-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://lore.kernel.org/r/20230128124158.1066251-1-sv@linux.ibm.com
> Signed-off-by: Sasha Levin <sashal@kernel.org>
> ---
>   arch/powerpc/kvm/booke.c | 5 ++---
>   1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
> index 7b4920e9fd263..3852209989f04 100644
> --- a/arch/powerpc/kvm/booke.c
> +++ b/arch/powerpc/kvm/booke.c
> @@ -912,16 +912,15 @@ static int kvmppc_handle_debug(struct kvm_vcpu *vcpu)
>   
>   static void kvmppc_fill_pt_regs(struct pt_regs *regs)
>   {
> -	ulong r1, ip, msr, lr;
> +	ulong r1, msr, lr;
>   
>   	asm("mr %0, 1" : "=r"(r1));
>   	asm("mflr %0" : "=r"(lr));
>   	asm("mfmsr %0" : "=r"(msr));
> -	asm("bl 1f; 1: mflr %0" : "=r"(ip));
>   
>   	memset(regs, 0, sizeof(*regs));
>   	regs->gpr[1] = r1;
> -	regs->nip = ip;
> +	regs->nip = _THIS_IP_;
>   	regs->msr = msr;
>   	regs->link = lr;
>   }

Please drop this patch because objtool enablement patches for powerpc 
are not a part of kernel v6.1


Thanks,
Sathvika

