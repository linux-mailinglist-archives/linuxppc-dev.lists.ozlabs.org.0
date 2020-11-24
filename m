Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 30FD02C1E89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 07:55:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CgFCp25JfzDqSs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Nov 2020 17:55:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CgF9t4NK4zDqPM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Nov 2020 17:54:05 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4CgF9f503cz9tyhw;
 Tue, 24 Nov 2020 07:53:58 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id hmjPhs3s2u0p; Tue, 24 Nov 2020 07:53:58 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4CgF9f44vJz9tyhv;
 Tue, 24 Nov 2020 07:53:58 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5E5C08B7A3;
 Tue, 24 Nov 2020 07:53:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 1BWyoMS_Jinp; Tue, 24 Nov 2020 07:53:59 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4C8818B79F;
 Tue, 24 Nov 2020 07:53:58 +0100 (CET)
Subject: Re: [PATCH v2 00/19] Add generic vdso_base tracking
To: Dmitry Safonov <dima@arista.com>, linux-kernel@vger.kernel.org
References: <20201124002932.1220517-1-dima@arista.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <5e315bf6-b03d-e66e-9557-22ece397080e@csgroup.eu>
Date: Tue, 24 Nov 2020 07:53:58 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201124002932.1220517-1-dima@arista.com>
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
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 x86@kernel.org, Dmitry Safonov <0x7f454c46@gmail.com>,
 Oleg Nesterov <oleg@redhat.com>, Russell King <linux@armlinux.org.uk>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Guo Ren <guoren@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 24/11/2020 à 01:29, Dmitry Safonov a écrit :
> v2 Changes:
> - Rename user_landing to vdso_base as it tracks vDSO VMA start address,
>    rather than the explicit address to land (Andy)
> - Reword and don't use "new-execed" and "new-born" task (Andy)
> - Fix failures reported by build robot
> 
> Started from discussion [1], where was noted that currently a couple of
> architectures support mremap() for vdso/sigpage, but not munmap().
> If an application maps something on the ex-place of vdso/sigpage,
> later after processing signal it will land there (good luck!)
> 
> Patches set is based on linux-next (next-20201123) and it depends on
> changes in x86/cleanups (those reclaim TIF_IA32/TIF_X32) and also
> on my changes in akpm (fixing several mremap() issues).

I have a series that cleans up VDSO init on powerpc and migrates powerpc to 
_install_special_mapping() (patch 10 of the series).

https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=204396&state=%2A&archive=both

I'm wondering how we should coordinate with your series for merging.

I guess your series will also imply removal of arch_unmap() ? see 
https://elixir.bootlin.com/linux/v5.10-rc4/source/arch/powerpc/include/asm/mmu_context.h#L262

> 
> Logically, the patches set divides on:
> - patch       1: a cleanup for patches in x86/cleanups
> - patches  2-11: cleanups for arch_setup_additional_pages()
> - patches 12-13: x86 signal changes for unmapped vdso
> - patches 14-19: provide generic vdso_base in mm_struct
> 
> In the end, besides cleanups, it's now more predictable what happens for
> applications with unmapped vdso on architectures those support .mremap()
> for vdso/sigpage.
> 
> I'm aware of only one user that unmaps vdso - Valgrind [2].
> (there possibly are more, but this one is "special", it unmaps vdso, but
>   not vvar, which confuses CRIU [Checkpoint Restore In Userspace], that's
>   why I'm aware of it)
> 
> Patches as a .git branch:
> https://github.com/0x7f454c46/linux/tree/setup_additional_pages-v2
> 
> v1 Link:
> https://lore.kernel.org/lkml/20201108051730.2042693-1-dima@arista.com/
> 
> [1]: https://lore.kernel.org/linux-arch/CAJwJo6ZANqYkSHbQ+3b+Fi_VT80MtrzEV5yreQAWx-L8j8x2zA@mail.gmail.com/
> [2]: https://github.com/checkpoint-restore/criu/issues/488
> 

Christophe
