Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id F0FF5260B65
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 08:57:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Blwvk4QwNzDqLP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Sep 2020 16:57:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Vrb0alsf; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Blwsx6dJ8zDqGh
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Sep 2020 16:56:20 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0886h7FX132359; Tue, 8 Sep 2020 02:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=zJa4EgsFOxCK5aElUhhJCn5CwSplmXoTNrszQTtnxhw=;
 b=Vrb0alsfzPMt1a4kaCt+8AabrusCBJ8Hgoh9kGnZ99X0gdSIUCDt0p7/vrgTJ98Ju5KR
 ZAYm3KFWIxj7HpJbCp74TTm0lQ4o/MEqJfj+57Qr6RxuAiaJhY/rbYXew4cxiFnPsW/7
 20Qac8v5QkmMLYFvOb0NE7nVDlzUbGxhaJNAJ7m2ROSYmt9IrFV4so3BJoQK0t4iouuY
 IUXtqopzPN03muk0fXqIRPqMSREtK+scG2DNnXUzXhSEj0mLZACS28wXlZEe0QAY77JT
 t/F2A/4dlhvGLztrhaxWp0dwFWDXugD/iUlgreeQNYp4uU146CV8/2zjagOoUglvlAD7 vw== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33e4x70b6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 02:56:13 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0886gKsY015931;
 Tue, 8 Sep 2020 06:56:11 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 33c2a8b4yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Sep 2020 06:56:11 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0886u8Ul36503812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Sep 2020 06:56:09 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CF84452054;
 Tue,  8 Sep 2020 06:56:08 +0000 (GMT)
Received: from pomme.local (unknown [9.145.82.85])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 83B755204F;
 Tue,  8 Sep 2020 06:56:08 +0000 (GMT)
Subject: Re: [PATCH] mm: check for memory's node later during boot
To: Andrew Morton <akpm@linux-foundation.org>
References: <20200902090911.11363-1-ldufour@linux.ibm.com>
 <20200903143523.02e163bf06be3b48bac7f967@linux-foundation.org>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <2abef8b6-932d-2aac-68d0-e8d202aab76e@linux.ibm.com>
Date: Tue, 8 Sep 2020 08:56:08 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200903143523.02e163bf06be3b48bac7f967@linux-foundation.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-08_02:2020-09-07,
 2020-09-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 adultscore=0 phishscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009080059
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
Cc: nathanl@linux.ibm.com, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, cheloha@linux.ibm.com,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 03/09/2020 à 23:35, Andrew Morton a écrit :
> On Wed,  2 Sep 2020 11:09:11 +0200 Laurent Dufour <ldufour@linux.ibm.com> wrote:
> 
>> register_mem_sect_under_nodem() is checking the memory block's node id only
>> if the system state is "SYSTEM_BOOTING". On PowerPC, the memory blocks are
>> registered while the system state is "SYSTEM_SCHEDULING", the one before
>> SYSTEM_RUNNING.
>>
>> The consequence on PowerPC guest with interleaved memory node's ranges is
>> that some memory block could be assigned to multiple nodes on sysfs. This
>> lately prevents some memory hot-plug and hot-unplug to succeed because
>> links are remaining. Such a panic is then displayed:
>>
>> ------------[ cut here ]------------
>> kernel BUG at /Users/laurent/src/linux-ppc/mm/memory_hotplug.c:1084!
>> Oops: Exception in kernel mode, sig: 5 [#1]
>> LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries
>> Modules linked in: rpadlpar_io rpaphp pseries_rng rng_core vmx_crypto gf128mul binfmt_misc ip_tables x_tables xfs libcrc32c crc32c_vpmsum autofs4
>> CPU: 8 PID: 10256 Comm: drmgr Not tainted 5.9.0-rc1+ #25
>> NIP:  c000000000403f34 LR: c000000000403f2c CTR: 0000000000000000
>> REGS: c0000004876e3660 TRAP: 0700   Not tainted  (5.9.0-rc1+)
>> MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR: 24000448  XER: 20040000
>> CFAR: c000000000846d20 IRQMASK: 0
>> GPR00: c000000000403f2c c0000004876e38f0 c0000000012f6f00 ffffffffffffffef
>> GPR04: 0000000000000227 c0000004805ae680 0000000000000000 00000004886f0000
>> GPR08: 0000000000000226 0000000000000003 0000000000000002 fffffffffffffffd
>> GPR12: 0000000088000484 c00000001ec96280 0000000000000000 0000000000000000
>> GPR16: 0000000000000000 0000000000000000 0000000000000004 0000000000000003
>> GPR20: c00000047814ffe0 c0000007ffff7c08 0000000000000010 c0000000013332c8
>> GPR24: 0000000000000000 c0000000011f6cc0 0000000000000000 0000000000000000
>> GPR28: ffffffffffffffef 0000000000000001 0000000150000000 0000000010000000
>> NIP [c000000000403f34] add_memory_resource+0x244/0x340
>> LR [c000000000403f2c] add_memory_resource+0x23c/0x340
>> Call Trace:
>> [c0000004876e38f0] [c000000000403f2c] add_memory_resource+0x23c/0x340 (unreliable)
>> [c0000004876e39c0] [c00000000040408c] __add_memory+0x5c/0xf0
>> [c0000004876e39f0] [c0000000000e2b94] dlpar_add_lmb+0x1b4/0x500
>> [c0000004876e3ad0] [c0000000000e3888] dlpar_memory+0x1f8/0xb80
>> [c0000004876e3b60] [c0000000000dc0d0] handle_dlpar_errorlog+0xc0/0x190
>> [c0000004876e3bd0] [c0000000000dc398] dlpar_store+0x198/0x4a0
>> [c0000004876e3c90] [c00000000072e630] kobj_attr_store+0x30/0x50
>> [c0000004876e3cb0] [c00000000051f954] sysfs_kf_write+0x64/0x90
>> [c0000004876e3cd0] [c00000000051ee40] kernfs_fop_write+0x1b0/0x290
>> [c0000004876e3d20] [c000000000438dd8] vfs_write+0xe8/0x290
>> [c0000004876e3d70] [c0000000004391ac] ksys_write+0xdc/0x130
>> [c0000004876e3dc0] [c000000000034e40] system_call_exception+0x160/0x270
>> [c0000004876e3e20] [c00000000000d740] system_call_common+0xf0/0x27c
>> Instruction dump:
>> 48442e35 60000000 0b030000 3cbe0001 7fa3eb78 7bc48402 38a5fffe 7ca5fa14
>> 78a58402 48442db1 60000000 7c7c1b78 <0b030000> 7f23cb78 4bda371d 60000000
>> ---[ end trace 562fd6c109cd0fb2 ]---
>>
>> To prevent this multiple links, make the node checking done for states
>> prior to SYSTEM_RUNNING.
> 
> Did you consider adding a cc:stable to this fix?

I should have, but now I've to review the fix based on David's comment.

