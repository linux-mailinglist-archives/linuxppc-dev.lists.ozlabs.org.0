Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BDEE9894
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 10:00:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4732Tk5zVyzF3v9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 20:00:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="udhf1le6"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4732Rj0pXqzF3tm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 19:58:23 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4732Rb2RXCz9v0Ys;
 Wed, 30 Oct 2019 09:58:19 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=udhf1le6; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QW7rLy2nc01p; Wed, 30 Oct 2019 09:58:19 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4732Rb1D9fz9v0Yq;
 Wed, 30 Oct 2019 09:58:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1572425899; bh=jg/wc8QIbH4zECIjrC9M/cSkNiZPA4jlUbBw8WzlMmY=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=udhf1le6OFrzcC9F8/Jd3vUzk02Y1Uc46itrYCfThyMt1ggmkeWF4ZgPrhj67fHdX
 MWVctyCNIzvPbzoxqS7wlL2gj+fCvpq1ZwdtAtwn+aUhfwFTztYcZfa+ABfpBC5CZq
 qifNjLSPHtAZOT49of06gWob19bTDkYEhx45FIAI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 19BCC8B7B5;
 Wed, 30 Oct 2019 09:58:20 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 3yS0ka3Ql27X; Wed, 30 Oct 2019 09:58:20 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8CFD98B7AF;
 Wed, 30 Oct 2019 09:58:19 +0100 (CET)
Subject: Re: [PATCH v5 0/5] Implement STRICT_MODULE_RWX for powerpc
To: Russell Currey <ruscur@russell.cc>, linuxppc-dev@lists.ozlabs.org
References: <20191030073111.140493-1-ruscur@russell.cc>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <53461d29-ec0c-4401-542e-6d575545da38@c-s.fr>
Date: Wed, 30 Oct 2019 09:58:19 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191030073111.140493-1-ruscur@russell.cc>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/10/2019 à 08:31, Russell Currey a écrit :
> v4 cover letter: https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-October/198268.html
> v3 cover letter: https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-October/198023.html
> 
> Changes since v4:
> 	[1/5]: Addressed review comments from Michael Ellerman (thanks!)
> 	[4/5]: make ARCH_HAS_STRICT_MODULE_RWX depend on
> 	       ARCH_HAS_STRICT_KERNEL_RWX to simplify things and avoid
> 	       STRICT_MODULE_RWX being *on by default* in cases where
> 	       STRICT_KERNEL_RWX is *unavailable*
> 	[5/5]: split skiroot_defconfig changes out into its own patch
> 
> The whole Kconfig situation is really weird and confusing, I believe the
> correct resolution is to change arch/Kconfig but the consequences are so
> minor that I don't think it's worth it, especially given that I expect
> powerpc to have mandatory strict RWX Soon(tm).

I'm not such strict RWX can be made mandatory due to the impact it has 
on some subarches:
- On the 8xx, unless all areas are 8Mbytes aligned, there is a 
significant overhead on TLB misses. And Aligning everthing to 8M is a 
waste of RAM which is not acceptable on systems having very few RAM.
- On hash book3s32, we are able to map the kernel BATs. With a few 
alignment constraints, we are able to provide STRICT_KERNEL_RWX. But we 
are unable to provide exec protection on page granularity. Only on 
256Mbytes segments. So for modules, we have to have the vmspace X. It is 
also not possible to have a kernel area RO. Only user areas can be made RO.

Christophe

> 
> Russell Currey (5):
>    powerpc/mm: Implement set_memory() routines
>    powerpc/kprobes: Mark newly allocated probes as RO
>    powerpc/mm/ptdump: debugfs handler for W+X checks at runtime
>    powerpc: Set ARCH_HAS_STRICT_MODULE_RWX
>    powerpc/configs: Enable STRICT_MODULE_RWX in skiroot_defconfig
> 
>   arch/powerpc/Kconfig                   |  2 +
>   arch/powerpc/Kconfig.debug             |  6 +-
>   arch/powerpc/configs/skiroot_defconfig |  1 +
>   arch/powerpc/include/asm/set_memory.h  | 32 +++++++++++
>   arch/powerpc/kernel/kprobes.c          |  3 +
>   arch/powerpc/mm/Makefile               |  1 +
>   arch/powerpc/mm/pageattr.c             | 77 ++++++++++++++++++++++++++
>   arch/powerpc/mm/ptdump/ptdump.c        | 21 ++++++-
>   8 files changed, 140 insertions(+), 3 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/set_memory.h
>   create mode 100644 arch/powerpc/mm/pageattr.c
> 
