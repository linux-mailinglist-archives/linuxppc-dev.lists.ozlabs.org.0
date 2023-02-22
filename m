Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54A9669EE9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 07:06:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PM5JH1dd2z3bhX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Feb 2023 17:06:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tnLnfisX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tnLnfisX;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PM5HJ0WGBz30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Feb 2023 17:05:31 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31M4IkBI030108;
	Wed, 22 Feb 2023 06:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=NRT05SXa65TIsAkJ5BO7XJHwW2RZiDHwD9FwzujQGRU=;
 b=tnLnfisXTcsaMGDjMH9odrzO+zbFPtP6sAbAe/hM3A2ogjFmt21OWTTXhw22AwcWFN8O
 4Zh8UJpwEFQ1U/geJ7ycSc8p31D0BQCpl3m6gSrdeQWqUWxYCCorezg4bqP3Kt8v/koG
 83H38ibf1tHy26vrZdkbXcJgGXergVSPLW352yWULI9xOXRRXyRlahvacvvGK2I63P6z
 V8sIvdiYJMOty2xPIvu3KnObrY3+hPQbnACn7iaW1GJE14e8WJj9HRbJKJQIA5Qu+zwk
 /onge7am1g8QsBuTun/KMn+8Z4R8GinGbHpIT2FLErAHpPXSS8fXhNZIDf4ihEy3NVck aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwbwnhxpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 06:05:25 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 31M5whJt021851;
	Wed, 22 Feb 2023 06:05:24 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nwbwnhxnf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 06:05:24 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31M07FPm019836;
	Wed, 22 Feb 2023 06:05:22 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3ntnxf4wp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Feb 2023 06:05:22 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31M65JFR21758372
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 22 Feb 2023 06:05:19 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB5562004B;
	Wed, 22 Feb 2023 06:05:19 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5BA4F20043;
	Wed, 22 Feb 2023 06:05:17 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.43.71.187])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 22 Feb 2023 06:05:16 +0000 (GMT)
Date: Wed, 22 Feb 2023 11:35:13 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] arch/powerpc/include/asm/barrier.h: redefine rmb and wmb
 to lwsync
Message-ID: <Y/WwmTV2uqUOvZZU@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230222060107.70565-1-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230222060107.70565-1-kconsul@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 23LklnA1EacKCBijG0Y9VreD0Avlgto-
X-Proofpoint-ORIG-GUID: xPOjz_qKxIp4m42tmgM_w7ofQdYs1qrL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-22_02,2023-02-20_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 priorityscore=1501 clxscore=1015 spamscore=0 mlxlogscore=761 phishscore=0
 suspectscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302220049
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

Hi All,

On Wed, Feb 22, 2023 at 11:31:07AM +0530, Kautuk Consul wrote:
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

I think I am conceptually right about this patch but I lack the
resources currently to tets this out on PowerPC 64 bit servers.

I request IBM/Non-IBM employees to test this patch out for:
a) functionality breaking. This patch is no good if this breaks current
   kernel functionality.
b) performance impact. If functionality doesn't break, can anyone do
   some reliable kernel load testing on ppc64 servers to see if there
   is any significant performance gain ?

Thanks a lot!
