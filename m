Return-Path: <linuxppc-dev+bounces-8065-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EE26FA9E74D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Apr 2025 07:09:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmBMS65qtz2yql;
	Mon, 28 Apr 2025 15:09:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745816980;
	cv=none; b=lBQcoGkZPl8F3wHOPAwkF2mQa4v0dAJa2HIktA3q0IV8Ae7AcBEw51DHmdxmHF9PkQsK3GiIboutrndwhCFRC4X/29HT94odlxLikcyipf9LruHagFmn2g5AT5k4ZsiecCvc84Uw7vZmSbYa243jInDto1/+/UhYVwLBTh7DkMrjFP8F/gpxvrcr4DtJZk1m5RW8dpxh9P2reA069Lz/Mz9xxmtejBnSSLLLk1RoygY7WhkopRRJYO4C31WkfOpSVsAi4p4wbjAELacJAphMkVbiSOaOTjXKTce7lWOc9mmRZGNot1YGgjRrBCzQMC4++HMH4rJ/o1n37lKkUbQxqg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745816980; c=relaxed/relaxed;
	bh=Mr1poobggn6JY8NgFJGQfnnwZCaRBg6+TJ+LyBuoOiI=;
	h=MIME-Version:Date:From:To:Cc:Subject:In-Reply-To:References:
	 Message-ID:Content-Type; b=DmyWs8F6Hizw3cMBLyxZUPRJRuBkIPcUZqSPQrh+kENcDk5XpVTrLx3ynKNLSB7aCt6UHO9b2O3mpjUHrSaCIoYvrM9M3nEmZy41M/eMw7HJmI4hWGgcw/CkD5p6OXuoZ1D0BiqentXoZGm9XorRoRKAVz7I0TnElfurzJDKNrngaRMDQFsX/Vz3QvZxeO0Uoy5ymHNWcLRIYFmMBMwszhZkWKlcmkHvv5WfFP4gIq/+zewoJeDNjKUhTXyxNrypG7CRROlsgj/CNwwLdBCoaFVZCh5vXzegcyQ9+6hMtkjcSvlH+lGLsUL7NBbt73KEzcO2kPhHxl9GNJoV2Ip1Cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ndiZNUkv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ndiZNUkv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZmBMR3VNHz2yTK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Apr 2025 15:09:39 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53S4SFqt002962;
	Mon, 28 Apr 2025 05:09:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Mr1poo
	bggn6JY8NgFJGQfnnwZCaRBg6+TJ+LyBuoOiI=; b=ndiZNUkv31ukPWvnc8SRFF
	jzva+dfLrhX6v/9d651ai3T/jBaJFa1qI76XUuUPRmy9K1VsXEUwSMLTIykLAOU6
	ZgHaZRRyBAlrylB5dVNJq1XClQtEQze3iGSTeUPskemWz7v+izjdvdctDrdTch7R
	74jLQ0Koq3Hz8DKdek2WdONGzSM78g3x5QfOnQ2qa3Hgtr54dR01H3mIXnnkU4Bl
	O6gBYUlSYSqNDi7kQ2RATUi7/87qfP7mhl0evtSHh8AszF1zE2MCc6WfqGL1F70w
	/mJ6lUg/XvfJXzh1J9/H/LyoHgx+EvJUpIQeLv1ydOhk5Q+rBFUMYm7p5dU2/P3Q
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469jgjav2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 05:09:20 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53S59Iuh002999;
	Mon, 28 Apr 2025 05:09:20 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 469jgjav2r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 05:09:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53S49v1P024595;
	Mon, 28 Apr 2025 05:09:19 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 469c1kvm4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 05:09:19 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53S59H1L2228850
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 05:09:18 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9268B58064;
	Mon, 28 Apr 2025 05:09:17 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 224875805E;
	Mon, 28 Apr 2025 05:09:17 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.5.196.140])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 05:09:17 +0000 (GMT)
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
MIME-Version: 1.0
Date: Mon, 28 Apr 2025 10:39:16 +0530
From: Misbah Anjum N <misanjum@linux.ibm.com>
To: Ritesh Harjani <riteshh@linux.ibm.com>
Cc: christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        mpe@ellerman.id.au, naveen@kernel.org, npiggin@gmail.com
Subject: Re: [BUG][powerpc] OOPs: Kernel access of bad area during zram swap
 write - kswapd0 crash
In-Reply-To: <87ldrujhr5.fsf@gmail.com>
References: <89bfdedb74416156423d36d28c5b92e9@linux.ibm.com>
 <87ldrujhr5.fsf@gmail.com>
Message-ID: <bcec125a551e086911f82cef7bd632fd@linux.ibm.com>
X-Sender: misanjum@linux.ibm.com
Organization: IBM
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wsIDt46e0tVfdjVz3Zr7Uo-7ay9M-Yen
X-Authority-Analysis: v=2.4 cv=C4/pyRP+ c=1 sm=1 tr=0 ts=680f0d81 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=NEAV23lmAAAA:8 a=09Uxs5wTwXsWUI50y4oA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: o_Ee4r_eH4VpeaGAGKu0gvRZHrPdlGhU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDA0MSBTYWx0ZWRfXyPTdSNEfU8ST hup4A1NYpNG0OsEtWzTLFajrs+swh095bfGS6z/uvvzEkq9jKClNEgDQqoAkBCFf7Erfe4nNIiA ca/BXl4A3ww7M4yUPkoBT45re6CnD7IjRPnW6IMXX3ysvZCiG5ukZqSyi4+c9cnjcfXuYfycEt4
 sNLV7qp77Jkwilzq4VCSjypW4EDJXFww6LBPf6tlg2yisWUwUfOWnfhMGrdeEaLYlZPCQ2copr+ M1hg/0uD8/8ypDlxfXiopz2xjWZ+3+COnOpHinAMD9JmKUJpe7PAFHwqh494VBkh0GtcJOiS6Ja QvTxMFtKhe056C3hjLwU5VsaRw4hTJ9ZJuVJiFIUrahTA6pSzpYmuswByhQWzejAExG4aBgQGC+
 ucJIYpj9BoAH4FmluPq8VzDAJdzNP5yJH8HNWZkkuCw0un1vfrh/nuXlnwP/6MIw6Q7lgICm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0
 clxscore=1011 priorityscore=1501 mlxscore=0 suspectscore=0 bulkscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280041
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-04-21 09:19, Ritesh Harjani wrote:

> Looks like the issue is happening on 6.15-rc2. Did git bisect revealed 
> a
> faulty commit?
> 
> Looks like zsmalloc new object mapping API being called, which was
> merged in rc1?  But let's first confirm from git bisect, unless someone
> from linux-mm who knows zsmalloc subsystem better and can point on what
> could be going wrong here.
> 
> -ritesh

Hi,

Regarding the issue, I am currently running tests by removing the 
suspected faulty commit. Unfortunately, git bisect is not feasible in 
this case because recreating the bug requires running the avocado bucket 
for approximately two days. Hence, I am resetting the kernel to the 
commit prior to: 44f76413496ec343da0d8292ceecdcabe3e6ec16 and manually 
running the bucket to come to conclusions.

The commit in question: 44f76413496ec343da0d8292ceecdcabe3e6ec16 
introduces zsmalloc - new object mapping API
More information: 
https://github.com/torvalds/linux/commit/44f76413496ec343da0d8292ceecdcabe3e6ec16

I will update the upstream bug report with this information after 
performing the tests.
Thank you,
Misbah Anjum N

