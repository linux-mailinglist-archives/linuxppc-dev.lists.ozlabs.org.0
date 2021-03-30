Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5EB534E06C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 06:57:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8ccX6cq8z3c74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Mar 2021 15:57:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pZL7kRib;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pZL7kRib; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8cbw4xDYz3c4X
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Mar 2021 15:56:27 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12U4XjGh153202; Tue, 30 Mar 2021 00:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=ixon0YOaD+yk5jEcvTn+006DJtnnwrreLGNiOXPZZ8U=;
 b=pZL7kRibx+a9H6EimI/ezEXcfCF6QjiUayoDyvdmqxJPf0lE8LuGU2VsaIPLg3JHJsQl
 6kAWgj5vbVu5MPM6i7mgOSaS8epg8738DJSfbjbGt3DnbuZ2zYoOJOD4TLqWLuHV0c5i
 HIvSDOHERRIh9h8Svl4jUtupIcIcAh+EkLIHkpda05e0s1gW264vElQ9vFZ8Vydp12hR
 jMHXN/zimRKUJYxRXpBsy/ShCJmXkLa6NatoT86T+6wXFq+BNzAzNnIrSqiolYDCYQQ7
 xNcb5+I4jMCiHsdHPE9Lqj0KHgGKE7bV55I4myqn9x5QgXtcMm6wMKsMyzsiouMcfaJw fQ== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37jjb5m4wa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 00:56:23 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12U4pjkq017077;
 Tue, 30 Mar 2021 04:56:22 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03wdc.us.ibm.com with ESMTP id 37jqmn36fh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Mar 2021 04:56:22 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12U4uMQJ31130042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Mar 2021 04:56:22 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CA69124053;
 Tue, 30 Mar 2021 04:56:22 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F58A124055;
 Tue, 30 Mar 2021 04:56:19 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.199.52.226])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 30 Mar 2021 04:56:18 +0000 (GMT)
X-Mailer: emacs 28.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, sbhat@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 linux-nvdimm@lists.01.org, ellerman@au1.ibm.com
Subject: Re: [PATCH v3] powerpc/papr_scm: Implement support for H_SCM_FLUSH
 hcall
In-Reply-To: <161703936121.36.7260632399582101498.stgit@e1fbed493c87>
References: <161703936121.36.7260632399582101498.stgit@e1fbed493c87>
Date: Tue, 30 Mar 2021 10:26:16 +0530
Message-ID: <87mtul6xzj.fsf@linux.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: aPcBfXRo3onOJJbKX49psqOTu0g8NSFj
X-Proofpoint-ORIG-GUID: aPcBfXRo3onOJJbKX49psqOTu0g8NSFj
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-30_01:2021-03-26,
 2021-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 mlxscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2103250000
 definitions=main-2103300029
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
Cc: vaibhav@linux.ibm.com, linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Shivaprasad G Bhat <sbhat@linux.ibm.com> writes:

> Add support for ND_REGION_ASYNC capability if the device tree
> indicates 'ibm,hcall-flush-required' property in the NVDIMM node.
> Flush is done by issuing H_SCM_FLUSH hcall to the hypervisor.
>
> If the flush request failed, the hypervisor is expected to
> to reflect the problem in the subsequent nvdimm H_SCM_HEALTH call.
>
> This patch prevents mmap of namespaces with MAP_SYNC flag if the
> nvdimm requires an explicit flush[1].
>
> References:
> [1] https://github.com/avocado-framework-tests/avocado-misc-tests/blob/master/memory/ndctl.py.data/map_sync.c


Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

>
> Signed-off-by: Shivaprasad G Bhat <sbhat@linux.ibm.com>
> ---
> v2 - https://www.spinics.net/lists/kvm-ppc/msg18799.html
> Changes from v2:
>        - Fixed the commit message.
>        - Add dev_dbg before the H_SCM_FLUSH hcall
>
> v1 - https://www.spinics.net/lists/kvm-ppc/msg18272.html
> Changes from v1:
>        - Hcall semantics finalized, all changes are to accomodate them.
>
>  Documentation/powerpc/papr_hcalls.rst     |   14 ++++++++++
>  arch/powerpc/include/asm/hvcall.h         |    3 +-
>  arch/powerpc/platforms/pseries/papr_scm.c |   40 +++++++++++++++++++++++++++++
>  3 files changed, 56 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/powerpc/papr_hcalls.rst b/Documentation/powerpc/papr_hcalls.rst
> index 48fcf1255a33..648f278eea8f 100644
> --- a/Documentation/powerpc/papr_hcalls.rst
> +++ b/Documentation/powerpc/papr_hcalls.rst
> @@ -275,6 +275,20 @@ Health Bitmap Flags:
>  Given a DRC Index collect the performance statistics for NVDIMM and copy them
>  to the resultBuffer.
>  
> +**H_SCM_FLUSH**
> +
> +| Input: *drcIndex, continue-token*
> +| Out: *continue-token*
> +| Return Value: *H_SUCCESS, H_Parameter, H_P2, H_BUSY*
> +
> +Given a DRC Index Flush the data to backend NVDIMM device.
> +
> +The hcall returns H_BUSY when the flush takes longer time and the hcall needs
> +to be issued multiple times in order to be completely serviced. The
> +*continue-token* from the output to be passed in the argument list of
> +subsequent hcalls to the hypervisor until the hcall is completely serviced
> +at which point H_SUCCESS or other error is returned by the hypervisor.
> +
>  References
>  ==========
>  .. [1] "Power Architecture Platform Reference"
> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index ed6086d57b22..9f7729a97ebd 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -315,7 +315,8 @@
>  #define H_SCM_HEALTH            0x400
>  #define H_SCM_PERFORMANCE_STATS 0x418
>  #define H_RPT_INVALIDATE	0x448
> -#define MAX_HCALL_OPCODE	H_RPT_INVALIDATE
> +#define H_SCM_FLUSH		0x44C
> +#define MAX_HCALL_OPCODE	H_SCM_FLUSH
>  
>  /* Scope args for H_SCM_UNBIND_ALL */
>  #define H_UNBIND_SCOPE_ALL (0x1)
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> index 835163f54244..b7a47fcc5aa5 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -93,6 +93,7 @@ struct papr_scm_priv {
>  	uint64_t block_size;
>  	int metadata_size;
>  	bool is_volatile;
> +	bool hcall_flush_required;
>  
>  	uint64_t bound_addr;
>  
> @@ -117,6 +118,39 @@ struct papr_scm_priv {
>  	size_t stat_buffer_len;
>  };
>  
> +static int papr_scm_pmem_flush(struct nd_region *nd_region,
> +			       struct bio *bio __maybe_unused)
> +{
> +	struct papr_scm_priv *p = nd_region_provider_data(nd_region);
> +	unsigned long ret_buf[PLPAR_HCALL_BUFSIZE];
> +	uint64_t token = 0;
> +	int64_t rc;
> +
> +	dev_dbg(&p->pdev->dev, "flush drc 0x%x", p->drc_index);
> +
> +	do {
> +		rc = plpar_hcall(H_SCM_FLUSH, ret_buf, p->drc_index, token);
> +		token = ret_buf[0];
> +
> +		/* Check if we are stalled for some time */
> +		if (H_IS_LONG_BUSY(rc)) {
> +			msleep(get_longbusy_msecs(rc));
> +			rc = H_BUSY;
> +		} else if (rc == H_BUSY) {
> +			cond_resched();
> +		}
> +	} while (rc == H_BUSY);
> +
> +	if (rc) {
> +		dev_err(&p->pdev->dev, "flush error: %lld", rc);
> +		rc = -EIO;
> +	} else {
> +		dev_dbg(&p->pdev->dev, "flush drc 0x%x complete", p->drc_index);
> +	}
> +
> +	return rc;
> +}
> +
>  static LIST_HEAD(papr_nd_regions);
>  static DEFINE_MUTEX(papr_ndr_lock);
>  
> @@ -943,6 +977,11 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>  	ndr_desc.num_mappings = 1;
>  	ndr_desc.nd_set = &p->nd_set;
>  
> +	if (p->hcall_flush_required) {
> +		set_bit(ND_REGION_ASYNC, &ndr_desc.flags);
> +		ndr_desc.flush = papr_scm_pmem_flush;
> +	}
> +
>  	if (p->is_volatile)
>  		p->region = nvdimm_volatile_region_create(p->bus, &ndr_desc);
>  	else {
> @@ -1088,6 +1127,7 @@ static int papr_scm_probe(struct platform_device *pdev)
>  	p->block_size = block_size;
>  	p->blocks = blocks;
>  	p->is_volatile = !of_property_read_bool(dn, "ibm,cache-flush-required");
> +	p->hcall_flush_required = of_property_read_bool(dn, "ibm,hcall-flush-required");
>  
>  	/* We just need to ensure that set cookies are unique across */
>  	uuid_parse(uuid_str, (uuid_t *) uuid);
>
> _______________________________________________
> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org
