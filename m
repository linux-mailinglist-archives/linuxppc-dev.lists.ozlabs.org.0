Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C8178BEA5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 08:44:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K1Lv3pZZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RZdFF0ZL3z30hM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Aug 2023 16:44:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K1Lv3pZZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RZdDN070Dz2xdd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 16:43:31 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37T6ZZqA002051
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:43:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=MVQfxD3GbOxakbonxljWOerePwSNVnFQkcIhnbGWRgc=;
 b=K1Lv3pZZTVgeKFTFpMoWyTRfzHWnO2dfSVLlR7elIapPo3mcgibEMwyqhCYfp03sVxKp
 +DpQMy/4AjXsp0P1ZOvoHio8xxgXP5gLgtyqO8AIYgNzfiYKESBSnJcsINAwJg1FgeR7
 iZ7z7IRj5H1t3hprkMrH/oJX1zalZlmsszGqjN1e8ZDbPEReCcml9vbSbHl0ccvgkEjj
 5YCn1JC0C4mVhaNeXp+vGmuCR3Bxe7x3i01PdwkvuUsnLhJivd0Q4OSYE1NKQ5IqVLY0
 4+tbNGOvFryr/NdfxrJmTu0h/KQrSwF0jtAntwFDWzyfMuaz9fltSIc7XiNWOzvjKMbC Bw== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3sr7eq3s11-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:43:29 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 37T6Sewh004946
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:43:28 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3squqshnh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:43:28 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 37T6hQ9v35193538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:43:27 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CFA5C2004D
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:43:26 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53BE020043
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:43:26 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 06:43:26 +0000 (GMT)
Received: from [10.61.2.107] (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id A525A600A7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Aug 2023 16:43:24 +1000 (AEST)
Message-ID: <682f5039-2799-6eb1-1243-b68b4bc41c14@linux.ibm.com>
Date: Tue, 29 Aug 2023 16:42:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/3] Fix preemption errors in watchpoints
To: linuxppc-dev@lists.ozlabs.org
References: <20230829063457.54157-1-bgray@linux.ibm.com>
Content-Language: en-US, en-AU
From: Benjamin Gray <bgray@linux.ibm.com>
In-Reply-To: <20230829063457.54157-1-bgray@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: HB8fAn0jsKvn5DvGoLS3uQmUKrGpDBkJ
X-Proofpoint-GUID: HB8fAn0jsKvn5DvGoLS3uQmUKrGpDBkJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-29_03,2023-08-28_04,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 mlxlogscore=963 malwarescore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2308290056
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 29/8/23 4:34 pm, Benjamin Gray wrote:
> When enabling debug config options relating to preemption, several bugs
> appear in the kernel log. With this series applied, the breakpoint code
> no longer prints bugs when running the powerpc/ptrace selftests.
> 
> Benjamin Gray (3):
>    powerpc/watchpoints: Disable preemption in thread_change_pc()
>    powerpc/watchpoint: Disable pagefaults when getting user instruction
>    powerpc/watchpoints: Annotate atomic context in more places
> 
>   arch/powerpc/kernel/hw_breakpoint.c             | 16 +++++++++++++++-
>   arch/powerpc/kernel/hw_breakpoint_constraints.c |  7 ++++++-
>   2 files changed, 21 insertions(+), 2 deletions(-)
> 
> --
> 2.41.0

The particular config is below, used by appending to a 
ppc64le_guest_defconfig. Not all options are relevant. Tested on a 
Power8 and Power10 machine (1 and 2 watchpoints).

CONFIG_LOCALVERSION="-watchpoint-sleep"
CONFIG_GENERIC_IRQ_DEBUGFS=y
CONFIG_PREEMPT=y
CONFIG_PRINTK_INDEX=y
CONFIG_CGROUP_DEBUG=y
CONFIG_PPC_KUAP_DEBUG=y
CONFIG_SCOM_DEBUGFS=y
CONFIG_UDBG_RTAS_CONSOLE=y
CONFIG_RELOCATABLE_TEST=y
CONFIG_PM_DEBUG=y
CONFIG_PM_ADVANCED_DEBUG=y
CONFIG_STATIC_KEYS_SELFTEST=y
CONFIG_MODULE_DEBUG=y
CONFIG_MODULE_STATS=y
CONFIG_MODULE_DEBUG_AUTOLOAD_DUPS_TRACE=y
CONFIG_CMA_DEBUGFS=y
CONFIG_CMA_SYSFS=y
CONFIG_PERCPU_STATS=y
CONFIG_USERFAULTFD=y
CONFIG_VALIDATE_FS_PARSER=y
CONFIG_EXT4_DEBUG=y
CONFIG_HARDENED_USERCOPY=y
CONFIG_FORTIFY_SOURCE=y
CONFIG_DYNAMIC_DEBUG=y
CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
CONFIG_DEBUG_INFO_SPLIT=y
CONFIG_GDB_SCRIPTS=y
CONFIG_READABLE_ASM=y
CONFIG_NET_DEV_REFCNT_TRACKER=y
CONFIG_NET_NS_REFCNT_TRACKER=y
CONFIG_DEBUG_NET=y
CONFIG_DEBUG_PAGEALLOC=y
CONFIG_SLUB_DEBUG_ON=y
CONFIG_PTDUMP_DEBUGFS=y
CONFIG_DEBUG_KMEMLEAK=y
CONFIG_PER_VMA_LOCK_STATS=y
CONFIG_DEBUG_OBJECTS=y
CONFIG_DEBUG_OBJECTS_SELFTEST=y
CONFIG_DEBUG_OBJECTS_FREE=y
CONFIG_DEBUG_OBJECTS_TIMERS=y
CONFIG_DEBUG_OBJECTS_WORK=y
CONFIG_DEBUG_OBJECTS_RCU_HEAD=y
CONFIG_DEBUG_OBJECTS_PERCPU_COUNTER=y
CONFIG_SHRINKER_DEBUG=y
CONFIG_SCHED_STACK_END_CHECK=y
CONFIG_DEBUG_VM=y
CONFIG_DEBUG_VM_MAPLE_TREE=y
CONFIG_DEBUG_VM_RB=y
CONFIG_DEBUG_VM_PGFLAGS=y
CONFIG_DEBUG_VM_PGTABLE=y
CONFIG_DEBUG_VIRTUAL=y
CONFIG_DEBUG_PER_CPU_MAPS=y
CONFIG_DEBUG_SHIRQ=y
CONFIG_WQ_WATCHDOG=y
CONFIG_DEBUG_TIMEKEEPING=y
CONFIG_DEBUG_PREEMPT=y
CONFIG_PROVE_LOCKING=y
CONFIG_LOCK_STAT=y
CONFIG_DEBUG_ATOMIC_SLEEP=y
CONFIG_DEBUG_LOCKING_API_SELFTESTS=y
CONFIG_CSD_LOCK_WAIT_DEBUG=y
CONFIG_DEBUG_IRQFLAGS=y
CONFIG_WARN_ALL_UNSEEDED_RANDOM=y
CONFIG_DEBUG_NOTIFIERS=y
CONFIG_DEBUG_CREDENTIALS=y
CONFIG_RCU_CPU_STALL_CPUTIME=y
CONFIG_RCU_EQS_DEBUG=y
CONFIG_DEBUG_WQ_FORCE_RR_CPU=y
CONFIG_CPU_HOTPLUG_STATE_CONTROL=y
CONFIG_LATENCYTOP=y
CONFIG_PPC_IRQ_SOFT_MASK_DEBUG=y
CONFIG_PPC_RFI_SRR_DEBUG=y

