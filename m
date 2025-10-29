Return-Path: <linuxppc-dev+bounces-13484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B241C185AD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Oct 2025 06:50:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cxGYF6V53z2xlK;
	Wed, 29 Oct 2025 16:50:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761717009;
	cv=none; b=nVyjwrR+hqj3I55I/TE2cwUPU2N+tl5Yv2s0/WQnt1+fz8ue2uuPHrnu9q7K+p+tKTDO32CJFygB1vJhXmdDyP8KGpY29w4h0rDcSXEI1Kh7vx2weisDJQ3aumwcLdMiqrkt2RoqxgYC/Wnm4Bn2+1E5Lp7dLOZtdHF7Sl/Y0ZqmqdUZs6J7E77qXxU6r15x1wvRniK0w2uXvELfgjbASYBrTZWfSUy16q7IrQt0z9EHgWZpVx/HGrVC86FxeM1290En803ppT8S2tQoWYUC5FcGhQ37EI5O6DGBkwTZjfK5Oo9VeR+km+w2otuoJ4vlhdoXSf2lw85955fBcsBFmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761717009; c=relaxed/relaxed;
	bh=3uoSJKqsWcuxP65UKCVAmLbS9/6ZMDpP2z2MMOJCoZ4=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=QRavo05kZVZ3hqwGFSmPD/oBdU7ag8oV/AFFK48sU0QxDCwd+j2RJND6L7isrdWVpcdaDaW7SX8jzO6oUc1npQPl/GVfSPZqL1yIm06ThIZDSQ3elCHZkc3eLSifKJOYuuUlr/b4NFD3ZGgaW4c61aSqAi6Dgb/kgQ0nS+v6OR1Rq2D5/EiOX5i3QPzRKpukJJBhbGHYvHu5PxgzTlk3c7aNxTuq3igZ1cFpWy2UD+pBWuA4aj/CEjzbW/L7k7wz6t1DUwu2Zc3YW58JbTadOQJADs70xYiJ66iI7/9ik4ASpyTe0QNIQjnECLNjrZxuHqNqUGvn/uCMHztkaHsrug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HHdKPSEa; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HHdKPSEa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cxGYD4h59z2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 16:50:08 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59SJmjKW020455;
	Wed, 29 Oct 2025 05:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=3uoSJKqsWcuxP65UKCVAmLbS9/6Z
	MDpP2z2MMOJCoZ4=; b=HHdKPSEahOCeXJbiJ412FTJml1V60VLGX7IgL+kd2JaH
	HJtxUQmogLz5pLi7yc2p8bsi+/Qsp/wVczXPI7gnq7GJnugucEkZPqskl4VK6pMn
	iit1rOlnHuFnHE9fhiN4N9Pqc7Ak0EPshAAXx3xKo/PDcgw5dD59lecel8MJ+8yr
	D2C4Sgy/+TazNjXs7l00YCHVSeb1rB3bWO2MVyZPQRbRmWegtxxTvRVa41ZTPM/w
	rO1K6BLTPuvDXp7RurxmPqFieXhhoYOz2caYVqvJL7YdxwPQ4moG2S6ljaIfSH02
	uJ5wjnZtN9TuqU6w1EBaChysy4SEB2my3VStvs4+ow==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34aghjta-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 05:50:03 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59T5o3an021412;
	Wed, 29 Oct 2025 05:50:03 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a34aghjt7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 05:50:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59T5REYk019510;
	Wed, 29 Oct 2025 05:50:02 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a33xy1uj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Oct 2025 05:50:02 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59T5nwwe37290472
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Oct 2025 05:49:58 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B74520043;
	Wed, 29 Oct 2025 05:49:58 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA01C20040;
	Wed, 29 Oct 2025 05:49:56 +0000 (GMT)
Received: from [9.39.29.101] (unknown [9.39.29.101])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 29 Oct 2025 05:49:56 +0000 (GMT)
Message-ID: <94377f5c-d4f0-4c0f-b0f6-5bf1cd7305b1@linux.ibm.com>
Date: Wed, 29 Oct 2025 11:19:55 +0530
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
Content-Language: en-US
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Donet Tom <donettom@linux.ibm.com>,
        David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
Subject: powerpc/e500: WARNING: at mm/hugetlb.c:4755 hugetlb_add_hstate
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=K+gv3iWI c=1 sm=1 tr=0 ts=6901ab0b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=20KFwNOVAAAA:8 a=Lns35NobvubaU9DhMzcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: s6IizRdSbCvMCvqRkG8gpZqMhNqxPYjd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDE2NiBTYWx0ZWRfX+iCS/4UpeCfw
 4ZbBhoezAPNUq5EZ4v64tcJSKXb0ovHyXZBLHMvhXXAIgPBp4tcTEJeoHpaduuwP8QHGevve2XX
 S80+61nyCzUBG0ZhZNwQYd0d9AIx0biatzhZ0GkDjKWq+seNztVake3rgvT3/iSu0YElSpF1c37
 JH0dZzOCuYFI83FxgktZCYw3+mz350h+ZilzfINVl0+8SidDbJNs0gvcbWdwrhaKkpFE/jUOiyg
 iBFLjItqvfx2yfmY4BAnB9IZmp3ZvLAoqYC8nFfu2Pgw2ouTVEy3Pqn6iJ9cVMVBl4ItdS2kiFH
 PhChWU28KO5yewGcR6h83eOnTFFaE10Wyqf5G3k7SookSyBmhqwdvQ0HMotrZ/v4uT/Cc9w5g7h
 5GWNOzoHl2q9ZE3o9BNTiRbP1KiFvA==
X-Proofpoint-GUID: 9fSWlaIjsbTh7uSKUOsqsqG1UMxkPHtX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-29_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 clxscore=1011 malwarescore=0 phishscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2510280166
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kernel is printing below warning while booting:


WARNING: CPU: 0 PID: 1 at mm/hugetlb.c:4753 hugetlb_add_hstate+0xc0/0x180
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 
6.18.0-rc1-01400-ga297f72c4951 #6 NONE
Hardware name: QEMU ppce500 e5500 0x80240020 QEMU e500
NIP:  c000000001370800 LR: c000000001357740 CTR: 0000000000000005
REGS: c000000080183890 TRAP: 0700   Not tainted 
(6.18.0-rc1-01400-ga297f72c4951)
MSR:  0000000080029002 <CE,EE,ME>  CR: 48000242  XER: 20000000
IRQMASK: 0
GPR00: c000000001357740 c000000080183b30 c000000001352000 000000000000000e
GPR04: c0000000011d1c4f 0000000000000002 000000000000001a 0000000000000000
GPR08: 0000000000000000 0000000000000002 0000000000000001 0000000000000005
GPR12: c0000000013576a4 c0000000015ad000 c00000000000210c 0000000000000000
GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
GPR24: 0000000000000000 c0000000015876e8 0000000000000002 c000000001587500
GPR28: c000000001587578 000000000000000e 0000000004000000 0000000000000170
NIP [c000000001370800] hugetlb_add_hstate+0xc0/0x180
LR [c000000001357740] hugetlbpage_init+0x9c/0xf0
Call Trace:
hugetlb_add_hstate+0x148/0x180 (unreliable)
hugetlbpage_init+0x9c/0xf0
do_one_initcall+0x84/0x308
kernel_init_freeable+0x2e4/0x380
kernel_init+0x30/0x15c
ret_from_kernel_user_thread+0x14/0x1c

Kernel commit causing these warning:
commit 7b4f21f5e0386dfe02c68c009294d8f26e3c1bad (HEAD)
Author: David Hildenbrand <david@redhat.com>
Date:   Mon Sep 1 17:03:29 2025 +0200

     mm/hugetlb: check for unreasonable folio sizes when registering hstate

     Let's check that no hstate that corresponds to an unreasonable 
folio size
     is registered by an architecture.  If we were to succeed 
registering, we
     could later try allocating an unsupported gigantic folio size.

...

         BUG_ON(order < order_base_2(__NR_USED_SUBPAGE));
+       WARN_ON(order > MAX_FOLIO_ORDER);
         h = &hstates[hugetlb_max_hstate++];

snip...


Command to create kernel config:
make ARCH=powerpc corenet64_smp_defconfig

Qemu command:
qemu-system-ppc64 -nographic -vga none -M ppce500 -smp 2 -m 4G -accel 
tcg -kernel ./vmlinux -nic user -initrd ./ppc64-novsx-rootfs.cpio.gz 
-cpu e5500 -append "noreboot"


Root cause:
The MAX_FOLIO_ORDER  for e500 platform is MAX_PAGE_ORDER which is
nothing but CONFIG_ARCH_FORCE_MAX_ORDER which dependent of page-size
which was 4k. So value of MAX_FOLIO_ODER is 12 for this case.

As per arch/powerpc/mm/nohash/tlb.c the following page size are supported on
e500 platform:

struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
     [MMU_PAGE_4K] = {
         .shift    = 12,
     },
     [MMU_PAGE_2M] = {
         .shift    = 21,
     },
     [MMU_PAGE_4M] = {
         .shift    = 22,
     },
     [MMU_PAGE_16M] = {
         .shift    = 24,
     },
     [MMU_PAGE_64M] = {
         .shift    = 26,
     },
     [MMU_PAGE_256M] = {
         .shift    = 28,
     },
     [MMU_PAGE_1G] = {
         .shift    = 30,
     },
};

With the above MAX_FOLIO_ORDER and page sizes, hugetlbpage_init() in
arch/powerpc/mm/hugetlbpage.c tries to call hugetlb_add_hstate() with
an order higher than 12, causing the kernel to print the above warning.

Things I tried:
I enabled CONFIG_ARCH_HAS_GIGANTIC_PAGE for the e500 platform. With that,
MAX_FOLIO_ORDER was set to 16, but that was not sufficient for MMU_PAGE_1G.

This is because with CONFIG_ARCH_HAS_GIGANTIC_PAGE enabled,
MAX_FOLIO_ORDER was set to 16 = PUD_ORDER = (PMD_INDEX_SIZE (7) + 
PTE_INDEX_SIZE (9)),
while the order for MMU_PAGE_1G was 18.

Thanks,
Sourabh Jain

