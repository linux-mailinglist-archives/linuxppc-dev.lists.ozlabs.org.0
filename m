Return-Path: <linuxppc-dev+bounces-7262-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 77CCCA6B8C8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 11:30:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZJzH96PWcz30MY;
	Fri, 21 Mar 2025 21:30:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742553029;
	cv=none; b=j4aLmE0k4Jmgi+2k8L3xjl0B3564tFIxQVKjQz1C7jy8S6FwTJR5wAi596DA3WYYER//e3tICOsnbaQ3GwGXCX9el/jrZA0cHxBHHN73ck9v61se7jln6077Pz8LnWnpcbJr/MH0aQf7ywlFaqWNw30FU0rxWWBRFkVNRwiuPQE1t2tJynNjCYVELiZubtjhgcorh6BvOcLs7d5z30Ev4KKCqwfk27qq1DOTU64v7Cm/vC5bHtmKMzUlDsIzAY1GnqExfBpk1NztjSEP5O6yjhusZdgekevIlizQM3ZTwkFNUc5u9mlng+g4qJqP4mrM6NoI8os1c4c1xDlqZXg1/w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742553029; c=relaxed/relaxed;
	bh=qPrhNtG5kUgPX7EY3IhX4pYwpWOMQOkxgK/1inO6WEE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=JnToe3OTrL/sNyY9kwzxDql6PERqlN4ZCJZ5w4EOEP6pxNDlB/A6DguyWxCPGG3SmWwuYKl2X7NWOcKsqj6RJrsZ/duzPKS0NvHtJtdboGgEZk8DlnOSJyhg/fVwNGbN4o6XGDdMdCL40BhxmrpX5PCMTNVDAFFw9QYaSE1L9PIBakAjEmd1lz8tknT64Gf8z1XGvy9OFjDqv14ECJKQp1I9Uuutkfz3B0baSIKxeXUEtBWviM4/dXbg8bUSdeD63slVW5Cko1hC/Ykn9DzhsDVAsr2FRYS/gXPAFYBZ4PcWLpfSpSBkY5a3pqckbuMefLZkYRH6jR87WKdTV/TtfQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lQsj3Ffq; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lQsj3Ffq;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZJzH80H2Pz30MR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Mar 2025 21:30:27 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52L1KIHE030525;
	Fri, 21 Mar 2025 10:30:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=qPrhNt
	G5kUgPX7EY3IhX4pYwpWOMQOkxgK/1inO6WEE=; b=lQsj3FfqC+tKNMJRn5YDkJ
	nu3Yw2RAxFNGKgDUQE5DDUyFpEkO8bq5bcZIN0glKEYDhSKl3w7lQaUKBCP94oQM
	T1Uxs06B+ShEDArv2i+Wc0WZ5H+x6MuQ43vCytSiCZABEwJPArCxIKh2oQ02Ycbo
	BIUgsi7LU+7LbSOSksohZ5OlgJMjm1BfHyrRzC+LdNKynTaTShBdmjLcMQyyZqgB
	exy5NOwcBAO9GjBXLhny3QV4L9NHExow7fl5ZgQBeicR2kbURrRAOwaN7s6m4G1g
	JSmm+BxZruQyYf6jWo3w7cQcvZfgH//xll5RFmlbW94o4U4R6Z6BZ8nm/FEzoZoA
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45gk21wvja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 10:30:25 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52L8uP1O023208;
	Fri, 21 Mar 2025 10:30:24 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45dp3m4mqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Mar 2025 10:30:24 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52LAUNLl32440620
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Mar 2025 10:30:23 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 315925805C;
	Fri, 21 Mar 2025 10:30:23 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B84145806A;
	Fri, 21 Mar 2025 10:30:21 +0000 (GMT)
Received: from [9.61.240.173] (unknown [9.61.240.173])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Mar 2025 10:30:21 +0000 (GMT)
Message-ID: <99ad46fd-71cf-4e3d-8632-f22960aec4a2@linux.ibm.com>
Date: Fri, 21 Mar 2025 16:00:20 +0530
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
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
To: LKML <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
        Madhavan Srinivasan <maddy@linux.ibm.com>, riteshh@linux.ibm.com
References: <e4b1ccf8-c626-4683-82db-219354a27e61@linux.ibm.com>
In-Reply-To: <e4b1ccf8-c626-4683-82db-219354a27e61@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jYsY48JzYY32QnJSkkOKScWcM8Ijr4ZK
X-Proofpoint-GUID: jYsY48JzYY32QnJSkkOKScWcM8Ijr4ZK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-21_04,2025-03-20_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1015
 bulkscore=0 adultscore=0 priorityscore=1501 spamscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503210077
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On 21/03/25 3:50 pm, Venkat Rao Bagalkote wrote:
> Greetings!!!
>
>
> I am observing Kernel oops while running brtfs/108 TC on IBM Power 
> System.
>
> Repo: Linux-Next (next-20250320)


Additional Info:

BTRFS tool: btrfs-progs v6.12

BTRFS tool repo: 
https://git.kernel.org/pub/scm/linux/kernel/git/kdave/btrfs-progs.git

XFS Repo:https://git.kernel.org/pub/scm/fs/xfs/xfstests-dev.git/

>
> Traces:
>
> [  418.392604] run fstests btrfs/108 at 2025-03-21 05:11:21
> [  418.560137] Kernel attempted to read user page (0) - exploit 
> attempt? (uid: 0)
> [  418.560156] BUG: Kernel NULL pointer dereference on read at 0x00000000
> [  418.560161] Faulting instruction address: 0xc0000000010ef8b0
> [  418.560166] Oops: Kernel access of bad area, sig: 11 [#1]
> [  418.560169] LE PAGE_SIZE=64K MMU=Radix  SMP NR_CPUS=8192 NUMA pSeries
> [  418.560174] Modules linked in: btrfs blake2b_generic xor raid6_pq 
> zstd_compress loop nft_fib_inet nft_fib_ipv4 nft_fib_ipv6 nft_fib 
> nft_reject_inet nf_reject_ipv4 nf_reject_ipv6 nft_reject nft_ct 
> nft_chain_nat nf_nat nf_conntrack nf_defrag_ipv6 bonding 
> nf_defrag_ipv4 tls rfkill ip_set nf_tables nfnetlink sunrpc 
> pseries_rng vmx_crypto fuse ext4 mbcache jbd2 sd_mod sg ibmvscsi 
> scsi_transport_srp ibmveth
> [  418.560212] CPU: 1 UID: 0 PID: 37583 Comm: rm Kdump: loaded Not 
> tainted 6.14.0-rc7-next-20250320 #1 VOLUNTARY
> [  418.560218] Hardware name: IBM,9080-HEX Power11
> [  418.560223] NIP:  c0000000010ef8b0 LR: c00800000bb190ac CTR: 
> c0000000010ef888
> [  418.560227] REGS: c0000000a252f5a0 TRAP: 0300   Not tainted 
> (6.14.0-rc7-next-20250320)
> [  418.560232] MSR:  8000000000009033 <SF,EE,ME,IR,DR,RI,LE>  CR: 
> 44008444  XER: 20040000
> [  418.560240] CFAR: c00800000bc1df84 DAR: 0000000000000000 DSISR: 
> 40000000 IRQMASK: 1
> [  418.560240] GPR00: c00800000bb190ac c0000000a252f840 
> c0000000016a8100 0000000000000000
> [  418.560240] GPR04: 0000000000000000 0000000000010000 
> 0000000000000000 fffffffffffe0000
> [  418.560240] GPR08: c00000010724aad8 0000000000000003 
> 0000000000001000 c00800000bc1df70
> [  418.560240] GPR12: c0000000010ef888 c000000affffdb00 
> 0000000000000000 0000000000000000
> [  418.560240] GPR16: 0000000000000000 0000000000000000 
> 0000000000000000 0000000000000000
> [  418.560240] GPR20: c0000000777a8000 c00000006a9c9000 
> c00000010724a950 c0000000777a8000
> [  418.560240] GPR24: fffffffffffffffe c00000010724aad8 
> 0000000000010000 00000000000000a0
> [  418.560240] GPR28: 0000000000010000 c00c00000048c3c0 
> 0000000000000000 0000000000000000
> [  418.560287] NIP [c0000000010ef8b0] _raw_spin_lock_irq+0x28/0x98
> [  418.560294] LR [c00800000bb190ac] wait_subpage_spinlock+0x64/0xd0 
> [btrfs]
> [  418.560339] Call Trace:
> [  418.560342] [c0000000a252f870] [c00800000bb205dc] 
> btrfs_invalidate_folio+0xa8/0x4f0 [btrfs]
> [  418.560384] [c0000000a252f930] [c0000000004cbcdc] 
> truncate_cleanup_folio+0x110/0x14c
> [  418.560391] [c0000000a252f960] [c0000000004ccc7c] 
> truncate_inode_pages_range+0x100/0x4dc
> [  418.560397] [c0000000a252fbd0] [c00800000bb20ba8] 
> btrfs_evict_inode+0x74/0x510 [btrfs]
> [  418.560437] [c0000000a252fc90] [c00000000065c71c] evict+0x164/0x334
> [  418.560443] [c0000000a252fd30] [c000000000647c9c] 
> do_unlinkat+0x2f4/0x3a4
> [  418.560449] [c0000000a252fde0] [c000000000647da0] 
> sys_unlinkat+0x54/0xac
> [  418.560454] [c0000000a252fe10] [c000000000033498] 
> system_call_exception+0x138/0x330
> [  418.560461] [c0000000a252fe50] [c00000000000d05c] 
> system_call_vectored_common+0x15c/0x2ec
> [  418.560468] --- interrupt: 3000 at 0x7fffb1b366bc
> [  418.560471] NIP:  00007fffb1b366bc LR: 00007fffb1b366bc CTR: 
> 0000000000000000
> [  418.560475] REGS: c0000000a252fe80 TRAP: 3000   Not tainted 
> (6.14.0-rc7-next-20250320)
> [  418.560479] MSR:  800000000280f033 
> <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR: 44008804  XER: 00000000
> [  418.560490] IRQMASK: 0
> [  418.560490] GPR00: 0000000000000124 00007ffffcb4e2b0 
> 00007fffb1c37d00 ffffffffffffff9c
> [  418.560490] GPR04: 000000013d660380 0000000000000000 
> 0000000000000000 0000000000000003
> [  418.560490] GPR08: 0000000000000000 0000000000000000 
> 0000000000000000 0000000000000000
> [  418.560490] GPR12: 0000000000000000 00007fffb1dba5c0 
> 00007ffffcb4e538 000000011972d0e8
> [  418.560490] GPR16: 000000011972d098 000000011972d060 
> 000000011972d020 000000011972cff0
> [  418.560490] GPR20: 000000011972d298 000000011972cc10 
> 0000000000000000 000000013d6615a0
> [  418.560490] GPR24: 0000000000000002 000000011972d0b8 
> 000000011972cf98 000000011972d1d0
> [  418.560490] GPR28: 00007ffffcb4e538 000000013d6602f0 
> 0000000000000000 0000000000100000
> [  418.560532] NIP [00007fffb1b366bc] 0x7fffb1b366bc
> [  418.560536] LR [00007fffb1b366bc] 0x7fffb1b366bc
> [  418.560538] --- interrupt: 3000
> [  418.560541] Code: 7c0803a6 4e800020 3c4c005c 38428878 7c0802a6 
> 60000000 39200001 992d0932 a12d0008 3ce0fffe 5529083c 61290001 
> <7d001829> 7d063879 40c20018 7d063838
> [  418.560555] ---[ end trace 0000000000000000 ]---
>
>
> If you happed to fix this, please add below tag.
>
>
> Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
>
>
> Regards,
>
> Venkat.
>
>

