Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 698A23993C4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 21:45:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwKJD5jnCz308y
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 05:45:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Yv6l/FK5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Yv6l/FK5; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwKHh2VXYz2yWQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 05:45:02 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 152JX3U8071971; Wed, 2 Jun 2021 15:44:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=+TAQ3smY+zDml92G3LDkrZ6KDiukcfD99gftZklAjvw=;
 b=Yv6l/FK5c2QL6FJ3wD0UDaDaTnGDGhdXNPDxAXUJ6NkAo2P93p3a5YsA3HU7vgya63JO
 fTmGynJyOpSV8JfZMsLClzVK25jTGjt2ucX1WeRHLCtti26vPcijc9O6NP9Eq6abgkRj
 AyyLH74pdzA2UrRybFh2rVBcnYqDoHU0uh7jH9Z51z9XdgxPaZRKw38kIW3U59TvA4JZ
 dASPGP0gijbAV+j84NVPm3jp4RATjf+K27YTg0iSRfyZFI0vfJccwPxmMlEPMFFvcMP/
 JjtNZ7QaRok1do3p8jyFpUl8IUygtt5en2oJ9+B6s/wsCsFwbKVWaZipbf9mkaRbP+9H yA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38xf3tj1ka-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 15:44:42 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 152JXb2p073864;
 Wed, 2 Jun 2021 15:44:41 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38xf3tj1k2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 15:44:41 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 152JQVKC011817;
 Wed, 2 Jun 2021 19:44:41 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 38ud89a524-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Jun 2021 19:44:41 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 152JievW10879322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Jun 2021 19:44:40 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5414CC605B;
 Wed,  2 Jun 2021 19:44:40 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 267D6C6055;
 Wed,  2 Jun 2021 19:44:40 +0000 (GMT)
Received: from localhost (unknown [9.163.23.97])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  2 Jun 2021 19:44:39 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/stacktrace: fix raise_backtrace_ipi() logic
In-Reply-To: <87eedkh6cb.fsf@mpe.ellerman.id.au>
References: <20210527011550.235443-1-nathanl@linux.ibm.com>
 <87eedkh6cb.fsf@mpe.ellerman.id.au>
Date: Wed, 02 Jun 2021 14:44:39 -0500
Message-ID: <871r9kyrtk.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S0jVsO21D7hQYEBr6ztWi-9JMmC1vjHT
X-Proofpoint-GUID: zsVfxutrWLboyrX1F-FY8ENpKDW4htRF
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-02_10:2021-06-02,
 2021-06-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 clxscore=1015 mlxlogscore=999
 suspectscore=0 adultscore=0 mlxscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106020124
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
Cc: npiggin@gmail.com, paulus@samba.org, clg@kaod.org, ldufour@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Michael Ellerman <mpe@ellerman.id.au> writes:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> When smp_send_safe_nmi_ipi() indicates that the target CPU has
>> responded to the IPI, skip the remote paca inspection
>> fallback. Otherwise both the sending and target CPUs attempt the
>> backtrace, usually creating a misleading ("didn't respond to backtrace
>> IPI" is wrong) and interleaved mess:
>
> Thanks for fixing my bugs for me :)
>

Thanks for your review! I was beginning to think I had missed some
subtletly here, thanks for illustrating it.

I'll run with your proposed change below for the problem I'm working.


> To solve it I think we want to avoid clearing a CPU from the mask unless
> we know that the IPI failed for that CPU. That way there's no risk of
> suppressing a trace from a CPU that successfully handles the IPI, and we
> know we've waited 5 seconds for CPUs that fail to handle the IPI.
>
> I don't think we want to allocate a whole new cpumask to track which
> CPUs have failed to respond, but I don't think we need to. We can just
> synchronously handle them.
>
> diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
> index 1deb1bf331dd..980e87f7ae7a 100644
> --- a/arch/powerpc/kernel/stacktrace.c
> +++ b/arch/powerpc/kernel/stacktrace.c
> @@ -172,17 +172,19 @@ static void handle_backtrace_ipi(struct pt_regs *regs)
>  
>  static void raise_backtrace_ipi(cpumask_t *mask)
>  {
> +	struct paca_struct *p;
>  	unsigned int cpu;
>  
>  	for_each_cpu(cpu, mask) {
> -		if (cpu == smp_processor_id())
> +		if (cpu == smp_processor_id()) {
>  			handle_backtrace_ipi(NULL);
> -		else
> -			smp_send_safe_nmi_ipi(cpu, handle_backtrace_ipi, 5 * USEC_PER_SEC);
> -	}
> +			continue;
> +		}
>  
> -	for_each_cpu(cpu, mask) {
> -		struct paca_struct *p = paca_ptrs[cpu];
> +		if (smp_send_safe_nmi_ipi(cpu, handle_backtrace_ipi, 5 * USEC_PER_SEC))
> +			continue;
> +
> +		p = paca_ptrs[cpu];
>  
>  		cpumask_clear_cpu(cpu, mask);
>  
