Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1C569C63B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 09:02:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PKvzM1VBNz3bm9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 19:02:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jL67RiPz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jL67RiPz;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PKvyR23Mhz3bh6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 19:01:50 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31K7DjbK013868
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 08:01:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zw9A5R/5iWWq7SfhqzXOwgc/1qfsB24IRxX2Fx3HJRM=;
 b=jL67RiPz9fpugVaRw92AYn3ZYzGE3jTFXlpuNe2eyJgx92zy6GanNdlOdQW2M25aUVw3
 3pK45JYAcltXNXJdnWExAEwbtERJxHj28WI7enL11pzdQgN21QogqGXjskfhHWr2nm4w
 5XjBaBa6/1b7z2e6vfFAW1WaMfxH1xQpElNlUTJa7HRaqqrl4VKzcz4Fjzkw8uoXwFSn
 rMCMIykPnVAiaUvraP6/1C4vaVjU4ZDSvVyuYXLKH+vr0qfMb61XzfQan/9SeMwxbeKD
 9rXAtU6vcBmvzRNC4+OlvmKdqME2J0shL/XXliT1Y+w2drnDTqC8Apz5/JIzcVGDobch TA== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3nv1ukc7q2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 08:01:47 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31K7jrbN031088
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 08:01:46 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3ntpa69shs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Feb 2023 08:01:45 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31K81gb650069802
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Feb 2023 08:01:42 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 54B6720049;
	Mon, 20 Feb 2023 08:01:42 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F9262004B;
	Mon, 20 Feb 2023 08:01:41 +0000 (GMT)
Received: from [9.43.104.140] (unknown [9.43.104.140])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Feb 2023 08:01:41 +0000 (GMT)
Message-ID: <9ee1f333-9cb7-d7fe-4e3f-ded4990030de@linux.ibm.com>
Date: Mon, 20 Feb 2023 13:31:40 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/2] arch/powerpc/kvm: kvmppc_hv_entry: remove .global
 scope
Content-Language: en-US
To: Kautuk Consul <kconsul@linux.vnet.ibm.com>
References: <20230220052355.109033-1-kconsul@linux.vnet.ibm.com>
 <20230220052355.109033-2-kconsul@linux.vnet.ibm.com>
 <2fa8dd2a-1650-4adc-de2b-0f14dca683ed@linux.ibm.com>
 <Y/MhON/N6vG8wYWq@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <Y/MhON/N6vG8wYWq@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6uAsnNCz3BaHAZZzSAJ06qn3jXmcwOga
X-Proofpoint-ORIG-GUID: 6uAsnNCz3BaHAZZzSAJ06qn3jXmcwOga
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-20_04,2023-02-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0
 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302200067
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
Cc: Sathvika Vasireddy <sv@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 20/02/23 12:58, Kautuk Consul wrote:
> Hi Sathvika,
>
> (Sorry didn't include list in earlier email.)
>
> On Mon, Feb 20, 2023 at 12:35:09PM +0530, Sathvika Vasireddy wrote:
>> Hi Kautuk,
>>
>> On 20/02/23 10:53, Kautuk Consul wrote:
>>> kvmppc_hv_entry isn't called from anywhere other than
>>> book3s_hv_rmhandlers.S itself. Removing .global scope for
>>> this function.
>>>
>>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>> ---
>>>    arch/powerpc/kvm/book3s_hv_rmhandlers.S | 1 -
>>>    1 file changed, 1 deletion(-)
>>>
>>> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>>> index acf80915f406..7e063fde7adc 100644
>>> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>>> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>>> @@ -502,7 +502,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
>>>     *                                                                            *
>>>     *****************************************************************************/
>>> -.global kvmppc_hv_entry
>>>    kvmppc_hv_entry:
>>>    	/* Required state:
>> I see the following objtool warning with this patch applied.
>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0x48:
>> unannotated intra-function call
>>
>> Annotating kvmppc_hv_entry symbol with SYM_FUNC_START_LOCAL and SYM_FUNC_END
>> macros should help fix this warning.
> Not sure where to put the SYM_FUNC_END annotation.
> Will the following do:
> <snip>
>      ld  r0, VCPU_GPR(R0)(r4)
>      ld  r2, VCPU_GPR(R2)(r4)
>      ld  r3, VCPU_GPR(R3)(r4)
>      ld  r4, VCPU_GPR(R4)(r4)
>      HRFI_TO_GUEST
>      b   .
>
> SYM_FUNC_END(kvmppc_hv_entry)
>
> secondary_too_late:
>      li  r12, 0
>
> ?
>
> Thanks.

Placing SYM_FUNC_END(kvmppc_hv_entry) before kvmppc_got_guest() should do:

@@ -502,12 +500,10 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
* *
*****************************************************************************/

-.global kvmppc_hv_entry
-kvmppc_hv_entry:
+SYM_FUNC_START_LOCAL(kvmppc_hv_entry)

         /* Required state:
          *
-        * R4 = vcpu pointer (or NULL)
          * MSR = ~IR|DR
          * R13 = PACA
          * R1 = host R1
@@ -525,6 +521,8 @@ kvmppc_hv_entry:
         li      r6, KVM_GUEST_MODE_HOST_HV
         stb     r6, HSTATE_IN_GUEST(r13)

+       ld      r4, HSTATE_KVM_VCPU(r13)
+
  #ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
         /* Store initial timestamp */
         cmpdi   r4, 0
@@ -619,6 +617,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ARCH_207S)
         /* Do we have a guest vcpu to run? */
  10:    cmpdi   r4, 0
         beq     kvmppc_primary_no_guest
+SYM_FUNC_END(kvmppc_hv_entry)
+
  kvmppc_got_guest:
         /* Increment yield count if they have a VPA */
         ld      r3, VCPU_VPA(r4)


Thanks,
Sathvika
