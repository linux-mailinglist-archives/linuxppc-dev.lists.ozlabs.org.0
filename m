Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7DFC19519F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 07:57:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48pXhr5NSQzDqHJ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Mar 2020 17:57:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=pDvSIsk8; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48pXYL3ySGzDqZw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Mar 2020 17:50:30 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48pXYF0HKqz9txpx;
 Fri, 27 Mar 2020 07:50:25 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=pDvSIsk8; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 9c3JvdN5GUEC; Fri, 27 Mar 2020 07:50:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48pXYD6KQRz9txpw;
 Fri, 27 Mar 2020 07:50:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585291824; bh=hAABVY6NqVGKI9aIL19sjFZK5w87U11qF1N1xyDIMOU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=pDvSIsk8b/wsU/W/xdQHaHU3X4yZMJUw38gYA4+Vv5rXQaJIFGpiAVlSoCpFhxtcW
 3wqHC/fNrVURiU1MrDudrICkh4dbRM085tn5JZ51PA3UPb06TMzFCJt84BAPL8nM8t
 C+u5t5Rwl8Z+4I7bPftzFeS/HLzjjTjKn6xvG/m4=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B503C8B7BC;
 Fri, 27 Mar 2020 07:50:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KttQcZwNJpxx; Fri, 27 Mar 2020 07:50:25 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA0608B756;
 Fri, 27 Mar 2020 07:50:24 +0100 (CET)
Subject: Re: [PATCH 1/1] ppc/crash: Skip spinlocks during crash
To: Leonardo Bras <leonardo@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Enrico Weigelt <info@metux.net>, Allison Randal <allison@lohutok.net>,
 Thomas Gleixner <tglx@linutronix.de>
References: <20200326222836.501404-1-leonardo@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <af505ef0-e0df-e0aa-bb83-3ed99841f151@c-s.fr>
Date: Fri, 27 Mar 2020 07:50:20 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200326222836.501404-1-leonardo@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/03/2020 à 23:28, Leonardo Bras a écrit :
> During a crash, there is chance that the cpus that handle the NMI IPI
> are holding a spin_lock. If this spin_lock is needed by crashing_cpu it
> will cause a deadlock. (rtas_lock and printk logbuf_log as of today)
> 
> This is a problem if the system has kdump set up, given if it crashes
> for any reason kdump may not be saved for crash analysis.
> 
> Skip spinlocks after NMI IPI is sent to all other cpus.
> 
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/spinlock.h | 6 ++++++
>   arch/powerpc/kexec/crash.c          | 3 +++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/spinlock.h b/arch/powerpc/include/asm/spinlock.h
> index 860228e917dc..a6381d110795 100644
> --- a/arch/powerpc/include/asm/spinlock.h
> +++ b/arch/powerpc/include/asm/spinlock.h
> @@ -111,6 +111,8 @@ static inline void splpar_spin_yield(arch_spinlock_t *lock) {};
>   static inline void splpar_rw_yield(arch_rwlock_t *lock) {};
>   #endif
>   
> +extern bool crash_skip_spinlock __read_mostly;
> +
>   static inline bool is_shared_processor(void)
>   {
>   #ifdef CONFIG_PPC_SPLPAR
> @@ -142,6 +144,8 @@ static inline void arch_spin_lock(arch_spinlock_t *lock)
>   		if (likely(__arch_spin_trylock(lock) == 0))
>   			break;
>   		do {
> +			if (unlikely(crash_skip_spinlock))
> +				return;

You are adding a test that reads a global var in the middle of a so hot 
path ? That must kill performance. Can we do different ?

Christophe
