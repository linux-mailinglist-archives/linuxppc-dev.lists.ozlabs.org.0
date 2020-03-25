Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F7F191F79
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 03:53:53 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nCPB1Z0jzDqjn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 13:53:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nCLt025MzDqTG
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 13:51:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48nCLr4xBjz8tMV
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 13:51:48 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48nCLr2z1Tz9sRY; Wed, 25 Mar 2020 13:51:48 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48nCLq5HfGz9sR4
 for <linuxppc-dev@ozlabs.org>; Wed, 25 Mar 2020 13:51:47 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02P2Y8lw024958
 for <linuxppc-dev@ozlabs.org>; Tue, 24 Mar 2020 22:51:45 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yxw7e3y5c-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 24 Mar 2020 22:51:45 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <ajd@linux.ibm.com>;
 Wed, 25 Mar 2020 02:51:40 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 25 Mar 2020 02:51:39 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02P2peWK37224942
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 25 Mar 2020 02:51:40 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C7AF4C040;
 Wed, 25 Mar 2020 02:51:40 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 064F24C058;
 Wed, 25 Mar 2020 02:51:40 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 25 Mar 2020 02:51:39 +0000 (GMT)
Received: from [9.81.204.7] (unknown [9.81.204.7])
 (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5294EA0223;
 Wed, 25 Mar 2020 13:51:34 +1100 (AEDT)
Subject: Re: [RFC PATCH 0/3] Use per-CPU temporary mappings for patching
To: "Christopher M. Riedl" <cmr@informatik.wtf>, linuxppc-dev@ozlabs.org
References: <20200323045205.20314-1-cmr@informatik.wtf>
From: Andrew Donnellan <ajd@linux.ibm.com>
Date: Wed, 25 Mar 2020 13:51:27 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200323045205.20314-1-cmr@informatik.wtf>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 20032502-0008-0000-0000-000003635F98
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20032502-0009-0000-0000-00004A84CDCC
Message-Id: <f5e6db29-092b-c878-66c1-5ea0d1c31ddb@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-24_10:2020-03-23,
 2020-03-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003250016
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/3/20 3:52 pm, Christopher M. Riedl wrote:
> When compiled with CONFIG_STRICT_KERNEL_RWX, the kernel must create
> temporary mappings when patching itself. These mappings temporarily
> override the strict RWX text protections to permit a write. Currently,
> powerpc allocates a per-CPU VM area for patching. Patching occurs as
> follows:
> 
> 	1. Map page of text to be patched to per-CPU VM area w/
> 	   PAGE_KERNEL protection
> 	2. Patch text
> 	3. Remove the temporary mapping
> 
> While the VM area is per-CPU, the mapping is actually inserted into the
> kernel page tables. Presumably, this could allow another CPU to access
> the normally write-protected text - either malicously or accidentally -
> via this same mapping if the address of the VM area is known. Ideally,
> the mapping should be kept local to the CPU doing the patching (or any
> other sensitive operations requiring temporarily overriding memory
> protections) [0].
> 
> x86 introduced "temporary mm" structs which allow the creation of
> mappings local to a particular CPU [1]. This series intends to bring the
> notion of a temporary mm to powerpc and harden powerpc by using such a
> mapping for patching a kernel with strict RWX permissions.
> 
> The first patch introduces the temporary mm struct and API for powerpc
> along with a new function to retrieve a current hw breakpoint.
> 
> The second patch uses the `poking_init` init hook added by the x86
> patches to initialize a temporary mm and patching address. The patching
> address is randomized between 0 and DEFAULT_MAP_WINDOW-PAGE_SIZE. The
> upper limit is necessary due to how the hash MMU operates - by default
> the space above DEFAULT_MAP_WINDOW is not available. For now, both hash
> and radix randomize inside this range. The number of possible random
> addresses is dependent on PAGE_SIZE and limited by DEFAULT_MAP_WINDOW.
> 
> Bits of entropy with 64K page size on BOOK3S_64:
> 
> 	bits-o-entropy = log2(DEFAULT_MAP_WINDOW_USER64 / PAGE_SIZE)
> 
> 	PAGE_SIZE=64K, DEFAULT_MAP_WINDOW_USER64=128TB
> 	bits-o-entropy = log2(128TB / 64K)
> 	bits-o-entropy = 31
> 
> Currently, randomization occurs only once during initialization at boot.
> 
> The third patch replaces the VM area with the temporary mm in the
> patching code. The page for patching has to be mapped PAGE_SHARED with
> the hash MMU since hash prevents the kernel from accessing userspace
> pages with PAGE_PRIVILEGED bit set. There is on-going work on my side to
> explore if this is actually necessary in the hash codepath.
> 
> Testing so far is limited to booting on QEMU (power8 and power9 targets)
> and a POWER8 VM along with setting some simple xmon breakpoints (which
> makes use of code-patching). A POC lkdtm test is in-progress to actually
> exploit the existing vulnerability (ie. the mapping during patching is
> exposed in kernel page tables and accessible by other CPUS) - this will
> accompany a future v1 of this series.
> 
> [0]: https://github.com/linuxppc/issues/issues/224
> [1]: https://lore.kernel.org/kernel-hardening/20190426232303.28381-1-nadav.amit@gmail.com/
> 
> Christopher M. Riedl (3):
>    powerpc/mm: Introduce temporary mm
>    powerpc/lib: Initialize a temporary mm for code patching
>    powerpc/lib: Use a temporary mm for code patching
> 
>   arch/powerpc/include/asm/debug.h       |   1 +
>   arch/powerpc/include/asm/mmu_context.h |  56 +++++++++-
>   arch/powerpc/kernel/process.c          |   5 +
>   arch/powerpc/lib/code-patching.c       | 140 ++++++++++++++-----------
>   4 files changed, 137 insertions(+), 65 deletions(-)

This series causes a build failure with ppc64e_defconfig

https://openpower.xyz/job/snowpatch/job/snowpatch-linux-sparse/16478//artifact/linux/report.txt

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited

