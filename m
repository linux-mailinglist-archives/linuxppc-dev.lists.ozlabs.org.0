Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2963536808
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 22:26:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8xCN5psVz3cBV
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 06:26:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DznCabj6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=DznCabj6;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8xBj59Nkz3bm0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 06:25:33 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24RKEunv006826
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 20:25:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=MFJt4QiDfsopDlBhGxeco/5pKfNCxTFRMkECkIc2vO0=;
 b=DznCabj6oSiLmlE8RKcOMGKIEgxi78S6QNcAnu2rMtrmjImTckqb/WYPukEOMqCm75WR
 aMHELtYt++Z1+ZeZSUkFJsMekrdIikT93uJ8KR4dhr1cGX4L6WS52W2kopoyVIC4/hNg
 KDCoY/b4wKwXkLc3hmvXlBEmocAJfj+cQRgEUybm8YvxD5rMLwllKwmM9X8gUzECOXwa
 qH5K0aiewA61WvXFOJEB1IK/kxBzrFc3RAXmE8xGWsP1LT8a9rzdFCFVkqTeEGIx9P2c
 B8kB+q3jiuIy80IzqABb4tdiR/HfLq5KBJYNysQ06kmPucID848hZm1iXQpWIbJ3AUac VA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb5ghr4wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 20:25:30 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24RKPTgB007047
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 20:25:29 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com [169.47.144.27])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb5ghr4wn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 20:25:29 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
	by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24RKKMVL012279;
	Fri, 27 May 2022 20:25:29 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma05wdc.us.ibm.com with ESMTP id 3gb1n5h9vf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 20:25:29 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24RKPSnm21102980
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 May 2022 20:25:28 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEC24AC060;
	Fri, 27 May 2022 20:25:28 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BBA5AC05F;
	Fri, 27 May 2022 20:25:28 +0000 (GMT)
Received: from localhost (unknown [9.77.139.3])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Fri, 27 May 2022 20:25:27 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] powerpc/pseries: Add wait interval counters to VPA
In-Reply-To: <20220518133935.3878954-2-npiggin@gmail.com>
References: <20220518133935.3878954-1-npiggin@gmail.com>
 <20220518133935.3878954-2-npiggin@gmail.com>
Date: Fri, 27 May 2022 17:25:26 -0300
Message-ID: <87h75alo3t.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: mS8y0LKYaBW5PKGvE-F56HqlrVHTcQhG
X-Proofpoint-ORIG-GUID: sUAb-76onw7IqJlk_gk9q2GoCuosSppS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_06,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 bulkscore=0 impostorscore=0 mlxlogscore=839 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2205270097
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> The hypervisor exposes accumulated partition scheduling interval times
> in the VPA (lppaca). These can be used to implement a simple stolen time
> in the guest without complex and costly dtl scanning.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/lppaca.h | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/lppaca.h b/arch/powerpc/include/asm/lppaca.h
> index c390ec377bae..34d44cb17c87 100644
> --- a/arch/powerpc/include/asm/lppaca.h
> +++ b/arch/powerpc/include/asm/lppaca.h
> @@ -104,14 +104,18 @@ struct lppaca {
>  	volatile __be32 dispersion_count; /* dispatch changed physical cpu */
>  	volatile __be64 cmo_faults;	/* CMO page fault count */
>  	volatile __be64 cmo_fault_time;	/* CMO page fault time */
> -	u8	reserved10[104];
> +	u8	reserved10[64];		/* [S]PURR expropriated/donated */
> +	volatile __be64 enqueue_dispatch_tb; /* Total TB enqueue->dispatch */
> +	volatile __be64 ready_enqueue_tb; /* Total TB ready->enqueue */
> +	volatile __be64 wait_ready_tb;	/* Total TB wait->ready */

This last one is unused but I assume you are adding anyway it because it
could be later added to lparcfg. So:

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
