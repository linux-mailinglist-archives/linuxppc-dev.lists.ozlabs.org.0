Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD294D3231
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 16:51:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KDGs229nqz3bkv
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 02:51:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KDGrb41Vcz2yK2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 02:51:08 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KDGrR56SRz9sSh;
 Wed,  9 Mar 2022 16:51:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5wOzM6i21biS; Wed,  9 Mar 2022 16:51:03 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KDGrR4KLJz9sSX;
 Wed,  9 Mar 2022 16:51:03 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7D4AE8B780;
 Wed,  9 Mar 2022 16:51:03 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id XFeK_aR_i2t3; Wed,  9 Mar 2022 16:51:03 +0100 (CET)
Received: from [192.168.202.27] (unknown [192.168.202.27])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CBD838B763;
 Wed,  9 Mar 2022 16:51:02 +0100 (CET)
Message-ID: <375b927b-fa93-28cd-23b8-8afe264adb0c@csgroup.eu>
Date: Wed, 9 Mar 2022 16:51:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] powerpc/vdso: Fix VDSO unmap check
Content-Language: fr-FR
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20201103171336.98883-1-ldufour@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20201103171336.98883-1-ldufour@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: Thomas Gleixner <tglx@linutronix.de>, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/11/2020 à 18:13, Laurent Dufour a écrit :
> The check introduced by the commit 83d3f0e90c6c ("powerpc/mm: tracking vDSO
> remap") is wrong and is missing some partial unmaps of the VDSO.
> 
> To be complete the check needs the base and end address of the
> VDSO. Currently only the base is available in the mm_context of a task, but
> the end address can easily be computed because the size of VDSO is
> constant. However, there are 2 sizes for 32 or 64 bits task and they are
> stored in static variables in arch/powerpc/kernel/vdso.c.
> 
> Exporting a new function called vdso_pages() to get the number of pages of
> the VDSO based on the static variables from arch/powerpc/kernel/vdso.c.
> 
> Fixes: 83d3f0e90c6c ("powerpc/mm: tracking vDSO remap")
> 
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> Reported-by: Thomas Gleixner <tglx@linutronix.de>
> Suggested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> ---
>   arch/powerpc/include/asm/mmu_context.h | 18 ++++++++++++++++--
>   arch/powerpc/kernel/vdso.c             | 14 ++++++++++++++
>   2 files changed, 30 insertions(+), 2 deletions(-)

This patch doesn't apply anymore.

In the meantime there's a pending series from Dmitry, so I'm wondering 
if it is worth rebasing this series or not.

Christophe
