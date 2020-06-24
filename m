Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B95D20768E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 17:04:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sRJc4Wq1zDql5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 01:04:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sRB80Pz9zDqjR
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 00:59:11 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05OEZrMC091426; Wed, 24 Jun 2020 10:59:08 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31uwys4kt8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 10:59:07 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05OEti1g013512;
 Wed, 24 Jun 2020 14:59:05 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 31uusg0c3j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 14:59:04 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05OEx2dH59834390
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 14:59:02 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B09AAE056;
 Wed, 24 Jun 2020 14:59:02 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BAC0AE051;
 Wed, 24 Jun 2020 14:59:00 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.85.73.15])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 24 Jun 2020 14:58:59 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Wed, 24 Jun 2020 20:28:57 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: Ira Weiny <ira.weiny@intel.com>
Subject: Re: [PATCH 1/2] powerpc/papr_scm: Fetch nvdimm performance stats from
 PHYP
In-Reply-To: <20200623190255.GG3910394@iweiny-DESK2.sc.intel.com>
References: <20200622042451.22448-1-vaibhav@linux.ibm.com>
 <20200622042451.22448-2-vaibhav@linux.ibm.com>
 <20200623190255.GG3910394@iweiny-DESK2.sc.intel.com>
Date: Wed, 24 Jun 2020 20:28:57 +0530
Message-ID: <877dvwo6ha.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_08:2020-06-24,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=7 spamscore=0
 cotscore=-2147483648 mlxscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006240102
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

My responses below inline.

Ira Weiny <ira.weiny@intel.com> writes:

> On Mon, Jun 22, 2020 at 09:54:50AM +0530, Vaibhav Jain wrote:
>> Update papr_scm.c to query dimm performance statistics from PHYP via
>> H_SCM_PERFORMANCE_STATS hcall and export them to user-space as PAPR
>> specific NVDIMM attribute 'perf_stats' in sysfs. The patch also
>> provide a sysfs ABI documentation for the stats being reported and
>> their meanings.
>> 
>> During NVDIMM probe time in papr_scm_nvdimm_init() a special variant
>> of H_SCM_PERFORMANCE_STATS hcall is issued to check if collection of
>> performance statistics is supported or not. If successful then a PHYP
>> returns a maximum possible buffer length needed to read all
>> performance stats. This returned value is stored in a per-nvdimm
>> attribute 'len_stat_buffer'.
>> 
>> The layout of request buffer for reading NVDIMM performance stats from
>> PHYP is defined in 'struct papr_scm_perf_stats' and 'struct
>> papr_scm_perf_stat'. These structs are used in newly introduced
>> drc_pmem_query_stats() that issues the H_SCM_PERFORMANCE_STATS hcall.
>> 
>> The sysfs access function perf_stats_show() uses value
>> 'len_stat_buffer' to allocate a buffer large enough to hold all
>> possible NVDIMM performance stats and passes it to
>> drc_pmem_query_stats() to populate. Finally statistics reported in the
>> buffer are formatted into the sysfs access function output buffer.
>> 
>> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
>> ---
>>  Documentation/ABI/testing/sysfs-bus-papr-pmem |  27 ++++
>>  arch/powerpc/platforms/pseries/papr_scm.c     | 139 ++++++++++++++++++
>>  2 files changed, 166 insertions(+)
>> 
>> diff --git a/Documentation/ABI/testing/sysfs-bus-papr-pmem b/Documentation/ABI/testing/sysfs-bus-papr-pmem
>> index 5b10d036a8d4..c1a67275c43f 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-papr-pmem
>> +++ b/Documentation/ABI/testing/sysfs-bus-papr-pmem
>> @@ -25,3 +25,30 @@ Description:
>>  				  NVDIMM have been scrubbed.
>>  		* "locked"	: Indicating that NVDIMM contents cant
>>  				  be modified until next power cycle.
>> +
>> +What:		/sys/bus/nd/devices/nmemX/papr/perf_stats
>> +Date:		May, 2020
>> +KernelVersion:	v5.9
>> +Contact:	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-nvdimm@lists.01.org,
>> +Description:
>> +		(RO) Report various performance stats related to papr-scm NVDIMM
>> +		device.  Each stat is reported on a new line with each line
>> +		composed of a stat-identifier followed by it value. Below are
>> +		currently known dimm performance stats which are reported:
>> +
>> +		* "CtlResCt" : Controller Reset Count
>> +		* "CtlResTm" : Controller Reset Elapsed Time
>> +		* "PonSecs " : Power-on Seconds
>> +		* "MemLife " : Life Remaining
>> +		* "CritRscU" : Critical Resource Utilization
>> +		* "HostLCnt" : Host Load Count
>> +		* "HostSCnt" : Host Store Count
>> +		* "HostSDur" : Host Store Duration
>> +		* "HostLDur" : Host Load Duration
>> +		* "MedRCnt " : Media Read Count
>> +		* "MedWCnt " : Media Write Count
>> +		* "MedRDur " : Media Read Duration
>> +		* "MedWDur " : Media Write Duration
>> +		* "CchRHCnt" : Cache Read Hit Count
>> +		* "CchWHCnt" : Cache Write Hit Count
>> +		* "FastWCnt" : Fast Write Count
>> \ No newline at end of file
>> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
>> index 9c569078a09f..cb3f9acc325b 100644
>> --- a/arch/powerpc/platforms/pseries/papr_scm.c
>> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
>> @@ -62,6 +62,24 @@
>>  				    PAPR_PMEM_HEALTH_FATAL |	\
>>  				    PAPR_PMEM_HEALTH_UNHEALTHY)
>>  
>> +#define PAPR_SCM_PERF_STATS_EYECATCHER __stringify(SCMSTATS)
>> +#define PAPR_SCM_PERF_STATS_VERSION 0x1
>> +
>> +/* Struct holding a single performance metric */
>> +struct papr_scm_perf_stat {
>> +	u8 statistic_id[8];
>> +	u64 statistic_value;
>> +};
>> +
>> +/* Struct exchanged between kernel and PHYP for fetching drc perf stats */
>> +struct papr_scm_perf_stats {
>> +	u8 eye_catcher[8];
>> +	u32 stats_version;		/* Should be 0x01 */
>                                                      ^^^^
> 				     PAPR_SCM_PERF_STATS_VERSION?
Sure. Will update in v2

>
>> +	u32 num_statistics;		/* Number of stats following */
>> +	/* zero or more performance matrics */
>> +	struct papr_scm_perf_stat scm_statistic[];
>> +} __packed;
>> +
>>  /* private struct associated with each region */
>>  struct papr_scm_priv {
>>  	struct platform_device *pdev;
>> @@ -89,6 +107,9 @@ struct papr_scm_priv {
>>  
>>  	/* Health information for the dimm */
>>  	u64 health_bitmap;
>> +
>> +	/* length of the stat buffer as expected by phyp */
>> +	size_t len_stat_buffer;
>>  };
>>  
>>  static int drc_pmem_bind(struct papr_scm_priv *p)
>> @@ -194,6 +215,75 @@ static int drc_pmem_query_n_bind(struct papr_scm_priv *p)
>>  	return drc_pmem_bind(p);
>>  }
>>  
>> +/*
>> + * Query the Dimm performance stats from PHYP and copy them (if returned) to
>> + * provided struct papr_scm_perf_stats instance 'stats' of 'size' in bytes.
>> + * The value of R4 is copied to 'out' if the pointer is provided.
>> + */
>> +static int drc_pmem_query_stats(struct papr_scm_priv *p,
>> +				struct papr_scm_perf_stats *buff_stats,
>> +				size_t size, unsigned int num_stats,
>> +				uint64_t *out)
>> +{
>> +	unsigned long ret[PLPAR_HCALL_BUFSIZE];
>> +	struct papr_scm_perf_stat *stats;
>> +	s64 rc, i;
>> +
>> +	/* Setup the out buffer */
>> +	if (buff_stats) {
>> +		memcpy(buff_stats->eye_catcher,
>> +		       PAPR_SCM_PERF_STATS_EYECATCHER, 8);
>> +		buff_stats->stats_version =
>> +			cpu_to_be32(PAPR_SCM_PERF_STATS_VERSION);
>> +		buff_stats->num_statistics =
>> +			cpu_to_be32(num_stats);
>> +	} else {
>> +		/* In case of no out buffer ignore the size */
>> +		size = 0;
>> +	}
>> +
>> +	/*
>> +	 * Do the HCALL asking PHYP for info and if R4 was requested
>> +	 * return its value in 'out' variable.
>> +	 */
>> +	rc = plpar_hcall(H_SCM_PERFORMANCE_STATS, ret, p->drc_index,
>> +			 virt_to_phys(buff_stats), size);
>
> You are calling virt_to_phys(NULL) here when called from
> papr_scm_nvdimm_init()!  That can't be right.
Thanks for cathing this. However if the 'size' is '0' the 'buff_stats'
address is ignored by the hypervisor hence this didnt get caught in my
tests. Though CONFIG_DEBUG_VIRTUAL would have caught it early.

>
>> +	if (out)
>> +		*out =  ret[0];
>> +
>> +	if (rc == H_PARTIAL) {
>> +		dev_err(&p->pdev->dev,
>> +			"Unknown performance stats, Err:0x%016lX\n", ret[0]);
>> +		return -ENOENT;
>> +	} else if (rc != H_SUCCESS) {
>> +		dev_err(&p->pdev->dev,
>> +			"Failed to query performance stats, Err:%lld\n", rc);
>> +		return -ENXIO;
>> +	}
>> +
>> +	/* Successfully fetched the requested stats from phyp */
>> +	if (size != 0) {
>> +		buff_stats->num_statistics =
>> +			be32_to_cpu(buff_stats->num_statistics);
>> +
>> +		/* Transform the stats buffer values from BE to cpu native */
>> +		for (i = 0, stats = buff_stats->scm_statistic;
>> +		     i < buff_stats->num_statistics; ++i) {
>> +			stats[i].statistic_value =
>> +				be64_to_cpu(stats[i].statistic_value);
>> +		}
>> +		dev_dbg(&p->pdev->dev,
>> +			"Performance stats returned %d stats\n",
>> +			buff_stats->num_statistics);
>> +	} else {
>> +		/* Handle case where stat buffer size was requested */
>> +		dev_dbg(&p->pdev->dev,
>> +			"Performance stats size %ld\n", ret[0]);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  /*
>>   * Issue hcall to retrieve dimm health info and populate papr_scm_priv with the
>>   * health information.
>> @@ -631,6 +721,45 @@ static int papr_scm_ndctl(struct nvdimm_bus_descriptor *nd_desc,
>>  	return 0;
>>  }
>>  
>> +static ssize_t perf_stats_show(struct device *dev,
>> +			       struct device_attribute *attr, char *buf)
>> +{
>> +	int index, rc;
>> +	struct seq_buf s;
>> +	struct papr_scm_perf_stat *stat;
>> +	struct papr_scm_perf_stats *stats;
>> +	struct nvdimm *dimm = to_nvdimm(dev);
>> +	struct papr_scm_priv *p = nvdimm_provider_data(dimm);
>> +
>> +	if (!p->len_stat_buffer)
>> +		return -ENOENT;
>> +
>> +	/* Allocate the buffer for phyp where stats are written */
>> +	stats = kzalloc(p->len_stat_buffer, GFP_KERNEL);
>
> I'm concerned that this buffer does not seem to have anything to do with the
> 'num_stats' parameter passed to drc_pmem_query_stats().  Furthermore why is
> num_stats always 0 in those calls?
>
'num_stats == 0' is a special case of the hcall where PHYP returns all
the possible stats in the 'stats' buffer.

>> +	if (!stats)
>> +		return -ENOMEM;
>> +
>> +	/* Ask phyp to return all dimm perf stats */
>> +	rc = drc_pmem_query_stats(p, stats, p->len_stat_buffer, 0, NULL);
>> +	if (!rc) {
>> +		/*
>> +		 * Go through the returned output buffer and print stats and
>> +		 * values. Since statistic_id is essentially a char string of
>> +		 * 8 bytes, simply use the string format specifier to print it.
>> +		 */
>> +		seq_buf_init(&s, buf, PAGE_SIZE);
>> +		for (index = 0, stat = stats->scm_statistic;
>> +		     index < stats->num_statistics; ++index, ++stat) {
>> +			seq_buf_printf(&s, "%.8s = 0x%016llX\n",
>> +				       stat->statistic_id, stat->statistic_value);
>> +		}
>> +	}
>> +
>> +	kfree(stats);
>> +	return rc ? rc : seq_buf_used(&s);
>> +}
>> +DEVICE_ATTR_RO(perf_stats);
>> +
>>  static ssize_t flags_show(struct device *dev,
>>  			  struct device_attribute *attr, char *buf)
>>  {
>> @@ -676,6 +805,7 @@ DEVICE_ATTR_RO(flags);
>>  /* papr_scm specific dimm attributes */
>>  static struct attribute *papr_nd_attributes[] = {
>>  	&dev_attr_flags.attr,
>> +	&dev_attr_perf_stats.attr,
>>  	NULL,
>>  };
>>  
>> @@ -696,6 +826,7 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>>  	struct nd_region_desc ndr_desc;
>>  	unsigned long dimm_flags;
>>  	int target_nid, online_nid;
>> +	u64 stat_size;
>>  
>>  	p->bus_desc.ndctl = papr_scm_ndctl;
>>  	p->bus_desc.module = THIS_MODULE;
>> @@ -759,6 +890,14 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
>>  		dev_info(dev, "Region registered with target node %d and online node %d",
>>  			 target_nid, online_nid);
>>  
>> +	/* Try retriving the stat buffer and see if its supported */
>> +	if (!drc_pmem_query_stats(p, NULL, 0, 0, &stat_size)) {
>> +		p->len_stat_buffer = (size_t)stat_size;
>> +		dev_dbg(&p->pdev->dev, "Max perf-stat size %lu-bytes\n",
>> +			p->len_stat_buffer);
>> +	} else {
>> +		dev_info(&p->pdev->dev, "Limited dimm stat info available\n");
>
> Do we really need this print?
nvdimm performance stats can be selectively turned on/off from the
hypervisor management console hence this info message is more like a
warning indicating that extended dimm stat info like 'fuel_gauge' is not
available.

>
> Ira
>
>> +	}
>>  	return 0;
>>  
>>  err:	nvdimm_bus_unregister(p->bus);
>> -- 
>> 2.26.2
>> _______________________________________________
>> Linux-nvdimm mailing list -- linux-nvdimm@lists.01.org
>> To unsubscribe send an email to linux-nvdimm-leave@lists.01.org

-- 
Cheers
~ Vaibhav
