Return-Path: <linuxppc-dev+bounces-14399-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65165C772D2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 04:43:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCLfg5qgCz2ySq;
	Fri, 21 Nov 2025 14:43:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763696619;
	cv=none; b=RaPLHTiQXh5esrlUN/H8S3FwfTuYyCo8H3IwyGLmSDjkNORd3pe7aZ73y5dHJsiIgNxQu/3hnxJBy1OisCJTcpMjhilTO/+dPGrBl30MQaoxplqLQG+adBiK0Gzs1zJksxKFu/R6MWqGHuF892onk1346QchMXpRfBKmSODazY4/Z21NPTIa26khO2gE6YG/rb22OoYPfH46UMiPB/dSnDTxPnv9z80bO+PqKNkaMjWpK+6ufcwVQExJq+S1z18i71fgfq1GjFr6iVYQnn8u1DUgBZ7Yil90G7i2iTEaPDcftBT8Ldz/qkZtmvzXWLpwMV18uNxwnrQFIxFvwpsCPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763696619; c=relaxed/relaxed;
	bh=GrQ9YtrBZJYnbo7arjtoXjTX5KXfnzw3ifbCj+Ucbyo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J4VEGLFLspugf885R74MV1KTI8E98hrKRvG4seutqihpT1KAJ7E0cXhrOyKPycdGHgzbl1+3c0kWPbuQ7WUyTMDwgBdmXxCwMBM0uho2UkcJkgFYZydCAPRnfTRcspTwYi1KxyF//DfBGps35tGnKtthC6w2pcWNuQQA7CkFkx7IRB5bo3mrwKOvubaXasdHC5YcG0pixeck1t3enU6IXQu7CrhH+FcsM/Y0jjGFYUE3XWLJ9FOwmOz5/1wKBCI7DEJHwlEb7bEcqHBLn45oDH8iEfmElthvU95pJpUaoa6yR0EHODMhUKrz4o6XtFGkqQkzWG8s3eE/AD6SWjnngw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RoUiUaqK; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RoUiUaqK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCLfc2msfz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 14:43:35 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKMcrHj002864;
	Fri, 21 Nov 2025 03:43:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=GrQ9Yt
	rBZJYnbo7arjtoXjTX5KXfnzw3ifbCj+Ucbyo=; b=RoUiUaqK3AY1gMXwGjxjk3
	z3/aH/BepesJRWIw5dV4sXi/OAofW+M+CgMjgFjyQEWJkq9y54NfIfwHegrmHlyi
	YaRkoIyVPYmqKJAIe8Z/fi26hE9qVRRmxY2ViN3pI9H8dc4gQZCEFP1/CAYkeVRX
	JqZVwYVJwweTF0BAoaD70a9b46nEIRgc2mZnc162+MMdAlkmIpvK9Ck59kfASwAR
	myWmp/ly8bf8EyNJx8XrkmAl86hmr07qjYzn4kLIag9b/Z4gH5922gAMmgqIiv3J
	HU8CPga0HrVvtMqzL1AF5PfAEEa/kmDdbScPD66WFGvI/7QyZRoRuOPMwZ2sdxzw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejju89x9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:43:24 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL3dqHW015743;
	Fri, 21 Nov 2025 03:43:23 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejju89x5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:43:23 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL30NB5010423;
	Fri, 21 Nov 2025 03:43:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3usjajh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:43:22 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL3hKi327132406
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 03:43:20 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3348F201D3;
	Fri, 21 Nov 2025 02:54:19 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D4709201D0;
	Fri, 21 Nov 2025 02:54:17 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:54:17 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/32: Restore clearing of MSR[RI] at interrupt/syscall exit
Date: Fri, 21 Nov 2025 08:23:45 +0530
Message-ID: <176369324782.72695.4834349626234011724.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <66d0ab070563ad460ed481328ab0887c27f21a2c.1757593807.git.christophe.leroy@csgroup.eu>
References: <66d0ab070563ad460ed481328ab0887c27f21a2c.1757593807.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-GUID: 0zaixKCk5kLvyWz8JHX2XdcqPBoDWt1y
X-Proofpoint-ORIG-GUID: op8JCAz_TQV2MshMvtsqCLtK9lh8T2GY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX2PKHVSjBvNBW
 nfahp2ksZS7Nw+NnqwMkGQNMmP3gDkD8d/q2cibo12Fi/WpBtKFeofDxNf44KNiLkrD8nwjCciR
 2edUVz5Urt+xMGF75vapucqmgGDhxL99ICmmSl57sKqNT/lg1ymCqf9fE8GqoJv32yIsNrjcco4
 HNaCaFJDIJAoM1I3wLfZ/xCl+tP3+mVIrn/k5s4TJKOajnWh6abaIW65IBWMig+Gndfw/fteGAm
 VCiPSObAsESHXGsru+hQg7Fd+F7jF2m/6iOq95TSPuuwEJ2XevwYTt4b+Uaa1I1Rh1sFxmjXjbQ
 hlrPyXWaDHaCcX9Ao6V6ywJeDAbDLnCIl3yHRiBzBIhhiKS1AQiYZMKbQP4Ejg46/3r8u7jwyfW
 gg1wlro7irCBsFYZg9c+gaKHXxEecw==
X-Authority-Analysis: v=2.4 cv=SvOdKfO0 c=1 sm=1 tr=0 ts=691fdfdc cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=zBquk3hgwFuBcaCGxhoA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 11 Sep 2025 14:30:12 +0200, Christophe Leroy wrote:
> Commit 13799748b957 ("powerpc/64: use interrupt restart table to speed
> up return from interrupt") removed the inconditional clearing of
> MSR[RI] when returning from interrupt into kernel. But powerpc/32
> doesn't implement interrupt restart table hence still need MSR[RI]
> to be cleared.
> 
> It could be added back in interrupt_exit_kernel_prepare() but it is
> easier and better to add it back in entry_32.S for following reasons:
> - Writing to MSR must be followed by a synchronising instruction
> - The smaller the non recoverable section is the better it is
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/32: Restore clearing of MSR[RI] at interrupt/syscall exit
      https://git.kernel.org/powerpc/c/2997876c4a1a5864baa13d7393c2b68cf5b51183

Thanks

