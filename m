Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2E5252A9E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 11:42:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bc19p5CyszDqFY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Aug 2020 19:42:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=svaidy@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=li3s+Cpx; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bc17F50W0zDqM4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Aug 2020 19:40:25 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07Q9XOaD059228; Wed, 26 Aug 2020 05:40:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=N7+aa+XxNWIP45367pCc49nejHJb7V3eQKgrc57njM8=;
 b=li3s+CpxcaYPFTQiUOSd8O/26MuRYsCODFBOiXge6osQelC0cLYmzWrkj7s2KJUkHKmY
 DY0ghXLXL9zT4tBi0Fjqjif5QYVGA55C7V5trHrAEkW/yYf/DK5/ysHlSfehQprHPuZw
 1S7abgmYRGeYiHNbxT05fCVs2ct0hL47yOdNIQrE+N7K+z/ws3bcXDWmYYd1DJ4OpWAC
 kTwZbEotA3v0IhD4ZR867ZLirc4Zpq1nFXkPsMcHXiXeZOsjCDbcPx0xxevnbPJi7MAV
 RR88NjPFVKCvKFzHGbelWSIyPbsRgxdptkTSd93scGg1xDOIfKI9c+9Msy6PiqXtx6vw wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 335m1w2dhc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 05:40:18 -0400
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07Q9Y2J7062048;
 Wed, 26 Aug 2020 05:40:18 -0400
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 335m1w2dfc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 05:40:17 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07Q9c0Lr005769;
 Wed, 26 Aug 2020 09:40:15 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 335j2704ed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 26 Aug 2020 09:40:15 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 07Q9cgVD66126184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 26 Aug 2020 09:38:42 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF8A95204F;
 Wed, 26 Aug 2020 09:40:12 +0000 (GMT)
Received: from drishya.in.ibm.com (unknown [9.199.54.64])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 55DA052054;
 Wed, 26 Aug 2020 09:40:11 +0000 (GMT)
Date: Wed, 26 Aug 2020 15:10:09 +0530
From: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>
To: Pratik Rajesh Sampat <psampat@linux.ibm.com>
Subject: Re: [PATCH] Revert "powerpc/powernv/idle: Replace CPU feature check
 with PVR check"
Message-ID: <20200826094009.GC48285@drishya.in.ibm.com>
References: <20200826082918.89306-1-psampat@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200826082918.89306-1-psampat@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-26_06:2020-08-25,
 2020-08-26 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0
 impostorscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1011 suspectscore=0 malwarescore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008260075
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
Reply-To: svaidy@linux.ibm.com
Cc: ego@linux.vnet.ibm.com, mikey@neuling.org, pratik.r.sampat@gmail.com,
 linux-kernel@vger.kernel.org, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Pratik Rajesh Sampat <psampat@linux.ibm.com> [2020-08-26 13:59:18]:

> Cpuidle stop state implementation has minor optimizations for P10
> where hardware preserves more SPR registers compared to P9.
> The current P9 driver works for P10, although does few extra
> save-restores. P9 driver can provide the required power management
> features like SMT thread folding and core level power savings
> on a P10 platform.
> 
> Until the P10 stop driver is available, revert the commit which
> allows for only P9 systems to utilize cpuidle and blocks all
> idle stop states for P10.
> Cpu idle states are enabled and tested on the P10 platform
> with this fix.
> 
> This reverts commit 8747bf36f312356f8a295a0c39ff092d65ce75ae.
> 
> Fixes: 8747bf36f312 ("powerpc/powernv/idle: Replace CPU feature check with PVR check")
> Signed-off-by: Pratik Rajesh Sampat <psampat@linux.ibm.com>

Reviewed-by: Vaidyanathan Srinivasan <svaidy@linux.ibm.com>


> ---
>  @mpe: This revert would resolve a staging issue wherein the P10 stop
>  driver is not yet ready while cpuidle stop states need not be blocked
>  on 5.9 for Power10 systems which could cause SMT folding related
>  performance issues.
> 
>  The P10 stop driver is in the works here:
>  https://lists.ozlabs.org/pipermail/linuxppc-dev/2020-August/216773.html
> 
>  arch/powerpc/platforms/powernv/idle.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index 77513a80cef9..345ab062b21a 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -1223,7 +1223,7 @@ static void __init pnv_probe_idle_states(void)
>  		return;
>  	}
>  
> -	if (pvr_version_is(PVR_POWER9))
> +	if (cpu_has_feature(CPU_FTR_ARCH_300))
>  		pnv_power9_idle_init();
>  
>  	for (i = 0; i < nr_pnv_idle_states; i++)


This revert solves the stated problem and makes kernel v5.9 work
reasonable well on P10 with stop states which are required for SMT
mode changes.

Complete P10 driver has been in the works and will build on this fix
and complete the required platform support and optimizations.

--Vaidy

