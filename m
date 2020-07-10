Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D192221AF41
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 08:17:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B32rm3smTzDqBL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jul 2020 16:17:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B32pk1591zDr45
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jul 2020 16:15:41 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06A5WSiU039996; Fri, 10 Jul 2020 02:15:35 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 326bps1a7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 02:15:35 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06A6BHvj013559;
 Fri, 10 Jul 2020 06:15:34 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03fra.de.ibm.com with ESMTP id 326bch85hb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 10 Jul 2020 06:15:33 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 06A6FVg563242748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 10 Jul 2020 06:15:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1715111C064;
 Fri, 10 Jul 2020 06:15:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 434B611C052;
 Fri, 10 Jul 2020 06:15:29 +0000 (GMT)
Received: from [9.199.58.157] (unknown [9.199.58.157])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 10 Jul 2020 06:15:29 +0000 (GMT)
Subject: Re: [PATCH v5 2/2] powerpc/hv-24x7: Add sysfs files inside hv-24x7
 device to show cpumask
To: Kajol Jain <kjain@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <20200709051836.723765-1-kjain@linux.ibm.com>
 <20200709051836.723765-3-kjain@linux.ibm.com>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Message-ID: <8d701ce5-9947-36a1-c366-b49c64223f2a@linux.ibm.com>
Date: Fri, 10 Jul 2020 11:45:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200709051836.723765-3-kjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-10_01:2020-07-09,
 2020-07-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 malwarescore=0 mlxscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007100037
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



On 7/9/20 10:48 AM, Kajol Jain wrote:
> Patch here adds a cpumask attr to hv_24x7 pmu along with ABI documentation.
>
> Primary use to expose the cpumask is for the perf tool which has the
> capability to parse the driver sysfs folder and understand the
> cpumask file. Having cpumask file will reduce the number of perf command
> line parameters (will avoid "-C" option in the perf tool
> command line). It can also notify the user which is
> the current cpu used to retrieve the counter data.
>
> command:# cat /sys/devices/hv_24x7/interface/cpumask
> 0


Reviewed-by: Madhavan Srinivasan <maddy@linux.ibm.com>

> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
> ---
>   .../ABI/testing/sysfs-bus-event_source-devices-hv_24x7    | 7 +++++++
>   arch/powerpc/perf/hv-24x7.c                               | 8 ++++++++
>   2 files changed, 15 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7 b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
> index e8698afcd952..f7e32f218f73 100644
> --- a/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
> +++ b/Documentation/ABI/testing/sysfs-bus-event_source-devices-hv_24x7
> @@ -43,6 +43,13 @@ Description:	read only
>   		This sysfs interface exposes the number of cores per chip
>   		present in the system.
>
> +What:		/sys/devices/hv_24x7/interface/cpumask
> +Date:		July 2020
> +Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
> +Description:	read only
> +		This sysfs file exposes the cpumask which is designated to make
> +		HCALLs to retrieve hv-24x7 pmu event counter data.
> +
>   What:		/sys/bus/event_source/devices/hv_24x7/event_descs/<event-name>
>   Date:		February 2014
>   Contact:	Linux on PowerPC Developer List <linuxppc-dev@lists.ozlabs.org>
> diff --git a/arch/powerpc/perf/hv-24x7.c b/arch/powerpc/perf/hv-24x7.c
> index 93b4700dcf8c..acc34148ad09 100644
> --- a/arch/powerpc/perf/hv-24x7.c
> +++ b/arch/powerpc/perf/hv-24x7.c
> @@ -448,6 +448,12 @@ static ssize_t device_show_string(struct device *dev,
>   	return sprintf(buf, "%s\n", (char *)d->var);
>   }
>
> +static ssize_t cpumask_show(struct device *dev,
> +			    struct device_attribute *attr, char *buf)
> +{
> +	return cpumap_print_to_pagebuf(true, buf, &hv_24x7_cpumask);
> +}
> +
>   static ssize_t sockets_show(struct device *dev,
>   			    struct device_attribute *attr, char *buf)
>   {
> @@ -1115,6 +1121,7 @@ static DEVICE_ATTR_RO(domains);
>   static DEVICE_ATTR_RO(sockets);
>   static DEVICE_ATTR_RO(chipspersocket);
>   static DEVICE_ATTR_RO(coresperchip);
> +static DEVICE_ATTR_RO(cpumask);
>
>   static struct bin_attribute *if_bin_attrs[] = {
>   	&bin_attr_catalog,
> @@ -1128,6 +1135,7 @@ static struct attribute *if_attrs[] = {
>   	&dev_attr_sockets.attr,
>   	&dev_attr_chipspersocket.attr,
>   	&dev_attr_coresperchip.attr,
> +	&dev_attr_cpumask.attr,
>   	NULL,
>   };
>

