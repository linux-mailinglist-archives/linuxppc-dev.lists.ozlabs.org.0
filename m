Return-Path: <linuxppc-dev+bounces-4553-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19F6E9FF38A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jan 2025 10:08:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YNPCS5fVpz300V;
	Wed,  1 Jan 2025 20:08:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735722532;
	cv=none; b=A35jGb1LieWW0VlEfe3yJ+azPJWhOeK3uhzgtCT9z5v/CIkixSVNBWr+XYBE2qM2C7mAEUL/nPljuh5fBrtnp/OxlFjYiS19EyRYa8stCrXzOCgDvaPMnYaZKz2DFMNx07vs5ie4KrMlqg0zE1gmT/8BzCTbPcmTCcgchzUixidvWK5rQDAxotXGu9X7/s5IhfLYRX2MHRIujbdaEsew4NLsQ24fxetnek/odY9Qr3SOzRJpjH+ylUm0zY1jA6UQYTENqQZnRzWi3Y40jYA7XiOixi57OVGoWSnFXhozZdKY5gff2dOyRU3FF2LJHWTB30kleAwc+YrleHv0vXNj6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735722532; c=relaxed/relaxed;
	bh=QcFGBT60J2BnHqoSAWqAfZr/e/LBCNE0i3EAZAjgk/o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ow13fIlX2kmHtWpJUmMYWg3gAvjL1bA1lEx+2x2U0teiG6seL8yOcM/8O7cA9AWSrkVLfRLLu7P/366ZUjm5pvhe+GT1aYJzfoYKGlbFsR+4ncRhg3/N2uU6xjb+lUx5gz6LikMNME9Keg/3h3wmwToQWb6eVm/ypquO524oxJEJO1UbWBudyOOWAyZ7SxkSZAVm/ZfgNabNheAtbW8YG/Ni3OYLAD6vLU4wB9kz14rvaqwqxzJx2c0fBSbhOQ44gLBogR8mD7VR8joCs5SzaYqaJ/xhPGJXkD5TVU8NPySBYZPzLydSkQXGyXXSEWFcTP/C5tA8GO9gbxUYU3Um8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MOlIL5cR; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MOlIL5cR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YNPCS0lwfz2yVG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jan 2025 20:08:51 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5013qhct029755;
	Wed, 1 Jan 2025 09:08:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=QcFGBT
	60J2BnHqoSAWqAfZr/e/LBCNE0i3EAZAjgk/o=; b=MOlIL5cR0sBLd3yo5hVyZY
	ntu7y8kQ9sleErGmvLLzEDV+6mwWF8P/QzDizbR7oHMnYnx0uabfWPqrA0BiLgXo
	kHBgR3jNHg0CEyQaXsXskO8Tjd05RpoJVyph/t7fhgABAX3kLucv3o4A7xQFy+uf
	yB30lPsMPwGm56k/H+GbASmVuHH7Rd0nfUksPi926ijMsMvPQEd7V1IITivKU25r
	NwHWkpSUNE5r9juRyAU7Bf8iu4ut2YAiiWusz9MUc2G/GIJClAjNEimlDbxroZ/J
	rEp63k+y8ye/obK3AwXQdaUJg42oAMpsbDI46MhFs2JS6a0e4egL/ZjXlPVqBiuA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vx6hrry5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:34 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50196AWt032244;
	Wed, 1 Jan 2025 09:08:34 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43vx6hrry2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:34 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5016YM0w016661;
	Wed, 1 Jan 2025 09:08:33 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43tw5kdj1c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 01 Jan 2025 09:08:33 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50198V0A26870514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 1 Jan 2025 09:08:31 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1B40020040;
	Wed,  1 Jan 2025 09:08:31 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EA8F72004B;
	Wed,  1 Jan 2025 09:08:27 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.115.214])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed,  1 Jan 2025 09:08:27 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/vdso: Mark the vDSO code read-only after init
Date: Wed,  1 Jan 2025 14:38:25 +0530
Message-ID: <173572211262.1875638.3408990823614762884.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <e9892d288b646cbdfeef0b2b73edbaf6d3c6cabe.1734174500.git.christophe.leroy@csgroup.eu>
References: <e9892d288b646cbdfeef0b2b73edbaf6d3c6cabe.1734174500.git.christophe.leroy@csgroup.eu>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rUX-XwAcNjlfe8OnPFIR64SOv27CUfQY
X-Proofpoint-GUID: 19SN-rRmiIgFTMOdB5KVLclO22FSH2iK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=993 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501010077
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sat, 14 Dec 2024 12:09:31 +0100, Christophe Leroy wrote:
> VDSO text is fixed-up during init so it can't be const,
> but it can be read-only after init.
> 
> Do the same as x86 in commit 018ef8dcf3de ("x86/vdso: Mark the vDSO
> code read-only after init") and arm in commit 11bf9b865898 ("ARM/vdso:
> Mark the vDSO code read-only after init"), move it into
> ro_after_init section.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/vdso: Mark the vDSO code read-only after init
      https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/commit/?h=next&id=9fa9712644e04c4fd4de7e2d999edde3c9316823 

Thanks

