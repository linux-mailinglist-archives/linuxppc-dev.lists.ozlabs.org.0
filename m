Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D51725771
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 10:23:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbgMc0j7gz3dxM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 18:23:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tCqX+kyH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tCqX+kyH;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbgLk3WfVz3bkn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 18:22:21 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3578D9p8005900;
	Wed, 7 Jun 2023 08:22:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=content-type : subject :
 from : in-reply-to : date : cc : message-id : references : to :
 content-transfer-encoding : mime-version; s=pp1;
 bh=f4FWAMItm3ijlORKMfEi9nJdL7hEw2f1KcKOhyus33E=;
 b=tCqX+kyHFffYqyr7UtcIw9MJmLNYBGwY6RoVBBM3NsDh/b8Eydbxhg4VUYomO871rhp7
 WyD7yxAUMwi25lossdYWH4RHp8uGVz2Ta89S80OqK25+Jj0DV7a5/kUWW/CebHo7hLmI
 m3lgNTRPadxpua2zr+7nFl4+ntbHN+UDhyRaP7dumwa5A//WELDlMcFinqozkUxSjOVT
 4GeVt8EJcBkClFSNn6RtbEZAKXIZTOfLSHCTxjdDc1a/lt676WtjeUxmTz3vZ93c3x34
 EgVqHcQtYCMmEaPtycaqGQ8BVlUSydkFrtRDjXmyBjzUZM+SB7/ASq39xmy5EyeBfy8z kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2p6c878f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 08:22:17 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3578DEvJ006342;
	Wed, 7 Jun 2023 08:22:17 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r2p6c877p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 08:22:17 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3576bo19008458;
	Wed, 7 Jun 2023 08:22:15 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3r2a78r9sp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 Jun 2023 08:22:14 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3578MCwj60162514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 Jun 2023 08:22:12 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 95B932004E;
	Wed,  7 Jun 2023 08:22:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0B242004F;
	Wed,  7 Jun 2023 08:22:11 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.109.241.192])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  7 Jun 2023 08:22:11 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Subject: Re: [PATCH] powerpc/64s/radix: Fix exit lazy tlb mm switch with irqs
 enabled
From: Sachin Sant <sachinp@linux.ibm.com>
In-Reply-To: <20230607005601.583293-1-npiggin@gmail.com>
Date: Wed, 7 Jun 2023 13:52:00 +0530
Message-Id: <D247AC57-F552-4BDE-832E-C8DE2E8D684D@linux.ibm.com>
References: <20230607005601.583293-1-npiggin@gmail.com>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: m1jwzGMP4Rxf_nt4qRWy9W5yvNuhd5ec
X-Proofpoint-ORIG-GUID: r92ErdPmdFfqWiYraXGE2NOcxcPVtZmn
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-07_05,2023-06-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 clxscore=1011 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 mlxlogscore=803 suspectscore=0 impostorscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306070065
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
Cc: Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> Reported-by: Sachin Sant <sachinp@linux.ibm.com>
> Link: https://lore.kernel.org/linuxppc-dev/87a5xcgopc.fsf@mail.lhotse/T/#=
m105488939d0cd9f980978ed2fdeeb89bf731e673
> Fixes: a665eec0a22e1 ("powerpc/64s/radix: Fix mm_cpumask trimming race vs=
 kthread_use_mm")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> This sounds worse than it probably is, radix can likely tolerate an
> interrupt hitting in mm switch, and the active_mm update may not be racy
> in practice either. Still be good to backport it because I'm not 100%
> sure of that.
>=20
> This path can be stressed by reducing tlb_mm_cpumask_trim_timer (e.g.,
> to 3).
>=20
> Thanks,
> Nick
>=20
> arch/powerpc/mm/book3s64/radix_tlb.c | 10 +++++++++-
> 1 file changed, 9 insertions(+), 1 deletion(-)
>=20
This patch fixes the reported warning.

Ran powerpc selftests (with default value for tlb_mm_cpumask_trim_timer as
well as tlb_mm_cpumask_trim_timer=3D3 ). No new errors were observed.

Tested-by: Sachin Sant <sachinp@linux.ibm.com>

- Sachin=
