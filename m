Return-Path: <linuxppc-dev+bounces-15289-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B990BCF6B85
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 06:02:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlfDn21DZz2yKr;
	Tue, 06 Jan 2026 16:02:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767675769;
	cv=none; b=BjMgJtAA1/hyxFvfzoNoRLRqv5Ahum0f5n+9t7KKvbTzBsA3ujwaoBypPH2OeIb5cs9fyHTK5CS9GTIfTfBhHt50hX+Wy+Q/nIBenMiyS1C/Qth/0KmICwEbwZ2Lq0syoKtUnia5ypf3HBwFkOcUis+7aYCz+eMgZEhxvwdHErgWNPsscFbPgyjHElqmrTtNaTLW053i0q/rWOrx/1Olbs5UfGMpHvkUm72J7a1S+pQjr+ZrennA+U+Z/RSmwOqdKsHQZ/JfM80TCul9pVYSatFgmdwJo6dO/I+nTVSvBLxcOezHpMpg6HXvvTGQlWDL9vsQombH+pGheAQwOX+y+g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767675769; c=relaxed/relaxed;
	bh=WYvPE8wn6m//EXH8bI5M7DlVKn+bytqO5ALxmQiU2oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0ddxP0EZLI3lRtATroEekWbQTU4KPgku6TUeKxbVdKvd7e+opQ0+B7j0t/mgmMlUyNWgmIKTBJh/0UbgPH2jCtBTo1TeXFMsqFfNMSnWCUy5Bfks1Oq2pKqV3kFkqWPY/2DpVqD0gsbmu4lZt5TzLkWyHON2SP6yH7G/h3kS3hNRMzhk98TSpCsWIw+utCa6EMfSKeomHJI10c+4LRdsyZGK6zlHUpPoghK6RG+91oTE9yOFyzD3zMGYGcs0Jq6tGKoesKVOI7M7P5DeJOQmGs7agkpLhkRw0gNbTdgXs53jEt+QhgPzdAtELM4eRVPHq8ml3WmnkREeJ1pBAlSPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IM+xqryI; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IM+xqryI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=mkchauras@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlfDm2Kngz2xqr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jan 2026 16:02:48 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 6064Zt4o030298;
	Tue, 6 Jan 2026 05:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=WYvPE8wn6m//EXH8bI5M7DlVKn+byt
	qO5ALxmQiU2oQ=; b=IM+xqryIVUMZzp9n4aL5yuwR5F/hlaPm7ewULWzmYLdX34
	0FI4JNrXrmdsJMSTYAKc/YtcvXW7X3yGbwAv0l63nL34purMiaiWjG1UZv4x+IzU
	Y01el4eVZQ41HyYKwFF4T8axvcrMogLk1tFw5i2oHD+E0BPoK5rpM9yicTNOqeEl
	WrnQSjSk3JQmQKRy+pr6Y8Khz9m1oMMZmgcUgPFWXIhY6v/M0gxve1AcYlYO4M2M
	h8UzIadCSWdWGslAAPCTNUtx4SPm8uRAaGuVihsq/yNVvdicFa7F0S/psR96lMe6
	UyoJFvGYzEfLrUIluEv4WM/xjmCGvIOqHDZN2GqA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4beshesqdh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 05:02:11 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60652AAp027753;
	Tue, 6 Jan 2026 05:02:10 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4beshesqde-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 05:02:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60650n8D015197;
	Tue, 6 Jan 2026 05:02:09 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bfdes9qb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 05:02:09 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 606525rx59113886
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jan 2026 05:02:05 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 406C22004D;
	Tue,  6 Jan 2026 05:02:05 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 474962004B;
	Tue,  6 Jan 2026 05:01:59 +0000 (GMT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com (unknown [9.124.213.216])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  6 Jan 2026 05:01:58 +0000 (GMT)
Date: Tue, 6 Jan 2026 10:31:56 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, akpm@linux-foundation.org, macro@orcam.me.uk,
        deller@gmx.de, ldv@strace.io, charlie@rivosinc.com,
        segher@kernel.crashing.org, bigeasy@linutronix.de,
        peterz@infradead.org, namcao@linutronix.de, tglx@linutronix.de,
        kan.liang@linux.intel.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/8] Generic IRQ entry/exit support for powerpc
Message-ID: <aVyW1ZTkEPppRsuk@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
 <06f2a88f-3425-4b0e-b17a-b858d81ee6c9@linux.ibm.com>
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
In-Reply-To: <06f2a88f-3425-4b0e-b17a-b858d81ee6c9@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDAzOCBTYWx0ZWRfXxorrlnTc/ujE
 D032iojUi22YtJPlsa+XniQS0LC+/5dDEozWPVyc/dWwvJQKhiWir9Mm9mKHNexPJC/WeQHheDd
 W88CJ2LWqL/rZzO7/HYR7OfU0JxHUjVXYT29nUh5i6kPgmNjlH7/EQBplJ4maK364levuGiqyWw
 DwA8h8YEEOYCTHjxy41QF+DjWn0OgSwuc9M3yYWorWbd/UGgnTuF5RXb6zF1rdFXsufdNUskvY7
 gCgt+MSyd0ezQ4xxXn0vsdkIWRK2ZqMwzRCdfkXbmOoq+y4SNIM+2810TmhEjqig9/MDAAtDc/7
 L+ca6zyQyIyvVxdEBsLO4kY1LnxEF2MOtIZs/qrQumd/GnKBarTxYVxDVuXZ4A1ASJRaMxCT3Fb
 qzdRHDQPWZHH8mPIIYypXNIDfTbLhiIA420DU0IVUTMqpLMb7CoYMnSBHKp5Eq5Ckm7KtVgcrqM
 /p/hWfOrpvH1vxGAJTw==
X-Proofpoint-GUID: a4JoK361jFfs7LoJUL_4JoSdHsKpzXXj
X-Proofpoint-ORIG-GUID: 6KIQjonOZfI0PviZ32u6ISWKO8xKRHFg
X-Authority-Analysis: v=2.4 cv=AOkvhdoa c=1 sm=1 tr=0 ts=695c9753 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Aqa5ouP8DLI9dGudwXAA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-05_02,2026-01-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601060038
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 01, 2026 at 02:37:41PM +0530, Shrikanth Hegde wrote:
> 
> 
> On 12/29/25 10:24 AM, Mukesh Kumar Chaurasiya wrote:
> > Adding support for the generic irq entry/exit handling for PowerPC. The
> > goal is to bring PowerPC in line with other architectures that already
> > use the common irq entry infrastructure, reducing duplicated code and
> > making it easier to share future changes in entry/exit paths.
> > 
> > This is slightly tested of ppc64le and ppc32.
> > 
> > The performance benchmarks are below:
> > 
> > perf bench syscall usec/op
> > 
> > | Syscall | Base       | New        | change % |
> > | ------- | ---------- | ---------- | -------- |
> > | basic   | 0.173212   | 0.133294   | -23.05   |
> > | execve  | 363.176190 | 357.148150 | -1.66    |
> > | fork    | 853.657880 | 840.268800 | -1.57    |
> > | getpgid | 0.174832   | 0.135372   | -22.57   |
> > 
> 
> Could you please add a description for whether its an improvement
> or regression.
> 
> Looking at it, it seems time taken for operation to complete. So it is
> an improvement. Seeing negative numbers one might think its a regression.
> 
Sure will add an explanation.
> Also, are these average numbers?
Yes, as there was very high run to run variation i took an avg of
100 runs.
> Could you get the numbers with preempt=lazy and with context tracking on?
Sure will do those too.

Regards,
Mukesh

> 
> > perf bench syscall ops/sec
> > 
> > | Syscall | Base    | New     | change % |
> > | ------- | ------- | ------- | -------- |
> > | basic   | 6006021 | 7502236 | +24.91   |
> > | execve  | 2753    | 2800    | +1.71    |
> > | fork    | 1171    | 1190    | +1.62    |
> > | getpgid | 5942117 | 7387040 | +24.32   |
> > 
> > IPI latency benchmark
> > 
> > | Metric         | Base (ns)     | Test (ns)     | change % |
> > | -------------- | ------------- | ------------- | -------- |
> > | Dry-run        | 206652.45     | 209317.37     | +1.29    |
> > | Self-IPI       | 3567895.23    | 3590444.77    | +0.63    |
> > | Normal IPI     | 148570416.17  | 148564173.40  | -0.00    |
> > | Broadcast IPI  | 4033489673.38 | 4007319512.62 | -0.65    |
> > | Broadcast lock | 4011023005.48 | 4010267885.93 | -0.02    |
> > 
> > 
> 

