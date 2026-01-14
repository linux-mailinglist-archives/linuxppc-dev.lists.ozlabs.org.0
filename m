Return-Path: <linuxppc-dev+bounces-15675-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 498D3D1C32A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 04:04:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drWDn6jnLz2yHD;
	Wed, 14 Jan 2026 14:04:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768359881;
	cv=none; b=AtPRjAp07ZIXRPqpdZ55fUpf6+HU//4Yzo8+K53ExZz5sKZi3hpPKLjrco81rdU847lZlVqRrP6YEtcW4UF0eqGHZkFA2vZOkPhBzSbZCTkncHKClSR1jFlXz0mC49rqkXFP2a8IqzhKR2MM5Ci/WH0/sF9BiTZpn0tiheeaxUaRhRp3MO0j8PikPqqQ8BWehIqGK4aTKdvhT7ZR0Rp/kEt4PG8kunzsuuUABwE+QRSmTol3R6gRHiUPmS5gzQ76Ml/BW8TDGn19Ezqe4ypZCHDRdGXrfW2IWWjWBzhT7Sz0wiH3M0jtgwFR413kpHwGydvkQjvawc4N4M1nhmgvjg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768359881; c=relaxed/relaxed;
	bh=6Mkc538523x9TyReil5xA6Bw0YDyF5QSLBtcZKU34Q0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FQA7BpU98hrcA0IykKWyYLwxSw7deSCxbe3ULU0MPGC6xJm4ZlLI+rCWKKFbndgvj0sFQLqlm9FwszuevXpeD0rYywsrgcgwHij2UKqi1YZitoxOm5Yd9nbY+TYoCJSAxHSlL3yLSNZcrTwoD9LALivfi/P4I1iSSGXK4J5us66Tmkx3+C8Olh+TjEA97rXaTO0167Xs81TCf5YvC7zn7aiyzdIkL8em3BSNb+MOqQIwryVffrUE15VqiTIxM6HUyyxh9p5Ookp4Rlk1VKvS/qPC+Xx2PN8qTeYAafYcCNMTunC5oSvyMVd/eIAZ2lyfSkt87OqZlJHogs59hCm2ww==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RJ6zCGjr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RJ6zCGjr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drWDm6fvWz2yFq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 14:04:40 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60DGm9oo013987;
	Wed, 14 Jan 2026 03:04:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=6Mkc53
	8523x9TyReil5xA6Bw0YDyF5QSLBtcZKU34Q0=; b=RJ6zCGjr5BfWR2WNQ9gODO
	msmEehMWGPVO8UV128UWaQaXm2MVcIMSuo+a5qvhHu6F4UH/sSyQ4cTKJhDbJJ3t
	HyHUYPP8EJQ13nov24oT+E5VWlZnmOY2WRsh/R3+SY6ABTlRjaiXhAw2eqTdWGUx
	rN7NlHfg28m64sXmt0viJ+6GHhvCIY1aloPXrHZAdNAHTG2gRprEEhJbRWBxAac0
	yX5yWn2EVH1+g+V1ZykvAZl85qMV9B4e8xA+++15IT3nmHiV/2KuDvq+4iKUpyef
	aJ0pLd3J2JRFG1DhSbIsfm92VDATXXqz6vB9rA/GGknwA/JTcs/77jk2s6TbmzlQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkd6e76gj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 03:04:29 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60E2tK1F003512;
	Wed, 14 Jan 2026 03:04:29 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bkd6e76gf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 03:04:28 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60DN2oN2030126;
	Wed, 14 Jan 2026 03:04:28 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bm3ajqqq6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Jan 2026 03:04:28 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60E34OeA28901714
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Jan 2026 03:04:24 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6585420049;
	Wed, 14 Jan 2026 03:04:24 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2167820040;
	Wed, 14 Jan 2026 03:04:21 +0000 (GMT)
Received: from Linuxdev.ibmuc.com (unknown [9.124.217.241])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 14 Jan 2026 03:04:20 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: mahesh@linux.ibm.com, oohall@gmail.com, mpe@ellerman.id.au,
        npiggin@gmail.com, Christophe Leroy <chleroy@kernel.org>,
        Narayana Murty N <nnmlinux@linux.ibm.com>
Cc: bhelgaas@google.com, tpearson@raptorengineering.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        vaibhav@linux.ibm.com, sbhat@linux.ibm.com, ganeshgr@linux.ibm.com
Subject: Re: [PATCH v2 1/1] powerpc/eeh: fix recursive pci_lock_rescan_remove locking in EEH event handling
Date: Wed, 14 Jan 2026 08:34:20 +0530
Message-ID: <176835971846.41689.7422242896755052198.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251210142559.8874-1-nnmlinux@linux.ibm.com>
References: <20251210142559.8874-1-nnmlinux@linux.ibm.com>
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
X-Proofpoint-GUID: NAa5tDa91Kdz4wke-TWEn1yzkmO0oua7
X-Authority-Analysis: v=2.4 cv=LLxrgZW9 c=1 sm=1 tr=0 ts=696707bd cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=dQPHt5QSkiOP-JdZhdQA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE0MDAxOSBTYWx0ZWRfXxf/TfS2MtWSb
 aoEyKVURsyGMqTVElXvs2ZbjPZ7Q9myt9u6gBFLH5+LNVKGSzlHUgcvuifgOMLIH4I+9kWs/l+P
 TC1/yLwiEVWytG10rZAExOeTr+1QgsVvi+fQ4k312DKpp3BJVlks/VYZ6NP2TVDCrkx/P/KIAlh
 MKO4CIWDHG4a3g6j/+KQQ0+hNH7nCbZ3bKcR5Kk416XB9nAI0/6NZFpjtE1OeNkACI/JVO9q4QS
 BkUfOzrT90vjvIF0+M0LpNPvGjVi7w7LFm+dA5+t7uIlPO+TS2ksfICQLlPA+GsludDZI0AWVo6
 xl8Ff1eGl379yy2FuoBMG/puBX73cbMMzlAsMRXbDlO1nHL4u8IurJ6puk0Y4NHYxEF0tBZ2dsT
 SEKCJx3xyG0Q84Ns/gc/c5vPjxzFftADKWjw7df9FszsI8zU07LIMehNbf/U1i9ktcENmWPuUOu
 eSyLpS66gtqF4qWws6A==
X-Proofpoint-ORIG-GUID: mKa2NkiaAbKPMVmLcyrTNMLzquUwIvo5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-14_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 clxscore=1011 spamscore=0 impostorscore=0
 malwarescore=0 phishscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601140019
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 10 Dec 2025 08:25:59 -0600, Narayana Murty N wrote:
> The recent commit 1010b4c012b0 ("powerpc/eeh: Make EEH driver device
> hotplug safe") restructured the EEH driver to improve synchronization
> with the PCI hotplug layer.
> 
> However, it inadvertently moved pci_lock_rescan_remove() outside its
> intended scope in eeh_handle_normal_event(), leading to broken PCI
> error reporting and improper EEH event triggering. Specifically,
> eeh_handle_normal_event() acquired pci_lock_rescan_remove() before
> calling eeh_pe_bus_get(), but eeh_pe_bus_get() itself attempts to
> acquire the same lock internally, causing nested locking and disrupting
> normal EEH event handling paths.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/eeh: fix recursive pci_lock_rescan_remove locking in EEH event handling
      https://git.kernel.org/powerpc/c/815a8d2feb5615ae7f0b5befd206af0b0160614c

cheers

