Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EDAA8155D09
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 18:40:14 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DjHb665kzDqkL
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Feb 2020 04:40:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=groeck7@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DIPvIFNW; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DjFy4dDszDqg1
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Feb 2020 04:38:44 +1100 (AEDT)
Received: by mail-pl1-x644.google.com with SMTP id c23so25064plz.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Feb 2020 09:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=OiMCk3HNlA+VYlmzK8C7KfB3ijS3pxsMTQRh/DwJS98=;
 b=DIPvIFNWz82jW5jdNCN7WS3F+SQ26RG5xOeXI72hbKx5hdyOiREZSJbZJRFbzMxP5z
 GcPlR/hwSDEjldjA28tMgKQ+vWpcgcf8pVsbeIQ+lgQCNhQy1Sgh8lMRAlYe6EcURoCb
 ONgSclgsXPB3wV2jCGTyUfNmcfqD3NohxJmKTRdEtZMUrkvI5CZwetjarcHTaMN0pMpk
 Z9r98dl5GyAkmFMCPcSz9LXz5BziHAoGsg0BVyc5hubYQdGwgic0CCLiLEdS1T56j9LL
 p2YHC+NTZWs/HWexwfDLFRad9gpJSqs/egEMNOU6MiEMULrKumUZknJBBNr3ZfSJMeLS
 s3rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=OiMCk3HNlA+VYlmzK8C7KfB3ijS3pxsMTQRh/DwJS98=;
 b=C3TbRhATO5eZe2prySBYFrllgj9/loDnwWqX12m8Vuh1EGokBcxWLmUXy22IG6MlzG
 r6HXsjhvq7HVxMDkiWYtzY+aciGz/vmV6ZMKKJOOC9mz6ftRVxYQpZJtF1xF0orTfHeR
 0a2d5yFJf2KHel70oFDItuDdb7ywdfNzXVUXqAZxvqkuiEWkpJk2Th7niDfsss0rTQNk
 rmqdC0ZqKKqdKQtUs2UgmJCcTQARuW7esfpRpq0IKdqHjCWTEbxzmuVLk+uQMi+w+TVf
 KhZtqx4Mo2/D2Ssug8QbiVZ10c2uHnI9DtXacRXT1ymS5pmDuAwA5cXEykJKNkRMpy5I
 kmzQ==
X-Gm-Message-State: APjAAAX67/ZvpNlqO/jXk0s2kB5BmX9Muw2cxfDTUnlt7UQpj3mO7Kg5
 3kcyQ7d7rmXstxPBIgQsors=
X-Google-Smtp-Source: APXvYqwp1PutHtvP0hC+zOIRQmLP5aOwlkctuCUXhYERECa9pdF/NW68x0lKYXiMUZqTtWJAUoo97w==
X-Received: by 2002:a17:90a:26e1:: with SMTP id
 m88mr5108116pje.101.1581097120913; 
 Fri, 07 Feb 2020 09:38:40 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id c19sm3803503pgh.8.2020.02.07.09.38.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 07 Feb 2020 09:38:40 -0800 (PST)
Date: Fri, 7 Feb 2020 09:38:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: Re: [PATCH] powerpc: Fix CONFIG_TRACE_IRQFLAGS with CONFIG_VMAP_STACK
Message-ID: <20200207173839.GA8313@roeck-us.net>
References: <daeacdc0dec0416d1c587cc9f9e7191ad3068dc0.1581095957.git.christophe.leroy@c-s.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <daeacdc0dec0416d1c587cc9f9e7191ad3068dc0.1581095957.git.christophe.leroy@c-s.fr>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 07, 2020 at 05:20:57PM +0000, Christophe Leroy wrote:
> When CONFIG_PROVE_LOCKING is selected together with (now default)
> CONFIG_VMAP_STACK, kernel enter deadlock during boot.
> 
> At the point of checking whether interrupts are enabled or not, the
> value of MSR saved on stack is read using the physical address of the
> stack. But at this point, when using VMAP stack the DATA MMU
> translation has already been re-enabled, leading to deadlock.
> 
> Don't use the physical address of the stack when
> CONFIG_VMAP_STACK is set.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Fixes: 028474876f47 ("powerpc/32: prepare for CONFIG_VMAP_STACK")

Tested-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  arch/powerpc/kernel/entry_32.S | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
> index 77abbc34bbe0..0713daa651d9 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -214,7 +214,7 @@ transfer_to_handler_cont:
>  	 * To speed up the syscall path where interrupts stay on, let's check
>  	 * first if we are changing the MSR value at all.
>  	 */
> -	tophys(r12, r1)
> +	tophys_novmstack r12, r1
>  	lwz	r12,_MSR(r12)
>  	andi.	r12,r12,MSR_EE
>  	bne	1f
> -- 
> 2.25.0
> 
