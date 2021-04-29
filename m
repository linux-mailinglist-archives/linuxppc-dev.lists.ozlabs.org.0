Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF46C36EBFF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Apr 2021 16:07:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FWHPR5xp7z3fMY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Apr 2021 00:07:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FWHJL5VrNz3bc8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Apr 2021 00:02:42 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FWHJK3XBVz9sj0; Fri, 30 Apr 2021 00:02:40 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210425115831.2818434-1-mpe@ellerman.id.au>
References: <20210425115831.2818434-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/kvm: Fix build error when
 PPC_MEM_KEYS/PPC_PSERIES=n
Message-Id: <161970488683.4033873.339237153439763431.b4-ty@ellerman.id.au>
Date: Fri, 30 Apr 2021 00:01:26 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 25 Apr 2021 21:58:31 +1000, Michael Ellerman wrote:
> lkp reported a randconfig failure:
> 
>      In file included from arch/powerpc/include/asm/book3s/64/pkeys.h:6,
>                     from arch/powerpc/kvm/book3s_64_mmu_host.c:15:
>      arch/powerpc/include/asm/book3s/64/hash-pkey.h: In function 'hash__vmflag_to_pte_pkey_bits':
>   >> arch/powerpc/include/asm/book3s/64/hash-pkey.h:10:23: error: 'VM_PKEY_BIT0' undeclared
>         10 |  return (((vm_flags & VM_PKEY_BIT0) ? H_PTE_PKEY_BIT0 : 0x0UL) |
>          |                       ^~~~~~~~~~~~
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/kvm: Fix build error when PPC_MEM_KEYS/PPC_PSERIES=n
      https://git.kernel.org/powerpc/c/ee1bc694fbaec1a662770703fc34a74abf418938

cheers
