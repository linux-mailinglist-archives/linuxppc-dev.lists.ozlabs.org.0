Return-Path: <linuxppc-dev+bounces-11501-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B000CB3C34E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Aug 2025 21:50:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cD84R3N1Tz2xd6;
	Sat, 30 Aug 2025 05:49:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756496999;
	cv=none; b=XrVutvXObNMxSodf1Qr7Cclw1OCWaf5EIJziUxpujzEOcp4PfLkfOQh0ol+kkIwIDSbPsSBZA+NPo5dhAn10oInkFDq3dtt2SUH2CunJZBPwuAR4DUyzaA52CNToam2q71fSAER3XH+z8uCOOr6cWYk1uJ7CkulhrB6lxdbIQLfM8WLrc9Shsnid6R6FVFfg54VCKkk0Hstq4OPQ6aCt35W2tGEHjenNVkbCYRA5l+HxGiIjtX8dYfIIGDPh8VYFIIHeYgpmepgINsOSFF4yyNVY4HPua+rGru2gHM3sbFut/qlLY8+2QIo9DwHRP029gRq5lwwlAW0hukqTvQh4gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756496999; c=relaxed/relaxed;
	bh=6Qwm8ylx7lgihgvm7jN6sDt2A6J91svFICo6MR3gpQ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nsRi8K1Pp3esVafkskclH+5dgTFqK6DQYeXTbYGbpn1mwbusOGJK8EvHLD9B+8h0f0BEm/u2XosW3+jNrx2moDng9iEXGIrLagg1OOpytPSV8A9l6Ki07KT+NlYoONX6uqY9iqSDzTrOM6bpkULhpArv91BhIygDQBmgLoQXCJWNKucfAKG2hNMn5qu7haWiWd/gk4mE1wAZj4/q0oaeZcTaxsA5WkpAghEqQqIjM2lPZTlT0hGqN34HZTT8MYlBCO1L0XptPKEBVvvU50rOuDZyc2bZbM6pEacG53+kW4wVgu/8fPn8y9zb2iQeAXzzFwTLU+AeeSQcHMVJhjF7FA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PW4RpBN1; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PW4RpBN1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cD84Q5WLBz2xMX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 05:49:58 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57TIN3Y6007552;
	Fri, 29 Aug 2025 19:49:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6Qwm8y
	lx7lgihgvm7jN6sDt2A6J91svFICo6MR3gpQ8=; b=PW4RpBN1cQ+UiaXdXe8gFH
	1rqSZuVDgsfv9GC1g2vWteFc6ycv+ju/XBEWAHPib7MtiD84aSgeHnCxlTUjyrIi
	mgQJ+euXwkEmcE6EVT/vCS//rL5+na3juoiFZuzMlmKWUPe1pVpLbvqHvkg3aKNn
	XmXURpvj4WEe2mEmeFc3wecB5IcAedYWugTrsPSrBeU83z2b+qfXDHpJki24kKsd
	ketrBsa++v0AFn70vyqKHE/nOq5rqCJXqgRarNGWckH8wg/YXzK6SYrnHjyFAivS
	MJieeQ9CVtM5frAbzCrcWKGUz0RDtOJyoT1SfQWxxG/I2fwSCr3d0xlUdfw8ElxQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tsv9esbp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:49:50 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57TJnofx032386;
	Fri, 29 Aug 2025 19:49:50 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48tsv9esbj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:49:50 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57TH9sc8017974;
	Fri, 29 Aug 2025 19:49:49 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qtp3u2q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Aug 2025 19:49:49 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57TJnjHh37552850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 29 Aug 2025 19:49:46 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E0C058059;
	Fri, 29 Aug 2025 19:49:45 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E806458055;
	Fri, 29 Aug 2025 19:49:44 +0000 (GMT)
Received: from [9.61.25.56] (unknown [9.61.25.56])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 29 Aug 2025 19:49:44 +0000 (GMT)
Message-ID: <2223a133-4f2f-4ede-94f2-181c4d49c778@linux.ibm.com>
Date: Fri, 29 Aug 2025 12:49:44 -0700
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
Subject: Re: [PATCH v3 5/9] powerpc/pseries: Receive payload with
 ibm,receive-hvpipe-msg RTAS
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        msuchanek@suse.de, mahesh@linux.ibm.com, hbabu@us.ibm.com,
        shashank.gowda@in.ibm.com, bjking1@linux.ibm.com
References: <20250828230845.2291249-1-haren@linux.ibm.com>
 <20250828230845.2291249-6-haren@linux.ibm.com>
Content-Language: en-US
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20250828230845.2291249-6-haren@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=GqtC+l1C c=1 sm=1 tr=0 ts=68b2045e cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=Fes1uvIEUYYalLX1GkwA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ql0S7q-HUGKpNnHmz6y2Q616U7QdGWLr
X-Proofpoint-ORIG-GUID: 3mEuA7vx248ItTefEEOLpTaalgeDhd-6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODI4MDEyNyBTYWx0ZWRfX09wmPJagXg6y
 gwtcuXSeRKa+hHvcJaVMDPrzJHgTSPt8kZUoDa60u3s4mCYw/E3LJRUo7bf4Vnpq0WgAq5Gc/Dd
 JdDq4oaH/JQJ82DYg/+OUFm2SvI6NOeAn0lSe9S1y6FQsNcXXCbcSTzWLJbiSuH5zAbw95IuDfX
 Pn71bNRe+z/VLKzKQb0HxrDsYkdL+osOcS/Z3uXMoTTJQwZt1EP+3hEHBi01jXdWrB3r5HKRuHr
 mtHZFNof8jwqGwLfoGe14VJlRYFnq28LpuaIn3T+lKKEFdUT/kUqhcS4Tm9l1RX+2C8FiC2JOv4
 wM1LFxABNVVBB8TeFUWCgx0K3CNxDqMXFwvJjWvOfDIZVu2vmk1sIebsPz6sFVCzcutvMnkHvZs
 NdNVyNEx
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
> ibm,receive-hvpipe-msg RTAS call is used to receive data from the
> source (Ex: Hardware Management Console) over the hypervisor
> pipe. The hypervisor will signal the OS via a Hypervisor Pipe
> Event external interrupt when data is available to be received
> from the pipe and the event message has the source ID and the
> message type such as payload or closed pipe to the specific
> source. The hypervisor will not generate another interrupt for
> the next payload until the partition reads the previous payload.
> It means the hvpipe is blocked and will not deliver other events
> for any source. The maximum data length of 4048 bytes is
> supported with this RTAS call right now.
> 
> The user space uses read() to receive data from HMC which issues
> ibm,receive-hvpipe-msg RTAS and the kernel returns the buffer
> length (including papr_hvpipe_hdr length) to the user space for
> success or RTAS failure error. If the message is regarding the
> pipe closed, kernel just returns the  papr_hvpipe_hdr with
> flags = HVPIPE_LOST_CONNECTION and expects the user space to
> close FD for the corresponding source.
> 
> bm,receive-hvpipe-msg RTAS call passes the buffer and returns

Missing the "i" in "ibm,receive-hvpipe-msg".

> the source ID from where this payload is received and the
> payload length.
> 
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Tested-by: Shashank MS <shashank.gowda@in.ibm.com>
> ---

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

