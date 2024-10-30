Return-Path: <linuxppc-dev+bounces-2720-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC769B620C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2024 12:40:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XdlXy1wSQz2xxx;
	Wed, 30 Oct 2024 22:40:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730288402;
	cv=none; b=YiwrscJd3xqBzXcCvvAJOE1SN2mlyPnol1ps89L9qMEVIb7oPaVlUwqYKA9Z8GxN1UU+NligI8bDJmzavP+dTSGTSbQiv0AiIXyqGSalIR/vnbbuccdj2GngJ70RwZavjqTsbDf0RoD+lZE6klzBFFj9cm55+UxGTTDkccHLewCVSDCl4c4fzcJMqfb7nAudjwUm4ULWjTkVgSdixL4L3OinhfZWQCKQ7BE/4dzwejYvA0cCF3LrQnTe2sd4YzcT3+TeyJq6I4bal7pLdda3TPZQ7bB/cL99NyQLcya4DapPMJoAWCplZSRppqHMBXA4MeWJRUELdoWyMbwbZlfkNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730288402; c=relaxed/relaxed;
	bh=VeIG/ZcqI3p+nLl4RvpoP3/dtuBOLvCoB03RCodl0P0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HGwyJjWUML9qAQiL+Be81jU1v8Icp5UdsHjzxE3od/lJ8n+heyw2xUuQUqMJrgora18awC7pagJ3msljLskcAOWc5hNgieWHERLRKBgzzPd7U6BF8C05fV4uMaFRT7mjnNIkqht0XfAsolzmbpfvhmxlnzh/t6a7cRY5IMExlgaXrsWnljgsmHsRvTm3sfFT0JnRFQQVvjTjip/N8GCP8s965bo7zBrb1tJPfaepBZoXw005yq0Z+0VZXoObS2FJNc51nvJY750cPm4xw3AC2YB01Kp+xa0abSoTvgq6mmolk/N4NCyQ9kBkrJNhR1T5MIQ8pNf1xZiQoSlkcVbcRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rhEg0d1z; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sf9t6VjH; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=rhEg0d1z;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=Sf9t6VjH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=tglx@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (unknown [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XdlXw1cbzz2xs8
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2024 22:40:00 +1100 (AEDT)
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1730288386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeIG/ZcqI3p+nLl4RvpoP3/dtuBOLvCoB03RCodl0P0=;
	b=rhEg0d1z87PUbjnSMEsHa2ZTMjm4V7As2oyILf5i4K2VK/32cI0L1o8550RHGdp6sqGjh3
	ErfD1VAW2o++iRalLhw8wi1ciSvnXToQPU/7Dqz5Wlnc51fuF7yZtMempbYTt2HzLBGqx0
	Y9YSzHbUO+IR24Yjq+Ny338RBqa0jzNLUw2m9Vrr52kzfVeGJB4+uj1JaJRYCIo3DE6Lly
	bobxafA+CuOfJYFL3jZUIAtXVESnMTctTppzVthR6fn1ijnvzGIvSfDwZ8yFMWE8zMh75v
	CjtAzrsY5JQC46+IYsUu5faYS3U6XCuR8hSr6G0+pno9IQ0T9vFbLX0np3OHDQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1730288386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeIG/ZcqI3p+nLl4RvpoP3/dtuBOLvCoB03RCodl0P0=;
	b=Sf9t6VjHntegt94+/ZST48Lk206fyTt9ZFie/7zblKXgaCtLwerDU5H5dAAiGuPUAe0Y5b
	9F1eFOTF9JGc5hBw==
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Guo
 Ren
 <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>, Sven Schnelle
 <svens@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Russell
 King <linux@armlinux.org.uk>, Huacai Chen <chenhuacai@kernel.org>, WANG
 Xuerui <kernel@xen0n.name>, Theodore Ts'o <tytso@mit.edu>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Andy Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe
 Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Vincenzo Frascino
 <vincenzo.frascino@arm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Thomas
 =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, Nam Cao
 <namcao@linutronix.de>
Subject: Re: [PATCH 00/28] vdso: Preparations for generic data storage
In-Reply-To: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
References: <20241010-vdso-generic-base-v1-0-b64f0842d512@linutronix.de>
Date: Wed, 30 Oct 2024 12:39:45 +0100
Message-ID: <871pzxzuny.ffs@tglx>
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
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RDNS_NONE,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Folks!

On Thu, Oct 10 2024 at 09:01, Thomas Wei=C3=9Fschuh wrote:
> Historically each architecture defined their own datapage to store the
> VDSO data. This stands in contrast to the generic nature of the VDSO
> code itself.
> We plan to introduce a generic framework for the management of the VDSO
> data storage that can be used by all architectures and which works
> together with the existing generic VDSO code.
>
> Before that is possible align the different architectures by
> standardizing on the existing generic infrastructure and moving things
> out of the VDSO data page which does not belong there.
>
> Patches	 1- 2:	csky
> Patch	    3:	s390
> Patches	 4- 5:	arm64
> Patch	    6:	riscv
> Patch	    7:	arm
> Patch	    8:	LoongArch
> Patch	    9:	MIPS
> Patches 10-20:	x86
> Patches 21-27:	powerpc
> Patch      28: 	Renamings to avoid a name clash with the new code.

As this has been sitting for two weeks now without major comments, I'm
planning to merge that through the tip tree tomorrow.

Thanks,

        tglx

