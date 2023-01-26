Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F366B67D866
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 23:32:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2wS45qrxz3fHn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 09:32:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tq2r0x8E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=bgray@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tq2r0x8E;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2wR55zRVz3cKM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 09:31:13 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30QLZhNa009773;
	Thu, 26 Jan 2023 22:31:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=mUds/+8fPOM/1rZ84z6wvKu/PsJuT7Vg8fjljDEodlg=;
 b=tq2r0x8EQpi2YSHWLoo7+ObPZzy8fOPlBBYqwltTrKU2JCm7wDYXIUEKDh+wdZ+YH6Yy
 TQr8P1XGGnYxfp+MBDw14UebKdpM3Lo61mCcizEdv91CQ59adWOtj2I1NHggZ45ckQFB
 7n5PR0JUUDlWlynOb2M4rEJL+3/oOinQibFFZC6VdVJ0NYCLyUn0pxzPvl1YNsc4PNCg
 diOXo5gtQTIgiS1lYRZ1sfbfZSj4DPuUv0PB3py4SAbQVb1pm/5bklCjQnHM4sDDwfWC
 EzsBbFd5F6g1peVeD3yoNsB3mrtN7UNYJdYT7YadkEUr6dBuV7xZai0PEdYkp3D0oZCs hA== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nbyynawup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jan 2023 22:31:07 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30Q2KL2K027371;
	Thu, 26 Jan 2023 22:31:05 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma04fra.de.ibm.com (PPS) with ESMTPS id 3n87p6cwgf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Jan 2023 22:31:05 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30QMV2wZ50856432
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 26 Jan 2023 22:31:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A7F8A20040;
	Thu, 26 Jan 2023 22:31:02 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BC2A20043;
	Thu, 26 Jan 2023 22:31:02 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 26 Jan 2023 22:31:02 +0000 (GMT)
Received: from li-0d7fa1cc-2c9d-11b2-a85c-aed20764436d.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9585360112;
	Fri, 27 Jan 2023 09:30:59 +1100 (AEDT)
Message-ID: <0e47ee626fc06957a51c4535f1cddcf7c57836e3.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/tlb: Remove BUILD_BUG for book3s/32/tlbflush.h
 local_flush_tlb_page_psize
From: Benjamin Gray <bgray@linux.ibm.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org"
	 <linuxppc-dev@lists.ozlabs.org>
Date: Fri, 27 Jan 2023 09:30:59 +1100
In-Reply-To: <ffcd0097-b366-b98c-9853-1d10d78a5666@csgroup.eu>
References: <20230124215424.9068-1-bgray@linux.ibm.com>
	 <ffcd0097-b366-b98c-9853-1d10d78a5666@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.3 (3.46.3-1.fc37) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2DWdf82gubOGUoCjDuoOJn7_thp0oGGM
X-Proofpoint-GUID: 2DWdf82gubOGUoCjDuoOJn7_thp0oGGM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-26_09,2023-01-26_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 malwarescore=0 phishscore=0 bulkscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 suspectscore=0 mlxscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2301260211
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-01-25 at 09:43 +0000, Christophe Leroy wrote:

> By the way, are you should the problem is really BUILD_BUG() ?
> Looking=20
> at your patch I would think that the problem is because it is "static
> inline". Have you tried 'static __always_inline' instead ?

I did not try it, so I just did but it doesn't make a difference.

Looking further, the failing config also enabled
CONFIG_JUMP_LABEL_FEATURE_CHECK_DEBUG, which causes the
mmu_has_feature(MMU_FTR_TYPE_RADIX) call of radix_enabled() to be non-
trivial. It must check static_key_initialized, and falls back to
early_mmu_has_feature if it triggers. Clang apparently can't see that
early_mmu_has_feature will also always return false for Radix, so
doesn't see that everything guarded by radix_enabled() is dead code. I
suppose it's complicated by the fact it still has to run
mmu_has_feature for the assertion side effect despite the return value
being knowable at compile time.

So because of this weird interaction, the following should (and does)
also prevent the compilation error by making the radix_enabled() return
value more obvious to the compiler in the case where Radix is not
implemented. (I've put the constant second here so the early usage
assertion still runs).

diff --git a/arch/powerpc/include/asm/mmu.h
b/arch/powerpc/include/asm/mmu.h
index 94b981152667..3592ff9a522b 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -327,7 +327,7 @@ static inline void assert_pte_locked(struct
mm_struct *mm, unsigned long addr)
=20
 static __always_inline bool radix_enabled(void)
 {
-       return mmu_has_feature(MMU_FTR_TYPE_RADIX);
+       return mmu_has_feature(MMU_FTR_TYPE_RADIX) &&
IS_ENABLED(CONFIG_PPC_RADIX_MMU);
 }
=20
 static __always_inline bool early_radix_enabled(void)
