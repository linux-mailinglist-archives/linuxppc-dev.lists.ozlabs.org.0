Return-Path: <linuxppc-dev+bounces-13745-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4547AC31789
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 15:20:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d19Zw48HHz3bfY;
	Wed,  5 Nov 2025 01:20:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762266008;
	cv=none; b=jU3AihCBOKsiAwPwEGQZ5VlVGUBLeBhREbyn5g4rtFiCEU5BWozrhJlBdeq+mI2Uc++AWSOOhdzV9CW2lj/r16sbFvK0wW9i6SorJ4TswpbuI2N0cNMV/rT3Gs0r4MrhIOmgwa3Gy4O326izkX1n6DTo2DiCq/Nw+TGIzezA9pev8NZ8vpCKpf+FwRbjH96VNt7Lr5gCuIOxNU+TKS+MEqqizk7oYWUNQaidbyd5gC3T6Hfdm2+uM0QBGWxGuHJi/I4j0wYFsf3XxcAQ9AAiYHo7EzHUriILa+j/mQIIuf3D/wD6hd+FcAd5E8Ird6HTWz159e6snYxUBB73/cwv7A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762266008; c=relaxed/relaxed;
	bh=Ivhia2P31L3ei0jVhnnZos8lhDkPjPtGSI3kUzzKNKg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AAkCyH5bQ4g082R4AqCNpLsSkO4IdrIYcK6Qxoq3MehtS6yPMsqRa7UfjZQ/lnWFtw2sg4Sya8bq/tb1VPw89C/a8Z7nP1o+sDY3JWncYN3Ay1qdHPvGfwDAH+vciLqX8sHIZ1Uko5nmhxvcARFLfOp8Nre8at904PQdI0Rx4y2jx4d8BNP/5SeYG/x5iIFVepDj3LBd5UJ06U2YnFfDu35zYGX1FVSj8zN9gYSXyBSgkfhL6KNgIfy2m3d5rpKN8a/Y3nJ8fnJvDR2O6Tf43NHk3NsGTHroLLpYDeRunRQjsmNWNsymFLZda3Y3k6D8+rCSc1/F8cHwVOLuMC4bsw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d19Zv3h4Nz3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 01:20:06 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0zGM0Zbtz9sSh;
	Tue,  4 Nov 2025 07:35:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I4w3aEv5EITr; Tue,  4 Nov 2025 07:35:06 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0zGL6PZFz9sSg;
	Tue,  4 Nov 2025 07:35:06 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C4D928B76C;
	Tue,  4 Nov 2025 07:35:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fs4pJqTtKSTf; Tue,  4 Nov 2025 07:35:06 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C60B08B763;
	Tue,  4 Nov 2025 07:35:04 +0100 (CET)
Message-ID: <e0795f90-1030-4954-aefc-be137e9db49e@csgroup.eu>
Date: Tue, 4 Nov 2025 07:35:04 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 00/12] uaccess: Provide and use scopes for user access
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027083700.573016505@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 27/10/2025 à 09:43, Thomas Gleixner a écrit :
> This is a follow up on the V4 feedback:
> 
>     https://lore.kernel.org/20251022102427.400699796@linutronix.de
> 
> Changes vs. V4:
> 
>    - Rename get/put_user_masked() to get/put_user_inline()
> 
>    - Remove the futex helpers. Keep the inline get/put for now as it needs
>      more testing whether they are really valuable.
> 
>    - Picked up tags
> 
> The series is based on v6.18-rc1 and also available from git:
> 
>      git://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git uaccess/scoped
> 

move_addr_to_user() in net/socket.c and put_cmsg() in net/core/scm.c 
should be converted as well

Christophe

> Thanks,
> 
> 	tglx
> ---
> Thomas Gleixner (12):
>        ARM: uaccess: Implement missing __get_user_asm_dword()
>        uaccess: Provide ASM GOTO safe wrappers for unsafe_*_user()
>        x86/uaccess: Use unsafe wrappers for ASM GOTO
>        powerpc/uaccess: Use unsafe wrappers for ASM GOTO
>        riscv/uaccess: Use unsafe wrappers for ASM GOTO
>        s390/uaccess: Use unsafe wrappers for ASM GOTO
>        uaccess: Provide scoped user access regions
>        uaccess: Provide put/get_user_inline()
>        coccinelle: misc: Add scoped_masked_$MODE_access() checker script
>        futex: Convert to get/put_user_inline()
>        x86/futex: Convert to scoped user access
>        select: Convert to scoped user access
> 
>   arch/arm/include/asm/uaccess.h               |   26 ++
>   arch/powerpc/include/asm/uaccess.h           |    8
>   arch/riscv/include/asm/uaccess.h             |    8
>   arch/s390/include/asm/uaccess.h              |    4
>   arch/x86/include/asm/futex.h                 |   75 ++----
>   arch/x86/include/asm/uaccess.h               |   12 -
>   fs/select.c                                  |   12 -
>   include/linux/uaccess.h                      |  314 ++++++++++++++++++++++++++-
>   kernel/futex/core.c                          |    4
>   kernel/futex/futex.h                         |   58 ----
>   scripts/coccinelle/misc/scoped_uaccess.cocci |  108 +++++++++
>   11 files changed, 501 insertions(+), 128 deletions(-)
> 


