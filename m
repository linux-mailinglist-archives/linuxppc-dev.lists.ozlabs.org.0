Return-Path: <linuxppc-dev+bounces-7289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 539DEA6CA81
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Mar 2025 15:16:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKhF236gxz2yTQ;
	Sun, 23 Mar 2025 01:16:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742652966;
	cv=none; b=MvmOUp2nBA4+HBhR0EsiY/CDc3ueSNr817mcJBYOXiH0lm9WKV1ACA2f2j5QvxnjKzWVJAYxrCYjo1dJC/P0f3NZ4u7UUnDdb28Tlkq6SuKEJ8KE4fXJwfmK8FFrfny55k3H6DyxunFs4E7E0a3N6lWX8KFf56bGdnzdRXwzkirTiq5rJ1zkW3SPM5mGg/d3S8DvKpoeWqPc0fo3arbERV8+1tCXgn8KasjJKztxrFo1rtE33j320mYsYksEhFE6Le5DPPLFjs1gNEafUAnDLPWEIDkVaReQUr9YlMmdiJv8+7eGXJ+Ua+Lr/dZzWVt+SX6iDE2nwo1pcvsBIDqf+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742652966; c=relaxed/relaxed;
	bh=2TRwiqSkbFHVjCTVROzGbvKy/nfUXvy3YcGeFnqWB5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=lKduXw3UCa1Ybd2B+0MB9ZCn3otSKvDr9oIlcosMqYsJ0vdOZ99QsAc+SyqHDUQ/J6v880D3Y2H43soi2IrgkG1iRJciT4kRzs0WLVy3+C/mL2fqWTAImz8eBPXJuWDIDTbsPn1FcNXpy+azZrL3EGJt4s9M4ftNFluOQqd1Du8yuatsKeDpCJTk4d7u4B9iHn4pjGTc88eiylmX2MAzDaqH0IlE3vgNryTK33x9FjKqTKNziPczELdMAaYH00vt4Wz9L3iC37bxoP1e36XWPkrPKsjM/JjJsTq7CWVpbHY9e4m4zsRXUogBr5EdP5si0pkoC0uhF8iZM/wJCIwdag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I7VkODU6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I7VkODU6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKhDy4PrDz2ySm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 23 Mar 2025 01:16:02 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52MAx5sa000469;
	Sat, 22 Mar 2025 14:15:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2TRwiq
	SkbFHVjCTVROzGbvKy/nfUXvy3YcGeFnqWB5Q=; b=I7VkODU6KkjtmclVj6PYRc
	cHO2m6pysRNn031A3xNyJQxtf1MUivQIWnJTUcWYBGyrgbSEu4JAv3E4VQ1uOTGM
	XF+x7fVhcw9Eub1tXVMYQ5qAv4TPTzDchYzrKKIMnjNOBgHgC2cnVGkBp/mSMke+
	2AIMoli0Tmv7GKtITJT5jcNojfPRwFn6ILEwo6jxA9Cz3s7M9Abh404hcltcSoUl
	LMzmjrziTPoTOP1cow6HWE/J3xrLi2/exD7xLCBquG4Z3zxlxBXcIYMq0gAjaqQx
	M/am89aLCuCRKImtogy5/dSAsXsSiaRyMIFOj4mgsf1dJ+ebyAoUZFx63p4bzHHw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45hngm9jqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Mar 2025 14:15:58 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52MEFwOG031493;
	Sat, 22 Mar 2025 14:15:58 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45hngm9jqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Mar 2025 14:15:58 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52MEAxR7008337;
	Sat, 22 Mar 2025 14:15:57 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45hn89hrn6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Mar 2025 14:15:57 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52MEFvjG21627596
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 22 Mar 2025 14:15:57 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2ED7458058;
	Sat, 22 Mar 2025 14:15:57 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 451D758057;
	Sat, 22 Mar 2025 14:15:53 +0000 (GMT)
Received: from [9.61.252.95] (unknown [9.61.252.95])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 22 Mar 2025 14:15:53 +0000 (GMT)
Message-ID: <49a741c3-2564-4d6f-b4e1-0402b52a4cb9@linux.ibm.com>
Date: Sat, 22 Mar 2025 19:45:51 +0530
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
Subject: Re: [linux-next-20250320][btrfs] Kernel OOPs while running btrfs/108
To: Qu Wenruo <quwenruo.btrfs@gmx.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>, linux-btrfs@vger.kernel.org
References: <e4b1ccf8-c626-4683-82db-219354a27e61@linux.ibm.com>
 <87h63ms7gk.fsf@gmail.com> <d3be2a1b-71d9-425f-bb56-30d3fd890270@gmx.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <d3be2a1b-71d9-425f-bb56-30d3fd890270@gmx.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OA9wgwp_0YBtFP2HRLhfI2ThCS2mXqPQ
X-Proofpoint-GUID: NdxYPujSaY4vidPPINVvboNrHPigKlhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-22_06,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503220103
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 22/03/25 2:48 am, Qu Wenruo wrote:
>
>
> 在 2025/3/22 02:26, Ritesh Harjani (IBM) 写道:
>>
>> +linux-btrfs
>>
>> Venkat Rao Bagalkote <venkat88@linux.ibm.com> writes:
>>
>>> Greetings!!!
>>>
>>>
>>> I am observing Kernel oops while running brtfs/108 TC on IBM Power 
>>> System.
>>>
>>> Repo: Linux-Next (next-20250320)
>>
>> Looks like this next tag had many btrfs related changes -
>> https://web.git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/log/fs/btrfs?h=next-20250320 
>>
>>
>>>
>>> Traces:
>>>
>>> [  418.392604] run fstests btrfs/108 at 2025-03-21 05:11:21
>>> [  418.560137] Kernel attempted to read user page (0) - exploit 
>>> attempt?
>>> (uid: 0)
>>> [  418.560156] BUG: Kernel NULL pointer dereference on read at 
>>> 0x00000000
>>
>> NULL pointer dereference...
>>
>>> [  418.560161] Faulting instruction address: 0xc0000000010ef8b0
>>> [  418.560166] Oops: Kernel access of bad area, sig: 11 [#1]
>>> [  418.560169] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=8192 NUMA 
>>> pSeries
>>> [  418.560174] Modules linked in: btrfs blake2b_generic xor raid6_pq
>>> zstd_compress loop nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib
>>> nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct
>>> nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 bonding nf_defrag_ipv4
>>> tls rfkill ip_set nf_tables nfnetlink sunrpc pseries_rng vmx_crypto 
>>> fuse
>>> ext4 mbcache jbd2 sd_mod sg ibmvscsi scsi_transport_srp ibmveth
>>> [  418.560212] CPU: 1 UID: 0 PID: 37583 Comm: rm Kdump: loaded Not
>>> tainted 6.14.0-rc7-next-20250320 #1 VOLUNTARY
>>> [  418.560218] Hardware name: IBM,9080-HEX Power11
>>> [  418.560223] NIP:  c0000000010ef8b0 LR: c00800000bb190ac CTR:
>>> c0000000010ef888
>>> [  418.560227] REGS: c0000000a252f5a0 TRAP: 0300   Not tainted
>>> (6.14.0-rc7-next-20250320)
>>> [  418.560232] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR:
>>> 44008444  XER: 20040000
>>> [  418.560240] CFAR: c00800000bc1df84 DAR: 0000000000000000 DSISR:
>>> 40000000 IRQMASK: 1
>>> [  418.560240] GPR00: c00800000bb190ac c0000000a252f840 
>>> c0000000016a8100
>>> 0000000000000000
>>> [  418.560240] GPR04: 0000000000000000 0000000000010000 
>>> 0000000000000000
>>> fffffffffffe0000
>>> [  418.560240] GPR08: c00000010724aad8 0000000000000003 
>>> 0000000000001000
>>> c00800000bc1df70
>>> [  418.560240] GPR12: c0000000010ef888 c000000affffdb00 
>>> 0000000000000000
>>> 0000000000000000
>>> [  418.560240] GPR16: 0000000000000000 0000000000000000 
>>> 0000000000000000
>>> 0000000000000000
>>> [  418.560240] GPR20: c0000000777a8000 c00000006a9c9000 
>>> c00000010724a950
>>> c0000000777a8000
>>> [  418.560240] GPR24: fffffffffffffffe c00000010724aad8 
>>> 0000000000010000
>>> 00000000000000a0
>>> [  418.560240] GPR28: 0000000000010000 c00c00000048c3c0 
>>> 0000000000000000
>>> 0000000000000000
>>> [  418.560287] NIP [c0000000010ef8b0] _raw_spin_lock_irq+0x28/0x98
>>> [  418.560294] LR [c00800000bb190ac] wait_subpage_spinlock+0x64/0xd0 
>>> [btrfs]
>>
>>
>> btrfs is working on subpage size support for a while now.
>> Adding +linux-btrfs, in case if they are already aware of this problem.
>>
>> I am not that familiar with btrfs code. But does this look like that the
>> subpage (folio->private became NULL here) somehow?
>
> The for-next branch seems to have some conflicts, IIRC the following two
> commits are no longer in our tree anymore:
>
> btrfs: kill EXTENT_FOLIO_PRIVATE
> btrfs: add mapping_set_release_always to inode's mapping
>
> I believe those two may be the cause.
>
> Mind to test with the our current for-next branch? Where that's all of
> our development happening, and I run daily subpage fstests on it to make
> sure at least that branch is safe:
>
>   https://github.com/btrfs/linux/tree/for-next
>
> And appreciate if you can verify if the NULL pointer dereference is
> still there on that branch.


I verified with the for-next repo, and I dont see the issue. btrfs/108 
passes.

./check btrfs/108
RECREATING    -- btrfs on /dev/loop0
FSTYP         -- btrfs
PLATFORM      -- Linux/ppc64le ltcden8-lp1 6.14.0-rc7-g88d324e69ea9 #1 
SMP Sat Mar 22 07:47:48 CDT 2025
MKFS_OPTIONS  -- -f -s 4096 -n 4096 /dev/loop1
MOUNT_OPTIONS -- -o context=system_u:object_r:root_t:s0 /dev/loop1 
/mnt/scratch

btrfs/108        1s
Ran: btrfs/108
Passed all 1 tests

Repo: https://github.com/btrfs/linux/tree/for-next


Regards,

Venkat.

>
> Thanks,
> Qu
>
>>
>> -ritesh
>>
>>> [  418.560339] Call Trace:
>>> [  418.560342] [c0000000a252f870] [c00800000bb205dc]
>>> btrfs_invalidate_folio+0xa8/0x4f0 [btrfs]
>>> [  418.560384] [c0000000a252f930] [c0000000004cbcdc]
>>> truncate_cleanup_folio+0x110/0x14c
>>> [  418.560391] [c0000000a252f960] [c0000000004ccc7c]
>>> truncate_inode_pages_range+0x100/0x4dc
>>> [  418.560397] [c0000000a252fbd0] [c00800000bb20ba8]
>>> btrfs_evict_inode+0x74/0x510 [btrfs]
>>> [  418.560437] [c0000000a252fc90] [c00000000065c71c] evict+0x164/0x334
>>> [  418.560443] [c0000000a252fd30] [c000000000647c9c] 
>>> do_unlinkat+0x2f4/0x3a4
>>> [  418.560449] [c0000000a252fde0] [c000000000647da0] 
>>> sys_unlinkat+0x54/0xac
>>> [  418.560454] [c0000000a252fe10] [c000000000033498]
>>> system_call_exception+0x138/0x330
>>> [  418.560461] [c0000000a252fe50] [c00000000000d05c]
>>> system_call_vectored_common+0x15c/0x2ec
>>> [  418.560468] --- interrupt: 3000 at 0x7fffb1b366bc
>>> [  418.560471] NIP:  00007fffb1b366bc LR: 00007fffb1b366bc CTR:
>>> 0000000000000000
>>> [  418.560475] REGS: c0000000a252fe80 TRAP: 3000   Not tainted
>>> (6.14.0-rc7-next-20250320)
>>> [  418.560479] MSR:  800000000280f033
>>> <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44008804  XER: 00000000
>>> [  418.560490] IRQMASK: 0
>>> [  418.560490] GPR00: 0000000000000124 00007ffffcb4e2b0 
>>> 00007fffb1c37d00
>>> ffffffffffffff9c
>>> [  418.560490] GPR04: 000000013d660380 0000000000000000 
>>> 0000000000000000
>>> 0000000000000003
>>> [  418.560490] GPR08: 0000000000000000 0000000000000000 
>>> 0000000000000000
>>> 0000000000000000
>>> [  418.560490] GPR12: 0000000000000000 00007fffb1dba5c0 
>>> 00007ffffcb4e538
>>> 000000011972d0e8
>>> [  418.560490] GPR16: 000000011972d098 000000011972d060 
>>> 000000011972d020
>>> 000000011972cff0
>>> [  418.560490] GPR20: 000000011972d298 000000011972cc10 
>>> 0000000000000000
>>> 000000013d6615a0
>>> [  418.560490] GPR24: 0000000000000002 000000011972d0b8 
>>> 000000011972cf98
>>> 000000011972d1d0
>>> [  418.560490] GPR28: 00007ffffcb4e538 000000013d6602f0 
>>> 0000000000000000
>>> 0000000000100000
>>> [  418.560532] NIP [00007fffb1b366bc] 0x7fffb1b366bc
>>> [  418.560536] LR [00007fffb1b366bc] 0x7fffb1b366bc
>>> [  418.560538] --- interrupt: 3000
>>> [  418.560541] Code: 7c0803a6 4e800020 3c4c005c 38428878 7c0802a6
>>> 60000000 39200001 992d0932 a12d0008 3ce0fffe 5529083c 61290001
>>> <7d001829> 7d063879 40c20018 7d063838
>>> [  418.560555] ---[ end trace 0000000000000000 ]---
>>>
>>>
>>> If you happed to fix this, please add below tag.
>>>
>>>
>>> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>>>
>>>
>>> Regards,
>>>
>>> Venkat.
>>
>
>

