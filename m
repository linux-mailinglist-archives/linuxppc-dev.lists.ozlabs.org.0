Return-Path: <linuxppc-dev+bounces-2089-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EE6999B24
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Oct 2024 05:22:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPsPp2Cs2z3bcX;
	Fri, 11 Oct 2024 14:22:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728605879;
	cv=none; b=evgSM4ImgHMMwaGNoW+jHg8xtuCxA3gHU+7sKaeGg8cvgYmJENQPcEwc3MuFExxlFwlYOJhf0rT40ry2PsZy+TNpBQPwODQfBI/sO2AnpvcggIALn47pgsPaLvWoWO6/8bsYAGiQ6Aufe9Yv/5Iod3vMURTen27/mK7jpB52gxXVTEXjVPeYHviXRFqrKmxszItrMS+OJz1PqpZpH18zrygMo4QSGeYNQslwlNcGxzffHbn/LLJzfOSveoVAU2O3ZpN4b9pmA4fgsULoQF1b5mlSkdjzCvo5gn+SsCXjJyPsujtrbBmZqnfknOtKKZsRxDyTly3lanGEaqZN8OkS6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728605879; c=relaxed/relaxed;
	bh=qhj9QjPhMY3N3l11uQGEoOZB1Qu4SEZj3Soa9AAkvms=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=D5JdprJQxjKQ+OsCLQx+cKHyoGfSblsOJmlQ/g75SMiKOVqxNIPJWq216scSURBdtgTsa86X4WchiUmRNoPrwnCWTJUu9jBSNy4gDj1zPqJpfZr+SndMnAi06F0ZZ2ybV1aLcCsqC7dLfDrKazzHCy2qJRYm0gAfK39NVSTzNBhJOqs2kFknwVlSAcK9W/afVbKCEEOIL5wt7GFx6x1OIX8uAoOJR69Ewoz3RY22FC3146CamToXajjBRU040bLHWeEQ4NKtf9J8AV8ZOfiCZ+s23ShQLlAEZqpub0XTz2Y3P/8EzakbPt5kuAjZHAJuPTZgnPSzfcbp9r+R3qjj4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKaeuRf9; dkim-atps=neutral; spf=pass (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_jjohnson@quicinc.com; receiver=lists.ozlabs.org) smtp.mailfrom=quicinc.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jKaeuRf9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=quicinc.com (client-ip=205.220.180.131; helo=mx0b-0031df01.pphosted.com; envelope-from=quic_jjohnson@quicinc.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1710 seconds by postgrey-1.37 at boromir; Fri, 11 Oct 2024 11:17:57 AEDT
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPnJj0pdvz2xFk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 11:17:56 +1100 (AEDT)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AJjQdS000324;
	Thu, 10 Oct 2024 23:49:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qhj9QjPhMY3N3l11uQGEoOZB1Qu4SEZj3Soa9AAkvms=; b=jKaeuRf9LdWpnvNB
	NFBShdRFQXyynqiREd0rHzQ+Q6Wny12zpyza530MXWdtAoxY51M5+cku/u6kEgUV
	ut5tMr7jRg4DQxjUTevIVJGn5JUV1xT4GVBESuGgYL834lne8tyipLTSqdxSiOy0
	WPqWjdYuqVMqSqhCoJu4s++8Qt7m4okT+aqPPJVL82OCIKU6UdHi10GtjIF7GAWv
	a4Hwsy+FFJPy9iht6wnOPEnHMWEQN+mNT+6VypYhz1Mhr3C+opjuaY4ktSH29pFb
	1UO/yEbd+85bphzvvRJ8SPPLKOg0RM/NhErzZL2oGpcpE9h16+bIN6njo0RiokiJ
	ISb3iQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426nc2gdss-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 23:49:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49ANn42x026374
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 23:49:04 GMT
Received: from [10.81.24.74] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 10 Oct
 2024 16:49:04 -0700
Message-ID: <b7abd0b6-ac96-48ca-8165-a3b408137007@quicinc.com>
Date: Thu, 10 Oct 2024 16:49:03 -0700
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHES] drm/radeon issues
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
        R.T.Dickinson
	<rtd@a-eon.com>, mad skateman <madskateman@gmail.com>,
        Darren Stevens
	<darren@stevens-zone.net>, <hypexed@yahoo.com.au>,
        linuxppc-dev
	<linuxppc-dev@lists.ozlabs.org>,
        Christian Zigotzky <info@xenosoft.de>
CC: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
        Hans
 de Goede <hdegoede@redhat.com>, Wu Hoi Pok <wuhoipok@gmail.com>,
        <amd-gfx@lists.freedesktop.org>, Alex Deucher <alexdeucher@gmail.com>,
        <alexander.deucher@amd.com>
References: <EE14413A-3528-4646-A353-DB5131E56BA2@xenosoft.de>
 <6C389917-EF59-444B-9C33-C3F9A9AD3921@xenosoft.de>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Language: en-US
In-Reply-To: <6C389917-EF59-444B-9C33-C3F9A9AD3921@xenosoft.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: tdJz5yjJOWf3Dah3YuI-X5mA9T24VSNu
X-Proofpoint-GUID: tdJz5yjJOWf3Dah3YuI-X5mA9T24VSNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=999 lowpriorityscore=0
 malwarescore=0 clxscore=1011 suspectscore=0 impostorscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100157
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 10/10/24 06:57, Christian Zigotzky wrote:
> Hi All,
> 
> There is another issue with the Radeon DRM driver but there is already a patch available for this issue.
> 
> Link: https://lists.freedesktop.org/archives/dri-devel/2024-October/473314.html
> 
> I compiled a new RC2 of kernel 6.12 with this patch for the X1000 and X5000 today.
> 
> Download: https://github.com/chzigotzky/kernels/releases/tag/v6.12.0-rc2-2
> 
> We need 3 patches for the Radeon DRM driver currently.

Can you provide links to all 3 patches?

6.12-rc2 was back merged to my ath.git project, but then my laptop
stopped booting correctly and I discovered a few Radeon KASAN reports.
Based upon my search of lore I found:

20241003060650.18454-1-wuhoipok@gmail.com
[PATCH] drm/radeon: add late_register for connector

20241007183241.1584-1-christian.koenig@amd.com
[PATCH] drm/radeon: always set GEM function pointer

But that is only 2 patches.


