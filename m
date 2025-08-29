Return-Path: <linuxppc-dev+bounces-11500-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 230A8B3C349
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 21:47:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD81V5sPrz2yvv;
	Sat, 30 Aug 2025 05:47:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756496846;
	cv=none; b=ONivN4BFPqDJYX9gzF2YVYVW/UMewsesIK8wLz8AQ4FnYx6ylNgffM+AemBPEhbfWOXM181RMhMGkIhziSakPADoyXfbgmi8V4V30uhMuFHWhcL3H7A0vCf9fGt3TccnRV3kpdPxQPXXuzJaZypTi0BbgT0Gxl+WGrMeIyIVNAKM2UyQwFAJcD6b6LvAXOKFqEZ1js6eWupmOA1bUWtd/EMNQJdtzLBSHEDZ21iNZcPL+gdrm/Zk1okQWzL3Suz6PC+S6mS045Nxl3i0UZyZRGXUmNWi2Yxw7LjjVWalj+2YQvpgXwSj66L0YV4pxkwHQFpf9VMbD53G30OqoPIAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756496846; c=relaxed/relaxed;
	bh=GuGSJEBDsUS6M6hW7tBAqBsLxvgrrVe1vANIyLSEXcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ApL/MF23zEwIC0GEcyi6MtHrQTFxeq1ufCkTFvu3xy+IhvotdqfJViIXS1V5Ww9t1POKKxqnwtI8mquGN3ublrKVLzWQovbiRmY5favbkdRyaifWgGqwy/LtT+4615o8u5ybPPhYp6h/96ZSAt/h3Fs3ykw2m2C5rBVJXFDbBaX3pmy3AGzLF+xx/9yLE7XFZ934op0bX13a0VA+pWExTe/XobefaQnCWQf86Ml7B4rrx7DUXzLYewdT1XJBiJiIInvtoEDIycie1kLmBWGdDq1MeTWeHa4eNSWP3qly4Ta1yaLMZg7t7abibLVJyKRgF5FJ1NhWTZkgaRrBdSvXPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KX2aj8Jg; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KX2aj8Jg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD81V0Zfxz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 05:47:25 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TID0sD012797;
	Fri, 29 Aug 2025 19:47:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=GuGSJE
	BDsUS6M6hW7tBAqBsLxvgrrVe1vANIyLSEXcc=; b=KX2aj8JgM7hsm5dDNJ3Nwo
	DP1P8+kXJsvUlD+0YdS8reDlTHgH/pDxdrk6UaSZ090tDzTc16HzoIlzNzQgfZT2
	79AOH1TGLjRJ2aIi5Kstsa6AxLxczxUnMNl3gZbm6fN701Y+mZ8fibe3/WgVtA9K
	HlsVzkSoWFF8DUSiKEaAulapfwyT27mZgcgxjR4dM9wYZX6v6zJ4BFtlrz+FKopv
	8NAsWLe1l7AHoFdPJLE031CaB1kLO0bEth5UcEH6KNEltP6G43ZOYJPqYs3pNh6s
	69GfMqCqS+Jv6wV+s2c/Jf+uvZbAjLzFqgINJw1F+GuNwPUd8FdPfOvvHlgrxKCg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5aw1gj7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:47:19 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57TJhfkS028283;
	Fri, 29 Aug 2025 19:47:18 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q5aw1gh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:47:18 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57TIZi23020838;
	Fri, 29 Aug 2025 19:47:12 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qrc13g05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:47:12 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57TJlAn930081718
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 19:47:10 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0726B58059;
	Fri, 29 Aug 2025 19:47:10 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4711658055;
	Fri, 29 Aug 2025 19:47:09 +0000 (GMT)
Received: from [9.61.25.56] (unknown [9.61.25.56])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 19:47:09 +0000 (GMT)
Message-ID: <cd9b32cf-c2d4-4046-b720-ec910ed48c23@linux.ibm.com>
Date: Fri, 29 Aug 2025 12:47:08 -0700
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
Subject: Re: [PATCH v3 4/9] powerpc/pseries: Send payload with
 ibm,send-hvpipe-msg RTAS
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, hbabu@us.ibm.com,
        shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
References: <20250828230845.2291249-1-haren@linux.ibm.com>
 <20250828230845.2291249-5-haren@linux.ibm.com>
Content-Language: en-US
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20250828230845.2291249-5-haren@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: slLa9o1ZwDYuF2wqMqT1_qaLbIbdHXD3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAyMSBTYWx0ZWRfX/qLv8iZySsww
 zNflMNXgXykpEYQVO9XRXbKeCeLFVc2eVJRs9ARDl5FMmLWml+wumtim/NW5/LkuV5qYffHjL/l
 SdY6mLGgcGaRpjHhL8LCbny+ACx0Ju7N2mXA0pdo78q9W+p96xDZDQy8RKuItTm0cVtR3gqsk00
 pphWbFtIrU7xjrUo3GePOuO3/pvkYl0VoS2E4LXZMJsMxN5utTc5E2UUMh2VoO9Vslj2c7gBZ43
 ryozBRnpE9OxABHlrzkcsKCAsNmxb3LAI4NbglRcEuBDW0murZzSoXplbpn0jiQkf8N6id7E8D2
 bMYTgzeWhC52h0WpK6Ac8XAVvxbXhpvBRo663aledzdx+eqT8gODibAj9vB79fTmhJSvaM67I3v
 pizFaMjC
X-Proofpoint-ORIG-GUID: i10LAtQGKDf4XT8kjXIgun57V3IMF-kY
X-Authority-Analysis: v=2.4 cv=SNNCVPvH c=1 sm=1 tr=0 ts=68b203c7 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=ALvBqy6vHTBQFlPnBK0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-29_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 clxscore=1015
 impostorscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508230021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 8/28/25 4:08 PM, Haren Myneni wrote:
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
> 4048 bytes. writev() can be used in future when supported more
> than one buffer.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
> ---

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

