Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 835AF64727C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Dec 2022 16:08:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NScwy2QX0z3bh1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Dec 2022 02:08:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nET8kgff;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nET8kgff;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NScw21bM2z3bNs
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Dec 2022 02:07:45 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2B8Esbq6029336;
	Thu, 8 Dec 2022 15:07:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=iKI5DG8KiPW43TzPyOQ/Yk2xWwyKHXY7cl48MH1xlno=;
 b=nET8kgffjwIhINm791RznC7/npd5K68evQeWhCqDaySCbFhzGt3O+tMO+U3LtZsqI7IC
 M9z5lXgnTQ4WVuPfwGVuaOu4Vg58UnBckzgE5l9u87SXhikL4oqqtRT2uva2tl2Ouu3+
 l19+dMFM4itQ4aZJoA9E7kFlsinyC2S+qpP64zkHcrBuWISrN+1oGmfKqJTHujmvuQrm
 nTn9iAWMYpP7tJZ17l1TMWomWVff4q+YF4gEPjtdJ9ECAlLV67PuQ5sg/piX6FP5NnS8
 3oKVgNQMHDeMntoWhuBN2owE951AFljGfSc1Kpzpa10StXw69jx6R83/cMAR7qg46OzT lQ== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3mbj3t0cpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Dec 2022 15:07:37 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.16.1.2) with ESMTP id 2B8D9xxb003061;
	Thu, 8 Dec 2022 15:02:35 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3m9m6y3cmj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 Dec 2022 15:02:35 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2B8F2VXH39649608
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 8 Dec 2022 15:02:32 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D1EB220040;
	Thu,  8 Dec 2022 15:02:31 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EF3FE20043;
	Thu,  8 Dec 2022 15:02:30 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.113.82])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  8 Dec 2022 15:02:30 +0000 (GMT)
Date: Thu, 8 Dec 2022 20:32:22 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Ganesh Goudar <ganeshgr@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mce: log the error for all unrecoverable errors
Message-ID: <20221208150222.25c5kjlb42gxlkvq@in.ibm.com>
References: <20221114075607.30631-1-ganeshgr@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221114075607.30631-1-ganeshgr@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: zBTPK-t4YsmTHu2HGsQ-5YSYIwUKPS_a
X-Proofpoint-ORIG-GUID: zBTPK-t4YsmTHu2HGsQ-5YSYIwUKPS_a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-08_07,2022-12-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 phishscore=0 clxscore=1011
 mlxlogscore=691 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2212080120
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-11-14 13:26:07 Mon, Ganesh Goudar wrote:
> machine_check_log_err() is not getting called for all
> unrecoverable errors, And we are missing to log the error.
> 
> Raise irq work in save_mce_event() for unrecoverable errors,
> So that we log the error from MCE event handling block in
> timer handler.

Thanks for fixing this.
Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

> 
> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
> ---
>  arch/powerpc/kernel/mce.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index 6c5d30fba766..a1cb2172eb7b 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -131,6 +131,13 @@ void save_mce_event(struct pt_regs *regs, long handled,
>  	if (mce->error_type == MCE_ERROR_TYPE_UE)
>  		mce->u.ue_error.ignore_event = mce_err->ignore_event;
>  
> +	/*
> +	 * Raise irq work, So that we don't miss to log the error for
> +	 * unrecoverable errors.
> +	 */
> +	if (mce->disposition == MCE_DISPOSITION_NOT_RECOVERED)
> +		mce_irq_work_queue();
> +
>  	if (!addr)
>  		return;
>  
> @@ -235,7 +242,6 @@ static void machine_check_ue_event(struct machine_check_event *evt)
>  	       evt, sizeof(*evt));
>  
>  	/* Queue work to process this event later. */
> -	mce_irq_work_queue();
>  }

With your patch now we can see RTAS event logged for other
unrecoverable errors as well.

[  573.006337] Disabling lock debugging due to kernel taint
[  573.006357] MCE: CPU27: machine check (Severe)  Real address Load/Store (foreign/control memory) [Not recovered]
[  573.006362] MCE: CPU27: PID: 10580 Comm: inject-ra-err NIP: [0000000010000df4]
[  573.006366] MCE: CPU27: Initiator CPU
[  573.006369] MCE: CPU27: Unknown
[  573.006426] RTAS: event: 1, Type: Platform Error (224), Severity: 3

Tested-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>

Thanks,
-Mahesh.
