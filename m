Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 564E1652F6C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 11:26:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NcV321rF3z3c8d
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Dec 2022 21:26:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pHgTzbOy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=agordeev@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pHgTzbOy;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NcV201jVmz2ybK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Dec 2022 21:25:11 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BLACXDN025919;
	Wed, 21 Dec 2022 10:24:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=I3FWXRhkqI86UYIbfzkI889goztF0SJR3RpDIZtOdTA=;
 b=pHgTzbOy9Hu37ogtHdb6eCqaSqwKeatYtwFw1rxgft57CJX4PcDLM5vNB8LqGLs80lpK
 vBw7yNY6+eWQfm8zs6aijgrX811OXlsbmUzakuneXpk6Jdi/N0IsYPFBgx7+CsJx5KvU
 /OKwNLpnVjU8aIokWwsRnCRD4dmSXSgo4hYAOD2pIIvDeFlepsMFHWM081uuaMGYdpVj
 BP4Uc6ZkImzBp+fFrBmHdvlD2vQzEOFnTClZRfE8QhCr4/zWyBP5DNER2ufmDG5hA2RW
 31QoWmB8ZM9KOC2Q8/YphhWrsdaVqEreep5sy9+M5UmID+EW/PCFQhUDl8eKiZXp0i1k Qw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mm06brbw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 10:24:47 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2BLAFsag040107;
	Wed, 21 Dec 2022 10:24:46 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mm06brbum-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 10:24:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 2BL10jZS000918;
	Wed, 21 Dec 2022 10:11:29 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3mh6ywnc8a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 10:11:29 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2BLABRXF44302610
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Dec 2022 10:11:27 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 204572004D;
	Wed, 21 Dec 2022 10:11:27 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EFC920043;
	Wed, 21 Dec 2022 10:11:26 +0000 (GMT)
Received: from li-4a3a4a4c-28e5-11b2-a85c-a8d192c6f089.ibm.com (unknown [9.179.0.69])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 21 Dec 2022 10:11:22 +0000 (GMT)
Date: Wed, 21 Dec 2022 11:11:21 +0100
From: Alexander Gordeev <agordeev@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] cputime: remove cputime_to_nsecs fallback
Message-ID: <Y6LbybwH9zrjXy8r@li-4a3a4a4c-28e5-11b2-a85c-a8d192c6f089.ibm.com>
References: <20221220070705.2958959-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221220070705.2958959-1-npiggin@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PuVTAINCMh-EUApWfEIbkdGOqDUmnm8F
X-Proofpoint-ORIG-GUID: RrTDL3OMTTRfuc4moqR5PWXUcp4V74lz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_04,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 spamscore=0 mlxlogscore=918
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212210081
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Rik van Riel <riel@surriel.com>, Peter Zijlstra <peterz@infradead.org>, Frederic Weisbecker <fweisbec@gmail.com>, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 20, 2022 at 05:07:05PM +1000, Nicholas Piggin wrote:
> The archs that use cputime_to_nsecs() internally provide their own
> definition and don't need the fallback. cputime_to_usecs() unused except
> in this fallback, and is not defined anywhere.
> 
> This removes the final remnant of the cputime_t code from the kernel.
> 
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Rik van Riel <riel@surriel.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Frederic Weisbecker <fweisbec@gmail.com>
> Cc: Sven Schnelle <svens@linux.ibm.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: linux-s390@vger.kernel.org
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> This required a couple of tweaks to s390 includes so we're not pulling
> asm/cputime.h into the core header unnecessarily. In that case maybe
> this can go via s390 tree because the patch should be otherwise quite
> trivial. Could it get an ack or two from a core maintainer to support
> that?
> 
> Thanks,
> Nick
> 
>  arch/s390/kernel/idle.c       | 2 +-
>  arch/s390/kernel/vtime.c      | 2 +-
>  include/linux/sched/cputime.h | 9 ---------
>  kernel/sched/cputime.c        | 4 ++++
>  4 files changed, 6 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/s390/kernel/idle.c b/arch/s390/kernel/idle.c
> index 4bf1ee293f2b..a6bbceaf7616 100644
> --- a/arch/s390/kernel/idle.c
> +++ b/arch/s390/kernel/idle.c
> @@ -12,9 +12,9 @@
>  #include <linux/notifier.h>
>  #include <linux/init.h>
>  #include <linux/cpu.h>
> -#include <linux/sched/cputime.h>
>  #include <trace/events/power.h>
>  #include <asm/cpu_mf.h>
> +#include <asm/cputime.h>
>  #include <asm/nmi.h>
>  #include <asm/smp.h>
>  #include "entry.h"
> diff --git a/arch/s390/kernel/vtime.c b/arch/s390/kernel/vtime.c
> index 9436f3053b88..e0a88dcaf5cb 100644
> --- a/arch/s390/kernel/vtime.c
> +++ b/arch/s390/kernel/vtime.c
> @@ -7,13 +7,13 @@
>   */
>  
>  #include <linux/kernel_stat.h>
> -#include <linux/sched/cputime.h>
>  #include <linux/export.h>
>  #include <linux/kernel.h>
>  #include <linux/timex.h>
>  #include <linux/types.h>
>  #include <linux/time.h>
>  #include <asm/alternative.h>
> +#include <asm/cputime.h>
>  #include <asm/vtimer.h>
>  #include <asm/vtime.h>
>  #include <asm/cpu_mf.h>
> diff --git a/include/linux/sched/cputime.h b/include/linux/sched/cputime.h
> index ce3c58286062..5f8fd5b24a2e 100644
> --- a/include/linux/sched/cputime.h
> +++ b/include/linux/sched/cputime.h
> @@ -8,15 +8,6 @@
>   * cputime accounting APIs:
>   */
>  
> -#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
> -#include <asm/cputime.h>
> -
> -#ifndef cputime_to_nsecs
> -# define cputime_to_nsecs(__ct)	\
> -	(cputime_to_usecs(__ct) * NSEC_PER_USEC)
> -#endif
> -#endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
> -
>  #ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
>  extern bool task_cputime(struct task_struct *t,
>  			 u64 *utime, u64 *stime);
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index 95fc77853743..af7952f12e6c 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -3,6 +3,10 @@
>   * Simple CPU accounting cgroup controller
>   */
>  
> +#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
> + #include <asm/cputime.h>
> +#endif
> +
>  #ifdef CONFIG_IRQ_TIME_ACCOUNTING
>  
>  /*

For s390:

Acked-by: Alexander Gordeev <agordeev@linux.ibm.com>
