Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF6236E8BE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 12:28:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWBXz2KmKz30Cy
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 20:28:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ki0Clrbq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ki0Clrbq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWBXT23xnz2xfd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Apr 2021 20:27:52 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13TA36W7043135; Thu, 29 Apr 2021 06:27:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=IIer3TMVoh96Z7W8qaf8EYOcQAssDHMMRQTE9eL+1cU=;
 b=ki0ClrbqzVr9KQwlrNQXWmoBNFkeNehCWTHof3mxZnl/WKJ2BgkuR6YTqCs6RXite5vS
 sMd0faSkUEb5Qa6RaLxkomQyjNRYFIzB5YW9TFUPf/GTgg6BHxur9JPm2zZ2q3TILBOy
 DICtZYqBwkb1tXmJdF4ZMsSXWCjvIP71oecPmjNpljBVa3fFZGPSW0AU0ychlriVSPKc
 7mG3clBzYAir3V+Mxk0Uf/Wt9TD5T6bcGdlHrPgrHPmfvKu1FoqRFN+D/JzionD51e3V
 0YpgF/0grMiocSVCv5Yfm+pTypBOCG9mupccFDRgntITy/fYYovteuryKNUrgx7ToXfb Mg== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 387te0s9ta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 06:27:43 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13TANOde023688;
 Thu, 29 Apr 2021 10:27:43 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02dal.us.ibm.com with ESMTP id 387r6qs5ky-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 29 Apr 2021 10:27:43 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13TARgpI47579492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 29 Apr 2021 10:27:42 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E7A84AE05F;
 Thu, 29 Apr 2021 10:27:41 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F366BAE05C;
 Thu, 29 Apr 2021 10:27:38 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.85.83.17])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 29 Apr 2021 10:27:38 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
Subject: Re: [PATCH v3] pseries/drmem: update LMBs after LPM
In-Reply-To: <20210428094758.28665-1-ldufour@linux.ibm.com>
References: <20210428094758.28665-1-ldufour@linux.ibm.com>
Date: Thu, 29 Apr 2021 15:57:35 +0530
Message-ID: <87fsz95qso.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3zWSa1pYlkjpm9fDQjLGAC5IDzptj7Or
X-Proofpoint-ORIG-GUID: 3zWSa1pYlkjpm9fDQjLGAC5IDzptj7Or
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-29_05:2021-04-28,
 2021-04-29 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 bulkscore=0 phishscore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104290068
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
Cc: nathanl@linux.ibm.com, Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:

> After a LPM, the device tree node ibm,dynamic-reconfiguration-memory may be
> updated by the hypervisor in the case the NUMA topology of the LPAR's
> memory is updated.
>
> This is caught by the kernel, but the memory's node is updated because
> there is no way to move a memory block between nodes.
>
> If later a memory block is added or removed, drmem_update_dt() is called
> and it is overwriting the DT node to match the added or removed LMB. But
> the LMB's associativity node has not been updated after the DT node update
> and thus the node is overwritten by the Linux's topology instead of the
> hypervisor one.
>
> Introduce a hook called when the ibm,dynamic-reconfiguration-memory node is
> updated to force an update of the LMB's associativity.
>
> Cc: Tyrel Datwyler <tyreld@linux.ibm.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>
> V3:
>  - Check rd->dn->name instead of rd->dn->full_name
> V2:
>  - Take Tyrel's idea to rely on OF_RECONFIG_UPDATE_PROPERTY instead of
>  introducing a new hook mechanism.
> ---
>  arch/powerpc/include/asm/drmem.h              |  1 +
>  arch/powerpc/mm/drmem.c                       | 35 +++++++++++++++++++
>  .../platforms/pseries/hotplug-memory.c        |  4 +++
>  3 files changed, 40 insertions(+)
>
> diff --git a/arch/powerpc/include/asm/drmem.h b/arch/powerpc/include/asm/drmem.h
> index bf2402fed3e0..4265d5e95c2c 100644
> --- a/arch/powerpc/include/asm/drmem.h
> +++ b/arch/powerpc/include/asm/drmem.h
> @@ -111,6 +111,7 @@ int drmem_update_dt(void);
>  int __init
>  walk_drmem_lmbs_early(unsigned long node, void *data,
>  		      int (*func)(struct drmem_lmb *, const __be32 **, void *));
> +void drmem_update_lmbs(struct property *prop);
>  #endif
>  
>  static inline void invalidate_lmb_associativity_index(struct drmem_lmb *lmb)
> diff --git a/arch/powerpc/mm/drmem.c b/arch/powerpc/mm/drmem.c
> index 9af3832c9d8d..f0a6633132af 100644
> --- a/arch/powerpc/mm/drmem.c
> +++ b/arch/powerpc/mm/drmem.c
> @@ -307,6 +307,41 @@ int __init walk_drmem_lmbs_early(unsigned long node, void *data,
>  	return ret;
>  }
>  
> +/*
> + * Update the LMB associativity index.
> + */
> +static int update_lmb(struct drmem_lmb *updated_lmb,
> +		      __maybe_unused const __be32 **usm,
> +		      __maybe_unused void *data)
> +{
> +	struct drmem_lmb *lmb;
> +
> +	/*
> +	 * Brut force there may be better way to fetch the LMB
> +	 */
> +	for_each_drmem_lmb(lmb) {
> +		if (lmb->drc_index != updated_lmb->drc_index)
> +			continue;
> +
> +		lmb->aa_index = updated_lmb->aa_index;
> +		break;
> +	}
> +	return 0;
> +}
> +
> +/*
> + * Update the LMB associativity index.
> + *
> + * This needs to be called when the hypervisor is updating the
> + * dynamic-reconfiguration-memory node property.
> + */
> +void drmem_update_lmbs(struct property *prop)
> +{
> +	if (!strcmp(prop->name, "ibm,dynamic-memory"))
> +		__walk_drmem_v1_lmbs(prop->value, NULL, NULL, update_lmb);
> +	else if (!strcmp(prop->name, "ibm,dynamic-memory-v2"))
> +		__walk_drmem_v2_lmbs(prop->value, NULL, NULL, update_lmb);
> +}
>  #endif
>  
>  static int init_drmem_lmb_size(struct device_node *dn)
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 8377f1f7c78e..672ffbee2e78 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -949,6 +949,10 @@ static int pseries_memory_notifier(struct notifier_block *nb,
>  	case OF_RECONFIG_DETACH_NODE:
>  		err = pseries_remove_mem_node(rd->dn);
>  		break;
> +	case OF_RECONFIG_UPDATE_PROPERTY:
> +		if (!strcmp(rd->dn->name,
> +			    "ibm,dynamic-reconfiguration-memory"))
> +			drmem_update_lmbs(rd->prop);
>  	}
>  	return notifier_from_errno(err);

How will this interact with DLPAR memory? When we dlpar memory,
ibm,configure-connector is used to fetch the new associativity details
and set drmem_lmb->aa_index correctly there. Once that is done kernel
then call drmem_update_dt() which will result in the above notifier
callback? 

IIUC, the call back then will update drmem_lmb->aa_index again?

-aneesh

