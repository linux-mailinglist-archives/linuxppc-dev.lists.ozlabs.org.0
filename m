Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8641035E10A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 16:13:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKSJg3ptjz3c0P
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 00:13:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ceq1lmjz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ceq1lmjz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKSJC0hy2z2yy3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 00:13:30 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DE3o7c078206; Tue, 13 Apr 2021 10:13:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : content-type :
 mime-version; s=pp1; bh=qCwho+zdQA1woetDtcnmM2qFn9qA1gliGD7C5XR1INs=;
 b=ceq1lmjzu2g35WAnL+b3f6bch1tQj0cciGALzNuG4CqmPyuW3DOgbV5zzxilqeNzKHuz
 yugsSl+mBdQSTSeIkiS/geXI9RdMQOeGaP2j3xzUaSFQWlhhBPGBx6w3W0VgtYsCbryG
 SnAwydzMWrHHzgOfv0/D+WdhhdA3zPw8zz9oc7nW0aAIryv+O0vNKypdoE99/6Exdi+7
 WMuUnWyyhimIhkpIFeush4XdPs+DHWURSV4TgKqDuskMQhdlkqhdoS2RdGA3KYoy++WU
 SWYSYJEj2Inf2ygI392gv8Jb2AA4w21Hkg/SYAVgXahHkOto7c587fMEGXfoLCGf/R7J GA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wc8cheu4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 10:13:27 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DECjoI020242;
 Tue, 13 Apr 2021 14:13:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 37u3n89ep3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 14:13:24 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DEDLs833227062
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 14:13:21 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E80A4C05E;
 Tue, 13 Apr 2021 14:13:21 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E42EF4C058;
 Tue, 13 Apr 2021 14:13:18 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.85.68.204])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 13 Apr 2021 14:13:18 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation);
 Tue, 13 Apr 2021 19:43:18 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Shivaprasad G Bhat <sbhat@linux.ibm.com>, sbhat@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org,
 linux-nvdimm@lists.01.org, aneesh.kumar@linux.ibm.com, ellerman@au1.ibm.com
Subject: Re: [PATCH v3] powerpc/papr_scm: Implement support for H_SCM_FLUSH
 hcall
In-Reply-To: <161703936121.36.7260632399582101498.stgit@e1fbed493c87>
References: <161703936121.36.7260632399582101498.stgit@e1fbed493c87>
Date: Tue, 13 Apr 2021 19:43:17 +0530
Message-ID: <87sg3ujmrm.fsf@vajain21.in.ibm.com>
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: YM85nM1gEjg_CuM1FOyY8xt9qk5V9MQy
X-Proofpoint-ORIG-GUID: YM85nM1gEjg_CuM1FOyY8xt9qk5V9MQy
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_07:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 clxscore=1015 adultscore=0
 mlxscore=0 mlxlogscore=999 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130100
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
Cc: linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shiva,

Apologies for a late review but something just caught my eye while
working on a different patch.

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
Does the hcall semantic also include measures to trigger a barrier/fence
(like pm_wmb()) so that all the stores before the hcall are gauranteed
to have hit the pmem controller ?

If not then the papr_scm_pmem_flush() introduced below should issue a
fence like pm_wmb() before issuing the flush hcall.

If yes then this behaviour should also be documented with the hcall
semantics above.

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
>

-- 
Cheers
~ Vaibhav
