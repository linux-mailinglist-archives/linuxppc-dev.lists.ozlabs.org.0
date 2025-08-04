Return-Path: <linuxppc-dev+bounces-10549-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C80B199FC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 03:46:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwKCC1YcXz30Vs;
	Mon,  4 Aug 2025 11:45:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754271959;
	cv=none; b=oM0vvoXs8jtZuvfrpv2bGDhurPckWwuy3abFGhq0Xkss293VOH7GV2ImmDQk61HF2Yo/UiVQB1v+nu9avRAy0yilML5i8ycpiBBApqgaX5S1XjenSn1zGws6nRK7cuPeKhe0KzgvFhZmGd4EDycIgJ2jiZ9O+s1p4d0YBz4fZDLTKMfG8LZIy9n+1XzmQ7jaodNtkiXXlL5fjf//4WKq+MjT4De5/7HUKv3Rr3iIob1eq/ZeBGgTQjkFRIzwQMFkGmosf+wmDSlb+kyfm9lZs7A5vo0y607mAD2H/GW4kPQeCVwpO2W30uQ3OguU50w6pLrq/s0DUOuk9rzOGhRYWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754271959; c=relaxed/relaxed;
	bh=slPRuwjCZJ/eNkgeU2PZQcqzDuP7uiS2GsJlcfpnEMs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=TlOsmsCeWybVrZEV57p1cUiLR+ncJY8qRWonP4uoCHYX9lomgXVxFLmJ8Zch8J5H1+M6/231AXuJFCak7I23Fg/CGk2ZLvUMniUqI1BPjeyNucBNLq5J87ITMHaWnrZYwa9QzFhjGwt1y/E6xeoP/ZFP3OPSIsr4ARBYgf/okZxrAPDrwaIiXwpSLpOC0l1x9qnF23lbMMDk7FHxEjwzEzYIwiRrng28qx2tmQ5UakZWAhvIN7CF54muZvc8B9oZIn0Mh76LeR5pOPOZbEYKuz7nhyoczoeic3odBwONXfVHwb9VQqwct9zM5UysIdNCPF3hxUfOmOQJ4Ygt+cczcg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fTs3A3us; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fTs3A3us;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwKCB1yy6z30Tf
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Aug 2025 11:45:57 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 573Llbb0020089;
	Mon, 4 Aug 2025 01:45:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=slPRuwjCZJ/eNkgeU2PZQcqzDuP7
	uiS2GsJlcfpnEMs=; b=fTs3A3us1fBs37FLigqRa0lHaLkn89sbEX0/lQ9S5SZ8
	y6Aj/5tpI/8oG6vJdGtYtThKk8uvMAUsLcIJbm+pfaJuQEysCEBA7bhMnPaor9p6
	grGUNJ08DUWpLkhVZRmK1R67JXCz62ZH5D56YHC7bJ5zKG2zIAX0hlIZjtqarKuh
	jV3QODZ6rmowxTL3fn5J+Ci0s19M9QiIfMApfe6jjzKUdOkoqx0HjqqtMAeBlfLR
	y/DlfdoOCrXMe/uP2HsqoWTsoLqdUvcjuiDSoa1JAFsa/T43UW1WBvqkGyCu3sK6
	pLZAT5H+xD8QEEZ/VMoMLsklqQTDWP144iHAUsPzEA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48993p6fqg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 01:45:35 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5741jZFa022530;
	Mon, 4 Aug 2025 01:45:35 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48993p6fq5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 01:45:34 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 573L9M7Q004549;
	Mon, 4 Aug 2025 01:45:34 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 489yq2bb2n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Aug 2025 01:45:34 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5741jXpf32244348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 Aug 2025 01:45:33 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2E6758063;
	Mon,  4 Aug 2025 01:45:33 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C96358056;
	Mon,  4 Aug 2025 01:45:31 +0000 (GMT)
Received: from [9.124.211.172] (unknown [9.124.211.172])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  4 Aug 2025 01:45:30 +0000 (GMT)
Message-ID: <9c2b1303-bc28-41c3-b87b-e8640960fcd1@linux.ibm.com>
Date: Mon, 4 Aug 2025 07:15:29 +0530
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
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        puranjay@kernel.org, tpearson@raptorengineering.com,
        vishistriker@gmail.com, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
From: Madhavan Srinivasan <maddy@linux.ibm.com>
Subject: [GIT PULL] Please pull powerpc/linux.git powerpc-6.17-2 tag
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8a-yIwtNX14tobdc_wLSV4WDzIde4U69
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=689010bf cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=MLdSzP9YufQmr4hYxv0A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: gNVilf6q4Gnx4VRA-ha8frpLZRDCAwno
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA0MDAwNiBTYWx0ZWRfX7WwGxop9Ka9T
 RnBKRpSMYBbVlwnCSYPI4kSts+CzLyNseaLfOMdPJ8cqv/lvpuReHdaCwx6tCQ/qgiWKnXq+v3p
 jEEk0qO9fyJXsyBdBiNsrE9lC9HFpCOeGZ86ExKh5KPdjF4Vj4DZwTrbkA4LtVW8K8RSnqxHGcA
 x6pxK0ymQxP+4KTRdFE/40StJL/duH5WjdWeOHi+KVi7/qsZpxW4HEHQnnYGRGWM/+i0u0L427S
 0u/NbNZYx1iiY/a5+E08hoUvd/OtJc2SiMKBqTB+Q8+EIpmUEOj3ZueDoo94tE2ts80UD6S2uCL
 i3YM+5MwXvLOjeU53xmFVHnH7+R85+xWkZjZx8GynN97M0RNSjTKAJeAJdwYs4fCxaAWcseOXCQ
 Mf7FKEeXa83crBSljVezRkiwJ0UgWMtw/C1Kb8Z0qOuYbPBTn4G2hCci0momGuEuzJtUUws4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_07,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015
 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2508040006
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA512

Hi Linus,

Please pull some more powerpc updates for 6.17.

When you merge this, there will be a duplicate entry for "htm" in Documentation/arch/powerpc/index.rst.
If you could please remove one of them, that would prevent a warning in the docs build.

The PCI hotplug patches were applied by Bjorn to his tree and he asked me to cherry pick them
from there, which is why they have his signed-off-by.

Thanks

The following changes since commit da30705c4621fc82d68483f114f5a395a5f472d2:

  arch/powerpc: Remove .interp section in vmlinux (2025-07-22 14:21:19 +0530)

are available in the git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.17-2

for you to fetch changes up to cf2a6de32cabbf84a889e24a9ee7c51dee4a1f70:

  powerpc64/bpf: Add jit support for load_acquire and store_release (2025-07-28 08:13:35 +0530)

- ------------------------------------------------------------------
powerpc fixes for 6.17 #2

 - Fixes for several issues in the powernv PCI hotplug path
 - Fix htmldoc generation for htm.rst in toctree
 - Add jit support for load_acquire and store_release in ppc64 bpf jit

Thanks to: Bjorn Helgaas, Hari Bathini, Puranjay Mohan, Saket Kumar Bhaskar,
Shawn Anastasio, Timothy Pearson, Vishal Parmar

- ------------------------------------------------------------------
Puranjay Mohan (1):
      powerpc64/bpf: Add jit support for load_acquire and store_release

Timothy Pearson (6):
      PCI: pnv_php: Clean up allocated IRQs on unplug
      PCI: pnv_php: Work around switches with broken presence detection
      powerpc/eeh: Export eeh_unfreeze_pe()
      powerpc/eeh: Make EEH driver device hotplug safe
      PCI: pnv_php: Fix surprise plug detection and recovery
      PCI: pnv_php: Enable third attention indicator state

Vishal Parmar (1):
      docs: powerpc: add htm.rst to toctree


 Documentation/arch/powerpc/index.rst         |   1 +
 arch/powerpc/include/asm/ppc-opcode.h        |   1 +
 arch/powerpc/kernel/eeh.c                    |   1 +
 arch/powerpc/kernel/eeh_driver.c             |  48 ++--
 arch/powerpc/kernel/eeh_pe.c                 |  10 +-
 arch/powerpc/kernel/pci-hotplug.c            |   3 +
 arch/powerpc/net/bpf_jit_comp64.c            |  82 +++++++
 drivers/pci/hotplug/pnv_php.c                | 248 ++++++++++++++++++--
 tools/testing/selftests/bpf/progs/bpf_misc.h |   3 +-
 9 files changed, 353 insertions(+), 44 deletions(-)
-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEqX2DNAOgU8sBX3pRpnEsdPSHZJQFAmiQECsACgkQpnEsdPSH
ZJQsahAAjibWx9iFZN1Fek897IIwok0yJ19P2c0m9qp+Euw/r1iCnWcSVtyjSqbv
81Vy3xhNEC4SFv8zQHmiCV9oN5xnKzGRFlKwk6ofN4hGQ816abSeBbOumm85SikP
Dd09RUv3Ac2zQOkXIqcb1+cjJsM/qpXw/SrAtjGhQc5Yg0En5J5pCEK9ouB5xZIF
QH6s9GksNMuKwwjna25D7w2RJo0FlFrTP/bVDSxf9RwiYWW5nFd3FziX5eGHYkO7
mxfHoSvvkW/Ic8CloWXacc9c1X0/Co5vk21AJjqkym71pjf4kE9BGM16+IghujJp
h/j6SQgvpyBDd8sYoK+Y/h3ZDb4K8iDH8bkccogkMIFV7Ydmm3n+m6ZxAFqTy3WB
1iqCkDCGmVqdkhGMwoZRdPQBii024whKCY8XDNM8StQZUCzqLcvynn0b2shCyNtM
k12CCmRl+YtKOEJIFPZ4s9cCDaCI7jHdyjJpis33+4YmIEn9WqS+sd22wr4WWHmd
JfRGpoCBKk214tXS+YZ+gmWHHA3EXWWJZ+/64IPjaz7lPtzl5GX2m2E+ctqbEfTr
7RwPBt2h2gVxD4SMNck8ajuvCMOEGI1CY5UOeSsBXBRIkrggwWVMKVBy11ptWjJ1
oR6cy+Da6gIzhZV6FguOxfctalBbawqv9/tVnA0IwPXrsy70yYs=
=jmtq
-----END PGP SIGNATURE-----

