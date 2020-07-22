Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 21416229897
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 14:52:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BBb2v2jWLzDr7C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jul 2020 22:52:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BBX3v3L91zDqxG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jul 2020 20:38:03 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06MAXKIi115447; Wed, 22 Jul 2020 06:37:57 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1yawduh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 06:37:57 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06MAXsZb117222;
 Wed, 22 Jul 2020 06:37:56 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32e1yawdtq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 06:37:56 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06MAZjYm000867;
 Wed, 22 Jul 2020 10:37:54 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04fra.de.ibm.com with ESMTP id 32dbmn16se-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 22 Jul 2020 10:37:53 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06MAaRDN64487916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 22 Jul 2020 10:36:27 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 905165204E;
 Wed, 22 Jul 2020 10:37:51 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.199.39.161])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 12EE052057;
 Wed, 22 Jul 2020 10:37:49 +0000 (GMT)
Subject: Re: [PATCH v3] powerpc/pseries: Avoid using addr_to_pfn in realmode
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200720080335.21049-1-ganeshgr@linux.ibm.com>
 <1595325962.zikec6nkw7.astroid@bobo.none>
From: Ganesh <ganeshgr@linux.ibm.com>
Message-ID: <824a2942-e1ed-a82d-c619-ef30e48a0d53@linux.ibm.com>
Date: Wed, 22 Jul 2020 16:07:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <1595325962.zikec6nkw7.astroid@bobo.none>
Content-Type: multipart/alternative;
 boundary="------------FE71DCBAEE7307A2CC581B61"
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-22_04:2020-07-22,
 2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1011
 priorityscore=1501 mlxscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007220080
X-Mailman-Approved-At: Wed, 22 Jul 2020 22:44:44 +1000
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
Cc: aneesh.kumar@linux.ibm.com, mahesh@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------FE71DCBAEE7307A2CC581B61
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit



On 7/21/20 3:38 PM, Nicholas Piggin wrote:
> Excerpts from Ganesh Goudar's message of July 20, 2020 6:03 pm:
>> When an UE or memory error exception is encountered the MCE handler
>> tries to find the pfn using addr_to_pfn() which takes effective
>> address as an argument, later pfn is used to poison the page where
>> memory error occurred, recent rework in this area made addr_to_pfn
>> to run in realmode, which can be fatal as it may try to access
>> memory outside RMO region.
>>
>> To fix this have separate functions for realmode and virtual mode
>> handling and let addr_to_pfn to run in virtual mode.
> You didn't really explain what you moved around. You added some
> helper functions, but what does it actually do differently now? Can you
> explain that in the changelog?

Sure, ill rephrase the changelog, here I have moved all that we can and we must
do in virtual mode to new helper function which runs in virtual mode, like filling
mce error info, using addr_to_pfn and calling save_mce_event().

>
> Thanks,
> Nick
>
>> Without this fix following kernel crash is seen on hitting UE.
>>
>> [  485.128036] Oops: Kernel access of bad area, sig: 11 [#1]
>> [  485.128040] LE SMP NR_CPUS=2048 NUMA pSeries
>> [  485.128047] Modules linked in:
>> [  485.128067] CPU: 15 PID: 6536 Comm: insmod Kdump: loaded Tainted: G OE 5.7.0 #22
>> [  485.128074] NIP:  c00000000009b24c LR: c0000000000398d8 CTR: c000000000cd57c0
>> [  485.128078] REGS: c000000003f1f970 TRAP: 0300   Tainted: G OE (5.7.0)
>> [  485.128082] MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 28008284  XER: 00000001
>> [  485.128088] CFAR: c00000000009b190 DAR: c0000001fab00000 DSISR: 40000000 IRQMASK: 1
>> [  485.128088] GPR00: 0000000000000001 c000000003f1fbf0 c000000001634300 0000b0fa01000000
>> [  485.128088] GPR04: d000000002220000 0000000000000000 00000000fab00000 0000000000000022
>> [  485.128088] GPR08: c0000001fab00000 0000000000000000 c0000001fab00000 c000000003f1fc14
>> [  485.128088] GPR12: 0000000000000008 c000000003ff5880 d000000002100008 0000000000000000
>> [  485.128088] GPR16: 000000000000ff20 000000000000fff1 000000000000fff2 d0000000021a1100
>> [  485.128088] GPR20: d000000002200000 c00000015c893c50 c000000000d49b28 c00000015c893c50
>> [  485.128088] GPR24: d0000000021a0d08 c0000000014e5da8 d0000000021a0818 000000000000000a
>> [  485.128088] GPR28: 0000000000000008 000000000000000a c0000000017e2970 000000000000000a
>> [  485.128125] NIP [c00000000009b24c] __find_linux_pte+0x11c/0x310
>> [  485.128130] LR [c0000000000398d8] addr_to_pfn+0x138/0x170
>> [  485.128133] Call Trace:
>> [  485.128135] Instruction dump:
>> [  485.128138] 3929ffff 7d4a3378 7c883c36 7d2907b4 794a1564 7d294038 794af082 3900ffff
>> [  485.128144] 79291f24 790af00e 78e70020 7d095214 <7c69502a> 2fa30000 419e011c 70690040
>> [  485.128152] ---[ end trace d34b27e29ae0e340 ]---
>>
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> ---
>> V2: Leave bare metal code and save_mce_event as is.
>>
>> V3: Have separate functions for realmode and virtual mode handling.
>> ---
>>   arch/powerpc/platforms/pseries/ras.c | 119 ++++++++++++++++-----------
>>   1 file changed, 70 insertions(+), 49 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
>> index f3736fcd98fc..32fe3fad86b8 100644
>> --- a/arch/powerpc/platforms/pseries/ras.c
>> +++ b/arch/powerpc/platforms/pseries/ras.c
>> @@ -522,18 +522,55 @@ int pSeries_system_reset_exception(struct pt_regs *regs)
>>   	return 0; /* need to perform reset */
>>   }
>>   
>> +static int mce_handle_err_realmode(int disposition, u8 error_type)
>> +{
>> +#ifdef CONFIG_PPC_BOOK3S_64
>> +	if (disposition == RTAS_DISP_NOT_RECOVERED) {
>> +		switch (error_type) {
>> +		case	MC_ERROR_TYPE_SLB:
>> +		case	MC_ERROR_TYPE_ERAT:
>> +			/*
>> +			 * Store the old slb content in paca before flushing.
>> +			 * Print this when we go to virtual mode.
>> +			 * There are chances that we may hit MCE again if there
>> +			 * is a parity error on the SLB entry we trying to read
>> +			 * for saving. Hence limit the slb saving to single
>> +			 * level of recursion.
>> +			 */
>> +			if (local_paca->in_mce == 1)
>> +				slb_save_contents(local_paca->mce_faulty_slbs);
>> +			flush_and_reload_slb();
>> +			disposition = RTAS_DISP_FULLY_RECOVERED;
>> +			break;
>> +		default:
>> +			break;
>> +		}
>> +	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
>> +		/* Platform corrected itself but could be degraded */
>> +		pr_err("MCE: limited recovery, system may be degraded\n");
>> +		disposition = RTAS_DISP_FULLY_RECOVERED;
>> +	}
>> +#endif
>> +	return disposition;
>> +}
>>   
>> -static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>> +static int mce_handle_err_virtmode(struct pt_regs *regs,
>> +				   struct rtas_error_log *errp,
>> +				   struct pseries_mc_errorlog *mce_log,
>> +				   int disposition)
>>   {
>>   	struct mce_error_info mce_err = { 0 };
>> -	unsigned long eaddr = 0, paddr = 0;
>> -	struct pseries_errorlog *pseries_log;
>> -	struct pseries_mc_errorlog *mce_log;
>> -	int disposition = rtas_error_disposition(errp);
>>   	int initiator = rtas_error_initiator(errp);
>>   	int severity = rtas_error_severity(errp);
>> +	unsigned long eaddr = 0, paddr = 0;
>>   	u8 error_type, err_sub_type;
>>   
>> +	if (!mce_log)
>> +		goto out;
>> +
>> +	error_type = mce_log->error_type;
>> +	err_sub_type = rtas_mc_error_sub_type(mce_log);
>> +
>>   	if (initiator == RTAS_INITIATOR_UNKNOWN)
>>   		mce_err.initiator = MCE_INITIATOR_UNKNOWN;
>>   	else if (initiator == RTAS_INITIATOR_CPU)
>> @@ -572,18 +609,7 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>>   	mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
>>   	mce_err.error_class = MCE_ECLASS_UNKNOWN;
>>   
>> -	if (!rtas_error_extended(errp))
>> -		goto out;
>> -
>> -	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
>> -	if (pseries_log == NULL)
>> -		goto out;
>> -
>> -	mce_log = (struct pseries_mc_errorlog *)pseries_log->data;
>> -	error_type = mce_log->error_type;
>> -	err_sub_type = rtas_mc_error_sub_type(mce_log);
>> -
>> -	switch (mce_log->error_type) {
>> +	switch (error_type) {
>>   	case MC_ERROR_TYPE_UE:
>>   		mce_err.error_type = MCE_ERROR_TYPE_UE;
>>   		mce_common_process_ue(regs, &mce_err);
>> @@ -683,37 +709,32 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>>   		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
>>   		break;
>>   	}
>> +out:
>> +	save_mce_event(regs, disposition == RTAS_DISP_FULLY_RECOVERED,
>> +		       &mce_err, regs->nip, eaddr, paddr);
>> +	return disposition;
>> +}
>>   
>> -#ifdef CONFIG_PPC_BOOK3S_64
>> -	if (disposition == RTAS_DISP_NOT_RECOVERED) {
>> -		switch (error_type) {
>> -		case	MC_ERROR_TYPE_SLB:
>> -		case	MC_ERROR_TYPE_ERAT:
>> -			/*
>> -			 * Store the old slb content in paca before flushing.
>> -			 * Print this when we go to virtual mode.
>> -			 * There are chances that we may hit MCE again if there
>> -			 * is a parity error on the SLB entry we trying to read
>> -			 * for saving. Hence limit the slb saving to single
>> -			 * level of recursion.
>> -			 */
>> -			if (local_paca->in_mce == 1)
>> -				slb_save_contents(local_paca->mce_faulty_slbs);
>> -			flush_and_reload_slb();
>> -			disposition = RTAS_DISP_FULLY_RECOVERED;
>> -			break;
>> -		default:
>> -			break;
>> -		}
>> -	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
>> -		/* Platform corrected itself but could be degraded */
>> -		printk(KERN_ERR "MCE: limited recovery, system may "
>> -		       "be degraded\n");
>> -		disposition = RTAS_DISP_FULLY_RECOVERED;
>> -	}
>> -#endif
>> +static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>> +{
>> +	struct pseries_errorlog *pseries_log;
>> +	struct pseries_mc_errorlog *mce_log = NULL;
>> +	int disposition = rtas_error_disposition(errp);
>> +	u8 error_type, err_sub_type;
>> +
>> +	if (!rtas_error_extended(errp))
>> +		goto out;
>> +
>> +	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
>> +	if (!pseries_log)
>> +		goto out;
>> +
>> +	mce_log = (struct pseries_mc_errorlog *)pseries_log->data;
>> +	error_type = mce_log->error_type;
>> +	err_sub_type = rtas_mc_error_sub_type(mce_log);
>> +
>> +	disposition = mce_handle_err_realmode(disposition, error_type);
>>   
>> -out:
>>   	/*
>>   	 * Enable translation as we will be accessing per-cpu variables
>>   	 * in save_mce_event() which may fall outside RMO region, also
>> @@ -724,10 +745,10 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
>>   	 * Note: All the realmode handling like flushing SLB entries for
>>   	 *       SLB multihit is done by now.
>>   	 */
>> +out:
>>   	mtmsr(mfmsr() | MSR_IR | MSR_DR);
>> -	save_mce_event(regs, disposition == RTAS_DISP_FULLY_RECOVERED,
>> -			&mce_err, regs->nip, eaddr, paddr);
>> -
>> +	disposition = mce_handle_err_virtmode(regs, errp, mce_log,
>> +					      disposition);
>>   	return disposition;
>>   }
>>   
>> -- 
>> 2.17.2
>>
>>


--------------FE71DCBAEE7307A2CC581B61
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <br>
    <br>
    <div class="moz-cite-prefix">On 7/21/20 3:38 PM, Nicholas Piggin
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:1595325962.zikec6nkw7.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">Excerpts from Ganesh Goudar's message of July 20, 2020 6:03 pm:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">When an UE or memory error exception is encountered the MCE handler
tries to find the pfn using addr_to_pfn() which takes effective
address as an argument, later pfn is used to poison the page where
memory error occurred, recent rework in this area made addr_to_pfn
to run in realmode, which can be fatal as it may try to access
memory outside RMO region.

To fix this have separate functions for realmode and virtual mode
handling and let addr_to_pfn to run in virtual mode.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You didn't really explain what you moved around. You added some
helper functions, but what does it actually do differently now? Can you 
explain that in the changelog?</pre>
    </blockquote>
    <pre>Sure, ill rephrase the changelog, here I have moved all that we can and we must
do in virtual mode to new helper function which runs in virtual mode, like filling
mce error info, using addr_to_pfn and calling save_mce_event().
</pre>
    <blockquote type="cite"
      cite="mid:1595325962.zikec6nkw7.astroid@bobo.none">
      <pre class="moz-quote-pre" wrap="">

Thanks,
Nick

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">
Without this fix following kernel crash is seen on hitting UE.

[  485.128036] Oops: Kernel access of bad area, sig: 11 [#1]
[  485.128040] LE SMP NR_CPUS=2048 NUMA pSeries
[  485.128047] Modules linked in:
[  485.128067] CPU: 15 PID: 6536 Comm: insmod Kdump: loaded Tainted: G OE 5.7.0 #22
[  485.128074] NIP:  c00000000009b24c LR: c0000000000398d8 CTR: c000000000cd57c0
[  485.128078] REGS: c000000003f1f970 TRAP: 0300   Tainted: G OE (5.7.0)
[  485.128082] MSR:  8000000000001003 &lt;SF,ME,RI,LE&gt;  CR: 28008284  XER: 00000001
[  485.128088] CFAR: c00000000009b190 DAR: c0000001fab00000 DSISR: 40000000 IRQMASK: 1
[  485.128088] GPR00: 0000000000000001 c000000003f1fbf0 c000000001634300 0000b0fa01000000
[  485.128088] GPR04: d000000002220000 0000000000000000 00000000fab00000 0000000000000022
[  485.128088] GPR08: c0000001fab00000 0000000000000000 c0000001fab00000 c000000003f1fc14
[  485.128088] GPR12: 0000000000000008 c000000003ff5880 d000000002100008 0000000000000000
[  485.128088] GPR16: 000000000000ff20 000000000000fff1 000000000000fff2 d0000000021a1100
[  485.128088] GPR20: d000000002200000 c00000015c893c50 c000000000d49b28 c00000015c893c50
[  485.128088] GPR24: d0000000021a0d08 c0000000014e5da8 d0000000021a0818 000000000000000a
[  485.128088] GPR28: 0000000000000008 000000000000000a c0000000017e2970 000000000000000a
[  485.128125] NIP [c00000000009b24c] __find_linux_pte+0x11c/0x310
[  485.128130] LR [c0000000000398d8] addr_to_pfn+0x138/0x170
[  485.128133] Call Trace:
[  485.128135] Instruction dump:
[  485.128138] 3929ffff 7d4a3378 7c883c36 7d2907b4 794a1564 7d294038 794af082 3900ffff
[  485.128144] 79291f24 790af00e 78e70020 7d095214 &lt;7c69502a&gt; 2fa30000 419e011c 70690040
[  485.128152] ---[ end trace d34b27e29ae0e340 ]---

Signed-off-by: Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a>
---
V2: Leave bare metal code and save_mce_event as is.

V3: Have separate functions for realmode and virtual mode handling.
---
 arch/powerpc/platforms/pseries/ras.c | 119 ++++++++++++++++-----------
 1 file changed, 70 insertions(+), 49 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/ras.c b/arch/powerpc/platforms/pseries/ras.c
index f3736fcd98fc..32fe3fad86b8 100644
--- a/arch/powerpc/platforms/pseries/ras.c
+++ b/arch/powerpc/platforms/pseries/ras.c
@@ -522,18 +522,55 @@ int pSeries_system_reset_exception(struct pt_regs *regs)
 	return 0; /* need to perform reset */
 }
 
+static int mce_handle_err_realmode(int disposition, u8 error_type)
+{
+#ifdef CONFIG_PPC_BOOK3S_64
+	if (disposition == RTAS_DISP_NOT_RECOVERED) {
+		switch (error_type) {
+		case	MC_ERROR_TYPE_SLB:
+		case	MC_ERROR_TYPE_ERAT:
+			/*
+			 * Store the old slb content in paca before flushing.
+			 * Print this when we go to virtual mode.
+			 * There are chances that we may hit MCE again if there
+			 * is a parity error on the SLB entry we trying to read
+			 * for saving. Hence limit the slb saving to single
+			 * level of recursion.
+			 */
+			if (local_paca-&gt;in_mce == 1)
+				slb_save_contents(local_paca-&gt;mce_faulty_slbs);
+			flush_and_reload_slb();
+			disposition = RTAS_DISP_FULLY_RECOVERED;
+			break;
+		default:
+			break;
+		}
+	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
+		/* Platform corrected itself but could be degraded */
+		pr_err("MCE: limited recovery, system may be degraded\n");
+		disposition = RTAS_DISP_FULLY_RECOVERED;
+	}
+#endif
+	return disposition;
+}
 
-static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
+static int mce_handle_err_virtmode(struct pt_regs *regs,
+				   struct rtas_error_log *errp,
+				   struct pseries_mc_errorlog *mce_log,
+				   int disposition)
 {
 	struct mce_error_info mce_err = { 0 };
-	unsigned long eaddr = 0, paddr = 0;
-	struct pseries_errorlog *pseries_log;
-	struct pseries_mc_errorlog *mce_log;
-	int disposition = rtas_error_disposition(errp);
 	int initiator = rtas_error_initiator(errp);
 	int severity = rtas_error_severity(errp);
+	unsigned long eaddr = 0, paddr = 0;
 	u8 error_type, err_sub_type;
 
+	if (!mce_log)
+		goto out;
+
+	error_type = mce_log-&gt;error_type;
+	err_sub_type = rtas_mc_error_sub_type(mce_log);
+
 	if (initiator == RTAS_INITIATOR_UNKNOWN)
 		mce_err.initiator = MCE_INITIATOR_UNKNOWN;
 	else if (initiator == RTAS_INITIATOR_CPU)
@@ -572,18 +609,7 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 	mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
 	mce_err.error_class = MCE_ECLASS_UNKNOWN;
 
-	if (!rtas_error_extended(errp))
-		goto out;
-
-	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
-	if (pseries_log == NULL)
-		goto out;
-
-	mce_log = (struct pseries_mc_errorlog *)pseries_log-&gt;data;
-	error_type = mce_log-&gt;error_type;
-	err_sub_type = rtas_mc_error_sub_type(mce_log);
-
-	switch (mce_log-&gt;error_type) {
+	switch (error_type) {
 	case MC_ERROR_TYPE_UE:
 		mce_err.error_type = MCE_ERROR_TYPE_UE;
 		mce_common_process_ue(regs, &amp;mce_err);
@@ -683,37 +709,32 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
 		break;
 	}
+out:
+	save_mce_event(regs, disposition == RTAS_DISP_FULLY_RECOVERED,
+		       &amp;mce_err, regs-&gt;nip, eaddr, paddr);
+	return disposition;
+}
 
-#ifdef CONFIG_PPC_BOOK3S_64
-	if (disposition == RTAS_DISP_NOT_RECOVERED) {
-		switch (error_type) {
-		case	MC_ERROR_TYPE_SLB:
-		case	MC_ERROR_TYPE_ERAT:
-			/*
-			 * Store the old slb content in paca before flushing.
-			 * Print this when we go to virtual mode.
-			 * There are chances that we may hit MCE again if there
-			 * is a parity error on the SLB entry we trying to read
-			 * for saving. Hence limit the slb saving to single
-			 * level of recursion.
-			 */
-			if (local_paca-&gt;in_mce == 1)
-				slb_save_contents(local_paca-&gt;mce_faulty_slbs);
-			flush_and_reload_slb();
-			disposition = RTAS_DISP_FULLY_RECOVERED;
-			break;
-		default:
-			break;
-		}
-	} else if (disposition == RTAS_DISP_LIMITED_RECOVERY) {
-		/* Platform corrected itself but could be degraded */
-		printk(KERN_ERR "MCE: limited recovery, system may "
-		       "be degraded\n");
-		disposition = RTAS_DISP_FULLY_RECOVERED;
-	}
-#endif
+static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
+{
+	struct pseries_errorlog *pseries_log;
+	struct pseries_mc_errorlog *mce_log = NULL;
+	int disposition = rtas_error_disposition(errp);
+	u8 error_type, err_sub_type;
+
+	if (!rtas_error_extended(errp))
+		goto out;
+
+	pseries_log = get_pseries_errorlog(errp, PSERIES_ELOG_SECT_ID_MCE);
+	if (!pseries_log)
+		goto out;
+
+	mce_log = (struct pseries_mc_errorlog *)pseries_log-&gt;data;
+	error_type = mce_log-&gt;error_type;
+	err_sub_type = rtas_mc_error_sub_type(mce_log);
+
+	disposition = mce_handle_err_realmode(disposition, error_type);
 
-out:
 	/*
 	 * Enable translation as we will be accessing per-cpu variables
 	 * in save_mce_event() which may fall outside RMO region, also
@@ -724,10 +745,10 @@ static int mce_handle_error(struct pt_regs *regs, struct rtas_error_log *errp)
 	 * Note: All the realmode handling like flushing SLB entries for
 	 *       SLB multihit is done by now.
 	 */
+out:
 	mtmsr(mfmsr() | MSR_IR | MSR_DR);
-	save_mce_event(regs, disposition == RTAS_DISP_FULLY_RECOVERED,
-			&amp;mce_err, regs-&gt;nip, eaddr, paddr);
-
+	disposition = mce_handle_err_virtmode(regs, errp, mce_log,
+					      disposition);
 	return disposition;
 }
 
-- 
2.17.2


</pre>
      </blockquote>
    </blockquote>
    <br>
  </body>
</html>

--------------FE71DCBAEE7307A2CC581B61--

