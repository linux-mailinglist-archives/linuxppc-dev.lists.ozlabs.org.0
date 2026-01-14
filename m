Return-Path: <linuxppc-dev+bounces-15674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 58700D1C321
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 04:04:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drWDh0b3Xz2yQH;
	Wed, 14 Jan 2026 14:04:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768359875;
	cv=none; b=MmKX5PKgGRnaArxN/sQpCi6wna1izQq4lb2VDUjfVGAhEFc7hKWwR/w1DSZJJS5ueuX5AfYNiUBOznuJKaN0QzonDiohyGSE1hZYndjdqNazySOuzcyCm4kxZCHHqI5buZ9FUc6wUfkL7wntvCNu4FhGFquOEFCcE5dpu6I+uruaIYuo5yeKB/HY6k33TZUZoo1rR6tfx5eu/y5QB0upbUbUFSygvdk+mROA246i0SRJM4BAntXO0yj5t1EzpFaIjamIRP0r821vJdTcZBSTTNNTeukVidJ9Y/o5d/MrrW6B7eklgDLrK7LCyTP/0YrBirS/+PJoWLznXrf8Ni2gFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768359875; c=relaxed/relaxed;
	bh=4KqCtn+SDwrKbeBcHbX4N3OhCwsqhahekXIHHwM8LRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J8wACU+7ASDY7J6plOTLbHJ/Af3bPJtkLkjJttB+o0IZKZ8EN0n+ukRufGBJdJlpfNYU+lXi39Ai8WJyOdf93ecU9flvX5UmEqt/STZF+VA4Z9Up05A/OVV6qB6Z6rAdmQsz3T/f0DxiFiEm2zkgiHWFOKYDNO+p994drvdPEmWRqzEsbFuRTTWaQrxaLy+PJ782KVzUez+nEYD9VPlXckkS2WUqXJRH9jvvIpxFfW3cjbZx+QTbCWFqua8PDEJkEha2LFcQ/5jdi7RJ1TxQgtmlIENNJAncPyyIN4pySjcaNEpafcY8n2XjF9lNQZScVySfe7Q0ck3yU4hT39nE1w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mu/0h7eE; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mu/0h7eE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drWDg2B4Mz2yHD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 14:04:35 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60DK7tCk007064;
	Wed, 14 Jan 2026 03:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4KqCtn
	+SDwrKbeBcHbX4N3OhCwsqhahekXIHHwM8LRI=; b=mu/0h7eE3YVyOSOjaDBXex
	OUZNsHWwe9TT9/A9iUDZLrPkwJW/BzZ4eG2dBt8z1bpurfXm19CP9XX/kksoLvfC
	W3RfQ0HS0mHMJqh9y2pR7BAbYDi12Xf2fwBvdpIHbOLalMxPmEuo7YA5Puz/3hl3
	ENf5rhh2WG9PYTzOhjSjYjQ3KgvG4uapRwnoBpjmYhMVjlB/3V3XPj/E9ofLzB4D
	E+lew8wgev7XyUlZazLci+7VnUEB0xD6xYIBcwsWYH29QVWo46/wICxd0Cf37ZWz
	to5qClbhgO/QOTsXeGhjANng4sHO2rlTozJsrE9FvNIPjQVsCi6wGuFkgwjX9RuQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkeepyg97-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 03:04:24 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60E34Oft004868;
	Wed, 14 Jan 2026 03:04:24 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkeepyg95-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 03:04:24 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60DNNAor030134;
	Wed, 14 Jan 2026 03:04:23 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3ajqqpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 03:04:23 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60E34J3c59703628
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jan 2026 03:04:19 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AFB7320043;
	Wed, 14 Jan 2026 03:04:19 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B334820040;
	Wed, 14 Jan 2026 03:04:16 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.124.217.241])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Jan 2026 03:04:16 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>, maz@kernel.org,
        gautam@linux.ibm.com, Gregory Joyce <gjoyce@ibm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Christophe Leroy <chleroy@kernel.org>, Nam Cao <namcao@linutronix.de>
Cc: Nilay Shroff <nilay@linux.ibm.com>, stable@vger.kernel.org
Subject: Re: [PATCH v2] powerpc/pseries: Fix MSI-X allocation failure when quota is exceeded
Date: Wed, 14 Jan 2026 08:34:15 +0530
Message-ID: <176835971843.41689.3679572113994089423.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260107100230.1466093-1-namcao@linutronix.de>
References: <20260107100230.1466093-1-namcao@linutronix.de>
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
X-Authority-Analysis: v=2.4 cv=DI6CIiNb c=1 sm=1 tr=0 ts=696707b9 cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=3no1HVO7gT1U54ZrpjAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: fcWEWGJzJQQQYEuA7IKMk5Smcd0SNerP
X-Proofpoint-ORIG-GUID: pkTF3mV4hlz7yPwZKi04w1SCmhSa8QlD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAxOSBTYWx0ZWRfX1lsXcy3CGGna
 GPAoOJoWvHOkRpZpovQ/6dhgPpwV36PYJ786/i0q2HUPfMYZsnW05TVUBeLmLn6ee+Ddr6rucKx
 HNbZ+GNBrREU/jI4U1TW+QJ7s+IUmgLd5aT7CXQPIy1hOqixJBc+s7AnTRO0VAqsJLxZ8Riq1kG
 pxcFAy3egTijoMUZ3BhCMn4NZBaeemmkKnnI0urX5bOtOd8A804GjA+9j2pewurXb5UjiKnRxKK
 Y2k5n+2+lt5jqdE5pooFePiNFRRVcBvBQBOnfcRDPFeHoMzns9F6tDJ0W+GkNqkDNflHQgQtf/W
 A0V9GLrgkZRf0anPwpHt2KZtrfX9BOKYittwCwN1dsL7RYMu4PkMLVig96abokQVVewvYz7vO3x
 JaUXqfxUhfFEkwqsuZvJHcTsfTpRDis/swkyet1QYnmBbk2qIVa1uu6j/FCVp/uMbYTsoTn7n9Z
 k7S0xP+4ipeX1Y0dwRg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2512120000
 definitions=main-2601140019
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 07 Jan 2026 10:02:30 +0000, Nam Cao wrote:
> Nilay reported that since commit daaa574aba6f ("powerpc/pseries/msi: Switch
> to msi_create_parent_irq_domain()"), the NVMe driver cannot enable MSI-X
> when the device's MSI-X table size is larger than the firmware's MSI quota
> for the device.
> 
> This is because the commit changes how rtas_prepare_msi_irqs() is called:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: Fix MSI-X allocation failure when quota is exceeded
      https://git.kernel.org/powerpc/c/c0215e2d72debcd9cbc1c002fb012d50a3140387

cheers

