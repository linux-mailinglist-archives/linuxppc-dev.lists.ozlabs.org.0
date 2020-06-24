Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A06162071A6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 12:58:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sKrQ33SMzDqk9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 20:58:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sKnq3sX6zDqf9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 20:56:15 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05OAVG1s061259; Wed, 24 Jun 2020 06:56:10 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31uwyxvt2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 06:56:09 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05OAnoRT016105;
 Wed, 24 Jun 2020 10:56:09 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 31uuruc446-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 24 Jun 2020 10:56:09 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05OAu88Q53281192
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 24 Jun 2020 10:56:08 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 07752124055;
 Wed, 24 Jun 2020 10:56:08 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5EEE8124053;
 Wed, 24 Jun 2020 10:56:07 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.91.248])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 24 Jun 2020 10:56:07 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 6758D2E4AAE; Wed, 24 Jun 2020 16:26:03 +0530 (IST)
Date: Wed, 24 Jun 2020 16:26:03 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: Kajol Jain <kjain@linux.ibm.com>
Subject: Re: [PATCH v2 2/2] powerpc/hv-24x7: Add sysfs files inside hv-24x7
 device to show cpumask
Message-ID: <20200624105603.GD31972@in.ibm.com>
References: <20200624101754.169612-1-kjain@linux.ibm.com>
 <20200624101754.169612-3-kjain@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200624101754.169612-3-kjain@linux.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-24_05:2020-06-24,
 2020-06-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 cotscore=-2147483648 mlxlogscore=999
 phishscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006240073
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
Cc: nathanl@linux.ibm.com, ego@linux.vnet.ibm.com, maddy@linux.vnet.ibm.com,
 suka@us.ibm.com, anju@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kajol,

On Wed, Jun 24, 2020 at 03:47:54PM +0530, Kajol Jain wrote:
> Patch here adds a cpumask attr to hv_24x7 pmu along with ABI documentation.
> 
> command:# cat /sys/devices/hv_24x7/cpumask
> 0

Since this sysfs interface is read-only, and the user cannot change
the CPU which will be making the HCALLs to obtain the 24x7 counts,
does the user even need to know if currently CPU X is the one which is
going to make HCALLs to retrive the 24x7 counts ? Does it help in any
kind of trouble-shooting ?

It would have made sense if the interface was read-write, since a user
can set this to a CPU which is not running user applications. This
would help in minimising jitter on those active CPUs running the user
applications.


> 
> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>  .../sysfs-bus-event_source-devices-hv_24x7    |  7 ++++
>  arch/powerpc/perf/hv-24x7.c                   | 36 +++++++++++++++++--
>  2 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7 b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
> index e8698afcd952..f9dd3755b049 100644
> --- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
> +++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
> @@ -43,6 +43,13 @@ Description:	read only
>  		This sysfs interface exposes the number of cores per chip
>  		present in the system.
> 
> +What:		/sys/devices/hv_24x7/cpumask
> +Date:		June 2020
> +Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
> +Description:	read only
> +		This sysfs file exposes the cpumask which is designated to make
> +		HCALLs to retrive hv-24x7 pmu event counter data.
> +
>  What:		/sys/bus/event_source/devices/hv_24x7/event_descs/<event-name>
>  Date:		February 2014
>  Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index ce4739e2b407..3c699612d29f 100644
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
> @@ -1683,7 +1705,7 @@ static int hv_24x7_cpu_hotplug_init(void)
> 
>  static int hv_24x7_init(void)
>  {
> -	int r;
> +	int r, i = -1;
>  	unsigned long hret;
>  	struct hv_perf_caps caps;
> 
> @@ -1727,8 +1749,18 @@ static int hv_24x7_init(void)
> 
>  	/* init cpuhotplug */
>  	r = hv_24x7_cpu_hotplug_init();
> -	if (r)
> +	if (r) {
>  		pr_err("hv_24x7: CPU hotplug init failed\n");
> +	} else {
> +		/*
> +		 * Cpu hotplug init is successful, add the
> +		 * cpumask file as part of pmu attr group and
> +		 * assign it to very first NULL location.
> +		 */
> +		while (attr_groups[++i])
> +			/* nothing */;
> +		attr_groups[i] = &cpumask_attr_group;
> +	}
> 
>  	r = perf_pmu_register(&h_24x7_pmu, h_24x7_pmu.name, -1);
>  	if (r)
> -- 
> 2.18.2
> 
