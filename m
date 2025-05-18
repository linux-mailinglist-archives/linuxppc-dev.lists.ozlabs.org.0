Return-Path: <linuxppc-dev+bounces-8639-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8227EABADA4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 May 2025 05:44:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b0RXP2ZLHz301B;
	Sun, 18 May 2025 13:44:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747539893;
	cv=none; b=SY2mOIcnHK0jvrX5+hZ/KR6JQ6KNy0k/n+8YJB7SpsPSivd3WENhKke+mBbi/2iUuczNJxOiCTdPgZXrUn61/UaDast1g9hGLNz1dUuGvtFBKSShNHMtKPXKNOomEsT6dYeR1bA1IVGzDAiE4CjhBVIN67ikZ2qaSN/HZnic7bPbQrvyB7zXneMl6RckiA1Omwlh/ips58Yg4kdBeC6aTHBf5/CKIAhCX9WciaTxPjD0kpJ4c65tRT61eucWLFbDVHlV7u9g8fMw5vX+mW93luR3GCQ/yjpMy82Y1IDZVUFx51injBglWnsrh9PLumNX20yId+0wNN05suvQIdF6VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747539893; c=relaxed/relaxed;
	bh=YVmoNJzMGPGxD4NjcQajARU+SDXk/s03HD0hSrx6Zy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NP0jgoyT066Nbohc1i72GNNsErPDmZT3UzTe24Mm0OQu4iSv90AKcG2E/G/MsTnq48XIAx2his5rXtFLhA+vGtCl3CkC3Tu3R5klWOwA+P10VJQt9j32wlKnaah04wdcFvzpkcwoHrtBtJM9J6St4m7GZbQQgXLqstjidg4HeVWDnyedQ8gOF0RG6eyQ+6rSlw/m8QnVclV7T08vr5bsH0V0WRQDjDor7oxypuhUYIdkaRFuEJYZ/F24Lnw8XK+T0IH/6NYdZYayA7jm+xClkCdOL2hh73yD6na/lTb7B9aTDQi3rrqmZ6xnKRbrIeb/rSoopHDoOvVnPsLwxw06Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TpEoWl3n; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TpEoWl3n;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b0RXN4QTCz2yZ8
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 May 2025 13:44:52 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I253kp023569;
	Sun, 18 May 2025 03:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=YVmoNJ
	zMGPGxD4NjcQajARU+SDXk/s03HD0hSrx6Zy0=; b=TpEoWl3nNT/yhYQScs0bJI
	Mp7TCKO3RcmgeDN7s/xwW75N9fR6EmTOZ5Kf4J/l3kLBdIfogLgXzRmuRmbXwLav
	jlq5uk5P0TYNr9CELh8y3FPbjMTCyTKp11FnI4M/5kr19Cf3ekVbSnSXZ6Zz1KVe
	MXgum3gGvmI0FB/qZlr2I8ODyUgf8HGaTc/9CEhveVSmG7h6aaOQvcDnxOnvj91x
	byb8Sv2jaXvOWq1qtzMqpLgwfYQszwLjvatv21lE9eR0e3FCif6jnWjD5cbhRX35
	Ahh4XxMIy75VtqrgwxuR0eDocY758U95YPJNea0E0IcsU1HCMI7J91QCd84cUOFw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pn2sb7ax-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:41 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54I3ifxX008191;
	Sun, 18 May 2025 03:44:41 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46pn2sb7av-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:41 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54I1JRKH002449;
	Sun, 18 May 2025 03:44:40 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46q5sngcnb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 18 May 2025 03:44:40 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54I3iclf46334354
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 18 May 2025 03:44:38 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B510620076;
	Sun, 18 May 2025 03:44:38 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3F0D920075;
	Sun, 18 May 2025 03:44:35 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.51.82])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 18 May 2025 03:44:34 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: naveen@kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/kernel: Fix ppc_save_regs inclusion in build
Date: Sun, 18 May 2025 09:14:33 +0530
Message-ID: <174753967074.24504.15313465683489339112.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511041111.841158-1-maddy@linux.ibm.com>
References: <20250511041111.841158-1-maddy@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDAzMSBTYWx0ZWRfX++oP0AI573x+ d3jVVwabroekI5MgEeMMQGrY5mmG0dFwp1n6tn0CXY59oUEmO35rfF2Pinq2WljkZDMAZp8vd0B bFQx51iolrgLXWweBCxN65KU5LfhVMWVkqHB0pyOeOrpjhjCoP2cGLXzjOewqDeDrN5gkoodTVm
 dEWP26GIW8PoH1TBpwb8diOykZPZQaJs27uVvKyOZ5ISLl3FYrYOrxaHuf/GUtgYrkUYqpHIsrE YeqID32Vs7TcTsoLMs6J0SBKXM5jhFNTXm+4KWV51tORRdBvKLVi7HHrEV+xITQcdxVCGST8S/6 XS0rnDarmz/W0gV77IKWTPoNZGQ4QO9cqrNaoas6Qajl7nApNOkn6QWx3HqkmWdBBSEx/J9kgpw
 Nh1DIHkr5BG1eC83ic58LxPvWJWcUD3wGMQFjq7Bt4daGag88HKtK17ABQbMU0J5Cu7VjpAS
X-Proofpoint-ORIG-GUID: PTU5ct29Y0I7ATzaSCPzuO4_z6jCfNRB
X-Proofpoint-GUID: Plu45g1rH39Ia2KTLrX79teatScLaADd
X-Authority-Analysis: v=2.4 cv=GYQXnRXL c=1 sm=1 tr=0 ts=682957a9 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=kmcIpHd7y2UUGp-fxi4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_02,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 malwarescore=0 spamscore=0
 mlxlogscore=666 bulkscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180031
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 11 May 2025 09:41:11 +0530, Madhavan Srinivasan wrote:
> Recent patch fixed an old commit
> 'fc2a5a6161a2 ("powerpc/64s: ppc_save_regs is now needed for all 64s builds")'
> which is to include building of ppc_save_reg.c only when XMON
> and KEXEC_CORE and PPC_BOOK3S are enabled. This was valid, since
> ppc_save_regs was called only in replay_system_reset() of old
> irq.c which was under BOOK3S.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/kernel: Fix ppc_save_regs inclusion in build
      https://git.kernel.org/powerpc/c/93bd4a80efeb521314485a06d8c21157240497bb

Thanks

