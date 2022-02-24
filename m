Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 233D34C27A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 10:11:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K46bq2SGXz3g55
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 20:11:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pn1KnI8d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Pn1KnI8d; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K46Wf2RD9z3fcP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 20:08:13 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21O6a4V9003727; 
 Thu, 24 Feb 2022 09:08:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=bbk0Z70A2MPjI7j4Va/nAwhkvhY9++X/IwrXZ6D8Swg=;
 b=Pn1KnI8dInyKlNMncJ772v5q0SxSyoiz922b9gDVHKg7gOuB7/QDGZefF6d/tgSdJ4CO
 lupXG4iisvqGpTTBNqbvfq1aHvh74rSUuD61b9lEdkUeZfr07kU5qmRa7hq3K6tQyVvg
 Y/ssqkS6tFdPa+UAq1ncgPnb/WeGXeORiTja10I5g0ntF7dMSDKUKwvAJkrVSSPjW0Ep
 EPNl4T5j9I5zui/3QkVtwJR+Y6xc9MdfsJfQev3tRcmnnSFnsZvTsOLiGu8m1Q4TM/sB
 UOMWPg0zNEefNlm/k+AomDTj48UxxEU1HOZeSwd3/1aYlZ8MyUhki9WsNdPSTo7IrRHC cQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edtv868fy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 09:08:07 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21O8ltwU022288;
 Thu, 24 Feb 2022 09:08:07 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edtv868fk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 09:08:07 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21O8wPjg030949;
 Thu, 24 Feb 2022 09:08:06 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3ed22edpxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 09:08:06 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21O984wt37093884
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 09:08:04 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 264F86E04E;
 Thu, 24 Feb 2022 09:08:04 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F35F26E05F;
 Thu, 24 Feb 2022 09:08:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 24 Feb 2022 09:08:02 +0000 (GMT)
Message-ID: <6519704a83d83dd69df6b4e0c56c849332781e56.camel@linux.ibm.com>
Subject: Re: [PATCH v3 3/4] powerpc/pseries/vas: Add VAS migration handler
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
Date: Thu, 24 Feb 2022 01:08:01 -0800
In-Reply-To: <1645610108.s180pzifa4.astroid@bobo.none>
References: <4a23d5ec655fd00da97b0b0b46174a3a3894bfb0.camel@linux.ibm.com>
 <2769e401eaa7bfc165c5e468c35d4e7bf4f6b62e.camel@linux.ibm.com>
 <1645610108.s180pzifa4.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zEd_aTOZ2j8byCFNzKcLdsUA5oMQa1aQ
X-Proofpoint-GUID: eDc9pQ6MR-UAP-D_1ff1f3NY5HkA59ap
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_09,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0
 phishscore=0 priorityscore=1501 impostorscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202240054
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-02-23 at 20:03 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of February 20, 2022 6:06 am:
> > Since the VAS windows belong to the VAS hardware resource, the
> > hypervisor expects the partition to close them on source partition
> > and reopen them after the partition migrated on the destination
> > machine.
> > 
> > This handler is called before pseries_suspend() to close these
> > windows and again invoked after migration. All active windows
> > for both default and QoS types will be closed and mark them
> > in-active and reopened after migration with this handler.
> > During the migration, the user space receives paste instruction
> > failure if it issues copy/paste on these in-active windows.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/mobility.c |  5 ++
> >  arch/powerpc/platforms/pseries/vas.c      | 86
> > +++++++++++++++++++++++
> >  arch/powerpc/platforms/pseries/vas.h      |  6 ++
> >  3 files changed, 97 insertions(+)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/mobility.c
> > b/arch/powerpc/platforms/pseries/mobility.c
> > index 85033f392c78..70004243e25e 100644
> > --- a/arch/powerpc/platforms/pseries/mobility.c
> > +++ b/arch/powerpc/platforms/pseries/mobility.c
> > @@ -26,6 +26,7 @@
> >  #include <asm/machdep.h>
> >  #include <asm/rtas.h>
> >  #include "pseries.h"
> > +#include "vas.h"	/* vas_migration_handler() */
> >  #include "../../kernel/cacheinfo.h"
> >  
> >  static struct kobject *mobility_kobj;
> > @@ -669,12 +670,16 @@ static int pseries_migrate_partition(u64
> > handle)
> >  	if (ret)
> >  		return ret;
> >  
> > +	vas_migration_handler(VAS_SUSPEND);
> 
> Not sure if there is much point having a "handler" like this that
> only
> takes two operations. vas_migration_begin()/vas_migration_end() is
> better isn't it?

The actual suspend / resume framework will be added later. So using the
VAS_SUSPEND/VAS_RESUME right now, but will be removed later after
having the permanent fix. 

> 
> Other question is why can't the suspend handler return error and
> handle
> it here?

We can, but has to call pseries_cancel_migration() if VAS suspend
handler returns failure. We should expect this failure only from
H_DEALLOCATE_VAS_WINDOW and H_QUERY_VAS_CAPABILITIES HCALLs wich should
not happen generally.

> 
> > +
> >  	ret = pseries_suspend(handle);
> >  	if (ret == 0)
> >  		post_mobility_fixup();
> >  	else
> >  		pseries_cancel_migration(handle, ret);
> >  
> > +	vas_migration_handler(VAS_RESUME);
> > +
> >  	return ret;
> >  }
> >  
> > diff --git a/arch/powerpc/platforms/pseries/vas.c
> > b/arch/powerpc/platforms/pseries/vas.c
> > index fbcf311da0ec..df22827969db 100644
> > --- a/arch/powerpc/platforms/pseries/vas.c
> > +++ b/arch/powerpc/platforms/pseries/vas.c
> > @@ -869,6 +869,92 @@ static struct notifier_block pseries_vas_nb =
> > {
> >  	.notifier_call = pseries_vas_notifier,
> >  };
> >  
> > +/*
> > + * For LPM, all windows have to be closed on the source partition
> > + * before migration and reopen them on the destination partition
> > + * after migration. So closing windows during suspend and
> > + * reopen them during resume.
> > + */
> > +int vas_migration_handler(int action)
> > +{
> > +	struct vas_cop_feat_caps *caps;
> > +	int old_nr_creds, new_nr_creds = 0;
> > +	struct vas_caps *vcaps;
> > +	int i, rc = 0;
> > +
> > +	/*
> > +	 * NX-GZIP is not enabled. Nothing to do for migration.
> > +	 */
> > +	if (!copypaste_feat)
> > +		return rc;
> > +
> > +	mutex_lock(&vas_pseries_mutex);
> > +
> > +	for (i = 0; i < VAS_MAX_FEAT_TYPE; i++) {
> > +		vcaps = &vascaps[i];
> > +		caps = &vcaps->caps;
> > +		old_nr_creds = atomic_read(&caps->nr_total_credits);
> > +
> > +		rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES,
> > +					      vcaps->feat,
> > +					      (u64)virt_to_phys(&hv_cop
> > _caps));
> > +		if (!rc) {
> > +			new_nr_creds =
> > be16_to_cpu(hv_cop_caps.target_lpar_creds);
> > +			/*
> > +			 * Should not happen. But incase print
> > messages, close
> > +			 * all windows in the list during suspend and
> > reopen
> > +			 * windows based on new lpar_creds on the
> > destination
> > +			 * system.
> > +			 */
> > +			if (old_nr_creds != new_nr_creds) {
> > +				pr_err("state(%d): lpar creds: %d HV
> > lpar creds: %d\n",
> > +					action, old_nr_creds,
> > new_nr_creds);
> > +				pr_err("Used creds: %d, Active creds:
> > %d\n",
> > +					atomic_read(&caps-
> > >nr_used_credits),
> > +					vcaps->nr_open_windows - vcaps-
> > >nr_close_wins);
> 
> Error messages should have some vague use to the administrator even
> if 
> you don't expect it or they aren't expected to know much.
> 
> "VAS NX error during LPM: credit mismatch blah"
> 
> Otherwise if it's a Linux or hypervisor bug then make it a WARN_ON,
> at 
> least then by convention the administrator knows that should be
> reported
> and it's (possibly) non-fatal.

I can use pr_warn(), but my intention was to give attention to user by
notifying it as error message. This credits mismatch should not happen
and the hypervisor has to make sure credits match before the migration.

Thanks
Haren

> 
> Thanks,
> Nick
> 
> > +			}
> > +		} else {
> > +			pr_err("state(%d): Get VAS capabilities failed
> > with %d\n",
> > +				action, rc);
> > +			/*
> > +			 * We can not stop migration with the current
> > lpm
> > +			 * implementation. So continue closing all
> > windows in
> > +			 * the list (during suspend) and return without
> > +			 * opening windows (during resume) if VAS
> > capabilities
> > +			 * HCALL failed.
> > +			 */
> > +			if (action == VAS_RESUME)
> > +				goto out;
> > +		}
> > +
> > +		switch (action) {
> > +		case VAS_SUSPEND:
> > +			rc = reconfig_close_windows(vcaps, vcaps-
> > >nr_open_windows,
> > +							true);
> > +			break;
> > +		case VAS_RESUME:
> > +			atomic_set(&caps->nr_total_credits,
> > new_nr_creds);
> > +			rc = reconfig_open_windows(vcaps, new_nr_creds,
> > true);
> > +			break;
> > +		default:
> > +			/* should not happen */
> > +			pr_err("Invalid migration action %d\n",
> > action);
> > +			rc = -EINVAL;
> > +			goto out;
> > +		}
> > +
> > +		/*
> > +		 * Ignore errors during suspend and return for resume.
> > +		 */
> > +		if (rc && (action == VAS_RESUME))
> > +			goto out;
> > +	}
> > +
> > +out:
> > +	mutex_unlock(&vas_pseries_mutex);
> > +	return rc;
> > +}
> > +
> >  static int __init pseries_vas_init(void)
> >  {
> >  	struct hv_vas_all_caps *hv_caps;
> > diff --git a/arch/powerpc/platforms/pseries/vas.h
> > b/arch/powerpc/platforms/pseries/vas.h
> > index 4ddb1001a0aa..f7568d8c6ab0 100644
> > --- a/arch/powerpc/platforms/pseries/vas.h
> > +++ b/arch/powerpc/platforms/pseries/vas.h
> > @@ -33,6 +33,11 @@
> >  #define VAS_GZIP_QOS_CAPABILITIES	0x56516F73477A6970
> >  #define VAS_GZIP_DEFAULT_CAPABILITIES	0x56446566477A6970
> >  
> > +enum vas_migrate_action {
> > +	VAS_SUSPEND,
> > +	VAS_RESUME,
> > +};
> > +
> >  /*
> >   * Co-processor feature - GZIP QoS windows or GZIP default windows
> >   */
> > @@ -132,4 +137,5 @@ struct pseries_vas_window {
> >  int sysfs_add_vas_caps(struct vas_cop_feat_caps *caps);
> >  int vas_reconfig_capabilties(u8 type);
> >  int __init sysfs_pseries_vas_init(struct vas_all_caps *vas_caps);
> > +int vas_migration_handler(int action);
> >  #endif /* _VAS_H */
> > -- 
> > 2.27.0
> > 
> > 
> > 

