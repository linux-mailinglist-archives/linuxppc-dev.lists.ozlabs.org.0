Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C8F6C0B85
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 08:41:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pg6BB6B9Mz3cC1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Mar 2023 18:41:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RczNS1A/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RczNS1A/;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pg69C3q1Cz3bVP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Mar 2023 18:40:47 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32K4bx2O025800;
	Mon, 20 Mar 2023 07:40:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=hBSsh7S2/ZZ9WkbsFgtmHtn1mTk5e5iwNe0A5j2aUvQ=;
 b=RczNS1A/+EMeiCTJQnkPXCkk4hHdzszyMpC5awKB9UVeAkzv5D+lmTDpdExqFdXJF7et
 bJvWnGZS4PHi/1qo+aRkRbpb7f2BkdN7QXSfL/KcWsvIY6A8oTi7yGHEPhJBc8z5TKpF
 jTJTmkhehVNKLEBjicxCzdY3Unh7LN/zATG0p9KBwWw++E2sti8MrITqYPBlES5QzPsF
 eGV/W06IZE7yQU0ANfVb5NwB8vShOg9Gfpvezgw2MRHtAzWe5zB2Jp3t9ej3dlmDA2Zu
 K3OaJXQUdfb/AtA0Qw7eVnwy1gMCSjmDsBCByrw/+K+rLlM9Xakl6pjLkSat6rU1Rwpr rQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pdq56rvqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 07:40:40 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32K6wcN2015769;
	Mon, 20 Mar 2023 07:40:39 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com [169.53.41.122])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3pdq56rvq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 07:40:39 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
	by ppma04dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 32K6eVvt023447;
	Mon, 20 Mar 2023 07:40:39 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([9.208.130.98])
	by ppma04dal.us.ibm.com (PPS) with ESMTPS id 3pd4x6xb2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 07:40:39 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 32K7eaDY3539682
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 20 Mar 2023 07:40:36 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5408758056;
	Mon, 20 Mar 2023 07:40:36 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDCE658045;
	Mon, 20 Mar 2023 07:40:34 +0000 (GMT)
Received: from sig-9-77-158-102.ibm.com (unknown [9.77.158.102])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 20 Mar 2023 07:40:34 +0000 (GMT)
Message-ID: <182cd7074bc6927dfdc2f9e9dd996e3a592137d9.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/vas: Ignore VAS update for DLPAR if
 copy/paste is not enabled
From: Haren Myneni <haren@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Date: Mon, 20 Mar 2023 00:40:25 -0700
In-Reply-To: <87sfeg7xzb.fsf@linux.ibm.com>
References: <d1ff8e3f1a0c107d1a047fd66d287c63411b84e1.camel@linux.ibm.com>
	 <87sfeg7xzb.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 9lRYB21LiR6dyV2OIZul-6wgcJWE-Ohq
X-Proofpoint-GUID: lOVxh4TVablaU9fuRjBmREoCsUmz515B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_04,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 clxscore=1015 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303200065
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

On Tue, 2023-03-07 at 20:55 -0600, Nathan Lynch wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
> > The hypervisor supports user-mode NX from Power10.
> > pseries_vas_dlpar_cpu()
> > is called from lparcfg_write() to update VAS windows for DLPAR CPU
> > event
> > and the kernel gets -ENOTSUPP for HCALLs if the user-mode NX is not
> > supported.
> 
> The commit text would be improved by more explanation about the
> higher
> level failure mode here. Does lparcfg_write() fail when it shouldn't?
> If
> so, does that cause a processor DLPAR operation to spuriously fail?

Thanks for your suggestions, I will add more explanation in the
description.

Even if copy/paste is not enabled, pseries_vas_dlpar_cpu() just returns
0 which allows lparcfg_write() returns success - will not affect DLPAR
operation.

  if (pseries_vas_dlpar_cpu() != 0)
       retval = H_HARDWARE;
> 
> pseries_vas_dlpar_cpu() is also called from pseries_vas_notifier() in
> dedicated processor mode. Does this problem affect that scenario
> also?

It should not affect for dedicated processor
mode. pseries_vas_notifier() is registered if copy/paste is enabled. 

if (!rc && copypaste_feat) {
                if (firmware_has_feature(FW_FEATURE_LPAR))
                        of_reconfig_notifier_register(&pseries_vas_nb);

> 
> > This patch ignores updating VAS capabilities and returns success if
> > the
> > copy/paste feature is not enabled.
> > 
> > Fixes: 2147783d6bf0 ("powerpc/pseries: Use lparcfg to reconfig VAS
> > windows for DLPAR CPU")
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/vas.c | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/vas.c
> > b/arch/powerpc/platforms/pseries/vas.c
> > index 559112312810..dc003849d2c5 100644
> > --- a/arch/powerpc/platforms/pseries/vas.c
> > +++ b/arch/powerpc/platforms/pseries/vas.c
> > @@ -856,6 +856,13 @@ int pseries_vas_dlpar_cpu(void)
> >  {
> >  	int new_nr_creds, rc;
> >  
> > +	/*
> > +	 * NX-GZIP is not enabled. Nothing to do for DLPAR event
> > +	 */
> > +	if (!copypaste_feat)
> > +		return 0;
> > +
> > +
> >  	rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES,
> >  				      vascaps[VAS_GZIP_DEF_FEAT_TYPE].f
> > eat,
> >  				      (u64)virt_to_phys(&hv_cop_caps));
> > @@ -1012,6 +1019,7 @@ static int __init pseries_vas_init(void)
> >  	 * Linux supports user space COPY/PASTE only with Radix
> >  	 */
> >  	if (!radix_enabled()) {
> > +		copypaste_feat = 0;
> 
> copypaste_feat is a bool, so use false, not 0. But otherwise I think
> this looks correct and consistent with the rest of the code in vas.c.

Correct my mistake.

Thanks
Haren

