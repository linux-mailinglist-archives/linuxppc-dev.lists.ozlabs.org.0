Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 65FE2560FC8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 05:52:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYPXv2Jqdz3bwk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 13:52:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LWONx4vD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LWONx4vD;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYPX92vNbz3bkm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 13:51:36 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25U3eVMC024151
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 03:51:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=HIsTjwLGO647kWZkX5FVun9FQiPomFMWdJslLZl/YB4=;
 b=LWONx4vD/+BVIxlA8A7rG9IgV0W7r22XpShf4Q1yQXJD5SlNHZEzhZj/E4EFbnPL4ghe
 ec/TSvcmnrJNU0O9onmxPP5X94lgmsVM2BZXapemmeXAopnXZwUP64u7DL2y3HXe77/r
 +ubiZSfnmA7tAuRSeE2RdezPVPEKMICi6fjapgydq1mDGGD6Uoai0I5ppW3/CANjYJ0p
 M3bWZ0UQXkhyuy02ILHZaCZVvd9XM077dy2JbeKTngK9gvIxzm7RB2K+JoK1Q1WKNp/f
 Rx5D2eSluNPH10EIhShKirB2D9smDb617fS9nxTuhuWoisytqgmkkEAuVm+uvRh0VEK4 yw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h13chsd7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 03:51:33 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 25U3iq2E008012
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 03:51:33 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h13chsd73-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 03:51:33 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25U3ZwCE026294;
	Thu, 30 Jun 2022 03:51:32 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
	by ppma03dal.us.ibm.com with ESMTP id 3gwt0aw85b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jun 2022 03:51:32 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25U3pVr833161712
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Jun 2022 03:51:31 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 16DFE136065;
	Thu, 30 Jun 2022 03:51:31 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBCFB13605D;
	Thu, 30 Jun 2022 03:51:30 +0000 (GMT)
Received: from localhost (unknown [9.211.129.69])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Thu, 30 Jun 2022 03:51:30 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/smp: poll cpu_callin_map more aggressively
 in __cpu_up()
In-Reply-To: <20220629205852.4172212-1-nathanl@linux.ibm.com>
References: <20220629205852.4172212-1-nathanl@linux.ibm.com>
Date: Wed, 29 Jun 2022 22:51:30 -0500
Message-ID: <87iloin70d.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QeFoqcyiGgJvcjn-m6rmsDJvsD90Qdlr
X-Proofpoint-ORIG-GUID: VbY_Ke4u7B3TCjMTjyP56UV3ntE4ZzcA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-06-30_01,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 clxscore=1015 impostorscore=0 mlxlogscore=575 lowpriorityscore=0
 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206300013
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
Cc: brking@linux.ibm.com, srikar@linux.vnet.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch <nathanl@linux.ibm.com> writes:
>
> Without the msleep(1) in the hotplug path, the time it takes to online a
> CPU on a P9 PowerVM LPAR goes from roughly 30ms to 4ms or less when
> exercised via thaw_secondary_cpus().

I need to reword this part. More testing shows that the time for
_cpu_up() to complete increases with the number of CPUs online, with or
without this change. The patch eliminates the msleep() penalty (roughly
20ms) but does not provide a consistent order-of-magnitude improvement,
unfortunately.

That is, even with this change, the time to online creeps back up
into the tens of milliseconds after a few dozen CPUs:

# dmesg --reltime | grep -A88 'Enabling non'
[  +5.000006] Enabling non-boot CPUs ...
[  +0.000894] CPU1 is up
[  +0.000613] CPU2 is up
[  +0.000697] CPU3 is up
[  +0.000894] CPU4 is up
[  +0.000956] CPU5 is up
[  +0.001110] CPU6 is up
[  +0.001497] CPU7 is up
[  +0.001606] CPU8 is up
[  +0.001841] CPU9 is up
[  +0.001998] CPU10 is up
[  +0.002229] CPU11 is up
[  +0.002488] CPU12 is up
[  +0.002618] CPU13 is up
[  +0.002767] CPU14 is up
[  +0.002931] CPU15 is up
[  +0.003283] CPU16 is up
[  +0.003220] CPU17 is up
[  +0.003427] CPU18 is up
[  +0.003648] CPU19 is up
[  +0.003870] CPU20 is up
[  +0.004044] CPU21 is up
[  +0.004246] CPU22 is up
[  +0.004420] CPU23 is up
[  +0.008634] CPU24 is up
[  +0.006166] CPU25 is up
[  +0.006373] CPU26 is up
[  +0.006603] CPU27 is up
[  +0.006913] CPU28 is up
[  +0.007031] CPU29 is up
[  +0.007287] CPU30 is up
[  +0.007570] CPU31 is up
[  +0.008670] CPU32 is up
[  +0.007793] CPU33 is up
[  +0.008104] CPU34 is up
[  +0.008440] CPU35 is up
[  +0.008358] CPU36 is up
[  +0.008386] CPU37 is up
[  +0.008696] CPU38 is up
[  +0.009104] CPU39 is up
[  +0.009676] CPU40 is up
[  +0.009687] CPU41 is up
[  +0.009761] CPU42 is up
[  +0.010089] CPU43 is up
[  +0.010362] CPU44 is up
[  +0.010683] CPU45 is up
[  +0.011054] CPU46 is up
[  +0.011399] CPU47 is up
[  +0.012013] CPU48 is up
[  +0.011597] CPU49 is up
[  +0.011791] CPU50 is up
[  +0.012115] CPU51 is up
[  +0.012415] CPU52 is up
[  +0.012954] CPU53 is up
[  +0.013131] CPU54 is up
[  +0.013244] CPU55 is up
[  +0.013775] CPU56 is up
[  +0.013599] CPU57 is up
[  +0.013867] CPU58 is up
[  +0.014255] CPU59 is up
[  +0.014563] CPU60 is up
[  +0.014904] CPU61 is up
[  +0.015125] CPU62 is up
[  +0.015360] CPU63 is up
[  +0.015923] CPU64 is up
[  +0.015721] CPU65 is up
[  +0.016026] CPU66 is up
[  +0.016395] CPU67 is up
[  +0.016811] CPU68 is up
[  +0.017045] CPU69 is up
[  +0.017270] CPU70 is up
[  +0.017613] CPU71 is up
[  +0.018072] CPU72 is up
[  +0.017913] CPU73 is up
[  +0.018184] CPU74 is up
[  +0.018519] CPU75 is up
[  +0.018929] CPU76 is up
[  +0.019179] CPU77 is up
[  +0.019470] CPU78 is up
[  +0.019766] CPU79 is up
[  +0.020331] CPU80 is up
[  +0.020244] CPU81 is up
[  +0.020464] CPU82 is up
[  +0.020876] CPU83 is up
[  +0.021229] CPU84 is up
[  +0.021542] CPU85 is up
[  +0.021903] CPU86 is up
[  +0.022062] CPU87 is up

