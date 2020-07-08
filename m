Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E5F262183E5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 11:36:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1vLl3rHgzDr5Y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jul 2020 19:35:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1vJn0Tx8zDqvT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jul 2020 19:34:16 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0689WALb120126; Wed, 8 Jul 2020 05:34:10 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3251mv71g7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 05:34:10 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0689KtZL027606;
 Wed, 8 Jul 2020 09:34:08 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 322h1h4a4e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 08 Jul 2020 09:34:08 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0689Y52C57540792
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 8 Jul 2020 09:34:05 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D6274C058;
 Wed,  8 Jul 2020 09:34:05 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9DC284C040;
 Wed,  8 Jul 2020 09:34:03 +0000 (GMT)
Received: from [9.199.61.88] (unknown [9.199.61.88])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  8 Jul 2020 09:34:03 +0000 (GMT)
Subject: Re: [PATCH v4 2/2] powerpc/hv-24x7: Add sysfs files inside hv-24x7
 device to show cpumask
To: Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200708085955.655686-1-kjain@linux.ibm.com>
 <20200708085955.655686-3-kjain@linux.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <75dbe87d-cc00-7e70-57af-91a0231b8a9c@linux.ibm.com>
Date: Wed, 8 Jul 2020 15:04:02 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200708085955.655686-3-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-08_04:2020-07-08,
 2020-07-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015
 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0 cotscore=-2147483648
 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 priorityscore=1501
 phishscore=0 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007080066
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
Cc: nathanl@linux.ibm.com, ego@linux.vnet.ibm.com, suka@us.ibm.com,
 maddy@linux.vnet.ibm.com, anju@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 7/8/20 2:29 PM, Kajol Jain wrote:
> Patch here adds a cpumask attr to hv_24x7 pmu along with ABI documentation.
>
> Primary use to expose the cpumask is for the perf tool which has the
> capability to parse the driver sysfs folder and understand the
> cpumask file. Having cpumask file will reduce the number of perf command
> line parameters (will avoid "-C" option in the perf tool
> command line). It can also notify the user which is
> the current cpu used to retrieve the counter data.
>
> command:# cat /sys/devices/hv_24x7/cpumask
> 0
>
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> Reviewed-by: Gautham R. Shenoy <ego@linux.vnet.ibm.com>
> ---
>   .../sysfs-bus-event_source-devices-hv_24x7    |  7 ++++
>   arch/powerpc/perf/hv-24x7.c                   | 33 ++++++++++++++++++-
>   2 files changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7 b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
> index e8698afcd952..ee89d0e94602 100644
> --- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
> +++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
> @@ -43,6 +43,13 @@ Description:	read only
>   		This sysfs interface exposes the number of cores per chip
>   		present in the system.
>
> +What:		/sys/devices/hv_24x7/cpumask
> +Date:		June 2020
> +Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
> +Description:	read only
> +		This sysfs file exposes the cpumask which is designated to make
> +		HCALLs to retrieve hv-24x7 pmu event counter data.
> +
>   What:		/sys/bus/event_source/devices/hv_24x7/event_descs/<event-name>
>   Date:		February 2014
>   Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index 93b4700dcf8c..3f769bb2d06a 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -448,6 +448,12 @@ static ssize_t device_show_string(struct device *dev,
>   	return sprintf(buf, "%s\n", (char *)d->var);
>   }
>
> +static ssize_t cpumask_get_attr(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	return cpumap_print_to_pagebuf(true, buf, &hv_24x7_cpumask);
> +}
> +
>   static ssize_t sockets_show(struct device *dev,
>   			    struct device_attribute *attr, char *buf)
>   {
> @@ -1116,6 +1122,17 @@ static DEVICE_ATTR_RO(sockets);
>   static DEVICE_ATTR_RO(chipspersocket);
>   static DEVICE_ATTR_RO(coresperchip);
>
> +static DEVICE_ATTR(cpumask, S_IRUGO, cpumask_get_attr, NULL);
> +
> +static struct attribute *cpumask_attrs[] = {
> +	&dev_attr_cpumask.attr,
> +	NULL,
> +};
> +
> +static struct attribute_group cpumask_attr_group = {
> +	.attrs = cpumask_attrs,
> +};
> +
>   static struct bin_attribute *if_bin_attrs[] = {
>   	&bin_attr_catalog,
>   	NULL,
> @@ -1143,6 +1160,11 @@ static const struct attribute_group *attr_groups[] = {
>   	&event_desc_group,
>   	&event_long_desc_group,
>   	&if_group,
> +	/*
> +	 * This NULL is a placeholder for the cpumask attr which will update
> +	 * onlyif cpuhotplug registration is successful
> +	 */
> +	NULL,
>   	NULL,
>   };
>
> @@ -1684,7 +1706,7 @@ static int hv_24x7_cpu_hotplug_init(void)
>
>   static int hv_24x7_init(void)
>   {
> -	int r;
> +	int r, i = -1;
>   	unsigned long hret;
>   	struct hv_perf_caps caps;
>
> @@ -1731,6 +1753,15 @@ static int hv_24x7_init(void)
>   	if (r)
>   		return r;
>
> +	/*
> +	 * Cpu hotplug init is successful, add the
> +	 * cpumask file as part of pmu attr group and
> +	 * assign it to very first NULL location.
> +	 */
> +	while (attr_groups[++i])
> +		/* nothing */;
> +	attr_groups[i] = &cpumask_attr_group;
> +

We can avoid this complex stuff right.
Now that if the cpuhotplug init fail, we fail the pmu
registration right, with that, we dont need this dance.

Cant we just add the cpumask_attr_group right next to if_group
in "attr_group"?

Maddy

>   	r = perf_pmu_register(&h_24x7_pmu, h_24x7_pmu.name, -1);
>   	if (r)
>   		return r;

