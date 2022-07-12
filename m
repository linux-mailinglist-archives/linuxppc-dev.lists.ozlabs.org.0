Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 913485711C6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 07:16:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lhps53VrSz3c6H
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jul 2022 15:16:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j6EK2W4z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=j6EK2W4z;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LhprL1bBKz3bsK
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Jul 2022 15:16:17 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26C5CK8n029516;
	Tue, 12 Jul 2022 05:15:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=LjCncoQYfgjpxTi/KkBbwYehv1N9u1L+plXflGjtKuE=;
 b=j6EK2W4zrXukmh35WzmZHoGhVNzA38T2xheTOLZ8QVqrLOywd6g5IBQraopfpS5CG1t6
 YxFLYnHec35Gd+gQG7pZSGUEOZcOOaWnsJpNSHHXKawYjtNnitdGuUxm+PGUIMaJ7ZYU
 DrT17FGvO5k4Rx//Fj/tUvnz5eexIzj0KYOVj7f+QVjN+QXVAOcXOd0gWGtYbGGxUd7T
 ZVLniH2nRQqyWrzOcSb2TmrBKnGZ/96sx7nR7YhH0tIHB6i5Ih8fctv+pFCLJBgF4ei9
 km7SylQ3bHu6xa/FWrcHZaK3v2mSdG8kNJ9SYbxfw+Nrk7z80qEP1Q65A/hcHbLmD2W3 gQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h92kmg243-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 05:15:52 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26C57LMd026547;
	Tue, 12 Jul 2022 05:15:50 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma03ams.nl.ibm.com with ESMTP id 3h71a8umxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Jul 2022 05:15:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26C5Flpu18612534
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 12 Jul 2022 05:15:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 223A34203F;
	Tue, 12 Jul 2022 05:15:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4F11B42042;
	Tue, 12 Jul 2022 05:15:41 +0000 (GMT)
Received: from vajain21.in.ibm.com (unknown [9.211.127.138])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
	Tue, 12 Jul 2022 05:15:40 +0000 (GMT)
Received: by vajain21.in.ibm.com (sSMTP sendmail emulation); Tue, 12 Jul 2022 10:45:39 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/papr_scm: Fix nvdimm event mappings
In-Reply-To: <20220711034605.212683-1-kjain@linux.ibm.com>
References: <20220711034605.212683-1-kjain@linux.ibm.com>
Date: Tue, 12 Jul 2022 10:45:39 +0530
Message-ID: <87czeac3no.fsf@vajain21.in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: VPxp-3WT8t2B2ViH7xEhrwhfP7p35av2
X-Proofpoint-GUID: VPxp-3WT8t2B2ViH7xEhrwhfP7p35av2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-12_03,2022-07-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 clxscore=1011 phishscore=0 bulkscore=0 adultscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 suspectscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2206140000 definitions=main-2207120020
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
Cc: nvdimm@lists.linux.dev, atrajeev@linux.vnet.ibm.com, rnsastry@linux.ibm.com, kjain@linux.ibm.com, maddy@linux.ibm.com, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, dan.j.williams@intel.com, disgoel@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kajol,

Thanks for the patch. Minor review comment below:

Kajol Jain <kjain@linux.ibm.com> writes:

> Commit 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
> added performance monitoring support for papr-scm nvdimm devices via
> perf interface. Commit also added an array in papr_scm_priv
> structure called "nvdimm_events_map", which got filled based on the
> result of H_SCM_PERFORMANCE_STATS hcall. 
>
> Currently there is an assumption that the order of events in the
> stats buffer, returned by the hypervisor is same. And that order also
> matches with the events specified in nvdimm driver code. 
> But this assumption is not documented anywhere in Power Architecture
> Platform Requirements (PAPR) document. Although the order
> of events happens to be same on current systems, but it might
> not be true in future generation systems. Fix the issue, by
> adding a static mapping for nvdimm events to corresponding stat-id,
> and removing the dynamic map from papr_scm_priv structure.
>
> Fixes: 4c08d4bbc089 ("powerpc/papr_scm: Add perf interface support")
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>

<snip>
> @@ -460,10 +480,9 @@ static void papr_scm_pmu_del(struct perf_event *event, int flags)
>  
>  static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu *nd_pmu)
>  {
> -	struct papr_scm_perf_stat *stat;
>  	struct papr_scm_perf_stats *stats;
>  	u32 available_events;
> -	int index, rc = 0;
> +	int rc;
>  
>  	if (!p->stat_buffer_len)
>  		return -ENOENT;
> @@ -476,34 +495,12 @@ static int papr_scm_pmu_check_events(struct papr_scm_priv *p, struct nvdimm_pmu
>  	/* Allocate the buffer for phyp where stats are written */
>  	stats = kzalloc(p->stat_buffer_len, GFP_KERNEL);
>  	if (!stats) {
> -		rc = -ENOMEM;
> -		return rc;
> +		return -ENOMEM;
>  	}
>  
>  	/* Called to get list of events supported */
>  	rc = drc_pmem_query_stats(p, stats, 0);
> -	if (rc)
> -		goto out;
> -
> -	/*
> -	 * Allocate memory and populate nvdimm_event_map.
> -	 * Allocate an extra element for NULL entry
> -	 */
> -	p->nvdimm_events_map = kcalloc(available_events + 1,
> -				       sizeof(stat->stat_id),
> -				       GFP_KERNEL);
> -	if (!p->nvdimm_events_map) {
> -		rc = -ENOMEM;
> -		goto out;
> -	}
>  
> -	/* Copy all stat_ids to event map */
> -	for (index = 0, stat = stats->scm_statistic;
> -	     index < available_events; index++, ++stat) {
> -		memcpy(&p->nvdimm_events_map[index * sizeof(stat->stat_id)],
> -		       &stat->stat_id, sizeof(stat->stat_id));
> -	}
> -out:
>  	kfree(stats);
>  	return rc;
>  }

Earlier implementation of papr_scm_pmu_check_events() would copy the
contents of returned stat-ids to struct papr_scm_priv->nvdimm_events_map,
hence it was needed.

With static events map you dont really need to call
drc_pmem_query_stats() as that would have been already being done once
in papr_scm_probe() before papr_scm_pmu_register() is called:


papr_scm_probe()
{
...
	/* Try retrieving the stat buffer and see if its supported */
	stat_size = drc_pmem_query_stats(p, NULL, 0);
...
        papr_scm_pmu_register(p);
...
}

I would suggest replacing single callsite of papr_scm_pmu_check_events()
with the check

     if (!p->stat_buffer_len)
		goto pmu_check_events_err;

<snip>

-- 
Cheers
~ Vaibhav
