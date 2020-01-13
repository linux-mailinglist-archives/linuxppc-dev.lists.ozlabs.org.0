Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1694B13910F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 13:28:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47xCY62pkKzDqGF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2020 23:28:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47xCVc30dBzDqLG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2020 23:26:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=k6BgMumk; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 47xCVZ2Sflz9s1x;
 Mon, 13 Jan 2020 23:25:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1578918358;
 bh=mts05zivBdOo6xfZEW5RcxA+6SSmPurfnkxGM6AvogE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=k6BgMumkhydujOiqrSbx+uCrb63h6xod8X/2caO0sxDPrAeBvCz79bmdS78xuC5K+
 Uficjl3saS1Ob0XlHu/IQZdsqIcsLhXRChqEYqUCo0NSQCjbUzuUBbcTC/ZUSOwObw
 6VvUNXdqZrHv3iJkHN7Cph95S7lnma07lgGgStsIyaIPfZdSdKFo7IBihvG/dF66JH
 B5wKKmWRphNcOi+b2YxBoCNfJG0gaXWii/lN8+Gg+WBYNoj0E77XYJhINeEXedVS69
 9LzmtlRB/ouUP6f3iHrDNQgYaX1BegDsBUShv5aAWKnlXGL888kR2aXLRMvKJPxamS
 tkDW4ABXqBFZw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 Scott Wood <oss@buserror.net>
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
In-Reply-To: <20200109183912.5fcb52aa@canb.auug.org.au>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
Date: Mon, 13 Jan 2020 23:26:00 +1100
Message-ID: <8736cj8rvr.fsf@mpe.ellerman.id.au>
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
Cc: PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>,
 Timur Tabi <timur@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stephen Rothwell <sfr@canb.auug.org.au> writes:
> ev_byte_channel_send() assumes that its third argument is a 16 byte array.
> Some places where it is called it may not be (or we can't easily tell
> if it is).  Newer compilers have started producing warnings about this,
> so make sure we actually pass a 16 byte array.
>
> There may be more elegant solutions to this, but the driver is quite
> old and hasn't been updated in many years.
...
> Fixes: dcd83aaff1c8 ("tty/powerpc: introduce the ePAPR embedded hypervisor byte channel driver")
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/tty/ehv_bytechan.c | 20 +++++++++++++++++---
>  1 file changed, 17 insertions(+), 3 deletions(-)
>
> I have only build tested this change so it would be good to get some
> response from the PowerPC maintainers/developers.

I've never heard of it, and I have no idea how to test it.

It's not used by qemu, I guess there is/was a Freescale hypervisor that
used it.

But maybe it's time to remove it if it's not being maintained/used by
anyone?

cheers


> diff --git a/drivers/tty/ehv_bytechan.c b/drivers/tty/ehv_bytechan.c
> index 769e0a5d1dfc..546f80c49ae6 100644
> --- a/drivers/tty/ehv_bytechan.c
> +++ b/drivers/tty/ehv_bytechan.c
> @@ -136,6 +136,20 @@ static int find_console_handle(void)
>  	return 1;
>  }
>  
> +static unsigned int local_ev_byte_channel_send(unsigned int handle,
> +        unsigned int *count, const char *p)
> +{
> +	char buffer[EV_BYTE_CHANNEL_MAX_BYTES];
> +	unsigned int c = *count;
> +
> +	if (c < sizeof(buffer)) {
> +		memcpy(buffer, p, c);
> +		memset(&buffer[c], 0, sizeof(buffer) - c);
> +		p = buffer;
> +	}
> +	return ev_byte_channel_send(handle, count, p);
> +}
> +
>  /*************************** EARLY CONSOLE DRIVER ***************************/
>  
>  #ifdef CONFIG_PPC_EARLY_DEBUG_EHV_BC
> @@ -154,7 +168,7 @@ static void byte_channel_spin_send(const char data)
>  
>  	do {
>  		count = 1;
> -		ret = ev_byte_channel_send(CONFIG_PPC_EARLY_DEBUG_EHV_BC_HANDLE,
> +		ret = local_ev_byte_channel_send(CONFIG_PPC_EARLY_DEBUG_EHV_BC_HANDLE,
>  					   &count, &data);
>  	} while (ret == EV_EAGAIN);
>  }
> @@ -221,7 +235,7 @@ static int ehv_bc_console_byte_channel_send(unsigned int handle, const char *s,
>  	while (count) {
>  		len = min_t(unsigned int, count, EV_BYTE_CHANNEL_MAX_BYTES);
>  		do {
> -			ret = ev_byte_channel_send(handle, &len, s);
> +			ret = local_ev_byte_channel_send(handle, &len, s);
>  		} while (ret == EV_EAGAIN);
>  		count -= len;
>  		s += len;
> @@ -401,7 +415,7 @@ static void ehv_bc_tx_dequeue(struct ehv_bc_data *bc)
>  			    CIRC_CNT_TO_END(bc->head, bc->tail, BUF_SIZE),
>  			    EV_BYTE_CHANNEL_MAX_BYTES);
>  
> -		ret = ev_byte_channel_send(bc->handle, &len, bc->buf + bc->tail);
> +		ret = local_ev_byte_channel_send(bc->handle, &len, bc->buf + bc->tail);
>  
>  		/* 'len' is valid only if the return code is 0 or EV_EAGAIN */
>  		if (!ret || (ret == EV_EAGAIN))
> -- 
> 2.25.0.rc1
>
> -- 
> Cheers,
> Stephen Rothwell
