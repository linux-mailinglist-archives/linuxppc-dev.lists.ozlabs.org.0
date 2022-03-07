Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7224D0293
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 16:18:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KC2Cf3PPKz3bPR
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Mar 2022 02:18:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NorZp3Of;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NorZp3Of; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KC2Bq3gjXz2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Mar 2022 02:17:39 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227EopIf013179; 
 Mon, 7 Mar 2022 15:17:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=Dp53y1pG1bb8COWig2+bEwjvaUAGAwNguXzTNTvLmOU=;
 b=NorZp3OfEhSH+LuSg6mS7taxOBadXTw/YY2/tli1Y385renPdVXhFXOmRmFy9T5t65s0
 zmPPY/ggzv+mg26Q1bJfoGPOW9LnH5AxTGgGlHkWIHs8HDNYzACjXxOORS5UR9YhYxMM
 1w/mqhHM+uN4F/YpuY7SrhhLeOUd+oBa7Rv5RY2rbSxcxmyD5JvjxRcQ9a2pK/aRRDI6
 V1aCP/Kjurd3bT6aZNjeGGFygmgrOZ0TZVUXpO6EdHG0qlu3poAFTHNmaS05U5SjNUwp
 RY1WTCeY1AyXmJYpgtHvRH0Mjor2Q5pmCVhy42pMi701isLZ6NwFS+F14aOJKVfuxBMY Ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enm60gngn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 15:17:33 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 227EpKqp014162;
 Mon, 7 Mar 2022 15:17:32 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3enm60gng8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 15:17:32 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 227F7jD7024347;
 Mon, 7 Mar 2022 15:17:32 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04wdc.us.ibm.com with ESMTP id 3ekyg96k1v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 15:17:32 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 227FHUrX6095268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Mar 2022 15:17:30 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C51E478060;
 Mon,  7 Mar 2022 15:17:30 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 340CB78095;
 Mon,  7 Mar 2022 15:17:30 +0000 (GMT)
Received: from localhost (unknown [9.211.158.32])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon,  7 Mar 2022 15:17:30 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH] KVM: PPC: Book3s HV: Allow setting GTSE for the
 nested guest
In-Reply-To: <87bkyitibx.fsf@linux.ibm.com>
References: <20220304182657.2489303-1-farosas@linux.ibm.com>
 <87bkyitibx.fsf@linux.ibm.com>
Date: Mon, 07 Mar 2022 12:17:28 -0300
Message-ID: <87lexl4ws7.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1D_u4gYYSVYFp884nlpZtVUQy5v5XVMT
X-Proofpoint-GUID: ymga2VFCOieBRU7_ccFECa1TJHOiukTW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_05,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 lowpriorityscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 adultscore=0 bulkscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070088
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:

> Fabiano Rosas <farosas@linux.ibm.com> writes:
>
>> We're currently getting a Program Interrupt inside the nested guest
>> kernel when running with GTSE disabled in the nested hypervisor. We
>> allow any guest a cmdline override of GTSE for migration purposes. The
>> nested guest does not know it needs to use the option and tries to run
>> 'tlbie' with LPCR_GTSE=0.
>>
>> The details are a bit more intricate:
>>
>> QEMU always sets GTSE=1 in OV5 even before calling KVM. At prom_init,
>> guests use the OV5 value to set MMU_FTR_GTSE. This setting can be
>> overridden by 'radix_hcall_invalidate=on' in the kernel cmdline. The
>> option itself depends on the availability of
>> FW_FEATURE_RPT_INVALIDATE, which it tied to QEMU's cap-rpt-invalidate
>> capability.
>>
>> The MMU_FTR_GTSE flag leads guests to set PROC_TABLE_GTSE in their
>> process tables and after H_REGISTER_PROC_TBL, both QEMU and KVM will
>> set LPCR_GTSE=1 for that guest. Unless the guest uses the cmdline
>> override, in which case:
>>
>>   MMU_FTR_GTSE=0 -> PROC_TABLE_GTSE=0 -> LPCR_GTSE=0
>>
>> We don't allow the nested hypervisor to set some LPCR bits for its
>> nested guests, so if the nested HV has LPCR_GTSE=0, its nested guests
>> will also have LPCR_GTSE=0. But since the only thing that can really
>> flip GTSE is the cmdline override, if a nested guest runs without it,
>> then the sequence goes:
>>
>>   MMU_FTR_GTSE=1 -> PROC_TABLE_GTSE=1 -> LPCR_GTSE=0.
>>
>> With LPCR_GTSE=0 the HW will treat 'tlbie' as HV privileged.
>>
>> This patch allows a nested HV to set LPCR_GTSE for its nested guests
>> so the LPCR setting will match what the nested guest sees in OV5.
>
> This needs a Fixes: tag?

This feature was done in many pieces, I think it will end up being the
commit that enabled the H_RPT_INVALIDATE capability:

Fixes: b87cc116c7e1 ("KVM: PPC: Book3S HV: Add KVM_CAP_PPC_RPT_INVALIDATE capability")

> I am not sure what is broken. If L1 doesn't support GTSE, then it should
> publish the same to L2 and L2 should not use tlbie.

L1 cannot set L2's LPCR to the correct value because L0 will not allow
it. That is what this patch is changing.

I looked into having QEMU set the proper values to use with CAS, but
that is done in QEMU too early, before the first dispatch of L2 (which
is when L0 decides that L1 is not allowed to modify some bits). So QEMU
always advertises GTSE=1.

> That was working before? Or is it that the kernel command to disable
> gtse when used with L2 kernel is broken?

The command line works, but it needs to be explicitly given when
starting the L2. There is no link between L1 and L2 when it comes to
GTSE aside from the LPCR value L1 chose to use. So L2 can start with no
command line at all, while L1 had GTSE disabled.

AFAICT, this has always been broken. The stack leading to this is:

NIP [c00000000008615c] radix__flush_tlb_kernel_range+0x13c/0x420
[c000000000075840] change_page_attr+0xb0/0x240
[c00000000044624c] __apply_to_page_range+0x5ac/0xb90
[c000000000075bbc] change_memory_attr+0x7c/0x150
[c000000000350390] bpf_prog_select_runtime+0x200/0x290
[c000000000d9400c] bpf_migrate_filter+0x18c/0x1e0
[c000000000d95f38] bpf_prog_create+0x178/0x1d0
[c00000000130e4f4] ptp_classifier_init+0x4c/0x80
[c00000000130d874] sock_init+0xe0/0x100
[c0000000000121e0] do_one_initcall+0x60/0x2c0
[c0000000012b48cc] kernel_init_freeable+0x33c/0x3dc
[c0000000000127c8] kernel_init+0x44/0x18c
[c00000000000ce64] ret_from_kernel_thread+0x5c/0x64

>>
>> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
>> ---
>>  arch/powerpc/kvm/book3s_hv_nested.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
>> index 9d373f8963ee..5b9008d89f90 100644
>> --- a/arch/powerpc/kvm/book3s_hv_nested.c
>> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
>> @@ -262,7 +262,7 @@ static void load_l2_hv_regs(struct kvm_vcpu *vcpu,
>>  	 * Don't let L1 change LPCR bits for the L2 except these:
>>  	 */
>>  	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
>> -		LPCR_LPES | LPCR_MER;
>> +		LPCR_LPES | LPCR_MER | LPCR_GTSE;
>>  
>>  	/*
>>  	 * Additional filtering is required depending on hardware
>> -- 
>> 2.34.1
