Return-Path: <linuxppc-dev+bounces-11503-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D3F0B3C364
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 21:53:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD8901NmMz2yx8;
	Sat, 30 Aug 2025 05:53:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756497236;
	cv=none; b=YrTDaK0v1QvyMl3/+AvTCYC5P7VIjV9Sa+7zYCwoC6QJQyanI9ewTgo3/XbAr/lQwUCk5KD9A4pSNx9Ej3XFLzA9gwP41kOWsyu4ENUZTHcqp0EoQK0FK+qoNwPlLU6GbZCNCP1SQQOh+ymvyiLk5vvsdNTjqje0aWVpSG40p/bmgG9sdf0mmgQGo4bbK7VlkjKE6iWRJ+Mf+K+SwDpwL/eBcuawDEVEGqq4pZZ58F8nGk9tCHoL6cp0PDRuzoxqJeEudrjJMGr8EqeR9WGSDCHCdD0Wif+gquUhgtg9D/wH0N8oWBpOtRM4IGwLQJu0rKAA7Vv01LsGa0AXpP52nA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756497236; c=relaxed/relaxed;
	bh=xFMuXtLK+0IF6A4ktJkr6KRF1dvY42DQCh5FuFzJo4o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N5qipUq15lqZFZa6BOqW2xGFNjI5ScFZqynt3bwWRcXSYCW7ilLUNSoJticPdbbI/ZUvlS6J10dNpRk+T92oe6tFgOYZ37sVxsmZeK64NgEiip0tKR/2Z3cwdmdOq6Q/N5k/GW/TqphpBhyxwDcFb9oadNAvdodvrXygn+zMD6fwg8n8REU+Q355vuzMcbmGhSRzJChHWdkzkKetofdEsA31qgWmNhoMxoAJZBhh17B0qFVTPtxPUJbQltQLs46qY56rnYjk9HoBbeIVaARkjDLTZQ3Al2VzK85PDwNvii7h5PbMgo6H+EedZ7fd6NKA2dqVcyGtdWi2sumDPacuFg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lMa8efIe; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lMa8efIe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD88z2p2Tz2yfL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 05:53:55 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TIQd8O021058;
	Fri, 29 Aug 2025 19:53:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xFMuXt
	LK+0IF6A4ktJkr6KRF1dvY42DQCh5FuFzJo4o=; b=lMa8efIeAhMts7pysQf1QI
	6Gfv3j0R6FZUDdBXYD7NxzLYavSyjK2QhHL4Li9g7IxhIvYKzD9qy0RZy77vLKDu
	YEurcRB0lZPDOIMV2UK2kY0vrJeFlWt5lO0ZGUUM8gf5fUK/ImJfi6FGjWkZrhTL
	WijFk9a5exbH5PWHtTNNgyl+bhod5m7NYN4sIBpwyA9siBzPJga3QGfoWuwBRTtn
	ICtNMSyGKaaDKx0i1YVCLCT3ntP1YNmrwGC/nnfFKriyG9jlaW+c3Z12Vyro2DKu
	nJh6eOdfVRZ8tOIqiN2QQ/NeshShGl/hce5LWp/QLI3XEb9o33U/c8S37pSg3fpg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48s7rwchps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:53:46 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57TJo9Pk016088;
	Fri, 29 Aug 2025 19:53:46 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48s7rwchpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:53:46 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57TJl7hn029871;
	Fri, 29 Aug 2025 19:53:45 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qsfn3b9t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:53:45 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57TJrh6S15139486
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 19:53:43 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C81C958059;
	Fri, 29 Aug 2025 19:53:43 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1EBF158055;
	Fri, 29 Aug 2025 19:53:43 +0000 (GMT)
Received: from [9.61.25.56] (unknown [9.61.25.56])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 19:53:43 +0000 (GMT)
Message-ID: <bfa4ed9b-d418-455c-a750-e943cf1e5b42@linux.ibm.com>
Date: Fri, 29 Aug 2025 12:53:42 -0700
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
Subject: Re: [PATCH v3 7/9] powerpc/pseries: Enable HVPIPE event message
 interrupt
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, hbabu@us.ibm.com,
        shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
References: <20250828230845.2291249-1-haren@linux.ibm.com>
 <20250828230845.2291249-8-haren@linux.ibm.com>
Content-Language: en-US
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20250828230845.2291249-8-haren@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: FQbnhW6Ly_APX0ynpYpK6tzKeDLMr1Bu
X-Authority-Analysis: v=2.4 cv=fbCty1QF c=1 sm=1 tr=0 ts=68b2054b cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=bUowjRHX1pIY086CyHAA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: MPxzzF3qDloYw2ddncDO96KJbggeVgp4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDA1NSBTYWx0ZWRfX39fy+8c9ps9B
 r6l06ZZy7GTN4OP3js0tCdMAZoKPh1DXuu2sCBeAbnpkUz61GYqRdk3xVKELVXwts0jSxck59ed
 S2w9pataezgBh0bkrYiyGt7Dqx9hiXup2CaDaFYfxSGMY3X1EyyS2epJnR8vNN3YrIW8xbepnHL
 KlMftnQ3va14y+hm6T6FFAHp6ZFUJ3Wk1lpJLmJ5nYIAZAlF4q/hIs0Sd5XpHP5hHtp953rNtBW
 aL46Hj6YFWaHumdxbb4diyJCPjTQbyQ1Sv/8Ih1L4tJEhhOda/pg/6Cw57xpEitM0Gw7AyBAI9V
 aeeLmDnmFmjXrAnyuVkKIBtSjbOqSiy9ycmVc0qru1sqUYDqTPTxczp9hXHBSk4EVdx3UAjgTB2
 yqI8YRVt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508260055
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/28/25 4:08 PM, Haren Myneni wrote:
> The hypervisor signals the OS via a Hypervisor Pipe Event external
> interrupt when data is available to be received from the pipe.
> Then the OS  should call RTAS check-exception and provide the input
> Event Mask as defined for the ‘ibm,hvpipe-msg-events’. In response,
> check-exception will return an event log containing an Pipe Events
> message. This message contains the source ID for which this
> message is intended to and the pipe status such as whether the
> payload is pending in the hypervisor or pipe to source is closed.
> 
> If there is any user space process waiting in the wait_queue for
> the payload from this source ID, wake up that process which can
> issue read() to obtain payload with ibm,receive-hvpipe-msg RTAS
> or close FD if the pipe to source is closed.
> 
> The hypervisor has one pipe per partition for all sources and it
> will not deliver another hvpipe event message until the partition
> reads the payload for the previous hvpipe event. So if the source
> ID is not found in the source list, issue the dummy
> ibm,receive-hvpipe-msg RTAS so that pipe will not blocked.
> 
> Register hvpipe event source interrupt based on entries from
> /proc/device-tree//event-sources/ibm,hvpipe-msg-events property.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
> ---

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

