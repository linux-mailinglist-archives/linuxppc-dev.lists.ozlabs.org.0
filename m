Return-Path: <linuxppc-dev+bounces-13834-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A6BC3981F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 09:06:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2FBl27v3z3btw;
	Thu,  6 Nov 2025 19:06:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762416383;
	cv=none; b=Hekn4esuHV06Aj6TbkUKhEvESc9iPubJcm57pA9Zqpe6xCwdAFMQPaAscFmo4mN9yIEcXycEDAQJI8hAGBms+qGZoXoh33yFJAH1Ei1Q3Qw3v2KsMjV6p0mwAs0je8TBPugPMvSqYhFZyJJO7HAIjkMrgb+TQERS1GN4ieS61kGRWN5ZRPJAmhYLPzzq1S29a7oEyVuLdCvqlV/9K66Eyxjomzsgv/uRv2ebqP5SO8yRjy5LoqNcQGDMGJM4KPRjGyOuP554XN793qxMFXb7k5tS701keweq/xTQ6dUgARma8GEgEjyHRYz948fXtEM2UyXzoVuW8dbCLGUFX2V0AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762416383; c=relaxed/relaxed;
	bh=GcPVE+Bt0+691uanTzZ6AQR9EtD6ext5gTgu22ByQss=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=QL0yugrFRBeFYyZUnzdxEjaJp092OfJZc9i7Tg/Ik884pB6HHOZ8VWsS4MQG/QZOOI+tcR9D0e7XVhtv0WpnY/mhCWMsV4OQwC9VMQaTJprlooJshanwkNn7NIXuVgXWRIHhN/EgCuLKE9pdEghwQUAJa5Md/vIOrbPXWsFPszQMOsVtvinR87qSeDDZn3suTwt3GgKSllv9Gd1BcV1bBnYYHnE7wbbmwIajCtT2psT4KCesJhPRgKNEewtyKXkXtlBDiJXvOt9YI21j8avjoRSTuoUS/Pv3MKND4Wa6UoDOoxBhVvWwJ836hrRCodp2LqQShtExZfN0ld5RIMxQnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=le4SFKMY; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=le4SFKMY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2FBj5Mf1z2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 19:06:21 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A60a2XZ029885;
	Thu, 6 Nov 2025 08:06:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=GcPVE+
	Bt0+691uanTzZ6AQR9EtD6ext5gTgu22ByQss=; b=le4SFKMYUHe6bZ4xlQIWBV
	GoQctNNUEBo/5wfoQ5fLrVWSqdwjKXbtdc7PhKxHc0ODtYE2Zx1uADCbmCku9had
	Httn+m08SVwXafg8Y83cQuryNT/br+KsdNtiKReb0WRRJDt54oYtLtyfe8Sj01mc
	9n5ApVUEsheA4rYEayj5KpMEaRIgX6fzN0IMzuHzEbmSa14ItiXNg72SOHVM/FTg
	4nyfSgghIRlRfXs18wHxWCoBoYS0qYXjeyOhF6wwMpLI99Ol3g2S+GY/IVQQUqDH
	L9qp8RxJv/mSRxIpVpGbKfWtFvTQ9rJHw7uVyC+ADQp+Nbo+Fgy3hmSITbUwajRA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mrd9bd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 08:06:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A67lGCL009855;
	Thu, 6 Nov 2025 08:06:16 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4a5x1kmapm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Nov 2025 08:06:16 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A686Ele31261202
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Nov 2025 08:06:14 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85A7D58056;
	Thu,  6 Nov 2025 08:06:14 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 990DD58052;
	Thu,  6 Nov 2025 08:06:12 +0000 (GMT)
Received: from [9.98.109.80] (unknown [9.98.109.80])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Nov 2025 08:06:12 +0000 (GMT)
Message-ID: <55249262-e8aa-40a7-8784-1c883d0b0c30@linux.ibm.com>
Date: Thu, 6 Nov 2025 13:36:11 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [mainline] Kernel OOPs while running powerpc/mce/ selftest
Content-Language: en-GB
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Ganesh Goudar <ganeshgr@linux.ibm.com>,
        Nathan Lynch <nathanl@linux.ibm.com>
References: <4b107285-57d7-482d-9fdf-8499e5fdbebb@linux.ibm.com>
 <18dd8200-6a8c-449e-9fb8-56874342defb@csgroup.eu>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <18dd8200-6a8c-449e-9fb8-56874342defb@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: VNI9_mDa694wphE-RXidgrZv-Shg1cmI
X-Authority-Analysis: v=2.4 cv=MKhtWcZl c=1 sm=1 tr=0 ts=690c56f9 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=FSTmDItLWoQog4XJFnAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: VNI9_mDa694wphE-RXidgrZv-Shg1cmI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAwMSBTYWx0ZWRfXyMLkV1cliQGd
 kKY9gV8OrwL8vVuxCSE472awj694wkzSELIoZtvo/OA5/VQpwbldyt82jZd2e1qoQRfnQORJRC6
 qKGqe712rB8rOu8ASnLMB62imDpIZD3Ec9ID8ActZW0/qhm01Hd1Z+B2Kg++89i6n1wgNZQkNL+
 1NsXmYP7yj95/WuAaATAxLQx5FsoMPdH7SkU34kRT+eROBVPVrSDnjQLrAEvrNRyc+zVfJqhzFJ
 CtRxHZ7fiH+uYsJ4v+bgu69lS0JANqEiAxri9PGpOZ7DO/EX+rVhhquVa3Z+MKj8MGRVZV9Kd+P
 yj/Y8mIkNtuU6LNHZL7LlKlBxlF7qrVEUGjuVTbnUY2uKneVimp/QWRAR7Noyu+CTZFP5E0/D12
 jLIM2GOP40NJ3pKCevI5VHkVUYfHzA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-06_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 05/11/25 7:15 pm, Christophe Leroy wrote:
>
>
> Le 23/10/2025 à 06:54, Venkat Rao Bagalkote a écrit :
>> Greetings!!!
>>
>>
>> IBM CI has reported a kernel crash while running mce selftests on 
>> mainline kernel, from tools/testing/selftests/powerpc/mce/.
>>
>>
>> This issue is hit when CONFIG_KASAN is enabled. If its disabled, test 
>> passes.
>>
>>
>> Traces:
>>
>>
>> [ 8041.225432] BUG: Unable to handle kernel data access on read at 
>> 0xc00e0001a1ad6103
>> [ 8041.225453] Faulting instruction address: 0xc0000000008c54d8
>> [ 8041.225461] Oops: Kernel access of bad area, sig: 11 [#1]
>> [ 8041.225467] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=8192 NUMA pSeries
>> [ 8041.225475] Modules linked in: nft_fib_inet nft_fib_ipv4 
>> nft_fib_ipv6 nft_fib nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 
>> nft_reject nft_ct nft_chain_nat nf_nat nf_conntrack bonding tls 
>> nf_defrag_ipv6 nf_defrag_ipv4 rfkill ip_set nf_tables nfnetlink 
>> pseries_rng vmx_crypto dax_pmem fuse ext4 crc16 mbcache jbd2 nd_pmem 
>> papr_scm sd_mod libnvdimm sg ibmvscsi ibmveth scsi_transport_srp 
>> pseries_wdt
>> [ 8041.225558] CPU: 17 UID: 0 PID: 877869 Comm: inject-ra-err Kdump: 
>> loaded Not tainted 6.18.0-rc2+ #1 VOLUNTARY
>> [ 8041.225569] Hardware name: IBM,9080-HEX Power11 (architected) 
>> 0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
>> [ 8041.225576] NIP:  c0000000008c54d8 LR: c00000000004e464 CTR: 
>> 0000000000000000
>> [ 8041.225583] REGS: c0000000fff778d0 TRAP: 0300   Not tainted 
>> (6.18.0- rc2+)
>> [ 8041.225590] MSR:  8000000000001003 <SF,ME,RI,LE>  CR: 48002828  
>> XER: 00000000
>> [ 8041.225607] CFAR: c00000000004e460 DAR: c00e0001a1ad6103 DSISR: 
>> 40000000 IRQMASK: 3
>> [ 8041.225607] GPR00: c0000000019d0598 c0000000fff77b70 
>> c00000000244a400 c000000d0d6b0818
>> [ 8041.225607] GPR04: 0000000000004d43 0000000000000008 
>> c00000000004e464 004d424900000000
>> [ 8041.225607] GPR08: 0000000000000001 18000001a1ad6103 
>> a80e000000000000 0000000003000048
>> [ 8041.225607] GPR12: 0000000000000000 c000000d0ddf3300 
>> 0000000000000000 0000000000000000
>> [ 8041.225607] GPR16: 0000000000000000 0000000000000000 
>> 0000000000000000 0000000000000000
>> [ 8041.225607] GPR20: 0000000000000000 0000000000000000 
>> 0000000000000000 0000000000000000
>> [ 8041.225607] GPR24: 0000000000000000 0000000000000000 
>> 0000000000000000 0000000000000000
>> [ 8041.225607] GPR28: c000000d0d6b0888 c000000d0d6b0800 
>> 0000000000004d43 c000000d0d6b0818
>> [ 8041.225701] NIP [c0000000008c54d8] __asan_load2+0x54/0xd8
>> [ 8041.225712] LR [c00000000004e464] pseries_errorlog_id+0x20/0x3c
>> [ 8041.225722] Call Trace:
>> [ 8041.225726] [c0000000fff77b90] [c0000000001f8748] 
>> fwnmi_get_errinfo+0xd4/0x104
>> [ 8041.225738] [c0000000fff77bc0] [c0000000019d0598] 
>> get_pseries_errorlog+0xa8/0x110
>> [ 8041.225750] [c0000000fff77c00] [c0000000001f8f68] 
>> pseries_machine_check_realmode+0x11c/0x214
>> [ 8041.225762] [c0000000fff77ce0] [c000000000049ca4] 
>> machine_check_early+0x74/0xc0
>> [ 8041.225771] [c0000000fff77d30] [c0000000000084a4] 
>> machine_check_early_common+0x1b4/0x2c0
>
> Is it a new problem or has it always been there ?


Its not a new problem. I have enabled KASAN recently in the config, and 
then I started seeing this issue.

I have tested on 6.17, 6.16 and 6.15 kernels and issues is there all along.


Regards,

Venkat.

>
> The problem is because KASAN is not compatible with realmode (MMU 
> translation is OFF).
>
> pseries_machine_check_realmode() is located in 
> arch/powerpc/platforms/pseries/ras.c built with KASAN_SANITIZE_ras.o := n
>
> But pseries_machine_check_realmode() calls mce_handle_error() which 
> calls get_pseries_errorlog().
>
> get_pseries_errorlog() is in arch/powerpc/kernel/rtas.c which is _not_ 
> built with KASAN_SANITIZE disabled hence the Oops.
>
> Unrelated, but it looks like there is also a problem with commit 
> cc15ff327569 ("powerpc/mce: Avoid using irq_work_queue() in 
> realmode"), which removed the re-enabling of translation but left the 
> call to mce_handle_err_virtmode().
>
> Christophe
>

