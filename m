Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2BEAC496A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 10:24:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jq1P2CTfzDq9P
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 18:24:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=msuchanek@suse.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jpxP63GPzDqXB
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 18:20:57 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id BBEE3AE3A;
 Wed,  2 Oct 2019 08:20:54 +0000 (UTC)
Date: Wed, 2 Oct 2019 10:20:53 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 24/27] powerpc/64s: interrupt return in C
Message-ID: <20190923125423.GE18205@kitsune.suse.cz>
References: <20190915012813.29317-1-npiggin@gmail.com>
 <20190915012813.29317-25-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190915012813.29317-25-npiggin@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: Tulio Magno Quites Machado Filho <tuliom@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Sep 15, 2019 at 11:28:10AM +1000, Nicholas Piggin wrote:
> Implement the bulk of interrupt return logic in C. The asm return code
> must handle a few cases: restoring full GPRs, and emulating stack store.
> 
> The asm return code is moved into 64e for now. The new logic has made
> allowance for 64e, but I don't have a full environment that works well
> to test it, and even booting in emulated qemu is not great for stress
> testing. 64e shouldn't be too far off working with this, given a bit
> more testing and auditing of the logic.
> 
> This is slightly faster on a POWER9 (page fault speed increases about
> 1.1%), probably due to reduced mtmsrd.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
...
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 24621e7e5033..45c1524b6c9e 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -524,6 +524,7 @@ void giveup_all(struct task_struct *tsk)
>  }
>  EXPORT_SYMBOL(giveup_all);
>  
> +#ifdef CONFIG_PPC_BOOK3S_64
This fails build on !BOOK3S_64 because restore_fpu and restore_altivec
are used exclusively from restore_math which is now BOOK3S_64 only.
>  /*
>   * The exception exit path calls restore_math() with interrupts hard disabled
>   * but the soft irq state not "reconciled". ftrace code that calls
> @@ -564,6 +565,7 @@ void notrace restore_math(struct pt_regs *regs)
>  
>  	regs->msr = msr;
>  }
> +#endif
>  
>  static void save_all(struct task_struct *tsk)
>  {

Thanks

Michal
