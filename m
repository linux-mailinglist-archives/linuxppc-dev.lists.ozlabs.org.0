Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A831F0385
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Nov 2019 17:57:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 476wnT5TnZzF4rY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 03:57:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tlfalcon@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 476wld5SS9zF4r6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 03:55:41 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA5GrqAc063821; Tue, 5 Nov 2019 11:55:32 -0500
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w3b6aw10y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 11:55:31 -0500
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA5GtDMX001136;
 Tue, 5 Nov 2019 16:55:29 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma05wdc.us.ibm.com with ESMTP id 2w11e6yc5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 Nov 2019 16:55:29 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA5GtQXa52232466
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 Nov 2019 16:55:26 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA679AE05C;
 Tue,  5 Nov 2019 16:55:25 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81372AE063;
 Tue,  5 Nov 2019 16:55:25 +0000 (GMT)
Received: from oc7186267434.ibm.com (unknown [9.85.144.27])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  5 Nov 2019 16:55:25 +0000 (GMT)
Subject: Re: [PATCH 3/9] powerpc/pseries: Add cpu DLPAR support for drc-info
 property
To: Tyrel Datwyler <tyreld@linux.ibm.com>, mpe@ellerman.id.au
References: <1572967453-9586-1-git-send-email-tyreld@linux.ibm.com>
 <1572967453-9586-4-git-send-email-tyreld@linux.ibm.com>
From: Thomas Falcon <tlfalcon@linux.ibm.com>
Message-ID: <d0bb5aa2-3a52-5d5b-f5bb-0a1ee90f353a@linux.ibm.com>
Date: Tue, 5 Nov 2019 10:55:25 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1572967453-9586-4-git-send-email-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911050139
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
Cc: nathanl@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 11/5/19 9:24 AM, Tyrel Datwyler wrote:
> From: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
>
> Older firmwares provided information about Dynamic Reconfig
> Connectors (DRC) through several device tree properties, namely
> ibm,drc-types, ibm,drc-indexes, ibm,drc-names, and
> ibm,drc-power-domains. New firmwares have the ability to present this
> same information in a much condensed format through a device tree
> property called ibm,drc-info.
>
> The existing cpu DLPAR hotplug code only understands the older DRC
> property format when validating the drc-index of a cpu during a
> hotplug add. This updates those code paths to use the ibm,drc-info
> property, when present, instead for validation.
>
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/hotplug-cpu.c | 101 ++++++++++++++++++++++-----
>   1 file changed, 85 insertions(+), 16 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index bbda646..9ba006c 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -407,17 +407,58 @@ static bool dlpar_cpu_exists(struct device_node *parent, u32 drc_index)
>   	return found;
>   }
>
> +static bool drc_info_valid_index(struct device_node *parent, u32 drc_index)
> +{
> +	struct property *info;
> +	struct of_drc_info drc;
> +	const __be32 *value;
> +	int count, i, j;
> +
> +	info = of_find_property(parent, "ibm,drc-info", NULL);
> +	if (!info)
> +		return false;
> +
> +	value = of_prop_next_u32(info, NULL, &count);
> +
> +	/* First value of ibm,drc-info is number of drc-info records */
> +	if (value)
> +		value++;
> +	else
> +		return false;
> +
> +	for (i = 0; i < count; i++) {
> +		if (of_read_drc_info_cell(&info, &value, &drc))
> +			return false;
> +
> +		if (strncmp(drc.drc_type, "CPU", 3))
> +			break;
> +
> +		if (drc_index > drc.last_drc_index)
> +			continue;
> +
> +		for (j = 0; j < drc.num_sequential_elems; j++)
> +			if (drc_index == (drc.drc_index_start + (drc.sequential_inc * j)))
> +					return true;
> +	}
> +
> +	return false;
> +}
> +
>   static bool valid_cpu_drc_index(struct device_node *parent, u32 drc_index)
>   {
>   	bool found = false;
>   	int rc, index;
>
> -	index = 0;
> +	if (of_find_property(parent, "ibm,drc-info", NULL))
> +		return drc_info_valid_index(parent, drc_index);
> +
> +	index = 1;

Hi, this change was confusing to me until I continued reading the patch 
and saw the comment below regarding the first element of the 
ibm,drc-info property.  Would it be good to have a similar comment here too?


>   	while (!found) {
>   		u32 drc;
>
>   		rc = of_property_read_u32_index(parent, "ibm,drc-indexes",
>   						index++, &drc);
> +

Another nitpick but this could be cleaned up.

Thanks,

Tom


>   		if (rc)
>   			break;
>
> @@ -720,8 +761,11 @@ static int dlpar_cpu_remove_by_count(u32 cpus_to_remove)
>   static int find_dlpar_cpus_to_add(u32 *cpu_drcs, u32 cpus_to_add)
>   {
>   	struct device_node *parent;
> +	struct property *info;
>   	int cpus_found = 0;
>   	int index, rc;
> +	int i, j;
> +	u32 drc_index;
>
>   	parent = of_find_node_by_path("/cpus");
>   	if (!parent) {
> @@ -730,24 +774,49 @@ static int find_dlpar_cpus_to_add(u32 *cpu_drcs, u32 cpus_to_add)
>   		return -1;
>   	}
>
> -	/* Search the ibm,drc-indexes array for possible CPU drcs to
> -	 * add. Note that the format of the ibm,drc-indexes array is
> -	 * the number of entries in the array followed by the array
> -	 * of drc values so we start looking at index = 1.
> -	 */
> -	index = 1;
> -	while (cpus_found < cpus_to_add) {
> -		u32 drc;
> +	info = of_find_property(parent, "ibm,drc-info", NULL);
> +	if (info) {
> +		struct of_drc_info drc;
> +		const __be32 *value;
> +		int count;
>
> -		rc = of_property_read_u32_index(parent, "ibm,drc-indexes",
> -						index++, &drc);
> -		if (rc)
> -			break;
> +		value = of_prop_next_u32(info, NULL, &count);
> +		if (value)
> +			value++;
>
> -		if (dlpar_cpu_exists(parent, drc))
> -			continue;
> +		for (i = 0; i < count; i++) {
> +			of_read_drc_info_cell(&info, &value, &drc);
> +			if (strncmp(drc.drc_type, "CPU", 3))
> +				break;
> +
> +			for (j = 0; j < drc.num_sequential_elems && cpus_found < cpus_to_add; j++) {
> +				drc_index = drc.drc_index_start + (drc.sequential_inc * j);
> +
> +				if (dlpar_cpu_exists(parent, drc_index))
> +					continue;
> +
> +				cpu_drcs[cpus_found++] = drc_index;
> +			}
> +		}
> +	} else {
> +		/* Search the ibm,drc-indexes array for possible CPU drcs to
> +		 * add. Note that the format of the ibm,drc-indexes array is
> +		 * the number of entries in the array followed by the array
> +		 * of drc values so we start looking at index = 1.
> +		 */
> +		index = 1;
> +		while (cpus_found < cpus_to_add) {
> +			rc = of_property_read_u32_index(parent, "ibm,drc-indexes",
> +							index++, &drc_index);
> +
> +			if (rc)
> +				break;
>
> -		cpu_drcs[cpus_found++] = drc;
> +			if (dlpar_cpu_exists(parent, drc_index))
> +				continue;
> +
> +			cpu_drcs[cpus_found++] = drc_index;
> +		}
>   	}
>
>   	of_node_put(parent);
