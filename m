Return-Path: <linuxppc-dev+bounces-6941-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED94BA5EA06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 03:55:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZCsYN1zJqz2yPG;
	Thu, 13 Mar 2025 13:55:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741834504;
	cv=none; b=B9+9IKHfdGFV9JIk/IrURKpRTaPTkEN1MQ0CHrqTrWV3FtYV76sh7slnsfGeDH4M30uwKfwWYlPIP0wUoDtPRE10n7mIu6aTZWzQRsnCFDTYuZD83ENx4drJEdsJ9qzNx4gJqQX/dGc7sm5LHv4tiHWMIMcCKYdjm36LngB1Ka4rNvnA+aS3NnU1EG+qEKUJ2IZwskbku3jzAQzHL6e3WpqjLYpjyiuWoVdOXiVcZA1J598E2ml3v8PzAIZZGfhsVesXTtkY1OpWJqIZV1fR7apN6r2fAbojCq3ojtjYfs/E+NbM1alVTmumoRLk1xYXRvR/MdJzua8aeFDl+WVG7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741834504; c=relaxed/relaxed;
	bh=QzUbwZIB4F19T72AKaCGQM/30jhxW1JXzj8DiQnDWoc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=REuxYDRA0wWTGW+3hwH5LZrEtapXOlweLU5O7pLb8TfZbxlxskLfYRWgX0mPaefP4UyiDCT8nWiRkBPbBFGidnOWjjFWDw1IC1Om9bY2NZHTGsrMxfXXINWAR6OFdVz3xC4iqXT27ILnjA/huf6VMH6t+vvXsXEGGjAMaU6DWZQxf6QCSsiZ6iVMUFnog1jBAWweM65rKgLDsbrHMlo+MIlvtOp1509wZxp44KPPr6N4DXozp97Tg6tBCzcafFWEeImv1jzxODM+f/VaS9FQkNVUpHNEUa9amaR4irgn+DDL5gkD6lTO50sn4wsh02r+u0x9WByef99RcHlbQWIE/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=toCLS3F1; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=toCLS3F1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZCsYL1FJdz2yMD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 13:55:01 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52CKdMuS010776;
	Thu, 13 Mar 2025 02:54:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QzUbwZ
	IB4F19T72AKaCGQM/30jhxW1JXzj8DiQnDWoc=; b=toCLS3F1c2VK7uPr8BdLxJ
	F6MTKgHyGbxZJVsVuKazNR8vel0Qlv7RglTPLYYO1nsgEGyAnoa9UpyddJN6/1Vh
	l7Qtw0efh870r8qXauSWW67eXW+vMyW0RQA20ioUX88uatik22Nuurbr93Ayhih0
	jqaSmKJ63brpLkJHuzbC3FgKfc04WZ/EM4xEgHXifXQHjEiQX0dGWeg1Afkq82vL
	jxFHAO7PjhFRvPwhOT67wbprC8FbjphZVIzQ/zU8LBjzO4qLY1LvwU0yaz1z9WvR
	wvWRljR2Jlq6i1f5VCJusy3qbYGcaKv+YnRKSclcox1KmHfjEOZPex/L1Vs/jWeQ
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45bhg098ks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 02:54:46 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52D0uGkg026021;
	Thu, 13 Mar 2025 02:54:46 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atspfhd9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 02:54:46 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52D2siVG19792278
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Mar 2025 02:54:44 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E99420043;
	Thu, 13 Mar 2025 02:54:44 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4F4320040;
	Thu, 13 Mar 2025 02:54:43 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.63.197.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 13 Mar 2025 02:54:43 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (haven.au.ibm.com [9.63.198.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 0DB40602DC;
	Thu, 13 Mar 2025 13:54:40 +1100 (AEDT)
Message-ID: <006ac081cf0e130426bcf0ef777bed346f6df002.camel@linux.ibm.com>
Subject: Re: [PATCH v13 00/11] Support page table check on PowerPC
From: Andrew Donnellan <ajd@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org,
        pasha.tatashin@soleen.com, akpm@linux-foundation.org,
        maddy@linux.ibm.com
Cc: x86@kernel.org, linux-riscv@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        sweettea-kernel@dorminy.me
Date: Thu, 13 Mar 2025 13:54:39 +1100
In-Reply-To: <20250211161404.850215-1-ajd@linux.ibm.com>
References: <20250211161404.850215-1-ajd@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
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
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jFxsMj_j4znHUDzGj8WLKmOskt7bM7Fc
X-Proofpoint-ORIG-GUID: jFxsMj_j4znHUDzGj8WLKmOskt7bM7Fc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_01,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=845 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0
 clxscore=1011 mlxscore=0 phishscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130018
X-Spam-Status: No, score=0.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 2025-02-12 at 03:13 +1100, Andrew Donnellan wrote:
> Support page table check on all PowerPC platforms. This works by
> serialising assignments, reassignments and clears of page table
> entries at each level in order to ensure that anonymous mappings
> have at most one writable consumer, and likewise that file-backed
> mappings are not simultaneously also anonymous mappings.
>=20
> In order to support this infrastructure, a number of stubs must be
> defined for all powerpc platforms. Additionally, seperate
> set_pte_at()
> and set_pte_at_unchecked(), to allow for internal, uninstrumented
> mappings.

Talking to Maddy about this off-list - given that this series touches
on generic code and several architectures, would it be best to take it
through the mm tree rather than powerpc?

--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

