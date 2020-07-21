Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FDBE227CDD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 12:26:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9vrf3g7wzDqdG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 20:26:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9vpn3ktSzDqYW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 20:24:33 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06LA22Zb003546; Tue, 21 Jul 2020 06:24:21 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5k0uev4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 06:24:21 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06LA2Lpp005577;
 Tue, 21 Jul 2020 06:24:20 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5k0ueun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 06:24:20 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06LAJvdk027292;
 Tue, 21 Jul 2020 10:24:18 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma05fra.de.ibm.com with ESMTP id 32brq81wj3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 21 Jul 2020 10:24:18 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06LAOGwo30081470
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 21 Jul 2020 10:24:16 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6AA7B4204F;
 Tue, 21 Jul 2020 10:24:16 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCAB04203F;
 Tue, 21 Jul 2020 10:24:14 +0000 (GMT)
Received: from [9.79.210.59] (unknown [9.79.210.59])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 21 Jul 2020 10:24:14 +0000 (GMT)
Subject: Re: [PATCH v3 1/3] powerpc/powernv/idle: Replace CPU features checks
 with PVR checks
To: Nicholas Piggin <npiggin@gmail.com>, benh@kernel.crashing.org,
 ego@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, mikey@neuling.org, mpe@ellerman.id.au,
 paulus@samba.org, pratik.r.sampat@gmail.com, svaidy@linux.ibm.com
References: <20200717185306.60607-1-psampat@linux.ibm.com>
 <20200717185306.60607-2-psampat@linux.ibm.com>
 <1595203067.oropk0x5c8.astroid@bobo.none>
From: Pratik Sampat <psampat@linux.ibm.com>
Message-ID: <8f3485a0-6c5a-91bd-dee7-2075b3392fa5@linux.ibm.com>
Date: Tue, 21 Jul 2020 15:54:14 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1595203067.oropk0x5c8.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-21_02:2020-07-21,
 2020-07-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=999 suspectscore=0 priorityscore=1501 mlxscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007210066
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 20/07/20 5:30 am, Nicholas Piggin wrote:
> Excerpts from Pratik Rajesh Sampat's message of July 18, 2020 4:53 am:
>> As the idle framework's architecture is incomplete, hence instead of
>> checking for just the processor type advertised in the device tree CPU
>> features; check for the Processor Version Register (PVR) so that finer
>> granularity can be leveraged while making processor checks.
>>
>> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/powernv/idle.c | 14 +++++++-------
>>   1 file changed, 7 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
>> index 2dd467383a88..f62904f70fc6 100644
>> --- a/arch/powerpc/platforms/powernv/idle.c
>> +++ b/arch/powerpc/platforms/powernv/idle.c
>> @@ -92,7 +92,7 @@ static int pnv_save_sprs_for_deep_states(void)
>>   		if (rc != 0)
>>   			return rc;
>>   
>> -		if (cpu_has_feature(CPU_FTR_ARCH_300)) {
>> +		if (pvr_version_is(PVR_POWER9)) {
>>   			rc = opal_slw_set_reg(pir, P9_STOP_SPR_MSR, msr_val);
>>   			if (rc)
>>   				return rc;
>> @@ -116,7 +116,7 @@ static int pnv_save_sprs_for_deep_states(void)
>>   				return rc;
>>   
>>   			/* Only p8 needs to set extra HID regiters */
>> -			if (!cpu_has_feature(CPU_FTR_ARCH_300)) {
>> +			if (!pvr_version_is(PVR_POWER9)) {
>>   
>>   				rc = opal_slw_set_reg(pir, SPRN_HID1, hid1_val);
>>   				if (rc != 0)
> What I think you should do is keep using CPU_FTR_ARCH_300 for this stuff
> which is written for power9 and we know is running on power9, because
> that's a faster test (static branch and does not have to read PVR. And
> then...
>
>> @@ -1205,7 +1205,7 @@ static void __init pnv_probe_idle_states(void)
>>   		return;
>>   	}
>>   
>> -	if (cpu_has_feature(CPU_FTR_ARCH_300))
>> +	if (pvr_version_is(PVR_POWER9))
>>   		pnv_power9_idle_init();
>>   
>>   	for (i = 0; i < nr_pnv_idle_states; i++)
> Here is where you would put the version check. Once we have code that
> can also handle P10 (either by testing CPU_FTR_ARCH_31, or by adding
> an entirely new power10 idle function), then you can add the P10 version
> check here.

Sure, it makes sense to make this check on the top level function and
retain CPU_FTR_ARCH_300 lower in the calls for speed.
I'll make that change.

Thanks
Pratik

> Thanks,
> Nick
>

