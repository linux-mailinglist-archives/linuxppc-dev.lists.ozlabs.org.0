Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A824A4C80
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Jan 2022 17:51:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JnYxX27DPz3bbm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Feb 2022 03:51:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NCxtYOI0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NCxtYOI0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JnYwk0S5sz30Nc
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Feb 2022 03:51:01 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VGcFlP003278; 
 Mon, 31 Jan 2022 16:50:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=frBh3UPw/mH1w30X066yEJO+/inYh/GqNL08wiAIiwM=;
 b=NCxtYOI0fNgCnNBu64j++0yPDudbWZ41JLLqC537hP+yZGlq8BGW/DhQClaMHLvpG8Ep
 kdiabMLaeDFVkJIbHoi6mdWml8Fo2z4pOG1Nmdc5VS7qBYzEyQGjIWimKo0DRMvjFD/h
 1bTQbOX1BwTLMZllitA5xyEQg/n4GOk89UHNb3zyJWIN7yhPqywz6E+J0VEBaGAAiwXC
 T09DtVYo/rapqPFH8betkk5yBAdxdDWtqGonlbf/1kxK0YNijHI9sXVxphXQeF4pfljp
 kx2M+M9B3gjFpqHHXvIQogCoAjpv/Et5HNIUxkZgQ6CEF+uPq5KYZy067xA29WtDQ6Zw 5Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxfdp69sw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 16:50:56 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20VGcVNj004406;
 Mon, 31 Jan 2022 16:50:56 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dxfdp69my-10
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 16:50:55 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VGSJ0R026874;
 Mon, 31 Jan 2022 16:37:41 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma05wdc.us.ibm.com with ESMTP id 3dvw7a72j5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 16:37:41 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VGbZNO31326556
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 16:37:35 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2995EBE073;
 Mon, 31 Jan 2022 16:37:35 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F08FBE06D;
 Mon, 31 Jan 2022 16:37:35 +0000 (GMT)
Received: from localhost (unknown [9.211.140.88])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 31 Jan 2022 16:37:34 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Subject: Re: [PATCH 2/3] powerpc/pseries/vas: Add VAS migration handler
In-Reply-To: <55dc807fe7f2c8989d267c70b50c5af5c0b22f00.camel@linux.ibm.com>
References: <3ac406c37f4aa17e742325b5a86e073fd944428b.camel@linux.ibm.com>
 <55dc807fe7f2c8989d267c70b50c5af5c0b22f00.camel@linux.ibm.com>
Date: Mon, 31 Jan 2022 10:37:34 -0600
Message-ID: <87o83rzws1.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xDMcyDAJ9avW2viAbcLfwpP-yGdbIg7D
X-Proofpoint-GUID: 5ONBnReP4rkCc9BGewfTXsvpI2hCEksc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_07,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310107
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

Hi Haren,

Mostly this seems OK to me. Some questions:

Haren Myneni <haren@linux.ibm.com> writes:
> Since the VAS windows belong to the VAS hardware resource, the
> hypervisor expects the partition to close them on source partition
> and reopen them after the partition migrated on the destination
> machine.

Not clear to me what "expects" really means here. Would it be accurate
to say "requires" instead? If the OS fails to close the windows before
suspend, what happens?


> This handler is called before pseries_suspend() to close these
> windows and again invoked after migration. All active windows
> for both default and QoS types will be closed and mark them
> in-active and reopened after migration with this handler.
> During the migration, the user space receives paste instruction
> failure if it issues copy/paste on these in-active windows.

OK, I assume that's tolerable to existing users, is that correct? I.e.
users should already be prepared to incur arbitrary paste instruction
failures.

>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/mobility.c |  5 ++
>  arch/powerpc/platforms/pseries/vas.c      | 86 +++++++++++++++++++++++
>  arch/powerpc/platforms/pseries/vas.h      |  6 ++
>  3 files changed, 97 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/platforms/pseries/mobility.c
> index 85033f392c78..70004243e25e 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -26,6 +26,7 @@
>  #include <asm/machdep.h>
>  #include <asm/rtas.h>
>  #include "pseries.h"
> +#include "vas.h"	/* vas_migration_handler() */
>  #include "../../kernel/cacheinfo.h"
>  
>  static struct kobject *mobility_kobj;
> @@ -669,12 +670,16 @@ static int pseries_migrate_partition(u64 handle)
>  	if (ret)
>  		return ret;
>  
> +	vas_migration_handler(VAS_SUSPEND);
> +

vas_migration_handler() can return an error value. Is that OK to ignore
before going into the suspend?

>  	ret = pseries_suspend(handle);
>  	if (ret == 0)
>  		post_mobility_fixup();
>  	else
>  		pseries_cancel_migration(handle, ret);
>  
> +	vas_migration_handler(VAS_RESUME);
> +

No concerns here though. Nothing to be done about errors encountered in
the resume path.

>  	return ret;
>  }
>  
> diff --git a/arch/powerpc/platforms/pseries/vas.c b/arch/powerpc/platforms/pseries/vas.c
> index e4797fc73553..b53e3fe02971 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -873,6 +873,92 @@ static struct notifier_block pseries_vas_nb = {
>  	.notifier_call = pseries_vas_notifier,
>  };
>  
> +/*
> + * For LPM, all windows have to be closed on the source partition
> + * before migration and reopen them on the destination partition
> + * after migration. So closing windows during suspend and
> + * reopen them during resume.
> + */
> +int vas_migration_handler(int action)
> +{
> +	struct hv_vas_cop_feat_caps *hv_caps;
> +	struct vas_cop_feat_caps *caps;
> +	int lpar_creds, new_creds = 0;
> +	struct vas_caps *vcaps;
> +	int i, rc = 0;
> +
> +	hv_caps = kmalloc(sizeof(*hv_caps), GFP_KERNEL);
> +	if (!hv_caps)
> +		return -ENOMEM;
> +
> +	mutex_lock(&vas_pseries_mutex);
> +
> +	for (i = 0; i < VAS_MAX_FEAT_TYPE; i++) {
> +		vcaps = &vascaps[i];
> +		caps = &vcaps->caps;
> +		lpar_creds = atomic_read(&caps->target_creds);
> +
> +		rc = h_query_vas_capabilities(H_QUERY_VAS_CAPABILITIES,
> +					      vcaps->feat,
> +					      (u64)virt_to_phys(hv_caps));
> +		if (!rc) {
> +			new_creds = be16_to_cpu(hv_caps->target_lpar_creds);
> +			/*
> +			 * Should not happen. But incase print messages, close
> +			 * all windows in the list during suspend and reopen
> +			 * windows based on new lpar_creds on the destination
> +			 * system.
> +			 */
> +			if (lpar_creds != new_creds) {
> +				pr_err("state(%d): lpar creds: %d HV lpar creds: %d\n",
> +					action, lpar_creds, new_creds);
> +				pr_err("Used creds: %d, Active creds: %d\n",
> +					atomic_read(&caps->used_creds),
> +					vcaps->num_wins - vcaps->close_wins);
> +			}
> +		} else {
> +			pr_err("state(%d): Get VAS capabilities failed with %d\n",
> +				action, rc);
> +			/*
> +			 * We can not stop migration with the current lpm
> +			 * implementation. So continue closing all windows in
> +			 * the list (during suspend) and return without
> +			 * opening windows (during resume) if VAS capabilities
> +			 * HCALL failed.
> +			 */
> +			if (action == VAS_RESUME)
> +				goto out;
> +		}
> +
> +		switch (action) {
> +		case VAS_SUSPEND:
> +			rc = reconfig_close_windows(vcaps, vcaps->num_wins,
> +							true);
> +			break;
> +		case VAS_RESUME:
> +			atomic_set(&caps->target_creds, new_creds);
> +			rc = reconfig_open_windows(vcaps, new_creds, true);
> +			break;
> +		default:
> +			/* should not happen */
> +			pr_err("Invalid migration action %d\n", action);
> +			rc = -EINVAL;
> +			goto out;
> +		}
> +
> +		/*
> +		 * Ignore errors during suspend and return for resume.
> +		 */
> +		if (rc && (action == VAS_RESUME))
> +			goto out;
> +	}
> +
> +out:
> +	mutex_unlock(&vas_pseries_mutex);
> +	kfree(hv_caps);
> +	return rc;
> +}

The control flow with respect to releasing the allocation and the mutex
looks correct to me. I also verified that H_QUERY_VAS_CAPABILITIES does
not return a busy/retry status, so this code appears to handle all the
architected statuses for that call.
