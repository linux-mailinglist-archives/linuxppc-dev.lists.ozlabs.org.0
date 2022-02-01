Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DD54A55FC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 06:00:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jnt5r5vRNz3cM5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 16:00:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fvidzhQq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=fvidzhQq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jnt5108TWz2xF9
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 15:59:16 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21121FgI000957; 
 Tue, 1 Feb 2022 04:59:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=hVV93Af0XcZNSJRm6PYf2rSPrhwNcDUQ2yOfRvCST0E=;
 b=fvidzhQqCPOKhCd2zu3pwfcWX9ZV90GxEDlsmO9ry7KgNkXoXuZJahWbXbcFErUaygpD
 hl4nAZu02AS9FNbBCn6nis0vWpuvFsnMJvK/P/cgEXL0qr/skwljgPVN9Zv4hf6ijEBX
 1iyPc8CZEprEhue8DhgW9k8lORSGddpxOaDxcBl+1LZoHU0eAONZg+kC7rW1nK65Labm
 EigOyNSqUMtSI/NrrSVkj/othx9zRXXAiTWD7m71ThxINkle6vhe6E1pUAQUbxYJpdNt
 J4QRHHeL56KRZftcTOH15TL6z5IheRot5z/28G8lwHDbMTIJecvSleww1Tqr9esuOmBy gQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dxkthcmmc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 04:59:07 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2114QvkV024690;
 Tue, 1 Feb 2022 04:59:07 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dxkthcmm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 04:59:07 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2114qV1N004623;
 Tue, 1 Feb 2022 04:59:07 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3dvw7ahq2p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Feb 2022 04:59:06 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2114x4gN18350558
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Feb 2022 04:59:04 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 47B2E136055;
 Tue,  1 Feb 2022 04:59:04 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33B91136053;
 Tue,  1 Feb 2022 04:59:03 +0000 (GMT)
Received: from sig-9-65-193-114.ibm.com (unknown [9.65.193.114])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Feb 2022 04:59:02 +0000 (GMT)
Message-ID: <17bb8ed6bfc450ec89bd12169d43858a2ba33bca.camel@linux.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/pseries/vas: Add VAS migration handler
From: Haren Myneni <haren@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Date: Mon, 31 Jan 2022 20:59:01 -0800
In-Reply-To: <87o83rzws1.fsf@linux.ibm.com>
References: <3ac406c37f4aa17e742325b5a86e073fd944428b.camel@linux.ibm.com>
 <55dc807fe7f2c8989d267c70b50c5af5c0b22f00.camel@linux.ibm.com>
 <87o83rzws1.fsf@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qnKfbJ8NNyiM2i4G03Fqcnez9WGUIYBl
X-Proofpoint-GUID: sdFdyXno-JIgR-QAYYVPuUc87XGr7NcH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-01_01,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 mlxscore=0 impostorscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202010022
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

On Mon, 2022-01-31 at 10:37 -0600, Nathan Lynch wrote:
> Hi Haren,
> 
> Mostly this seems OK to me. Some questions:

Thanks Nathan for your suggestions.

> 
> Haren Myneni <haren@linux.ibm.com> writes:
> > Since the VAS windows belong to the VAS hardware resource, the
> > hypervisor expects the partition to close them on source partition
> > and reopen them after the partition migrated on the destination
> > machine.
> 
> Not clear to me what "expects" really means here. Would it be
> accurate
> to say "requires" instead? If the OS fails to close the windows
> before
> suspend, what happens?

I will change it to 'requires' - These VAS windows have to be closed
before migration so that these windows / credits will be available to
other LPARs on the source machine.

We should see failures only with HCALL to close windows. Since the
migration can not be stopped, continue to close all windows (print
error messages and ignore HCALL failures). These windows belong to VAS
engine on source system, so can not be used them on the destination
machine.

> 
> 
> > This handler is called before pseries_suspend() to close these
> > windows and again invoked after migration. All active windows
> > for both default and QoS types will be closed and mark them
> > in-active and reopened after migration with this handler.
> > During the migration, the user space receives paste instruction
> > failure if it issues copy/paste on these in-active windows.
> 
> OK, I assume that's tolerable to existing users, is that correct?
> I.e.
> users should already be prepared to incur arbitrary paste instruction
> failures.

Yes, the user space or the nxz library has to fall back to SW solution
(if the library supports) or manage with existing windows like closing
the not frequently used ones. We expect the library to make the
necessary modifications. 

> 
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
> > +
> 
> vas_migration_handler() can return an error value. Is that OK to
> ignore
> before going into the suspend?

The migration continues even with these failures. So ignoring the
failures from vas_migration_handler. 

Suspend operation: 
- we should expect failure with close HCALL or if the total credits
does not match with the hypervisor (should not happen)
- continue to close all windows even with HCALL failures with few
windows since these HW resources are specific to machine.
- Display error messages for HCALL failures (for debugging)

Resume operation:
- May see failures from HCALL to open/modify window HCALLs, but should
not expect unless a bug in hypervisor or HW.
- Stop opening windows if sees failure from HCALLs and print error
messages
- It does not stop migration, but the nxz library can see continue
failures for many in-active windows. 

> 
> >  	ret = pseries_suspend(handle);
> >  	if (ret == 0)
> >  		post_mobility_fixup();
> >  	else
> >  		pseries_cancel_migration(handle, ret);
> >  
> > +	vas_migration_handler(VAS_RESUME);
> > +
> 
> No concerns here though. Nothing to be done about errors encountered
> in
> the resume path.

Correct as mentioned above ignoring error from VAS migration hanlder.

Thanks
Haren
> 
> >  	return ret;
> >  }
> >  
> > diff --git a/arch/powerpc/platforms/pseries/vas.c
> > b/arch/powerpc/platforms/pseries/vas.c
> > index e4797fc73553..b53e3fe02971 100644
> > --- a/arch/powerpc/platforms/pseries/vas.c
> > +++ b/arch/powerpc/platforms/pseries/vas.c
> > @@ -873,6 +873,92 @@ static struct notifier_block pseries_vas_nb =
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
> > +	struct hv_vas_cop_feat_caps *hv_caps;
> > +	struct vas_cop_feat_caps *caps;
> > +	int lpar_creds, new_creds = 0;
> > +	struct vas_caps *vcaps;
> > +	int i, rc = 0;
> > +
> > +	hv_caps = kmalloc(sizeof(*hv_caps), GFP_KERNEL);
> > +	if (!hv_caps)
> > +		return -ENOMEM;
> > +
> > +	mutex_lock(&vas_pseries_mutex);
> > +
> > +	for (i = 0; i < VAS_MAX_FEAT_TYPE; i++) {
> > +		vcaps = &vascaps[i];
> > +		caps = &vcaps->caps;
> > +		lpar_creds = atomic_read(&caps->target_creds);
> > +
> > +		rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES,
> > +					      vcaps->feat,
> > +					      (u64)virt_to_phys(hv_caps
> > ));
> > +		if (!rc) {
> > +			new_creds = be16_to_cpu(hv_caps-
> > >target_lpar_creds);
> > +			/*
> > +			 * Should not happen. But incase print
> > messages, close
> > +			 * all windows in the list during suspend and
> > reopen
> > +			 * windows based on new lpar_creds on the
> > destination
> > +			 * system.
> > +			 */
> > +			if (lpar_creds != new_creds) {
> > +				pr_err("state(%d): lpar creds: %d HV
> > lpar creds: %d\n",
> > +					action, lpar_creds, new_creds);
> > +				pr_err("Used creds: %d, Active creds:
> > %d\n",
> > +					atomic_read(&caps->used_creds),
> > +					vcaps->num_wins - vcaps-
> > >close_wins);
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
> > >num_wins,
> > +							true);
> > +			break;
> > +		case VAS_RESUME:
> > +			atomic_set(&caps->target_creds, new_creds);
> > +			rc = reconfig_open_windows(vcaps, new_creds,
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
> > +	kfree(hv_caps);
> > +	return rc;
> > +}
> 
> The control flow with respect to releasing the allocation and the
> mutex
> looks correct to me. I also verified that H_QUERY_VAS_CAPABILITIES
> does
> not return a busy/retry status, so this code appears to handle all
> the
> architected statuses for that call.

