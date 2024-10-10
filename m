Return-Path: <linuxppc-dev+bounces-1954-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 841C2997E9A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 09:56:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPMWw1PcVz3bny;
	Thu, 10 Oct 2024 18:56:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728546972;
	cv=none; b=a5HWDiQ/gKkH5hu7yWpOEPyz4KrQZUVEFJv8JPxhxHhMVnmqZ4NDYDB3PaGZzORSWv0q6P0f3CbPV07NCFTv37ZfKaq485IlTqJ/yPHmnJ1iqj+9DhHmYN7HaqCr/NuK313XLPxZ4mU3qMQUiRgGqVu6UJ6DH4+q2v2yderuvOqoBZKxQfnGxlUi+JAX5ohH34YQpa1mfjzth1QX8scVxTgk4XCQ1Ir88iwSnFHD3CVSyugHKZNHPw++4XhcrRVl4NMNInQI0oqxwqHxMWJ2wPkQ851/XMpf0pbtlhILtCAOfvnDVGD0J1IC/S8NPj4CdZ28RtBT0dltpgVBOnpHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728546972; c=relaxed/relaxed;
	bh=0yVn8tI3lyhXM3ZeiBQKCb5kXwilQgq2bp9dwcfLyYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQrrCLHZYtZkss2Qp6R/GeNWVEkFQVeuazntvX4SVzWUtsnNPa1k6AquG0DAHNl4TcwpOLRY965VIYpzST8tK+svQl6zZGgd/2jpOKE9cEMvVzQrQu2IYYhsJJdhazF3vjrqLHGOozQV3DQXEMPjYRakM6DF15umvSLQC/28jXRfRBUbigo5X8grPwfvvM0XaZ1OgrYdBOm2Sc72h2BEJhRmTzljS57x2ueQCOSd7jjtC8yqCUX+EgbvRioKW3sThA5H6/5QvLRMy6sqqcIUIu2YGsoCTuEat+40LutzaOXKzRmDFsdZs8tipkNIzZY4YWbTcnmpqKi1BdcCiamoAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q5pjE1ER; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Q5pjE1ER;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPMWt58bfz3bkb
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 18:56:10 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A7YT0q005037;
	Thu, 10 Oct 2024 07:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=pp1; bh=0
	yVn8tI3lyhXM3ZeiBQKCb5kXwilQgq2bp9dwcfLyYI=; b=Q5pjE1ERdXenpwSx9
	H+3tZabSr8DH7Beyxy8drvLqU3Ht7Ga5XyW6C2PTL3fPAuIoZz3HzJyiSMoG5gdj
	JjsNnDX89G4/TG2MQ2BW0D7oNe96JjJi5G8uZ9mB/IapFOPGaPI969vLuEtTw6gE
	D6w8jekAr6Nzp3HaTEja4FUr8tp1ftTFqMfyfMTZNpMqVCBoXY9zpXfp1OYNxpHv
	kbP2c54yz9Ep1Dqaj3eGZkuA+jhRxDx4QQwAhzA66Rkp22oRkrTbO5vLbuYRFTlL
	+Pd5u72MCl/j+dMSEbRW7gnpYCpEOaMHPSE7LD2eBuG5IA3bgsjtNp/LMzgsdAiG
	yYq+A==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426anb82uq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:55:18 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49A7tHik016153;
	Thu, 10 Oct 2024 07:55:17 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426anb82uf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:55:17 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49A544L3013784;
	Thu, 10 Oct 2024 07:55:16 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 423fssen8b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 07:55:16 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49A7tCoY59048420
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 07:55:13 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AC8702004B;
	Thu, 10 Oct 2024 07:55:12 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BCECD2004E;
	Thu, 10 Oct 2024 07:55:11 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Oct 2024 07:55:11 +0000 (GMT)
Date: Thu, 10 Oct 2024 09:55:10 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Guo Ren <guoren@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Russell King <linux@armlinux.org.uk>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        "Theodore Ts'o" <tytso@mit.edu>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
        linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCH 28/28] vdso: Rename struct arch_vdso_data to
 arch_vdso_time_data
Message-ID: <20241010075510.6997-C-hca@linux.ibm.com>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
 <20241010-vdso-generic-base-v1-28-b64f0842d512@linutronix.de>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241010-vdso-generic-base-v1-28-b64f0842d512@linutronix.de>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: txKjIm6oMyh-bYlrWVbJ8zIUfT6c90P5
X-Proofpoint-GUID: EzJFZF0xHPJktynCv2z269EPy5OXcKam
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_04,2024-10-09_02,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 mlxscore=0 mlxlogscore=644 priorityscore=1501
 clxscore=1011 phishscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100049
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 09:01:30AM +0200, Thomas Weißschuh wrote:
> From: Nam Cao <namcao@linutronix.de>
> 
> The struct arch_vdso_data is only about vdso time data. So rename it to
> arch_vdso_time_data to make it obvious.
> Non time-related data will be migrated out of these structs soon.
> 
> Signed-off-by: Nam Cao <namcao@linutronix.de>
> ---
>  arch/Kconfig                                        |  2 +-
>  arch/riscv/Kconfig                                  |  2 +-
>  arch/riscv/include/asm/vdso/{data.h => time_data.h} |  8 ++++----
>  arch/riscv/kernel/sys_hwprobe.c                     |  2 +-
>  arch/riscv/kernel/vdso/hwprobe.c                    |  4 ++--
>  arch/s390/Kconfig                                   |  2 +-
>  arch/s390/include/asm/vdso/data.h                   | 12 ------------
>  arch/s390/include/asm/vdso/time_data.h              | 12 ++++++++++++
>  include/vdso/datapage.h                             |  8 ++++----
>  9 files changed, 26 insertions(+), 26 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com> # s390

