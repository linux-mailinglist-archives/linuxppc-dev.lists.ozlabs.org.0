Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AF2620AC6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 08:56:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N60m15xVZz3cML
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 18:56:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GwtFpFre;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rppt@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GwtFpFre;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N60l217FDz2yRV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 18:55:25 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A86ajST008416;
	Tue, 8 Nov 2022 07:55:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=qyz/5G3jE14zE0xWsmrBzL4sqkxUX2lTbtKGs1e+NUA=;
 b=GwtFpFre0hiWoeb5j0BYuCwCK3sJw/rX2A4qfAalutA7hgOeXQZYj8OgF6iEQHKeVnE5
 36teG6L5+lQYD852Xet/jqSuS+vRgm+tqnEU/ToYVY1K+dsYs5V500M77I5aqY+ZdLRu
 qyMko21Ced6/APTbZONI/lfxrqrLXy2hliBKLJ+er8F2BPMCq9bVyQhsTdQGfBSPiQyL
 p5OOtHVyVqvTMjrA5xeKPkVn893543yITJZiUerbVIsaeDEXHZKkRR2wqEVm+MRF3Zhp
 xH3hqA4ojUzloWAT+Qfej8ZdgPf6UHTA9p3MO0+9lR9LoCUqqA+WawLoOklMBjeXQV2j sQ== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kqfj1p1dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 07:55:19 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A87pgK8016242;
	Tue, 8 Nov 2022 07:55:17 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma01fra.de.ibm.com with ESMTP id 3kngs4jpq3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Nov 2022 07:55:17 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com [9.149.105.58])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A87nWAP47972702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 8 Nov 2022 07:49:32 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C19F94C050;
	Tue,  8 Nov 2022 07:55:14 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44EC04C044;
	Tue,  8 Nov 2022 07:55:14 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.181.142])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Tue,  8 Nov 2022 07:55:14 +0000 (GMT)
Date: Tue, 8 Nov 2022 09:55:12 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Yajun Deng <yajun.deng@linux.dev>
Subject: Re: [6.1.0-rc3-next-20221104] Boot failure - kernel BUG at
 mm/memblock.c:519
Message-ID: <Y2oLYB7Tu7J91tVm@linux.ibm.com>
References: <E2499567-0D0F-44DA-AC68-1E279009A6DE@linux.ibm.com>
 <58779468e28e026a1aa30a42ca7e8aec@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <58779468e28e026a1aa30a42ca7e8aec@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YXibyIZj0kfYYbJiZ31Lh09UBUC63ZlN
X-Proofpoint-GUID: YXibyIZj0kfYYbJiZ31Lh09UBUC63ZlN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-07_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxscore=0 adultscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=793 impostorscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211080040
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yajun,

On Tue, Nov 08, 2022 at 02:27:53AM +0000, Yajun Deng wrote:
> Hi Sachin,
> I didn't have a powerpc architecture machine. I don't know why this happened.
> 
> Hi Mike,
> Do you have any suggestions?

You can try reproducing the bug qemu or work with Sachin to debug the
issue.

> I tested in tools/testing/memblock, and it was successful.

Memblock tests provide limited coverage still and they don't deal with all
possible cases.

For now I'm dropping this patch from the memblock tree until the issue is
fixed.
 
> November 6, 2022 8:07 PM, "Sachin Sant" <sachinp@linux.ibm.com> wrote:
> 
> > While booting recent linux-next on a IBM Power10 Server LPAR
> > following crash is observed:
> > 
> > [ 0.000000] numa: Partition configured for 32 NUMA nodes.
> > [ 0.000000] ------------[ cut here ]------------
> > [ 0.000000] kernel BUG at mm/memblock.c:519!
> > [ 0.000000] Oops: Exception in kernel mode, sig: 5 [#1]
> > [ 0.000000] LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> > [ 0.000000] Modules linked in:
> > [ 0.000000] CPU: 0 PID: 0 Comm: swapper Not tainted 6.1.0-rc3-next-20221104 #1
> > [ 0.000000] Hardware name: IBM,9080-HEX POWER10 (raw) 0x800200 0xf000006 of:IBM,FW1030.00
> > (NH1030_026) hv:phyp pSeries
> > [ 0.000000] NIP: c0000000004ba240 LR: c0000000004bb240 CTR: c0000000004ba210
> > [ 0.000000] REGS: c000000002a8b7b0 TRAP: 0700 Not tainted (6.1.0-rc3-next-20221104)
> > [ 0.000000] MSR: 8000000000021033 <SF,ME,IR,DR,RI,LE> CR: 24042424 XER: 00000001
> > [ 0.000000] CFAR: c0000000004ba290 IRQMASK: 1
> > [ 0.000000] GPR00: c0000000004bb240 c000000002a8ba50 c00000000136ee00 c0000010f3ac00a8
> > [ 0.000000] GPR04: 0000000000000000 c0000010f3ac0090 00000010f3ac0000 0000000000000d00
> > [ 0.000000] GPR08: 0000000000000001 0000000000000007 0000000000000001 0000000000000081
> > [ 0.000000] GPR12: c0000000004ba210 c000000002e10000 0000000000000000 000000000000000d
> > [ 0.000000] GPR16: 000000000f6be620 000000000f6be8e8 000000000f6be788 000000000f6bed58
> > [ 0.000000] GPR20: 000000000f6f6d58 c0000000029a8de8 00000010f3ad8800 0000000000000080
> > [ 0.000000] GPR24: 00000010f3ad7b00 0000000000000000 0000000000000100 0000000000000d00
> > [ 0.000000] GPR28: 00000010f3ad7b00 c0000000029a8de8 c0000000029a8e00 0000000000000006
> > [ 0.000000] NIP [c0000000004ba240] memblock_merge_regions.isra.12+0x40/0x130
> > [ 0.000000] LR [c0000000004bb240] memblock_add_range+0x190/0x300
> > [ 0.000000] Call Trace:
> > [ 0.000000] [c000000002a8ba50] [0000000000000100] 0x100 (unreliable)
> > [ 0.000000] [c000000002a8ba90] [c0000000004bb240] memblock_add_range+0x190/0x300
> > [ 0.000000] [c000000002a8bb10] [c0000000004bb5e0] memblock_reserve+0x70/0xd0
> > [ 0.000000] [c000000002a8bba0] [c000000002045234] memblock_alloc_range_nid+0x11c/0x1e8
> > [ 0.000000] [c000000002a8bc60] [c0000000020453a4] memblock_alloc_internal+0xa4/0x110
> > [ 0.000000] [c000000002a8bcb0] [c0000000020456cc] memblock_alloc_try_nid+0x94/0xcc
> > [ 0.000000] [c000000002a8bd40] [c00000000200b570] alloc_paca_data+0x7c/0xcc
> > [ 0.000000] [c000000002a8bdb0] [c00000000200b770] allocate_paca+0x8c/0x28c
> > [ 0.000000] [c000000002a8be50] [c00000000200a26c] setup_arch+0x1c4/0x4d8
> > [ 0.000000] [c000000002a8bed0] [c000000002004378] start_kernel+0xb4/0xa84
> > [ 0.000000] [c000000002a8bf90] [c00000000000da90] start_here_common+0x1c/0x20
> > [ 0.000000] Instruction dump:
> > [ 0.000000] 7c0802a6 fba1ffe8 fbc1fff0 fbe1fff8 7c7d1b78 7c9e2378 3be00000 f8010010
> > [ 0.000000] f821ffc1 e9230000 3969ffff 4800000c <0b0a0000> 7d3f4b78 393f0001 7fbf5840
> > [ 0.000000] ---[ end trace 0000000000000000 ]---
> > [ 0.000000]
> > [ 0.000000] Kernel panic - not syncing: Fatal exception
> > [ 0.000000] Rebooting in 180 seconds..
> > 
> > This problem was introduced with next-20221101. Git bisect points to
> > following patch
> > 
> > commit 3f82c9c4ac377082e1230f5299e0ccce07b15e12
> > Date: Tue Oct 25 15:09:43 2022 +0800
> > memblock: don't run loop in memblock_add_range() twice
> > 
> > Reverting this patch helps boot the kernel to login prompt.
> > 
> > Have attached .config
> > 
> > - Sachin

-- 
Sincerely yours,
Mike.
