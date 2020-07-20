Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 673F1225BF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 11:43:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9GxJ37PqzDqbw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 19:43:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9Gt34zPHzDqMr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jul 2020 19:40:11 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06K9YnQ3101084; Mon, 20 Jul 2020 05:40:01 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5pedtfy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 05:40:01 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06K9Txx8023307;
 Mon, 20 Jul 2020 09:39:59 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 32brq818vv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 09:39:59 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06K9duJc60686484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 09:39:56 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D674311C04A;
 Mon, 20 Jul 2020 09:39:56 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5B36511C054;
 Mon, 20 Jul 2020 09:39:56 +0000 (GMT)
Received: from pomme.local (unknown [9.145.81.101])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 20 Jul 2020 09:39:56 +0000 (GMT)
Subject: Re: [RFC PATCH] powerpc/pseries/svm: capture instruction faulting on
 MMIO access, in sprg0 register
To: Ram Pai <linuxram@us.ibm.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
References: <1594888333-9370-1-git-send-email-linuxram@us.ibm.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <18e3bcee-8a3a-bd13-c995-8e4168471f74@linux.ibm.com>
Date: Mon, 20 Jul 2020 11:39:56 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1594888333-9370-1-git-send-email-linuxram@us.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_05:2020-07-17,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200071
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
Cc: aik@ozlabs.ru, bharata@linux.ibm.com, sathnaga@linux.vnet.ibm.com,
 sukadev@linux.vnet.ibm.com, bauerman@linux.ibm.com,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 16/07/2020 à 10:32, Ram Pai a écrit :
> An instruction accessing a mmio address, generates a HDSI fault.  This fault is
> appropriately handled by the Hypervisor.  However in the case of secureVMs, the
> fault is delivered to the ultravisor.
> 
> Unfortunately the Ultravisor has no correct-way to fetch the faulting
> instruction. The PEF architecture does not allow Ultravisor to enable MMU
> translation. Walking the two level page table to read the instruction can race
> with other vcpus modifying the SVM's process scoped page table.
> 
> This problem can be correctly solved with some help from the kernel.
> 
> Capture the faulting instruction in SPRG0 register, before executing the
> faulting instruction. This enables the ultravisor to easily procure the
> faulting instruction and emulate it.
> 
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> ---
>   arch/powerpc/include/asm/io.h | 85 ++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 75 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/io.h b/arch/powerpc/include/asm/io.h
> index 635969b..7ef663d 100644
> --- a/arch/powerpc/include/asm/io.h
> +++ b/arch/powerpc/include/asm/io.h
> @@ -35,6 +35,7 @@
>   #include <asm/mmu.h>
>   #include <asm/ppc_asm.h>
>   #include <asm/pgtable.h>
> +#include <asm/svm.h>
>   
>   #define SIO_CONFIG_RA	0x398
>   #define SIO_CONFIG_RD	0x399
> @@ -105,34 +106,98 @@
>   static inline u##size name(const volatile u##size __iomem *addr)	\
>   {									\
>   	u##size ret;							\
> -	__asm__ __volatile__("sync;"#insn" %0,%y1;twi 0,%0,0;isync"	\
> -		: "=r" (ret) : "Z" (*addr) : "memory");			\
> +	if (is_secure_guest()) {					\
> +		__asm__ __volatile__("mfsprg0 %3;"			\
> +				"lnia %2;"				\
> +				"ld %2,12(%2);"				\
> +				"mtsprg0 %2;"				\
> +				"sync;"					\
> +				#insn" %0,%y1;"				\
> +				"twi 0,%0,0;"				\
> +				"isync;"				\
> +				"mtsprg0 %3"				\
> +			: "=r" (ret)					\
> +			: "Z" (*addr), "r" (0), "r" (0)			\

I'm wondering if SPRG0 is restored to its original value.
You're using the same register (r0) for parameters 2 and 3, so when doing lnia 
%2, you're overwriting the SPRG0 value you saved in r0 just earlier.

It may be clearer to use explicit registers for %2 and %3 and to mark them as 
modified for the compiler.

This applies to the other macros.

Cheers,
Laurent.

> +			: "memory");					\
> +	} else {							\
> +		__asm__ __volatile__("sync;"				\
> +				#insn" %0,%y1;"				\
> +				"twi 0,%0,0;"				\
> +				"isync"					\
> +			: "=r" (ret) : "Z" (*addr) : "memory");		\
> +	}								\
>   	return ret;							\
>   }
>   
>   #define DEF_MMIO_OUT_X(name, size, insn)				\
>   static inline void name(volatile u##size __iomem *addr, u##size val)	\
>   {									\
> -	__asm__ __volatile__("sync;"#insn" %1,%y0"			\
> -		: "=Z" (*addr) : "r" (val) : "memory");			\
> -	mmiowb_set_pending();						\
> +	if (is_secure_guest()) {					\
> +		__asm__ __volatile__("mfsprg0 %3;"			\
> +				"lnia %2;"				\
> +				"ld %2,12(%2);"				\
> +				"mtsprg0 %2;"				\
> +				"sync;"					\
> +				#insn" %1,%y0;"				\
> +				"mtsprg0 %3"				\
> +			: "=Z" (*addr)					\
> +			: "r" (val), "r" (0), "r" (0)			\
> +			: "memory");					\
> +	} else {							\
> +		__asm__ __volatile__("sync;"				\
> +				#insn" %1,%y0"				\
> +			: "=Z" (*addr) : "r" (val) : "memory");         \
> +		mmiowb_set_pending();					\
> +	}								\
>   }
>   
>   #define DEF_MMIO_IN_D(name, size, insn)				\
>   static inline u##size name(const volatile u##size __iomem *addr)	\
>   {									\
>   	u##size ret;							\
> -	__asm__ __volatile__("sync;"#insn"%U1%X1 %0,%1;twi 0,%0,0;isync"\
> -		: "=r" (ret) : "m" (*addr) : "memory");			\
> +	if (is_secure_guest()) {					\
> +		__asm__ __volatile__("mfsprg0 %3;"			\
> +				"lnia %2;"				\
> +				"ld %2,12(%2);"				\
> +				"mtsprg0 %2;"				\
> +				"sync;"					\
> +				#insn"%U1%X1 %0,%1;"			\
> +				"twi 0,%0,0;"				\
> +				"isync;"				\
> +				"mtsprg0 %3"				\
> +			: "=r" (ret)					\
> +			: "m" (*addr), "r" (0), "r" (0)			\
> +			: "memory");					\
> +	} else {							\
> +		__asm__ __volatile__("sync;"				\
> +				#insn"%U1%X1 %0,%1;"			\
> +				"twi 0,%0,0;"				\
> +				"isync"					\
> +			: "=r" (ret) : "m" (*addr) : "memory");         \
> +	}								\
>   	return ret;							\
>   }
>   
>   #define DEF_MMIO_OUT_D(name, size, insn)				\
>   static inline void name(volatile u##size __iomem *addr, u##size val)	\
>   {									\
> -	__asm__ __volatile__("sync;"#insn"%U0%X0 %1,%0"			\
> -		: "=m" (*addr) : "r" (val) : "memory");			\
> -	mmiowb_set_pending();						\
> +	if (is_secure_guest()) {					\
> +		__asm__ __volatile__("mfsprg0 %3;"			\
> +				"lnia %2;"				\
> +				"ld %2,12(%2);"				\
> +				"mtsprg0 %2;"				\
> +				"sync;"					\
> +				#insn"%U0%X0 %1,%0;"			\
> +				"mtsprg0 %3"				\
> +			: "=m" (*addr)					\
> +			: "r" (val), "r" (0), "r" (0)			\
> +			: "memory");					\
> +	} else {							\
> +		__asm__ __volatile__("sync;"				\
> +				#insn"%U0%X0 %1,%0"			\
> +			: "=m" (*addr) : "r" (val) : "memory");		\
> +		mmiowb_set_pending();					\
> +	}								\
>   }
>   
>   DEF_MMIO_IN_D(in_8,     8, lbz);
> 

