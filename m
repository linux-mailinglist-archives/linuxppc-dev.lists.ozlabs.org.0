Return-Path: <linuxppc-dev+bounces-8960-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B048AC5C5B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 May 2025 23:43:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b6R325VwBz2xjK;
	Wed, 28 May 2025 07:43:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748382222;
	cv=none; b=HUHAI0z4bCD/P/3addgJx8JT9eaFevkzzIUCZYFLU/6IuF61meHUfUZWmNSTJqX6XnStf4sGcGDjgLm1HJwoK5FLNQR52RQgGPnulskY4ksNlOgDdLiJ92Wxle2ivRsuN4UZou9P6ln6PbtqxR6Q82jzHORFtR5fU0UqQCXkNgtooTa3qftRLYWaQGKZlCbW00zgcxLkwbuq20Y4Wds060Z/3Tq1frFekJXou1ko1fmi0E74gq7uQMjXCJ7q/B40dQA2u4chGD8rWnCrfCzjrTJpt02kmwhzAqgEgRQjmQM3rLa4bRCCfDXwC6/6dsU1xHDYjvYNvUQLkMWZorqxJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748382222; c=relaxed/relaxed;
	bh=Qo9uL9kCGaGIZ4mSnSwsLjpuAjhwikZmWYnd1DAgJ54=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bwD8FRMoHdiadXyOBdfH5IRK1JbVsfKFZewS56puK8xTVwhLMkIhJ+T72RJnqz57MWhcSDvvGruHhmdYJiDlcj/C4Htt77ykXpgC4R/9mo8mkeEdgBJmtD21BjSCWNClzI5iRmLnKhl15TTTtvTHSNY3NjzF9KVOnGyS/DdnVR1b8E3LiRA37fsTuvTD7rusjmmh/cN6BPuXpXPJBQF/czNjjgs2dMjiGsM9/VpV16TT6EUn9nCvRKeRneCJ4Dqjove83AxJB6OUDioYt9bmo2L1iap86HzGd00+1egAu0PBARIQK7iwoVD/Zd4qMOArsOvl+7pY3PvTgECiuOo9tA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n8q97jop; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n8q97jop;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b6R315zP5z2xPL
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 May 2025 07:43:41 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RGHUpY012620;
	Tue, 27 May 2025 21:43:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Qo9uL9
	kCGaGIZ4mSnSwsLjpuAjhwikZmWYnd1DAgJ54=; b=n8q97jophEQaspKBKsQalM
	17SBADDoA8GT8KQB+8clyi4QOoD3Od61CoINlvowgX2YUyvddFTVaBqmxemyw3Qv
	A+S6q7EHe9EMF31U3wwGQeflfWFnt/3tBn5dYzfTiEn1gauOtYN7NXqQ5eiyM6/+
	MiEFYauX58w9CnM2fY6glpdIfBj6gkIqGzFihwEJ3gRAvVGwxN5UJ4HHKY/xD/fP
	aCcNhuhepn4VjT8KtYfOaJGyOpdlvLtpgBZ6pgW4sspnPT3SD00i/T11UuSaFpPC
	aK12FN3O92GReL3gj77t848UaWyhWfH+B3v6D8dtMkpDgg1YiF3AP4dksL8umRsg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsg9du8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 21:43:32 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54RLgXJ0018815;
	Tue, 27 May 2025 21:43:31 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsg9du6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 21:43:31 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54RLVgHh015830;
	Tue, 27 May 2025 21:43:31 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46uu5347bj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 27 May 2025 21:43:31 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54RLhSgF14746130
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 21:43:28 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9A6D45805A;
	Tue, 27 May 2025 21:43:28 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CB0CF58056;
	Tue, 27 May 2025 21:43:27 +0000 (GMT)
Received: from [9.61.89.125] (unknown [9.61.89.125])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 27 May 2025 21:43:27 +0000 (GMT)
Message-ID: <d1952af6-4286-42fd-a0c1-007085972c97@linux.ibm.com>
Date: Tue, 27 May 2025 14:43:27 -0700
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
        hbabu@us.ibm.com
References: <20250501041056.1281055-1-haren@linux.ibm.com>
Content-Language: en-US
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20250501041056.1281055-1-haren@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=OIIn3TaB c=1 sm=1 tr=0 ts=68363204 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=88KzDNdXGdMWfYVolboA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: zX8M0Rm0zVM89eNSBy7ydtoxa6hYIfcc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE4MiBTYWx0ZWRfX649Ks8yKkyNl yIQveUm/yKjgsN4gztgThgu9m6VPyIXLQfxzyNkat990nrK01INS4A8riL7GAoe83Q8WRdI4z0Z R8WtciQw64QA8OfTfefEHxhTvb9zGX4w/SZNxerP9x3TLywlwRCgO02RSUsREQqzMLnTty6/F2k
 fHfHamJrUJH1LnU2R9ciyu+jePhfOMS0uk+raK5Fr0f2kyk1BsAUbNB8Fz/TZkLNQ+LfRFFZZka AanqNdq2v/H/RTFe+wXUwp0kUxvu/fnJsl3B80HZBJP41KxY40VhN9x8wNQ8y+XWrTJZd+l8knZ lefcaHXiZMKUz0UksIirSp5Rs/Hn5GyFqNcU4DYMrRMbejZ3cyQAnJ3/5a4P62tRZLwxOcOXaX6
 NbHx0J85pQjnfSfQ2tHWrV2yh5JSfcZ6WBIF9byelgZ7sdDSYGdqwgCpWj5RY61I5vXr7gpf
X-Proofpoint-ORIG-GUID: 0OxfndOQqDxPHybRoPys0eo4pi_nJKZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 clxscore=1011 mlxscore=0
 mlxlogscore=628 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505270182
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 4/30/25 9:10 PM, Haren Myneni wrote:
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

My only comment would be maybe mentioning that this issue was discovered with a
KVM guest which would be using some version of SLOF firmware as opposed to
PowerVM's proprietary Open Firmware. Older Open Firmware using ibm,drc-indexes
would present the same issue, but is probably less likely to be encountered in
the wild as we got drc-info support showing up in the kernel as far back as 2017
which aligns with Power 7 that has since hit EOL.

Otherwise...

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

