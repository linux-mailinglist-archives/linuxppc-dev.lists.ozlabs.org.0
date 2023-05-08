Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 575FA6FBBDE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 02:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFdsK2Bmyz3fJQ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 10:12:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dDFShBRE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dDFShBRE;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFQbZ6M0jz3c8f
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 01:45:14 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 348FcZ8K028665;
	Mon, 8 May 2023 15:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=9ZWvMKkAhoPIsLUusebE3XgGXiyxBIOTyrQIHON9VcA=;
 b=dDFShBREKPq3d/BbJ7eBJn5JXCjSRUNz4R6ypuoK2rQDor/5CgeF0wub+6V9BGsyUMNN
 1h5LV/s93f6BjBaEVKcw+yV6ZK6xLyROpE1/lVn7T4X9LhpxlCj8DJdxi5xeqIS/6q7j
 ulrTvYKe4bShvJWdhIAKJ2HMrHKUb332LH9Fei0yyHgMz+IPSseWYXEgMe6JrTDKI7TS
 IBubpdXyzTzft/jjAT7UeQSgbSrKk6Dd7JDQwGzghIhxNIJ3rln+BkwrO42quml4ZDME
 32a+5iXqiMjRJJJPPYLf3r94xRDnnbGWVuHmlz/GpjC5Rx4WyA7CyZ70kKO8CIdcz+X9 Qg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qf3qmrd74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 15:45:08 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 348FcgV0029086;
	Mon, 8 May 2023 15:45:08 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qf3qmrd63-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 15:45:08 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 347NpdjA026559;
	Mon, 8 May 2023 15:45:06 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3qdeh6gyyu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 May 2023 15:45:05 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 348Fj3MK41288294
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 May 2023 15:45:03 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 63DFE2004B;
	Mon,  8 May 2023 15:45:03 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4B7C20043;
	Mon,  8 May 2023 15:45:01 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.43.115.95])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  8 May 2023 15:45:01 +0000 (GMT)
Date: Mon, 8 May 2023 21:14:43 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Rohan McLure <rmclure@linux.ibm.com>
Subject: Re: [PATCH 4/12] asm-generic/mmiowb: Mark accesses to fix KCSAN
 warnings
Message-ID: <ZFkY6z2uyie6wVrp@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com>
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-5-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508020120.218494-5-rmclure@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7byqPY_tylbywoPSDUOpakZaY-fskqtX
X-Proofpoint-ORIG-GUID: O3_sJsMWTdcaQgxBWdnTWbpJZbAPae86
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-08_11,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 clxscore=1011
 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305080103
X-Mailman-Approved-At: Tue, 09 May 2023 10:11:53 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, arnd@arndb.de, Gautam Menghani <gautammenghani201@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 08, 2023 at 12:01:12PM +1000, Rohan McLure wrote:
> Prior to this patch, data races are detectable by KCSAN of the following
> forms:
> 
> [1] Asynchronous calls to mmiowb_set_pending() from an interrupt context
>     or otherwise outside of a critical section
> [2] Interrupted critical sections, where the interrupt will itself
>     acquire a lock
> 
> In case [1], calling context does not need an mmiowb() call to be
> issued, otherwise it would do so itself. Such calls to
> mmiowb_set_pending() are either idempotent or no-ops.
> 
> In case [2], irrespective of when the interrupt occurs, the interrupt
> will acquire and release its locks prior to its return, nesting_count
> will continue balanced. In the worst case, the interrupted critical
> section during a mmiowb_spin_unlock() call observes an mmiowb to be
> pending and afterward is interrupted, leading to an extraneous call to
> mmiowb(). This data race is clearly innocuous.
> 
> Mark all potentially asynchronous memory accesses with READ_ONCE or
> WRITE_ONCE, including increments and decrements to nesting_count. This
> has the effect of removing KCSAN warnings at consumer's callsites.
> 
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Reported-by: Gautam Menghani <gautammenghani201@gmail.com>
> Acked-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  include/asm-generic/mmiowb.h | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
> 
> diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
> index 5698fca3bf56..0b8b794150db 100644
> --- a/include/asm-generic/mmiowb.h
> +++ b/include/asm-generic/mmiowb.h
> @@ -35,27 +35,32 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
>  static inline void mmiowb_set_pending(void)
>  {
>  	struct mmiowb_state *ms = __mmiowb_state();
> +	u16 nesting_count = READ_ONCE(ms->nesting_count);
>  
> -	if (likely(ms->nesting_count))
> -		ms->mmiowb_pending = ms->nesting_count;
> +	if (likely(nesting_count))
> +		WRITE_ONCE(ms->mmiowb_pending, nesting_count);
>  }
>  
>  static inline void mmiowb_spin_lock(void)
>  {
>  	struct mmiowb_state *ms = __mmiowb_state();
> -	ms->nesting_count++;
> +
> +	/* Increment need not be atomic. Nestedness is balanced over interrupts. */
> +	WRITE_ONCE(ms->nesting_count, READ_ONCE(ms->nesting_count) + 1);
>  }
>  
>  static inline void mmiowb_spin_unlock(void)
>  {
>  	struct mmiowb_state *ms = __mmiowb_state();
> +	u16 pending = READ_ONCE(ms->mmiowb_pending);
>  
> -	if (unlikely(ms->mmiowb_pending)) {
> -		ms->mmiowb_pending = 0;
> +	WRITE_ONCE(ms->mmiowb_pending, 0);
> +	if (unlikely(pending)) {
>  		mmiowb();
>  	}
>  
> -	ms->nesting_count--;
> +	/* Decrement need not be atomic. Nestedness is balanced over interrupts. */
> +	WRITE_ONCE(ms->nesting_count, READ_ONCE(ms->nesting_count) - 1);
>  }
>  #else
>  #define mmiowb_set_pending()		do { } while (0)
> 
> -- 
> 2.37.2
> 


Successfully tested for changes in include/asm-generic/mmiowb.h 

Tested-by: Gautam Menghani <gautam@linux.ibm.com>
