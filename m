Return-Path: <linuxppc-dev+bounces-14391-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0FFDC771EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 04:10:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCKwm0kBhz2ySq;
	Fri, 21 Nov 2025 14:10:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763694647;
	cv=none; b=jEWPpwaIX91cHZsazYWT3h25tR4VFR9tbzs+QZBuIK5P09OMBAyFqK9sY5wSdCDDqOV6pNfo5Fq1bvONAhz7+ZvyDDnEvsu6crGz7+M/ZQshBqjappi9zKXSWrbtbgOSQSCXjBSITzQQWkdWM4EVNSQv+FNiPYofokhtUqxsyl/iXkmidYdWWhKhJRiHm9kEkGb+te2iLTOHPP4H5hTD9ZtoarYGPBHihlqwFMLKQ9JFtoRzYSh51BTc30AEdwFJjUvHfW+zSRjnRyKinX20Z1e/arKTkS89DE+ec05zE61reZOeJw+XXdRqn351ksBOir/ZkyIprQQRAjeigIFDSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763694647; c=relaxed/relaxed;
	bh=L8LBsVASEK6d3B8DWHYD8zZqd6pFY43vZXmZj9neDbc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J5TU+oqYAFMA4XnjhXVJ3gTf5DlkRWAZ7F4A5iEGmHKOh0qix005aaM7kPaBR875RqnWFtf4HyAkj8i8XoLjXDWRR5RiCYZSH7SwiR/LeSWnoc4K3RvJiz6VEOnIqMbggGVTdFPPnG9dqd5GGoiKXfSvxicGLucbyxF/Q0cFJ+w0Q7cFqXqZjiFXgpGOQdvnftGNZs7CDBhWcFvhC/JE7stu4uw1CTBoJFyCzcBbID2HqegM1sufu0nzGth4PQgnkKG3VZjqkryJXlfNDBkIEDeku6ewKPPUpRPk92EDLgvrKydRk/AitcgGPmtIOIijzcWAmPmZU+UvM3+TxMbiOw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lzTZWDV0; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lzTZWDV0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCKwj4snYz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 14:10:44 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKMbE3S012683;
	Fri, 21 Nov 2025 03:10:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=L8LBsV
	ASEK6d3B8DWHYD8zZqd6pFY43vZXmZj9neDbc=; b=lzTZWDV0hB+zEbASOkeU9Q
	zpy7gTOVxsgwWUnETPYYZuHAbPauqKzlFsy7OWvr21ZK6oTqdJsS7Ft6kJcG6AZR
	9c2d85fINSdD/q9vwj6gbks8XJh1yozMhwRPfqhxmMVDRhzmqTgkBIb0PSBBJajA
	Blg9AHkevlBMPjnqGXIJMtGT+hMfMHjq2/baDEzSyrVxLr0dKqkgRyBp1JkDKN7c
	6CJtkpg/nTcPgcyxnf4XHsYXp38F9AUy5I37sA4JTL7LHBOJRoJYl1jYFy1eSZ5/
	uWWqH58xViPgdZ5du8wvD//wnRlRQGebTqF8oxlR3CbVxv7n0rJC1sJ2bIBtuwiQ
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgx8a9v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:10:33 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL07BcV005133;
	Fri, 21 Nov 2025 03:10:32 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4af5bkj20y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:10:32 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL3AUnD35324260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 03:10:30 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58043201F2;
	Fri, 21 Nov 2025 02:53:34 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 38D09201EE;
	Fri, 21 Nov 2025 02:53:33 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:53:33 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Ben Collins <bcollins@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kexec: Include kernel-end even without crashkernel
Date: Fri, 21 Nov 2025 08:22:57 +0530
Message-ID: <176369324786.72695.17995365104870702748.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <2025042122-inescapable-mandrill-8a5ff2@boujee-and-buff>
References: <2025042122-inescapable-mandrill-8a5ff2@boujee-and-buff>
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
X-Proofpoint-GUID: p1uunhp21FmS_PbYKjMqZjIuMh-uKCqk
X-Authority-Analysis: v=2.4 cv=YqwChoYX c=1 sm=1 tr=0 ts=691fd829 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=ahfaYFja6yGLwH_dXd4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: p1uunhp21FmS_PbYKjMqZjIuMh-uKCqk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX+V37sisvyIwW
 xqXa17u8OJIG65z8i7HiAEJQASYlmvANE6rM/NClifXd+kmEdPkn6/K/+XvxmQVif9dCtJD/SnO
 BACQoSmQebGRr6onYvlHmFXNq8pNXebrpakDSjcqsfYFoWke+3yNdbRVnmNG2HA6XeFZD+oCpM1
 kxW/pZpfV+6bk1I2Y4b7yCnCoAk7jpSBkZ1sfijISfc9ze+zkKltF5zZOzvywsNpocVjsE0KKG6
 haleAs0tW0X5BXJXuZykWADxPy3u3b1mc0h87iTDSI8K0EeLzbJ9WyGDaliX0qPm3Oes3BUh9Z4
 4slF2938TUDWImS11K0BolLkan5SHV4E6/DSQapeD9IMuO8HMK1c46f9aF2NBIkDpOz/nnHBJnW
 lfAMX/Q35WRdbwvaEYqiCSlcj26abw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 21 Apr 2025 22:36:46 -0400, Ben Collins wrote:
> Certain versions of kexec don't even work without kernel-end being
> added to the device-tree. Add it even if crash-kernel is disabled.
> 
> 

Applied to powerpc/next.

[1/1] kexec: Include kernel-end even without crashkernel
      https://git.kernel.org/powerpc/c/38c64dfe0af12778953846df5f259e913275cfe5

Thanks

