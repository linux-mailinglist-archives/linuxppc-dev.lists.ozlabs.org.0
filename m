Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3408026DD0D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 15:47:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BsdZd0LkRzDqPb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Sep 2020 23:47:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=rcardoso@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=DcMf1WvE; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bsd624YcHzDqNK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Sep 2020 23:26:34 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 08HD1MX2015919; Thu, 17 Sep 2020 09:26:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=k/IwXklM6qI1Lf5GnsaIa12/XO5uJLdiCa4JIJCuT9o=;
 b=DcMf1WvEUXDd70nG6DyN1IoAy1tWVPujzfOIUJCInoDtheewFg0Vou3+04c4cfjpDLJM
 g2CTcgFBHrNXhl3Mj1FWmQZrJbnFYXq+otmYFtgRNpthavslelBkmW8+9ePTauPlN4uc
 Jl76v/8Wcb1Ymj1FTMBmH26G8ef/UzHTGJ12QY1+SsleF+AFyH6GwUNA8mEjuDWcwheJ
 5/YvGHRYl5sRyNWeV/1RGFSvsywfENYg7O+7duPyI3OnMNOvauSbLYAS4g9697A2qxG3
 wYHjbtQGkHri9OzHIqsyJa3F9r6tY205WOY4mul5dWMOZV6BPi54GMqvwS2n5OtGSX/W 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33m850s8sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 09:26:27 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 08HD1qqi017944;
 Thu, 17 Sep 2020 09:26:27 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33m850s8rw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 09:26:26 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 08HDMbXs008155;
 Thu, 17 Sep 2020 13:26:25 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02wdc.us.ibm.com with ESMTP id 33k67c4j6p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Sep 2020 13:26:25 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 08HDQPvE49086738
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Sep 2020 13:26:25 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20B38AE05F;
 Thu, 17 Sep 2020 13:26:25 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3932AE05C;
 Thu, 17 Sep 2020 13:26:21 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.211.95.89])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Sep 2020 13:26:21 +0000 (GMT)
Subject: Re: [PATCH v6 8/8] powerpc/watchpoint/selftests: Tests for kernel
 accessing user memory
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 christophe.leroy@c-s.fr
References: <20200902042945.129369-1-ravi.bangoria@linux.ibm.com>
 <20200902042945.129369-9-ravi.bangoria@linux.ibm.com>
From: Rogerio Alves <rcardoso@linux.ibm.com>
Message-ID: <05c1b4a3-a0e7-6fcb-171b-1a2e8a99f21d@linux.ibm.com>
Date: Thu, 17 Sep 2020 10:26:20 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200902042945.129369-9-ravi.bangoria@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-17_09:2020-09-16,
 2020-09-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 impostorscore=0
 spamscore=0 mlxscore=0 suspectscore=0 malwarescore=0 bulkscore=0
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
> Introduce tests to cover simple scenarios where user is watching
> memory which can be accessed by kernel as well. We also support
> _MODE_EXACT with _SETHWDEBUG interface. Move those testcases out-
> side of _BP_RANGE condition. This will help to test _MODE_EXACT
> scenarios when CONFIG_HAVE_HW_BREAKPOINT is not set, eg:
> 
>    $ ./ptrace-hwbreak
>    ...
>    PTRACE_SET_DEBUGREG, Kernel Access Userspace, len: 8: Ok
>    PPC_PTRACE_SETHWDEBUG, MODE_EXACT, WO, len: 1: Ok
>    PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RO, len: 1: Ok
>    PPC_PTRACE_SETHWDEBUG, MODE_EXACT, RW, len: 1: Ok
>    PPC_PTRACE_SETHWDEBUG, MODE_EXACT, Kernel Access Userspace, len: 1: Ok
>    success: ptrace-hwbreak
> 
> Suggested-by: Pedro Miraglia Franco de Carvalho <pedromfc@linux.ibm.com>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Tested-by: Rogerio Alves <rcardoso@linux.ibm.com>
> ---
>   .../selftests/powerpc/ptrace/ptrace-hwbreak.c | 48 ++++++++++++++++++-
>   1 file changed, 46 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
> index fc477dfe86a2..2e0d86e0687e 100644
> --- a/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
> +++ b/tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c
> @@ -20,6 +20,8 @@
>   #include <signal.h>
>   #include <sys/types.h>
>   #include <sys/wait.h>
> +#include <sys/syscall.h>
> +#include <linux/limits.h>
>   #include "ptrace.h"
>   
>   #define SPRN_PVR	0x11F
> @@ -44,6 +46,7 @@ struct gstruct {
>   };
>   static volatile struct gstruct gstruct __attribute__((aligned(512)));
>   
> +static volatile char cwd[PATH_MAX] __attribute__((aligned(8)));
>   
>   static void get_dbginfo(pid_t child_pid, struct ppc_debug_info *dbginfo)
>   {
> @@ -138,6 +141,9 @@ static void test_workload(void)
>   			write_var(len);
>   	}
>   
> +	/* PTRACE_SET_DEBUGREG, Kernel Access Userspace test */
> +	syscall(__NR_getcwd, &cwd, PATH_MAX);
> +
>   	/* PPC_PTRACE_SETHWDEBUG, MODE_EXACT, WO test */
>   	write_var(1);
>   
> @@ -150,6 +156,9 @@ static void test_workload(void)
>   	else
>   		read_var(1);
>   
> +	/* PPC_PTRACE_SETHWDEBUG, MODE_EXACT, Kernel Access Userspace test */
> +	syscall(__NR_getcwd, &cwd, PATH_MAX);
> +
>   	/* PPC_PTRACE_SETHWDEBUG, MODE_RANGE, DW ALIGNED, WO test */
>   	gstruct.a[rand() % A_LEN] = 'a';
>   
> @@ -293,6 +302,24 @@ static int test_set_debugreg(pid_t child_pid)
>   	return 0;
>   }
>   
> +static int test_set_debugreg_kernel_userspace(pid_t child_pid)
> +{
> +	unsigned long wp_addr = (unsigned long)cwd;
> +	char *name = "PTRACE_SET_DEBUGREG";
> +
> +	/* PTRACE_SET_DEBUGREG, Kernel Access Userspace test */
> +	wp_addr &= ~0x7UL;
> +	wp_addr |= (1Ul << DABR_READ_SHIFT);
> +	wp_addr |= (1UL << DABR_WRITE_SHIFT);
> +	wp_addr |= (1UL << DABR_TRANSLATION_SHIFT);
> +	ptrace_set_debugreg(child_pid, wp_addr);
> +	ptrace(PTRACE_CONT, child_pid, NULL, 0);
> +	check_success(child_pid, name, "Kernel Access Userspace", wp_addr, 8);
> +
> +	ptrace_set_debugreg(child_pid, 0);
> +	return 0;
> +}
> +
>   static void get_ppc_hw_breakpoint(struct ppc_hw_breakpoint *info, int type,
>   				  unsigned long addr, int len)
>   {
> @@ -338,6 +365,22 @@ static void test_sethwdebug_exact(pid_t child_pid)
>   	ptrace_delhwdebug(child_pid, wh);
>   }
>   
> +static void test_sethwdebug_exact_kernel_userspace(pid_t child_pid)
> +{
> +	struct ppc_hw_breakpoint info;
> +	unsigned long wp_addr = (unsigned long)&cwd;
> +	char *name = "PPC_PTRACE_SETHWDEBUG, MODE_EXACT";
> +	int len = 1; /* hardcoded in kernel */
> +	int wh;
> +
> +	/* PPC_PTRACE_SETHWDEBUG, MODE_EXACT, Kernel Access Userspace test */
> +	get_ppc_hw_breakpoint(&info, PPC_BREAKPOINT_TRIGGER_WRITE, wp_addr, 0);
> +	wh = ptrace_sethwdebug(child_pid, &info);
> +	ptrace(PTRACE_CONT, child_pid, NULL, 0);
> +	check_success(child_pid, name, "Kernel Access Userspace", wp_addr, len);
> +	ptrace_delhwdebug(child_pid, wh);
> +}
> +
>   static void test_sethwdebug_range_aligned(pid_t child_pid)
>   {
>   	struct ppc_hw_breakpoint info;
> @@ -452,9 +495,10 @@ static void
>   run_tests(pid_t child_pid, struct ppc_debug_info *dbginfo, bool dawr)
>   {
>   	test_set_debugreg(child_pid);
> +	test_set_debugreg_kernel_userspace(child_pid);
> +	test_sethwdebug_exact(child_pid);
> +	test_sethwdebug_exact_kernel_userspace(child_pid);
>   	if (dbginfo->features & PPC_DEBUG_FEATURE_DATA_BP_RANGE) {
> -		test_sethwdebug_exact(child_pid);
> -
>   		test_sethwdebug_range_aligned(child_pid);
>   		if (dawr || is_8xx) {
>   			test_sethwdebug_range_unaligned(child_pid);
> 
