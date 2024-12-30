Return-Path: <linuxppc-dev+bounces-4516-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 386109FE344
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Dec 2024 08:32:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YM78w2k17z2ykT;
	Mon, 30 Dec 2024 18:32:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735543936;
	cv=none; b=MtWfhftm8RRfEDIHNJ84iF+QUjPGZXF7kTeVW39k9hynjkp7LxABKOzvCqJPfb8eAOEjOfzMZNPjVTHkNYgoaDLoO1wNtgwqMh+YMpAOB4uqj4NWX4qvanCOOUxBZaeHci/cesPKYVVl0l8W2igwUhsi+lpKQJ3Bl2LAl/70GZTHYiJCFMybUk75XwoZ1NQQv+ncQZOtFMkAgg/ABI/bTttwruCy+t2EgoU6+4mCZLgTtwSqGjcoZxJwFg/pl7XoLbSKCdKZ1MqYExbDOZVm9cn7TP+lCsIN56/JNC/fWTLZIQAa6a+w8PlJYuOWR1brcRT9nF+RZlYNY3GiSh46Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735543936; c=relaxed/relaxed;
	bh=EDKrW0WZv11mE2tA8WQFTeRUoHq51ZKK3Y/aMdjhsrs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l+3D8Hl0tCkc2tfIabgprn1OmZPmrc2cygg6gsVesA6PhcDlZRZy6sQPZHc8aAs3eF2yRvtdr4OwIyYzG/tsrzXmxBzqvp4MdCPqVjNgkrLFrqJnusurK5uYdsdHwxY+usAjCIjAfPByFpCH2AzsAHh7LkQdTSVg2Ketbc0yEsJye2Lym9V1WbwEr6ENvO/D0wQNf+kZfIOCH7jFuFhDAhJELvbjyevC1lR8/WoooGhGYScAG3UYnDPXHbiEr9IsrFFuSWGu+XrG8cB3SEfvgrNGc8ElpzUwYAh4isVDfFOOp/glTsRa/qvnECUVWy6QCXFJXIjIShhhYAxA2kaDqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bDsif3ny; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bDsif3ny;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YM78v176Dz2yhT
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 18:32:14 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU2sQtc019213;
	Mon, 30 Dec 2024 07:32:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=EDKrW0WZv11mE2tA8WQFTeRUoHq51Z
	KK3Y/aMdjhsrs=; b=bDsif3nyeathQmh8fq6mvtGXZVjL9WMx4mnIDKR5p/884S
	Wd+pXA0o1oSyf1F7uvpgZanhPYMyTvOAMLaVrr1X+ByHnHyvvqcXL4znBpdEtLcQ
	SSW8vMn/1GlERMj1jVrvamaglv6lYEDcz3e5dWRF050DD5vN7vS9LR3xKHFU0987
	sDymjkW/EjaFhiEIXIxJxsDDzg6OyRPyy7TKXV1oFGmJ/yR/SZKff1zPgRvf7Nsr
	Az38pkYFaBnMpbgbhzbP2qtbsVhWt6eJYiNBqImSGyhvuwKXzX3/dDqStD57TAb4
	Uvs59DaouEQVGv6aeRuYcf9qecaumpu1khfDp1TA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ug8a13gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 07:32:06 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BU7UbBa003477;
	Mon, 30 Dec 2024 07:32:05 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43ug8a13gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 07:32:05 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BU2Vmm7027055;
	Mon, 30 Dec 2024 07:32:05 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 43txc1ma9s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 30 Dec 2024 07:32:04 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BU7W1Cp45416774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 30 Dec 2024 07:32:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B6B32004B;
	Mon, 30 Dec 2024 07:32:01 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B63BA20040;
	Mon, 30 Dec 2024 07:31:58 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.39.28.22])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 30 Dec 2024 07:31:58 +0000 (GMT)
Date: Mon, 30 Dec 2024 13:01:54 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Vaibhav Jain <vaibhav@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
        sbhat@linux.ibm.com, kconsul@linux.ibm.com, amachhiw@linux.ibm.com
Subject: Re: [PATCH 5/6] powerpc/book3s-hv-pmu: Implement GSB message-ops for
 hostwide counters
Message-ID: <kazedttv45jj2yk227ybz4ngv6cpk7bujcfo47xvzrpn3an3i4@phv7hew4hfy6>
References: <20241222140247.174998-1-vaibhav@linux.ibm.com>
 <20241222140247.174998-6-vaibhav@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241222140247.174998-6-vaibhav@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tEdoYdRdhbQDKEc7cCBtIuWlTbZ1qh-4
X-Proofpoint-ORIG-GUID: fqdQQeyUqtZIlq_TNfouIEijkpQQLOAg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=1 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412300063
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Dec 22, 2024 at 07:32:33PM +0530, Vaibhav Jain wrote:
> Implement and setup necessary structures to send a prepolulated
> Guest-State-Buffer(GSB) requesting hostwide counters to L0-PowerVM and have
> the returned GSB holding the values of these counters parsed. This is done
> via existing GSB implementation and with the newly added support of
> Hostwide elements in GSB.
> 
> The request to L0-PowerVM to return Hostwide counters is done using a
> pre-allocated GSB named 'gsb_l0_stats'. To be able to populate this GSB
> with the needed Guest-State-Elements (GSIDs) a instance of 'struct
> kvmppc_gs_msg' named 'gsm_l0_stats' is introduced. The 'gsm_l0_stats' is
> tied to an instance of 'struct kvmppc_gs_msg_ops' named  'gsb_ops_l0_stats'
> which holds various callbacks to be compute the size ( hostwide_get_size()
> ), populate the GSB ( hostwide_fill_info() ) and
> refresh ( hostwide_refresh_info() ) the contents of
> 'l0_stats' that holds the Hostwide counters returned from L0-PowerVM.
> 
> To protect these structures from simultaneous access a spinlock
> 'lock_l0_stats' has been introduced. The allocation and initialization of
> the above structures is done in newly introduced kvmppc_init_hostwide() and
> similarly the cleanup is performed in newly introduced
> kvmppc_cleanup_hostwide().
> 
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_pmu.c | 189 +++++++++++++++++++++++++++++++
>  1 file changed, 189 insertions(+)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_pmu.c b/arch/powerpc/kvm/book3s_hv_pmu.c
> index e72542d5e750..f7fd5190ecf7 100644
> --- a/arch/powerpc/kvm/book3s_hv_pmu.c
> +++ b/arch/powerpc/kvm/book3s_hv_pmu.c
> @@ -27,10 +27,31 @@
>  #include <asm/plpar_wrappers.h>
>  #include <asm/firmware.h>
>  
> +#include "asm/guest-state-buffer.h"
> +
>  enum kvmppc_pmu_eventid {
>  	KVMPPC_EVENT_MAX,
>  };
>  
> +#define KVMPPC_PMU_EVENT_ATTR(_name, _id) \
> +	PMU_EVENT_ATTR_ID(_name, power_events_sysfs_show, _id)
> +
> +/* Holds the hostwide stats */
> +static struct kvmppc_hostwide_stats {
> +	u64 guest_heap;
> +	u64 guest_heap_max;
> +	u64 guest_pgtable_size;
> +	u64 guest_pgtable_size_max;
> +	u64 guest_pgtable_reclaim;
> +} l0_stats;
> +
> +/* Protect access to l0_stats */
> +static DEFINE_SPINLOCK(lock_l0_stats);
> +
> +/* GSB related structs needed to talk to L0 */
> +static struct kvmppc_gs_msg *gsm_l0_stats;
> +static struct kvmppc_gs_buff *gsb_l0_stats;
> +
>  static struct attribute *kvmppc_pmu_events_attr[] = {
>  	NULL,
>  };
> @@ -90,6 +111,167 @@ static void kvmppc_pmu_read(struct perf_event *event)
>  {
>  }
>  
> +/* Return the size of the needed guest state buffer */
> +static size_t hostwide_get_size(struct kvmppc_gs_msg *gsm)
> +
> +{
> +	size_t size = 0;
> +	const u16 ids[] = {
> +		KVMPPC_GSID_L0_GUEST_HEAP,
> +		KVMPPC_GSID_L0_GUEST_HEAP_MAX,
> +		KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE,
> +		KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX,
> +		KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM
> +	};
> +
> +	for (int i = 0; i < ARRAY_SIZE(ids); i++)
> +		size += kvmppc_gse_total_size(kvmppc_gsid_size(ids[i]));
> +	return size;
> +}
> +
> +/* Populate the request guest state buffer */
> +static int hostwide_fill_info(struct kvmppc_gs_buff *gsb,
> +			      struct kvmppc_gs_msg *gsm)
> +{
> +	struct kvmppc_hostwide_stats  *stats = gsm->data;
> +
> +	/*
> +	 * It doesn't matter what values are put into request buffer as
> +	 * they are going to be overwritten anyways. But for the sake of
> +	 * testcode and symmetry contents of existing stats are put
> +	 * populated into the request guest state buffer.
> +	 */
> +	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_HEAP))
> +		kvmppc_gse_put_u64(gsb, KVMPPC_GSID_L0_GUEST_HEAP,
> +				   stats->guest_heap);
> +	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_HEAP_MAX))
> +		kvmppc_gse_put_u64(gsb, KVMPPC_GSID_L0_GUEST_HEAP_MAX,
> +				   stats->guest_heap_max);
> +	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE))
> +		kvmppc_gse_put_u64(gsb, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE,
> +				   stats->guest_pgtable_size);
> +	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX))
> +		kvmppc_gse_put_u64(gsb, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX,
> +				   stats->guest_pgtable_size_max);
> +	if (kvmppc_gsm_includes(gsm, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM))
> +		kvmppc_gse_put_u64(gsb, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM,
> +				   stats->guest_pgtable_reclaim);
> +
> +	return 0;
> +}

kvmppc_gse_put_u64() can return an error. I think we can handle it just
like gs_msg_ops_vcpu_fill_info()

> +
> +/* Parse and update the host wide stats from returned gsb */
> +static int hostwide_refresh_info(struct kvmppc_gs_msg *gsm,
> +				 struct kvmppc_gs_buff *gsb)
> +{
> +	struct kvmppc_gs_parser gsp = { 0 };
> +	struct kvmppc_hostwide_stats *stats = gsm->data;
> +	struct kvmppc_gs_elem *gse;
> +	int rc;
> +
> +	rc = kvmppc_gse_parse(&gsp, gsb);
> +	if (rc < 0)
> +		return rc;
> +
> +	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_HEAP);
> +	if (gse)
> +		stats->guest_heap = kvmppc_gse_get_u64(gse);
> +
> +	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
> +	if (gse)
> +		stats->guest_heap_max = kvmppc_gse_get_u64(gse);
> +
> +	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
> +	if (gse)
> +		stats->guest_pgtable_size = kvmppc_gse_get_u64(gse);
> +
> +	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
> +	if (gse)
> +		stats->guest_pgtable_size_max = kvmppc_gse_get_u64(gse);
> +
> +	gse = kvmppc_gsp_lookup(&gsp, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
> +	if (gse)
> +		stats->guest_pgtable_reclaim = kvmppc_gse_get_u64(gse);
> +
> +	return 0;
> +}
> +
> +/* gsb-message ops for setting up/parsing */
> +static struct kvmppc_gs_msg_ops gsb_ops_l0_stats = {
> +	.get_size = hostwide_get_size,
> +	.fill_info = hostwide_fill_info,
> +	.refresh_info = hostwide_refresh_info,
> +};
> +
> +static int kvmppc_init_hostwide(void)
> +{
> +	int rc = 0;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&lock_l0_stats, flags);
> +
> +	/* already registered ? */
> +	if (gsm_l0_stats) {
> +		rc = 0;
> +		goto out;
> +	}
> +
> +	/* setup the Guest state message/buffer to talk to L0 */
> +	gsm_l0_stats = kvmppc_gsm_new(&gsb_ops_l0_stats, &l0_stats,
> +				      GSM_SEND, GFP_KERNEL);
> +	if (!gsm_l0_stats) {
> +		rc = -ENOMEM;
> +		goto out;
> +	}
> +
> +	/* Populate the Idents */
> +	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_HEAP);
> +	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_HEAP_MAX);
> +	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE);
> +	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_SIZE_MAX);
> +	kvmppc_gsm_include(gsm_l0_stats, KVMPPC_GSID_L0_GUEST_PGTABLE_RECLAIM);
> +
> +	/* allocate GSB. Guest/Vcpu Id is ignored */
> +	gsb_l0_stats = kvmppc_gsb_new(kvmppc_gsm_size(gsm_l0_stats), 0, 0,
> +				      GFP_KERNEL);
> +	if (!gsb_l0_stats) {
> +		rc = -ENOMEM;
> +		goto out;
> +	}
> +
> +	/* ask the ops to fill in the info */
> +	rc = kvmppc_gsm_fill_info(gsm_l0_stats, gsb_l0_stats);
> +	if (rc)
> +		goto out;
> +out:
> +	if (rc) {
> +		if (gsm_l0_stats)
> +			kvmppc_gsm_free(gsm_l0_stats);
> +		if (gsb_l0_stats)
> +			kvmppc_gsb_free(gsb_l0_stats);
> +		gsm_l0_stats = NULL;
> +		gsb_l0_stats = NULL;
> +	}
> +	spin_unlock_irqrestore(&lock_l0_stats, flags);
> +	return rc;
> +}

The error handling can probably be simplified to avoid multiple ifs:

<snip>

     /* allocate GSB. Guest/Vcpu Id is ignored */
     gsb_l0_stats = kvmppc_gsb_new(kvmppc_gsm_size(gsm_l0_stats), 0, 0,
                                   GFP_KERNEL);
     if (!gsb_l0_stats) {
             rc = -ENOMEM;
             goto err_gsm;
     }

     /* ask the ops to fill in the info */
     rc = kvmppc_gsm_fill_info(gsm_l0_stats, gsb_l0_stats);
     if (!rc)
             goto out;

err_gsb:
     kvmppc_gsb_free(gsb_l0_stats);
     gsb_l0_stats = NULL;

err_gsm:
     kvmppc_gsm_free(gsm_l0_stats);
     gsm_l0_stats = NULL;

out:
     spin_unlock_irqrestore(&lock_l0_stats, flags);
     return rc;
}

> +
> +static void kvmppc_cleanup_hostwide(void)
> +{
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&lock_l0_stats, flags);
> +
> +	if (gsm_l0_stats)
> +		kvmppc_gsm_free(gsm_l0_stats);
> +	if (gsb_l0_stats)
> +		kvmppc_gsb_free(gsb_l0_stats);
> +	gsm_l0_stats = NULL;
> +	gsb_l0_stats = NULL;
> +
> +	spin_unlock_irqrestore(&lock_l0_stats, flags);
> +}
> +
>  /* L1 wide counters PMU */
>  static struct pmu kvmppc_pmu = {
>  	.task_ctx_nr = perf_sw_context,
> @@ -108,6 +290,10 @@ int kvmppc_register_pmu(void)
>  
>  	/* only support events for nestedv2 right now */
>  	if (kvmhv_is_nestedv2()) {
> +		rc = kvmppc_init_hostwide();
> +		if (rc)
> +			goto out;
> +
>  		/* Setup done now register the PMU */
>  		pr_info("Registering kvm-hv pmu");
>  
> @@ -117,6 +303,7 @@ int kvmppc_register_pmu(void)
>  					       -1) : 0;
>  	}
>  
> +out:
>  	return rc;
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_register_pmu);
> @@ -124,6 +311,8 @@ EXPORT_SYMBOL_GPL(kvmppc_register_pmu);
>  void kvmppc_unregister_pmu(void)
>  {
>  	if (kvmhv_is_nestedv2()) {
> +		kvmppc_cleanup_hostwide();
> +
>  		if (kvmppc_pmu.type != -1)
>  			perf_pmu_unregister(&kvmppc_pmu);
>  
> -- 
> 2.47.1
> 

