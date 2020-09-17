Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE8A26DCC7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 15:28:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bsd8F254kzDqSC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 23:28:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=rcardoso@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Vxv6d3E8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsd4T0jMMzDqZF
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 23:25:09 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HDC7k4042811; Thu, 17 Sep 2020 09:25:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=hnwSP26nUyxJVjfKriUNAIMcTHY25FLJy3FKVmmHnBU=;
 b=Vxv6d3E8z4V5wRwQibk4PbHaLEnSXesYVfyNLvTMM2bR8E6UoRQI//Wg3qMaYq7KRLUC
 qEXqaLteWDAH3pUr2k+r0B1rBcbyLk8uxN8JTbqqdSTEhDt9DENhfgfGW6sDdIk3ojqD
 rHh004djUyeYdRQXCDahtXSeId/q+21O4zb5f9/tL/w5yv+XrF+3g8EW1Csqyd1PVqvS
 ekie5uR1SZzGxIaDIPYLeOZ2sxLWWWDdOuyTKXJH6i9n6LrVPTs9pci+TkBWpgTED5lM
 eZPrTd1kIyGLg++DZqzbo5LRjU6Zah8iDOsr/4LvYcT3F6GyJ2MbYZwd1FCA/FyjoKp1 8w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33m8fnrd8s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 09:25:01 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08HDCOB0043136;
 Thu, 17 Sep 2020 09:25:00 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33m8fnrd8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 09:25:00 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08HDMfZb008450;
 Thu, 17 Sep 2020 13:25:00 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 33k5v20xa9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 13:25:00 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08HDOx6054067638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Sep 2020 13:24:59 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 45FCDAE060;
 Thu, 17 Sep 2020 13:24:59 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27FA8AE05F;
 Thu, 17 Sep 2020 13:24:56 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.95.89])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Sep 2020 13:24:55 +0000 (GMT)
Subject: Re: [PATCH v6 0/8] powerpc/watchpoint: Bug fixes plus new feature flag
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 christophe.leroy@c-s.fr
References: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
From: Rogerio Alves <rcardoso@linux.ibm.com>
Message-ID: <6927523d-de63-910a-e789-5fab424c7eb9@linux.ibm.com>
Date: Thu, 17 Sep 2020 10:24:54 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_09:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 clxscore=1011 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009170098
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
Cc: mikey@neuling.org, jniethe5@gmail.com, pedromfc@linux.ibm.com,
 linux-kernel@vger.kernel.org, paulus@samba.org, rogealve@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/2/20 1:29 AM, Ravi Bangoria wrote:
> Patch #1 fixes issue for quardword instruction on p10 predecessors.
> Patch #2 fixes issue for vector instructions.
> Patch #3 fixes a bug about watchpoint not firing when created with
>           ptrace PPC_PTRACE_SETHWDEBUG and CONFIG_HAVE_HW_BREAKPOINT=N.
>           The fix uses HW_BRK_TYPE_PRIV_ALL for ptrace user which, I
>           guess, should be fine because we don't leak any kernel
>           addresses and PRIV_ALL will also help to cover scenarios when
>           kernel accesses user memory.
> Patch #4,#5 fixes infinite exception bug, again the bug happens only
>           with CONFIG_HAVE_HW_BREAKPOINT=N.
> Patch #6 fixes two places where we are missing to set hw_len.
> Patch #7 introduce new feature bit PPC_DEBUG_FEATURE_DATA_BP_ARCH_31
>           which will be set when running on ISA 3.1 compliant machine.
> Patch #8 finally adds selftest to test scenarios fixed by patch#2,#3
>           and also moves MODE_EXACT tests outside of BP_RANGE condition.
> 
> Christophe, let me know if this series breaks something for 8xx.
> 
> v5: https://lore.kernel.org/r/20200825043617.1073634-1-ravi.bangoria@linux.ibm.com
> 
> v5->v6:
>   - Fix build faulure reported by kernel test robot
>   - patch #5. Use more compact if condition, suggested by Christophe
> 
> 
> Ravi Bangoria (8):
>    powerpc/watchpoint: Fix quarword instruction handling on p10
>      predecessors
>    powerpc/watchpoint: Fix handling of vector instructions
>    powerpc/watchpoint/ptrace: Fix SETHWDEBUG when
>      CONFIG_HAVE_HW_BREAKPOINT=N
>    powerpc/watchpoint: Move DAWR detection logic outside of
>      hw_breakpoint.c
>    powerpc/watchpoint: Fix exception handling for
>      CONFIG_HAVE_HW_BREAKPOINT=N
>    powerpc/watchpoint: Add hw_len wherever missing
>    powerpc/watchpoint/ptrace: Introduce PPC_DEBUG_FEATURE_DATA_BP_ARCH_31
>    powerpc/watchpoint/selftests: Tests for kernel accessing user memory
> 
>   Documentation/powerpc/ptrace.rst              |   1 +
>   arch/powerpc/include/asm/hw_breakpoint.h      |  12 ++
>   arch/powerpc/include/uapi/asm/ptrace.h        |   1 +
>   arch/powerpc/kernel/Makefile                  |   3 +-
>   arch/powerpc/kernel/hw_breakpoint.c           | 149 +---------------
>   .../kernel/hw_breakpoint_constraints.c        | 162 ++++++++++++++++++
>   arch/powerpc/kernel/process.c                 |  48 ++++++
>   arch/powerpc/kernel/ptrace/ptrace-noadv.c     |   9 +-
>   arch/powerpc/xmon/xmon.c                      |   1 +
>   .../selftests/powerpc/ptrace/ptrace-hwbreak.c |  48 +++++-
>   10 files changed, 282 insertions(+), 152 deletions(-)
>   create mode 100644 arch/powerpc/kernel/hw_breakpoint_constraints.c
> 

Tested this patch set for:
- SETHWDEBUG when CONFIG_HAVE_HW_BREAKPOINT=N = OK
- Fix exception handling for CONFIG_HAVE_HW_BREAKPOINT=N = OK
- Check for PPC_DEBUG_FEATURE_DATA_BP_ARCH_31 = OK
- Fix quarword instruction handling on p10 predecessors = OK
- Fix handling of vector instructions = OK

Also tested for:
- Set second watchpoint (P10 Mambo) = OK
- Infinity loop on sc instruction = OK
