Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD261729C03
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 15:52:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qd2Zp3l7Mz3f7q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Jun 2023 23:52:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sv/dMLeY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Sv/dMLeY;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qd2Yt2kzvz3cgV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Jun 2023 23:51:45 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 359Dk5Bi032170;
	Fri, 9 Jun 2023 13:51:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=Hk5gwr3dbM/bpL7tKeon2xDKb2QgqF1LR1yXSigjt0w=;
 b=Sv/dMLeYrn3vY29Ye7sHg1ZgbCgTQ+JWXzPWs5IXxadHwzFozN9axfCdMuKT2MCesYji
 mD/lEOTWFr6d1vQyvSavIIoFl8uYOHRBlrzT6+4BvTqdrMmTVVRzeJC2Kgf0v4x4DwuP
 Qq9ixtuIrlSDojpUfIDJIf7RlXna+OSFu/de905qbw9HHn+69Y1I1imGh83B1zxjB7o7
 C8SQ6RoRGxYe0qvPjSLJQccpfduuLJajF5QodMvVW03iUMZn4NhnA0L9sDA4CsF5KvOf
 Dn/9boJGQ+IdpuRPnYKpQG0YrFnGy8a7VQEDekznfsVfdxNHc7pXQt0Mm7q6oASqQvq8 8g== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r458fg4sb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 13:51:40 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 359BK06R002012;
	Fri, 9 Jun 2023 13:51:38 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma01fra.de.ibm.com (PPS) with ESMTPS id 3r2a77hdj1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Jun 2023 13:51:37 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 359DpY3N20382408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 9 Jun 2023 13:51:34 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7F20020049;
	Fri,  9 Jun 2023 13:51:34 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75ED520040;
	Fri,  9 Jun 2023 13:51:33 +0000 (GMT)
Received: from in.ibm.com (unknown [9.171.39.141])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri,  9 Jun 2023 13:51:33 +0000 (GMT)
Date: Fri, 9 Jun 2023 19:21:31 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Hari Bathini <hbathini@linux.ibm.com>
Subject: Re: [PATCH v2] powerpc/fadump: invoke ibm,os-term with
 rtas_call_unlocked()
Message-ID: <pfkucghirvgpzk2hvch72ojl5rqkadrwvltjdpkim4nxz7hk6s@22vzuqhfuptv>
References: <20230609071404.425529-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609071404.425529-1-hbathini@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: sMoYFR8oXk7gQfx-uEjSP9X3Ww-mnv9Q
X-Proofpoint-GUID: sMoYFR8oXk7gQfx-uEjSP9X3Ww-mnv9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-09_09,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 clxscore=1015 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306090115
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
Reply-To: mahesh@linux.ibm.com
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2023-06-09 12:44:04 Fri, Hari Bathini wrote:
> Invoke ibm,os-term call with rtas_call_unlocked(), without using the
> RTAS spinlock, to avoid deadlock in the unlikely event of a machine
> crash while making an RTAS call.
> 
> Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
> ---
>  arch/powerpc/kernel/rtas.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
> index c087eeee320f..a8192e5b1a5f 100644
> --- a/arch/powerpc/kernel/rtas.c
> +++ b/arch/powerpc/kernel/rtas.c
> @@ -1587,6 +1587,7 @@ static bool ibm_extended_os_term;
>  void rtas_os_term(char *str)
>  {
>  	s32 token = rtas_function_token(RTAS_FN_IBM_OS_TERM);
> +	static struct rtas_args args;
>  	int status;
>  
>  	/*
> @@ -1607,7 +1608,8 @@ void rtas_os_term(char *str)
>  	 * schedules.
>  	 */
>  	do {
> -		status = rtas_call(token, 1, 1, NULL, __pa(rtas_os_term_buf));
> +		rtas_call_unlocked(&args, token, 1, 1, NULL, __pa(rtas_os_term_buf));
> +		status = be32_to_cpu(args.rets[0]);

Looks good to me.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

>  	} while (rtas_busy_delay_time(status));

Thanks,
-Mahesh.
