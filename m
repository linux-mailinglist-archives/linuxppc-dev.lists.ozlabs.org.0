Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B980323DB54
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 17:24:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMsjz1dJzzDq8W
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 01:24:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMsbG41xqzDqnp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 01:19:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TJY2ZsbE; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BMsbD3bfHz8sWN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 01:19:04 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BMsbD1v2wz9sSG; Fri,  7 Aug 2020 01:19:04 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TJY2ZsbE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BMsbC5ffCz9sR4
 for <linuxppc-dev@ozlabs.org>; Fri,  7 Aug 2020 01:19:03 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076F3ap3017450
 for <linuxppc-dev@ozlabs.org>; Thu, 6 Aug 2020 11:19:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=PX+NaAA5vcUNrVBJLxssHhNfS9VcGO/Qmckwa+BQAzk=;
 b=TJY2ZsbEtTvSA0QjvX8Jx7yuSlKujl5/X6qB+cVe1EloWcUqIBLwAt5YwDkq6zcDPnNE
 oypr5ZKkiQ6obHiIYpgXDsR2t6esP26co38oU6hUwr5kLNEHs/Q9hxo2h0Jv/sVFlmdl
 nY82Rbq7dBRUPy+jhhPv3Hs57KKmNtsbHx+6nD/Jwwt51AdLwhxQh4DP4Q3df5BUn9AL
 UWXXTCH1iI6Iux0YRfiuq+r8mxIVNqaTXYSJaaQ8+K5huqwJydD+EieTSAzE23rTzfDA
 BVl5cvVeeObdQ50sXFr38Rfesv+DTSBUZD+NyXC4ljtHmLUecTLrxAchvtzR6U/PF0I5 LQ== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32raves7bm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 06 Aug 2020 11:19:01 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 076FArqZ004943
 for <linuxppc-dev@ozlabs.org>; Thu, 6 Aug 2020 15:19:01 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma03dal.us.ibm.com with ESMTP id 32n019n0gx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 06 Aug 2020 15:19:01 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 076FJ0Ib57541100
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Aug 2020 15:19:00 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D90C124058;
 Thu,  6 Aug 2020 15:19:00 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2057C124052;
 Thu,  6 Aug 2020 15:19:00 +0000 (GMT)
Received: from localhost (unknown [9.65.243.213])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Aug 2020 15:19:00 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v2 2/2] powerpc/pseries: new lparcfg key/value pair:
 partition_affinity_score
In-Reply-To: <20200727184605.2945095-2-cheloha@linux.ibm.com>
References: <20200727184605.2945095-1-cheloha@linux.ibm.com>
 <20200727184605.2945095-2-cheloha@linux.ibm.com>
Date: Thu, 06 Aug 2020 10:18:59 -0500
Message-ID: <87v9hvztss.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_09:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 bulkscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 adultscore=0 impostorscore=0
 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008060104
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
Cc: Tyrel Datwylder <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Scott Cheloha <cheloha@linux.ibm.com> writes:
> The H_GetPerformanceCounterInfo (GPCI) PHYP hypercall has a subcall,
> Affinity_Domain_Info_By_Partition, which returns, among other things,
> a "partition affinity score" for a given LPAR.  This score, a value on
> [0-100], represents the processor-memory affinity for the LPAR in
> question.  A score of 0 indicates the worst possible affinity while a
> score of 100 indicates perfect affinity.  The score can be used to
> reason about performance.
>
> This patch adds the score for the local LPAR to the lparcfg procfile
> under a new 'partition_affinity_score' key.
>
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/lparcfg.c | 35 ++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
> index b8d28ab88178..e278390ab28d 100644
> --- a/arch/powerpc/platforms/pseries/lparcfg.c
> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
> @@ -136,6 +136,39 @@ static unsigned int h_get_ppp(struct hvcall_ppp_data *ppp_data)
>  	return rc;
>  }
>  
> +static void show_gpci_data(struct seq_file *m)
> +{
> +	struct hv_gpci_request_buffer *buf;
> +	unsigned int affinity_score;
> +	long ret;
> +
> +	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
> +	if (buf == NULL)
> +		return;
> +
> +	/*
> +	 * Show the local LPAR's affinity score.
> +	 *
> +	 * 0xB1 selects the Affinity_Domain_Info_By_Partition subcall.
> +	 * The score is at byte 0xB in the output buffer.
> +	 */
> +	memset(&buf->params, 0, sizeof(buf->params));
> +	buf->params.counter_request = cpu_to_be32(0xB1);
> +	buf->params.starting_index = cpu_to_be32(-1);	/* local LPAR */
> +	buf->params.counter_info_version_in = 0x5;	/* v5+ for score */
> +	ret = plpar_hcall_norets(H_GET_PERF_COUNTER_INFO, virt_to_phys(buf),
> +				 sizeof(*buf));
> +	if (ret != H_SUCCESS) {
> +		pr_debug("hcall failed: H_GET_PERF_COUNTER_INFO: %ld, %x\n",
> +			 ret, be32_to_cpu(buf->params.detail_rc));
> +		goto out;
> +	}
> +	affinity_score = buf->bytes[0xB];
> +	seq_printf(m, "partition_affinity_score=%u\n", affinity_score);
> +out:
> +	kfree(buf);
> +}
> +
>  static unsigned h_pic(unsigned long *pool_idle_time,
>  		      unsigned long *num_procs)
>  {
> @@ -487,6 +520,8 @@ static int pseries_lparcfg_data(struct seq_file *m, void *v)
>  			   partition_active_processors * 100);
>  	}
>  
> +	show_gpci_data(m);
> +
>  	seq_printf(m, "partition_active_processors=%d\n",
>  		   partition_active_processors);

Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
