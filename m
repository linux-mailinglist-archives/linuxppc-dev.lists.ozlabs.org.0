Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA52362FC09
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 18:53:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDPXv4HL9z3dvC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 04:53:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z5sSmOg3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Z5sSmOg3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDPWv6PT3z3cMx
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 04:52:59 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIGQ5lt028258;
	Fri, 18 Nov 2022 17:52:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=/lv4ub3Vg32uCmmz3h/pdb6XZBrjaPie5/mVCLNZeO0=;
 b=Z5sSmOg3Euc1/06IA4GloNfA+r/J2Fg7i4/ZJUHikBpPtS0mI4V5u57M+8lwAe6rC3qB
 IiOPRBNeW8XKdZV4c5AHJ0Fa2cTuDelLuG9UyxoSohTafTs07fhDbR1t4kJncY1gv7W/
 sbunXdz68+JeaVpGKLNd4f/RMVJph76J4Ak8noRXiUWvTnucEt57Nw4CJbvTownXp7n4
 fOtZIzl9q/YD5xBNmJdCTJC078JYsFL4j0dN1VBdKJEd4DDbt8rjIveIow9lpvt5LgTb
 vthfVTcw4zKPPxcLZ1y3ttnsiudv+RVWpE3v0/QjSGWqF2NqW8vOIYOMCKPeRxbWquz5 Ew== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx8w11whk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 17:52:49 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AIHhCgn007381;
	Fri, 18 Nov 2022 17:52:48 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kx8w11whc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 17:52:48 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AIHpMKR023357;
	Fri, 18 Nov 2022 17:52:48 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma03dal.us.ibm.com with ESMTP id 3kt34ak3xr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 17:52:48 +0000
Received: from smtpav05.dal12v.mail.ibm.com ([9.208.128.132])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AIHqpCm9372330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 17:52:51 GMT
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9FEB45805D;
	Fri, 18 Nov 2022 17:52:46 +0000 (GMT)
Received: from smtpav05.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8520558052;
	Fri, 18 Nov 2022 17:52:46 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav05.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 17:52:46 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: unregister VPA when hot unplugging a CPU
In-Reply-To: <20221114160150.13554-1-ldufour@linux.ibm.com>
References: <20221114160150.13554-1-ldufour@linux.ibm.com>
Date: Fri, 18 Nov 2022 11:52:46 -0600
Message-ID: <87bkp49mkx.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: F2lykHHEd6SSM4Wbytclys_7E0SWdhD_
X-Proofpoint-GUID: Ouk0Zytynngkkj61hgCiyLcLXZM8hoRM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_04,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 mlxlogscore=903 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2210170000 definitions=main-2211180103
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:

> The VPA should unregister when offlining a CPU. Otherwise there could be a
> short window where 2 CPUs could share the same VPA.
>
> This happens because the hypervisor is still keeping the VPA attached to
> the vCPU even if it became offline.
>
> Here is a potential situation:
>  1. remove proc A,
>  2. add proc B. If proc B gets proc A's place in cpu_present_map, then it
>     registers proc A's VPAs.
>  3. If proc B is then re-added to the LP, its threads are sharing VPAs with
>     proc A briefly as they come online.
>
> As the hypervisor may check for the VPA's yield_count field oddity, it may
> detects an unexpected value and kill the LPAR.
>
> Suggested-by: Nathan Lynch <nathanl@linux.ibm.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
>  arch/powerpc/platforms/pseries/hotplug-cpu.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> index e0a7ac5db15d..090ae5a1e0f5 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -70,6 +70,7 @@ static void pseries_cpu_offline_self(void)
>  		xics_teardown_cpu();
>  
>  	unregister_slb_shadow(hwcpu);
> +	unregister_vpa(hwcpu);
>  	rtas_stop_self();
>  
>  	/* Should never get here... */

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>

I was wondering whether we could leave an active dispatch trace log
buffer registered, which could interfere with releasing the VPA, but I
verified that DTL has the appropriate cpuhp callback for that
(dtl_worker_offline()).

Alternatively we could change the code to dynamically register and
unregister VPAs only on processor add and remove, as opposed to CPU
online/offline. But I can't see any significant advantage to that.
