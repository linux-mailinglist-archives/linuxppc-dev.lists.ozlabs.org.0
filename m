Return-Path: <linuxppc-dev+bounces-6683-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D89BA4DE20
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Mar 2025 13:39:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z6ZxW02Rnz30TS;
	Tue,  4 Mar 2025 23:39:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741091950;
	cv=none; b=MRY3W7WT1qG+EgdUecqsNR404UhiV3lxlD3VwYhn2gj1sPKutfv3+mfU4LRdT+U4ulQvwZUcvca5J8qJqBSjg5nMSPZotaNCd4BgDxi30a+8MK8SR7rwhgbhuZ9+tSbKn6hB6gZ3g2ldpkOpzVYCtErEKX/CFHOioibG2298B/95kLDUOqh4B53zV2y7iQiS02yBL50zTLa8mC+W/oYm4+CR+VFr259G3EHxkHlaM7xu5PmaOKVzCuUGvqf4RQD1oCwVATgFsb47OXNL0UyP+lcEvGCcD21hOoGUGeqH2eNtbHs0B6+BRmjGj4jGaX3OqU1GRwz10yJMFalcCjjCqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741091950; c=relaxed/relaxed;
	bh=I1c9fstLTzy44ZUVu7Lett6l+VBM2IvtubxWH37Fjq0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=OVuy2uGfXJ+VSDoBpX1/KvJGuH6CQq/CAGGYT1o0KyZSlMxerVtPxgY4gDhBu4Q8n8RJbrpIOzZLQse7nbsdKBDWlw/KEZ2PhvXdMypxnNcsnuEHT7eb7Ig3/Yva7QZgvXvt4L2MZ1sY3ASqpp4a5963y4gPbko+5EgyCwPjZYvmnQZS3F9Q61LnL3d0ijTXejWOPea4GmU0jxk4f8LSFeLwfGkl6ggcBOw55ps19ZwxQbDdcP1wZD5tq8j2WJr9dSbpEukTsIz7emGU48b1gW0BqSvZLnvArQlHUUL2sF3lo9m1NC1vNyMQDlPWiGhRWiDENhJMjXTuK8MJ5P22LQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ib1QG8Ar; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ib1QG8Ar;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z6ZxV0VPnz30Ns
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Mar 2025 23:39:09 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5243joPm021783;
	Tue, 4 Mar 2025 12:38:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=I1c9fs
	tLTzy44ZUVu7Lett6l+VBM2IvtubxWH37Fjq0=; b=ib1QG8ArExfz3MyTPxet3h
	Eiuyc70UoqQ7+C/5Heqd9WF7tFO9yyx50lKZFrQOC/5lOr6PY5lRaSoDdbTfo4+e
	zTOzbc37w4uynV7gxQVo+9FfnDs4Qi3G08cmgD4C99Ab7uhvsM4ouKCmMX0/zQGC
	DLSl7Agw/OTbKlMzyP7F29FOxey2/gyoVMACdIPxgj3nPWPWCdmRkLqegvj80RpG
	dj8H+PtuuL9nSxdJB9qdziGTxqRyo0VdaIG1som15hfOZPtq315uzFsXOG/MnJuS
	f3384dPJRUB0JEVL4Wt33+YbQ4Bs6bOjdkG1IGw5YF4al4TRT7izgOwbDzcUY2sA
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 455sw7jdsn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 12:38:53 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 524C5EAc013772;
	Tue, 4 Mar 2025 12:38:52 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 454e2kn9b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Mar 2025 12:38:52 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 524CcqUu25756290
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 4 Mar 2025 12:38:52 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 061265805F;
	Tue,  4 Mar 2025 12:38:52 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A74958051;
	Tue,  4 Mar 2025 12:38:48 +0000 (GMT)
Received: from [9.43.105.169] (unknown [9.43.105.169])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  4 Mar 2025 12:38:47 +0000 (GMT)
Message-ID: <fe937273-d81a-4f6c-9eba-b96b711b4644@linux.ibm.com>
Date: Tue, 4 Mar 2025 18:08:45 +0530
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
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>
References: <8c4c3fc2-2bd7-4148-af68-2f504d6119e0@linux.ibm.com>
 <47aa8b75-96b6-4e37-bb62-ad758b414076@linux.ibm.com>
 <8ba544e7-cf2a-4807-a056-683115805721@csgroup.eu>
 <bfcce9ce-bc26-4088-8d27-0797fc0d22d3@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <bfcce9ce-bc26-4088-8d27-0797fc0d22d3@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: kZ3E3pdPJJc4GMLcWZe_BCZ62He4JSX_
X-Proofpoint-GUID: kZ3E3pdPJJc4GMLcWZe_BCZ62He4JSX_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-04_05,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503040102
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 3/4/25 4:58 PM, Madhavan Srinivasan wrote:
> 
> 
> On 3/4/25 2:26 PM, Christophe Leroy wrote:
>>
>>
>> Le 04/03/2025 à 07:13, Madhavan Srinivasan a écrit :
>>>
>>>
>>> On 3/4/25 10:42 AM, Venkat Rao Bagalkote wrote:
>>>> Greetings!!
>>>>
>>>>
>>>> Observing build warnings with linux-next and powerpc repo's. Issue is currently not seen on mainline yet.
>>>>
>>>> PPC Repo: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpowerpc%2Flinux.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C8e0f8501f09c48dbb43608dd5ae3c9bf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638766656585342184%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=e5BrJzcrtlITkLF31KltGExQ5Qe8fDVTMV6VfR4w9o8%3D&reserved=0 merge branch
>>>>
>>>> PPC Kernel Version: 6.14.0-rc4-g1304f486dbf1
>>>> next Repo: https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fnext%2Flinux-next.git&data=05%7C02%7Cchristophe.leroy2%40cs-soprasteria.com%7C8e0f8501f09c48dbb43608dd5ae3c9bf%7C8b87af7d86474dc78df45f69a2011bb5%7C0%7C0%7C638766656585355246%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=meQyZfB75HhJFCL6AX93slsyVwnogGPYFabDXl%2FLzDA%3D&reserved=0 master branch
>>>>
>>>> next Kernel Version: 6.14.0-rc5-next-20250303
>>>>
>>>>
>>>> On linux-next kernel issue got introduced b/w next-20250227 and next-20250303
>>>>
>>>>
>>>> Build Warnings:
>>>>
>>>> arch/powerpc/kvm/book3s_hv_rmhandlers.o: warning: objtool: .text+0xe84: intra_function_call not a direct call
>>>> arch/powerpc/crypto/ghashp8-ppc.o: warning: objtool: .text+0x22c: unannotated intra-function call
>>>> arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: intra_function_call not a direct call
>>>>
>>>>
>>>
>>> Can you please specific the compiler and compiler version you found this issue with
>>>
>>
>> Can you also tell which defconfig you are using or provide your .config
>>
>> It might also be helpfull if you can provide a disassembly of the three file.o around the warned address.
> 
> I could recreate the issue with gcc 11.4.1 20231218 with today's linux-next (but could not recreate with gcc 14 or gcc 11.3.0)
> 
> (20d5c66e1810 (HEAD -> master, tag: next-20250304, origin/master, origin/HEAD) Add linux-next specific files for 20250304)
> 
> warning for one of the switch.S file :
> 
>   CC      arch/powerpc/kernel/syscalls.o
>   AS      arch/powerpc/kernel/switch.o
> arch/powerpc/kernel/switch.o: warning: objtool: .text+0x4: intra_function_call not a direct call

I guess this is becos, for bl .+4, we recently added in the arch_decode_instruction (decode.c) to set the type as INSN_OTHER

        case 18: /* b[l][a] */
                if (ins == 0x48000005)  /* bl .+4 */
                        typ = INSN_OTHER;

Which I think is the issue here, changing it to INSN_CALL from INSN_OTHER fixes the warning 

diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
index 26d5050424a9..ffd63a61a585 100644
--- a/tools/objtool/arch/powerpc/decode.c
+++ b/tools/objtool/arch/powerpc/decode.c
@@ -56,7 +56,7 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
        switch (opcode) {
        case 18: /* b[l][a] */
                if (ins == 0x48000005)  /* bl .+4 */
-                       typ = INSN_OTHER;
+                       typ = INSN_CALL;
                else if (ins & 1)       /* bl[a] */
                        typ = INSN_CALL;
                else            /* b[a] */


Maddy

>   CC      arch/powerpc/kernel/irq.o
>   CC      arch/powerpc/kernel/align.o
>   CC      arch/powerpc/kernel/signal_64.o
> 
> Objdump of switch.o:
> arch/powerpc/kernel/switch.o:     file format elf64-powerpcle
> 
> Disassembly of section .text:
> 
> 0000000000000000 <flush_branch_caches>:
>        0:	a6 02 28 7d 	mflr    r9
>        4:	05 00 00 48 	bl      8 <flush_branch_caches+0x8>
>        8:	05 00 00 48 	bl      c <flush_branch_caches+0xc>
>        c:	05 00 00 48 	bl      10 <flush_branch_caches+0x10>
>       10:	05 00 00 48 	bl      14 <flush_branch_caches+0x14>
>       14:	05 00 00 48 	bl      18 <flush_branch_caches+0x18>
>       18:	05 00 00 48 	bl      1c <flush_branch_caches+0x1c>
>       1c:	05 00 00 48 	bl      20 <flush_branch_caches+0x20>
>       20:	05 00 00 48 	bl      24 <flush_branch_caches+0x24>
>       24:	05 00 00 48 	bl      28 <flush_branch_caches+0x28>
>       28:	05 00 00 48 	bl      2c <flush_branch_caches+0x2c>
> 
> 
> arch/powerpc/kernel/switch.S failing src section:
> 
> .balign 32
> .global flush_branch_caches
> flush_branch_caches:
>         /* Save LR into r9 */
>         mflr    r9
> 
>         // Flush the link stack
>         .rept 64
>         ANNOTATE_INTRA_FUNCTION_CALL
>         bl      .+4
>         .endr
>         b       1f
>         nops    6
> 
> Maddy 
> 
> 
>>
>> Christophe
> 
> 


