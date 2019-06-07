Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F2438A73
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 14:36:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45L28D3yxwzDr08
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 22:36:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45L2644jjGzDqJY
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 22:34:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45L264055Lz8t2T
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jun 2019 22:34:36 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45L2636Pq3z9sNp; Fri,  7 Jun 2019 22:34:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=cclaudio@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45L2632zZMz9sNm
 for <linuxppc-dev@ozlabs.org>; Fri,  7 Jun 2019 22:34:34 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x57CSwDB141764
 for <linuxppc-dev@ozlabs.org>; Fri, 7 Jun 2019 08:34:31 -0400
Received: from e34.co.us.ibm.com (e34.co.us.ibm.com [32.97.110.152])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2syqm11eg4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 07 Jun 2019 08:34:31 -0400
Received: from localhost
 by e34.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <cclaudio@linux.ibm.com>;
 Fri, 7 Jun 2019 13:34:30 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e34.co.us.ibm.com (192.168.1.134) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 7 Jun 2019 13:34:27 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x57CYQlv21692732
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jun 2019 12:34:26 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FFDD78064;
 Fri,  7 Jun 2019 12:34:26 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F37A17806D;
 Fri,  7 Jun 2019 12:34:23 +0000 (GMT)
Received: from [9.18.235.79] (unknown [9.18.235.79])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jun 2019 12:34:23 +0000 (GMT)
Subject: Re: [PATCH v3 7/9] KVM: PPC: Ultravisor: Restrict LDBAR access
To: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>, linuxppc-dev@ozlabs.org
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
 <20190606173614.32090-8-cclaudio@linux.ibm.com>
 <be82d6c0-826b-a8e8-8d8c-2518404e33a7@linux.vnet.ibm.com>
From: Claudio Carvalho <cclaudio@linux.ibm.com>
Date: Fri, 7 Jun 2019 09:34:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.0
MIME-Version: 1.0
In-Reply-To: <be82d6c0-826b-a8e8-8d8c-2518404e33a7@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19060712-0016-0000-0000-000009BF6A03
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011228; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01214523; UDB=6.00638432; IPR=6.00995608; 
 MB=3.00027220; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-07 12:34:29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060712-0017-0000-0000-0000438B9AD8
Message-Id: <f9f43686-c8a3-8584-1e90-f5227ca00f92@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-07_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906070089
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
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 6/7/19 1:48 AM, Madhavan Srinivasan wrote:
>
> On 06/06/19 11:06 PM, Claudio Carvalho wrote:
>> When the ultravisor firmware is available, it takes control over the
>> LDBAR register. In this case, thread-imc updates and save/restore
>> operations on the LDBAR register are handled by ultravisor.
>>
>> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
>> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
>> ---
>>   arch/powerpc/kvm/book3s_hv_rmhandlers.S   | 2 ++
>>   arch/powerpc/platforms/powernv/idle.c     | 6 ++++--
>>   arch/powerpc/platforms/powernv/opal-imc.c | 7 +++++++
>>   3 files changed, 13 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> index f9b2620fbecd..cffb365d9d02 100644
>> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> @@ -375,8 +375,10 @@ BEGIN_FTR_SECTION
>>       mtspr    SPRN_RPR, r0
>>       ld    r0, KVM_SPLIT_PMMAR(r6)
>>       mtspr    SPRN_PMMAR, r0
>> +BEGIN_FW_FTR_SECTION_NESTED(70)
>>       ld    r0, KVM_SPLIT_LDBAR(r6)
>>       mtspr    SPRN_LDBAR, r0
>> +END_FW_FTR_SECTION_NESTED(FW_FEATURE_ULTRAVISOR, 0, 70)
>>       isync
>>   FTR_SECTION_ELSE
>>       /* On P9 we use the split_info for coordinating LPCR changes */
>> diff --git a/arch/powerpc/platforms/powernv/idle.c
>> b/arch/powerpc/platforms/powernv/idle.c
>> index c9133f7908ca..fd62435e3267 100644
>> --- a/arch/powerpc/platforms/powernv/idle.c
>> +++ b/arch/powerpc/platforms/powernv/idle.c
>> @@ -679,7 +679,8 @@ static unsigned long power9_idle_stop(unsigned long
>> psscr, bool mmu_on)
>>           sprs.ptcr    = mfspr(SPRN_PTCR);
>>           sprs.rpr    = mfspr(SPRN_RPR);
>>           sprs.tscr    = mfspr(SPRN_TSCR);
>> -        sprs.ldbar    = mfspr(SPRN_LDBAR);
>> +        if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>> +            sprs.ldbar    = mfspr(SPRN_LDBAR);
>>
>>           sprs_saved = true;
>>
>> @@ -762,7 +763,8 @@ static unsigned long power9_idle_stop(unsigned long
>> psscr, bool mmu_on)
>>       mtspr(SPRN_PTCR,    sprs.ptcr);
>>       mtspr(SPRN_RPR,        sprs.rpr);
>>       mtspr(SPRN_TSCR,    sprs.tscr);
>> -    mtspr(SPRN_LDBAR,    sprs.ldbar);
>> +    if (!firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>> +        mtspr(SPRN_LDBAR,    sprs.ldbar);
>>
>>       if (pls >= pnv_first_tb_loss_level) {
>>           /* TB loss */
>> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c
>> b/arch/powerpc/platforms/powernv/opal-imc.c
>> index 1b6932890a73..e9b641d313fb 100644
>> --- a/arch/powerpc/platforms/powernv/opal-imc.c
>> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
>> @@ -254,6 +254,13 @@ static int opal_imc_counters_probe(struct
>> platform_device *pdev)
>>       bool core_imc_reg = false, thread_imc_reg = false;
>>       u32 type;
>>
>> +    /*
>> +     * When the Ultravisor is enabled, it is responsible for thread-imc
>> +     * updates
>> +     */
>
> Would prefer the comment to be "Disable IMC devices, when Ultravisor is
> enabled"
> Rest looks good.
> Acked-by: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>


Thanks Maddy. I applied that change to the next version.

Claudio


>
>> +    if (firmware_has_feature(FW_FEATURE_ULTRAVISOR))
>> +        return -EACCES;
>> +
>>       /*
>>        * Check whether this is kdump kernel. If yes, force the engines to
>>        * stop and return.

