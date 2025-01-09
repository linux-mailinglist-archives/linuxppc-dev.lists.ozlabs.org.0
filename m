Return-Path: <linuxppc-dev+bounces-4906-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B46A07523
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2025 12:56:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTNYB644gz3bSg;
	Thu,  9 Jan 2025 22:56:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736423790;
	cv=none; b=AJPRkV1HLHnHwZl5wsmKK6YxVixduQB6YtIBpMKCq6z/i1iqEEDtcHTZMQjhMaPsyCNFczjm3uqsDRYfmYqO0Ap/XEP5e242EbacHo3vmmsnyEjLh+sStXvN6hvBq0XPHRblTUAoacTh6NOgEw7tZoMZlqfHAYBdvsiQvg70oCixTCaIU30aMj1NfeC6R17nr+Cysxxf/dg/Y7fPdhgd+eJr0oS0YxYIL8eVSMAxvLlvIHE8u9HGX21StoXiFKsEGdSbTst2RJhJoZkodN5JSiw7JAXEPvwuyNO8fdghUcC9TDW8D0tbi/T69n2pntFJC84ul26cWsuvDP4o28Uu5A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736423790; c=relaxed/relaxed;
	bh=TEFEUsDUypMb0E06F+mIr6mms6VLi/ADn+g21sLTM6M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASi67EoKziSBqC+osW+zxVz6M0YtSPrNqZAHHECTW+GWBB1K6je0ZAqvywXp4EQObrqb61twK2dxRjqhOT9wH1L/UHU64+RXSqAFVZE4egUk97A0/lcLKi5/uwmMD+fqY1FHVpw/mrfKEadOR/pj3/DawaQfEc2lHdaqcHf+n6ZLqt2Q7H2tvv+4ZanK5jCVNkvHq7w0BBdIjZrqVnrpIoYs1tGG5QlY8+IbrJX21bykxMFb8HIzmVXTH+Eh/NE/L2NmvBwozOowWyuKeKdfPu62ijm65/1smlOA9z5wG3wpPySFbu9CiIHOmRjvTqoas0xGOa+tYrZRlOGpYR7L+g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HU3Eulhe; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HU3Eulhe;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTNY86HZQz3bPR
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 22:56:28 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508NwEl2016724;
	Thu, 9 Jan 2025 11:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=TEFEUs
	DUypMb0E06F+mIr6mms6VLi/ADn+g21sLTM6M=; b=HU3Eulheor5aaMA38MgqND
	w5D0VsYZ9Y4ZQYJZvyu4WLwzk/lzISPX279vOi1rwp0OvImCElaqBmZ7yGv4GXtm
	vKwEzqRIH6fu9psGCV1MCIKHOFAwC/4SQQ1AC5BtxaNM8wdtW+DAIciNpYPO6Ll6
	rLdpqprshTa3IetrfZ8gd5phbjzubOZ9ML1FsMTvRNrN2rZkXWtL51/wIfyNRwsc
	zmVXIeHDTR4Dx4SMQ7DiZQb0y62yBcOaIrAEugKNmaBRj2/WpqHifUmZzBe2/kuP
	CAm9wsvyCG2SQnvkSXl/G1rirz7QoOVkinRwkhD5FGKGs504YPdGvBwjkZgyGuxw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4423ghtph4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 11:55:26 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 509BlQgB005767;
	Thu, 9 Jan 2025 11:55:25 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4423ghtph1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 11:55:25 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5099fC1i027929;
	Thu, 9 Jan 2025 11:55:24 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 43yhhkcq4h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jan 2025 11:55:24 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 509BtLGd26739390
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jan 2025 11:55:21 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E2F272004B;
	Thu,  9 Jan 2025 11:55:20 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 379C620043;
	Thu,  9 Jan 2025 11:55:20 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu,  9 Jan 2025 11:55:20 +0000 (GMT)
Date: Thu, 9 Jan 2025 12:55:18 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>, Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Anna-Maria Behnsen <anna-maria@linutronix.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Russell King <linux@armlinux.org.uk>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Arnd Bergmann <arnd@arndb.de>,
        linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
        loongarch@lists.linux.dev, linux-s390@vger.kernel.org,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-arch@vger.kernel.org, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 10/17] s390/vdso: Switch to generic storage implementation
Message-ID: <20250109115518.9731-A-hca@linux.ibm.com>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-10-f7aed1bdb3b2@linutronix.de>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241216-vdso-store-rng-v1-10-f7aed1bdb3b2@linutronix.de>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7R5Vx0DTIiffSevdjEEF0ZCUrhmWvYEy
X-Proofpoint-ORIG-GUID: A1txILdScefs6fUz5lPDNoUjZ1geeRhz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 mlxscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 suspectscore=0
 clxscore=1011 mlxlogscore=405 spamscore=0 adultscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501090091
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Dec 16, 2024 at 03:10:06PM +0100, Thomas Weiﬂschuh wrote:
> The generic storage implementation provides the same features as the
> custom one. However it can be shared between architectures, making
> maintenance easier.
> 
> Co-developed-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/s390/Kconfig                         |  1 +
>  arch/s390/include/asm/vdso.h              |  4 +-
>  arch/s390/include/asm/vdso/getrandom.h    | 12 ----
>  arch/s390/include/asm/vdso/gettimeofday.h | 15 +----
>  arch/s390/include/asm/vdso/vsyscall.h     | 20 -------
>  arch/s390/kernel/time.c                   |  6 +-
>  arch/s390/kernel/vdso.c                   | 97 ++-----------------------------
>  arch/s390/kernel/vdso32/vdso32.lds.S      |  7 +--
>  arch/s390/kernel/vdso64/vdso64.lds.S      |  8 +--
>  9 files changed, 17 insertions(+), 153 deletions(-)

Looks good to me and works.

Acked-by: Heiko Carstens <hca@linux.ibm.com>

