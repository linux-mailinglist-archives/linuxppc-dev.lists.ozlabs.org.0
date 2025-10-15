Return-Path: <linuxppc-dev+bounces-12876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C78DBDC5BF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 05:38:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmcHX43GXz3cdV;
	Wed, 15 Oct 2025 14:38:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760499496;
	cv=none; b=jgwwn0uqHoaaN4M6+IP0lbBYU5AyPwGbitxxQdfKrFhTXmvgEy8yy86RepzraZFPhrryi/pQVCGuQBkjPfVCqSIs8G0sbKeMsnwnHHDkpA9Nw9ad96FscyOWBXlCFLO9PYdZ76T3uo+mguOWfInaNxbQz7Nh07sg6BkYluosAWB8R0EC0+ZaQxo1cvPCZ5qnt8H667J2MQjFSRTL9lLOtssE/D4sQEgCP0xRcnkHimfcSL9poYtvQvFXu7OArZwETpCwq2nU+ZoVdjQXxyWE8OG1p+pBkw+tb4aqLQPMGgNmRnlaa8D3KofxZexUsqvC5ktnc3oh7eW+jkNDSOS1Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760499496; c=relaxed/relaxed;
	bh=JhcohmxMF8CEt4uB5tXm35fRtqDNhHzChbRDG+yKgEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bJ3zHytejzrnADEGKfxjdclC35MNM+Afh+vUtG4X8b14RwRVTXnePVahmc8ON5OohYgMOQyvkY+8fbToA07Yw1PYgv9jWHussZVgo83OYlP4gVfu7Yu5XjfaSGqDZ5eUDaf9aaHIHk+dX/useOyUqsEsH8YfLudbsY3O8cY2hvy+aSDIhcRk2WpcXbUH8oOQw5g9m8e83pPYwGPpm19HO8N8Ap6P8pPO9Xrjc5HpWIx9KjsSYHnPoJFi5NMi+DmIAtBKZvNHEWkHZAjaNuDx6F6O3mpE1+HVYoYsQiZWPRYe+KIkdOucxceYmLJitsaP6IV/tlCWnw+ut/cs1RLKHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c6R36xCe; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=c6R36xCe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=vishalc@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmcHW4c3Tz3cdG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Oct 2025 14:38:15 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59EHlvuK021187;
	Wed, 15 Oct 2025 03:38:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=JhcohmxMF8CEt4uB5tXm35fRtqDNhH
	zChbRDG+yKgEA=; b=c6R36xCelyC067BnkUlWO9WUPasN1rRpy0/oXe6OWcShL1
	7BeHYsikJWfmwSL8AxKl+kkZB0HNO+CoPGOOcLaSFpKIcN2EdCMmY47xhgRCZa7i
	9bcvRfZWvVMRtKFWnybI78tLiAnuk2R4eLc4F+t0JtWWlkPwhRKX021w2HYpKunC
	fFGaiJFWtAWRjHLIDZYjrgaen0awSYPJMP6rIlMERyq/Uv0O8zvlSIxl1Hy2Vn7f
	pzivfhgqNXJsgarfmBTa1WZ4MxP2U37EM9QP5My8OUudr85ZZpdJcGwYa96yfYFB
	ogV08GNV0fW7Z1QCIRW8RrvAFBz7pT7WHcmMeKgQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49qey8t8j4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 03:38:04 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 59EN1jDU018372;
	Wed, 15 Oct 2025 03:38:03 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 49s3rf7vqs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 03:38:03 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 59F3c1p553281032
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Oct 2025 03:38:01 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8BC7B200EB;
	Wed, 15 Oct 2025 03:38:01 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 82CF3200EE;
	Wed, 15 Oct 2025 03:37:58 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.39.24.169])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed, 15 Oct 2025 03:37:58 +0000 (GMT)
Date: Wed, 15 Oct 2025 09:07:54 +0530
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        clang-built-linux@googlegroups.com,
        "llvm@lists.linux.dev" <llvm@lists.linux.dev>
Subject: Re: [PATCH] arch/powerpc: Remove .interp section in vmlinux
Message-ID: <aO8XEhMdT19UOPlp@linux.ibm.com>
References: <eeaf8fd6628a75d19872ab31cf7e7179e2baef5e.1751366959.git.christophe.leroy@csgroup.eu>
 <20251013040148.560439-1-vishalc@linux.ibm.com>
 <2b4a3215-1620-40c9-a00c-ca833ebbb7b6@csgroup.eu>
 <aOypxKMzsLR5tAtv@linux.ibm.com>
 <20251015002154.GA2300901@ax162>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251015002154.GA2300901@ax162>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UlRR5dnw_0Bhrnv_jkvBzNgkZQJE8_KD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxMSBTYWx0ZWRfXz5JUHGeoVQns
 a+L09qm1y4zdDG2vGYL7SyGLxbGVhGyTnzE4zf2jYGQCkbIghhj1FxHEdkxiGdoEgIrsSeYyics
 Yg3ClyE/ZP5nGgpoUKMIKH/JDE2Z0E/MeGQzlYUclF3JkW+i/BvyazUHeTFOvxC98W6pHE8YUmw
 vZInIZtSVhAyEcQAOIuWsojg7R2Ig1XnF6plPv1Ae9NpmitrBQIIDnS1XddLGew9Y6bK13zE+8n
 gNN0An5e+8YPvd4dSnhM6jt4K9IgHzy+7Pg/o89Hxqs3ko7oolzKu5Na+309G47MXaR1nXmWBCI
 YWwh1B5P4wN5nTunzmHTU05kmvIwvLBRvspvhLsPVEe/lNNvN9+y1Imt8q0BEY1ulVy6E8lRs/W
 di3FzZ2WsUisYWIuuY6xgVPu3zuv9w==
X-Proofpoint-GUID: UlRR5dnw_0Bhrnv_jkvBzNgkZQJE8_KD
X-Authority-Analysis: v=2.4 cv=QZ5rf8bv c=1 sm=1 tr=0 ts=68ef171c cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=NEAV23lmAAAA:8 a=nk_3v9Mxg0vDHs7q2dAA:9 a=CjuIK1q_8ugA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_01,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0
 spamscore=0 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110011
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Nathan,

On Tue, Oct 14, 2025 at 05:21:54PM -0700, Nathan Chancellor wrote:
> In this bug report, you mention using LLVM=1. Does the issue happen if
> you use GNU ld (ld.bfd) via LD (i.e., LD=powerpc64le-linux-gnu-ld or
> equivalent) over ld.lld from LLVM=1? This sounds more likely to be a
> linker difference rather than a compiler difference.

Thank you for the insight.

Yes, when using powerpc64le-linux-gnu-ld linker .interp section is not
emitted.

Command:
$ make LLVM=1 ARCH=powerpc LD=powerpc64le-linux-gnu-ld -j 8 zImage
$ llvm-readelf -p .comment vmlinux

String dump of section '.comment':
[     0] clang version 22.0.0git (https://github.com/llvm/llvm-project.git 7314565281ec28b745502c3f429fd431e16673eb)

$ llvm-readelf -p .interp vmlinux                                                                                    
llvm-readelf: warning: 'vmlinux': could not find section '.interp'


vishalc

