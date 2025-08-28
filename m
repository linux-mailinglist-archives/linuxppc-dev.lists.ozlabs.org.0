Return-Path: <linuxppc-dev+bounces-11408-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F13B393CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 08:33:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCBRP0yH5z3blc;
	Thu, 28 Aug 2025 16:33:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756362785;
	cv=none; b=UkYB+4i5yArFr0mRPoqh39WlVD5GfHnQs37ggroiNXV6hjYSbpf7byTOTPKIJDg7vPjG/so3W4zJlJbgSlbTWKyCBjrm9W6JBuSelcUe1Lj4nP3MVYyN9jQQ1b0W5y84Ay5tUDn3xs0UkVSJqfToHUtdF4K4yBrxcfB+8j61VjMJXqGn8pJC6vsrXaHo1dIJPtsFgvAyPP3IYMUGhdrhfFnIofqj1G1YtBMzwj1Ur6D33393hmd7IQzTkld1mutOOAemSX+k3gx7UxWWCSSuF7QO22uu3CAn72/vMGJGKRV0Ga3zJAa/Roi70o6+yHOVwurGL4iTajkVoK18Az29JA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756362785; c=relaxed/relaxed;
	bh=UF3gRzBamEQVarWzhWw/EArZOFxd2J8P6xFYpNaOWbc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oqYegsXfyOIg37Zk7WHdq0r5pPmv/bkP5nCAQylB0KTaluzi5vZaW8VjBlauOU0HREO4JQh6AulkbPlJql1r/J5AI8l901wd7qw51KC6WAELx1ZsUtTfLuLYCr7cnZn2uwLieakvexl2i+Ow90Q3FfxCkKG3O2Y6OSKDSOjDew+LanD9O0I01ZcMwUzMBDT0gvxMlpip+/qpRvvzVb9eN6KAyxp5h43c/n7B8no89T3RqW60m1XKoGIPkYYW7viNch3TdHbIzeQmcIG8WTvYTqYlZjxdArtC6yM3WXCmBlJSoCWx56/SVHoIds28FRUMp8D8g9TEWiBIHFC2gWtdRg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cjlKlhnV; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cjlKlhnV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=maddy@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCBRN1xBZz30WS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 16:33:04 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57S2QtIP008995;
	Thu, 28 Aug 2025 06:33:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=UF3gRz
	BamEQVarWzhWw/EArZOFxd2J8P6xFYpNaOWbc=; b=cjlKlhnV9EnvzIFVQ2DgFz
	wIi0wIQjNf2O9AoTriG7Awn3sHuBKA5NHUW1KJFP52T0AAyOrGixSwBeAiCJ/HwU
	NZSzvmNZMwfv/qCTLAvTyFpXaCsff0TQ9x3/PzRuBBxxKaP4e82AzpgbPbeIsx4Q
	jDK+2a+dKDZWxyQkoiCLFGGhHMK1Q2Nn/vabnOlnOCs4qoqIljzw2msuhqJnXFbu
	TVSF1SicxL/jgKzp7aGyQQ+coSjUdJpRer6gZlZYVZNUSdpoOhF/9wTQmvYhHJwu
	c9+4hDZYE0OVI1xmG+W3tWOpxCK/Apfpoq2UQMyMzeUgQapYU1XXu56Y4skd1ViA
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48q975ff5k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:01 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57S4UDA4007443;
	Thu, 28 Aug 2025 06:33:00 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 48qqyuktv9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Aug 2025 06:33:00 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57S6WuV631523196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Aug 2025 06:32:56 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8AAB920043;
	Thu, 28 Aug 2025 06:32:56 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0AD0820040;
	Thu, 28 Aug 2025 06:32:55 +0000 (GMT)
Received: from li-c439904c-24ed-11b2-a85c-b284a6847472.ibm.com.com (unknown [9.43.64.161])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Aug 2025 06:32:54 +0000 (GMT)
From: Madhavan Srinivasan <maddy@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH] KVM: PPC: Fix misleading interrupts comment in kvmppc_prepare_to_enter()
Date: Thu, 28 Aug 2025 12:02:53 +0530
Message-ID: <175635911048.1554354.16394188093362755086.b4-ty@linux.ibm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250806055607.17081-1-ajd@linux.ibm.com>
References: <20250806055607.17081-1-ajd@linux.ibm.com>
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
X-Proofpoint-GUID: I6-36I66aaVCd5tuA9T6n620E6BC7pJu
X-Proofpoint-ORIG-GUID: I6-36I66aaVCd5tuA9T6n620E6BC7pJu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDA3MSBTYWx0ZWRfX0xWTW+d1M7Ui
 9jfjF6sx1gXxg9u8fknQDX2T1NCf/mj47zrjtDINQuVPOEsuteVAue3wI/wgaNbPIqpPkRuM7Nt
 5ZoIcRgzIE2swnLWmDjjHJzNbhpHKW6J0YTbgll5ZiM+IwDConSNhE9iO4hncE1/Vn5YnDCTA4E
 ZylE3b67s7IDXoB0E/JLPcfuyzQ+dhBdKoyiPhL7Cxsmk74LQhYtE2BE+f7lbAtci4myDiA4l67
 AhCS0wMCTYxx5KEv2PrWInF6/p81mzlVXbSUcPoHKMGrxSJ03FJ/zsvEEFGowU2MymkuJGHSPfb
 qd9dU0PL+MOuVzebTRLaU3sym+oFIq7uxZePn2iHSmn4NKinPhAHosdbANKDmSqPSU0OIvS80RA
 3JWXh6Fc
X-Authority-Analysis: v=2.4 cv=RtDFLDmK c=1 sm=1 tr=0 ts=68aff81d cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=x6bhQlrcOuA10pbQGD8A:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-28_01,2025-08-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230071
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 06 Aug 2025 15:56:07 +1000, Andrew Donnellan wrote:
> Until commit 6c85f52b10fd ("kvm/ppc: IRQ disabling cleanup"),
> kvmppc_prepare_to_enter() was called with interrupts already disabled by
> the caller, which was documented in the comment above the function.
> 
> Post-cleanup, the function is now called with interrupts enabled, and
> disables interrupts itself.
> 
> [...]

Applied to powerpc/fixes.

[1/1] KVM: PPC: Fix misleading interrupts comment in kvmppc_prepare_to_enter()
      https://git.kernel.org/powerpc/c/02c1b0824eb1873b15676257cf1dc80070927e1e

Thanks

