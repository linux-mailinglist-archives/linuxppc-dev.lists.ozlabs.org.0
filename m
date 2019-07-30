Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E4AD7B509
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 23:33:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45yqYl5JxrzDqYq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jul 2019 07:33:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=bauerman@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45yqWv3VQ4zDqXT
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 07:32:10 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6ULRLuc079039; Tue, 30 Jul 2019 17:32:01 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2u2uq3cuyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2019 17:32:00 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x6ULPOP7007879;
 Tue, 30 Jul 2019 21:32:00 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 2u0e85tvk3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Jul 2019 21:32:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6ULVxpb58917284
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Jul 2019 21:31:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 571057805F;
 Tue, 30 Jul 2019 21:31:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EFE5B7805C;
 Tue, 30 Jul 2019 21:31:57 +0000 (GMT)
Received: from morokweng.localdomain (unknown [9.85.162.191])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue, 30 Jul 2019 21:31:57 +0000 (GMT)
References: <20190728125438.1550-1-cmr@informatik.wtf>
 <20190728125438.1550-2-cmr@informatik.wtf>
User-agent: mu4e 1.2.0; emacs 26.2
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] powerpc/spinlocks: Refactor SHARED_PROCESSOR
In-reply-to: <20190728125438.1550-2-cmr@informatik.wtf>
Date: Tue, 30 Jul 2019 18:31:55 -0300
Message-ID: <87ef27us38.fsf@morokweng.localdomain>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-30_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=742 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907300213
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
Cc: linuxppc-dev@ozlabs.org, "Christopher M. Riedl" <cmr@informatik.wtf>,
 ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Christopher M. Riedl <cmr@informatik.wtf> writes:

> Determining if a processor is in shared processor mode is not a constant
> so don't hide it behind a #define.
>
> Signed-off-by: Christopher M. Riedl <cmr@informatik.wtf>
> ---
>  arch/powerpc/include/asm/spinlock.h | 21 +++++++++++++++------
>  1 file changed, 15 insertions(+), 6 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
> index a47f827bc5f1..8631b0b4e109 100644
> --- a/arch/powerpc/include/asm/spinlock.h
> +++ b/arch/powerpc/include/asm/spinlock.h
> @@ -101,15 +101,24 @@ static inline int arch_spin_trylock(arch_spinlock_t *lock)
>
>  #if defined(CONFIG_PPC_SPLPAR)
>  /* We only yield to the hypervisor if we are in shared processor mode */
> -#define SHARED_PROCESSOR (lppaca_shared_proc(local_paca->lppaca_ptr))
>  extern void __spin_yield(arch_spinlock_t *lock);
>  extern void __rw_yield(arch_rwlock_t *lock);
>  #else /* SPLPAR */
>  #define __spin_yield(x)	barrier()
>  #define __rw_yield(x)	barrier()
> -#define SHARED_PROCESSOR	0
>  #endif
>
> +static inline bool is_shared_processor(void)
> +{
> +/* Only server processors have an lppaca struct */
> +#ifdef CONFIG_PPC_BOOK3S
> +	return (IS_ENABLED(CONFIG_PPC_SPLPAR) &&
> +		lppaca_shared_proc(local_paca->lppaca_ptr));
> +#else
> +	return false;
> +#endif
> +}
> +

CONFIG_PPC_SPLPAR depends on CONFIG_PPC_PSERIES, which depends on
CONFIG_PPC_BOOK3S so the #ifdef above is unnecessary:

if CONFIG_PPC_BOOK3S is unset then CONFIG_PPC_SPLPAR will be unset as
well and the return expression should short-circuit to false.

--
Thiago Jung Bauermann
IBM Linux Technology Center
