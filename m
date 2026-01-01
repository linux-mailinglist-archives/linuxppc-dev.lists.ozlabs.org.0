Return-Path: <linuxppc-dev+bounces-15119-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20388CED3A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 01 Jan 2026 18:32:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dhv5b3Kvfz2xqr;
	Fri, 02 Jan 2026 04:32:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767288723;
	cv=none; b=WVzUDn0LeKUAT1fEJkKDKRM0wJJni4ipGs05eowvjwFQAT5k6KvXblwlDwaxS+M6VJ6986QcLLF7MDemoXPGgPiZX+rjvDx6MbtOjHj0JxHHx8S2SFf9svJovc6y/uPAweHXz/a0fHGqK8GOHkeUC7SFD5vdD/NDPHzyI2/ux5twSoPQwyW1N3RgapOgvGkdhGoewGCyuTcjUHbnYUV5SznLtTaLdjqXWDx5VcFg+B/rihHLNnSXJBLKUmqsmtixkiyrCrMCtEiiUj8/kbChfbksq/yjb/cM6LEUFAmWc4AC81F31sPZnS5/w6v/hPvLfUhaKy9OX3QYcbodLSC5ow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767288723; c=relaxed/relaxed;
	bh=9cVPcBzcNuNWZu/mFHrlpFmSxzBna8KNN0JfFTjJkJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=OLslzDkJj17OpNBpCfSE5I7iitQDd5lyVcn8kh4ZA8bGSIco8sn9SShFFIfgT/CcvmmkPzhq/lz0dhoGEwBeTwPgqiwj6jMcoCRk3vtBxfd/JUY25kswN3UlUh0uh3QA9hXSaOxZQ8aY1xSPEgbQ+gGFlYRnmGpsnXFOQyjxgz+J3XCbjnfZdjbEO1LulAIxQa/QQGK7OS4Sw0aGkoUHm+wWDUCJMVs4eEddfn4pv9FNetGIrO6zGwDO4RIfB1py6MiWtRkaONkfMH1pUcnLUFqL5P6Ov852S7deEe1LPhJBmgxcnCGH6ukHS7VoedDggTUX2GHNzXu0CSyQOeN3Ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ru1Z3RJT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ru1Z3RJT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dhv5Z3WPpz2xjK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 02 Jan 2026 04:32:01 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6015QuGC031252;
	Thu, 1 Jan 2026 17:31:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9cVPcB
	zcNuNWZu/mFHrlpFmSxzBna8KNN0JfFTjJkJ0=; b=ru1Z3RJT7Azfd8wBQKJEVJ
	HFuFUfNlO3NOQEA1UzafHev4vWR2DN2r7B9ZHdTe3pgDJKdjOXp+tXjZ79SYilbb
	tJBDln6YtHAhq0ojO2DAPtgyLcpfbRlnP2mlBuWRK0Xr+jsRkqbpIebrqqD5YIbG
	JpWpFTybnfLhl/r0MXB0I/kmUoohD71GqFbxOk7rBrmWqA5fa/7lElPzzWMA9Fxz
	zRZ7d4iCOusYni+naztZaqKyoCcPCK1IOBEk9RW07ED0X0Eq2oubwyeoLuC5TtHI
	3/Lv9NG39BXuDThVxzNDK0ydMLODiYnORlMaegaAkQBJPCITVKGd4ISRy6C6o6zQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba74uct84-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 17:31:21 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 601HVKJL008011;
	Thu, 1 Jan 2026 17:31:20 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba74uct80-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 17:31:20 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 601GxCvF025002;
	Thu, 1 Jan 2026 17:31:19 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bau9kkced-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 17:31:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 601HVEdw28705400
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Jan 2026 17:31:14 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A103F20043;
	Thu,  1 Jan 2026 17:31:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B46A020040;
	Thu,  1 Jan 2026 17:31:09 +0000 (GMT)
Received: from [9.124.213.107] (unknown [9.124.213.107])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Jan 2026 17:31:09 +0000 (GMT)
Message-ID: <25b443c7-cdbc-43c4-8db0-4c5eb3435687@linux.ibm.com>
Date: Thu, 1 Jan 2026 23:01:08 +0530
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
Subject: Re: [PATCH v3 7/8] powerpc: Enable IRQ generic entry/exit path.
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, chleroy@kernel.org,
        maddy@linux.ibm.com
References: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
 <20251229045416.3193779-8-mkchauras@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, npiggin@gmail.com, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, akpm@linux-foundation.org, macro@orcam.me.uk,
        deller@gmx.de, ldv@strace.io, charlie@rivosinc.com,
        segher@kernel.crashing.org, bigeasy@linutronix.de,
        peterz@infradead.org, namcao@linutronix.de, tglx@linutronix.de,
        kan.liang@linux.intel.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251229045416.3193779-8-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Z5wAenxfy5BjLOelQD8nD0wrTbz1T4lp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDE1NiBTYWx0ZWRfX6vanIavcbU40
 sejzJCBRZi+oqYAh2tI1XZrrMh1/HasbA7IjE5YYmAPikiV6F5Or5ASx43dQOF/V35MUGzQcou4
 Jx6t8KsUYFAlT+VMVsdHOpDyXCvh0z/lkMYQ5l5a2SWrsDcg3Yrn7Yw1B5sUxXAxRIvjx8MTL/K
 cMEEFsJL+lW4B4J/IvT3OX1Xm3rIwaIwO3F855lMgGBABNc4lfoh0eaIKaXv1X/A5HFB1CPs6XN
 OgL3FaQr6Lb9KOVf7IJW051872AbZ+A32PfenZVUAcvJSq4fe8nXlz5EEDPeVnIvtplYx23X3bm
 SE1u5pnVjKA+/MILNymnq9LdMg2gvzKU8ELtWG/xeQow2aBCanzYkJqxlozobWpG8SxjiU6O/H4
 M6doSrh5T6D7moApZHl/yqtjWSRNpomBmekLu0EZBkpIqpgvzkE+9i/KjlCJhfn+F8JgUWRN5qu
 4BnhadhJN0hrmDUk3OQ==
X-Authority-Analysis: v=2.4 cv=AN8t5o3d c=1 sm=1 tr=0 ts=6956af69 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=W8_4DrIo1EK6N-XtgdQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: -j3UX77xl29aqOgNk31QBrJQ_cpED9mE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_06,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 adultscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601010156
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 12/29/25 10:24 AM, Mukesh Kumar Chaurasiya wrote:
> From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> 
> Enable the generic IRQ entry/exit infrastructure on PowerPC by selecting
> GENERIC_IRQ_ENTRY and integrating the architecture-specific interrupt
> handlers with the generic entry/exit APIs.
> 
> This change replaces PowerPC’s local interrupt entry/exit handling with
> calls to the generic irqentry_* helpers, aligning the architecture with
> the common kernel entry model. The macros that define interrupt, async,
> and NMI handlers are updated to use irqentry_enter()/irqentry_exit()
> and irqentry_nmi_enter()/irqentry_nmi_exit() where applicable.
> 
> Key updates include:
>   - Select GENERIC_IRQ_ENTRY in Kconfig.
>   - Replace interrupt_enter/exit_prepare() with arch_interrupt_* helpers.
>   - Integrate irqentry_enter()/exit() in standard and async interrupt paths.
>   - Integrate irqentry_nmi_enter()/exit() in NMI handlers.
>   - Remove redundant irq_enter()/irq_exit() calls now handled generically.
>   - Use irqentry_exit_cond_resched() for preemption checks.
>   - Remove unused code.
> 
> This change establishes the necessary wiring for PowerPC to use the
> generic IRQ entry/exit framework while maintaining existing semantics.
> 
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> ---
>   arch/powerpc/Kconfig                    |   1 +
>   arch/powerpc/include/asm/entry-common.h |  61 +--
>   arch/powerpc/include/asm/interrupt.h    | 484 +++---------------------
>   arch/powerpc/kernel/interrupt.c         |  15 +-
>   4 files changed, 72 insertions(+), 489 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 9537a61ebae0..398cef868c14 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -207,6 +207,7 @@ config PPC
>   	select GENERIC_GETTIMEOFDAY
>   	select GENERIC_IDLE_POLL_SETUP
>   	select GENERIC_IOREMAP
> +	select GENERIC_IRQ_ENTRY
>   	select GENERIC_IRQ_SHOW
>   	select GENERIC_IRQ_SHOW_LEVEL
>   	select GENERIC_PCI_IOMAP		if PCI

There is no need for GENERIC_IRQ_ENTRY. I don't see a reason why
we need to have both.

Enabling GENERIC_ENTRY which is done in next patch will enable this.
It does the same thing and one less kconfig to worry about.

This would allow some easier code refactoring IMO.

- You can keep adding code to asm/entry-common.h. This will help avoid
   moving to interrupt.h in between.

- You can add another patch as cleanup post GENERIC_ENTRY for
easier review for seccomp/ptrace.

...

- Some more ct_warning in arch/powerpc are probably not necessary
   (can be done post the series too)

- Some more cleanups can be done w.r.t to lockdep and tracing hardirq etc.
   For example in next_interrupt. I think replay soft interrupts will end
   up making irqentry_enter/exit calls which does same or similar thing.
   (can be done post the series too)

- can we move syscall_exit_prepare/ into kernel/syscall.c?
   (can be done post the series too)

