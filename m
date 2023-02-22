Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A393E69F0FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 10:09:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM9MW3QqFz3c8n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 20:09:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NuposLuw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NuposLuw;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM9LW44bVz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 20:08:35 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31M8fpLs028942;
	Wed, 22 Feb 2023 09:08:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=rcjyfGKmpAKDOP7mXosqDu8uluZWDsTIettYsh8XREc=;
 b=NuposLuwy/+EbCZv5FjVWT4Mvnl0zjWdJHDAdtX50XQjPUcize6CDIrCrtd/JWAZjjPn
 5gALNjmXd2GMSxhlAjaFkIad6Zki3G/9izWTWdYAmyNxGyMVlJXO5ycP34kWkD665K1L
 naTtgA6dlY02hWPcxOJXnRzLY8dV297DJwM/b/Sybz8+8v0JXbkscDZ3CB26OLyWmY7a
 WHeFVRHPwDuXPygOVkEA0R8Dou5e1Gv3J0bVbBJdvZYJIyc/oC9z4POsSvcQ+YhHscOo
 T+8xzbFREMnzeL13pvu/rh+r7jNysKY289QUKCPVZ3vsIi7bKBIRBq2FfthwH4Uqr5bA 7Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwfrtrkna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:08:27 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31M8tnD3019923;
	Wed, 22 Feb 2023 09:08:27 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwfrtrkmf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:08:26 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31LCgmfl021022;
	Wed, 22 Feb 2023 09:03:24 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3ntpa6bus4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 09:03:24 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31M93Lrh15794928
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Feb 2023 09:03:22 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D41CA2005A;
	Wed, 22 Feb 2023 09:03:21 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 14DFA2004B;
	Wed, 22 Feb 2023 09:03:19 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.123.148])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Feb 2023 09:03:18 +0000 (GMT)
Date: Wed, 22 Feb 2023 14:33:15 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Rohan McLure <rmclure@linux.ibm.com>
Subject: Re: [PATCH] arch/powerpc/include/asm/barrier.h: redefine rmb and wmb
 to lwsync
Message-ID: <Y/XaUxqJ496aNVT8@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230222090112.187583-1-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222090112.187583-1-kconsul@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Scvm_QIDFOU1mcbQIHPjxvLY0FDRK_MR
X-Proofpoint-GUID: KGRbCcD5NqC51KYpp4t099HFQoes8bSs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_04,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 adultscore=0 phishscore=0
 mlxlogscore=716 suspectscore=0 lowpriorityscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302220078
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sorry, sent the wrong patch!
Please ignore this one.
Sending the v2 in another email.

On Wed, Feb 22, 2023 at 02:31:12PM +0530, Kautuk Consul wrote:
> A link from ibm.com states:
> "Ensures that all instructions preceding the call to __lwsync
>  complete before any subsequent store instructions can be executed
>  on the processor that executed the function. Also, it ensures that
>  all load instructions preceding the call to __lwsync complete before
>  any subsequent load instructions can be executed on the processor
>  that executed the function. This allows you to synchronize between
>  multiple processors with minimal performance impact, as __lwsync
>  does not wait for confirmation from each processor."
> 
> Thats why smp_rmb() and smp_wmb() are defined to lwsync.
> But this same understanding applies to parallel pipeline
> execution on each PowerPC processor.
> So, use the lwsync instruction for rmb() and wmb() on the PPC
> architectures that support it.
> 
> Also removed some useless spaces.
> 
> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>  arch/powerpc/include/asm/barrier.h | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/barrier.h b/arch/powerpc/include/asm/barrier.h
> index e80b2c0e9315..553f5a5d20bd 100644
> --- a/arch/powerpc/include/asm/barrier.h
> +++ b/arch/powerpc/include/asm/barrier.h
> @@ -41,11 +41,17 @@
> 
>  /* The sub-arch has lwsync */
>  #if defined(CONFIG_PPC64) || defined(CONFIG_PPC_E500MC)
> -#    define SMPWMB      LWSYNC
> +#undef rmb
> +#undef wmb
> +/* Redefine rmb() to lwsync. */
> +#define rmb()	({__asm__ __volatile__ ("lwsync" : : : "memory"); })
> +/* Redefine wmb() to lwsync. */
> +#define wmb()	({__asm__ __volatile__ ("lwsync" : : : "memory"); })
> +#define SMPWMB      LWSYNC
>  #elif defined(CONFIG_BOOKE)
> -#    define SMPWMB      mbar
> +#define SMPWMB      mbar
>  #else
> -#    define SMPWMB      eieio
> +#define SMPWMB      eieio
>  #endif
> 
>  /* clang defines this macro for a builtin, which will not work with runtime patching */
> -- 
> 2.31.1
> 
