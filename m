Return-Path: <linuxppc-dev+bounces-17360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SI92KstEoWkirwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 08:16:27 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A3D1B3B9E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 08:16:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMfkt68pxz2yFQ;
	Fri, 27 Feb 2026 18:16:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772176582;
	cv=none; b=H/3qUg3R2JV+Fa/NNt/op8tHksQB9mneiZMqn/TLkKKQBib43iER8FNrLoR816XzG94SQjRq7Za+toHEZ0daJRolgvY9TsTPxXggLQATZu4sStqha5spInIVhgoCLpgkqT7yQuy29VG8ASzVRMp53pl58RJQSBA2dnNL6VSTyy98Fp3ESpTwZhPG4MguaNevZG6Bfx4nZbaVCt8YCpk5gwis0JClk97+lzq5YUgFNvV0ARR3AeNHVEIRN8z3GWIxG+EGRCFLoaUMHLx5v3mtmkR8IhCOIXDAbXbnsG7GacFtGNBzh235rcCNooAlrWP4OwFAJJ+gLxjgnBfvPpf+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772176582; c=relaxed/relaxed;
	bh=wHj2y5ew45HfVKi2euSTCuHkpzI3ucqvYU76g69tx8Y=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=TxYNczQImFhH0FiLyQe/ynJxUUbrI25BywfIiN/XyYojr3DJ6FILr67VVIlgvOZ2OjTX14rofhoybCxY1096Q08iijK1afQ1rDLwWQjIddbSwC9CoIIvDEL55raVY8wv0FPH5d+OZoDuP+j1yPP0i7NB9Wo2GFgbZR1Jo4FifAsRHlQ+mV8ppqvN1AXkm/oL+OFIf789LavcJeo/UwW148aBY2hqv2eEPGJ5Rh16ZesRCoNEFmw3AC++PR0zClgdulwhPG02nfYpsx7GK7G2gWqsJf+n8DT9flKerJ0XFJtKyNytHlQvT6gJvMBg6voMDyMNAntkQXu9OdHFU99kqQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LzkrFMbi; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LzkrFMbi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMfks6vBYz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 18:16:21 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QKuixC2733894;
	Fri, 27 Feb 2026 07:16:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=wHj2y5ew45HfVKi2euSTCuHkpzI3
	ucqvYU76g69tx8Y=; b=LzkrFMbi2cBb1Q2Pphs1XEPzoke9TrwCHJbkJWQDtkiq
	E8jt7UO1V/ZtYUHrzC3YwGDxdF5FBu5l6y8eBbkQkijaJ0Z690mhGzYuJ9Uc7KMh
	yk/XCDpiX7HUODTGrvXKW7JYVw0VErq0qfT04yXWM9+xOnEVTcMaHi8W4wWbk7tB
	8pxFxB6+JYI2L62mIWC5HljNjKgFPgdXk7R8Yyl9ygWO0MxQnHeY+7FA41YmbVfA
	YYg25Y6uDXWSW1AEuXvi/z3e+SFxNVRIsePJukKt/w8v8aTyEkhS42ZwQpKyj2GF
	iha+/+d6FevV2gzMtrED8FMCAhuQcOlOXJxjGGKakg==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf4crbayv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 07:16:18 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61R76xgg001653;
	Fri, 27 Feb 2026 07:16:17 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfr1ngtpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 07:16:17 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61R7GHnZ26739410
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Feb 2026 07:16:17 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 08CD758071;
	Fri, 27 Feb 2026 07:16:17 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC86F58076;
	Fri, 27 Feb 2026 07:16:14 +0000 (GMT)
Received: from [9.61.248.160] (unknown [9.61.248.160])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Feb 2026 07:16:14 +0000 (GMT)
Message-ID: <2b5eda65-a1dd-4858-a6e1-ac2f183ec410@linux.ibm.com>
Date: Fri, 27 Feb 2026 12:46:13 +0530
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
Content-Language: en-GB
To: LKML <linux-kernel@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
Subject: [next-20260226] static assertion failure in amdgv_sriovmsg.h
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MBAWqL_58FqcIbUn9-pRyLugzUL7io88
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA2MCBTYWx0ZWRfX0J1tS8LUaMac
 ROLomPjLBf5SkWdZ23QSRNoFp0LHJoh3Z/R4UjKPSpZkBc+ou9/BDsqhUbuBRto7k/brQtl93pH
 lzxJB/fW3sfz2kUccu2FQVqUGvZunel8Z1P8QdlukwuWYL7Zo9WCnOkjid0LoEf9AGIkcA8NkvP
 qnkZnhiHkCR/TeKNybuccJiTSwX+LA2KiZTfDJYpqU2eQgsGem0TXw+xONsZYNW/SnZxKgf7AZK
 FwuhMIsnNdb/HfDvXXhP7+uSQYhXJKoXzy6DuXCaBw6wjJdbAkFL2zmofmPzTOIJIrkEyMxnJNB
 Za1jS3etz/urupIeW6baTiw6U+zoc3FMpY/PLwBkI86H7iM4qFfTKk3t9GVoYyjeRh8SX517zLz
 zSjHdzdrDbEKBOVl+oBnt+hVqAZRRQlo6afEKg+GisUXsJI/6W8ya3SOJbjYlEUTC5agtLdykw4
 HuvcVbIuFYo05hDFEdA==
X-Proofpoint-GUID: MBAWqL_58FqcIbUn9-pRyLugzUL7io88
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=69a144c2 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8
 a=w9wf-1yiSp_RLEyCJ0MA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602270060
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-17360-lists,linuxppc-dev=lfdr.de];
	TO_DN_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-next@vger.kernel.org,m:maddy@linux.ibm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D1A3D1B3B9E
X-Rspamd-Action: no action

Greetings!!!

IBM CI has reported a build failure on latest linux-next repo.

Build Failure:

drivers/gpu/drm/amd/amdgpu/amdgv_sriovmsg.h:521:1:

error: static assertion failed: "amdsriov_ras_telemetry must be 64 KB"


If you happen to fix this, please add below tag.


Reported-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>


Regards,

Venkat.



