Return-Path: <linuxppc-dev+bounces-6148-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A65A33935
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2025 08:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtnQk2rkXz30T6;
	Thu, 13 Feb 2025 18:50:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739433006;
	cv=none; b=N7LpcVe1IZfP5CvCaovpUif4EmHr9SZnfhv9K09/X2CeEWnimjquXvF0vNZ7KqFk6fX9Lpq5OdGJ4RWTuw5ffiPzgxVJIBUMVhyHyPJEQ+NDfGQ/+yICoOWO4/jlKC5jKXarBmUjeQyPS5fUYmGGuauEsq2bD1DT8rvZc2tylGU+Y3jkbicCvHJsghxxhFoCtRiEYGj0tT6L4tmCmrs/QBfx0gyaiiMNp5A6LiePBiHW+eDYACXO9DlVUrPrV578/S5xAj5EDke9YLPHjbLO7tYRjP6uXLdUwCJVcdwmkCqYMChQz3EOHkBjaa88D+20JPEO1/SrqNsARpXifjaOPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739433006; c=relaxed/relaxed;
	bh=YXzJf0QTmWtrn+uCzygWl0rMIEe6OKuy2bV4yi8ugBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=f345ZwIeVY+42EzyvHx5IH4OsSEDJalYRj65B1KGO/QaxPDHrQpMPFKZh2Xt4pYgI1FpqOa7ekAQCXjw7/kiAcfm61iKR8QPfgb/U3Ri+dpKAp4GuEsdAXTsnKlow86Mi1+iq4eb88V8OpHgGjRoFdaByTo1uFfUapOjzyNRa9J8BLCSVIbI/2C+gx/WiWdJuVo0kVElPvzUHWBMV2PoIOAW7GyQ1tNbclV7KQ/dmbupcxYhOvEOSR6O+Ql+aOytEtoRmd+bq+TXKw6QzloDbh2neSm8UV1a+NberBfNEKhe000D5Na1IRYDWRY9L8iA1oSf/xyJX/tTkAJ2VHhNjQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtnQj50J7z30ML
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 18:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Ytn9Z50cpz9sSC;
	Thu, 13 Feb 2025 08:38:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zu_4Dd552sBQ; Thu, 13 Feb 2025 08:38:42 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Ytn9Z489bz9rvV;
	Thu, 13 Feb 2025 08:38:42 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 883988B770;
	Thu, 13 Feb 2025 08:38:42 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LjIk626zRboP; Thu, 13 Feb 2025 08:38:42 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8E8148B763;
	Thu, 13 Feb 2025 08:38:41 +0100 (CET)
Message-ID: <4fa83d76-117f-41bc-9137-676fb0c204dd@csgroup.eu>
Date: Thu, 13 Feb 2025 08:38:39 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Anshuman Khandual <anshuman.khandual@arm.com>, linux-mm@kvack.org
Cc: steven.price@arm.com, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250213040934.3245750-5-anshuman.khandual@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 13/02/2025 à 05:09, Anshuman Khandual a écrit :
> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
> is confusing as they sound very similar and does not differentiate between
> platform's feature subscription and feature enablement for ptdump. Rename
> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
> readability.

For me GENERIC_PTDUMP is more explicit and similar to GENERIC_IOMAP or 
GENERIC_IOREMAP or GENERIC_GETTIMEOFDAY: The arch provides the necessary 
helpers to use the generic implementation.

For me ARCH_HAS_PTDUMP just mean't that an architecture implements 
PTDUMP, it doesn't mean it does it by using the generic infrastructure.

For instance, arm32 implements PTDUMP but without using the generic one 
so I would say that arm32 has PTDUMP and expect it to select ARCH_HAS_PTDUMP



