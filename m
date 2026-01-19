Return-Path: <linuxppc-dev+bounces-16003-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F72D3B09D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 17:26:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvwnB6h2Cz30M0;
	Tue, 20 Jan 2026 03:26:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768839966;
	cv=none; b=nu74yPExUUJt2pYbr2hdcKB8ZI4OmnQf3AMv6+SY4h6cAOYiKX2o/gmKO0Pq1seGmoD65xgQImB0XX2i8LhL3vPLy7uL2Ianm1az1t3QecC6QftICOPwdPxpYk4fHoWNUFIgESt/SKl4qo9iU5fj1a4sPDGCFnKNlPy/L9M/urkg2LpjNfIPHQ5Z60Bs5mwIFkcjYniKS7cAYBsBHyMAE4dp9YTd7kHWMIJ2v71Ogx1esLYeURf5vDTNvjKsolkLl+yqo2AQEWkaeMwsM8alX+cOrSpYuWeauTYOj1VqLXcpJEFG4B3sKfCOzHdjRwQzynihJPqr5/YsDody3uWSqw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768839966; c=relaxed/relaxed;
	bh=vI50eQf6ZTJwp39eVn8OjBLJTDVevhzLKKiHH1rRJpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VN3Emp0a/XRIsewphTQMpp9wonAToleRE2HZ37eaGS1RqApDb2ttqVV2Wzf+Arv50JIV1xp6ncXxJZpCa1Sdzo26FvYHQGi3zinA95z88KoZCsJks2HZkr+2tbzEDvMmNZDUi1hab1S5eRyEsricUwPNp2zksNKM50X0Y1TUCgSaEbhqyw/1vzUrt85Iw4Cegctzu445pbVBuvtohOTaD+jZUOoYQxJuQULAgbQcTGZXGGYWmj7/tglG3NCl6FYdRuW71nayIgxhdNFdVgYmMR9fOKLcAjwPrIQ+T7rT0nQ9+bYGowKsX4rFx11DWKvzMy0h2PWUnbpLnGQEJhIZNg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GpyRMipc; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GpyRMipc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvwn92JRGz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jan 2026 03:26:04 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60JABVF1011431;
	Mon, 19 Jan 2026 16:25:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=vI50eQf6ZTJwp39eVn8OjBLJTDVevh
	zLKKiHH1rRJpA=; b=GpyRMipc8yYPLPTgqrXJezDBYOkzvL0Q335Uc9doMYt0l6
	RCp4tH1gLkjEwD0IWjg4uwExLBUZfCoTwq2d78ndn1vt1l6xdvy0TVsAGcFamnJh
	UimomRxFamNzS7cQYb99IqDOLuuDRbgpuQLwgAfqSfxmXXN3RMUQko2/1n6OCy3J
	bTW8gdQBX/DMyQFEkWmA0S3k417/86BKP2wAZDgSpVs58s99QVEiMtnRJO8MNpzi
	Z0LxYj7qmAAsERtb74xUrAhDsPQjp8VDO9YwbPz5Ly7t//sKiyofk/5Aj5WPU0sw
	qAugav10w5sXRP3ep1A84Dhyc9AZs44vFujE42QA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br1x51ae0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jan 2026 16:25:33 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60JGPW64025324;
	Mon, 19 Jan 2026 16:25:32 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4br1x51adv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jan 2026 16:25:32 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60JEPmPo001168;
	Mon, 19 Jan 2026 16:25:31 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4brpyjfk5v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 19 Jan 2026 16:25:31 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60JGPR3B59769098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 19 Jan 2026 16:25:27 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 500BD20040;
	Mon, 19 Jan 2026 16:25:27 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 288A120043;
	Mon, 19 Jan 2026 16:25:26 +0000 (GMT)
Received: from osiris (unknown [9.87.131.46])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 19 Jan 2026 16:25:26 +0000 (GMT)
Date: Mon, 19 Jan 2026 17:25:24 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley <pjw@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Jeremy Linton <jeremy.linton@arm.com>,
        David Laight <david.laight.linux@gmail.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4 0/3] Fix bugs and performance of kstack offset
 randomisation
Message-ID: <20260119162524.28375Cf0-hca@linux.ibm.com>
References: <20260119130122.1283821-1-ryan.roberts@arm.com>
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
In-Reply-To: <20260119130122.1283821-1-ryan.roberts@arm.com>
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=R8AO2NRX c=1 sm=1 tr=0 ts=696e5afd cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=kj9zAlcOel0A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=QVAD7q_TPxDeD0yiNCkA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: -kAVzvWzx4W2sBkw8LnTwcy6JfSLKstR
X-Proofpoint-GUID: 2PAk8_huQTvYPwQqoxCEB_kXiirSTVWi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE5MDEzNiBTYWx0ZWRfX0vwiAVnh0m8o
 TN1OJE286oIsOfMdMqtyqliX72hzZM+QYqyDf55xO/ZDC7fpzaxev28IH+GQBhvKLnxp9o5+8RV
 vFZCod14fsPV2mStukEkpQxASpqU4gIL2yizEB3LVeiulLuampK1tPr+aRybb7YY/XIFWiW6E0s
 9Jyd47KmspujIKQf0AlfacjdPuzdFrhvpf642lxg2B55NZNTTBvteTtXTj2KDjNJ+Ypbn94EV6M
 N+wUpPaUtTNafOLP0E7Zlkfm0PcT9yoJ47jFIOfNR5DBBITH/qvRSR2pVLekOXIXB0b8VrwkX7N
 dNKIZ+0P0+sOHeq5K0PeNLnVnOOW71+4ucnWBEEc0HEGVZsF1EsIx8spTyLJrNU7KOmnUW9uuLI
 fXURsg2FxaYQOA6WN2q4VVvTaTTKbor317ib6c0hZC5KdFMjNCGOhBw0jFp+HmK/de6NFYUzLjo
 2B+B+1of2LNZXkJ6Xgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-19_04,2026-01-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 bulkscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601190136
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Jan 19, 2026 at 01:01:07PM +0000, Ryan Roberts wrote:
> As I reported at [1], kstack offset randomisation suffers from a couple of bugs
> and, on arm64 at least, the performance is poor. This series attempts to fix
> both; patch 1 provides back-portable fixes for the functional bugs. Patches 2-3
> propose a performance improvement approach.
> 
> I've looked at a few different options but ultimately decided that Jeremy's
> original prng approach is the fastest. I made the argument that this approach is
> secure "enough" in the RFC [2] and the responses indicated agreement.
> 
> More details in the commit logs.
> 
> 
> Performance
> ===========
> 
> Mean and tail performance of 3 "small" syscalls was measured. syscall was made
> 10 million times and each individually measured and binned. These results have
> low noise so I'm confident that they are trustworthy.
> 
> The baseline is v6.18-rc5 with stack randomization turned *off*. So I'm showing
> performance cost of turning it on without any changes to the implementation,
> then the reduced performance cost of turning it on with my changes applied.

This adds 16 instructions to the system call fast path on s390, however
some quick measurements show that executing this extra code is within
noise ratio performance wise.

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390

