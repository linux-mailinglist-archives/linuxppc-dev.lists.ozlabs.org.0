Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 802D75B48E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 08:18:59 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ccdW6N9NzDqT3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 16:18:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ccby25q2zDqMG
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 16:17:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45ccbx5Srkz8sxT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 16:17:33 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45ccbx3tJ0z9sPF; Mon,  1 Jul 2019 16:17:33 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=maddy@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45ccbx0DSHz9sPQ
 for <linuxppc-dev@ozlabs.org>; Mon,  1 Jul 2019 16:17:32 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x616Dq39035874
 for <linuxppc-dev@ozlabs.org>; Mon, 1 Jul 2019 02:17:29 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tf93b7rac-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 01 Jul 2019 02:17:29 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <maddy@linux.vnet.ibm.com>;
 Mon, 1 Jul 2019 07:17:27 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Jul 2019 07:17:24 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x616HMGw37486668
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2019 06:17:22 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A04D75205A;
 Mon,  1 Jul 2019 06:17:22 +0000 (GMT)
Received: from [9.126.30.145] (unknown [9.126.30.145])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id F18CF5204F;
 Mon,  1 Jul 2019 06:17:18 +0000 (GMT)
Subject: Re: [PATCH v4 6/8] KVM: PPC: Ultravisor: Restrict LDBAR access
To: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20190628200825.31049-1-cclaudio@linux.ibm.com>
 <20190628200825.31049-7-cclaudio@linux.ibm.com>
 <f153b6bf-4661-9dc0-c28f-076fc8fe598e@ozlabs.ru>
From: maddy <maddy@linux.vnet.ibm.com>
Date: Mon, 1 Jul 2019 11:47:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <f153b6bf-4661-9dc0-c28f-076fc8fe598e@ozlabs.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19070106-0008-0000-0000-000002F8AA52
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070106-0009-0000-0000-00002265ED3D
Message-Id: <1e7f702a-c0cd-393d-934e-9e1a1234fe28@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=18 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010079
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
Cc: Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Ryan Grimm <grimm@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Thiago Bauermann <bauerman@linux.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 01/07/19 11:24 AM, Alexey Kardashevskiy wrote:
>
> On 29/06/2019 06:08, Claudio Carvalho wrote:
>> When the ultravisor firmware is available, it takes control over the
>> LDBAR register. In this case, thread-imc updates and save/restore
>> operations on the LDBAR register are handled by ultravisor.
> What does LDBAR do? "Power ISA™ Version 3.0 B" or "User’s Manual POWER9
> Processor" do not tell.
LDBAR is a per-thread SPR used by thread-imc pmu to dump the counter 
data into memory.
LDBAR contains memory address along with few other configuration bits 
(it is populated
by the thread-imc pmu driver). It is populated and enabled only when any 
of the thread
imc pmu events are monitored.

Maddy
>
>
>> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> Reviewed-by: Ram Pai <linuxram@us.ibm.com>
>> Reviewed-by: Ryan Grimm <grimm@linux.ibm.com>
>> Acked-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
>> Acked-by: Paul Mackerras <paulus@ozlabs.org>
>> ---
>>   arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 2 ++
>>   arch/powerpc/platforms/powernv/idle.c     | 6 ++++--
>>   arch/powerpc/platforms/powernv/opal-imc.c | 4 ++++
>>   3 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> index f9b2620fbecd..cffb365d9d02 100644
>> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> @@ -375,8 +375,10 @@ BEGIN_FTR_SECTION
>>   	mtspr	SPRN_RPR, r0
>>   	ld	r0, KVM_SPLIT_PMMAR(r6)
>>   	mtspr	SPRN_PMMAR, r0
>> +BEGIN_FW_FTR_SECTION_NESTED(70)
>>   	ld	r0, KVM_SPLIT_LDBAR(r6)
>>   	mtspr	SPRN_LDBAR, r0
>> +END_FW_FTR_SECTION_NESTED(FW_FEATURE_ULTRAVISOR, 0, 70)
>>   	isync
>>   FTR_SECTION_ELSE
>>   	/* On P9 we use the split_info for coordinating LPCR changes */
>> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
>> index 77f2e0a4ee37..5593a2d55959 100644
>> --- a/arch/powerpc/platforms/powernv/idle.c
>> +++ b/arch/powerpc/platforms/powernv/idle.c
>> @@ -679,7 +679,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>>   		sprs.ptcr	= mfspr(SPRN_PTCR);
>>   		sprs.rpr	= mfspr(SPRN_RPR);
>>   		sprs.tscr	= mfspr(SPRN_TSCR);
>> -		sprs.ldbar	= mfspr(SPRN_LDBAR);
>> +		if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>> +			sprs.ldbar	= mfspr(SPRN_LDBAR);
>>   
>>   		sprs_saved = true;
>>   
>> @@ -762,7 +763,8 @@ static unsigned long power9_idle_stop(unsigned long psscr, bool mmu_on)
>>   	mtspr(SPRN_PTCR,	sprs.ptcr);
>>   	mtspr(SPRN_RPR,		sprs.rpr);
>>   	mtspr(SPRN_TSCR,	sprs.tscr);
>> -	mtspr(SPRN_LDBAR,	sprs.ldbar);
>> +	if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>> +		mtspr(SPRN_LDBAR,	sprs.ldbar);
>>   
>>   	if (pls >= pnv_first_tb_loss_level) {
>>   		/* TB loss */
>> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c b/arch/powerpc/platforms/powernv/opal-imc.c
>> index 1b6932890a73..5fe2d4526cbc 100644
>> --- a/arch/powerpc/platforms/powernv/opal-imc.c
>> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
>> @@ -254,6 +254,10 @@ static int opal_imc_counters_probe(struct platform_device *pdev)
>>   	bool core_imc_reg = false, thread_imc_reg = false;
>>   	u32 type;
>>   
>> +	/* Disable IMC devices, when Ultravisor is enabled. */
>> +	if (firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>> +		return -EACCES;
>> +
>>   	/*
>>   	 * Check whether this is kdump kernel. If yes, force the engines to
>>   	 * stop and return.
>>

