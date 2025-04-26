Return-Path: <linuxppc-dev+bounces-8001-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11799A9D772
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Apr 2025 05:56:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZkwqT4MgVz2yDM;
	Sat, 26 Apr 2025 13:56:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745639765;
	cv=none; b=PQdBvZP0SJ11dETjhSjDJICn482ByTacs5A6OKYn+DmM/vr+LqGJJIaqgzufGZ/KiaLxe2ykuwWm2oXGR7e6XWPyXGDCEZSLvpTlk6I+7SK/PXiZ7QKKap/8SfawXCTCjFyH6sTsBIUCbqBq4QhBbhXSao14YUEnzi30SJFtXZrXoJwMXhjXACLoc1L+BNsJP25gJ6sa5h1/6pu/4IEHPzx2fnev3S1IPqhQauqKXNU4NEn7Q8R7MWXyO01BUrDNuGpmFbwtEyZ9ab0o5up2cJxiFiaA3UylpJvb5k+EDfL9pzDjNyTqDg6pnI4SpchvekzufIyeYpHzczzZy0Gw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745639765; c=relaxed/relaxed;
	bh=45RCHqDsUheeG5B4X9cRAkVNsUaFMCq70dUByb733iw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FAWzoQXTCeaKpJRupBEhgNAImulV2RWu0UXhhXfagWoEM3CGZJywg97nqxBGVtxIHrnPt6POcamWnZtx1poPVTJ7WoWAO24RqexZvRNxZyz6ewoiOOCLqNzWuST1OjWsb4R+v3dGqqO//2IQdPI270i42cJYRI8Z5V5iuuF2XtzS+Jr7Ukj5YWJYFp5NXTiS87954UL6ySFOsUQCJTeZcQ9gwon7uqXGBAJjdjjNHJCFWwM7vEOZs8U7dLUCpAL9EeMm/c2lRsLCZZTaE4PHrToU+ZPOGlCpN744bw+gqjqOtB1Jj01wiho7aHSOr21zgqwsiIXw245d1XfEBQBuPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P+WMgKB9; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=P+WMgKB9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=likhitha@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZkwqP0lWSz2y06
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Apr 2025 13:56:00 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q1WZ1v003373;
	Sat, 26 Apr 2025 03:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=45RCHqDsUheeG5B4X9cRAkVNsUaFMCq70dUByb733
	iw=; b=P+WMgKB9dlYqWR3Q6oiGrq2rdSeb+BTrqvxPxukwF13zBhyP6vTYliqEt
	Vrjm2ASmsDfMLGR+0EtBXHncRD/snoI696D7MUBRMsej2XBB1J+mH8QExDENJvH2
	mXlQ4IiwjA+FkWQMfPcK4mFjmfjAY3MMyiAsJwICzGfj3fvuBdFGyj6cX+nrlW2r
	ZFuVLCf+6qYLiwEkFNZLr/AqTjwmSBTaaOAg+3Nzs21Vgfr8dpLRw1qX/YNTBHgP
	N+TRnBe8M5v5Y3CVY3a0K+rROd0mhKUkXAdDvE4PAFOHcMlZz4bBOlKj2zSWOkDf
	p6mUl02TaJ4YBRmmS8rd3ioVMbp7w==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468nwmg9m9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:45 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53Q3tjat009155;
	Sat, 26 Apr 2025 03:55:45 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 468nwmg9m6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:45 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53Q0GkgX004097;
	Sat, 26 Apr 2025 03:55:44 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 466jg08e5s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 26 Apr 2025 03:55:44 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53Q3teN736372810
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 26 Apr 2025 03:55:40 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B85D320043;
	Sat, 26 Apr 2025 03:55:40 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45AAD20040;
	Sat, 26 Apr 2025 03:55:39 +0000 (GMT)
Received: from li-e616facc-2daa-11b2-a85c-9c7f23c3cd5e.in.ibm.com (unknown [9.199.192.254])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 26 Apr 2025 03:55:39 +0000 (GMT)
From: Likhitha Korrapati <likhitha@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, Likhitha Korrapati <likhitha@linux.ibm.com>
Subject: [PATCH 0/7] Removing unused macros in arch/powerpc/perf
Date: Sat, 26 Apr 2025 09:25:28 +0530
Message-ID: <20250426035535.450778-1-likhitha@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI2MDAyNCBTYWx0ZWRfX53wmk95+PNFt P3ho7TWuQ8bJYDlz4KFo9DydlJV/Gi8KXoKroXZI8HuwFlSw5yuiunMfOTqN4XwV3vJfbrmt4FN Ti2kWnxUegj3zXmKl9SDKf4P7FXZZWEmJ7tyvWN9PDI9/+6aIEp2E5EVlg/ZKYHuK1hOJDjLIBY
 j8Fxqh3LtPZwTlcw36C38CL8SUKcTF2f1XtlG1asvv7X1nGq90MSMZNKTFxM1lypEKX+BvwmIwb AlMtxAi3wEqVHMmU2fS+I+hF05ivXWyAsickqdebb5EbNa/x2naV5KsVushm7khvphrxRypGAYI GfOumAdy78c5/94ATDlMV3CP5tQECCdnRlmIe9GpqdJoVmYZ8clXWxn6AIV34Qa7QesGV27azUz
 NDkaq5fDY8eXTBlEzX903P5/RRV51TIq8w4KvBktitXNF1YBI8e010K2LBGTL30QvrU+jjuQ
X-Authority-Analysis: v=2.4 cv=Yfq95xRf c=1 sm=1 tr=0 ts=680c5941 cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=yTFqI846pJkU-g4hdzQA:9
X-Proofpoint-ORIG-GUID: VTL19q15BCj4u1RAzi96_B4FF5x_uXrO
X-Proofpoint-GUID: 2elrK7begwEEwFAERN8QNtcMb1itAvgI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-26_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=625 priorityscore=1501
 clxscore=1011 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504260024
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The patch set below is work done to list all macros defined in c files
that are not in use anymore. Thereby categorising these macros as dead
macros. Use scripts to identify these macros along with
commit-ids. Patch set consists of patches targeting a file in
arch/powerpc/perf which has unused macros.

Likhitha Korrapati (7):
  arch/powerpc/perf : Removing unused macros from power5+-pmu.c
  arch/powerpc/perf : Removing unused macros from power5-pmu.c
  arch/powerpc/perf : Removing unused macros from ppc970-pmu.c
  arch/powerpc/perf : Removing unused macros from power7-pmu.c
  arch/powerpc/perf : Removing unused macros from power6-pmu.c
  arch/powerpc/perf : Removing unused macros from power8-pmu.c
  arch/powerpc/perf : Removing unused macros from power9-pmu.c

 arch/powerpc/perf/power5+-pmu.c | 16 ----------------
 arch/powerpc/perf/power5-pmu.c  | 16 ----------------
 arch/powerpc/perf/power6-pmu.c  |  2 --
 arch/powerpc/perf/power7-pmu.c  | 14 --------------
 arch/powerpc/perf/power8-pmu.c  |  2 --
 arch/powerpc/perf/power9-pmu.c  |  2 --
 arch/powerpc/perf/ppc970-pmu.c  | 14 --------------
 7 files changed, 66 deletions(-)

-- 
2.43.5


