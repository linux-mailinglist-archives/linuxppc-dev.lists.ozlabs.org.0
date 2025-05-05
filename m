Return-Path: <linuxppc-dev+bounces-8286-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F830AA8DBE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 10:00:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrYqK0KY3z2yj1;
	Mon,  5 May 2025 18:00:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746432028;
	cv=none; b=fEH+sDhLYkBwg7q3ALwGgzPL8Flgg37bv2EahX3pJrCO94Wt3PwFfm2fSqfuNSZi/5hW1X2YDOJqSkg8XeRpxUxplQwZXw/XnbGG58DH8T+1wptKXrc18VUgyOCc2wqRkZWuststdbr3T8Nv3YImOistgwdvuaj/fEQqkuJYPRY4p47zwh2BDweAF9QFGpgy+ma9giP+G7XoYhcxlYV7g1iPmAOVEcB9RAzN5S7w3dV2IBl1CvpFuz1OsvdLBQplNH0DKJlIjEgaFQJ3lO8Q9KwT4vNOBPjqM7HjAQY2wjDvcBvvYSttABi5no9VKrZTBkHjOE1X7UXwmODnCWA30w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746432028; c=relaxed/relaxed;
	bh=opIOUJHgChmbsqt4/qGgK1p8TfOF9SBNFrcG4L8OHBg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ktEIPPHDF09CeKB/mPNS2uVbgxi/evOjI3fQNRhCrpTehxOQi3alvoz3DO8Gbd0h8zalljWdyXPLmCZU/CkdLk4BC5GqtXSaRan/vwatryx1MdYuL18wlNRJOms9bqjRi6oMwL+QFA9NX9RLwhUES5CWiMGHbGDzIa4J0drPQ7/JyTxGIeIE1tPnU6h6kSKaNRyXTktTcZucPWx2IMy8kzeUjVNk2RJE0qCm8oFTwYLDbLRXseFADlgyRLKb1VCk98DvQgWBULApoEq8Vwyd4AFzkIRnVlyPkckOh1oXBe/fTkPEeWs1gzhDl5jHWdIfQmwb1cD+K1PRKAmZIHfrCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r4N72cw8; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=r4N72cw8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrYqJ1WcCz2yhv
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 18:00:27 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5454Z17D020230;
	Mon, 5 May 2025 08:00:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=opIOUJ
	HgChmbsqt4/qGgK1p8TfOF9SBNFrcG4L8OHBg=; b=r4N72cw84xRcaqP3y+7okC
	F/TvGEPiRsscFRkOoBCO9KyBO72o5gSWlmf058yP2b35KjosWarUxtqFBrqR0e/U
	L2FjWV5cv00aul/a3n09IEVO/AMYruGnQkudDAOjSvV6DfyyZ/AtwwBNbs7RI3lc
	bXZKFzvKClel1RQvna45rDpTJUohjIPaX5WaVKOcSyPsg1hUN/ZeBim76tHyR1xN
	bcPomQgBk0xWXrisCrtzdJU96PqPPA+mwmQl3mRpyjLG/5/sCvAiCh4tvp+kEWg0
	gt7leUkyua7lOGV38Fa0KyVy7HXT1gGWIPeTXbnIJp/dg567j1285BiFpto/PYgw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e6prb4v1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:00:19 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5457j8rh025028;
	Mon, 5 May 2025 08:00:19 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e6prb4uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:00:19 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5453q8nr032252;
	Mon, 5 May 2025 08:00:18 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxymd52w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:00:18 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54580EsB32047652
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 08:00:14 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 460BC2004B;
	Mon,  5 May 2025 08:00:14 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88E2820043;
	Mon,  5 May 2025 08:00:12 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com (unknown [9.124.222.251])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  5 May 2025 08:00:12 +0000 (GMT)
Date: Mon, 5 May 2025 13:30:10 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, tyreld@linux.ibm.com, hbabu@us.ibm.com
Subject: Re: [PATCH] powerpc/pseries/dlpar: Search DRC index from
 ibm,drc-indexes for IO add
Message-ID: <20250505123551.262473c6-e2-amachhiw@linux.ibm.com>
Mail-Followup-To: Haren Myneni <haren@linux.ibm.com>, 
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	tyreld@linux.ibm.com, hbabu@us.ibm.com
References: <20250501041056.1281055-1-haren@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250501041056.1281055-1-haren@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Cu2/cm4D c=1 sm=1 tr=0 ts=68187013 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=ACOsk-A3Hbd8DMyUOYUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: BOX8M2clWpAqHXbzIfvwljNpdtf0kvtn
X-Proofpoint-ORIG-GUID: RrLN2nHJqIKkU7SL7weExv99f-Q03vA4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3MCBTYWx0ZWRfX8L7hxTcW67kh PqpJdKRBl8YabbYw/cUE0kcU6LcbgaPSugP4YMj/TpLWvYoiHhfD8Jg7Lf8kprLb+WIJrEWSfOZ eSS0oIdGgEPu69MpYpgzvaAVJ6Mo3sHQZPy+scTMpHH/myApFQDPg6c9dwYxbib9qzx+Q1snAC4
 Rp79O+d6JqWHkptmLIDWYQlvI7VIBxeMXtfZm8MbrG7iLjIU77EDZ4KjdFthaIWnwqTWogT1Fc7 5VvyijdXQwpvLNyH6t3zXo6LRzl/WYAVmw1zvRaHBcUVIMfYyjSBbvY/mKTH5RR5KyLb5zZL+WZ J1iCMXvYSa2HijOhdYoYAjcONQYkouBKD0F6ajoNmHut6lPKj6raWzH/lxGni/jehIrVHT/khPY
 l3cD7U9/CH21OWSjPiXS2nmUZynzHqEyQ27FXMUCEIZ4YddVpy8K2ZsNLGfXlsT0dKFY2kbA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound score=100 clxscore=1015
 mlxscore=100 spamscore=100 mlxlogscore=-999 malwarescore=0 phishscore=0
 adultscore=0 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505050070
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Haren,

Thanks for the patch.

On 2025/04/30 09:10 PM, Haren Myneni wrote:
> IO hotplug add event is handled in the user space with drmgr tool.
> After the device is enabled, the user space uses /sys/kerne/dlpar
> interface with “dt add index <drc_index>” to update the device tree.
> The kernel interface (dlpar_hp_dt_add()) finds the parent node for
> the specified ‘drc_index’ from ibm,drc-info property. But old FW
> provides ibm,drc-indexes property instead of ibm,drc-info.
> 
> If the ibm,drc-info is not available, this patch adds changes to
> search ‘drc_index’ from the indexes array in ibm,drc-indexes
> property to support old FW.
> 
> Fixes: 02b98ff44a57 ("powerpc/pseries/dlpar: Add device tree nodes for DLPAR IO add")
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/dlpar.c | 52 +++++++++++++++++++++++++-
>  1 file changed, 50 insertions(+), 2 deletions(-)
> 

I tested this patch on fc42 pSeries KVM guest (L2) with PCI device passhthrough.
The device hotplug operation without this patch fails with the below errors.
While with the patch, PCI device hotplug/unplug operations work fine. Hence,

Tested-by: Amit Machhiwal <amachhiw@linux.ibm.com>

 Installed pkgs
 --------------
  [root@fedora42 ~]# rpm -qa | grep -e 'ppc64-diag\|powerpc-utils'
  ppc64-diag-rtas-2.7.10-4.fc42.ppc64le
  ppc64-diag-2.7.10-4.fc42.ppc64le
  powerpc-utils-1.3.13-3.fc42.ppc64le
  powerpc-utils-core-1.3.13-3.fc42.ppc64le

 Without Patch
 -------------
  dmesg
  -----
  (on device attach)
   [ 1451.166029] RTAS: event: 1, Type: Hotplug Event (229), Severity: 1
   [ 1451.393168] dlpar: Could not handle DLPAR request "dt add index 0x40010008"

  drmgr log
  ---------
  (on device attach)
   ########## May 05 07:36:25 2025 ##########
   drmgr: -c pci -a -s 0x40010008 -n -d4 -V
   Retrieving hotplug nodes
   [...]
   Found drc_name C65544
   is calling rtas_set_indicator(ISOLATE index 0x40010008)
   is calling set_power(POWER_OFF index 0x40010008, power_domain 0xffffffff)
   is calling card_present
   Waiting for the card to appear...
   get-sensor for 40010008: 0, 1
   is calling set_power(POWER_ON index 0x40010008, power_domain 0xffffffff
   calling rtas_set_indicator(UNISOLATE index 0x40010008)
   Initiating kernel DLPAR "dt add index 0x40010008"
   Failed to write to /sys/kernel/dlpar: Input/output error
   add_device_tree_nodes failed at /proc/device-tree/pci@800000020000001
   Internal software error. Contact your service representative.
   ########## May 05 07:36:25 2025 ##########

 With Patch
 ----------
  dmesg
  -----
  (on device attach)
   [  129.503732] RTAS: event: 1, Type: Hotplug Event (229), Severity: 1
   [...]
   [  129.819677] tg3 0001:00:01.0: ibm,query-pe-dma-windows(2026) 800 8000000 20000001 returned 0, lb=2000000000 ps=107 wn=1
   [  129.822331] tg3 0001:00:01.0: ibm,create-pe-dma-window(2027) 800 8000000 20000001 18 0 returned -3 (liobn = 0x0 starting addr = 0 0)
   [...]
   [  133.095657] tg3 0001:00:01.0 enP1p0s1: Link is up at 1000 Mbps, full duplex

  (on device detach)
   [  525.609818] RTAS: event: 2, Type: Hotplug Event (229), Severity: 1

  drmgr log
  ---------
  (on device attach)
   ########## May 05 07:49:17 2025 ##########
   drmgr: -c pci -a -s 0x40010008 -n -d4 -V
   Retrieving hotplug nodes
   [...]
   Found drc_name C65544
   is calling rtas_set_indicator(ISOLATE index 0x40010008)
   is calling set_power(POWER_OFF index 0x40010008, power_domain 0xffffffff)
   is calling card_present
   Waiting for the card to appear...
   get-sensor for 40010008: 0, 1
   is calling set_power(POWER_ON index 0x40010008, power_domain 0xffffffff
   calling rtas_set_indicator(UNISOLATE index 0x40010008)
   Initiating kernel DLPAR "dt add index 0x40010008"
   Success
   is calling enable_slot to config adapter
   ########## May 05 07:49:17 2025 ##########

  (on device detach)
   ########## May 05 07:55:53 2025 ##########
   drmgr: -c pci -r -s 0x40010008 -n -d4 -V
   Retrieving hotplug nodes
   [...]
   Found drc_name C65544
   found node: drc name=C65544, index=0x40010008, path=/proc/device-tree/pci@800000020000001
   Initiating kernel DLPAR "dt remove index 0x40010008"
   Success
   is calling rtas_set_indicator(ISOLATE index 0x40010008)
   is calling set_power(POWER_OFF index 0x40010008, power_domain 0xffffffff)
   ########## May 05 07:55:57 2025 ##########

Thanks,
Amit

> diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
> index 213aa26dc8b3..979487da6522 100644
> --- a/arch/powerpc/platforms/pseries/dlpar.c
> +++ b/arch/powerpc/platforms/pseries/dlpar.c
> @@ -404,6 +404,45 @@ get_device_node_with_drc_info(u32 index)
>  	return NULL;
>  }
>  
> +static struct device_node *
> +get_device_node_with_drc_indexes(u32 drc_index)
> +{
> +	struct device_node *np = NULL;
> +	u32 nr_indexes, index;
> +	int i, rc;
> +
> +	for_each_node_with_property(np, "ibm,drc-indexes") {
> +		/*
> +		 * First element in the array is the total number of
> +		 * DRC indexes returned.
> +		 */
> +		rc = of_property_read_u32_index(np, "ibm,drc-indexes",
> +				0, &nr_indexes);
> +		if (rc)
> +			goto out_put_np;
> +
> +		/*
> +		 * Retrieve DRC index from the list and return the
> +		 * device node if matched with the specified index.
> +		 */
> +		for (i = 0; i < nr_indexes; i++) {
> +			rc = of_property_read_u32_index(np, "ibm,drc-indexes",
> +							i+1, &index);
> +			if (rc)
> +				goto out_put_np;
> +
> +			if (drc_index == index)
> +				return np;
> +		}
> +	}
> +
> +	return NULL;
> +
> +out_put_np:
> +	of_node_put(np);
> +	return NULL;
> +}
> +
>  static int dlpar_hp_dt_add(u32 index)
>  {
>  	struct device_node *np, *nodes;
> @@ -423,10 +462,19 @@ static int dlpar_hp_dt_add(u32 index)
>  		goto out;
>  	}
>  
> +	/*
> +	 * Recent FW provides ibm,drc-info property. So search
> +	 * for the user specified DRC index from ibm,drc-info
> +	 * property. If this property is not available, search
> +	 * in the indexes array from ibm,drc-indexes property.
> +	 */
>  	np = get_device_node_with_drc_info(index);
>  
> -	if (!np)
> -		return -EIO;
> +	if (!np) {
> +		np = get_device_node_with_drc_indexes(index);
> +		if (!np)
> +			return -EIO;
> +	}
>  
>  	/* Next, configure the connector. */
>  	nodes = dlpar_configure_connector(cpu_to_be32(index), np);
> -- 
> 2.43.5
> 
> 

