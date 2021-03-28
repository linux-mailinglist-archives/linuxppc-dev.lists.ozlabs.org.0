Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6F834BC1E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Mar 2021 13:14:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F7Y5S4qpRz30GV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Mar 2021 22:14:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F7Y575PS5z2xZp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Mar 2021 22:14:34 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F7Y521DWmz9tyJZ;
 Sun, 28 Mar 2021 13:14:30 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Vbw5Z44eDhdj; Sun, 28 Mar 2021 13:14:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F7Y516Sdvz9v03k;
 Sun, 28 Mar 2021 13:14:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C8A48B782;
 Sun, 28 Mar 2021 13:14:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id N7crepemd7QU; Sun, 28 Mar 2021 13:14:30 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA0E48B75F;
 Sun, 28 Mar 2021 13:14:29 +0200 (CEST)
Subject: Re: [PATCH v5 4/7] powerpc/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
To: guoren@kernel.org
References: <1616913028-83376-1-git-send-email-guoren@kernel.org>
 <1616913028-83376-5-git-send-email-guoren@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e27af5e0-a462-cb75-6311-1b5a6b4ee4f1@csgroup.eu>
Date: Sun, 28 Mar 2021 13:14:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <1616913028-83376-5-git-send-email-guoren@kernel.org>
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Guo Ren <guoren@linux.alibaba.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, openrisc@lists.librecores.org,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 28/03/2021 à 08:30, guoren@kernel.org a écrit :
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> We don't have native hw xchg16 instruction, so let qspinlock
> generic code to deal with it.

We have lharx/sthcx pair on some versions of powerpc.

See https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20201107032328.2454582-1-npiggin@gmail.com/

Christophe

> 
> Using the full-word atomic xchg instructions implement xchg16 has
> the semantic risk for atomic operations.
> 
> This patch cancels the dependency of on qspinlock generic code on
> architecture's xchg16.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> ---
>   arch/powerpc/Kconfig | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 386ae12d8523..69ec4ade6521 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -151,6 +151,7 @@ config PPC
>   	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
>   	select ARCH_USE_QUEUED_RWLOCKS		if PPC_QUEUED_SPINLOCKS
>   	select ARCH_USE_QUEUED_SPINLOCKS	if PPC_QUEUED_SPINLOCKS
> +	select ARCH_USE_QUEUED_SPINLOCKS_XCHG32	if PPC_QUEUED_SPINLOCKS
>   	select ARCH_WANT_IPC_PARSE_VERSION
>   	select ARCH_WANT_IRQS_OFF_ACTIVATE_MM
>   	select ARCH_WANT_LD_ORPHAN_WARN
> 
