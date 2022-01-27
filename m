Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD5849EDB6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 22:47:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JlDhs4Y5Fz3cQb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jan 2022 08:47:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qhCRIQA2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=svens@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qhCRIQA2; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jl8c7666zz30Nc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jan 2022 05:43:19 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20RIaOtA023213; 
 Thu, 27 Jan 2022 18:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : references : date : in-reply-to : message-id : mime-version :
 content-type; s=pp1; bh=OmjHzzN55rn5gvuakNcsIiAB/aXZ1Qn2ZDokzt7e2ks=;
 b=qhCRIQA2bKp6XgpBiw0ftE6LLPoaT5D2NkTB6jgU2De64VbGwJ8b5RygP9pFeUKA+3KZ
 IX9Yo3aEFCWnvZdrZEsY1mZ6cW1yRXaDT+A3LTldBLgAr+6TaQ4kEnk2JvEjSs39sjBc
 556sjTVUwF68mTRiLr7t+s34kAcbSWbUlny8ELqRvISPeFdgTFIYelV38nN5u9//d4LU
 dSsKzUYyGb18oKvOCki/CETIYwlFbWI8l+w9hEL09Ps0jKCvVr5TxyFWFEXBMisFFLux
 FWUiphybnfzjB0qFoDIe26AhA4KN1ZJqGnfqRHDZinsk20SMIAv2rV706KESIC9idTub 0Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv01jh2s7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 18:42:42 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20RIaSrk023892;
 Thu, 27 Jan 2022 18:42:41 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dv01jh2rj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 18:42:41 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20RIgdbM003501;
 Thu, 27 Jan 2022 18:42:39 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 3dr96k31dc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Jan 2022 18:42:39 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20RIgao544892456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Jan 2022 18:42:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0C3DEA405C;
 Thu, 27 Jan 2022 18:42:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DBECA405B;
 Thu, 27 Jan 2022 18:42:35 +0000 (GMT)
Received: from tuxmaker.linux.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 27 Jan 2022 18:42:35 +0000 (GMT)
From: Sven Schnelle <svens@linux.ibm.com>
To: Mark Rutland <mark.rutland@arm.com>
Subject: ftrace hangs waiting for rcu (was: Re: [PATCH] ftrace: Have
 architectures opt-in for mcount build time sorting)
References: <20220127114249.03b1b52b@gandalf.local.home>
 <YfLjIOlGfFmbh1Zv@FVFF77S0Q05N>
Date: Thu, 27 Jan 2022 19:42:35 +0100
In-Reply-To: <YfLjIOlGfFmbh1Zv@FVFF77S0Q05N> (Mark Rutland's message of "Thu, 
 27 Jan 2022 18:23:28 +0000")
Message-ID: <yt9dy231yq90.fsf_-_@linux.ibm.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nnFFgBOi5_IS2Dw8d9R10S4zSrWNbVc2
X-Proofpoint-GUID: biWliyaFKpwjRzpTyg2cmc9zgnZ58h_0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-27_03,2022-01-27_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1011 mlxlogscore=999 phishscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201270107
X-Mailman-Approved-At: Fri, 28 Jan 2022 08:44:30 +1100
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
Cc: Kees Cook <keescook@chromium.org>, hca@linux.ibm.com,
 LKML <linux-kernel@vger.kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
 Ingo Molnar <mingo@kernel.org>, linux-s390@vgr.kernel.org,
 Sachin Sant <sachinp@linux.ibm.com>, Russell King <linux@armlinux.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>, Yinan Liu <yinan@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, Ard Biesheuvel <ardb@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mark,

Mark Rutland <mark.rutland@arm.com> writes:

> * I intermittently see a hang when running the tests. I previously hit that
>   when originally trying to bisect this issue (and IIRC that bisected down to
>   some RCU changes, but I need to re-run that). When the tests hang I
>   magic-srsrq + L tells me:
>
>   [  271.938438] sysrq: Show Blocked State
>   [  271.939245] task:ftracetest      state:D stack:    0 pid: 5687 ppid:  5627 flags:0x00000200
>   [  271.940961] Call trace:
>   [  271.941472]  __switch_to+0x104/0x160
>   [  271.942213]  __schedule+0x2b0/0x6e0
>   [  271.942933]  schedule+0x5c/0xf0
>   [  271.943586]  schedule_timeout+0x184/0x1c4
>   [  271.944410]  wait_for_completion+0x8c/0x12c
>   [  271.945274]  __wait_rcu_gp+0x184/0x190
>   [  271.946047]  synchronize_rcu_tasks_rude+0x48/0x70
>   [  271.947007]  update_ftrace_function+0xa4/0xec
>   [  271.947897]  __unregister_ftrace_function+0xa4/0xf0
>   [  271.948898]  unregister_ftrace_function+0x34/0x70
>   [  271.949857]  wakeup_tracer_reset+0x4c/0x100
>   [  271.950713]  tracing_set_tracer+0xd0/0x2b0
>   [  271.951552]  tracing_set_trace_write+0xe8/0x150
>   [  271.952477]  vfs_write+0xfc/0x284
>   [  271.953171]  ksys_write+0x7c/0x110
>   [  271.953874]  __arm64_sys_write+0x2c/0x40
>   [  271.954678]  invoke_syscall+0x5c/0x130
>   [  271.955442]  el0_svc_common.constprop.0+0x108/0x130
>   [  271.956435]  do_el0_svc+0x74/0x90
>   [  271.957124]  el0_svc+0x2c/0x90
>   [  271.957757]  el0t_64_sync_handler+0xa8/0x12c
>   [  271.958629]  el0t_64_sync+0x1a0/0x1a4

that's interesting. On s390 i'm seeing the same problem in CI, but with
the startup ftrace tests. So that's likely not arm64 spacific.

On s390, the last messages from ftrace are [    5.663568] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 19112604462750000 ns
[    5.667099] futex hash table entries: 65536 (order: 12, 16777216 bytes, vmalloc)
[    5.739549] Running postponed tracer tests:
[    5.740662] Testing tracer function: PASSED
[    6.194635] Testing dynamic ftrace: PASSED
[    6.471213] Testing dynamic ftrace ops #1: 
[    6.558445] (1 0 1 0 0) 
[    6.558458] (1 1 2 0 0) 
[    6.699135] (2 1 3 0 764347) 
[    6.699252] (2 2 4 0 766466) 
[    6.759857] (3 2 4 0 1159604)
[..] hangs here

The backtrace looks like this, which is very similar to the one above:

crash> bt 1
PID: 1      TASK: 80e68100          CPU: 133  COMMAND: "swapper/0"
 #0 [380004df808] __schedule at cda39f0e
 #1 [380004df880] schedule at cda3a488
 #2 [380004df8b0] schedule_timeout at cda41ef6
 #3 [380004df978] wait_for_completion at cda3bd0a
 #4 [380004df9d8] __wait_rcu_gp at ccdddd92
 #5 [380004dfa30] synchronize_rcu_tasks_generic at ccdde0aa
 #6 [380004dfad8] ftrace_shutdown at cce7b050
 #7 [380004dfb18] unregister_ftrace_function at cce7b192
 #8 [380004dfb50] trace_selftest_ops at cda1e0fa
 #9 [380004dfba0] run_tracer_selftest at cda1e4f2
#10 [380004dfc00] trace_selftest_startup_function at ce74355c
#11 [380004dfc58] run_tracer_selftest at cda1e2fc
#12 [380004dfc98] init_trace_selftests at ce742d30
#13 [380004dfcd0] do_one_initcall at cccdca16
#14 [380004dfd68] do_initcalls at ce72e776
#15 [380004dfde0] kernel_init_freeable at ce72ea60
#16 [380004dfe50] kernel_init at cda333fe
#17 [380004dfe68] __ret_from_fork at cccdf920
#18 [380004dfe98] ret_from_fork at cda444ca

I didn't had success reproducing it so far, but it is good to know that
this also happens when running the ftrace testsuite.

I have several crashdumps, so i could try to pull out some information
if someone tells me what to look for.

Thanks,
Sven
