Return-Path: <linuxppc-dev+bounces-12942-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A21EDBE2819
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Oct 2025 11:51:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cnNWT2Fm3z3bjb;
	Thu, 16 Oct 2025 20:51:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760608277;
	cv=none; b=RVtokCTfEJYAUoCUjNxHidh2HjXH7ma0Z5M0xUox/sUZyGH8uipcsZGH9KzsiZ0AVhBFPHLDGOckMZfl6S0COZX+KneKcMA84IbPAwjkWVs/QSefDSSHTaukgJwFFXOVDisN3FVi9v8iMbQC71nOWkIf+ZkDag4hipatx7Kr0J+1/Pqz7OjwVqbRHAIdsZX02PMbm+mgA2Xc4fAkvKgDxXEjopwwyC3xKkXhuI/eUj3wgoKZaP88Iojd8kNH2BTB5hQYCGlB7HCXPSS3XxAi/nGiBRd8xTsFFdGeSwZ+R4C7i9Nn14YuOl7t0EDZ2CwvkGpbYPL7HXV+jCrjYrnxuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760608277; c=relaxed/relaxed;
	bh=87uFaeE9/6hxFdNJLHex+ZSIMzX1ZexUzOPHkdh8InA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=RnGN9p28qYd/RWHLG+8VuwwUb6oIN6qm9dlP3hGiXN2zWr1EBLF8/q/WvwatoEP49ME9bOBH78ih9rY2TltbD5RMuUhPP2o5V1NlmKy/7IwWz6OJg1DcvEPKDOEcuLghdNWTA6P9rj56XHzudg8JngUJknzFmGlAq6D2qNoKGGQD5bdyudZqamSzeQXhoLLBRC9nCyZpQqozqIuR/CsKsJjb4e4QpzsGSkM2jSf7LIUf8ynJ5eOGmjmRvY+yKsXK1P4ZrrHuHWw7sW+XZ0VPBKqZHxZxQ0guCJ1hN5Za3XDxshAZuU1j48U6kEl0kKqDY/Uov7xljcullwqMa9TeYQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HZuf0CvS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HZuf0CvS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cnNWR0HrKz2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 20:51:14 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59G1xAaI001444;
	Thu, 16 Oct 2025 09:51:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=87uFae
	E9/6hxFdNJLHex+ZSIMzX1ZexUzOPHkdh8InA=; b=HZuf0CvSfWT4gACBD2lh+H
	ClAPA3hXOIyvYPSb9Q1TkEU3KX8MT4UZlbHIP98iozFz6YBJQoSqx6iBtREro5Lu
	pRLa3LhZgaagnqx5oxrrAkIj92XZjATgn1dyd5vxdL2oWwXTQfuDjJvF4ipo/SJ2
	RLPfS+Flx4DgC9wy74EgN1GkiCvxFSWncTUA6n/7m9+NngqpNEXVVc9hsrAYueY0
	5FUimUhuuUztin6vP+LaGFz8xyTQ2rRcoHGv29/XRQ91sXct4lCi68hF9yCEGDDh
	+hIOmGpRoNR5f4hWpwiX7wf9KZLzQZc6ntBn2i6OmAREpwvmpdfq/+CZyD8u+Zgw
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49rfp84peh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 09:51:11 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59G9fQ0R003641;
	Thu, 16 Oct 2025 09:51:10 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49r1xy54kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 16 Oct 2025 09:51:10 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59G9p5ZG30146826
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Oct 2025 09:51:06 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 94F9120043;
	Thu, 16 Oct 2025 09:51:05 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A9D82004B;
	Thu, 16 Oct 2025 09:51:04 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 16 Oct 2025 09:51:04 +0000 (GMT)
Message-ID: <7b9f9ca0-a6d8-40d0-8195-bbf81377e866@linux.ibm.com>
Date: Thu, 16 Oct 2025 15:21:03 +0530
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
Subject: Re: [mainline]Kernel Boot Warings at arch/powerpc/mm/mem.c:341
To: Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>, Baoquan He <bhe@redhat.com>
References: <90937fe0-2e76-4c82-b27e-7b8a7fe3ac69@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <90937fe0-2e76-4c82-b27e-7b8a7fe3ac69@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Z8GkyGJ_YovZfpJLQazHzUQSk6mLxaaV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDEyMDA4NCBTYWx0ZWRfX+OJPssgHyqKs
 b1lKhdhQIJ9LshoyEILOarITnTmLe3MFUXfPgjaj0KZqHvBJLQEG9+X9Aq37sR2vOH54eo2ddpQ
 m6rpangdnaozneMg6ad4ajd/Z+2M7OX4EDMAmVb6vlTQ5d42VxGqSF+QfzQStz5hC2yT0UYDeH6
 izsPMPcMHp+fB2ZR/vxHkoJNOi5bFB6ZG+Duz0a3331VnGZU304o5uISkqqXpa1lvl2CNUThJjX
 HeG6INI8bLRKh4ZH1r4Qf7rrDH5LOURlYBWmJciVDoCGl6m2U4FMhj2mmAXTWPhKba2U5dn7pMe
 H58miBJ8zKa5Ww+oUxwfdMC43Ln0qvsmah5XDnRxbuBX7n3CShmc3RYvGLrrrU4Bt5TP9cd7kMX
 9aHWpr/1j46Feg7T5XfxR/bg58dSHg==
X-Proofpoint-GUID: Z8GkyGJ_YovZfpJLQazHzUQSk6mLxaaV
X-Authority-Analysis: v=2.4 cv=af5sXBot c=1 sm=1 tr=0 ts=68f0c00f cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=0LcAchjzLpStlyLQwpoA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-16_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510120084
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 10/10/25 11:15, Venkat Rao Bagalkote wrote:
> Greetings!!!
>
>
> IBM CI has reported kernel boot warnings on the mainline kernel on IBM 
> Power11 system.
>
>
> Attached is the .config file.
>
> Traces:
>
>
> [    0.040098] plpks: POWER LPAR Platform KeyStore is not supported or 
> enabled
> [    0.043041] ------------[ cut here ]------------
> [    0.043045] WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/mem.c:341 
> add_system_ram_resources+0xfc/0x180
> [    0.043058] Modules linked in:
> [    0.043065] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
> 6.17.0-auto-12607-g5472d60c129f #1 VOLUNTARY
> [    0.043072] Hardware name: IBM,9080-HEX Power11 (architected) 
> 0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
> [    0.043078] NIP:  c00000000201de3c LR: c00000000201de34 CTR: 
> 0000000000000000
> [    0.043082] REGS: c000000127cef8a0 TRAP: 0700   Not tainted 
> (6.17.0-auto-12607-g5472d60c129f)
> [    0.043088] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 
> 84000840  XER: 20040010
> [    0.043099] CFAR: c00000000017eed0 IRQMASK: 0
> [    0.043099] GPR00: c00000000201de34 c000000127cefb40 
> c0000000016a8100 0000000000000001
> [    0.043099] GPR04: c00000012005aa00 0000000020000000 
> c000000002b705c8 0000000000000000
> [    0.043099] GPR08: 000000007fffffff fffffffffffffff0 
> c000000002db8100 000000011fffffff
> [    0.043099] GPR12: c00000000201dd40 c000000002ff0000 
> c0000000000112bc 0000000000000000
> [    0.043099] GPR16: 0000000000000000 0000000000000000 
> 0000000000000000 0000000000000000
> [    0.043099] GPR20: 0000000000000000 0000000000000000 
> 0000000000000000 c0000000015a3808
> [    0.043099] GPR24: c00000000200468c c000000001699888 
> 0000000000000106 c0000000020d1950
> [    0.043099] GPR28: c0000000014683f8 0000000081000200 
> c0000000015c1868 c000000002b9f710
> [    0.043138] NIP [c00000000201de3c] add_system_ram_resources+0xfc/0x180
> [    0.043143] LR [c00000000201de34] add_system_ram_resources+0xf4/0x180
> [    0.043148] Call Trace:
> [    0.043150] [c000000127cefb40] [c00000000201de34] 
> add_system_ram_resources+0xf4/0x180 (unreliable)
> [    0.043157] [c000000127cefba0] [c000000000010eb4] 
> do_one_initcall+0x60/0x36c
> [    0.043162] [c000000127cefc80] [c0000000020068cc] 
> do_initcalls+0x120/0x220
> [    0.043169] [c000000127cefd30] [c000000002006cbc] 
> kernel_init_freeable+0x23c/0x390
> [    0.043174] [c000000127cefde0] [c0000000000112e8] 
> kernel_init+0x34/0x26c
> [    0.043178] [c000000127cefe50] [c00000000000df7c] 
> ret_from_kernel_user_thread+0x14/0x1c
> [    0.043181] ---- interrupt: 0 at 0x0
> [    0.043186] Code: 3d02010c e9210028 e9410020 fb840010 fba40018 
> 38685b48 3929ffff f9440000 f9240008 4a161035 60000000 54630ffe 
> <0b030000> 39210028 39400000 39010020
> [    0.043197] ---[ end trace 0000000000000000 ]---
> [    0.043202] ------------[ cut here ]------------
> [    0.043203] WARNING: CPU: 0 PID: 1 at arch/powerpc/mm/mem.c:341 
> add_system_ram_resources+0xfc/0x180
> [    0.043209] Modules linked in:
> [    0.043212] CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Tainted: G W      
>      6.17.0-auto-12607-g5472d60c129f #1 VOLUNTARY
> [    0.043217] Tainted: [W]=WARN
> [    0.043219] Hardware name: IBM,9080-HEX Power11 (architected) 
> 0x820200 0xf000007 of:IBM,FW1110.01 (NH1110_069) hv:phyp pSeries
> [    0.043223] NIP:  c00000000201de3c LR: c00000000201de34 CTR: 
> 0000000000000000
> [    0.043226] REGS: c000000127cef8a0 TRAP: 0700   Tainted: G   W     
>       (6.17.0-auto-12607-g5472d60c129f)
> [    0.043229] MSR:  8000000002029033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 
> 84000440  XER: 20040010
> [    0.043237] CFAR: c00000000017eed0 IRQMASK: 0
> [    0.043237] GPR00: c00000000201de34 c000000127cefb40 
> c0000000016a8100 0000000000000001
> [    0.043237] GPR04: c00000012005a9c0 0000000020000000 
> c000000002b705c8 0000000080000000
> [    0.043237] GPR08: 000000257fffffff fffffffffffffff0 
> c000000002db8100 000000011fffffff
> [    0.043237] GPR12: c00000000201dd40 c000000002ff0000 
> c0000000000112bc 0000000000000000
> [    0.043237] GPR16: 0000000000000000 0000000000000000 
> 0000000000000000 0000000000000000
> [    0.043237] GPR20: 0000000000000000 0000000000000000 
> 0000000000000000 c0000000015a3808
> [    0.043237] GPR24: c00000000200468c c000000001699888 
> 0000000000000106 c0000000020d1950
> [    0.043237] GPR28: c0000000014683f8 0000000081000200 
> c0000000015c1868 c000000002b9f710
> [    0.043271] NIP [c00000000201de3c] add_system_ram_resources+0xfc/0x180
> [    0.043276] LR [c00000000201de34] add_system_ram_resources+0xf4/0x180
> [    0.043280] Call Trace:
> [    0.043281] [c000000127cefb40] [c00000000201de34] 
> add_system_ram_resources+0xf4/0x180 (unreliable)
> [    0.043287] [c000000127cefba0] [c000000000010eb4] 
> do_one_initcall+0x60/0x36c
> [    0.043291] [c000000127cefc80] [c0000000020068cc] 
> do_initcalls+0x120/0x220
> [    0.043296] [c000000127cefd30] [c000000002006cbc] 
> kernel_init_freeable+0x23c/0x390
> [    0.043301] [c000000127cefde0] [c0000000000112e8] 
> kernel_init+0x34/0x26c
> [    0.043305] [c000000127cefe50] [c00000000000df7c] 
> ret_from_kernel_user_thread+0x14/0x1c
> [    0.043308] ---- interrupt: 0 at 0x0
> [    0.043311] Code: 3d02010c e9210028 e9410020 fb840010 fba40018 
> 38685b48 3929ffff f9440000 f9240008 4a161035 60000000 54630ffe 
> <0b030000> 39210028 39400000 39010020
> [    0.043322] ---[ end trace 0000000000000000 ]---
> [    0.043520] kprobes: kprobe jump-optimization is enabled. Al

This is happening because crashkernel reservation is not coming under 
single memblock region.

commit e3185ee438c28ee926cb3ef26f3bfb0aae510606
Author: Sourabh Jain <sourabhjain@linux.ibm.com>
Date:   Fri Jan 31 17:08:30 2025 +0530

     powerpc/crash: use generic crashkernel reservation

     Commit 0ab97169aa05 ("crash_core: add generic function to do 
reservation")
     added a generic function to reserve crashkernel memory.  So let's 
use the
     same function on powerpc and remove the architecture-specific code that
     essentially does the same thing.

The above commit moved powerpc crashkernel reservation to generic 
crashkernel reservation
which adds the crashkernel memory to /proc/iomem.

Since add_system_ram_resources()/arch/powerpc/mm/mem.c also add System 
RAM to /proc/iomem there
is a chance of conflict.

Although the below commit try to avoid that by inserting the System RAM 
resource inserted request_resource()

commit bce074bdbc36e747b9e0783fe642f7b634cfb536
Author: Sourabh Jain <sourabhjain@linux.ibm.com>
Date:   Fri Jan 31 17:08:29 2025 +0530

     powerpc: insert System RAM resource to prevent crashkernel conflict

     The next patch in the series with title "powerpc/crash: use generic

But the above commit is not enough if crashkernel memory is part of two 
different memblock objects.
In this case insert_resource() on System RAM will fail with a conflict.

For example:
If the below crashkernel memory is added to /proc/iomem:
20000000-11fffffff : Crash kernel

Then memblock with below memory ranges will failed to inserted in 
/proc/iomem:
00000000-7fffffff : System RAM
80000000-257fffffff : System RAM

Now we have two options:
1. Don't add System RAM to /proc/iomem
2. Don't add crashkernel to /proc/iomem

Not adding System RAM breaks the kdump tools on major distros, so that’s 
not a good idea.
I think the second option is better - not adding crashkernel to 
/proc/iomem - because it has never
been done in the past on powerpc.

I think one of my old patch:
https://lore.kernel.org/all/20250121115442.1278458-4-sourabhjain@linux.ibm.com/

Along with some changes in below patch:
https://lore.kernel.org/all/20250121115442.1278458-6-sourabhjain@linux.ibm.com/

should fix the issue.

I will send a fresh fix patch.

Thanks for reporting the issue Venkat.

- Sourabh Jain

