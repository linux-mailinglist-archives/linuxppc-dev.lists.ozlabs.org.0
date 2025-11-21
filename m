Return-Path: <linuxppc-dev+bounces-14388-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BC0C7713B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 03:54:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCKZP35mcz30TY;
	Fri, 21 Nov 2025 13:54:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763693693;
	cv=none; b=HWJhuVguQSdUGJ0Ib0ltTf1kxpGYg8kWxq6eRkPipJzkqU/EQEIA0ggwMLDfhgdv9AY5gFUG8DH1hAQzCM6Ufjud5KpLqbHrEFd+GuSN0i2PyyP75LzV2ndYIksWgGkj0XnqzbjWQZTklynAN9jwvSFTj4o3jTZh8ZLruAyDm+n8K6xWxz3+Hc7sgUmqDdoipRpsJk09mTy/mea2qZ+vUYD76vM76zI8ZnkWsGzs9Mdqs7Pst2M2Ny8jp3FATfc3vOeCLBLMUagvEYJT43NzsrNzzCRgbFohi4EB/uVntAnNi7CyxPq4c6nGhM2fiK5SYalFyiwxPH47dE+CKWq1aw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763693693; c=relaxed/relaxed;
	bh=H5tZ2/Lm/gwCoVyrTlSZTq69Ul+D19GqVTSkmWCtWRE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cBzYlHiWVAEhn7bvs1p/4B3O2d8o6jF9xGQjYB00JRsIOkBJCbc1WrjgCQwD4VFI8AMDNGkqFooqy+H9SGv0XIV6A+1OhxhAZQBjjuF9HKd2lXU0llzAg71wnDqXuXpqQNFksdt1P3wbjvGAmxflyh4q+89Z6SgUR359Wa3v6DU+u/YDB+leiqRXYqL+uIRN/eYQgO3k7n0mvBJcKipUFOWe3EjSgE2c2ix85SM5+59Pcfjyq5SPZ1qOP4L/IVAMUnK197hHp68pV1fdd6CyYTayAgX0IWT0uEtAb5UHiEIbi0Lf0Ii+EqlJFbTR8NjLfVMQf652XdExZQ01we4h0g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e6w9pPUK; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=e6w9pPUK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCKZN57Lpz30TM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 13:54:52 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL0n2Nf029035;
	Fri, 21 Nov 2025 02:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=H5tZ2/
	Lm/gwCoVyrTlSZTq69Ul+D19GqVTSkmWCtWRE=; b=e6w9pPUKor/gD+tYE2FTQM
	eV6u09Ne7eBu0Ow+iKyf2J3UIFL90BumHNq+MabfoPBCDdYezt9xSKo/nekVWI4l
	mKo491DQcS2f6w0hJ+wKpzIOg5VLfQG1d5VpZUxWjFmP0jS8PjZwpQR9CCxggkBA
	iRImm6gaJ3kazGiDTuWQDaBNZh/iv7kdD1KSXJGDkCmxjejKlVwE6nm/oIaaPh24
	Z3vbvccgTPFLuvr4aZBL7DUwu8Y7ydWFcUYU4qQhBGAwBSsFCRsf5Dph4kw3qAAG
	QCjjwoKst4GpMZ9xn02JDaC538P40tgGf4T85GQ6kXM+R/WVgyL6D7nzMFo4+Skg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1srtv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 02:54:42 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL2sfrL031888;
	Fri, 21 Nov 2025 02:54:41 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejk1srts-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 02:54:41 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AKNGhge010399;
	Fri, 21 Nov 2025 02:54:40 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3usj5e2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 02:54:40 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL2saOK49414554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 02:54:36 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C398A201EC;
	Fri, 21 Nov 2025 02:54:35 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9E93C201EA;
	Fri, 21 Nov 2025 02:54:33 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:54:33 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>, kexec@lists.infradead.org
Subject: Re: [PATCH v7] powerpc/kdump: Add support for crashkernel CMA reservation
Date: Fri, 21 Nov 2025 08:24:02 +0530
Message-ID: <176369324781.72695.15722637983958584587.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251107080334.708028-1-sourabhjain@linux.ibm.com>
References: <20251107080334.708028-1-sourabhjain@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=C/nkCAP+ c=1 sm=1 tr=0 ts=691fd472 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=FGl_mr9ZrwtVw05MWQUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: JDc77HEW783QNu7Y_CCJUKAi0M4AWlC6
X-Proofpoint-ORIG-GUID: wU6oy4Zd1G1bDYG3hZJsO81U1dpSqrgT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX7CSINEqgEjln
 89blGDgfGy3JrZ5GlK+Q8wKVSzwZ0qfTg+4aBX+soYTy590uQvWMZhkhpLt55KDZQBnQW7LkkCI
 vLJ80IL9SMnFYFZ7Fx8tTk1MT8nz1OdXdIY6b7oE8blR0TSGCVfNxsq04NcVLXCje8oR9lJcLRZ
 ySb42V/NystjGAkLjuC8t/n1aR9cMcUH0B1lxMo+iZvgv62ZBNho1ww6LHYYfh7rp9JoVGz+MwZ
 e6e0yDVjhawEHmLVOESHj6nd0TE7Wf/APOy0DoNiAUQBwF3ynPqnlf8Tu2PuYp7Ty9wNFULFzrw
 auf6F8vhL6RU6D36ZY6PZ+3GYX0f7g5d4GNFOVpb1M4Kq02qvI9ReJVnCs7hCFMTMXSkwCXhNkl
 UN8qCwPG/Z9Jrz1L1H46KTn5Sd5PQQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_01,2025-11-20_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 clxscore=1011 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511150032
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 07 Nov 2025 13:33:34 +0530, Sourabh Jain wrote:
> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> crashkernel= command line option") and commit ab475510e042 ("kdump:
> implement reserve_crashkernel_cma") added CMA support for kdump
> crashkernel reservation.
> 
> Extend crashkernel CMA reservation support to powerpc.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/kdump: Add support for crashkernel CMA reservation
      https://git.kernel.org/powerpc/c/b4a96ab50f368afc2360ff539a20254ca2c9a889

Thanks

