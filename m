Return-Path: <linuxppc-dev+bounces-12786-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA6EABD1597
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 06:02:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clNvv4520z30M0;
	Mon, 13 Oct 2025 15:02:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760328123;
	cv=none; b=TEPeq98FJtH75BVMYGQuFRqIra7gx/rceumEvT8EAQRZQssqXZ0y1A+dKN3WoySudf74M8Epnc9ocfOV+nD8T0MB+clMT/JtN/cUIa7RcBCZDB3VxAtC7kYC+zoNrDN3gLLQeQtDC4PjvJJVbFb9imZl40sexz1FaM3+2F1ND5z3h40UOEkfzM+9BDwpzto3UtLJYMgUjRUPQJj2Fj9RazfziW0R1iQMpWomIPMXVeb2IVbj2BS+3SHhFBQP+vgOhMjRAN0mXWxf59VkhUqiQ/3uLbMsKu68BWCmUSNT1il6zaFHnUbTO7U/dCX6ubYuqSnWT12RTNOUBb2iDiYJCg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760328123; c=relaxed/relaxed;
	bh=zFf4X+S5AYm9vMFCOXAZTHoGQnipWU7aASbF2RURilI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lNOfpeQmCr3D2OZH7vJ3o8MTEGoK7iw2uKzed5JrG6Dh8JhYGAS1LQbjZXHl7iotW9c/wyYrP11gvA997iVekeQUxRWjLHALIz3S5KqZcKHZ+odQIKy+0Gmt3XqNrAWymoQf1AzEHM/yKZ2923zx/gMnA2d+k5SoxP5jMHgZeMdfTHaFhSxhlvJwYrAISFF6gbqDuQ8vb3wh8vD3oRMl0VKLvns9vhbyGrjBfCMkJGyCstrjH9MNu29mZa1sUdiaJ+lJa5nochHTFHQFzKS8Ih6PDsbeSCziJIIgukUQCZ4b/9tQV+vG/sthIWVmhvJz5GjflkPKM0XO6nYye9jptA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=soqAXXct; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=soqAXXct;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clNvq1BGjz2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 15:01:59 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59D2REhd021104;
	Mon, 13 Oct 2025 04:01:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=zFf4X+S5AYm9vMFCO
	XAZTHoGQnipWU7aASbF2RURilI=; b=soqAXXctqINhDTklErHNsOnAg0JdHf5Fb
	9yiA4Ccgkh+fAEc3C5i6obgDoA+zGsBJLN3wsI9N+NPN0pQDkFI2EZ28ttyris9H
	lbDIjKU3fZ2xmCIOrY1qnXu6fh/DLa5bkcfnCls8ayJboCH+rJHJThj0Ps8bsWNu
	r2rskllxVqp6WxPnTQVsAafepzwN0bjZS9LTgU0+WHdFSqT4ALZ/KfLeLcORxQu9
	z0t2/OKs+LDUdklN+wbaiG2nGYWd41lqTOj3pe/hlWr3QHUYTQd9IVktKZ/NsNAL
	QpHvQz3SgT0IUd5jAbeSmoTt+vFrMTRauihyuupE30gGkjvJQCADw==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qey8ex5g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 04:01:54 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59D26aM1003812;
	Mon, 13 Oct 2025 04:01:53 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 49r490usdy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Oct 2025 04:01:53 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59D41pFw31129940
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Oct 2025 04:01:51 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6D5E620125;
	Mon, 13 Oct 2025 04:01:51 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3412D200D8;
	Mon, 13 Oct 2025 04:01:50 +0000 (GMT)
Received: from vishalc-ibm.ibm.com (unknown [9.39.21.93])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 13 Oct 2025 04:01:49 +0000 (GMT)
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: christophe.leroy@csgroup.eu, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arch/powerpc: Remove .interp section in vmlinux
Date: Mon, 13 Oct 2025 09:31:48 +0530
Message-ID: <20251013040148.560439-1-vishalc@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <eeaf8fd6628a75d19872ab31cf7e7179e2baef5e.1751366959.git.christophe.leroy@csgroup.eu>
References: <eeaf8fd6628a75d19872ab31cf7e7179e2baef5e.1751366959.git.christophe.leroy@csgroup.eu>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pETyR0XVF2t6SoMCl3aVmamFlGqcLSiV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxMSBTYWx0ZWRfXwEUQ+m/Qex+7
 U/B51HwVWIWr+NMN8uCrZLMNexcZSP9vKVcnLOlkqwyhKVDJOH9w+AwUTC1sPNl/B8m0AaSFobQ
 ozgEYP0ydcoTk6U4ppdTOoY47ugEs/xEbwAlvuWe1odd82JTYm7aODD+/i95nVTtQU/a5ZZ1jBT
 t5+xi/MNuvVz8BHGcufgrGe8snXAIjOIrIZtuQDx0hF8PD5HQwexC2o3N6CI1ztum5YG8iE2UGi
 w2odTBcHkIp1cA8ERA6DHQsmaVidbdAd9vvO1frgIw1qVSZFhLQgT/a5YadZhmYtPvFqSXyQoUY
 A4hSSkBD2mTF6GthQaYTiTVxRbrQXHX4CJgilQNoRaupuhcQ7zeJELpDtnGoREl2WyMZUaJ7nux
 De/ht6/kT9SpbAixfQ8+CLcwzUE/GA==
X-Proofpoint-GUID: pETyR0XVF2t6SoMCl3aVmamFlGqcLSiV
X-Authority-Analysis: v=2.4 cv=QZ5rf8bv c=1 sm=1 tr=0 ts=68ec79b2 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=x6icFKpwvdMA:10 a=CCpqsmhAAAAA:8 a=sAOM7heRkMNWthvXo-4A:9
 a=ul9cdbp4aOFLsgKbc677:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-13_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110011
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

While debugging a ppc64le QEMU guest on an x86_64 host, I observed GDB crashes
when attempting to attach to the remote target:

(gdb) target remote :1234

Investigation revealed that cross-compiling the Linux kernel for ppc64le on an
x86_64 host using Clang produces a vmlinux binary containing an empty .interp
section. This empty .interp section is responsible for the GDB crashes.

This issue does not occur when:
- Building for ppc64le target using GCC on x86_64 host
- Building for ppc64le target using Clang on ppc64le host  
- Building for ppc64le target using GCC on ppc64le host

For details refer [1]

[1] https://sourceware.org/bugzilla/show_bug.cgi?id=33481

vishalc

