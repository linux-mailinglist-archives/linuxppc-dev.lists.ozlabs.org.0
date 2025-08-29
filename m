Return-Path: <linuxppc-dev+bounces-11502-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD780B3C35B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 21:51:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD86S5whKz2ywh;
	Sat, 30 Aug 2025 05:51:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756497104;
	cv=none; b=E90OBXgYFpzRwFJ32BgycrURqz2nKaeokvhl72XqshwkEv0bZSJtv3dAem0q5pEwApUoXzRaJUNYWccIWTfSKg0QQCwlJZt0emfrRjKAJjBXQ/Y0rTmkapVy7ND+WzqVQ9zg5PodnMWex2sacX1d6CylnaHHQi0KypHrdpB3/OiydHe10m1ZNJOcgrFoYygfOamb/ZS2zpZt9sMh3ioXhob4SuKae/XA/2eKF0RZ3p16R/ok7+Qmvtc14rwhlxCvi/WpYp2f71BIg3rBs9QDHgbWQdcUKCso7RVQGIp68Fn3VYcIug8ybuzlvN68vujQcLTV4Sd7RD7LgF1Sj3NQyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756497104; c=relaxed/relaxed;
	bh=tGaTVytIOqc6V5h/Xr3e5lYGqrJ29MKJdAyZ+CHK1oY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VJxkK6lSzFwPZZY3ytK1HSMap6knHscTBLiUE0N2MBOnOlY27a7R/T/egt53jnoWh/56tibcvBFocqnSoTxs9w3sH5XTIypKD40xoryX0A7oCbASjl/RbiRGHTaXtu9sgSZt5lieApDji798eyxvvsAXFMUr2Er9hULF3ssmxuY2xk1QU/SnRBScth2BrJt0wNT5nPRDDWkAQY4VoWSg+YpDGDaOrk0LIPv698jBddQpTUOeYB3LkjKIE1R4tz6eqoktRHpuatAhZ8ATV3qTO1sItmR7EvACQOqFys5sDj4WsF43DJb37CobaR69sbl983g4RoMuD/Hy+LcpHUyTww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HgqYytoG; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HgqYytoG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD86S1D3cz2yfL
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 05:51:44 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TIFxDL007535;
	Fri, 29 Aug 2025 19:51:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=tGaTVy
	tIOqc6V5h/Xr3e5lYGqrJ29MKJdAyZ+CHK1oY=; b=HgqYytoGJM6/RBJT8FOP1Q
	6Ar6z9ZKw8SAc/lX53sAY66ugh2ss0/DufvXdoBxMiWZNrrR6DhTbw5V2Twe3aFA
	XvYByZLI9ln7R75LQ3ozGlgAWUbhHsPNtIaMbKvV2lIPoXWtRzcxYMGUXRu6W04Y
	bdgnGYTMe6lkWyXeeO0hHkDiUCfK7xjl4YWeqo+tROmAsbo8v3sT0LNccyCPq4RQ
	qdWdzRvD8voUv4kDTj2KW+CL6uZbpniY1tPwImDTfhmhWa0i0P14ksQC6nJb/N1U
	qq0BkVH/BGyi0AEosrqdOGgH8kX/lHGJRIfzr1UQtUj0luSTgapCvBK8mt4vyz1g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tsv9esj8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:51:37 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57TJpaYE003250;
	Fri, 29 Aug 2025 19:51:36 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tsv9esj4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:51:36 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57TJDlJa002531;
	Fri, 29 Aug 2025 19:51:35 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([172.16.1.74])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qryq3ecu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:51:35 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57TJpWeD1573506
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 19:51:33 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B459058059;
	Fri, 29 Aug 2025 19:51:32 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09A3458055;
	Fri, 29 Aug 2025 19:51:32 +0000 (GMT)
Received: from [9.61.25.56] (unknown [9.61.25.56])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 19:51:31 +0000 (GMT)
Message-ID: <d059c878-e903-4a89-98fa-a833377cb72b@linux.ibm.com>
Date: Fri, 29 Aug 2025 12:51:31 -0700
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
Subject: Re: [PATCH v3 6/9] powerpc/pseries: Wakeup hvpipe FD when the payload
 is pending
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, hbabu@us.ibm.com,
        shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
References: <20250828230845.2291249-1-haren@linux.ibm.com>
 <20250828230845.2291249-7-haren@linux.ibm.com>
Content-Language: en-US
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20250828230845.2291249-7-haren@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=GqtC+l1C c=1 sm=1 tr=0 ts=68b204c9 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=dywDnh1ucUBHAVIgvkgA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 4xMQBolLNc0WVrVrQyNM3_Q1RKE5B-VG
X-Proofpoint-ORIG-GUID: 4yX59GAQ6ZIzTM0LBLqkrX3XZSFkbs_0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDEyNyBTYWx0ZWRfX1T5jyDhLVu6/
 NUmFX2T0PSrQIuXlwEDsQkaeH9ZE31L0i/Ed7eVH5w9Y/h8Ht5Q/LtiAOXrJ1bAySpwf6XY1AcF
 pURqGtrYvYJLKCGsrKVF07BRmWKdpBMNAEHDfQG/LY281RhWaDHMK1aP7RlZH4LZ8u1ox9IL1SX
 FzzsCiOln1y3gvnmsxguJUo0o+c/vntSiThRJMQHXhz7dr4Zf0pLwSL5LHD/ENzR0WlUae0oYJE
 Gh/BvH6echIf35kj7pGd8CUWzADVgoKW7X4TabEXmqCTLIpB883FprWTzhpsogxVqi1boYq6HZG
 /UmwwP1YfmRIHZ0bf6JgrJlCHu3ahQPsQN3VuGX8mjczjbtyEYiXSzaHhEolm6PcsYzdaif7/KT
 Rg03/8gO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508280127
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/28/25 4:08 PM, Haren Myneni wrote:
> The user space polls on the wait_queue for the payload from the
> specific source. The hypervisor interrupts the OS when the pipe
> status for the specific source is changed such as payload is
> available for the partition or pipe to the source is closed. The
> OS retrieves the HVPIPE event message with check-exception RTAS
> and event message contains the source ID and the pipe status.
> Then wakes up all FDs waiting on the wait_queue so that the user
> space can read the payload or close the FD if the pipe to source
> in the hypervisor is closed.
> 
> The hypervisor assigns one pipe per partition for all sources.
> Hence issue  ibm,receive-hvpipe-msg() to read the pending
> payload during release() before closing FD so that pipe to the
> partition will not be blocked.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
> ---

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

