Return-Path: <linuxppc-dev+bounces-6484-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11222A454A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2025 05:47:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2hlS2VmMz2xdR;
	Wed, 26 Feb 2025 15:47:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740545220;
	cv=none; b=L++MyK1iWIpGB7aoVEKpoqn2WpUxulmjHwF2TA8MVK7smUDSRSj8MyLzILDl+ldsNfK+6vARF9iZO2N0emt++GxGHcsmyRejRZbuqtHg62LuMxaAfgyGrSP8is3xdQfhIQUOBh8A+BrSxvXbm/Ihd21xTbyhGSZv7MXoDWdmdr29rgAw52kGOU6TmdjXOJPQmyasQWurmoEt65rjJHPopAQC9cJET21/dXF6roSWnsaswUzKLNVHSWJGfyfZXMMZOBp4vURDaSRQ8Ln9Y96ylvpRUJZIJtRBfJIuk7fkihyUWZKxc+cHG3QtYmhGhYrr5ywxr/2HmFpMl24F4SARug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740545220; c=relaxed/relaxed;
	bh=eXSdLbJOggzZQEA4sHdq529HfrnQ1p0S3qmolMOzjzg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=b44hQVwxZyTtzgTnniG4/y+y2CnF7MUrinFJ3oZIeOiNDB1qTVGj3I+SMXcWpz0XyJkn+pvDRHxOGITBs7Dmp8JleeJf6LZsoYcx9sR+LmP0227fNgOBlFRqZb8mi02fHei5fh5SxXD1VEb5B3PWOlcMTijTJpxyAnbEPwFCFnrvOW75apYROGMZ4svloni5ymwc+bykdYxOlE4AVNO0uroLXsYPUmA3f476XiK80frjmkuvOd949Wz8zMBmZRdY0so4ffVR6benM7bBoFryUPs07DxmVDfJHYRY73fNtX8mIvq7xj9jHVB5nyhczXqVN8D5gsmOseOLE19UzlpkLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KXAeSvBC; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=KXAeSvBC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2hlR4Y84z2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2025 15:46:59 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q1n9Ms015935;
	Wed, 26 Feb 2025 04:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=eXSdLb
	JOggzZQEA4sHdq529HfrnQ1p0S3qmolMOzjzg=; b=KXAeSvBC7Qh9mJwmkj/qxr
	2GhxpPTS9JywhB+paCjE5zFxQZYMCIOsb11IK390AcE+SnKj3D1JH3gSIsT/eAMt
	P+mk9xCvL0LIFhttxnYXoe8TMq8R/5NnDfvroAcjhTlKB1c0l3Bf7rE+jR+krqH4
	qEH8Wm7+gBAsLO3VTDAkF+709615Z5F6P50Fmu1MM+XF3ibIXXGZq2yiEzcno17z
	tVRpBPt0UnLzMFrwhljJbP/lKjTrMynAA2KfFP1QPAC+fnI/Pj+3qYoIZERbO8Bx
	Ge1ReV/kc2ltUMx+XTrjbRJTYbeeI8GzwsfSO2094gDFT6cuo3FuZq8jQ2QRdIhw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451s198qrr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:48 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51Q4klJU005970;
	Wed, 26 Feb 2025 04:46:47 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 451s198qrq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:47 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51Q0lVHf026304;
	Wed, 26 Feb 2025 04:46:46 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44yswngsvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 26 Feb 2025 04:46:46 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51Q4kiNU32702724
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 26 Feb 2025 04:46:44 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0E592004B;
	Wed, 26 Feb 2025 04:46:44 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D92720040;
	Wed, 26 Feb 2025 04:46:41 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.65.188])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 26 Feb 2025 04:46:40 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/time: Define div128_by_32() static and __init
Date: Wed, 26 Feb 2025 10:16:39 +0530
Message-ID: <174054508252.1386382.5381279072295079526.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <50810349bf1eee378fbeab72a36e4b6553a60c3d.1738749246.git.christophe.leroy@csgroup.eu>
References: <50810349bf1eee378fbeab72a36e4b6553a60c3d.1738749246.git.christophe.leroy@csgroup.eu>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wDVYu4xa319XOIyyF2HqagPhZSj3eYlh
X-Proofpoint-ORIG-GUID: KXa3Z-JPUjIkILz9p0UEpWmIB-daQ2ST
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_08,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxlogscore=885 mlxscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502260033
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 05 Feb 2025 10:54:26 +0100, Christophe Leroy wrote:
> div128_by_32() used to be called from outside time.c in the old days
> but since v2.6.15 it hasn't been used outside time.c
> 
> $ git grep div128_by_32 v2.6.14
> v2.6.14:arch/ppc64/kernel/iSeries_setup.c:	div128_by_32(1024 * 1024, 0, tb_ticks_per_sec, &divres);
> v2.6.14:arch/ppc64/kernel/pmac_time.c:	div128_by_32( 1024*1024, 0, tb_ticks_per_sec, &divres );
> v2.6.14:arch/ppc64/kernel/time.c:				div128_by_32( XSEC_PER_SEC, 0, tb_ticks_per_sec, &divres );
> v2.6.14:arch/ppc64/kernel/time.c:	div128_by_32(1024*1024, 0, tb_ticks_per_sec, &divres);
> v2.6.14:arch/ppc64/kernel/time.c:	div128_by_32(1000000000, 0, tb_ticks_per_sec, &res);
> v2.6.14:arch/ppc64/kernel/time.c:	div128_by_32( 1024*1024, 0, new_tb_ticks_per_sec, &divres );
> v2.6.14:arch/ppc64/kernel/time.c:void div128_by_32( unsigned long dividend_high, unsigned long dividend_low,
> v2.6.14:include/asm-ppc64/time.h:void div128_by_32( unsigned long dividend_high, unsigned long dividend_low,
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/time: Define div128_by_32() static and __init
      https://git.kernel.org/powerpc/c/f17bcb97ed415235bbbcf897a28de856b88ddf95

Thanks

