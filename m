Return-Path: <linuxppc-dev+bounces-6684-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CC6A4DE9A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 14:03:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6bTc74yQz3blH;
	Wed,  5 Mar 2025 00:03:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741093412;
	cv=none; b=N8ABLLSdyGrQ1ydN0bn+ZBoECL08fUwlM8kXEfR8kYuqyKp1dA5H+T33hezhkfkfcJ9spfVlofo9uxelpiNb69BNq38asrgmDQ1UVliBAg82BIOxgEa6GBhLTxcNHg2cJb7pbU6vvIL42hETy4ZS45vuhmb8jGd8a0IfYpqXFO8qvz8/ujDzvYZS1OApJd/AVVRwozFyUWjuyKJ3rWBIAZvXa6IGwTuso/F4cw1UsY2lq/gmvEEjgV9ff34TNNVRoN3ZJta3K9deWHxmzVwI2ZQ2MkbMFRK90d7reiTDz3dI/z5aIWkQKXo5XPcpNgavLNEHhq4l3nnIcnkQhF4ZTw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741093412; c=relaxed/relaxed;
	bh=euZ8DxMSMx6rmx4z/sWvOjZi0F8HZrbTAT1UZpVcZXo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=iK2lOn42ufJys/Z7ldeyCoCvECAvKMGfddnn4i6clExzV3uGglDNKDLcXmSwPdmJX4G9dHe+188i/5+8aRfh3gBxNyddox2aGSETALVwrOmiwMw6YptmWhJhHTYI1DbqQ33bg/8hEAKheJaIbM6rIdKduioa5jFQ++4XjejMHKX0S/nGOcD1Csow4dZS04j1H36+ICZjt9Er0scV1RxFlGJmJlglNf3SdyaLkGw8S07Jk6jOxje4u2z4JSHpsB/feipSqKoDSyhrvLC+AAyDoTWxGIiDy2KleGBwhUr8ZMxiXma5QgAMZK4jfYy/xexYo5iJSHFuCKFlXabk4Yjbfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b4dMPjBQ; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=b4dMPjBQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6bTc1Jr2z30Vb
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Mar 2025 00:03:31 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5243jdmZ021463;
	Tue, 4 Mar 2025 13:03:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=euZ8Dx
	MSMx6rmx4z/sWvOjZi0F8HZrbTAT1UZpVcZXo=; b=b4dMPjBQRyameE4rF8mKf9
	et2qG8CXHgvJArptNEdFVliYIlKyEhYDAidEiza2vceUP+IP7yhajmtgdeov8bfK
	Hf/aBEiVGWHjsN4JXS546XFaCl4zcrUnAqILPh4IhhAvtnKBzBhU4Vb0Z8/z2hWG
	PL3ZqbubCc14mnSYraR7IAqVRaIVcWGkoQGX5iyh8sGsK3Q8D4FVDQWi4WfICdnv
	8fVVwz02yk8ZVcmOHdzPVfogF0md4lgzEcK2WYDxfPyXDKNfgWDTHEFUPy12icTW
	HBo7h7pUpDQULnapOsHO6vMNdQWtWmC0qQq/GTYIIPWhssuYEIimzTisiUm2UZQA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 455sw7jh39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 13:03:14 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 524BogVu013805;
	Tue, 4 Mar 2025 13:03:13 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454e2knc3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 13:03:13 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 524D3CBp26477256
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Mar 2025 13:03:13 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AF33B58054;
	Tue,  4 Mar 2025 13:03:12 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A01C5805E;
	Tue,  4 Mar 2025 13:03:10 +0000 (GMT)
Received: from [9.204.204.161] (unknown [9.204.204.161])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Mar 2025 13:03:10 +0000 (GMT)
Message-ID: <988cb994-d8b1-4688-b926-66507ebe90df@linux.ibm.com>
Date: Tue, 4 Mar 2025 18:33:08 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Build Warnings at arch/powerpc/
Content-Language: en-GB
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com>
 <47aa8b75-96b6-4e37-bb62-ad758b414076@linux.ibm.com>
 <8ba544e7-cf2a-4807-a056-683115805721@csgroup.eu>
 <bfcce9ce-bc26-4088-8d27-0797fc0d22d3@linux.ibm.com>
 <fe937273-d81a-4f6c-9eba-b96b711b4644@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <fe937273-d81a-4f6c-9eba-b96b711b4644@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Vdhte9sQSbjrloT_IM0X_9W0ET2oJPF5
X-Proofpoint-GUID: Vdhte9sQSbjrloT_IM0X_9W0ET2oJPF5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_05,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1011 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org


On 04/03/25 6:08 pm, Madhavan Srinivasan wrote:
>
> On 3/4/25 4:58 PM, Madhavan Srinivasan wrote:
>>
>> On 3/4/25 2:26 PM, Christophe Leroy wrote:
>>>
>>> Le 04/03/2025 à 07:13, Madhavan Srinivasan a écrit :
>>>>
>>>> On 3/4/25 10:42 AM, Venkat Rao Bagalkote wrote:
>>>>> Greetings!!
>>>>>
>>>>>
>>>>> Observing build warnings with linux-next and powerpc repo's. Issue is currently not seen on mainline yet.
>>>>>
>>>>> PPC Repo: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpowerpc%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C8e0f8501f09c48dbb43608dd5ae3c9bf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638766656585342184%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=e5BrJzcrtlITkLF31KltGExQ5Qe8fDVTMV6VfR4w9o8%3D&reserved=0 merge branch
>>>>>
>>>>> PPC Kernel Version: 6.14.0-rc4-g1304f486dbf1
>>>>> next Repo: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C8e0f8501f09c48dbb43608dd5ae3c9bf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638766656585355246%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=meQyZfB75HhJFCL6AX93slsyVwnogGPYFabDXl%2FLzDA%3D&reserved=0 master branch
>>>>>
>>>>> next Kernel Version: 6.14.0-rc5-next-20250303
>>>>>
>>>>>
>>>>> On linux-next kernel issue got introduced b/w next-20250227 and next-20250303
>>>>>
>>>>>
>>>>> Build Warnings:
>>>>>
>>>>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xe84: intra_function_call not a direct call
>>>>> arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: unannotated intra-function call
>>>>> arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: intra_function_call not a direct call
>>>>>
>>>>>
>>>> Can you please specific the compiler and compiler version you found this issue with
>>>>
>>> Can you also tell which defconfig you are using or provide your .config
>>>
>>> It might also be helpfull if you can provide a disassembly of the three file.o around the warned address.
>> I could recreate the issue with gcc 11.4.1 20231218 with today's linux-next (but could not recreate with gcc 14 or gcc 11.3.0)
>>
>> (20d5c66e1810 (HEAD -> master, tag: next-20250304, origin/master, origin/HEAD) Add linux-next specific files for 20250304)
>>
>> warning for one of the switch.S file :
>>
>>    CC      arch/powerpc/kernel/syscalls.o
>>    AS      arch/powerpc/kernel/switch.o
>> arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: intra_function_call not a direct call
> I guess this is becos, for bl .+4, we recently added in the arch_decode_instruction (decode.c) to set the type as INSN_OTHER
>
>          case 18: /* b[l][a] */
>                  if (ins == 0x48000005)  /* bl .+4 */
>                          typ = INSN_OTHER;
>
> Which I think is the issue here, changing it to INSN_CALL from INSN_OTHER fixes the warning
>
> diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
> index 26d5050424a9..ffd63a61a585 100644
> --- a/tools/objtool/arch/powerpc/decode.c
> +++ b/tools/objtool/arch/powerpc/decode.c
> @@ -56,7 +56,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
>          switch (opcode) {
>          case 18: /* b[l][a] */
>                  if (ins == 0x48000005)  /* bl .+4 */
> -                       typ = INSN_OTHER;
> +                       typ = INSN_CALL;
>                  else if (ins & 1)       /* bl[a] */
>                          typ = INSN_CALL;
>                  else            /* b[a] */
>
>
> Maddy
>
Maddy,

I changed the code manually and gave it a try. The Proposed fix, 
partially fixes the issue. It gets rid of two of the warnings, but below 
warning still persists.

arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: 
unannotated intra-function call

>>    CC      arch/powerpc/kernel/irq.o
>>    CC      arch/powerpc/kernel/align.o
>>    CC      arch/powerpc/kernel/signal_64.o
>>
>> Objdump of switch.o:
>> arch/powerpc/kernel/switch.o:     file format elf64-powerpcle
>>
>> Disassembly of section .text:
>>
>> 0000000000000000 <flush_branch_caches>:
>>         0:	a6 02 28 7d 	mflr    r9
>>         4:	05 00 00 48 	bl      8 <flush_branch_caches+0x8>
>>         8:	05 00 00 48 	bl      c <flush_branch_caches+0xc>
>>         c:	05 00 00 48 	bl      10 <flush_branch_caches+0x10>
>>        10:	05 00 00 48 	bl      14 <flush_branch_caches+0x14>
>>        14:	05 00 00 48 	bl      18 <flush_branch_caches+0x18>
>>        18:	05 00 00 48 	bl      1c <flush_branch_caches+0x1c>
>>        1c:	05 00 00 48 	bl      20 <flush_branch_caches+0x20>
>>        20:	05 00 00 48 	bl      24 <flush_branch_caches+0x24>
>>        24:	05 00 00 48 	bl      28 <flush_branch_caches+0x28>
>>        28:	05 00 00 48 	bl      2c <flush_branch_caches+0x2c>
>>
>>
>> arch/powerpc/kernel/switch.S failing src section:
>>
>> .balign 32
>> .global flush_branch_caches
>> flush_branch_caches:
>>          /* Save LR into r9 */
>>          mflr    r9
>>
>>          // Flush the link stack
>>          .rept 64
>>          ANNOTATE_INTRA_FUNCTION_CALL
>>          bl      .+4
>>          .endr
>>          b       1f
>>          nops    6
>>
>> Maddy
>>
>>
>>> Christophe
>>
>
Regards,

Venkat.


