Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D07A0574637
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 09:55:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lk6H65cCYz3cFK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 17:55:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pm4wbMWX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pm4wbMWX;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lk6GS07LXz3bdM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 17:54:55 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26E5wEXT013452;
	Thu, 14 Jul 2022 07:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=X1WFQMZyawGiGs7c1v5BImIqJBI5umhwmze0ovLnbsU=;
 b=Pm4wbMWXgHAHzIF/pl/cxWyD0YVBB14Vzt3bildl7N63LEhxXL2tL549CiRRPJwOHwJB
 Q6iBi93sO3hzAsNYrld6cgr+kAW23NKWT8VQ2aPIon27f49oIhPyaGU50Fzdarrp+uo8
 k8Rx7yrcxuCt/mJX7uXUToFo39pb/WUTJO8+kVk6DjgNF6qKOkpW1ASPQoMJTQUqAqSY
 pJvXBpcOTZdx7TrepIhp5yGLyCjOkndH2aEfh3p6V4jfQdwNcNKfuF8TDkN/ar/bZQwZ
 BJALA2ROrxT9I2OQgHZtS1KyxAydjaN60EuNhKhJEbfuQZB+w+3lqhL+GnEW3o5fpygb LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3had8jtxr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Jul 2022 07:54:48 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26E7UFRg032159;
	Thu, 14 Jul 2022 07:54:47 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3had8jtxqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Jul 2022 07:54:47 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26E7qNG9032577;
	Thu, 14 Jul 2022 07:54:45 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma06ams.nl.ibm.com with ESMTP id 3h70xhxrw8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Jul 2022 07:54:45 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26E7sgx019005846
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 14 Jul 2022 07:54:42 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37ABE42041;
	Thu, 14 Jul 2022 07:54:42 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6514D4203F;
	Thu, 14 Jul 2022 07:54:40 +0000 (GMT)
Received: from [9.43.122.242] (unknown [9.43.122.242])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 14 Jul 2022 07:54:40 +0000 (GMT)
Message-ID: <ba84b170-07e9-1fd5-731b-926eca8115a2@linux.ibm.com>
Date: Thu, 14 Jul 2022 13:24:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] powerpc/kvm: Move pmu code in kvm folder to separate
 file for power9 and later platforms
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, Kajol Jain <kjain@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20220711034927.213192-1-kjain@linux.ibm.com>
 <1657690385.27p62dp0u2.astroid@bobo.none>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
In-Reply-To: <1657690385.27p62dp0u2.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: HHrA7Ec0f5FpDZA7z5zOBEJl-uGTG_IC
X-Proofpoint-ORIG-GUID: L_siQjoHkRebbkVKYHqyiiEZEtmbzy9i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-14_04,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 spamscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207140030
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
Cc: atrajeev@linux.vnet.ibm.com, disgoel@linux.vnet.ibm.com, rnsastry@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/13/22 11:11 AM, Nicholas Piggin wrote:
> Excerpts from Kajol Jain's message of July 11, 2022 1:49 pm:
>> File book3s_hv_p9_entry.c in powerpc/kvm folder consists of functions
>> like freeze_pmu, switch_pmu_to_guest and switch_pmu_to_host which are
>> specific to Performance Monitoring Unit(PMU) for power9 and later
>> platforms.
>>
>> For better maintenance, moving pmu related code from
>> book3s_hv_p9_entry.c to a new file called book3s_hv_p9_perf.c,
>> without any logic change.
>> Also make corresponding changes in the Makefile to include
>> book3s_hv_p9_perf.c during compilation.
>
>> +
>> +	if (ppc_get_pmu_inuse()) {
>> +		mtspr(SPRN_PMC1, host_os_sprs->pmc1);
>> +		mtspr(SPRN_PMC2, host_os_sprs->pmc2);
>> +		mtspr(SPRN_PMC3, host_os_sprs->pmc3);
>> +		mtspr(SPRN_PMC4, host_os_sprs->pmc4);
>> +		mtspr(SPRN_PMC5, host_os_sprs->pmc5);
>> +		mtspr(SPRN_PMC6, host_os_sprs->pmc6);
>> +		mtspr(SPRN_MMCR1, host_os_sprs->mmcr1);
>> +		mtspr(SPRN_MMCR2, host_os_sprs->mmcr2);
>> +		mtspr(SPRN_SDAR, host_os_sprs->sdar);
>> +		mtspr(SPRN_SIAR, host_os_sprs->siar);
>> +		mtspr(SPRN_SIER, host_os_sprs->sier1);
>> +
>> +		if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>> +			mtspr(SPRN_MMCR3, host_os_sprs->mmcr3);
>> +			mtspr(SPRN_SIER2, host_os_sprs->sier2);
>> +			mtspr(SPRN_SIER3, host_os_sprs->sier3);
>> +		}
>> +
>> +		/* Set MMCRA then MMCR0 last */
>> +		mtspr(SPRN_MMCRA, host_os_sprs->mmcra);
>> +		mtspr(SPRN_MMCR0, host_os_sprs->mmcr0);
>> +		isync();
>> +	}
>> +}
>> +EXPORT_SYMBOL_GPL(switch_pmu_to_host);
>>
> I'm still thinking these parts of the code in particular that do the
> host PMU save/restore could be handled by calls into perf subsystem.  In
> some cases it doesn't need to save SPRs because it can recreate them or
> is not using them. Maybe it's not so simple.
Yes, we looked at this. Concern for me is counter data leak.
Host application will still have read access to these SPRs
in power9 and before.So I would recommend to save/restore host values as 
part of it.

Maddy
>
> Either way, I'm fine with this move to stat with.
>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
