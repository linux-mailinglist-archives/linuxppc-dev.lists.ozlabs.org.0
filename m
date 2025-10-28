Return-Path: <linuxppc-dev+bounces-13418-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6AF2C12D6F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 05:09:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cwcM31fJVz3fmT;
	Tue, 28 Oct 2025 15:09:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761624543;
	cv=none; b=ExZf/jlWY0YNS5VLqKA3aS36TlJbz37AtccvcoSa2XOaWs9U4kjwkV87Nku3tRo0niJJr+MvkoscTkR56AedyACc5Ic21q0p4XzT2QsDssLDmNIG6MbqHSZ1dBo3T+oOutv6co/2PGaYxrMxRQ1oFDrTBl1jbHuYmYxSJDV/RqSazDthQkgBULDqxRufAbhOec8rvhQKUIiXuQwn+PSTYvt1vbvgz5PKnfqaZUwmq23LI+MsGfTDv2f1gAvdBQp1LMa/8g5itFAGpmYDdNl0Uo2LwGHArh2aN8Ti/QDd4dlmfvnS8ONwClQWXc3s8Ox5vx1UdCbNCU6PX1CYFzR5Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761624543; c=relaxed/relaxed;
	bh=SfvUBBMcQUBoZiNBe67HKjBuK6Dm/ZBmLaWAcaap4mE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHATkcHQ1U1C89M1RYTcN2B0q2kQPGlZmWUX6C4LbXU9iJ4Ht7mzsNxj8yOoFK35n7U6d966h5vlJigbP5T9dHaZJ3r2oQ36Ohl4jlCgTq5j/a2kf3JauTOKG9B9SMY3QLJ8AHQ3a+HcW8ftlnGbVtWMebqgy/oxnhxcX6Cxjby67i+e72Yu7PiUhDuxFeWKh+I30vR7XD5yywlS6GYVX+2rdQOSm6g0pA6aHv8H66SrNp42ENqpz0CdrpEphQ4Ha/ex63WOnSfGy9/Qa+eT+zoumjNErPYbBUzJIsUsnacHg2mIk2PpyQKPda4ev5kLo4wo5s1wjkCMcwLp4gLmYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CGOuvM1F; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CGOuvM1F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cwcM22MRmz3fRs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 15:09:01 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RG5CEU018332;
	Tue, 28 Oct 2025 04:08:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:reply-to:subject:to; s=pp1; bh=SfvUBBMcQUBoZiNBe67HK
	jBuK6Dm/ZBmLaWAcaap4mE=; b=CGOuvM1F+T5kS0DOGAA1dVFZvYmeJNv4dyngf
	BrBEdbz9K2zj2OKx4Ht6jZJmvYvZGPPEVzPa65dtaOEqUsJvPhOm0uMPD2jr/ezC
	PWVy7Nlvc8heV7KYnQNp09hgWYmrOMfkrhFI1T9NytswSGLBLD2Z/nLNNdvzRsUv
	4hJ2K09gwwUOoMeNAktJNI5cNAVHFM7SIUzYzYRncK9yXDAQurQ4OwQmwUluVU0G
	V8V8YYY4WSsjT9y/h74T6h1wuTFEpo6XTFULMsjGr6An7OjUxNoXLc47lOWC+i+M
	MrmYdzf/h0Uj9KX6Kevn67aciiN76Ozg22cEwU5RscKcRTvWg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0p991xeq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 04:08:47 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 59S45hE9009753;
	Tue, 28 Oct 2025 04:08:46 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a0p991xen-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 04:08:46 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59S2R3o0022023;
	Tue, 28 Oct 2025 04:08:45 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a18vs12nr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 Oct 2025 04:08:45 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59S48fZK51184122
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Oct 2025 04:08:42 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D08D820043;
	Tue, 28 Oct 2025 04:08:41 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 96CE320040;
	Tue, 28 Oct 2025 04:08:39 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.126.150.29])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with SMTP;
	Tue, 28 Oct 2025 04:08:39 +0000 (GMT)
Date: Tue, 28 Oct 2025 09:38:38 +0530
From: Srikar Dronamraju <srikar@linux.ibm.com>
To: "Nysal Jan K.A." <nysal@linux.ibm.com>
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Sachin P Bappalige <sachinpb@linux.ibm.com>, stable@vger.kernel.org,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc/kexec: Enable SMT before waking offline CPUs
Message-ID: <aQBBxlZebkLDhi2e@linux.ibm.com>
Reply-To: Srikar Dronamraju <srikar@linux.ibm.com>
References: <20251025080512.85690-1-nysal@linux.ibm.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20251025080512.85690-1-nysal@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=690041cf cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=8nJEP1OIZ-IA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=eMohRQ-KdQCHCDRkyAgA:9 a=wPNLvfGTeEIA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: t6S93ipUKAohD0zxwgjOAjKz4Lz5HzZN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI1MDAxOSBTYWx0ZWRfXytRsWE3y5MiL
 cLymIho//XHObODNhoDqSk755gVf/wGRaaB4aw/GKUCfAXOBrxQNL/5U9dmtNjTRc1NusopCVm8
 p5dt/NOKfbSPVJIzXlTdwCMqMlkfdW8AQeJWUi1LQGb6G9a8GjpHCUQCTWBuhAVfSKD3vf9dFHh
 PW662LWPWr/IFJmquAHceEOv2qQG/KykEpcV+TPjxaAeXi9VMS56+OuYraz15aqeNd9dpuQPnT4
 KM7yShxtocfo0nGFsjMuBUc6kZ7P3gLco/JTdNBLyO14kyMFg5b45D/TLFKiscJMdLym+Qs9IVx
 cRYn7Zf/jtRM4wjx0KX61MVnwvcGB1F35Mg1M0TS8WhP2JbTKTi6RglcAK7rlrgBo2TeagMCByS
 Kfo/fbXz0GSObpOBjO1KY3WXS5wHKw==
X-Proofpoint-ORIG-GUID: OAhCU3nbnwm1qIWiPiQBU9lbZaSH1Nz6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510250019
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* Nysal Jan K.A. <nysal@linux.ibm.com> [2025-10-25 13:35:09]:

> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index 222aa326dace..ff6df43720c4 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -216,6 +216,11 @@ static void wake_offline_cpus(void)
>  {
>  	int cpu = 0;
>  
> +	lock_device_hotplug();
> +	cpu_smt_num_threads = threads_per_core;
> +	cpu_smt_control = CPU_SMT_ENABLED;
> +	unlock_device_hotplug();
> +

Nit: can we add a comment mentioning why we do it and probably move to a
small helper function of its own.

Otherwise looks good.

Reviewed-by: Srikar Dronamraju <srikar@linux.ibm.com>

>  	for_each_present_cpu(cpu) {
>  		if (!cpu_online(cpu)) {
>  			printk(KERN_INFO "kexec: Waking offline cpu %d.\n",

-- 
Thanks and Regards
Srikar Dronamraju

