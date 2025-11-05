Return-Path: <linuxppc-dev+bounces-13810-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32868C3659D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 16:35:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1qC75PXqz2ySq;
	Thu,  6 Nov 2025 02:35:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762356915;
	cv=none; b=YCyXVehLsKAyR8QOhaDNRDrZqljsOPRqptdwEKCjxL8WYGgTo7ZaclCvIylAAqAxH6SCSDQvtcnQJuCuNGtcheyb2gC9hJADaW3ganto6B+FbFS6bB+tMIm6Tx0wFUJ+cWFkwbrCm+oiBXb6q881q7cn/4wk+R84ZRCmWBJDCOjYDtbMYYxP/MtV2uxDxGSvwHiITa6CZpY8xEhRm4s4k1GAVNytNsfFC2zCFU3kk1GKX1urLG7fmFFFZ2aOKoK5VMxxseGhX09btgJ+2GMa4mlUtie3DMVdiS2suPU4gfqbKe8HdTWaab2LRDsRLF697n+FyDRIw1/54UhSqoU65w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762356915; c=relaxed/relaxed;
	bh=mBCDjFCtIralqPbaobJr9w45EqrrTPgVKXorpBh75DA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DeoRrF6jOEUHRNLGaXf+Gfh11jvT1I+Q1HHZQOYLGoek/Arj75U6z0M7kgDdnoXZGkzo/mtrf683/Iv3D+wUWZWvSjssNqmFFjVZs0R/bKULoaYFIluwKdIMx5wmOHunC3kFMtEacWpVA1qzPPXYVgRFRLSaOHNSG2sFMfdXEPjB7DO3HaRioGgyCcIMEokf0RK9EvLPxmYAkwPGfgYUraQBTIbPrt8/1GF/EQF79RcVxjYkxbPBIkcKWKUyqG1pyUj2GmT9JlozV8091lcIWVUeugdFLkmK2jNgEM34tKyRrvdXUCLm0/WMoGa9Et2RB3+haMAQLAuTKRp0hkrPQw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kJJvQMKS; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kJJvQMKS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1qC56Xjvz2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Nov 2025 02:35:12 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A57hVAj007179;
	Wed, 5 Nov 2025 15:34:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=mBCDjF
	CtIralqPbaobJr9w45EqrrTPgVKXorpBh75DA=; b=kJJvQMKSobCn/AX0FM8hiu
	lAg3CQC5+pPaGaYOYIf58zJOni1GZeBU5r+Ebpnwm1cT0Y2oN+LZHcCV1AQGy5ib
	qF0K8CkDnXRO3u+NJ6fCUcRwPNyXTzebzR/1kBMjNE2Du5ppzZk6r0ed08NSlok4
	BG42+N57/9Pz/7iG3qodXH/AVEVRn1lt7Wp+xfxzW8Mc8+KJtePmcayAgc/3sXkU
	bEde9/gBVgl3qsanMHgkoEtEGfkLfYWvSabDJoCV796DtA5RfDDhBuG1gLBp65Hj
	5kCUO4tHPdGz34RItxvzgRYx4bF2NhlaTB9c8EYikfmlyWRKpxX9/Grx/RPi1bBg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mr9vpe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 15:34:36 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A5FQeET022630;
	Wed, 5 Nov 2025 15:34:35 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mr9vpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 15:34:35 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A5ChDTP021482;
	Wed, 5 Nov 2025 15:34:34 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5xrjrkr3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 15:34:34 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A5FYURj53674336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 5 Nov 2025 15:34:30 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A883920040;
	Wed,  5 Nov 2025 15:34:30 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 13AF62004B;
	Wed,  5 Nov 2025 15:34:29 +0000 (GMT)
Received: from osiris (unknown [9.155.211.25])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  5 Nov 2025 15:34:28 +0000 (GMT)
Date: Wed, 5 Nov 2025 16:34:26 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Arnd Bergmann <arnd@arndb.de>, "David S. Miller" <davem@davemloft.net>,
        Andreas Larsson <andreas@gaisler.com>,
        Nick Alcock <nick.alcock@oracle.com>, John Stultz <jstultz@google.com>,
        Stephen Boyd <sboyd@kernel.org>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
        Shuah Khan <shuah@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Russell King <linux@armlinux.org.uk>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Nagarathnam Muthusamy <nagarathnam.muthusamy@oracle.com>,
        Shannon Nelson <sln@onemain.com>, linux-kernel@vger.kernel.org,
        sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
        linux-s390@vger.kernel.org
Subject: Re: [PATCH v4 24/35] vdso/datastore: Allocate data pages dynamically
Message-ID: <20251105153426.16228C13-hca@linux.ibm.com>
References: <20251014-vdso-sparc64-generic-2-v4-0-e0607bf49dea@linutronix.de>
 <20251014-vdso-sparc64-generic-2-v4-24-e0607bf49dea@linutronix.de>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251014-vdso-sparc64-generic-2-v4-24-e0607bf49dea@linutronix.de>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GGdzfD5G3hQ68-39VW7GakGxAH7MovxB
X-Authority-Analysis: v=2.4 cv=MKhtWcZl c=1 sm=1 tr=0 ts=690b6e8c cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=8nJEP1OIZ-IA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ebG-ZW-8AAAA:8 a=e1b3s80Sx_c-5AZqzBwA:9 a=3ZKOabzyN94A:10 a=wPNLvfGTeEIA:10
 a=Bj2TwAA_C77lQ_X2_dkp:22 a=DXsff8QfwkrTrK3sU8N1:22 a=Z5ABNNGmrOfJ6cZ5bIyy:22
 a=bWyr8ysk75zN3GCy5bjg:22
X-Proofpoint-ORIG-GUID: FA8Qn-I58re3Fj-7DCZVJVXwZ4DiaPYs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAwMSBTYWx0ZWRfX79q+aRjocr8A
 WsJicIkrDzeZowDTKWdSRpdbbSTYSdnAKh3ClmRCNP0S8je+b6bwR4QAObGY+JaivfKMlj2hBVw
 KLzTBb1GVj2u/8kaK8wfeBTBcwczqZx2uJUW94XwBBfiT1PIHgcud1V1IaGBQ7/80r1+m5QVf5y
 2MAbdeeWJFA/uN5CkUVEPIEOGTIF7nMUT8yZgz8qLQcWjKcDN5xrV+ylstwr289JOHk8UDvW+If
 ZS0Vh+xa015UpwIHMHQi/pVyWTfCCQ7nEswkEgkvxtiBx1AXWt5u1z1b8gL7A+PMKBFcztnM0NI
 NBBPJSUKiH3NfGjyVbk1no9yQUjK4mCZusqZxNsqflVQ6b/X2GCXdlXaNPmhI6deTnzJKGTxcvZ
 8le1/uj5xZfo4KJOYkdyfW8kJi0g6w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_06,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 14, 2025 at 08:49:10AM +0200, Thomas Weiﬂschuh wrote:
> Allocating the datapages as part of the kernel image does not work on
> SPARC. It is also problematic with regards to dcache aliasing as there is
> no guarantee that the virtual addresses used by the kernel are compatible
> with those used by userspace.
> 
> Allocate the data pages through the page allocator instead.
> Unused pages in the vDSO VMA are still allocated to keep the virtual
> addresses aligned.
> 
> These pages are used by both the timekeeping, random pool and architecture
> initialization code. Introduce a new early initialization step, to make
> sure they are available when needed.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> Tested-by: Andreas Larsson <andreas@gaisler.com>
> Reviewed-by: Andreas Larsson <andreas@gaisler.com>
> ---
>  include/linux/vdso_datastore.h |  6 ++++++
>  init/main.c                    |  2 ++
>  lib/vdso/datastore.c           | 44 ++++++++++++++++++++++--------------------
>  3 files changed, 31 insertions(+), 21 deletions(-)

...

> +void __init vdso_setup_data_pages(void)
> +{
> +	unsigned int order = get_order(VDSO_NR_PAGES * PAGE_SIZE);
> +	struct folio *folio = folio_alloc(GFP_KERNEL, order);

I'm seeing random hangs on s390 too with our CI, but unfortunately I cannot
reproduce it manually. But looking at one of the dumps it looks to me like the
vdso time page contains (more or less) random junk at the end. Or in other
words, shouldn't this be:

	struct folio *folio = folio_alloc(GFP_KERNEL | __GFP_ZERO, order);

? At least that is a difference to before as far as I can tell.

