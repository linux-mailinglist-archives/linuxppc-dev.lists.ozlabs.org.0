Return-Path: <linuxppc-dev+bounces-8291-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD547AA8EC9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 11:02:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZrbBx1QTBz2yk3;
	Mon,  5 May 2025 19:02:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746435753;
	cv=none; b=cPn5g05dpEBhCaYaIkWPtOHsP7bYF4TRAaa1bXc8eaRRxCiUy96CsEOS5ZJcu4M1qaEI6C/rVX7hWthO67zv+brEXD6ysV1yyv7mrJ2OriQXl3ms91qACAxY1+zVrYzfuC2CH93T3u74hiVz21VaKRAMeVnOAMaKik7IhVmZ2djfCJFPcysGUt0JSPAyvQAD7UtVrTshe1aqDsYg5h7TY7mTpdq4ZE7JoEpk5nHrgdyjeUm4fPERud0z/aJmjFEpCTsIIWxWQsMCPFMjmSiIR8JQLrRWOLi8ZRtS6nXMtN/jp2mh2C5jrf5WT1h7oCCdILd4AUJ6s4qtxdZicTyHOw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746435753; c=relaxed/relaxed;
	bh=fOlkZ3Be3x7L2nM7kjnPFjF9SArSVxAEPRD4qfLJVR0=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=IbwXdWWdMlgPm7cDwqOciPJOjQjnwq7txfeuHPAFSVf8bBZHkAED6f444IFsh+Rk8y8+yAjZHu65V+IQdBfP5XwO0YRVrFhqHHhUugJx9YA7ufO2Tuxe7aPbUytzkPbH0aWr3u7TL0qlSuZXaaeZGsyfuWlpV31waOO4TkvsnD9F8U4Ueqhxw2zu+kB9e+Atfts0XhbIqqzvuBhb0Cs7xnXuoAcCLKcy0RttpfRcQbaD74uHYhzWiBjmFqkWSQ9VQl13O5i5H0iRp5FiU0Q1yTYMvK0R9GRGQREOg750vq69OS/2rRlDrKXS+5r9eemduH3laxiq3lBoNgFaybwwuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L1+dFv6C; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kowsjois@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L1+dFv6C;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=kowsjois@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZrbBw2B8Rz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 May 2025 19:02:32 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5452Kt0h032266;
	Mon, 5 May 2025 09:02:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=fOlkZ3Be3x7L2nM7kjnPFjF9SArSVx
	AEPRD4qfLJVR0=; b=L1+dFv6COilJwzRHEhcPaWdZ8UvlXlbse3+bUMLTn14cp/
	gY4Ah7OdOai4bVBo5PDVQvBwR+HIpmfKJ8YEDh05PoivRxCDxyvA2wr5m/Fb1630
	0R9+QuTbCMwl1wVvnkDSZzcH4HMwZtb1N6NDpsNX1/jPnGnpp3F8FW7G/5qQuh7Y
	k/iPPDYC306OA1frkv+lf7ilvz/Xa40rz7BFLT2fcfq0P72qgYxThLO6axbwV2Cy
	iT7Nyh5KU7OfFiBZYxzvFEaY0GHLkEsLwmummfupxPnf6IlxtsgaRTrDEg3DGlhJ
	cpYALWUIw6zOdLlcEF0SHSdFUzn5HQ5v/N/K1bjA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6ysqjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:02:23 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5458tV0r017111;
	Mon, 5 May 2025 09:02:23 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46ej6ysqjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:02:23 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 545803Hf002815;
	Mon, 5 May 2025 09:02:22 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxfnngg4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 09:02:22 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54592Idv50200894
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 09:02:18 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 586372004B;
	Mon,  5 May 2025 09:02:18 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7DA9020040;
	Mon,  5 May 2025 09:02:16 +0000 (GMT)
Received: from [9.43.3.121] (unknown [9.43.3.121])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 09:02:16 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------NM4xryyQ2q9NqmgqV6EPi6h9"
Message-ID: <56d6e96d-29a9-4d2b-aa64-059c17ce4f1d@linux.ibm.com>
Date: Mon, 5 May 2025 14:32:15 +0530
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
From: Kowshik Jois B S <kowsjois@linux.ibm.com>
In-Reply-To: <20250501041056.1281055-1-haren@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OmP6wn6DFv0PAqQETj51Z1qgd2fceUZw
X-Authority-Analysis: v=2.4 cv=GKAIEvNK c=1 sm=1 tr=0 ts=68187e9f cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=dt9VzEwgFbYA:10 a=r77TgQKjGQsHNAKrUKIA:9 a=VnNF1IyMAAAA:8 a=-N88GMA1C97Ez57G5QwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=MwhoDN2aAihZLIMZg8gA:9 a=DFDLmz4WeuqVd2Oe:21 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10
X-Proofpoint-GUID: iylKTeEY4ppOyAZzPEJv2LsjBLWQUdGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA4MSBTYWx0ZWRfXzQP5fgP7gAoe 2UKNTuE04i85++Smj8+LWbsAor0OXkGmy6UEhPQ63KL0k/vLsgFedAtpRgH+3kulR8R5nuyCAub 65GUUG3gBOBhCewzsH/yKJjqTykLoqaMq1qaOezcm01br5s7eoN8lZoSBvYdVO9PnPCjNrwgM0N
 zdlWMCkw/I7CzAvzm3X4j96g/UxfHyjpCgkS8nflLUSjo95CET2c/qTQAi2W9JBFM7Pk8AB17HK nzFHcvjUMVJROEkTNBTSYpc+n64C/6hFmXikDH5oOUbZgRCrLbiNGjQ0Sb+DirQRMzmQroIc2hy T3NevGXmixsSPq8PnySWbgpXxqiQQ3HuPx47UGAHA0FJ13GcOSaIl1SMqXSQATHYeVyG6CLAYQU
 IoPB98sKAcXF5lMxOboiIlxSvYumL/w44cFMYS79ERf+CD5EXJ+TcUxLQNMUCfGKImtXJHml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_04,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 mlxlogscore=943 adultscore=0 clxscore=1011 phishscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050081
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HTML_MESSAGE,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This is a multi-part message in MIME format.
--------------NM4xryyQ2q9NqmgqV6EPi6h9
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


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


Haren, Could you please add the below tag:

Reported-by: Kowshik Jois <kowsjois@linux.ibm.com>

Regards,
Kowshik Jois

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
--------------NM4xryyQ2q9NqmgqV6EPi6h9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
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
Signed-off-by: Haren Myneni <a class="moz-txt-link-rfc2396E" href="mailto:haren@linux.ibm.com">&lt;haren@linux.ibm.com&gt;</a></pre>
    </blockquote>
    <p><br>
      <span style="white-space:nowrap">Haren, Could you please add the below tag:</span><br>
      <br>
      <span style="white-space:nowrap">Reported-by: Kowshik Jois &lt;<a
          href="mailto:kowsjois@linux.ibm.com"
          class="moz-txt-link-freetext">kowsjois@linux.ibm.com</a>&gt;</span><br>
      <br>
      <span style="white-space:nowrap">Regards,</span><br>
      <span style="white-space:nowrap">Kowshik Jois</span></p>
    <blockquote type="cite"
      cite="mid:20250501041056.1281055-1-haren@linux.ibm.com">
      <pre wrap="" class="moz-quote-pre">
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

--------------NM4xryyQ2q9NqmgqV6EPi6h9--


