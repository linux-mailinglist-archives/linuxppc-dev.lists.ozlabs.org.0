Return-Path: <linuxppc-dev+bounces-6193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B222A35DE7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 13:53:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvX6905Ypz3blV;
	Fri, 14 Feb 2025 23:53:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739537600;
	cv=none; b=ddVaCRxJoWqjjhGK8eWZTKulVAvxddBI6Lk2TVXSjzmkKjKSYegc7D9lytPiKP15FawINWz3WS0Jb/jOWlMikKhSZPc3FMl07Sp/2U9RX9PbGlmGW1Yiqz+Tq/vmnGH3DOP7J+LTlbmBHPARMTR8SS8iEO2urCYPzFnumUPr8iXz/HsnzKrB3ySn1RNOXsENSI4Wp+Df3Xo4xyz0rB0CZ26PFFcv1uTeLRXw17LirHgaFmGE9Sdnc2UtXrHnQnbTu18IyZPMG1CCljUsrwsVXG2l6mU0xmnbtkTGNqqItHipBkGHEflBjkhmbtAUc7vhMEQhTbxAy5GIQd9aEI5Zyg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739537600; c=relaxed/relaxed;
	bh=084FZHrJeWZnAe524O6+JJ7QWpLJ2qj+2DyhrLodlxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=El418YOjGJHh0Ul9IWxoORmbSI/egE/7+NiBkjCRwAWg0kLpsTpd6gq/A7Bh13tWQBZV5emzLmGzaNulntkM4j7qt93W8kWtSq3Ccwqf1WAZLyXt0PSb1NEle/rq424ba1+FkL6tlEsw/HEcA2/ETPAsIVkV+CqwNOjKj8pms6zum8bC3Gd3LBnpTuMEmByVZljCYERcdg0FgvArUAaLoeW/6F9FbtRWch0A5Vudse/hVMcoHtYOU6KWk3ntRjtD9tUZcLEAB5u4P5RMa5NYHSUAtApR64J5TyNu/WadRMmhBh/lR702aqLC9afgVicr3kRCFqM9FpmOxxaTC0jhpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NCWH8kTn; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NCWH8kTn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvX680SHsz30Gq
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 23:53:19 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51E44kBt015865;
	Fri, 14 Feb 2025 12:53:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=084FZH
	rJeWZnAe524O6+JJ7QWpLJ2qj+2DyhrLodlxg=; b=NCWH8kTnSnWqA07OgpLz/H
	1RsuqI4LCHPvvvbz/s/Tlc4MWJSsMozp2vIkdn1JSAfp8f/hVS5hMztM2cJ5sH5j
	yDgnddPJkVgVNXFzGZFM2PXWZU6tJ0hiJBShvWbPxLX3mNfm9ie8RaRDPmZ844/p
	+dtE6mN4yRu3PwicmVISXO41mb+CcbqGDy7GoEbc9avAkjhdEAmMBXh8bsuJPXbk
	c48G0Mzd4DfcoKRsAAfXpuN9oVMZwHhBoS61j+EbNHNbYEi3gbImR3qyUEuEWo2K
	gh3JFsWm5fFBr+IoB1+Wcw61Aw7+sqFCFTnORm9c47FIS4ypuOchH3HZcQSc/vBg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44skjuwb2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:53:05 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51ECmNuV027128;
	Fri, 14 Feb 2025 12:53:05 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44skjuwb2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:53:05 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51EB0uJm000978;
	Fri, 14 Feb 2025 12:53:04 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44pjknkkxu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:53:04 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51ECr2B445613420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 12:53:02 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0F1B2004B;
	Fri, 14 Feb 2025 12:53:02 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8076E20040;
	Fri, 14 Feb 2025 12:52:58 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.125.185])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Feb 2025 12:52:58 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Naveen N Rao <naveen@kernel.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2] powerpc/64s: Rewrite __real_pte() and __rpte_to_hidx() as static inline
Date: Fri, 14 Feb 2025 18:22:56 +0530
Message-ID: <173953661683.199877.12879518225554351869.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <e0d340a5b7bd478ecbf245d826e6ab2778b74e06.1736706263.git.christophe.leroy@csgroup.eu>
References: <e0d340a5b7bd478ecbf245d826e6ab2778b74e06.1736706263.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-GUID: iL5sVaNme84d1rbWYUcduWt_5cc8FnZX
X-Proofpoint-ORIG-GUID: 4CRNCKnYFycAgIasgkQnY_ijxHom_Agv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 phishscore=0
 mlxlogscore=563 lowpriorityscore=0 mlxscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502140092
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, 12 Jan 2025 19:24:46 +0100, Christophe Leroy wrote:
> Rewrite __real_pte() and __rpte_to_hidx() as static inline in order to
> avoid following warnings/errors when building with 4k page size:
> 
> 	  CC      arch/powerpc/mm/book3s64/hash_tlb.o
> 	arch/powerpc/mm/book3s64/hash_tlb.c: In function 'hpte_need_flush':
> 	arch/powerpc/mm/book3s64/hash_tlb.c:49:16: error: variable 'offset' set but not used [-Werror=unused-but-set-variable]
> 	   49 |         int i, offset;
> 	      |                ^~~~~~
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/64s: Rewrite __real_pte() and __rpte_to_hidx() as static inline
      https://git.kernel.org/powerpc/c/61bcc752d1b81fde3cae454ff20c1d3c359df500

Thanks

