Return-Path: <linuxppc-dev+bounces-15705-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8856AD1D33F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Jan 2026 09:45:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4drfnr01Byz2xlP;
	Wed, 14 Jan 2026 19:45:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768380319;
	cv=none; b=ot3XPfgEzq9MyLXv50ylWH4NmJcu5tS7SvRjaYKD8889jCiTIv+xgdrY0gREemSTA9xLU70vFDykcyxWfNwtVKMdfLIEiKzjGhfUce9Cie3a3nS1jP9vKO4LzTsshs/dSRxAWSAu5gRp1rvGQck4yu74X6jv71hTDO7fSK912qbPgNMbK1WKz8BEYPwZtch94TFIfeaFCPYmEffhl5mnRmEesewToLfhOZv/TifUY4kHADtC6jh/sR+ETHqERYIiSQlea/Ej/f+v+zWRoZDHtNutH0FPQ8gkEV/wv3RCOd/gsmMtgRDLEls6AeDgRt8IDiquKlNTeAu/wMWeJ5b84A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768380319; c=relaxed/relaxed;
	bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iperdXU0PXaBERTnjVu81gT9QcPSXsKsGYWILOS6c23ykHZaxhvxVsLnK7SKIXGQCF1iktBhNlTI9S96at+sSYLyuZOp5oDRIo7r7z6yJIvuvFocWuNvCb+I4rY466ibWud4nsJJtNcpLNHfmwIqVgdZeMUoooaXJtOkNKPUs4Uo5mxNVWqKSkUM40MUxuyvyCbHKsky/lu/EbO8Kk9V5PjWSlD2LBYWC5NcQHS/TsGBbroM925NsE7IiaKeLgN5IGuebFLdC9st81EDkAjvwwSXSWwcds2vhbbm+euqrTuHSxCoz6OY9zKHLzrI+ARwgvZNxmaEmC46TE6iCfPRGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=V8yj8V95; dkim-atps=neutral; spf=pass (client-ip=209.85.221.50; helo=mail-wr1-f50.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org) smtp.mailfrom=suse.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=V8yj8V95;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=209.85.221.50; helo=mail-wr1-f50.google.com; envelope-from=pmladek@suse.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4drfnp4r3cz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 19:45:17 +1100 (AEDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-430fbb6012bso6708534f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Jan 2026 00:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1768380255; x=1768985055; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=;
        b=V8yj8V95pZ+4NOIW0cXCztk2ZL2/QiF1WL5v0nTRWXtmfahdR00VN4E742nvdOU45t
         VadpDzS9w6mjROxjgI5Qq7mOJn4O3G5ycJ38K1DxiM5pdwvdcMsj0I1OibcUPmjLPQOO
         SuUW9wajlZB35NA8urxr4GvcxDbKBLK6bpPdZVT0oUVWnQiQc9cwlc7rqm1C/gc5oAP6
         rVfilvJzarDb/p8tjaN4+SCxgr42vtWAz+rcnpxM38X4Mp2sXEktFYtdNwr/+C4gSSEp
         VY5q/6KdW9U9B04z3KIzAxOp/oMzo6hNXXzvayNoyAL8CvdEKlCztQlcO65I4jMMbXHH
         l5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380255; x=1768985055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Nn9M/VPDoeuifL+P7no8o5FApQZk7zNKYvSR+p2CRU=;
        b=EoyWpRIXg0kYabrfcgmC6RugaVaJy89B0a855Z9ECCsgI2MlxSNV+EcjruGL5eEY5Y
         EZGbT1kpWBJ37pzqW2B2lRyRtdPoroIrxAvPQbhOB+d+AvsDRlBoZO4YPUbitES8f5lB
         FKDQUYMjzzbdNRkyTiuuz+WcvSheYehkIDyoEKOdQqKshdrXAlQgbKmmeqdDQa8MRogs
         y49+iNhr2FUwwODKSoQa6/NPJVbzE2pDU7cUvwBPqXFYlI7xpUyRmGtD7TdqrgTmesM7
         0VFOIIpaaNFfYQGvKxqrbLubauk2KpgVu4qtnvQsWYCoOVFOj+xEhf4/nhnMMvKHg3wY
         eOeQ==
X-Forwarded-Encrypted: i=1; AJvYcCX2rsN8YnLZ8F07PHnlN3dWZIB25uVmD5iIiOXBBrb0wtSKIIXYoekqIuj+X6B2zhoO6pkZTISQfO6eyss=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx1+ZdyXZZN0vRrh7C9nTkJxZD3cYBpBFP9Qya+Pxn2uT35xD0m
	hOGS/nf8gBN+ywNB8t1e2q3k9wBMsJnVsFS0EY0qYnSMnQBBuyznggcNkUCg9wIRE3I=
X-Gm-Gg: AY/fxX4cLzCPEN3e8CPkAReYLBp9/+1f+nGKJ8Gp+mqcB/yzWuV2Ba9R4gAUg07sqVA
	9oZBWjDHJOPU3ZqAoIw0UHCxVaUeIr/PI545DUT63KZJIX87Hk4sV0WKMOcUVYoUH95iwNN5fnQ
	LluRIoAj/FaHi0ZHE1YEaRDStRAZ4xqTqb8eoh8KE5M9wK2c6i6YXVlns8iAQ1cuXUICJIo/IT8
	2h1lQofY6VQQZ5SZdsW5jLWT5CiVvooksNHOmybrhlgCz+P+TKuuqjgpkgwovfKugaCdxcrOGCO
	pwjB/Yjr9OATNlQ6tvdtaB8fxUHrF/ey7Ulx0hBcMMDyVdZsvRMiEAufMtX88wZfMePQxe1dK1F
	vT7Joh93iiu53qAKbxl9eOmqkMMZ9eCJJ3oZjgvOw5/jITz/H9+7JjKgtRCIqBP06zLzWAyEnsG
	tFt15vfDoYBwMmtQ==
X-Received: by 2002:a05:6000:61e:b0:431:a38:c2f7 with SMTP id ffacd0b85a97d-4342c574bedmr1500621f8f.59.1768380254886;
        Wed, 14 Jan 2026 00:44:14 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee5e3sm48685590f8f.35.2026.01.14.00.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 00:44:14 -0800 (PST)
Date: Wed, 14 Jan 2026 09:44:11 +0100
From: Petr Mladek <pmladek@suse.com>
To: Marcos Paulo de Souza <mpdesouza@suse.com>
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jiri Slaby <jirislaby@kernel.org>, Breno Leitao <leitao@debian.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Andreas Larsson <andreas@gaisler.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Laurentiu Tudor <laurentiu.tudor@nxp.com>,
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	netdev@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-hardening@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	sparclinux@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 03/19] printk: Drop flags argument from console_is_usable
Message-ID: <aWdXW6ohfQ7_z2B_@pathway.suse.cz>
References: <20251227-printk-cleanup-part3-v1-0-21a291bcf197@suse.com>
 <20251227-printk-cleanup-part3-v1-3-21a291bcf197@suse.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251227-printk-cleanup-part3-v1-3-21a291bcf197@suse.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat 2025-12-27 09:16:10, Marcos Paulo de Souza wrote:
> The flags argument was also used to check if CON_NBCON was set, but their
> usage was fixed in the last commit. All current users are reading the
> variable just to call console_is_usable.
> 
> By calling console_srcu_read_flags inside console_is_usable makes the
> code cleaner and removes one argument from the function.
> 
> Along with it, create a variant called __console_is_usable that can be
> used under console_list_lock(), like unregister_console_locked.
> 
> --- a/include/linux/console.h
> +++ b/include/linux/console.h
> @@ -656,13 +656,8 @@ extern bool nbcon_kdb_try_acquire(struct console *con,
>  				  struct nbcon_write_context *wctxt);
>  extern void nbcon_kdb_release(struct nbcon_write_context *wctxt);
>  
> -/*
> - * Check if the given console is currently capable and allowed to print
> - * records. Note that this function does not consider the current context,
> - * which can also play a role in deciding if @con can be used to print
> - * records.
> - */
> -static inline bool console_is_usable(struct console *con, short flags,
> +/* Variant of console_is_usable() when the console_list_lock is held. */

Nit: The comment is a bit misleading because this function is called
     also from console_is_usable() under console_srcu_read_lock().

     I would say something like:

/*
 * The caller must ensure that @con can't disappear either by taking
 * console_list_lock() or console_srcu_read_lock(). See also
 * console_is_usable().
 */
> +static inline bool __console_is_usable(struct console *con, short flags,
>  				     enum nbcon_write_cb nwc)
>  {
>  	if (!(flags & CON_ENABLED))
> @@ -707,6 +702,18 @@ static inline bool console_is_usable(struct console *con, short flags,
>  	return true;
>  }
>  
> +/*
> + * Check if the given console is currently capable and allowed to print
> + * records. Note that this function does not consider the current context,
> + * which can also play a role in deciding if @con can be used to print
> + * records.

And I would add here something like:

 *
 * Context: Must be called under console_srcu_read_lock().

> + */
> +static inline bool console_is_usable(struct console *con,
> +				     enum nbcon_write_cb nwc)
> +{
> +	return __console_is_usable(con, console_srcu_read_flags(con), nwc);
> +}
> +
>  #else
>  static inline void nbcon_cpu_emergency_enter(void) { }
>  static inline void nbcon_cpu_emergency_exit(void) { }

Otherwise, it looks good. It is a nice clean up.

Best Regards,
Petr

