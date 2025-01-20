Return-Path: <linuxppc-dev+bounces-5391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40740A16A7E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jan 2025 11:10:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yc5gv63ZHz302b;
	Mon, 20 Jan 2025 21:10:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737367835;
	cv=none; b=e/A1XgE07yC41j4pmh+QGndmkpBcUwptfJsvv1GUhh5p47rcPNrr/YkWXVr3Fxrsm2Wl75TdMm1Al4KIUnKttQPg0IKN97S8qe2wHWqIS0Q9vwi+NmDqufZEWl7JkKlKj91CSNVb88gwy+PlZKVhnwNA2RUEY5w2LDPeEvNdS4mSyQrkZZUcbuFceFbr3B3b2+9a8JF5f3BA1wvmffghhsXev5/h3rtWX9AG+KfrgqgSF8X6rCTa02wPMytf0Qr74pe6QNKxISnQwLUAXA+9G2T/MPS5Pqo3tS5K998Z2ulayrajBEvZXjADn8gx4+LUY/WbKgY2hWjN4Hmsi5OXOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737367835; c=relaxed/relaxed;
	bh=9UQq6VAGnHg3um68FsouhZBJ/1T15FdfUDIuKZW//7U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oe4VjDmTdOH+GH38YyH0bw8aT6QivusI5vNcSGEe8LKKkStdWXxDyIbJwZyEsz8tvoEAbTZGuu63RUk2dBNGjuicUxaJxkjcVujhCIy7cuUMaFCkJD5RSj3cTYTDfI15ep0eUveROGZ8rGDvpULljKsRR0QUuX+KNyaz6Zqqs9NP3xyeOCracbLv3dK+KNaT+aKV2f24r76rGFe6UUH5fb0m/g9MmCnnr+v8VEDcqlZcGLcdCd44uUDEnG/Y7h54uxgete8ff6CBXLYqocO12a6BH82dgqYNH2DZjByi/pH7LWVPVbukS4TQ8yzZbui87RI77lpPp9+PUk824wCtnA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tEccHcZ2; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tEccHcZ2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yc5gv0Gkrz3029
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jan 2025 21:10:34 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50K5NlpR002996;
	Mon, 20 Jan 2025 10:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=9UQq6V
	AGnHg3um68FsouhZBJ/1T15FdfUDIuKZW//7U=; b=tEccHcZ26PcZeBgjRxiYh+
	7AZiDyVVj8cn9x23FWWwdKUAgozwR9Jgdb6Gz/2v9pS2bisAcxFJboK3j6AM37l0
	bWKBK0PlFeB8RjEsrdDekq13Lwiyp6aVFwyc178p+OEV2HjIlUroQlWzq0QQnlms
	ycp7eYjSoMzfpmQOJL8HNU2VljDEk0QLIb7Zp6DjgyB+Adi7LC5C0SALs7M1/2wx
	zjsMcElUYnexjYfIcX6rC5Sr6vyVBU+CAyzi9OYDAcMiGcYHymYFht6gtfFCY3UU
	3uv5KoqQcN0JPLdSFo0l7ZU7asMfay2XfCPCVoUeVceUlDniGKqmVMKQiKs1Jc8g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449ga7987c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 10:10:06 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50KA3pCR021938;
	Mon, 20 Jan 2025 10:10:05 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 449ga79875-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 10:10:05 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50K8pZcY032223;
	Mon, 20 Jan 2025 10:10:04 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 448rujdj01-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Jan 2025 10:10:04 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50KAA2dh34472338
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Jan 2025 10:10:02 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 875F92004B;
	Mon, 20 Jan 2025 10:10:02 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E1E22004D;
	Mon, 20 Jan 2025 10:09:59 +0000 (GMT)
Received: from [9.109.215.252] (unknown [9.109.215.252])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Jan 2025 10:09:59 +0000 (GMT)
Message-ID: <671a14f1-55a1-4d80-ae5c-83f20bf3037c@linux.ibm.com>
Date: Mon, 20 Jan 2025 15:39:58 +0530
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 20/28] powerpc/ftrace: Use RCU in all users of
 __module_text_address().
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Daniel Gomez <da.gomez@samsung.com>, Luis Chamberlain
 <mcgrof@kernel.org>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Petr Pavlu <petr.pavlu@suse.com>,
        Sami Tolvanen <samitolvanen@google.com>,
        Thomas Gleixner
 <tglx@linutronix.de>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-modules@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250108090457.512198-1-bigeasy@linutronix.de>
 <20250108090457.512198-21-bigeasy@linutronix.de>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250108090457.512198-21-bigeasy@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: W23kHP3fl5d9f8v3moATuooEveeLO-eN
X-Proofpoint-GUID: qkIVtfA37V68gBFWsUiduV7x__Ekg-Wm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-20_02,2025-01-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 impostorscore=0 suspectscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2501200083
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 1/8/25 14:34, Sebastian Andrzej Siewior wrote:
> __module_text_address() can be invoked within a RCU section, there is no
> requirement to have preemption disabled.
> 
> Replace the preempt_disable() section around __module_text_address()
> with RCU.
> 
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Masami Hiramatsu <mhiramat@kernel.org>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Naveen N Rao <naveen@kernel.org>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Steven Rostedt <rostedt@goodmis.org>
> Cc: linux-trace-kernel@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
>   arch/powerpc/kernel/trace/ftrace.c       | 6 ++----
>   arch/powerpc/kernel/trace/ftrace_64_pg.c | 6 ++----
>   2 files changed, 4 insertions(+), 8 deletions(-)
> 

Ran ftrace (function graph) on preempt=full kernel with rcutorture while doing modprobe/rmmod.
rcutorture succeeded and didn't see any splats.
If there is any other method to test it out, please let me know.

So for powerpc bits:
Tested-by: Shrikanth Hegde <sshegde@linux.ibm.com>

> diff --git a/arch/powerpc/kernel/trace/ftrace.c b/arch/powerpc/kernel/trace/ftrace.c
> index 5ccd791761e8f..558d7f4e4bea6 100644
> --- a/arch/powerpc/kernel/trace/ftrace.c
> +++ b/arch/powerpc/kernel/trace/ftrace.c
> @@ -115,10 +115,8 @@ static unsigned long ftrace_lookup_module_stub(unsigned long ip, unsigned long a
>   {
>   	struct module *mod = NULL;
>   
> -	preempt_disable();
> -	mod = __module_text_address(ip);
> -	preempt_enable();
> -
> +	scoped_guard(rcu)
> +		mod = __module_text_address(ip);
>   	if (!mod)
>   		pr_err("No module loaded at addr=%lx\n", ip);
>   
> diff --git a/arch/powerpc/kernel/trace/ftrace_64_pg.c b/arch/powerpc/kernel/trace/ftrace_64_pg.c
> index 98787376eb87c..531d40f10c8a1 100644
> --- a/arch/powerpc/kernel/trace/ftrace_64_pg.c
> +++ b/arch/powerpc/kernel/trace/ftrace_64_pg.c
> @@ -120,10 +120,8 @@ static struct module *ftrace_lookup_module(struct dyn_ftrace *rec)
>   {
>   	struct module *mod;
>   
> -	preempt_disable();
> -	mod = __module_text_address(rec->ip);
> -	preempt_enable();
> -
> +	scoped_guard(rcu)
> +		mod = __module_text_address(rec->ip);
>   	if (!mod)
>   		pr_err("No module loaded at addr=%lx\n", rec->ip);
>   


