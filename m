Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5816215BA3F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 08:47:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48J7rk3bGvzDqTQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 18:47:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=rasmusvillemoes.dk (client-ip=2a00:1450:4864:20::143;
 helo=mail-lf1-x143.google.com; envelope-from=linux@rasmusvillemoes.dk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.a=rsa-sha256 header.s=google header.b=biWiIy6c; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48J7pq16M3zDqT1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2020 18:45:37 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id n25so3568488lfl.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2020 23:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=tccHDFw8Be0tCiwLFmvqNHBCYLNSpms3aI/0Nu1Lkcw=;
 b=biWiIy6cSpYBYseYC5rG9zg0yZrhQDMcxudJjex+4XKfDJs5X9uRsoByIs3ZPg2On5
 jo9rIt6nZQenqD3JNRPCsh+HcCyg6TQGtIvpn6dorob+z2JtRRyIsV08SbF1Ftkt+eMX
 +sSnpaCuqr43G996HOyFc+XyiKQV+fRGDUvsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tccHDFw8Be0tCiwLFmvqNHBCYLNSpms3aI/0Nu1Lkcw=;
 b=bQvLWurjgpHBnjdnuuvXbk6kxJqg+SH7WsbhbwtvCRX8WqQFcL/eBAxAPkL/doh6k+
 8LU8RHyvHEfIzkVGYUFPvVCXdWoKOegMbwhutxrICWWdFgppzAhxwp/c42qUEZR35SlM
 pfT+EcQ4lpLVT+37lNOCRIECgrXWUA1gqnL/9dfgIAtCIwJNt7NCc+dwWdLsZjykQJh0
 c+U0Cw7wz6h1tJSDjnLihRb79AqIL54reDXJAk/B7IHobwrOjoNyxLG1rqLU7lMD0XNQ
 DKSXVJBtn3GHmni/LgOim2CqryLuPILs9RgWdPYsGqRb7x5WJrH3g/yLdnrdkFGgzxYZ
 avtA==
X-Gm-Message-State: APjAAAWSvYE4iRp/VlR1+TzuKukFapu6LWE7ggrWDUcP+8UR25vxrsfO
 Fu+5LtksB1lXUMPP3Ds6Kj9uvw==
X-Google-Smtp-Source: APXvYqw0quAloIVavV+0KAsCtOQX6LMqkFeiTVZoBqg/BRZSHx3nU8/X33CUk+TdrSB1k2JH4qEHWg==
X-Received: by 2002:ac2:5391:: with SMTP id g17mr6979327lfh.93.1581579930294; 
 Wed, 12 Feb 2020 23:45:30 -0800 (PST)
Received: from [172.16.11.50] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id h7sm745141lfj.29.2020.02.12.23.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Feb 2020 23:45:29 -0800 (PST)
Subject: Re: [Regression 5.6-rc1][Bisected b6231ea2b3c6] Powerpc 8xx doesn't
 boot anymore
To: Christophe Leroy <christophe.leroy@c-s.fr>, Li Yang <leoyang.li@nxp.com>, 
 Qiang Zhao <qiang.zhao@nxp.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <0d45fa64-51ee-0052-cb34-58c770c5b3ce@c-s.fr>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <f67f7566-24f2-9c71-36be-2e55ec436097@rasmusvillemoes.dk>
Date: Thu, 13 Feb 2020 08:45:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <0d45fa64-51ee-0052-cb34-58c770c5b3ce@c-s.fr>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 12/02/2020 15.24, Christophe Leroy wrote:
> Hi Rasmus,
> 
> Kernel 5.6-rc1 silently fails on boot.
> 
> I bisected the problem to commit b6231ea2b3c6 ("soc: fsl: qe: drop
> broken lazy call of cpm_muram_init()")
> 
> I get a bad_page_fault() for an access at address 8 in
> cpm_muram_alloc_common(), called from cpm_uart_console_setup() via
> cpm_uart_allocbuf()

Sorry about that. But I'm afraid I don't see what I could have done
differently - the patch series, including b6231ea2b3c6, has been in
-next since 20191210, both you and ppc-dev were cc'ed on the entire
series (last revision sent November 28). And I've been dogfooding the
patches on both arm- and ppc-derived boards ever since (but obviously
only for a few cpus).

> Reverting the guilty commit on top of 5.6-rc1 is not trivial.
> 
> In your commit text you explain that cpm_muram_init() is called via
> subsys_initcall. But console init is done before that, so it cannot work.

No, but neither did the code I removed seem to work - how does doing
spin_lock_init on a held spinlock, and then unlocking it, work? Is
everything-spinlock always a no-op in your configuration? And even so,
I'd think a GFP_KERNEL allocation under spin_lock_irqsave() would
trigger some splat somewhere?

Please note I'm not claiming my patch is not at fault, it clearly is, I
just want to try to understand how I could have been wrong about the
"nobody can have been relying on it" part.

> Do you have a fix for that ?

Not right now, but I'll have a look. It's true that the patch probably
doesn't revert cleanly, but it shouldn't be hard to add back those few
lines in the appropriate spot, with a big fat comment that this does
something very fishy (at least as a temporary measure if we don't find a
proper solution soonish).

Rasmus
