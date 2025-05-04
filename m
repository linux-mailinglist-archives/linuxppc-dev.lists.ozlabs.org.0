Return-Path: <linuxppc-dev+bounces-8270-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 482BCAA83B9
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 May 2025 05:21:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zqqh54s0Gz2yqn;
	Sun,  4 May 2025 13:21:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746328901;
	cv=none; b=f2RRS0ICbWSCy7S9mbPSuFaUHxtqVws0lu+Gwsk03bAbp3D22e9C4e+XO2lAffV+0DBLVQPESbwtyffynGAOUVjwanCHWRlmuz1cgyy7Lu2rxsHg3kOcMcWdh/aIXuYVvZK8SJgxtb4U5cIUFVWF3uKzeKtxWDmIvzF17QyCBed58KyFUOVWOYR8k9IuHI030Q5SKerwvWepNbb0+SN+gaaB7oefmIlm7MznH0LbB/h2PMgst9RZraQdmCMX617t5klxXvTcTryatlclBEWB+z6+rdD1/B3gLuPFuh1m7wsG3Z4HKTC5Ij2vnNsI5PrzOT6O2HN0/amq7YtTtX4dpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746328901; c=relaxed/relaxed;
	bh=S2F+RYd9wZDLevjGHWb1UYjtqmlYocp8Z2jBhNR8qi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EEnqgNP35WTu4+phBT0gI+lcCnN9H3DKmfzyCMpTmKFd0y8ysl0J8tQL3TSBYAJ1lo/Pt12XTS9rgY9P5LtE6QTpFMYsp4Ate1fpgz7WgfgwkzCLOB4gUEfYy/3lo2yarqSM5YV5+mOh+szUejmL7rngF9zPrbxkmU/5RdE2o/tLDXvzWuO+mVZZ1RYF8mLe243uFFiqt+Mb7LRHuWK0ZCs81aemVuBNOoYTbteMOm2DgF84eaIBuKS6tQ80LJ0SUTCWHRbzkNaM+WhAyuLIOenrNBC9pAqRDEL1WSbmj7uno32eJMwWHVAQWwPisbUGqaLxGMR4j0J3GZCZgzIk2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RSr6sJG6; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RSr6sJG6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zqqh46Tb5z2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  4 May 2025 13:21:40 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 543Mo4b1016826;
	Sun, 4 May 2025 03:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=S2F+RY
	d9wZDLevjGHWb1UYjtqmlYocp8Z2jBhNR8qi4=; b=RSr6sJG6b5rPQiAamMVvOC
	3xFlKNU34L82dLp2BgDK1q0vOqTFiItipms11omCRPsdegJsdu6J1Ps7dNZyRfhQ
	q/rGoKbFu1stYpLlzeQ3KdAxVcKszHnCYQNyTePB4kHWQ1IvP7u1cS7zFXY053Ot
	r7fi5AIxFolkw/JTNbigWUeu6LEQeQxKKJ+T1DhYO0wDDEooH8bzP750T0W1XNcP
	q8l4m2l6Rjs8Dzg0QB/54t0EZj64mKu64vdJyw/Qr06TELNHOPtr3cTgrjMrfc7y
	w8j91KIEhBORiKlH7HbKVro9HuWME6ghs3FTRK8ZISjTMjLcwP2uTXYKNbKzwm1g
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46du9v8n35-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:29 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5443LSJn017670;
	Sun, 4 May 2025 03:21:28 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46du9v8n33-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:28 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5441rRk4032235;
	Sun, 4 May 2025 03:21:27 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxym87xj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 May 2025 03:21:27 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5443LNVA39911716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 May 2025 03:21:23 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C1DA120049;
	Sun,  4 May 2025 03:21:23 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0957020040;
	Sun,  4 May 2025 03:21:19 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.99.78])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun,  4 May 2025 03:21:18 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, Gautam Menghani <gautam@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        vaibhav@linux.ibm.com
Subject: Re: [PATCH] powerpc/pseries/msi: Avoid reading PCI device registers in reduced power states
Date: Sun,  4 May 2025 08:51:15 +0530
Message-ID: <174632869188.233894.4873397095169337027.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250305090237.294633-1-gautam@linux.ibm.com>
References: <20250305090237.294633-1-gautam@linux.ibm.com>
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
X-Proofpoint-GUID: UXduKJ87RUAHaiXd4d5RIheWz6baHltk
X-Authority-Analysis: v=2.4 cv=XNowSRhE c=1 sm=1 tr=0 ts=6816dd39 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JkMHheumRQZugVL5IKsA:9 a=QEXdDO2ut3YA:10 a=ZXulRonScM0A:10
 a=zZCYzV9kfG8A:10
X-Proofpoint-ORIG-GUID: eYBLSUlFqBKrrKHPfKDuO9UwkmZSFCdR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA0MDAyNyBTYWx0ZWRfXxIB3Q70r1KLZ EA+zvKPK4Cppmf05Ugltp9eZamhHBtrxtWHPFFYccyfNQMI06c7PE3aUgEejtSG0ohEBppwMI0j NifSHS81vhiggPuU8plQE91PEdEofDJFTE0zxi6F26139E08HJCc5eiAncolCd9rdlXN0e/Z3jo
 joOImOE0Xr4LrCcnexW1+LO+P0wvDd7OUJGHbHg3cSDNRAVgJxgUgdh0E/FPJuquKYZvpKcGxkM Ayoj+gsqC53RGilvkGtNczgLLEGuyK6DCeo5OD02jvBfBE5EqIlXAtarfMUiy8XLun39B6QX/IM cFvXNxSpSAiT1YVOeazMN0/DIlDHgTGphSYm60dBQVgFKSZhJup82E4aLiR07oRw+e/I5dAetPQ
 n7ZZa1MdTQi1wM7aUlVfZ0ksMFNnSfYKGWn+VmsVbHIEkLffXMMGQCS0PLG2oXPgkgEXTbbn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 mlxscore=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 clxscore=1015 phishscore=0 mlxlogscore=559 suspectscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505040027
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 05 Mar 2025 14:32:36 +0530, Gautam Menghani wrote:
> When a system is being suspended to RAM, the PCI devices are also
> suspended and the PPC code ends up calling pseries_msi_compose_msg() and
> this triggers the BUG_ON() in __pci_read_msi_msg() because the device at
> this point is in reduced power state. In reduced power state, the memory
> mapped registers of the PCI device are not accessible.
> 
> To replicate the bug:
> 1. Make sure deep sleep is selected
> 	# cat /sys/power/mem_sleep
> 	s2idle [deep]
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/msi: Avoid reading PCI device registers in reduced power states
      https://git.kernel.org/powerpc/c/9cc0eafd28c7faef300822992bb08d79cab2a36c

Thanks

