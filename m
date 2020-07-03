Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC20121391B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 13:07:40 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yscn6p1DzDqN5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 21:07:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49ysZy1YtNzDr4h
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 21:06:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=Fi4uP/tp; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49ysZx13mnz9sQt;
 Fri,  3 Jul 2020 21:06:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1593774361;
 bh=dUPdbtgxlOrO8YOKYa9VhV+73OznK9Ay07Mrhb8Bzt4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=Fi4uP/tpU0aCuwNpZcS+08damb57Eh6KSucK83/Q6cWIlO3lAY9gEwctRz01rZGit
 39aCb3nJt6C2ZVNoXcxGwySqCjZigR43ZWkz+DBzo/jfPW655yerWYl4wIB8vOrSLw
 jh9OuUDb6rNgjTty6TbOU7djk8ugm4BLQtbMtkF3t+SQabf4KdwQI8/F6Ef0AMJxRN
 gyz+UwO2864pPwHgsZALXDXoPrbR6OsHzoM39isoJnfinl9PmTBH+0lm7mTDh0ztxD
 Jy0wBft8XOZE0aDwaQCsobPoWvkZzml/jRBbCUSTFwtLyvjxGTTdd7AfztQou+CmA4
 pe12et9Y/E5UQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 16/26] mm/powerpc: Use general page fault accounting
In-Reply-To: <20200626223622.199765-1-peterx@redhat.com>
References: <20200626223130.199227-1-peterx@redhat.com>
 <20200626223622.199765-1-peterx@redhat.com>
Date: Fri, 03 Jul 2020 21:08:15 +1000
Message-ID: <875zb47t5s.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Andrea Arcangeli <aarcange@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Peter Xu <peterx@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Peter Xu <peterx@redhat.com> writes:
> Use the general page fault accounting by passing regs into handle_mm_fault().
>
> CC: Michael Ellerman <mpe@ellerman.id.au>
> CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> CC: Paul Mackerras <paulus@samba.org>
> CC: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Peter Xu <peterx@redhat.com>
> ---
>  arch/powerpc/mm/fault.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 992b10c3761c..e325d13efaf5 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -563,7 +563,7 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
>  	 * make sure we exit gracefully rather than endlessly redo
>  	 * the fault.
>  	 */
> -	fault = handle_mm_fault(vma, address, flags, NULL);
> +	fault = handle_mm_fault(vma, address, flags, regs);
>  
>  #ifdef CONFIG_PPC_MEM_KEYS
>  	/*
> @@ -604,14 +604,9 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
>  	/*
>  	 * Major/minor page fault accounting.
>  	 */
> -	if (major) {
> -		current->maj_flt++;
> -		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MAJ, 1, regs, address);
> +	if (major)
>  		cmo_account_page_fault();
> -	} else {
> -		current->min_flt++;
> -		perf_sw_event(PERF_COUNT_SW_PAGE_FAULTS_MIN, 1, regs, address);
> -	}
> +
>  	return 0;
>  }
>  NOKPROBE_SYMBOL(__do_page_fault);


You do change the logic a bit if regs is NULL (in mm_account_fault()),
but regs can never be NULL in this path, so it looks OK to me.

Acked-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
