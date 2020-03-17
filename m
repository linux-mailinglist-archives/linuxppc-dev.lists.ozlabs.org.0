Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DA26187867
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 05:10:42 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48hKTW5VydzDqWH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 15:10:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48hKRq49hrzDqW9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Mar 2020 15:09:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=ihfvjJSd; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48hKRp3W1bz9sRR;
 Tue, 17 Mar 2020 15:09:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1584418150;
 bh=TJCu/W0a/BLU7VTtueJOeDYlJamUKKigLDlrbNaaYOM=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ihfvjJSdFbAHnOxJeN90+P38TJ3il1omtjkL88pwch/4ijXw+WjDqy4BORTk/sa4K
 q6E4loM+jN9vfve5/NgSujPIiHLdpVSoLyIacxoo30GTKqHgnE8srTFoeO0osuFSQU
 QqiBSzNsgqfWP2kvHt878TDsWmtKuvn4w/xU8jxzprxKFQ6bzRkzmSyIgtdF9F3fk0
 Xm0Bgl39ClyiIvBKUUhwLzujTXWiVEQLiCzSU9iXoSyx1Fe3c0MlWKJG1yLdfbZhoN
 QxKjdMIj6Ngoh7jhTt1B1gGIbyZpbi2YivsL+YxOMS9kpXZpOSH/CfZb/zy3It7cZo
 g+QiFzjxbm+wA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Haren Myneni <haren@linux.ibm.com>
Subject: Re: [PATCH V7 08/14] powerpc/vas: Take reference to PID and mm for
 user space windows
In-Reply-To: <1583525764.9256.13.camel@hbabu-laptop>
References: <1583525239.9256.5.camel@hbabu-laptop>
 <1583525764.9256.13.camel@hbabu-laptop>
Date: Tue, 17 Mar 2020 15:09:10 +1100
Message-ID: <87r1xrpqqh.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, herbert@gondor.apana.org.au, npiggin@gmail.com,
 hch@infradead.org, oohall@gmail.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Haren Myneni <haren@linux.ibm.com> writes:
> Process close windows after its requests are completed. In multi-thread
> applications, child can open a window but release FD will not be called
> upon its exit. Parent thread will be closing it later upon its exit.

What if the parent exits first?

> The parent can also send NX requests with this window and NX can
> generate page faults. After kernel handles the page fault, send
> signal to process by using PID if CSB address is invalid. Parent
> thread will not receive signal since its PID is different from the one
> saved in vas_window. So use tgid in case if the task for the pid saved
> in window is not running and send signal to its parent.
>
> To prevent reusing the pid until the window closed, take reference to
> pid and task mm.

That text is all very dense. Can you please flesh it out and reword it
to clearly spell out what's going on in much more detail.


> diff --git a/arch/powerpc/platforms/powernv/vas-window.c b/arch/powerpc/platforms/powernv/vas-window.c
> index a45d81d..7587258 100644
> --- a/arch/powerpc/platforms/powernv/vas-window.c
> +++ b/arch/powerpc/platforms/powernv/vas-window.c
> @@ -1266,8 +1300,17 @@ int vas_win_close(struct vas_window *window)
>  	poll_window_castout(window);
>  
>  	/* if send window, drop reference to matching receive window */
> -	if (window->tx_win)
> +	if (window->tx_win) {
> +		if (window->user_win) {
> +			/* Drop references to pid and mm */
> +			put_pid(window->pid);
> +			if (window->mm) {
> +				mmdrop(window->mm);
> +				mm_context_remove_copro(window->mm);

That seems backward. Once you drop the reference the mm can be freed
can't it?

> +			}
> +		}
>  		put_rx_win(window->rxwin);
> +	}
>  
>  	vas_window_free(window);

cheers
