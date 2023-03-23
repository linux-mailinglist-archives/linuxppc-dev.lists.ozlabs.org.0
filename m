Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B77E6C7104
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Mar 2023 20:23:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PjFcg6pM1z3fQy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Mar 2023 06:23:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hJs6rqxD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hJs6rqxD;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PjFbj0mYCz3cjY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Mar 2023 06:22:40 +1100 (AEDT)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32NJ332i036887;
	Thu, 23 Mar 2023 19:22:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : subject :
 in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=U6FsncAJir8FVyU7o8ozOqVFgTgqHpk/Ok+rej1KkrA=;
 b=hJs6rqxDCpqj0i6nHLQ2X0SgJs08h2F/v1Ak79ZY9+mQaAwJnliSW/pDzM/aYxJcZYwB
 sz0d16ke+//Ls91yXbYpk0lYiuYmIXnqR6jOvlm0pflam+d81taS8eIS4jTYFaEC/xBN
 gi4VgYmyhgonyYs8wmZQD0Bi0jfPWMQf/WA+vIe2QbxWS2+n/znbSu/+c3cQZm18JF+v
 wrzcyjIUSQUFnTzczhdAUdirByvpMZGzitC+fLlp+A/UDYrAkaEYKRWjnOt2dngXsglI
 SGPRMbA56MBujl0YMy15v6TSF9aLDYYqOeqr3640EgVO71r14U3vURxJQUb3NEb2qy2l xg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pggv7umf4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 19:22:33 +0000
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32NHkMAc001659;
	Thu, 23 Mar 2023 19:22:32 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pggv7umev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 19:22:32 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32NIK1an002290;
	Thu, 23 Mar 2023 19:22:32 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([9.208.130.99])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3pd4x7yh0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Mar 2023 19:22:31 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32NJMU8v33882438
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Mar 2023 19:22:30 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C125A58059;
	Thu, 23 Mar 2023 19:22:30 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1C4658057;
	Thu, 23 Mar 2023 19:22:30 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 23 Mar 2023 19:22:30 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au, npiggin@gmail.com,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/pseries/vas: Ignore VAS update for DLPAR if
 copy/paste is not enabled
In-Reply-To: <1d0e727e7dbd9a28627ef08ca9df9c86a50175e2.camel@linux.ibm.com>
References: <1d0e727e7dbd9a28627ef08ca9df9c86a50175e2.camel@linux.ibm.com>
Date: Thu, 23 Mar 2023 14:22:30 -0500
Message-ID: <877cv76znt.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xGpKjfxyLQRBLlWq4EAgz6IoB-CW7Mz5
X-Proofpoint-GUID: pBJCtGOgIGEGAJRnm8GWx9B5jVUH9AzZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-23_12,2023-03-23_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303230135
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> The hypervisor supports user-mode NX from Power10. pseries_vas_dlpar_cpu()
> is called from lparcfg_write() to update VAS windows for DLPAR event in
> shared processor mode and the kernel gets -ENOTSUPP for HCALLs if the
> user-mode NX is not supported. The current VAS implementation also
> supports only with Radix page tables. Whereas in dedicated processor
> mode, pseries_vas_notifier() is registered only if the copy/paste
> feature is enabled. So instead of displaying HCALL error messages,
> update VAS capabilities if the copy/paste feature is available.

OK, so this prevents the code from making inappropriate hcalls and
logging useless errors, looks good.

>
> This patch ignores updating VAS capabilities in pseries_vas_dlpar_cpu()
> and returns success if the copy/paste feature is not enabled.
> Then lparcfg_write() completes the processor DLPAR operations
> without any failures.
>
> Fixes: 2147783d6bf0 ("powerpc/pseries: Use lparcfg to reconfig VAS windows for DLPAR CPU")
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>


> ---
> v2: Use bool for copypaste_feat and expand commit message on handling failures
>
>  arch/powerpc/platforms/pseries/vas.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
> index 559112312810..513180467562 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -856,6 +856,13 @@ int pseries_vas_dlpar_cpu(void)
>  {
>  	int new_nr_creds, rc;
>  
> +	/*
> +	 * NX-GZIP is not enabled. Nothing to do for DLPAR event
> +	 */
> +	if (!copypaste_feat)
> +		return 0;
> +
> +
>  	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES,
>  				      vascaps[VAS_GZIP_DEF_FEAT_TYPE].feat,
>  				      (u64)virt_to_phys(&hv_cop_caps));
> @@ -1012,6 +1019,7 @@ static int __init pseries_vas_init(void)
>  	 * Linux supports user space COPY/PASTE only with Radix
>  	 */
>  	if (!radix_enabled()) {
> +		copypaste_feat = false;
>  		pr_err("API is supported only with radix page tables\n");
>  		return -ENOTSUPP;
>  	}
> -- 
> 2.26.3
