Return-Path: <linuxppc-dev+bounces-8293-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01B89AA906B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 11:59:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrcSL3xLZz2ypV;
	Mon,  5 May 2025 19:59:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746434469;
	cv=none; b=J505cbehoa1hZdAw4vKntuiSn1f2GPa8W/4F2ExDI6z1v/qtP4odQwO7ySXKAbbyNFpy5KguRpOnjK/CaDGn3bm4hVpDk5Pp8AO5EVQ0rMM0PWwz6zMq04cQqTtAaiCXZd+aSGn1xxCyqA7UNYPeZ4Abt3i/QtUE7JIxlV1b1MMqjBMYfvpVDxxGI8EbYa5PlbClEVtVKapXOS4LjwxQ9P5wLPRc0rfwfYojFhXwE7UJ4l4V5CnAFgmgkl6GJmECpeQ10AS773wbklhfKMGOVlFPZoGpiWRSN9z/RTAf5B/Nzna+bDUL19xPMbq5wHabmtiuYXgoz2FloL/ozPF3FA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746434469; c=relaxed/relaxed;
	bh=nH++p+jrs7ARalgRqRk2xphHR4blMdPiPcDBikIC30k=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=os8xF8FMdktBLZSEUcjQLDU1cn8J41Aofhwlflgsoki4F8Y7sC49bF6+xCDVdEOQ3Wq3LpY037mYnAzGOinBVj7PKFQop2WaYiw+8yjLeZ23rvhBDzWc3xj9OOMK5E2k/ibJnzvfodPXkquHrEob1aFsDYltd+Z2U9zma7zgWXYgX/FTYlzc9Lvhh5iz8zSA5bX1jIOvP7aPTZJ1qOcyUWGcqLm/wQamueSsEBmAY5IuEw1Nf7PIhBA1jCGScdS4zUL1rtXgKpwtDoh8ouOoIehEvFY3JtgfcDH11Mzi/lZ50ZoVBMD6OewvvLh21gWf3Z845J6Bi4L1ynR3ip63CA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m6II62bM; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kowsjois@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m6II62bM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kowsjois@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrZkC60Pwz2yk3
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 18:41:07 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5456DxWv017076;
	Mon, 5 May 2025 08:41:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=nH++p+jrs7ARalgRqRk2xphHR4blMd
	PiPcDBikIC30k=; b=m6II62bMuZ5pvPRUNN+h3OcjgbieUGssk3Mil4t5oWiwjW
	BWvL6GIbNt+APgSQzvIuR+xMeZf5lVz76NN1WzDiXaHJ9D8EzUHnmpJ8EB/nrciR
	PfQfu4oHIfFkmRWznI0eALNFg0iv01hxCEl2cwtnPbpXc27tvg8Z1RnH016M/l6N
	9uGtG20WVEQcTe7b/nMWQOBAgYJuD9O3CKOjR16upqH47qvT9aGurz4mkNb2f18b
	jztXfyesR2yjEedgHr0enuJCy07SDsDk5/WYlMy6BAz7qDmj0uldvOG3iCgGAy8O
	Br4kFMXjza4r4R8My/tsw5t2gNOtQ73m69avMcrw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e65hufk7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:41:00 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5458ax2Y026700;
	Mon, 5 May 2025 08:41:00 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e65hufk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:41:00 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54545AN8032220;
	Mon, 5 May 2025 08:40:59 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxymd9vn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 08:40:59 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5458etVS47382988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 08:40:55 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 44A1D2004B;
	Mon,  5 May 2025 08:40:55 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1DCA20040;
	Mon,  5 May 2025 08:40:52 +0000 (GMT)
Received: from [9.43.3.121] (unknown [9.43.3.121])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 08:40:52 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------7rgk8RnrKQZb82gQrChnm3M9"
Message-ID: <84932bb4-8fd0-49c3-bb87-5a7e02f2d658@linux.vnet.ibm.com>
Date: Mon, 5 May 2025 14:10:51 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries/dlpar: Search DRC index from
 ibm,drc-indexes for IO add
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        tyreld@linux.ibm.com, hbabu@us.ibm.com
References: <20250501041056.1281055-1-haren@linux.ibm.com>
Content-Language: en-US
From: Kowshik Jois B S <kowsjois@linux.vnet.ibm.com>
In-Reply-To: <20250501041056.1281055-1-haren@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=UZ1RSLSN c=1 sm=1 tr=0 ts=6818799c cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=VnNF1IyMAAAA:8 a=-N88GMA1C97Ez57G5QwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=MwhoDN2aAihZLIMZg8gA:9 a=e3hT5Jw74hslWIsE:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
X-Proofpoint-GUID: 0fbTGGoF4VJE06ZOmPtRov51pxb6YfQI
X-Proofpoint-ORIG-GUID: -3WJW6loVSvqvi8yO0vNJ8DGLAycA5Iz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA4MSBTYWx0ZWRfX5Y/MkOIWup2n 2jOSM6ixeCTGGQsUcSU30g/pAUbOJawRVS47EqbgnPC94iZZTzZhNuqaoniXWQ5X3ey02wUT8/H GqCrupaZd6jaUUmLQ3UCotdoExF/yKLN+q8eeur7JE7E4o0oK9aY9Wdf/2D2SS2zRkep5FgDQbU
 +sygiteF2Emt76d1wb7x/Z+aeDHDra2k5lHv9o4aRDi7VX/9qxzOcdCAo0NfS+ONW0J8weNzeSt BCjIoR9sGZjFs1zoylGK+EfmLDWcWTSSgN6KbQWkOmENsGH2YCLyb3ZZnKnlk1v5ViR00W/7ibl uHowV3CP4PhhJ/XSfkuhyKNOVMpnAZDg8+N8zja264CQn//WdbWF5c6kyEno99zxSYOrPDpe7JY
 JNSEjRcXyOjKHhBz2d2war2xshFvLHJeuTkujM7FHGeetkbJYGqVsqHjo3X52kR4qA4m5cnR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1011 mlxscore=0 mlxlogscore=891
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050081
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_NONE,T_KAM_HTML_FONT_INVALID autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------7rgk8RnrKQZb82gQrChnm3M9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Haren, could you please add the below tag:


Reported-by:Kowshik Jois<kowsjois@linux.ibm.com


Regards,

Kowshik Jois B S


On 01/05/25 09:40, Haren Myneni wrote:
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
> Signed-off-by: Haren Myneni<haren@linux.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/dlpar.c | 52 +++++++++++++++++++++++++-
>   1 file changed, 50 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
> index 213aa26dc8b3..979487da6522 100644
> --- a/arch/powerpc/platforms/pseries/dlpar.c
> +++ b/arch/powerpc/platforms/pseries/dlpar.c
> @@ -404,6 +404,45 @@ get_device_node_with_drc_info(u32 index)
>   	return NULL;
>   }
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
>   static int dlpar_hp_dt_add(u32 index)
>   {
>   	struct device_node *np, *nodes;
> @@ -423,10 +462,19 @@ static int dlpar_hp_dt_add(u32 index)
>   		goto out;
>   	}
>   
> +	/*
> +	 * Recent FW provides ibm,drc-info property. So search
> +	 * for the user specified DRC index from ibm,drc-info
> +	 * property. If this property is not available, search
> +	 * in the indexes array from ibm,drc-indexes property.
> +	 */
>   	np = get_device_node_with_drc_info(index);
>   
> -	if (!np)
> -		return -EIO;
> +	if (!np) {
> +		np = get_device_node_with_drc_indexes(index);
> +		if (!np)
> +			return -EIO;
> +	}
>   
>   	/* Next, configure the connector. */
>   	nodes = dlpar_configure_connector(cpu_to_be32(index), np);
--------------7rgk8RnrKQZb82gQrChnm3M9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Haren,
        could you please add the below tag:</span></p>
    <p><span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><br>
      </span><span aria-label="" class="c-mrkdwn__br"
        data-stringify-type="paragraph-break"
style="box-sizing: inherit; height: 8px; display: block; color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"></span><span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;">Reported-by:<span> </span></span><span
        class="c-mrkdwn__highlight"
style="box-sizing: inherit; background-color: var(--dt_color-surf-hgl-3); color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Kowshik
        Jois&lt;<a class="moz-txt-link-abbreviated" href="mailto:kowsjois@linux.ibm.com">kowsjois@linux.ibm.com</a></span></p>
    <p><span class="c-mrkdwn__highlight"
style="box-sizing: inherit; background-color: var(--dt_color-surf-hgl-3); color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;"><br>
      </span></p>
    <p><span class="c-mrkdwn__highlight"
style="box-sizing: inherit; background-color: var(--dt_color-surf-hgl-3); color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Regards,</span></p>
    <p><span class="c-mrkdwn__highlight"
style="box-sizing: inherit; background-color: var(--dt_color-surf-hgl-3); color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial;">Kowshik
        Jois B S<br>
      </span></p>
    <p><span
style="color: rgb(29, 28, 29); font-family: Slack-Lato, Slack-Fractions, appleLogo, sans-serif; font-size: 15px; font-style: normal; font-variant-ligatures: common-ligatures; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; orphans: 2; text-align: left; text-indent: 0px; text-transform: none; widows: 2; word-spacing: 0px; -webkit-text-stroke-width: 0px; white-space: normal; background-color: rgb(255, 255, 255); text-decoration-thickness: initial; text-decoration-style: initial; text-decoration-color: initial; display: inline !important; float: none;"><br>
      </span></p>
    <div class="moz-cite-prefix">On 01/05/25 09:40, Haren Myneni wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20250501041056.1281055-1-haren@linux.ibm.com">
      <pre wrap="" class="moz-quote-pre">IO hotplug add event is handled in the user space with drmgr tool.
After the device is enabled, the user space uses /sys/kerne/dlpar
interface with “dt add index &lt;drc_index&gt;” to update the device tree.
The kernel interface (dlpar_hp_dt_add()) finds the parent node for
the specified ‘drc_index’ from ibm,drc-info property. But old FW
provides ibm,drc-indexes property instead of ibm,drc-info.

If the ibm,drc-info is not available, this patch adds changes to
search ‘drc_index’ from the indexes array in ibm,drc-indexes
property to support old FW.

Fixes: 02b98ff44a57 ("powerpc/pseries/dlpar: Add device tree nodes for DLPAR IO add")
Signed-off-by: Haren Myneni <a class="moz-txt-link-rfc2396E" href="mailto:haren@linux.ibm.com">&lt;haren@linux.ibm.com&gt;</a>
---
 arch/powerpc/platforms/pseries/dlpar.c | 52 +++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 213aa26dc8b3..979487da6522 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -404,6 +404,45 @@ get_device_node_with_drc_info(u32 index)
 	return NULL;
 }
 
+static struct device_node *
+get_device_node_with_drc_indexes(u32 drc_index)
+{
+	struct device_node *np = NULL;
+	u32 nr_indexes, index;
+	int i, rc;
+
+	for_each_node_with_property(np, "ibm,drc-indexes") {
+		/*
+		 * First element in the array is the total number of
+		 * DRC indexes returned.
+		 */
+		rc = of_property_read_u32_index(np, "ibm,drc-indexes",
+				0, &amp;nr_indexes);
+		if (rc)
+			goto out_put_np;
+
+		/*
+		 * Retrieve DRC index from the list and return the
+		 * device node if matched with the specified index.
+		 */
+		for (i = 0; i &lt; nr_indexes; i++) {
+			rc = of_property_read_u32_index(np, "ibm,drc-indexes",
+							i+1, &amp;index);
+			if (rc)
+				goto out_put_np;
+
+			if (drc_index == index)
+				return np;
+		}
+	}
+
+	return NULL;
+
+out_put_np:
+	of_node_put(np);
+	return NULL;
+}
+
 static int dlpar_hp_dt_add(u32 index)
 {
 	struct device_node *np, *nodes;
@@ -423,10 +462,19 @@ static int dlpar_hp_dt_add(u32 index)
 		goto out;
 	}
 
+	/*
+	 * Recent FW provides ibm,drc-info property. So search
+	 * for the user specified DRC index from ibm,drc-info
+	 * property. If this property is not available, search
+	 * in the indexes array from ibm,drc-indexes property.
+	 */
 	np = get_device_node_with_drc_info(index);
 
-	if (!np)
-		return -EIO;
+	if (!np) {
+		np = get_device_node_with_drc_indexes(index);
+		if (!np)
+			return -EIO;
+	}
 
 	/* Next, configure the connector. */
 	nodes = dlpar_configure_connector(cpu_to_be32(index), np);
</pre>
    </blockquote>
  </body>
</html>

--------------7rgk8RnrKQZb82gQrChnm3M9--


