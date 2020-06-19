Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B488200186
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 07:06:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49p6Gm4bY3zDrP4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 15:06:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49p6F45H4tzDrFD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 15:05:12 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05J52l4t131317; Fri, 19 Jun 2020 01:05:08 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31rdh3x4f4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 01:05:07 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05J4xReT032570;
 Fri, 19 Jun 2020 05:05:06 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 31q6bdh2yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 19 Jun 2020 05:05:06 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05J5564l44958012
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 19 Jun 2020 05:05:06 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34D2AB2065;
 Fri, 19 Jun 2020 05:05:06 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 694B5B206A;
 Fri, 19 Jun 2020 05:05:05 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.69.87])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 19 Jun 2020 05:05:05 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id E4A292E2EB8; Fri, 19 Jun 2020 10:35:01 +0530 (IST)
Date: Fri, 19 Jun 2020 10:35:01 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH 2/2] powerpc/hv-24x7: Add sysfs files inside hv-24x7
 device to show cpumask
Message-ID: <20200619050501.GB13981@in.ibm.com>
References: <20200618122713.9030-1-kjain@linux.ibm.com>
 <20200618122713.9030-3-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200618122713.9030-3-kjain@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-19_01:2020-06-18,
 2020-06-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 mlxlogscore=999 cotscore=-2147483648 suspectscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2006190034
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
Reply-To: ego@linux.vnet.ibm.com
Cc: nathanl@linux.ibm.com, maddy@linux.vnet.ibm.com, suka@us.ibm.com,
 anju@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 18, 2020 at 05:57:13PM +0530, Kajol Jain wrote:
> Patch here adds a cpumask attr to hv_24x7 pmu along with ABI documentation.
> 
> command:# cat /sys/devices/hv_24x7/cpumask
> 0
> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  .../sysfs-bus-event_source-devices-hv_24x7    |  6 ++++
>  arch/powerpc/perf/hv-24x7.c                   | 31 ++++++++++++++++++-
>  2 files changed, 36 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7 b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
> index e8698afcd952..281e7b367733 100644
> --- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
> +++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
> @@ -43,6 +43,12 @@ Description:	read only
>  		This sysfs interface exposes the number of cores per chip
>  		present in the system.
> 
> +What:		/sys/devices/hv_24x7/cpumask
> +Date:		June 2020
> +Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
> +Description:	read only
> +		This sysfs file exposes cpumask.

Could you please describe this in little more detail as to what the
cpumask is ?

> +
>  What:		/sys/bus/event_source/devices/hv_24x7/event_descs/<event-name>
>  Date:		February 2014
>  Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index fdc4ae155d60..03d870a9fc36 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -448,6 +448,12 @@ static ssize_t device_show_string(struct device *dev,
>  	return sprintf(buf, "%s\n", (char *)d->var);
>  }
> 
> +static ssize_t cpumask_get_attr(struct device *dev,
> +				struct device_attribute *attr, char *buf)
> +{
> +	return cpumap_print_to_pagebuf(true, buf, &hv_24x7_cpumask);
> +}
> +
>  static ssize_t sockets_show(struct device *dev,
>  			    struct device_attribute *attr, char *buf)
>  {
> @@ -1116,6 +1122,17 @@ static DEVICE_ATTR_RO(sockets);
>  static DEVICE_ATTR_RO(chipspersocket);
>  static DEVICE_ATTR_RO(coresperchip);
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
>  static struct bin_attribute *if_bin_attrs[] = {
>  	&bin_attr_catalog,
>  	NULL,
> @@ -1143,6 +1160,11 @@ static const struct attribute_group *attr_groups[] = {
>  	&event_desc_group,
>  	&event_long_desc_group,
>  	&if_group,
> +	/*
> +	 * This NULL is a placeholder for the cpumask attr which will update
> +	 * onlyif cpuhotplug registration is successful
> +	 */
> +	NULL,
>  	NULL,
>  };
> 
> @@ -1727,8 +1749,15 @@ static int hv_24x7_init(void)
> 
>  	/* init cpuhotplug */
>  	r = hv_24x7_cpu_hotplug_init();
> -	if (r)
> +	if (r) {
>  		pr_err("hv_24x7: CPU hotplug init failed\n");
> +	} else {
> +		/*
> +		 * Cpu hotplug init is successful, add the
> +		 * cpumask file as part of pmu attr group
> +		 */
> +		attr_groups[5] = &cpumask_attr_group;

Since this is only a one-time initialization, wouldn't it be safer to
iterate through attr_groups[] and assin cpumask_attr_group to the
first NULL location ?

> +	}
> 
>  	r = perf_pmu_register(&h_24x7_pmu, h_24x7_pmu.name, -1);
>  	if (r)
> -- 
> 2.18.2
> 
