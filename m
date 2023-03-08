Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE496AFD1E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 03:56:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PWcR95y8kz3cLs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Mar 2023 13:56:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c+HnNSBv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c+HnNSBv;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PWcQ96t7Fz3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Mar 2023 13:56:01 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3280lb9A018974;
	Wed, 8 Mar 2023 02:55:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=qGQysgGxF6Ye5so9ZFctLvTuB9C4J7W9pIqFF+CKTps=;
 b=c+HnNSBv0LerkOzDNOabRRxbtvBjDjlzOl/RhY2UWpXuiAZgrKWYrAekG6u8q4cP3UNo
 bF3A+4GyofyTFuSrvPGcjBaswArmvzyRgq3OHg2ZPt96DQ4LRDjFj4ZRflBNzlOOZ6Nx
 /h/Qg2lBA5M5t9P+BR8fs6oin8IBW4SoyLyL42OFjT1Apa+m15ZJ9ZD01mZjfbeVMNSA
 0Thd3cilKm/wieG1nOtPY1BYzfwqaOlbYfLyl8PvdGdQGy08L2C+kAHNLY59WYNO5l5w
 2OgkTEHF/sGIXla0jSl6izZcj36iSAS11xFhUYRsKmNa5+s/8lcWlOAyKBZqlpU4y3/w lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6g4nt8u2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 02:55:55 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3282sfgx031042;
	Wed, 8 Mar 2023 02:55:55 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6g4nt8tu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 02:55:55 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3280eZda009306;
	Wed, 8 Mar 2023 02:55:54 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma02wdc.us.ibm.com (PPS) with ESMTPS id 3p6g1ggj0y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Mar 2023 02:55:54 +0000
Received: from smtpav05.dal12v.mail.ibm.com (smtpav05.dal12v.mail.ibm.com [10.241.53.104])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3282tqBL59900212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Mar 2023 02:55:52 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 79B085805D;
	Wed,  8 Mar 2023 02:55:52 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 612AD5806A;
	Wed,  8 Mar 2023 02:55:52 +0000 (GMT)
Received: from localhost (unknown [9.211.158.208])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  8 Mar 2023 02:55:52 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/vas: Ignore VAS update for DLPAR if
 copy/paste is not enabled
In-Reply-To: <d1ff8e3f1a0c107d1a047fd66d287c63411b84e1.camel@linux.ibm.com>
References: <d1ff8e3f1a0c107d1a047fd66d287c63411b84e1.camel@linux.ibm.com>
Date: Tue, 07 Mar 2023 20:55:52 -0600
Message-ID: <87sfeg7xzb.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: atnARJ7nr5VBP88txZJiaKRW_HEXHB5_
X-Proofpoint-ORIG-GUID: k4mEYq1fRjCGUhe0aD2n78ou6zZqS3AV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_18,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 lowpriorityscore=0 mlxlogscore=999 clxscore=1011
 malwarescore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303080020
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> The hypervisor supports user-mode NX from Power10. pseries_vas_dlpar_cpu()
> is called from lparcfg_write() to update VAS windows for DLPAR CPU event
> and the kernel gets -ENOTSUPP for HCALLs if the user-mode NX is not
> supported.

The commit text would be improved by more explanation about the higher
level failure mode here. Does lparcfg_write() fail when it shouldn't? If
so, does that cause a processor DLPAR operation to spuriously fail?

pseries_vas_dlpar_cpu() is also called from pseries_vas_notifier() in
dedicated processor mode. Does this problem affect that scenario also?

> This patch ignores updating VAS capabilities and returns success if the
> copy/paste feature is not enabled.
>
> Fixes: 2147783d6bf0 ("powerpc/pseries: Use lparcfg to reconfig VAS windows for DLPAR CPU")
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/vas.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
> index 559112312810..dc003849d2c5 100644
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
> +		copypaste_feat = 0;

copypaste_feat is a bool, so use false, not 0. But otherwise I think
this looks correct and consistent with the rest of the code in vas.c.
