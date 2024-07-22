Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4318B9391B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2024 17:25:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YJ7k8ixz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WSPGh1dTwz3cYr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 01:25:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YJ7k8ixz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=quic_jjohnson@quicinc.com; receiver=lists.ozlabs.org)
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WSPFz4lXgz2ysd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 01:24:21 +1000 (AEST)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46MAoGVb009490;
	Mon, 22 Jul 2024 15:23:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5XcYVp0fth3+xLeWpTP085l2qx7SpUWkFbC/bEVSgh0=; b=YJ7k8ixzmW3ULrvA
	IVNKT5b2yM522q+04JZvfhBcjACnSkQP7xEoG8t5QDfb/32E8gH0efxS7Cb2dPRJ
	Vjk5CZdakCHlAA4IgntX/R5t6FF7BGmnU1EB4u3TwilwploBCjsr1Xi2ReBwsL5f
	mJoYVCoXluFotgZqDC7gaQEzSOFGextauVa9+60jY+AdlfgZC4KcnJlx5SwLtk6Z
	PwFSxxCMBJl8k/ET0gaUL0XZbEa+4CHSLatJpKmD6VZ3xRHAbpr5T02pGAYrKZe/
	DP+KlAzsJtiavu2HynVFgPB14kEzpyv0Xcxi2SgrCnZ9Lkm8bo1nO0Q63KKlK+8t
	d5rWLA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g6djv2k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 15:23:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46MFNZr6009829
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Jul 2024 15:23:35 GMT
Received: from [10.48.244.127] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Jul
 2024 08:23:34 -0700
Message-ID: <5f57a034-71fb-4b6a-a718-3dd323d72f7a@quicinc.com>
Date: Mon, 22 Jul 2024 08:23:33 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] cpufreq: powerpc: add missing MODULE_DESCRIPTION() macros
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
        "Rafael J. Wysocki"
	<rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Nicholas Piggin
	<npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen
 N. Rao" <naveen.n.rao@linux.ibm.com>
References: <20240614-md-powerpc-drivers-cpufreq-v1-1-de4034d87fd2@quicinc.com>
 <87bk2px5jk.fsf@mail.lhotse>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <87bk2px5jk.fsf@mail.lhotse>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1YDudvbZknYUxr0zHSJkfb_rRf_8OgWd
X-Proofpoint-ORIG-GUID: 1YDudvbZknYUxr0zHSJkfb_rRf_8OgWd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-22_10,2024-07-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 suspectscore=0 impostorscore=0 phishscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 adultscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407220116
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
Cc: kernel-janitors@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/22/2024 12:13 AM, Michael Ellerman wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>> With ARCH=powerpc, make allmodconfig && make W=1 C=1 reports:
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/ppc-cbe-cpufreq.o
>> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/cpufreq/powernv-cpufreq.o
>>
>> Add the missing invocation of the MODULE_DESCRIPTION() macro to all
>> files which have a MODULE_LICENSE().
>>
>> This includes three additional files which, although they did not
>> produce a warning with the powerpc allmodconfig configuration, may
>> cause this warning with specific options enabled in the kernel
>> configuration.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> ---
>> Corrections to these descriptions are welcomed. I'm not an expert in
>> this code so in most cases I've taken these descriptions directly from
>> code comments, Kconfig descriptions, or git logs.  History has shown
>> that in some cases these are originally wrong due to cut-n-paste
>> errors, and in other cases the drivers have evolved such that the
>> original information is no longer accurate.
>> ---
>>  drivers/cpufreq/maple-cpufreq.c   | 1 +
>>  drivers/cpufreq/pasemi-cpufreq.c  | 1 +
>>  drivers/cpufreq/pmac64-cpufreq.c  | 1 +
>>  drivers/cpufreq/powernv-cpufreq.c | 1 +
>>  drivers/cpufreq/ppc_cbe_cpufreq.c | 1 +
>>  5 files changed, 5 insertions(+)
>>
>> diff --git a/drivers/cpufreq/maple-cpufreq.c b/drivers/cpufreq/maple-cpufreq.c
>> index f9306410a07f..19ca7f874d28 100644
>> --- a/drivers/cpufreq/maple-cpufreq.c
>> +++ b/drivers/cpufreq/maple-cpufreq.c
>> @@ -238,4 +238,5 @@ static int __init maple_cpufreq_init(void)
>>  module_init(maple_cpufreq_init);
>>  
>>  
>> +MODULE_DESCRIPTION("cpufreq driver for Maple 970FX Evaluation Board");
>  
> Can you change this one to:
> 
> "cpufreq driver for Maple 970FX/970MP boards");
> 
> It looks for both those CPUs in probe.
> 
>> diff --git a/drivers/cpufreq/powernv-cpufreq.c b/drivers/cpufreq/powernv-cpufreq.c
>> index fddbd1ea1635..e923f717e1d7 100644
>> --- a/drivers/cpufreq/powernv-cpufreq.c
>> +++ b/drivers/cpufreq/powernv-cpufreq.c
>> @@ -1162,5 +1162,6 @@ static void __exit powernv_cpufreq_exit(void)
>>  }
>>  module_exit(powernv_cpufreq_exit);
>>  
>> +MODULE_DESCRIPTION("cpufreq driver for the IBM POWER processors");
> 
> This one's tricky, because it probes based on the device tree, though it
> is restricted to CONFIG_POWERNV. It also supports non-IBM CPUs in theory
> at least. Maybe something like:
> 
> "cpufreq driver for IBM/OpenPOWER powernv systems");
> 
> cheers
Sure, I'll send an update shortly.

/jeff
