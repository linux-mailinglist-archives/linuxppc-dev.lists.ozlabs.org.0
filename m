Return-Path: <linuxppc-dev+bounces-14394-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B26CC77218
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Nov 2025 04:14:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dCL0t5jLVz2yG5;
	Fri, 21 Nov 2025 14:14:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763694862;
	cv=none; b=fu05tH+5u+MZqWv8q637DfVYsXqAVIVZmQiiweCY+uHFxLcx+iV7Xon73dFlZhlyh/NR5NZDkigUYjGnvUUFAYNAsBnSkQCIH6kUkIaVp++wLVgQTbFTS+ALcXaNRT1VBn/EsR9vl6fj8Xyle49tgFo93bvM4sdRojCJG74kkXYNu6B2D5LM5ZnuCwBrZGRrSeRSumwmqmNkpx6kdV+sR6BevxU4wYMQnheWBYJE6dLpw+6qbaS9zKef355RRn96o0SronKN3ynllA8lcS0eD4Gk+umtssEF6Aw7qkst2YArnF2fTqLkjcWw1UzCKrYWWGabV2fdcza0TdOkqNGNZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763694862; c=relaxed/relaxed;
	bh=zahLHRr4riqi1zUQGdH0lnzO97hqdBIsJ3nEqotbKzQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nD6KSaPwikZNTsCGFQvpOq27Z1Mzl+2wuXyA4+rHDT87A7rgjdkd25pR+CMp0B35qHKRJehVQLGNRWxXr9IIDcouwyJBIHe5jZSAI/iebXkd5N8jqpzcxfcLvYY5emT9J73obj5lqxaro/HUhY5N2x26objOcvm0BtLx7Pmljedt74HW5kenkBEH+Jw0FVuTyZy7Kx7zBtlAy/LErHpnBPoItflXoq3oue+3Zl4+Q4mCYBS4KlRbMF6djtRrDxGKF1OXHABpx4jPIamI8UEcX44F/G9fP8yAmAt20vgf8Xs1hPWJH+bNvuANISdIOHmufnFwOE1RTsPEd4qvRflRrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TyVWNFqz; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TyVWNFqz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dCL0s5rXgz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Nov 2025 14:14:21 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL0HekZ012697;
	Fri, 21 Nov 2025 03:14:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=zahLHR
	r4riqi1zUQGdH0lnzO97hqdBIsJ3nEqotbKzQ=; b=TyVWNFqzJJJAdHAkEpcLHn
	M7RIteHwrqpvW1iATZVoYFaZBExszPcdXH1lt/kMHHdjnjLJi4uOMDkXvWaOdzAb
	fpqhQUAn5kKLJcFFq0BQ8WfT3U1oo4p098Kv3IIHOqIiZwTAuqn2ps8c+RMtW8pv
	jedsMiMO4d6vlJ+EBo2pTdvs4JqYCIhRaDWv4f5ZNDLR8LLAgtFIFE/Cs5T9Z3Yg
	Vm318UpD0GmNgrSejXAZSsg25Wg6G7KbheufYdGFEcyQ7/CfYCkdxhLxYAPshIjk
	za3U/TIe07jH+X2JdeJzVKmdth5kiHUHubAYOrS44KwVpDh7K2GnDiG7B/CAIrvg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgx8aj0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:14:11 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AL39G9P010582;
	Fri, 21 Nov 2025 03:14:10 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4aejgx8ahv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:14:10 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AL2MPqn010419;
	Fri, 21 Nov 2025 03:14:10 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4af3usj7xt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Nov 2025 03:14:09 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AL3E8O651642774
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 03:14:08 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 02AAA201FD;
	Fri, 21 Nov 2025 02:53:45 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE331201FC;
	Fri, 21 Nov 2025 02:53:43 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.in.ibm.com (unknown [9.98.111.108])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 21 Nov 2025 02:53:43 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/8xx: Remove specific code from fast_exception_return
Date: Fri, 21 Nov 2025 08:23:08 +0530
Message-ID: <176369324781.72695.12523299833738902821.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <39de3e0f0122b571474b1ba352a2dc3ad8cb71dd.1756304318.git.christophe.leroy@csgroup.eu>
References: <39de3e0f0122b571474b1ba352a2dc3ad8cb71dd.1756304318.git.christophe.leroy@csgroup.eu>
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
X-Proofpoint-GUID: SFHhpVBqm8CHWnqNuMXjQTaVGJXYxsxn
X-Authority-Analysis: v=2.4 cv=YqwChoYX c=1 sm=1 tr=0 ts=691fd903 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=UWDi0W9GykAcyYuS8hgA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: F2e4jqPwk87WBm1DH_lim1jrwXT8j9UK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE1MDAzMiBTYWx0ZWRfX36nbHVGgD6F2
 fgS7VlFOAsN5RPM0WXqhezJG5MlY1eMTkU4LSujcusFiwGu7gto76KOTz8dmcwF58yedTtW6/sd
 528JpSiM596nmSSeIHILoZ8WuVW9jdOzV4R9sO8zvgy0OV7b3+Kwmx2ofedHGJtYZ8fE6RVD2Wu
 2PKzXWBnlRTv4DMMAq4pye1hQ6Uom0JBhAf9OkHpMzNxsI+CQcSfywg512R4poh9eJvRT2vOGjO
 BKVi7MNSuPVLE22aLeTuJV847DqUJzweCkpmkgLq1RglyQVQZJ8z+OQXH8Gr4LOSFIprdjm9ktx
 jDvOkkXZ3UayvULIadQu3Hkcf7B0cx+TbrQy/IZqCYs5l1GjzXdwSmtAxjsU8QuMKRsm04hPEOg
 Hp502RloXTToQiDtZJnNgWKiX3xfAQ==
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

On Wed, 27 Aug 2025 16:18:53 +0200, Christophe Leroy wrote:
> The label 2: in fast_exception_return is a leftover from
> commit b96bae3ae2cb ("powerpc/32: Replace ASM exception exit by C
> exception exit from ppc64"). Once removed, we see that
> fast_exception_return is a standalone function that is called only
> from pieces of assembly dedicated to book3s/32 or booke, never by
> common code or 8xx code.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/8xx: Remove specific code from fast_exception_return
      https://git.kernel.org/powerpc/c/98fa236044ca4f8841107382fb03832101fa7328

Thanks

