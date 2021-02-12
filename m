Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D59631A622
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 21:38:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DclhL3t27zDwwp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Feb 2021 07:38:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=eHwNjy6j; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dclfp22j7zDsk7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Feb 2021 07:37:21 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11CKb2Nl191938; Fri, 12 Feb 2021 15:37:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=dvPEWDW+9VOy4Q60WTiBHflSgOiPtdmPLEgqzLrScy8=;
 b=eHwNjy6jrpcc3HwIs69YdJn3MHWwUc/Y00Uh75BZ0qIHvtR029Nyu9eM1EvsLYA13+Ra
 /GT5I6rH973vpvu07le5VMo2kns/aLxxiLsNygQ1S+6WxQi6hsOVd8xZXY7iHRZpHADi
 zZ1jAuItqCuBzJWjMr1duchnzkr7iKS4QQrc3zszTgmpbJjY3BgvR8KdXJ2EH7uLFb/o
 VAzVLRbPAcS+C6umPB5YsHncF9qosPl56SxkKHtPlI0xCiAIjUxwY6wBZoXxLYfb/R3g
 zZbMmCQ4n/3ZUoCGDxPnvn3R9H94lJ4Q4JaUCsK3M7Wy3Udz9TY3CRsRMoiNqQvhHG12 uA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36p0gxgfdu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Feb 2021 15:37:18 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11CKbGAL192463;
 Fri, 12 Feb 2021 15:37:17 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36p0gxget1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Feb 2021 15:37:17 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 11CKRUbQ020370;
 Fri, 12 Feb 2021 20:33:37 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma05wdc.us.ibm.com with ESMTP id 36hjr9ytus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 12 Feb 2021 20:33:37 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 11CKXauB43188700
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Feb 2021 20:33:36 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99F75AE060;
 Fri, 12 Feb 2021 20:33:36 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B0431AE05C;
 Fri, 12 Feb 2021 20:33:35 +0000 (GMT)
Received: from localhost (unknown [9.163.11.170])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 12 Feb 2021 20:33:35 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH 3/9] KVM: PPC: Book3S 64: add hcall interrupt handler
In-Reply-To: <20210202030313.3509446-4-npiggin@gmail.com>
References: <20210202030313.3509446-1-npiggin@gmail.com>
 <20210202030313.3509446-4-npiggin@gmail.com>
Date: Fri, 12 Feb 2021 17:33:33 -0300
Message-ID: <87r1llxbz6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-12_09:2021-02-12,
 2021-02-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 mlxlogscore=910 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102120152
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

> Add a separate hcall entry point. This can be used to deal with the
> different calling convention.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kernel/exceptions-64s.S | 4 ++--
>  arch/powerpc/kvm/book3s_64_entry.S   | 4 ++++
>  2 files changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index e6f7fc7c61a1..c25395b5921a 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -2028,13 +2028,13 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>  	 * Requires __LOAD_FAR_HANDLER beause kvmppc_interrupt lives
>  	 * outside the head section.
>  	 */
> -	__LOAD_FAR_HANDLER(r10, kvmppc_interrupt)
> +	__LOAD_FAR_HANDLER(r10, kvmppc_hcall)
>  	mtctr   r10
>  	ld	r10,PACA_EXGEN+EX_R10(r13)
>  	bctr
>  #else
>  	ld	r10,PACA_EXGEN+EX_R10(r13)
> -	b       kvmppc_interrupt
> +	b       kvmppc_hcall
>  #endif
>  #endif
>
> diff --git a/arch/powerpc/kvm/book3s_64_entry.S b/arch/powerpc/kvm/book3s_64_entry.S
> index 8e7216f3c3ee..3b894b90862f 100644
> --- a/arch/powerpc/kvm/book3s_64_entry.S
> +++ b/arch/powerpc/kvm/book3s_64_entry.S
> @@ -9,6 +9,10 @@
>  /*
>   * We come here from the first-level interrupt handlers.
>   */
> +.global	kvmppc_hcall
> +.balign IFETCH_ALIGN_BYTES
> +kvmppc_hcall:
> +
>  .global	kvmppc_interrupt
>  .balign IFETCH_ALIGN_BYTES
>  kvmppc_interrupt:
