Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE6DF7FE65E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 02:44:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JgU1lFUr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgfBp3B1nz3cbQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 12:44:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JgU1lFUr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgf9v5JFqz2yRS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 12:44:02 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU1Vurl015661;
	Thu, 30 Nov 2023 01:43:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=EIoB6T7U0CxILYNfTY6KsGSNYYnWl+TpwwFmYYC/JUY=;
 b=JgU1lFUr3ZlBxKcms7wfe9PuAJnMAawmzu7bNdIqqnD5bilxuDJgLLlrHFmzgFA89713
 WS/wLtUmPP+aASe08qLUyDBaPc8Y9+RBu0bJiPDkg8KDoK+2JjDobDCFD7/ZsaN6SLkl
 I2tQBvlIM7PwxcM46ZnB+dEqTQtZfW7PintbT/jvOiREjdcjRdLrDaSiBKaKCEzcFqSZ
 sbpC6C49vUqX1o7WxP5xreANbNFsk1g0I+hXIezkBEL+ecUtfHlHxqxQZdEqwI3tb5MA
 z6kYAk+R3Z3UgtVSdJW/R1fJK102nARLkSF0Qtwss2Z94GC/P2RrAokb2suwTyHeKizf LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3upgtf0bjq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 01:43:53 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AU1W2Bp015831;
	Thu, 30 Nov 2023 01:43:52 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3upgtf0bhq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 01:43:52 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU0XtWj009659;
	Thu, 30 Nov 2023 01:43:51 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukumyudnc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 01:43:51 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AU1hlCS36372960
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Nov 2023 01:43:48 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A8AAF58050;
	Thu, 30 Nov 2023 01:43:47 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 858CE58045;
	Thu, 30 Nov 2023 01:43:47 +0000 (GMT)
Received: from localhost (unknown [9.61.78.172])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Nov 2023 01:43:47 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/pseries/vas: Use usleep_range() to support
 HCALL delay
In-Reply-To: <20231129075424.240653-1-haren@linux.ibm.com>
References: <20231129075424.240653-1-haren@linux.ibm.com>
Date: Wed, 29 Nov 2023 19:43:47 -0600
Message-ID: <87a5qw10do.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5ztXZLORMH4sbwdnI49IkHKU8Ne2L2GD
X-Proofpoint-GUID: 5-nJHINebw-D-XXWQl-VwJYgMeqf5gZR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_21,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311300011
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
Cc: Haren Myneni <haren@linux.ibm.com>, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> VAS allocate, modify and deallocate HCALLs returns
> H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC for busy
> delay and expects OS to reissue HCALL after that delay. But using
> msleep() will often sleep at least 20 msecs even though the
> hypervisor expects to reissue these HCALLs after 1 or 10msecs.

I would word this as "the architecture suggests that the OS reissue
these [...]" instead of framing it as something the platform "expects".

> It might cause these HCALLs takes longer when multiple threads
> issue open or close VAS windows simultaneously.

This is imprecise. Over-sleeping by the OS doesn't cause individual
hcalls to take longer. It is more accurate to say that the higher-level
operation (allocate, modify, free) may take longer than necessary in
cases where the OS must retry the hcalls involved.

> So instead of msleep(), use usleep_range() to ensure sleep with
> the expected value before issuing HCALL again.
>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Suggested-by: Nathan Lynch <nathanl@linux.ibm.com>
>
> ---
> v1 -> v2:
> - Use usleep_range instead of using RTAS sleep routine as
>   suggested by Nathan
> ---
>  arch/powerpc/platforms/pseries/vas.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
> index 71d52a670d95..bade4402741f 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -36,9 +36,31 @@ static bool migration_in_progress;
>  
>  static long hcall_return_busy_check(long rc)
>  {
> +	unsigned int ms;

This should move down into the H_IS_LONG_BUSY() block if it's not used
outside of it.

> +
>  	/* Check if we are stalled for some time */
>  	if (H_IS_LONG_BUSY(rc)) {
> -		msleep(get_longbusy_msecs(rc));
> +		ms = get_longbusy_msecs(rc);
> +		/*
> +		 * Allocate, Modify and Deallocate HCALLs returns
> +		 * H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC
> +		 * for the long delay. So the delay should always be 1
> +		 * or 10msecs, but sleeps 1msec in case if the long
> +		 * delay is > H_LONG_BUSY_ORDER_10_MSEC.
> +		 */
> +		if (ms > 10)
> +			ms = 1;

It's strange to coerce ms to 1 when it's greater than 10. Just clamp it
to 10, e.g.

                ms = clamp(get_longbusy_msecs(rc), 1, 10);

> +
> +		/*
> +		 * msleep() will often sleep at least 20 msecs even
> +		 * though the hypervisor expects to reissue these
> +		 * HCALLs after 1 or 10msecs. So use usleep_range()
> +		 * to sleep with the expected value.
> +		 *
> +		 * See Documentation/timers/timers-howto.rst on using
> +		 * the value range in usleep_range().
> +		 */
> +		usleep_range(ms * 100, ms * 1000);

If there's going to be commentary here I think it should just explain
why potentially sleeping for less than the suggested time is OK. There
is wording you can crib in rtas_busy_delay().


>  		rc = H_BUSY;
>  	} else if (rc == H_BUSY) {
>  		cond_resched();
> -- 
> 2.26.3
