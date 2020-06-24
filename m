Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 683DE207544
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 16:07:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sQ2F5P7wzDqlV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 00:07:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sPxm3QWFzDqgf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 00:03:23 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05OE2svS002277; Wed, 24 Jun 2020 10:03:15 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31uwymjp78-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 10:03:13 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05OE0UJD027415;
 Wed, 24 Jun 2020 14:03:10 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 31uus50qdy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 14:03:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05OE38g346334048
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 14:03:08 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7B32EA405B;
 Wed, 24 Jun 2020 14:03:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7223A4073;
 Wed, 24 Jun 2020 14:03:05 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.199.41.174])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 24 Jun 2020 14:03:05 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Wed, 24 Jun 2020 19:33:04 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 2/2] powerpc/papr_scm: Add support for fetching nvdimm
 'fuel-gauge' metric
In-Reply-To: <20200623191410.GH3910394@iweiny-DESK2.sc.intel.com>
References: <20200622042451.22448-1-vaibhav@linux.ibm.com>
 <20200622042451.22448-3-vaibhav@linux.ibm.com>
 <20200623191410.GH3910394@iweiny-DESK2.sc.intel.com>
Date: Wed, 24 Jun 2020 19:33:03 +0530
Message-ID: <87d05oo92g.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_07:2020-06-24,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 cotscore=-2147483648 spamscore=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxlogscore=999 clxscore=1015 phishscore=0
 lowpriorityscore=0 suspectscore=22 bulkscore=0 mlxscore=0 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240098
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for reviewing this patch Ira,

My responses below:

Ira Weiny <ira.weiny@intel.com> writes:

[snip]
>> +static int papr_pdsm_fuel_gauge(struct papr_scm_priv *p,
>> +				union nd_pdsm_payload *payload)
>> +{
>> +	int rc, size;
>> +	struct papr_scm_perf_stat *stat;
>> +	struct papr_scm_perf_stats *stats;
>> +
>> +	/* Silently fail if fetching performance metrics isn't  supported */
>> +	if (!p->len_stat_buffer)
>> +		return 0;
>> +
>> +	/* Allocate request buffer enough to hold single performance stat */
>> +	size = sizeof(struct papr_scm_perf_stats) +
>> +		sizeof(struct papr_scm_perf_stat);
>> +
>> +	stats = kzalloc(size, GFP_KERNEL);
>> +	if (!stats)
>> +		return -ENOMEM;
>> +
>> +	stat = &stats->scm_statistic[0];
>> +	memcpy(&stat->statistic_id, "MemLife ", sizeof(stat->statistic_id));
>> +	stat->statistic_value = 0;
>> +
>> +	/* Fetch the fuel gauge and populate it in payload */
>> +	rc = drc_pmem_query_stats(p, stats, size, 1, NULL);
>> +	if (!rc) {
>
> Always best to except the error case...
>
> 	if (rc) {
> 		... print debuging from below...
> 		goto free_stats;
> 	}
>
Sure, I don't feel strongly about it. Will update this in v2.

>> +		dev_dbg(&p->pdev->dev,
>> +			"Fetched fuel-gauge %llu", stat->statistic_value);
>> +		payload->health.extension_flags |=
>> +			PDSM_DIMM_HEALTH_RUN_GAUGE_VALID;
>> +		payload->health.dimm_fuel_gauge = stat->statistic_value;
>> +
>> +		rc = sizeof(struct nd_papr_pdsm_health);
>> +	}
>> +
>
> free_stats:
>
>> +	kfree(stats);
>> +	return rc;
>> +}
>> +
>>  /* Fetch the DIMM health info and populate it in provided package. */
>>  static int papr_pdsm_health(struct papr_scm_priv *p,
>>  			    union nd_pdsm_payload *payload)
>> @@ -546,6 +585,14 @@ static int papr_pdsm_health(struct papr_scm_priv *p,
>>  
>>  	/* struct populated hence can release the mutex now */
>>  	mutex_unlock(&p->health_mutex);
>> +
>> +	/* Populate the fuel gauge meter in the payload */
>> +	rc = papr_pdsm_fuel_gauge(p, payload);
>> +
>> +	/* Error fetching fuel gauge is not fatal */
>> +	if (rc < 0)
>> +		dev_dbg(&p->pdev->dev, "Err(%d) fetching fuel gauge\n", rc);
>
> Why even return an error?  Just have *_fuel_guage() the print the debugging and
> return void.
>
papr_pdsm_fuel_gauge uses the same signature as other PDSM service
functions as described in pdsm_cmd_desc.service callback. Hence designed
the function signature as such.

>> +
>>  	rc = sizeof(struct nd_papr_pdsm_health);
>
> You just override rc here anyway...
>
> Ira
>
>>  
>>  out:
>> -- 
>> 2.26.2
>> _______________________________________________
>> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
>> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org

-- 
Cheers
~ Vaibhav
