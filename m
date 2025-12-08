Return-Path: <linuxppc-dev+bounces-14678-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9691ACAC19D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 08 Dec 2025 06:51:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dPrhk31kvz2yFc;
	Mon, 08 Dec 2025 16:51:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765173110;
	cv=none; b=BR9TPy3GYfcKEC5JHMGvSp3g1ZRNlMkQnVSCxLRFqXRBrMgWDgzWTvV/N92Bl6x3YeLGucfRPNJc+YlNiU1TO8EXMIOD8TpnViNQbDaXXcPgqbui+gYag5ZlUtbw5rIFqFYYjvn52FY6vUYKj70mjdAo6i1jZYwfXnGYKV0gUafxBrPacjz46GbyEZgM+JekEcZZ4NloOd0eaSm2FU/FmqdxYDl/0E09yQcKB7QM3YlfxDPn9TkVxon+SExuI2Eo0KNPyKhJJYpr6tFxv2ewydDaiW351tKECNQL5sQYktvRGIG72Uz5GBd64qSA/HaqTs5tEsAUiLvdQBhnfBy0Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765173110; c=relaxed/relaxed;
	bh=hWLRtsjqPH4RBHBeThBGlAyA38kNEpe0djHjZbbDQxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bIKBNSisYCGxZ6ECw4vvxJt9eATzi0RG2t3E37c7ZwP841nlFnUlJJpb7t3lCSVwoadg7NZ2SUtH3kx5GbKfESx2mn7g/j5Qxujm5A3EbCsOujJmiB7QgbQ58lp18c3FCTTnsJoGKFzYxQvz3OsmkuUwpXDXdaHvO3XCNl8MOPfL3iWV9AmC6+jtu+fe4K7mxI4nvGD8B+sbdw7RHLT983NWqOTTbvUInl44eYe3kp6a/RyeLj66cIVBMtPd0MsYF3UMeOGrFTnZE1Km3QLXEpOmyF5ClDtyOQqBMJAZzZg6VGZW10ppJPNAk1SS3xQAosKP92KIpjAm13io8mAEcA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pPVeeVCt; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pPVeeVCt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dPrhh6m00z2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Dec 2025 16:51:48 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5B7JqBLa024916;
	Mon, 8 Dec 2025 05:51:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=hWLRtsjqPH4RBHBeThBGlAyA38kNEp
	e0djHjZbbDQxM=; b=pPVeeVCtDhFRzTVCQrMHnkxjSyWIu+riIkKTSjK38/E3NS
	nHBVigQr24RTBpfhAjKVkp4AQ2kGnZaE8ShGZyUWvOlNxdYT/P1sG3L3MiL5Kesc
	Xss6j4V2rlGmdUg//A4q2q7aptmuhzkZJiRrqUJbPSbeq0Lp6zsuhWjjgxRYa+vc
	l5UQk8fHqA7oOkYo1UC4NJAKHFhmWW3Yeg8plgRDvYnIztI4ZFvk+IL7u+tc6DSi
	SK7IPUXzgRh0/ulDBBhyQ6nnrjEDWa9YfTW7XhV/wT/iNC2o/htDCeNhgb/MZDnx
	M3ttyCyZP3AtkA+cN5VJ6ySfPIRwhdrZFtEiaooQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc535te6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 05:51:45 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5B85l7Tu007124;
	Mon, 8 Dec 2025 05:51:45 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4avc535te5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 05:51:45 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5B8467hJ026807;
	Mon, 8 Dec 2025 05:51:44 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4aw1h0uuaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Dec 2025 05:51:44 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5B85pg6739452934
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 8 Dec 2025 05:51:42 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC7D820043;
	Mon,  8 Dec 2025 05:51:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DC36A20040;
	Mon,  8 Dec 2025 05:51:40 +0000 (GMT)
Received: from Gautams-MacBook-Pro.local (unknown [9.43.101.24])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  8 Dec 2025 05:51:40 +0000 (GMT)
Date: Mon, 8 Dec 2025 11:21:32 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Christian Zigotzky <chzigotzky@xenosoft.de>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        "R.T.Dickinson" <rtd2@xtra.co.nz>,
        mad skateman <madskateman@gmail.com>,
        Christian Zigotzky <info@xenosoft.de>
Subject: Re: [PPC] [e5500] Boot issues after the PowerPC updates 6.19-1
Message-ID: <aTZnZHYdZMXI-FE8@Gautams-MacBook-Pro.local>
References: <4d0bd05d-6158-1323-3509-744d3fbe8fc7@xenosoft.de>
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
In-Reply-To: <4d0bd05d-6158-1323-3509-744d3fbe8fc7@xenosoft.de>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA2MDAyMCBTYWx0ZWRfXx+ddEaIM7aJn
 JTUL19DyYANejUvKroXBlHgFAmAz60qDR5vqV+GeD5I/MUAcjqq1fKj8naG+4Ln/umLvn1IZGK1
 bNuZvqHya5x1LyYNEfk6l9oT8lOM3Co/+2gTqDWF5u42rKYW7XzvEUmgnKPE5kTEzsc0YJbmzI0
 LbXHuIrnXc6QuT9jjp6vfyNZfNnwfbCQVL53maB+DtzXM6Vt3OhlZ+hLu2Q7ggC/14Z2mu/Nm+h
 wbpHxD/wsH+cuxw+utl4jSxj9kMnfSBba78CV1knuR9cvsDJ7snkYgndKzBbP+UgSuyPYH0J8Lz
 6oLTROAeJGTqzKJtOTT7eXl9KNwK8GJpGqa+UgFYbFuJSmELtSo2s555USTUhGp9L9md8nogHv5
 zVsEPsNpNDpdQoUzpaJkqGzAEXwHWA==
X-Authority-Analysis: v=2.4 cv=S/DUAYsP c=1 sm=1 tr=0 ts=69366771 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Sw7Pw-7F6sdIvn3m9HUA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: w1FgkrOy0DQc5Ek8LlZWIXv9AzMFn5Dv
X-Proofpoint-GUID: Y4bAfJI5RnFG1qX7xGmoEbMAPaX75M_Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-06_02,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1011 impostorscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2512060020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Christian,

Thanks for the report. Can you also please share the QEMU command line
you were using? That would be helpful.

Thanks,
Gautam

