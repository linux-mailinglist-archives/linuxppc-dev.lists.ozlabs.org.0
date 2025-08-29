Return-Path: <linuxppc-dev+bounces-11505-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D51B3C384
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 21:59:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD8HW629Wz2yvv;
	Sat, 30 Aug 2025 05:59:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756497575;
	cv=none; b=Ht0MMHh971YGhjHskl6RxK1so3e1Eb3VmIZ3/xY4WFH7r/51UOKFLjfxvXBWP+C7mTMcmn5RAATFeVlDUJBwKDvZP39tI3y/N/n3DshFGhg1/2VHC2Es7HiK6kiVXC5lkAJm+Ys0xLOylY03ZqMG5OxiowbqNCjAoXKLL73Ugby7eSlZKRZ6kUhqOBFtzLr6L3R1ERnHA+MzMfsuChDCdz835eskqgfrdt4clbvKH2OGwHQEvLCnRR4XsLLC6DcRZm6aiB0kFigiJGY1IBW5Fbb5c+UJl7ZS1jvn/d+tRKC8J7gJlNgRWeOhoKyGRQ4ksUAXCxyI5H68bMnaaMNw7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756497575; c=relaxed/relaxed;
	bh=gS7Hl+IYFSS0r41Lf7WKRhaDaSLCAteHC69ORGEojSw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PdsIPrJGfQiLoLUSMtpq8vCq4KiQ17m+iRdwYBUvPV5prEOxpgTx3mWgVJdujxZt63gdUuZ3Nt1gGf9mEmAvDNBLrwsxPKNsmxD+Phbu/wM6Gtkm9m5LghPtnoGgIV9HmIVz4d17AO895+R9wh6IwSiblrqYCqNj5aACPDEPeOTrlxarYxJk9hngbWnGA6YoCnpMS12+Zsxl0oe9LgSMLNOF+wruFNkrkar76HtdHiNythurfXxK0gciZDD9Acgu1lXnuqTQQocLQMKUsjk3RdaH3/YSLZ5x93cxFq7p/3EmKRZ0pgLG2t67ZNS8Oryy50tF/RNiu7k05blJmdDMEQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ebLlbGru; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ebLlbGru;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD8HW0Dcsz2xWQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 05:59:34 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57THq14G021026;
	Fri, 29 Aug 2025 19:59:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gS7Hl+
	IYFSS0r41Lf7WKRhaDaSLCAteHC69ORGEojSw=; b=ebLlbGrusgmerHZn29jyEP
	tc6HfX6RVvrf3ifwGcDFSU15m/kaqc775xXTBo4xPs6nijMdL2nyqSf99yFivtqJ
	Ptj6Ui1ZIvW4C6EPa29yd07WHsjd9/nfb0EnQ9CfhUjwRKEgel6xyHvzhrWC+x8/
	grdnJ1ej/ND9Ct+bne2+OUQWPqPtcis9foyKWQ+4bpWkjiFq0ErzuZNcScgoWYx1
	XSCBfWQ3GRki58lAGLCLI49aFrgo3scSGL0Bp2YKpqeQjiu9pz/SWsGvgf1uXB7G
	BV5t5d0N3dox+Co17CicUg/e6baNi0BqazdjfQjTcfpAoe50wVhfWQ0GwITSmtfQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48s7rwcj3m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:59:27 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57TJxQ2b002321;
	Fri, 29 Aug 2025 19:59:26 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48s7rwcj3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:59:26 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57TJkmRl029957;
	Fri, 29 Aug 2025 19:59:26 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([172.16.1.6])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 48qsfn3bp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:59:25 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57TJxN8P13042204
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 19:59:23 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15BDA58055;
	Fri, 29 Aug 2025 19:59:23 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5C16B58043;
	Fri, 29 Aug 2025 19:59:22 +0000 (GMT)
Received: from [9.61.25.56] (unknown [9.61.25.56])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 19:59:22 +0000 (GMT)
Message-ID: <ee1cec48-0673-47ba-b5da-1754824ab2ed@linux.ibm.com>
Date: Fri, 29 Aug 2025 12:59:22 -0700
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
Subject: Re: [PATCH v3 9/9] powerpc/pseries: HVPIPE changes to support
 migration
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, hbabu@us.ibm.com,
        shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
References: <20250828230845.2291249-1-haren@linux.ibm.com>
 <20250828230845.2291249-10-haren@linux.ibm.com>
Content-Language: en-US
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20250828230845.2291249-10-haren@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: gjJJ0CwmM52ZF-SzIjV6hR8wk4KNDv6_
X-Authority-Analysis: v=2.4 cv=fbCty1QF c=1 sm=1 tr=0 ts=68b2069f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=DPMDPPQSeU34MSaRjKIA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: seT6jqIi36sXw0JUJp6TSjoWyKiPKxHn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI2MDA1NSBTYWx0ZWRfX2UWVfZibAsSD
 f8xdAW8xUVpgQGuw8RVmn15Drx0mLf65SKCHpkhO+giGzQdF1KkCMBrcH41x3T9w++UdchDGjY1
 p3UJFaMjmfLNKxmJPecs4b00UYiOEwdnp4Bl98u0Ta4KD/99N9XBbuRQ6Y7+hkZaReDy6DdVdbp
 LcAVaflNqp3GvuTlinOU0PNUNjUS7Xz3R2WMcKe4CrS7Axv8NvGPVSszMRkKyj8JimRDlG2rAH9
 4Nmr1M7JcOwdnanJuWanmd/Q0vK+T9LIgTPiEFknE+DdXIC5RSnny+L5BpblFvwgNduElBEoJ8h
 9AQR9ep2nSDwcoYeu8v9tnBfkveLBc30Pttp70JC7jXgno7FF8AQaUUDXJ11cQHARNkqBFjnkj+
 jJ8jNDmO
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
> The hypervisor assigns one pipe per partition for all sources and
> assigns new pipe after migration. Also the partition ID that is
> used by source as its target ID may be changed after the migration.
> So disable hvpipe during SUSPEND event with ‘hvpipe enable’ system
> parameter value = 0 and enable it after migration during RESUME
> event with  hvpipe enable’ system parameter value = 1.
> 
> The user space calls such as ioctl()/ read() / write() / poll()
> returns  -ENXIO between SUSPEND and RESUME events. The user space
> process can close FD and reestablish connection with new FD after
> migration if needed (Example: source IDs are changed).
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
> ---

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

