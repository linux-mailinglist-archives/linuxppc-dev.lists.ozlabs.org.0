Return-Path: <linuxppc-dev+bounces-7298-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 807E4A6D007
	for <lists+linuxppc-dev@lfdr.de>; Sun, 23 Mar 2025 17:36:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLMJY26sDz2yfx;
	Mon, 24 Mar 2025 03:36:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742747789;
	cv=none; b=XEUZ0GxUqzoPrSchMo+wKkgzHdFNK0Q3qmhyTglhiLL/oAcZu1I3XmEiKJvuSYWOuuQW+cKigQzfyv5UD7S6Ahty+xFvxMisgCR4tkFFp7EgVPhqwcSTyn14O/DFfXccxRk0MZS8xJklmQwKUU+MWQXzUKLOAY9t8K/ADIi/jNAl663x63HZaXcIETG3i9yjwOmBJEa1cJhMfcB2V6kJYEJ5nHG3Wet0gj2Yp6SGtd4uXnE7TihvitIEIbayqvoQH6vcFGEGkCVaEBbaGW2lOc0x+9XIX7Ly+WOjEJI8BBe+MaL6sjV+3VVYjM9+uCokgMrEIJBth5S1pm6skWBcyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742747789; c=relaxed/relaxed;
	bh=zYFClfgkO9qdXVkM/ZQpyp/wziIEGY38SaM5CX73tds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ShlAHCkaVckl0T6K0VPRKXiSXqIeas/3wv2Z2Fu0QqZGSepRFuiTFZzpfnzZ0IB3c91qD928tFO3vZfW+MDOq6A/OIf0DnHHPKkWtyvUSZt+ZJcda4RQa9/wzNqjrDALDJScSb/Yn40qADCHcnyWVKGbtz3aJUEvcScQImjPjajKLG2Kdpp4KEGvkM6fjBf1zxDcxHKS2481cxXMYD0autgw6oyjguydt3zzu88scD/b60cmUHjk50AcHI9OsJPOpBO4uYUkJCC8mc8PGFiChuuSDwW4KmnsoliFP6eeBZZA7dJio/QWGY3Ie3lqgSheiVlRETJF41lJo1SdYgka2g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hWQnJr1D; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hWQnJr1D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=misanjum@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLMJW75Mwz2ydw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Mar 2025 03:36:27 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52NEo12C003437;
	Sun, 23 Mar 2025 16:36:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=zYFClfgkO9qdXVkM/ZQpyp/wziIE
	GY38SaM5CX73tds=; b=hWQnJr1D/MfgNFGt7X6s3au/37YVKHxiqHzqRrKV6/zE
	7iMaeQyc3g6B/fOWDiry6yDY5swoUm+XnVLwulcq8FMyzM7fSNOoCb+8xM2DaHtW
	yWd4a44dNgYZTtcljwY+cQjeltiH9IS75v53/QPbMw+sh+0e2jl8wBGnPIYWJIJo
	7R5QgmRwr0vVnmYgUzI6PtiUaeSr/5cLgPUQX+J1ebE8xHB4CY6dTXzp02SrqcPG
	jZXtyZbTmQB+goIEozcxYbiLvb+o+Jncp12AAoQsTMcnk8XM9aTP0EnfhmPJXyY1
	dzLwRDiutkNTZepZTg3e6PNQo/TvDFLKT4xx/z92ZQ==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45j4dyjth2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 16:36:14 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52NGaDqh004125;
	Sun, 23 Mar 2025 16:36:13 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45j4dyjth0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 16:36:13 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52NCUfca012245;
	Sun, 23 Mar 2025 16:36:13 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 45j91ktcym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 23 Mar 2025 16:36:13 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52NGa9S853019014
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 23 Mar 2025 16:36:09 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 20B0320043;
	Sun, 23 Mar 2025 16:36:09 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C8EF920040;
	Sun, 23 Mar 2025 16:36:07 +0000 (GMT)
Received: from ltcden6-lp1.aus.stglabs.ibm.com (unknown [9.3.101.155])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Sun, 23 Mar 2025 16:36:07 +0000 (GMT)
From: Misbah Anjum N <misanjum@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/1] arch/powerpc: Remove redundant typedef for bool
Date: Sun, 23 Mar 2025 11:36:06 -0500
Message-ID: <20250323163607.537270-1-misanjum@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KvBq6swmhGa7brEMdTUFbP8eZo2iR_Q3
X-Proofpoint-ORIG-GUID: K7H55Wf9TYd2tTWZVq_JfCMskNPP7kLA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-23_08,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 mlxlogscore=701 bulkscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503230115
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

I noticed that a patch addressing the same issue has been proposed by
Michal Suchanek:
https://lore.kernel.org/linuxppc-dev/Z86liwlwP5WvrEkw@kitsune.suse.cz/T/#t

The existing patch addresses the compilation error by modifying the Makefile
to use `gnu11` with `BOOTTARGETFLAGS`. This is a practical approach to avoid
the error in the short term.

This patch builds on that work by providing a long-term solution that ensures
compatibility with C23 while maintaining backward compatibility. Specifically:
    - It uses `__STDC_VERSION__` to conditionally define the `bool` typedef only
    for pre-C23 standards.
    - It ensures that the code is future-proof and ready for upcoming C23 standards,
    where `bool`, `true`, and `false` are reserved keywords.
    - It avoids reliance on compiler-specific flags, making the code more portable
    and standards-compliant.

Changlog:
    - Adding version check via __STDC_VERSION__
    - If  __STDC_VERSION__ < C23, 'typedef int bool' is defined as usual
    - If __STDC_VERSION__ >= C23, the typedef redundancy is removed

The patch has been tested with:
    - gcc (GCC) 15.0.1 20250228 (Red Hat 15.0.1-0)
    - gcc (GCC) 14.2.1 20250110 (Red Hat 14.2.1-7)

Thanks,
Misbah Anjum N


Misbah Anjum N (1):
  arch/powerpc: Remove redundant typedef for bool

 arch/powerpc/boot/types.h | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.49.0


