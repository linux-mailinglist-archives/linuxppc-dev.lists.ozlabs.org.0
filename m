Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C13223D401
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 00:44:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMRW82wxWzDqhF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 08:44:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMRTG4093zDqg5
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 08:42:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BMRTG2qt3z8sfr
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Aug 2020 08:42:26 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BMRTG2GnPz9sPC; Thu,  6 Aug 2020 08:42:26 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BMRTF6DW1z9sPB
 for <linuxppc-dev@ozlabs.org>; Thu,  6 Aug 2020 08:42:25 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 075MXo2l102804
 for <linuxppc-dev@ozlabs.org>; Wed, 5 Aug 2020 18:42:24 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32qu0vkjn8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 05 Aug 2020 18:42:24 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 075Mf1Xw030627
 for <linuxppc-dev@ozlabs.org>; Wed, 5 Aug 2020 22:42:23 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02dal.us.ibm.com with ESMTP id 32n019nhhh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 05 Aug 2020 22:42:23 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 075MgJv717891952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Aug 2020 22:42:19 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EE5906E065;
 Wed,  5 Aug 2020 22:42:21 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D78D6E04C;
 Wed,  5 Aug 2020 22:42:21 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.114.20])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Aug 2020 22:42:20 +0000 (GMT)
Subject: Re: [PATCH v2 2/2] powerpc/pseries: new lparcfg key/value pair:
 partition_affinity_score
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20200727184605.2945095-1-cheloha@linux.ibm.com>
 <20200727184605.2945095-2-cheloha@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <bc9858c9-7d55-88c0-1f85-157af48e1d8c@linux.ibm.com>
Date: Wed, 5 Aug 2020 15:42:20 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200727184605.2945095-2-cheloha@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-05_18:2020-08-03,
 2020-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 suspectscore=0
 phishscore=0 mlxscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008050164
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

On 7/27/20 11:46 AM, Scott Cheloha wrote:
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

I was hoping Michael would chime in the first time around on this patch series
about adding another key/value pair to lparcfg. So, barring a NACK from mpe:

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

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
>  
> 

