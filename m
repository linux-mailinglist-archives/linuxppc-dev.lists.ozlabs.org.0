Return-Path: <linuxppc-dev+bounces-11234-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 440C1B33618
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 07:59:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9KqX74NVz3cYJ;
	Mon, 25 Aug 2025 15:59:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756101544;
	cv=none; b=BmW0UTKZTG0Tw/10ZsFYGrRlAxD0Bz5a6K0LasIfKxoeJxLujuKHD6SW33QDPFt4Nu0ORqlEJutjFcZkJC1+UNCIGFFSiHk9D76TDKDtoq0gC5KyI7HldXfrwOQ6+PdOI7NJbTpiNB2RkgOouuoXiPxDxywIhMiq5ERvqb8k1WXBSn4KtQzRbATM02fUketa0fGe/fYwkqpKgT6+i7YHmyY/pCwSehIA7WplbhJCqfCd2VhjlFHLcG+/qoyL10BzQts9W7mU81ZFJc+QNls+niHFxLXCsVuyZ4fsQs9GAqToJgfpuHDbXi5tDOUlewK4O9LlK/WOL01oqK4yTjwPDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756101544; c=relaxed/relaxed;
	bh=qMv61MIXS/RzEfGB2lBTFOA1CH9ZK/OwnIJHqvIkQZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eAwSUzNTAYvxihYgWo7VQljgPVl6+kEH9ikinFMsIvszin20fZx73xGfn0pAwyFy89T/sYB2bsUxzPCSPTuT3XjIfBCpMM47pHgA7HEanWDkZcu5dCE9PJ+OyMveRwbzsiWwWHesolPvdbIe4JYZBeMxkBAZ3lkX52sQBsimQ6ZLqqeovtkbud3c7AP/dz/h7E3SaE3Q2mZonSOaLQVNIcEHSLzxlzYWCMuIX2MaExlPdmaqJnMTATrbjn2NA38cJkqw9nc2fftrfoKnr1znZKC39/FIAUDhWYEkzFofnNVZSjtdcfO4R9DIcg18FGA3wIF75ND3detOgcHwfS/j8Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ntopJ77n; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ntopJ77n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9KqX1T15z3cYH
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Aug 2025 15:59:03 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P5GoCi010140;
	Mon, 25 Aug 2025 05:58:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=qMv61MIXS/RzEfGB2lBTF
	OA1CH9ZK/OwnIJHqvIkQZ8=; b=ntopJ77nFfJpNTktx+9n5RiryQqyTTUc/3Eub
	bNUFl6sYlzfjbFj4fvsXZq6jkU1jwKvDOzGkY1E0l+chIctq7RmNr8yU9qMcet+R
	6s2dR+CZRu9WHEUgeOSkPdyyTPUvVVwgHuhjvavWaJJYE//AqHJaQJQi3iq7ohZ+
	TmZKcmWF24mPNV+1vEOXmUxnh+V46gm8AxfAd4LSd6uHPlgJNbfZm+8k7qI316mc
	mQ2i80bI/kWKqu5Rg2DT+WO9cqbyNVWkKrpfMxiKznpObrUc8MBmjLteCUKd4cdm
	b9hYKdlMcXRZ0cHK8tjdiaaoGU05SRn5cqp/n8iwprE+EnGjA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q974xhtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 05:58:54 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57P5ws9W028053;
	Mon, 25 Aug 2025 05:58:54 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q974xhts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 05:58:53 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57P5bSxd002561;
	Mon, 25 Aug 2025 05:58:52 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qrypcdyq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Aug 2025 05:58:52 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57P5wmOB35783138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Aug 2025 05:58:48 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C10D22004B;
	Mon, 25 Aug 2025 05:58:48 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5FF3920040;
	Mon, 25 Aug 2025 05:58:46 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.124.213.91])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 25 Aug 2025 05:58:46 +0000 (GMT)
Date: Mon, 25 Aug 2025 11:28:43 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Haren Myneni <haren@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
        msuchanek@suse.de, tyreld@linux.ibm.com, npiggin@gmail.com,
        bjking1@linux.ibm.com, hbabu@us.ibm.com
Subject: Re: [PATCH v2 4/9] powerpc/pseries: Send payload with
 ibm,send-hvpipe-msg RTAS
Message-ID: <bzukfcszv6bm6np3vars73x4kjl6zfh6okwmbetmranzaan34o@aufmggdubqz7>
Reply-To: mahesh@linux.ibm.com
References: <20250812225715.339225-1-haren@linux.ibm.com>
 <20250812225715.339225-5-haren@linux.ibm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250812225715.339225-5-haren@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: pFl77ibAsb11rM09pOfTyDaO9U-EPGZO
X-Proofpoint-ORIG-GUID: 8y4-U13uQHXtFElAd4hDHmoZ1Kw4rxRX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA3MSBTYWx0ZWRfX++KXk3ea6Jci
 eQaZ3/k/TNbmxqbmMNxT6FyErBNGPLyds0XjhYLhd8oT3X/5ke+VtiJ5+K5lvQMLyuwfFZGIiJM
 U8owdRE+CozwG7ZRF/i6EN87EOAsiutexyavCKtwRjdAZMno1ENTYTH6dex93GYT/n1qxrPwAG2
 3wfkCwN3JP8UZfyFDd1a3nGlKkxs2rXtqhj1XPUbMZ9hO6kt/V4m33W20X5I264O2acprVFxHlZ
 COimvF8A/UVR3ZKBoJmrxSkK+i91iN5sCARVUxs5X1dq5l74kuZTe8uLMe1sEHPTkoV5JDHXu8J
 Jh9a1K6nilROW3SRlD526usS4CiJVB2LKxL2VJ0l+tzvvTP/+RhxBRJCftt6EF/Ln1K8hOnfWn4
 j+78ZBD9
X-Authority-Analysis: v=2.4 cv=RtDFLDmK c=1 sm=1 tr=0 ts=68abfb9e cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=kj9zAlcOel0A:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=hpovtUFNlw5HC3D-Yk8A:9
 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_02,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230071
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-08-12 15:57:08 Tue, Haren Myneni wrote:
> ibm,send-hvpipe-msg RTAS call is used to send data to the source
> (Ex: Hardware Management Console) over the hypervisor pipe. The
> maximum data length of 4048 bytes is supported with this RTAS call
> right now. The user space uses write() to send this payload which
> invokes this RTAS. Then the write returns the buffer length
> (including papr_hvpipe_hdr length) to the user space for success
> or RTAS failure error.
> 
> ibm,send-hvpipe-msg call takes source ID as target and the buffer
> in the form of buffer list. The buffer list format consists of
> work area of size 4K to hold buffer list and number of 4K work
> areas depends on buffers is as follows:
> 
> Length of Buffer List in bytes
> Address of 4K buffer 1
> Length of 4K buffer 1 used
> ...
> Address of 4K buffer n
> Length of 4K buffer n used
> 
> Only one buffer is used right now because of max payload size is
> 4088 bytes. writev() can be used in future when supported more

Do you mean 4048 ?

> than one buffer.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/papr-hvpipe.c | 120 ++++++++++++++++++-
>  arch/powerpc/platforms/pseries/papr-hvpipe.h |   7 ++
>  2 files changed, 126 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> index 5768d072859d..c30f4d75e645 100644
> --- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
> +++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
> @@ -14,6 +14,7 @@
>  #include <linux/of.h>
>  #include <asm/machdep.h>
>  #include <asm/rtas.h>
> +#include <asm/rtas-work-area.h>
>  #include <uapi/asm/papr-hvpipe.h>
>  #include "pseries.h"
>  #include "papr-hvpipe.h"
> @@ -59,6 +60,51 @@ static LIST_HEAD(hvpipe_src_list);
>   *   return code for failure.
>   */
>  
> +/*
> + * ibm,send-hvpipe-msg RTAS call
> + * @area: Caller-provided work area buffer to send.
> + * @srcID: Target source for the send pipe message.
> + */
> +static int rtas_ibm_send_hvpipe_msg(struct rtas_work_area *area, u32 srcID)
> +{
> +	const s32 token = rtas_function_token(RTAS_FN_IBM_SEND_HVPIPE_MSG);
> +	s32 fwrc;
> +	int ret;
> +
> +	if (token == RTAS_UNKNOWN_SERVICE)
> +		return -ENOENT;
> +
> +	do {
> +		fwrc = rtas_call(token, 2, 1, NULL, srcID,
> +				rtas_work_area_phys(area));
> +
> +	} while (rtas_busy_delay(fwrc));
> +
> +	switch (fwrc) {
> +	case RTAS_SUCCESS:
> +		ret = 0;
> +		break;
> +	case RTAS_HARDWARE_ERROR:
> +		ret = -EIO;
> +		break;
> +	case RTAS_INVALID_PARAMETER:
> +		ret = -EINVAL;
> +		break;
> +	case RTAS_HVPIPE_CLOSED:
> +		ret = -EACCES;

The status -4 is Pipe connection is closed/unavailabe. Instead of
permission denied does it make sense to return -EPIPE (Broken pipe) ?

> +		break;
> +	case RTAS_FUNC_NOT_SUPPORTED:
> +		ret = -EOPNOTSUPP;
> +		break;
> +	default:
> +		ret = -EIO;
> +		pr_err_ratelimited("unexpected ibm,receive-hvpipe-msg status %d\n", fwrc);
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
[...]

Thanks,
-Mahesh.

