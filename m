Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3D364B7C2C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 02:08:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jz0FP0BVlz3bcl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 12:08:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dtiyqAQO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dtiyqAQO; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jz0DZ4J8Hz2yPq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 12:07:25 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21G175Gw014633; 
 Wed, 16 Feb 2022 01:07:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=aVCXk8nYKSCJrSf86crNs6/q+2SbKIeQpRtqYKmZnZ4=;
 b=dtiyqAQOoz0+ntYpKhhKqahr2waaJukF4iLsE25W3cUAbKKPKJToFdhzC4TUMbsomXCt
 iFhu6YqOqBM4tghlvB3/rW3av72drZJOsFOe08MFBYRDDLoTQTBl1x0rpVlPslwWJEO4
 lXes1XFC9sFsd8VATg7B6LR3jFP2xruLc4bZX9rppgd8zMsjHvnWrPQmD/Sw/XGAF2BK
 4aqqipO0tkYdJPkHl2/O9H7Odzf5uQrEvr1jdnkM9Pr4aAVaqQVT2llIhyPJD1qsOpPh
 TbliXmS3MQMAz+auVMWsYq+y7+qg/jzFJhrV27u2bxMTJRGJlJr+R+GRIBSH6KI2bskw ig== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e8q1886ym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 01:07:19 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21G17IP1015970;
 Wed, 16 Feb 2022 01:07:18 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e8q1886y8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 01:07:18 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21G0vomH002116;
 Wed, 16 Feb 2022 01:07:17 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 3e64hc6dhv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Feb 2022 01:07:17 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21G17F3q24117590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Feb 2022 01:07:15 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8ECEC6E056;
 Wed, 16 Feb 2022 01:07:15 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62D7F6E065;
 Wed, 16 Feb 2022 01:07:14 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 16 Feb 2022 01:07:14 +0000 (GMT)
Message-ID: <585b52e2fb7c47ec21220e64c636456aad144747.camel@linux.ibm.com>
Subject: Re: [PATCH v3 02/10] powerpc/pseries/vas: Add notifier for DLPAR
 core removal/add
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Tue, 15 Feb 2022 17:07:12 -0800
In-Reply-To: <1644804881.mp6yrf6sdz.astroid@bobo.none>
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <68ec2a354a932670fabd600a18eccbfcacd84464.camel@linux.ibm.com>
 <1644804881.mp6yrf6sdz.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pbjIYXZAePn9_r31ET-dhDGHpyrh5BXX
X-Proofpoint-GUID: dCGygXhozWofAJ5QqFNEbKLSH2yrVV1f
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-15_07,2022-02-14_04,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0 priorityscore=1501
 bulkscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202160005
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2022-02-14 at 12:27 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of January 22, 2022 5:54 am:
> > The hypervisor assigns credits for each LPAR based on number of
> > cores configured in that system. So expects to release credits
> > (means windows) when the core is removed. This patch adds notifier
> > for core removal/add so that the OS closes windows if the system
> > looses credits due to core removal and reopen windows when the
> > credits available later.
> 
> This could be improved. As far as I can tell,
> 
>  The hypervisor assigns vas credits (windows) for each LPAR based on
> the 
>  number of cores configured in that system. The OS is expected to 
>  release credits when cores are removed, and may allocate more when 
>  cores are added.
> 
> Or can you only re-use credits that you previously lost?

yes, reopen windows / re-use credits when the previously lost credits
are available. 
> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/vas.c | 37
> > ++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/vas.c
> > b/arch/powerpc/platforms/pseries/vas.c
> > index c0737379cc7b..d2c8292bfb33 100644
> > --- a/arch/powerpc/platforms/pseries/vas.c
> > +++ b/arch/powerpc/platforms/pseries/vas.c
> > @@ -538,6 +538,39 @@ static int __init get_vas_capabilities(u8
> > feat, enum vas_cop_feat_type type,
> >  	return 0;
> >  }
> >  
> > +/*
> > + * Total number of default credits available (target_credits)
> > + * in LPAR depends on number of cores configured. It varies based
> > on
> > + * whether processors are in shared mode or dedicated mode.
> > + * Get the notifier when CPU configuration is changed with DLPAR
> > + * operation so that get the new target_credits (vas default
> > capabilities)
> > + * and then update the existing windows usage if needed.
> > + */
> > +static int pseries_vas_notifier(struct notifier_block *nb,
> > +				unsigned long action, void *data)
> > +{
> > +	struct of_reconfig_data *rd = data;
> > +	struct device_node *dn = rd->dn;
> > +	const __be32 *intserv = NULL;
> > +	int len, rc = 0;
> > +
> > +	if ((action == OF_RECONFIG_ATTACH_NODE) ||
> > +		(action == OF_RECONFIG_DETACH_NODE))
> 
> I suppose the OF notifier is the way to do it (cc Nathan).

Using notifier here. registering notifier
with of_reconfig_notifier_register() as in other places (hotplug-
cpu.c pseries_smp_notifier())

> 
> Could this patch be folded in with where it acually does something?
> It 
> makes it easier to review and understand how the notifier is used.

Added this notifier as a seperate patch to make it smaller. Sure, I can
include this patch in 'Add reconfig_close/open_windows() patch'. 
> 
> 
> > +		intserv = of_get_property(dn, "ibm,ppc-interrupt-
> > server#s",
> > +					  &len);
> > +	/*
> > +	 * Processor config is not changed
> > +	 */
> > +	if (!intserv)
> > +		return NOTIFY_OK;
> > +
> > +	return rc;
> > +}
> > +
> > +static struct notifier_block pseries_vas_nb = {
> > +	.notifier_call = pseries_vas_notifier,
> > +};
> > +
> >  static int __init pseries_vas_init(void)
> >  {
> >  	struct hv_vas_cop_feat_caps *hv_cop_caps;
> > @@ -591,6 +624,10 @@ static int __init pseries_vas_init(void)
> >  			goto out_cop;
> >  	}
> >  
> > +	/* Processors can be added/removed only on LPAR */
> 
> What does this comment mean? DLPAR?

I will remve it, basically trying to say that this notifier is called
when core is removed / added. 

Thanks
haren

> 
> Thanks,
> Nick
> 
> > +	if (copypaste_feat && firmware_has_feature(FW_FEATURE_LPAR))
> > +		of_reconfig_notifier_register(&pseries_vas_nb);
> > +
> >  	pr_info("GZIP feature is available\n");
> >  
> >  out_cop:
> > -- 
> > 2.27.0
> > 
> > 
> > 

