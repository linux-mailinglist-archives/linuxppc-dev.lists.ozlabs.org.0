Return-Path: <linuxppc-dev+bounces-17376-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFcXNNZfoWmksQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17376-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 10:11:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D17F11B4F62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 10:11:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMjJ15s6bz3bjN;
	Fri, 27 Feb 2026 20:11:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772183505;
	cv=none; b=ftc5w1zOLunM7g+5l35sohm2vHd0TNX9j9q9ae3jXRnv0htcAUkOls9ErjulVULhTMIqPo57EZ5P0kBGnbcgv/K4u4sKWg4IH5szNHIqY1TTu7B4qI2/ZM1UnakOgbJZ8OfwwVRhByqIAQr63iRQwkA1UZUSioZTeXFpY8a46+cgiSqI9cEuugrd0AdP3YPdfGGfPUxc+8/AJZrENP9pYAApkiJ3W5mZzTDO6Tno/DgaFvgN5Q4wUwIbgo6sYZVOqN4if1smBtYK8nXxvh6vEtkbabVnC/uxDmV4Q2q3pcK9LI2ddEum310YBWJnI5mlN0G9ZAaDPriZ14lfPCPKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772183505; c=relaxed/relaxed;
	bh=9fJNQ8hFc6Hs06NykvFdnbwjP22Qa4Czsab7f5+iT/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A7qSRKk/Soxi4UtbCGm7ytS5cPXlwMvWWdYKwX0DZcO5FbqnMAI99FFqe6T+1mRtsl9dL5q6bmaGkOGaK87tpYcqRWZGsaioHSu9B7I0Gmw6zT7sblqwhuJYIZVTEwVZ9KPgmineU7Yp9Trdk8nfP1pJpP9z319YyYf3OS84BO02GbWxUSUqsgMkMZ9U/oRd2KamH9P6PdqEdj89Mse3lwo/6aX7enhqv/n4ItqvwqlW622ij9TeGQi/z7BLQN/GIkijxsPWeO4XLe6D6ZeorAYMLS0X5Nt9T6UDy1xZv8g4J2rRNiJw4Jb8avRH9EhIFfuV5CA+yOHE3Y2RZkm3Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WsV8TR6r; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WsV8TR6r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMjJ03Mjlz2xLv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 20:11:44 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R42kun3100088;
	Fri, 27 Feb 2026 09:10:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=9fJNQ8hFc6Hs06NykvFdnbwjP22Qa4
	Czsab7f5+iT/s=; b=WsV8TR6rk52sfgi0yEDU4EhQlIECmYdEVoCyjTqw7gZ3F3
	eeHg+aJhMwLYBfRrvCTB+X1E8112JloZG505tr4YoHOHpsA+0VMCmikGSenHxCgI
	8HXR4cEHiWmwwkzLwBscjDqpDZO3ne2k4EEE07xYvkotrBxJdXJpgPVvwn27muSf
	xqBav/gaocnH+/b+cmw7rtzjfv7peKnbFuS/n+xyS+NBW6dWAjUvlxf2Z1nhGNyZ
	JW8mx8qyfv8JeTYDboY2RdD3NfJMbMKBk4Cfsm9yXyMH2NxCMnd5vEs8SgkmIVEz
	9iyvjXnemPAPNRZVT+C81oevbnLXFbPBfFIhRcFg==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf34cjvka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 09:10:08 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61R7xVgm027794;
	Fri, 27 Feb 2026 09:10:07 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4cfsr291xx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 09:10:07 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61R9A3w526345784
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Feb 2026 09:10:03 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3E7ED20043;
	Fri, 27 Feb 2026 09:10:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88C6E20040;
	Fri, 27 Feb 2026 09:10:00 +0000 (GMT)
Received: from osiris (unknown [9.87.152.66])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 27 Feb 2026 09:10:00 +0000 (GMT)
Date: Fri, 27 Feb 2026 10:09:59 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
        Richard Henderson <richard.henderson@linaro.org>,
        Matt Turner <mattst88@gmail.com>, Magnus Lindholm <linmag7@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
        David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
        Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
        Li Nan <linan122@huawei.com>, linux-alpha@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
        linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-raid@vger.kernel.org
Subject: Re: [PATCH 17/25] s390: move the XOR code to lib/raid/
Message-ID: <20260227090959.10882Af7-hca@linux.ibm.com>
References: <20260226151106.144735-1-hch@lst.de>
 <20260226151106.144735-18-hch@lst.de>
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
In-Reply-To: <20260226151106.144735-18-hch@lst.de>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA3OCBTYWx0ZWRfX82U5aVPSCKMj
 b+0tJb22GfHqv9v4ECkZvrQTVdwe0NpyD3M0iH/J0+Xwr+YNeZjI36wIQPTa9rvjnE1UWrx9YkQ
 JHFDvWeaZB3m0vLeSHPjQ41gZNyK3P7jz3/RMGU+PQUjTrl/esmjGZf3JQqOP9wpvYUJI8IGwZd
 /XesnT0Fp6f7P6zmIK4NRyzDQXfXKB/frdS7KrKVpjV7P2YYv2qXUSwm17bcz6D+3OU43mCcNJw
 VglTApNotpU5nP84m/1BO0OHu/I+7q5gBb6aF778m34dUw2mKpCO0GIw5iCL/18UvCIDVst+Cg2
 or+7hBFh9lVuTlBEIYrN26hWcqnQmJk+cg6nVuLOR39apbYgayyTTwj8euDUuBGnNDky60OnBzo
 zdR2VUTZDeHZGzwsBRd/sH8aRuZ3XZmPmK5c8OM2MVccRTGc8Hd/VLBtD8pqPq/pRTFgfAMLrBX
 75ZY0FEa+686cu8Lnvw==
X-Proofpoint-ORIG-GUID: F8S8ZNtQow6uofq1eM08rQyj9jFeslmn
X-Authority-Analysis: v=2.4 cv=F9lat6hN c=1 sm=1 tr=0 ts=69a15f71 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VnNF1IyMAAAA:8
 a=HpkjO1BTjMN3Ce6vPK4A:9 a=CjuIK1q_8ugA:10
X-Proofpoint-GUID: j1a5E8YeCxBUvXVfRM302zEA8A8N1Tzy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1011 suspectscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602270078
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17376-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid,lst.de:email];
	FORGED_SENDER(0.00)[hca@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:arnd@arndb.de,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.inf
 radead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[hca@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[54];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: D17F11B4F62
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 07:10:29AM -0800, Christoph Hellwig wrote:
> Move the optimized XOR into lib/raid and include it it in xor.ko
> instead of unconditionally building it into the main kernel image.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/s390/lib/Makefile                     | 2 +-
>  lib/raid/xor/Makefile                      | 1 +
>  {arch/s390/lib => lib/raid/xor/s390}/xor.c | 2 --
>  3 files changed, 2 insertions(+), 3 deletions(-)
>  rename {arch/s390/lib => lib/raid/xor/s390}/xor.c (98%)

FWIW:
Acked-by: Heiko Carstens <hca@linux.ibm.com>

However, I just had a look at the s390 implementation and just saw that the
inline assembly constraints for xor_xc_2() are incorrect. "bytes", "p1",
and "p2" are input operands, while all three of them are modified within
the inline assembly. Given that the function consists only of this inline
assembly I doubt that this causes any harm, however I still want to fix
this now; but your patch should apply fine with or without this fixed.

