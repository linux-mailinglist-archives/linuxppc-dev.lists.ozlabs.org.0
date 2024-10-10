Return-Path: <linuxppc-dev+bounces-1983-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 777E6998C9D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 18:02:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPZJd0Nkdz3bjt;
	Fri, 11 Oct 2024 03:02:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728576128;
	cv=none; b=Tgq58cZCPRO5l2e3aVJBiCUCo/b844JAL+pjZYU5H7lCU6LdYsqPeBWBg8NGMsvCRK8a88gnPTS7u7j2kDadEzx6P5xsrn9iD/3TqQoSy5WWT+OqmWlWbLlN0+GBfoXSO5ih7IPoGns/DPuWleZq+07PcrQCcX+eNV8B+IX6OnEElU6+y77kxf7zfsNEdy/sDID9FV9Zpp52HQzimINw13YYKKXyadElcC39HKVTFeEVZRT7PY5n9fXDpmp8CmLjPfvXpJHPwBJK4F+WS6qxv/ayUqbahxujk05WtIwReSTC/gfMwKk+CgvICW2XaQAltDRO3ve068U/14nJbxXCOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728576128; c=relaxed/relaxed;
	bh=aRVSqJeIBM4P/yTtc34+JqyyPgM1QcxniwmaD3Dpay4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4sKkZphG8fmlRO6hsB08t3Bz+5Zd49Pj8KaY3Fm49fcMZK2moAVUYb35Lsex8ZTnnrNpBbD1eou7hGVxjtDLgwMP4e47uDGmkx3xeRMmN3fY+ncg7ixXDJ1+9fQxep6aNOeSw7TidEkYKaaYI1DwYgrZiJNh3q+njacMcYxTywhdkQ7fvJlO10DTXi2MGiGNRgf+1CMGQNWJTqL2xmR+o2W7BFhZ8kAh8nNZrm6jmludrjkjU4vsVxsGUJUGrQKNT2EYMUb/4mvh8+gIPRPcSTmE6vY4XrkrKITrZDlz9lYcdspV4KkQ7nEoBsppc1FOBz1jq4z3RXgO+W2/udyeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EABvwbII; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EABvwbII;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPZJb3mB0z3bjs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Oct 2024 03:02:07 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49AFiofe025085;
	Thu, 10 Oct 2024 16:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date
	:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-transfer-encoding:in-reply-to; s=pp1; bh=a
	RVSqJeIBM4P/yTtc34+JqyyPgM1QcxniwmaD3Dpay4=; b=EABvwbIIeQCOinHf6
	dhCI17lSp0fbVj8kQuVbn0rw5s4+Uc18Wn588QMEZPTa001iSdETDXrELR3UKWhw
	k3P2aCVvQ0S6MwtWaPCHZVIN9PoyOoyDSeCunj3i/+AQJiJfVP3FJEPNPLg92Aqk
	zN7+h3A0cSoX1aVAC4ELgqtj/4ENMg06UytQ92VU4KdPr4PBcsbekMUgjM7Cj0h5
	Xg6z27p16osefzMO++I+9TH4cx93rtA+I1yHghrATeFa/AAVvlxuqV1nCybvzHXD
	+pQ0uz9w9bttm0a4AJ3jEEyZxFMDpDgQNlPRYVtn7sn3SM+OxGkwNGepokgjrN+U
	kbEEg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426hu5g29g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 16:01:14 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 49AG1Emf029252;
	Thu, 10 Oct 2024 16:01:14 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 426hu5g29a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 16:01:14 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 49AFi8cF030168;
	Thu, 10 Oct 2024 16:01:12 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 423gsn0nt5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 16:01:12 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 49AG18aT53281078
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Oct 2024 16:01:08 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A2C3120043;
	Thu, 10 Oct 2024 16:01:08 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B427920040;
	Thu, 10 Oct 2024 16:01:07 +0000 (GMT)
Received: from osiris (unknown [9.152.212.60])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 10 Oct 2024 16:01:07 +0000 (GMT)
Date: Thu, 10 Oct 2024 18:01:06 +0200
From: Heiko Carstens <hca@linux.ibm.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andy Lutomirski <luto@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        "H. Peter Anvin" <hpa@zytor.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
        Russell King <linux@armlinux.org.uk>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-s390@vger.kernel.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH 6/9] s390/vdso: Remove timekeeper includes
Message-ID: <20241010160106.15346-F-hca@linux.ibm.com>
References: <20241010-vdso-generic-arch_update_vsyscall-v1-0-7fe5a3ea4382@linutronix.de>
 <20241010-vdso-generic-arch_update_vsyscall-v1-6-7fe5a3ea4382@linutronix.de>
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
In-Reply-To: <20241010-vdso-generic-arch_update_vsyscall-v1-6-7fe5a3ea4382@linutronix.de>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 1_f3XWFj058GjuDseAZVwzQNnRq2_S41
X-Proofpoint-ORIG-GUID: zxhxQjmvWvZNQVEbX_m8_FF8HYH53KWD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-10_11,2024-10-10_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=9 lowpriorityscore=0
 phishscore=0 mlxscore=9 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=9 suspectscore=0 clxscore=1011 malwarescore=0 mlxlogscore=103
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410100106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Oct 10, 2024 at 05:44:49PM +0200, Thomas Weiﬂschuh wrote:
> Since the generic VDSO clock mode storage is used, this header file is
> unused and can be removed.
> 
> This avoids including a non-VDSO header while building the VDSO,
> which can lead to compilation errors.
> 
> Also drop the comment which is out of date and in the wrong place.
> 
> Signed-off-by: Thomas Weiﬂschuh <thomas.weissschuh@linutronix.de>
> ---
>  arch/s390/include/asm/vdso/vsyscall.h | 5 -----
>  arch/s390/kernel/time.c               | 1 -
>  2 files changed, 6 deletions(-)

Acked-by: Heiko Carstens <hca@linux.ibm.com>

