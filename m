Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAB2202F96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 07:52:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49qz7k66zlzDqTq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jun 2020 15:52:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49qz562sW3zDqdf
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jun 2020 15:49:46 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05M5XK5V170052; Mon, 22 Jun 2020 01:49:39 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31sbcs5rwe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 01:49:39 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05M5nYaa026210;
 Mon, 22 Jun 2020 05:49:38 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma02dal.us.ibm.com with ESMTP id 31t35bf97j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 22 Jun 2020 05:49:38 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05M5nbTx37880214
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 22 Jun 2020 05:49:37 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A455CAC05B;
 Mon, 22 Jun 2020 05:49:37 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 687EBAC060;
 Mon, 22 Jun 2020 05:49:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.77.205.185])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 22 Jun 2020 05:49:34 +0000 (GMT)
Subject: Re: [PATCH 2/2] powerpc/hv-24x7: Add sysfs files inside hv-24x7
 device to show cpumask
To: ego@linux.vnet.ibm.com
References: <20200618122713.9030-1-kjain@linux.ibm.com>
 <20200618122713.9030-3-kjain@linux.ibm.com>
 <20200619050501.GB13981@in.ibm.com>
From: kajoljain <kjain@linux.ibm.com>
Message-ID: <acc5d23d-9d36-b90e-2216-1eebb2b4f49b@linux.ibm.com>
Date: Mon, 22 Jun 2020 11:19:33 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200619050501.GB13981@in.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-22_01:2020-06-19,
 2020-06-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 priorityscore=1501
 clxscore=1015 suspectscore=1 phishscore=0 impostorscore=0 malwarescore=0
 adultscore=0 cotscore=-2147483648 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006220038
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
Cc: nathanl@linux.ibm.com, maddy@linux.vnet.ibm.com, suka@us.ibm.com,
 anju@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/19/20 10:35 AM, Gautham R Shenoy wrote:
> On Thu, Jun 18, 2020 at 05:57:13PM +0530, Kajol Jain wrote:
>> Patch here adds a cpumask attr to hv_24x7 pmu along with ABI documentation.
>>
>> command:# cat /sys/devices/hv_24x7/cpumask
>> 0
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>>  .../sysfs-bus-event_source-devices-hv_24x7    |  6 ++++
>>  arch/powerpc/perf/hv-24x7.c                   | 31 ++++++++++++++++++-
>>  2 files changed, 36 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7 b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
>> index e8698afcd952..281e7b367733 100644
>> --- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
>> +++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
>> @@ -43,6 +43,12 @@ Description:	read only
>>  		This sysfs interface exposes the number of cores per chip
>>  		present in the system.
>>
>> +What:		/sys/devices/hv_24x7/cpumask
>> +Date:		June 2020
>> +Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
>> +Description:	read only
>> +		This sysfs file exposes cpumask.
> 
> Could you please describe this in little more detail as to what the
> cpumask is ?
> 
Hi Gautham,
       Sure I will update the detail.

>> +
>>  What:		/sys/bus/event_source/devices/hv_24x7/event_descs/<event-name>
>>  Date:		February 2014
>>  Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
>> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
>> index fdc4ae155d60..03d870a9fc36 100644
>> --- a/arch/powerpc/perf/hv-24x7.c
>> +++ b/arch/powerpc/perf/hv-24x7.c
>> @@ -448,6 +448,12 @@ static ssize_t device_show_string(struct device *dev,
>>  	return sprintf(buf, "%s\n", (char *)d->var);
>>  }
>>
>> +static ssize_t cpumask_get_attr(struct device *dev,
>> +				struct device_attribute *attr, char *buf)
>> +{
>> +	return cpumap_print_to_pagebuf(true, buf, &hv_24x7_cpumask);
>> +}
>> +
>>  static ssize_t sockets_show(struct device *dev,
>>  			    struct device_attribute *attr, char *buf)
>>  {
>> @@ -1116,6 +1122,17 @@ static DEVICE_ATTR_RO(sockets);
>>  static DEVICE_ATTR_RO(chipspersocket);
>>  static DEVICE_ATTR_RO(coresperchip);
>>
>> +static DEVICE_ATTR(cpumask, S_IRUGO, cpumask_get_attr, NULL);
>> +
>> +static struct attribute *cpumask_attrs[] = {
>> +	&dev_attr_cpumask.attr,
>> +	NULL,
>> +};
>> +
>> +static struct attribute_group cpumask_attr_group = {
>> +	.attrs = cpumask_attrs,
>> +};
>> +
>>  static struct bin_attribute *if_bin_attrs[] = {
>>  	&bin_attr_catalog,
>>  	NULL,
>> @@ -1143,6 +1160,11 @@ static const struct attribute_group *attr_groups[] = {
>>  	&event_desc_group,
>>  	&event_long_desc_group,
>>  	&if_group,
>> +	/*
>> +	 * This NULL is a placeholder for the cpumask attr which will update
>> +	 * onlyif cpuhotplug registration is successful
>> +	 */
>> +	NULL,
>>  	NULL,
>>  };
>>
>> @@ -1727,8 +1749,15 @@ static int hv_24x7_init(void)
>>
>>  	/* init cpuhotplug */
>>  	r = hv_24x7_cpu_hotplug_init();
>> -	if (r)
>> +	if (r) {
>>  		pr_err("hv_24x7: CPU hotplug init failed\n");
>> +	} else {
>> +		/*
>> +		 * Cpu hotplug init is successful, add the
>> +		 * cpumask file as part of pmu attr group
>> +		 */
>> +		attr_groups[5] = &cpumask_attr_group;
> 
> Since this is only a one-time initialization, wouldn't it be safer to
> iterate through attr_groups[] and assin cpumask_attr_group to the
> first NULL location ?

Yes thats right. Will update that part.

Thanks,
Kajol Jain
> 
>> +	}
>>
>>  	r = perf_pmu_register(&h_24x7_pmu, h_24x7_pmu.name, -1);
>>  	if (r)
>> -- 
>> 2.18.2
>>
