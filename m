Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D73C134639C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 16:53:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4bWP6N1Cz3bsl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 02:53:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o9FcxuLa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o9FcxuLa; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4bVz41zkz30CJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 02:53:14 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12NFoTd6174998; Tue, 23 Mar 2021 11:53:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=HPWXzp8Ks020a5KcOj/flAH9D7kovDxlvE7BZovZrm0=;
 b=o9FcxuLaxeEvK0R97Ouchk+WKabClMtcQK8LSnxt/djvoKZERvg1YdLgYE/kLwDH7I6d
 viqUGAB/gb1sTdtNmKtZy3GCVGs+XXLSBR7p+Mx+7Wbpsl8/KsqYlmDyABPEz0XyLMSR
 xxYDsD/GoBnyXLrFjR4IuFVnXihXqKEUOdVawOhrUpLOcwnTbSKng9NvsvYYzOD77Dhs
 HlaqvlmbnYKQ6O7o63ZgqTu7IoDbxl4s1l/CGWfoffl5MK7Q24XrSraLVZmah2kxYgPS
 FNBXGhn8jbAwUiOhpclhGac3/J4lPprHLK/j5Js43UR0nslbkclI4VGUok1/S/AeQG/M nA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37fkaxg58u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 11:53:10 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12NFpauv182087;
 Tue, 23 Mar 2021 11:53:09 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37fkaxg57s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 11:53:09 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12NFlFv5027723;
 Tue, 23 Mar 2021 15:53:08 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03wdc.us.ibm.com with ESMTP id 37d9d9xyk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 23 Mar 2021 15:53:08 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12NFr7mo33751480
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 15:53:07 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEAA9C6059;
 Tue, 23 Mar 2021 15:53:07 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04043C6055;
 Tue, 23 Mar 2021 15:53:06 +0000 (GMT)
Received: from localhost (unknown [9.163.8.110])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 23 Mar 2021 15:53:06 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v4 44/46] KVM: PPC: Book3S HV P9: implement hash guest
 support
In-Reply-To: <20210323010305.1045293-45-npiggin@gmail.com>
References: <20210323010305.1045293-1-npiggin@gmail.com>
 <20210323010305.1045293-45-npiggin@gmail.com>
Date: Tue, 23 Mar 2021 12:53:04 -0300
Message-ID: <87tup1kgtb.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-23_07:2021-03-22,
 2021-03-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 mlxscore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 lowpriorityscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103230114
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
Cc: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Guest entry/exit has to restore and save/clear the SLB, plus several
> other bits to accommodate hash guests in the P9 path.
>
> Radix host, hash guest support is removed from the P7/8 path.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---

<snip>

> diff --git a/arch/powerpc/kvm/book3s_hv_interrupt.c b/arch/powerpc/kvm/book3s_hv_interrupt.c
> index cd84d2c37632..03fbfef708a8 100644
> --- a/arch/powerpc/kvm/book3s_hv_interrupt.c
> +++ b/arch/powerpc/kvm/book3s_hv_interrupt.c
> @@ -55,6 +55,50 @@ static void __accumulate_time(struct kvm_vcpu *vcpu, struct kvmhv_tb_accumulator
>  #define accumulate_time(vcpu, next) do {} while (0)
>  #endif
>
> +static inline void mfslb(unsigned int idx, u64 *slbee, u64 *slbev)
> +{
> +	asm volatile("slbmfev  %0,%1" : "=r" (*slbev) : "r" (idx));
> +	asm volatile("slbmfee  %0,%1" : "=r" (*slbee) : "r" (idx));
> +}
> +
> +static inline void __mtslb(u64 slbee, u64 slbev)
> +{
> +	asm volatile("slbmte %0,%1" :: "r" (slbev), "r" (slbee));
> +}
> +
> +static inline void mtslb(unsigned int idx, u64 slbee, u64 slbev)
> +{
> +	BUG_ON((slbee & 0xfff) != idx);
> +
> +	__mtslb(slbee, slbev);
> +}
> +
> +static inline void slb_invalidate(unsigned int ih)
> +{
> +	asm volatile("slbia %0" :: "i"(ih));
> +}

Fyi, in my environment the assembler complains:

{standard input}: Assembler messages:                                    
{standard input}:1293: Error: junk at end of line: `6'                             
{standard input}:2138: Error: junk at end of line: `6'                    
make[3]: *** [../scripts/Makefile.build:271:
arch/powerpc/kvm/book3s_hv_interrupt.o] Error 1

This works:

-       asm volatile("slbia %0" :: "i"(ih));
+       asm volatile(PPC_SLBIA(%0) :: "i"(ih));

But I don't know what is going on.

