Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AC7228D8FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 05:21:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9yPN2S2lzDqM6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Oct 2020 14:21:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Vrrrsasx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9yMN6pBRzDqM6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 14:19:44 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 09E365GO187522; Tue, 13 Oct 2020 23:19:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=59X7e8xrmkS6q0uLUAi91FvJ9mkAGMIqvUFstlD/kzI=;
 b=VrrrsasxM+9qV/MNl0DQU2ozX4r6PHtQ4wF1Dquym4f2pPflsJBF03ZFcwSWFL/my4yb
 I87A2sLej7a1VA0n+li8oOWqnVSkiNtKT+YjXgX/IGFEtJSAW1ZJx7gAKI0NsuQBvRvW
 BIHXare/xbg6sZS57SrWtwBbd7S+qpo/20gm91fctIeSJITr9/QZOAiPyuCBhAENKSBX
 Rqu0wZKNcEkz8Xak5HT0fQ/Kv9+GpHRD3De3TWU2/INv3i9+AnhP/jYvn42QN05OVfpl
 /yfFIznIFwaeaCBqpOcaDJludm1EQLepus+Nqx1AtIE4jQfUa7yxz7tRfRtg7/6dJRWP TA== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 345qrateug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Oct 2020 23:19:33 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 09E3JRBl016518;
 Wed, 14 Oct 2020 03:19:31 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3434k7upa7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Oct 2020 03:19:31 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 09E3JSP335521000
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Oct 2020 03:19:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DFEDB11C050;
 Wed, 14 Oct 2020 03:19:28 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B6C311C04C;
 Wed, 14 Oct 2020 03:19:27 +0000 (GMT)
Received: from [9.85.69.185] (unknown [9.85.69.185])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Oct 2020 03:19:27 +0000 (GMT)
Subject: Re: [PATCH] powerpc/features: Remove CPU_FTR_NODSISRALIGN
To: Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <0346768708b69bdbfec82f6e5b0364962b9b6932.1602489812.git.christophe.leroy@csgroup.eu>
 <875z7ea8t7.fsf@linux.ibm.com>
 <cb22e9a8-4a8c-38d9-66f1-24af5ebd7520@csgroup.eu>
 <87wnzuzb1x.fsf@mpe.ellerman.id.au>
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Message-ID: <7b1f7fdd-0256-3370-13ab-d808b9fe9b02@linux.ibm.com>
Date: Wed, 14 Oct 2020 08:49:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <87wnzuzb1x.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-14_02:2020-10-13,
 2020-10-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2010140021
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/13/20 3:45 PM, Michael Ellerman wrote:
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>> Le 13/10/2020 à 09:23, Aneesh Kumar K.V a écrit :
>>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>>
>>>> CPU_FTR_NODSISRALIGN has not been used since
>>>> commit 31bfdb036f12 ("powerpc: Use instruction emulation
>>>> infrastructure to handle alignment faults")
>>>>
>>>> Remove it.
>>>>
>>>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>>> ---
>>>>    arch/powerpc/include/asm/cputable.h | 22 ++++++++++------------
>>>>    arch/powerpc/kernel/dt_cpu_ftrs.c   |  8 --------
>>>>    arch/powerpc/kernel/prom.c          |  2 +-
>>>>    3 files changed, 11 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
>>>> index 1098863e17ee..c598961d9f15 100644
>>>> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
>>>> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
>>>> @@ -273,13 +273,6 @@ static int __init feat_enable_idle_nap(struct dt_cpu_feature *f)
>>>>    	return 1;
>>>>    }
>>>>    
>>>> -static int __init feat_enable_align_dsisr(struct dt_cpu_feature *f)
>>>> -{
>>>> -	cur_cpu_spec->cpu_features &= ~CPU_FTR_NODSISRALIGN;
>>>> -
>>>> -	return 1;
>>>> -}
>>>> -
>>>>    static int __init feat_enable_idle_stop(struct dt_cpu_feature *f)
>>>>    {
>>>>    	u64 lpcr;
>>>> @@ -641,7 +634,6 @@ static struct dt_cpu_feature_match __initdata
>>>>    	{"tm-suspend-hypervisor-assist", feat_enable, CPU_FTR_P9_TM_HV_ASSIST},
>>>>    	{"tm-suspend-xer-so-bug", feat_enable, CPU_FTR_P9_TM_XER_SO_BUG},
>>>>    	{"idle-nap", feat_enable_idle_nap, 0},
>>>> -	{"alignment-interrupt-dsisr", feat_enable_align_dsisr, 0},
> 
> Rather than removing it entirely, I'd rather we left a comment, so that
> it's obvious that we are ignoring that feature on purpose, not because
> we forget about it.
> 
> eg:
> 
> diff --git a/arch/powerpc/kernel/dt_cpu_ftrs.c b/arch/powerpc/kernel/dt_cpu_ftrs.c
> index f204ad79b6b5..45cb7e59bd13 100644
> --- a/arch/powerpc/kernel/dt_cpu_ftrs.c
> +++ b/arch/powerpc/kernel/dt_cpu_ftrs.c
> @@ -640,7 +640,7 @@ static struct dt_cpu_feature_match __initdata
>   	{"tm-suspend-hypervisor-assist", feat_enable, CPU_FTR_P9_TM_HV_ASSIST},
>   	{"tm-suspend-xer-so-bug", feat_enable, CPU_FTR_P9_TM_XER_SO_BUG},
>   	{"idle-nap", feat_enable_idle_nap, 0},
> -	{"alignment-interrupt-dsisr", feat_enable_align_dsisr, 0},
> +	// "alignment-interrupt-dsisr" ignored
>   	{"idle-stop", feat_enable_idle_stop, 0},
>   	{"machine-check-power8", feat_enable_mce_power8, 0},
>   	{"performance-monitor-power8", feat_enable_pmu_power8, 0},
> 


why not do it as
static int __init feat_enable_align_dsisr(struct dt_cpu_feature *f)
{
	/* This feature should not be enabled */
#ifdef DEBUG
	WARN(1);
#endif

	return 1;
}


-aneesh
