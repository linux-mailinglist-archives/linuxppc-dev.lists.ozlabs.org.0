Return-Path: <linuxppc-dev+bounces-11497-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D090FB3C341
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 21:43:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD7wT3XCvz2yfL;
	Sat, 30 Aug 2025 05:43:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756496585;
	cv=none; b=YwTW8HgVOdaUxtofLklITkip2LQ4iv1ZQAQAtT0rTt06oEyRA76cYIaRYRE7Wz6LOc3uPgP7UzLZFrdItZA8ReyrTsMllpYXPnUQeIHpG4GrAlHyNu5fAB6OO9mqCpjZOcHjhxsuSHFmSgf382sW/5MfuOPJZEJpw/PpKg5lVTbvrv5mSnMpqj1m0VzelgpiSDYsKPyUR2H2EXDA0Smcx0lvMPNlR8D3ldWu2Qtm2Om+VjhM0qbmOQr9f6AFKMoiAUpwiBq14ebyqJzTmXnA5nLG+34rByHG/JthWkFxwlrHogapi23ibVwgKyzT/LXxqtV+num8OI/62oyJohkziw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756496585; c=relaxed/relaxed;
	bh=RM0D7DGr4gLEoWPxTjW6YftEdNrkUNeUegi0EdDVWOo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lkBb0XMiyRfSdYzclTSwaQzSmxswPNdE7vD8yLM3DqrnBIHDSrbpzH3yHAjXfe92BUiCrm2CHmbjtJGVlUL4VyJ+3bRWZvbR3VafSGf4nSMrCiQDFOcL/sfpxp+Uz1p49wNu6oSgEANLK+cFoMvIdKsboIbVQK+KZf/lk8hG6/2MFB2sG7zgZHJmM7zaF1B0ipFz58TZDtdt+piclko7TJrDNExwz+C1nwDiCdRfSHwk/6obQGhZGaRMCsPT0m6SMSIiGu93n/BcecUI97Kc2UUkCm2+6zRglkW+bn5EW6qQwqNVJtYr7u3Vk2HvukqRRyzGnE0zmE7Bhr1T0EMH8w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LQAr7wKr; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LQAr7wKr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD7wS3J8lz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 05:43:04 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57THA9PH012880;
	Fri, 29 Aug 2025 19:42:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=RM0D7D
	Gr4gLEoWPxTjW6YftEdNrkUNeUegi0EdDVWOo=; b=LQAr7wKrTMsx+PCth56VHD
	B50iDhc2xlOcei6jXMEhhq52FJTDbJsQd0RnTTU2Jwslh1RblDPRE29c6D1Zwx24
	9SyPlOfqWRdJsSi++aKBibv3wZsaeWdK3ZjCORxN83a9BtOjq+CV8OfphcB1zzho
	2ULRWmgnFIGM9fbyqmo2YQyx5DAUZnkM0Oz8SnwVfCJ25Ouj7I9wanM/tr2/L7z7
	TMmgdcmx2b+IGwHop2Q1GC7ZLPEMIs4JU1424TtYGNKTSkRQTTthy/UGLeJoMUqQ
	WjIE1ZpHGRQYHw8fzx2dxV3SSgBtmjJHDwN9OUVvI6GBdxR0kshCtSPkqzLdwqbQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5aw1g09-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:42:55 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57TJd9v6017948;
	Fri, 29 Aug 2025 19:42:55 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5aw1g07-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:42:55 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57THQEdr018009;
	Fri, 29 Aug 2025 19:42:54 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qtp3u1x6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:42:54 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57TJgofl20972172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 19:42:50 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7EADD58055;
	Fri, 29 Aug 2025 19:42:50 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CEF8E58059;
	Fri, 29 Aug 2025 19:42:49 +0000 (GMT)
Received: from [9.61.25.56] (unknown [9.61.25.56])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 19:42:49 +0000 (GMT)
Message-ID: <e6e8c9bf-0163-41c3-8f60-a996c5da3187@linux.ibm.com>
Date: Fri, 29 Aug 2025 12:42:49 -0700
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
Subject: Re: [PATCH v3 1/9] powerpc/pseries: Define papr-hvpipe ioctl
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, hbabu@us.ibm.com,
        shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
References: <20250828230845.2291249-1-haren@linux.ibm.com>
 <20250828230845.2291249-2-haren@linux.ibm.com>
Content-Language: en-US
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20250828230845.2291249-2-haren@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sADBOomwhNMcs0duNs-i7tqr3IzQmFWV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX4mMxbvrbzMzB
 irKmYOXYrnzgdrs7JjCBjppzA64BwZmW7hbxGHMB2yb7QiOZR189ExX+XqWNbIe6xB0hfua2+2Z
 hAkK4THv12H2+pDQ9cWOgRcNWELlEukUhOBLGdnqycZ8dHTutqxSqRfPyUTSbgGMTt8RzgfX1Zw
 mJPOMBkct4S2rJO4Qga41yEz/sPhPqE2loUCavFC4dzmlT7fp+Joe4p5WdhYSgbUxxLxjJZzqft
 tcztF++XYbCZczSeg1i/u7Vo6pZ8AH6TudYB51Mk1nuFWh9GH7/Zss1YspTPXEHttgoEaRUQwVS
 DgiHD70cBNTK2tjF0TmsVtaZpnM1GhWHqbBqEmY/NbhcF34lzAA8zCxWxk4xDO9ObCgxUerUu4a
 L+eSyVf6
X-Proofpoint-ORIG-GUID: fr59MPxkpKZcOB8qApVl3RgD2tJkdl6v
X-Authority-Analysis: v=2.4 cv=SNNCVPvH c=1 sm=1 tr=0 ts=68b202bf cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=glM6xr-iO83DlMjVAsgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1011
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/28/25 4:08 PM, Haren Myneni wrote:
> PowerPC FW introduced HVPIPE RTAS calls such as
> ibm,send-hvpipe-msg and ibm,receive-hvpipe-msg for the user space
> to exchange information with different sources such as Hardware
> Management Consoles (HMC).
> 
> HVPIPE_IOC_CREATE_HANDLE is defined to use /dev/papr-hvpipe
> interface for ibm,send-hvpipe-msg and ibm,receive-hvpipe-msg
> RTAS calls.
> 
> Also defined papr_hvpipe_hdr which will added in the payload
> that is passed between the kernel and the user space.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
> ---

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

