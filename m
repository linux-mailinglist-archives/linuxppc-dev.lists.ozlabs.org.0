Return-Path: <linuxppc-dev+bounces-8638-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F3BABADA2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 05:44:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0RX76qPRz301N;
	Sun, 18 May 2025 13:44:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747539879;
	cv=none; b=kBO1/lTleyOdDyk+B6w6kLOQlbUKGnjKfs8Go3jXZq1jJ5m8DwmNaa4i9IVbK/LjSpZ01Gxtcc8x+n1fLIBWjeEIUykS0In1RwLkh2GZyyVx1C6qUTyXROq+yowCxyIKZ0/OH440Gb7uYqnSvCLhxPTAbtvmEUCXkiSEaH7z2Oj0BKkaf5VEUjqH8s8xkVtWMAaGEVt1DQ+j3rHBMmeQUmnW90XGdh7bsaCWDaAoYjWgEHhmbLRbW/WMudBGF3DQ32abq1ES3yQW+wdaQ9sUfRBIcl9P0rLeu/4G15I6QKtDXyPqCbgoez0t+WSNIclN6JkOr48nG8cc3Gua9RU3VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747539879; c=relaxed/relaxed;
	bh=jWIFqUmSqnyy3wRA/MaNdvhQSxG4lIqJChqAvX+Zyhw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZEftxUOAuIvvSQ50mMFPjGh1e2OC6UyR9gdfssxrkmnBA/+OIZxWD0H2857xViuUEaIxjiavmcf7Twhm8ZwOXCYyo5DGFq0pToV0jAsG4S+IQ23MtKWROy/FEkJAxsJ4zREFixS7am+bEggHeA2JwG0MzDTlBagcyfWeATuSWUQMEDpjmjgDhr0YT5uvBA450vO2jbNPYq2cty8JVg6jgMatggCXVsvw5K9zBJLNbVirDKFiCWJlPtTc/1G5TOzcENUnbcU5bNHRfO0VRpeUbLEi8CkDf6EJ/CXQG17HQnV9N6rZqzwdSQkUhV6jL1oeCf8ClVQPn5kXvSGWlxdjPA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OAlRWA+R; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OAlRWA+R;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0RX72P6Rz2yrW
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 13:44:39 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I3aiN2011740
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 03:44:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=jWIFqU
	mSqnyy3wRA/MaNdvhQSxG4lIqJChqAvX+Zyhw=; b=OAlRWA+RVJ89pxb3O2AKa/
	FhBvPWdHfWRbhMAgI13VkBWtbMRuSCvo03b4UZaPlCozHdt/fhefWXJCZtDGz4zq
	Aw+MEcDRBhRypb+HEf1JaIDtRbwsnkcmGJXxI+CiNTCfM6GO7H7dyM/JRA1EpbIs
	MNpkWY9xd8wK2LMZa2ZxdySUu/4cFziITuiS/ZDACOVNeyTDeXkgQglQ8m3asYkN
	5feQE642ScuCBq0xa0bZSxVrVabd5pCLkxoYEkREMyHMIo83AC1Ur6TtZeGdNMx0
	v90mIuh/I3uw2beWKKzGI/ZLOm+AjWkEowsfgdqiscvrbvRYk3RzTbUSROsMQznQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q038993f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 03:44:37 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I3ibne028396;
	Sun, 18 May 2025 03:44:37 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46q038993e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:37 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I3FMfS016070;
	Sun, 18 May 2025 03:44:36 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46q7g202b2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:36 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3iWIi31523374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:44:32 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ABE2520063;
	Sun, 18 May 2025 03:44:32 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 130542004B;
	Sun, 18 May 2025 03:44:30 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:44:19 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Gaurav Batra <gbatra@linux.ibm.com>
Cc: Nilay Shroff <nilay@linux.ibm.com>, Ritesh Harjani <ritesh.list@gmail.com>
Subject: Re: [PATCH v3] powerpc/pseries/iommu: Fix kmemleak in TCE table userspace view
Date: Sun, 18 May 2025 09:14:18 +0530
Message-ID: <174753967075.24504.12656955563364006953.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250512224653.35697-1-gbatra@linux.ibm.com>
References: <20250512224653.35697-1-gbatra@linux.ibm.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: f7_8bKzNeTzmEtmOlRNWesfXzZOkOjl_
X-Authority-Analysis: v=2.4 cv=eqbfzppX c=1 sm=1 tr=0 ts=682957a5 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=FZXaQDq-CWzThURi4YIA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfX+Zq+Zhg9tRVi JQzJV/7TFKUyFxLKfI9dmZSZf0uYuywoqNggMzo1RteyHOOSl0Y2s/voyXDFh9pbAOhGQjyfxDa xB/iTV8U5UPWSkz6CWZJ7Np0B+3HSzbIvcwjUwWwvFamYrA36zfFQhhAxhoqqiNsCzDL2JFpDzY
 3a+Sc4l5rMihsFnGzcA61U+l9AH6kTwiDR+7XZWaAuergSyL0BByb7CtMYa+jDT+u9b0OkZN91H F/G850Q3T7ku+wt3VBXGyv3zy7dL3pT33txQ0pLOHS8bocGO0wKov5bVkIcatZNMFU+z/xUj1GD tQtc+z2NGTJcGkaVeQrV+ZSxlAK0lJJmclSdNw5xYLYPbVj9zi3NIzdH43S/pSdr/p6FpJFNf0L
 MMhMNrbQy8P1ram0BBPSKICJQVA5oT+C3S1hwlVR46ojIqJWO2uH27FWD3SeClg7YRgdxnPd
X-Proofpoint-ORIG-GUID: cprPh_5AHbWqQs5qkrjrouXjEj0aVBmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 bulkscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 mlxlogscore=615 mlxscore=0
 spamscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 12 May 2025 17:46:53 -0500, Gaurav Batra wrote:
> When a device is opened by a userspace driver, via VFIO interface, DMA
> window is created. This DMA window has TCE Table and a corresponding
> data for userview of TCE table.
> 
> When the userspace driver closes the device, all the above infrastructure
> is free'ed and the device control given back to kernel. Both DMA window
> and TCE table is getting free'ed. But due to a code bug, userview of the
> TCE table is not getting free'ed. This is resulting in a memory leak.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/iommu: Fix kmemleak in TCE table userspace view
      https://git.kernel.org/powerpc/c/d36e3f11fe8b55b801bdbe84ad51f612b1bd84da

Thanks

