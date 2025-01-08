Return-Path: <linuxppc-dev+bounces-4846-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 847E2A05C4E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 14:03:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSp4h6DbVz2yRd;
	Thu,  9 Jan 2025 00:03:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736341396;
	cv=none; b=WP7X5xbZFuK9nHt5bBZx/1DilsxSYr6H1iXJicY9m7BArGznZb8yhdtHCJKdvuk20vTAI5bwLK4gRrvbquYfeycSqfMHIGRucRrTlqaujKy0tWGRxRH47QyiVnQjvFkt37ME+MJb+uRDNAgQLE21yqYyJG6kT1qrTt8WqQcHfNByu0i3TlBF/VbkdIIQRZNJLmlJ28jgJ9n3mPj9XBnw4my6ZvhOeWda2Q41qyaYhAIEq7Z5ddTVmUYZ8Cqh64aT6UIMCMpLlgQICF9kljGeKj3K28NyGuzDz6MdLrCFU8ci2Pu784XiiMSa5vPZpOtSA6Rub529T6xahdUg94HM9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736341396; c=relaxed/relaxed;
	bh=JeSQhydEbs5uuiQ3e3wD+ox1kLggsR4ZEna9+RgR2rw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c16jmLwo/xHZL9cqytjvhGnyDAwYb6Q8j5LTRmdd8RXSbXucBMW2ceeBDTDBIyYuEhLzG3x+aB2SZYD/hXVHb/bqIhZAlm0+rfYwWxp5IpbD0YmSr73FE7OG4Y1DR8umQ3PEXHxYlnrvDcoADdYTmJql8xWuYfxDFG70bs+3lx7DHdKd8b8U0VR/zhxU23tQVSaXmQEo248TXDovH4FPpEcQREqTvHnMml0YbUTgyqitreSzc8oC8yrKmTpF0Ws7t0zqTH186UyZTyAnNCxHykfTUXQehT0icKv2cL2qsFk3p8HSqFnGjG0tEf55ca3UV2eOdYUI48o0JR6NjoiAMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JJ4yAn/x; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JJ4yAn/x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSp4g3pKbz2yRD
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 00:03:15 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5083qap1015935;
	Wed, 8 Jan 2025 13:03:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=JeSQhydEbs5uuiQ3e3wD+ox1kLggsR
	4ZEna9+RgR2rw=; b=JJ4yAn/xazBWJarur4447f4wfDgjNUY/2PLsAdCbDh4WPk
	zil12zd7gAAD/6L/QTdSEtQGtam4a+pkmOLVgh0KKCrHRQ5yIADiz4hN2aYZVOfL
	PQs/xEXLRAwez6B4kNjDlWRml5Cx2sw8p4UBdCAxe86NDZm/iO/qtz+v/NAFWHNo
	TElizQcpeAbFfuxRwxwr+jxsaNu5zRN8bS8QSdBX0omHcBW90Jh7FHMf1t7VoX5q
	9GDzoRfPhwMi6XmyUeU+dyXMrT9yGrRoDq4K/dyN3njG+ltinIj56Ca43s7z5mZF
	q3BBSFQbUYtrNbtgRLyYoaUfjzRTgueAGfMYHSyA==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 441huc2b7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 13:03:01 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5089UH11015798;
	Wed, 8 Jan 2025 13:03:00 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygtkypyv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 08 Jan 2025 13:03:00 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 508D2uUe35914126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 8 Jan 2025 13:02:56 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5345020049;
	Wed,  8 Jan 2025 13:02:56 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0C71520040;
	Wed,  8 Jan 2025 13:02:56 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Wed,  8 Jan 2025 13:02:55 +0000 (GMT)
Date: Wed, 8 Jan 2025 14:02:54 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Dave Martin <Dave.Martin@arm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Mark Brown <broonie@kernel.org>, Baoquan He <bhe@redhat.com>,
        Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
        linux-mm@kvack.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        kexec@lists.infradead.org, binutils@sourceware.org, devel@daynix.com
Subject: Re: [PATCH v3 5/6] s390/crash: Use note name macros
Message-ID: <20250108130254.7704-K-hca@linux.ibm.com>
References: <20250107-elf-v3-0-99cb505b1ab2@daynix.com>
 <20250107-elf-v3-5-99cb505b1ab2@daynix.com>
 <Z31Tp0nMhb/ntUW0@e133380.arm.com>
 <965b73e7-d0a3-4fae-b0ec-70b5497cb6c4@daynix.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <965b73e7-d0a3-4fae-b0ec-70b5497cb6c4@daynix.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vdH5d42t98bHPmlR73Iz70nttiUQ4qpu
X-Proofpoint-GUID: vdH5d42t98bHPmlR73Iz70nttiUQ4qpu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0 mlxlogscore=799
 bulkscore=0 mlxscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501080108
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 08, 2025 at 01:53:51PM +0900, Akihiko Odaki wrote:
> On 2025/01/08 1:17, Dave Martin wrote:
> > > +#define NT_INIT(buf, type, desc) \
> > > +	(nt_init_name((buf), NT_ ## type, &(desc), sizeof(desc), NN_ ## type))
> > 
> > Nit: this macro name clashes with the naming scheme in elf.h.
> > 
> > I think that there is a (weak) convention that macros with upper-case
> > names don't expand to a C function call; thus, a macro with an upper-
> > case name can be invoked in places where a C function call would not be
> > allowed.  (This convention is not followed everywhere, though -- it's
> > up to the maintainer what they prefer here.)
> 
> I wanted to clarify it is a macro as it concatenates tokens with ##, but I
> also find there are many macros that are named lower-case and performs token
> concatenation.
> 
> S390 maintainers, please tell usr your opinion.

Just make the new macros lower case to avoid the naming scheme
clashes, please. Otherwise it doesn't matter too much.

> > > +#define NT_SIZE(type, desc) (nt_size_name(sizeof(desc), NN_ ## type))
> > 
> > Nit: name prefix clash (again); possibly redundant parentheses.

Same here.

> > > -	size =	nt_size(NT_PRSTATUS, sizeof(struct elf_prstatus));
> > > -	size +=  nt_size(NT_PRFPREG, sizeof(elf_fpregset_t));
> > > -	size +=  nt_size(NT_S390_TIMER, sizeof(sa->timer));
> > > -	size +=  nt_size(NT_S390_TODCMP, sizeof(sa->todcmp));
> > > -	size +=  nt_size(NT_S390_TODPREG, sizeof(sa->todpreg));
> > > -	size +=  nt_size(NT_S390_CTRS, sizeof(sa->ctrs));
> > > -	size +=  nt_size(NT_S390_PREFIX, sizeof(sa->prefix));
> > > +	size =	NT_SIZE(PRSTATUS, struct elf_prstatus);
> > > +	size +=  NT_SIZE(PRFPREG, elf_fpregset_t);
> > > +	size +=  NT_SIZE(S390_TIMER, sa->timer);
> > > +	size +=  NT_SIZE(S390_TODCMP, sa->todcmp);
> > > +	size +=  NT_SIZE(S390_TODPREG, sa->todpreg);
> > > +	size +=  NT_SIZE(S390_CTRS, sa->ctrs);
> > > +	size +=  NT_SIZE(S390_PREFIX, sa->prefix);
> > 
> > It might be worth fixing the funny spacing on these lines, since all
> > the affected lines are being replaced.

Yes, please!

Besides that this looks good:
Acked-by: Heiko Carstens <hca@linux.ibm.com>

