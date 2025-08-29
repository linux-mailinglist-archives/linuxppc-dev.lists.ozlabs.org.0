Return-Path: <linuxppc-dev+bounces-11499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9657B3C344
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 21:45:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD7yn4xwDz2xWQ;
	Sat, 30 Aug 2025 05:45:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756496705;
	cv=none; b=UDNklqK5Dp75XKtJ+oNL55BU/C3XjtXktkCK9JbzIh0WLmlzjBdl6AdhAQZjjAGibnfCsUiL38VUVkOascZtRB2vgiJL6ouIR3OX1Xts0k3LFRrfLY0Skf3v/HqlMU00BIid9wT7R+eUnOyjcb+uv4XWf5uHnKSZV0lDbvmBV0nYCPW4qBmQJca+aLoRzkA1RjOwgbs8lz2Nik9kLiuuHMa10DpF4n939OkMr/zbj0TJ6HtckG4rNUa7ncWzhP0qf6cFPO1hc600X24Ia3LvBb5j++1j7gwXDlkyzWkwuFshl9kPyXZ4kBgGioOgbpJoLaHrgEdd8l18IPDz96FzsA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756496705; c=relaxed/relaxed;
	bh=VnhbWf0mskWtvllgp23gF4xaBhPl3sTTXKo0qzy2MvY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DlQU3NaRZFt4vODcmzGP1fuBJpqYF10vuJzela+bn/PmZZqmBEPIxM04kSh/4dLJSLxHUwvnMx15Ub1+ZCEg4sZB02c8AZKCKgROSMlrP/IGNf5MLb11WnKOM7y22zmehtBurZqPD6SJXaQhaWgQH4nvdXAHcQO5d0nuTqn6n8E8nBU7smST5+aoZreOdoixWgazWOd87BdorWbGbc1Qa+d5K6Sz5RgkidBDGUOu3CTWU+zY3bIIejcVFD/eItnSkT7TGKN6BiCjQkxvxVxBFxFpcd9U8AHmBLD11u9/W6MVBx7Z/Oi0FppFnAjxxIlHT12iDg2DLfazNNOsPmVy3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WX75F+VY; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WX75F+VY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD7ym5rNSz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 05:45:04 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TJCBmF020807;
	Fri, 29 Aug 2025 19:44:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=VnhbWf
	0mskWtvllgp23gF4xaBhPl3sTTXKo0qzy2MvY=; b=WX75F+VY3N0aS3sFVC46Ib
	e2uR+dBrPJ03d67SoVMKWsZHv70vH3UJXy9dJDB30+0X5dQE3sZa38yigu3kakX3
	0DILqHd4YprW4WQhaoNN3izeMmOyAjotdZQ0W9ysqQFsrk8/OmfS13xF4QzVbk2a
	1GnEtW8PJriSQfvp3EzhgxsW5qP56aE+8Mm9YDVUQFXnF27eQGs/iF6gwp2gJ1AF
	W6JU5ze+inErd3ZhHI14+aXf6dI80OzZDuYQ+tMBiY0mxWXNxrC0ie5MX2TMcU0U
	7cGieYUDBO1siyZ3u5nYxDV6edP2vLqJJTzLBxzLneQ4dhHXtantqxIAJBlI7hCg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqh6gg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:44:56 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57TJh8pV008071;
	Fri, 29 Aug 2025 19:44:56 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5hqh6ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:44:56 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57TIZi14020838;
	Fri, 29 Aug 2025 19:44:55 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qrc13fjf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:44:55 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57TJiroJ30147172
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 19:44:53 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1442158043;
	Fri, 29 Aug 2025 19:44:53 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6403C58059;
	Fri, 29 Aug 2025 19:44:52 +0000 (GMT)
Received: from [9.61.25.56] (unknown [9.61.25.56])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 19:44:52 +0000 (GMT)
Message-ID: <93ba8ade-4103-4d77-9926-67dd433ad2bc@linux.ibm.com>
Date: Fri, 29 Aug 2025 12:44:52 -0700
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
Subject: Re: [PATCH v3 3/9] powerpc/pseries: Add papr-hvpipe char driver for
 HVPIPE interfaces
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, hbabu@us.ibm.com,
        shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
References: <20250828230845.2291249-1-haren@linux.ibm.com>
 <20250828230845.2291249-4-haren@linux.ibm.com>
Content-Language: en-US
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20250828230845.2291249-4-haren@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX9psp+sGWqo3+
 V/UQfPsbAIXnCAfTvwLUbZoZtzC3LjKvG0arYMop7vus7S7AT7cyB8zzVc0b7knoYdo09BGm3PP
 9TaVLwz6QsPgbSzGxXXEV1idY23DmQVcCfAgWcjmT66R4kg4d4xbp/yGoSI8acaPST2PJpnJ0sU
 0jc6IYWdREF+CtlyIyIUV00aqTDMZovlSy53HY8qbZ3qcqSAsC4ErJXikceCPt7IEnSXV1Px53R
 oyJcg3hm+aD3y8+1DhpZ8GxNlDkbWHJeMl/uhT9RSn0squYweJ03F1T4TCBExxRLtxxmZ/hDIYN
 KC+MTec6Btt8OdRKo1m8vM6s57pUKP13n5I/y+egaYppDKYy5zlUuQXIVqj5chRnA0JLX7VyIdq
 E5rTDXys
X-Proofpoint-ORIG-GUID: BOTw0an5DLuVGfcpVMUKRSxiG-1URnT2
X-Proofpoint-GUID: 0IKnfKqQmtEpmczFJ0ga1YkvwVY_WDhr
X-Authority-Analysis: v=2.4 cv=Ndbm13D4 c=1 sm=1 tr=0 ts=68b20338 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=u2i_PfLWSe-u9IUBDysA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 spamscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/28/25 4:08 PM, Haren Myneni wrote:
> The hypervisor provides ibm,send-hvpipe-msg and
> ibm,receive-hvpipe-msg RTAS calls which can be used by the
> partition to communicate through an inband hypervisor channel with
> different external sources such as Hardware Management Console
> (HMC). The information exchanged, whether it be messages, raw or
> formatted data, etc., is only known to between applications in the
> OS and the source (HMC). This patch adds papr-hvpipe character
> driver and provides the standard interfaces such as open / ioctl/
> read / write to user space for exchanging information with HMC
> using send/recevive HVPIPE RTAS functions.
> 
> PAPR (7.3.32 Hypervisor Pipe Information Exchange) defines the
> HVPIPE usage:
> - The hypervisor has one HVPIPE per partition for all sources.
> - OS can determine this feature’s availability by detecting the
>   “ibm,hypervisor-pipe-capable” property in the /rtas node of the
>   device tree.
> - Each source is represented by the source ID which is used in
>   send / recv HVPIPE RTAS. (Ex: source ID is the target for the
>   payload in send RTAS).
> - Return status of ibm,send-hvpipe-msg can be considered as
>   delivered the payload.
> - Return status of ibm,receive-hvpipe-msg can be considered as
>   ACK to source.
> - The hypervisor generates hvpipe message event interrupt when
>   the partition has the payload to receive.
> 
> Provide the interfaces to the user space with /dev/papr-hvpipe
> character device using the following programming model:
> 
> int devfd = open("/dev/papr-hvpipe")
> int fd = ioctl(devfd, PAPR_HVPIPE_IOC_CREATE_HANDLE, &srcID);
> - Restrict the user space to use the same source ID and do not
>   expect more than one process access with the same source.
> char *buf = malloc(size);
> - SIZE should be 4K and the buffer contains header and the
>   payload.
> length = write(fd, buf, size);
> - OS issues ibm,send-hvpipe-msg RTAS and returns the RTAS status
>   to the user space.
> ret = poll(fd,...)
> - The HVPIPE event message IRQ wakes up for any waiting FDs.
> length = read(fd, buf, size);
> - OS issues ibm,receive-hvpipe-msg to receive payload from the
>   hypervisor.
> release(fd);
> - OS issues ibm,receive-hvpipe-msg if any payload is pending so
>   that pipe is not blocked.
> 
> The actual implementation of these calls are added in the
> next patches.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
> ---

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>


