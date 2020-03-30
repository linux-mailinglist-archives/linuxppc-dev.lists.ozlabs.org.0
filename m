Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E9419760F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 09:59:38 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rPxg3tkmzDqNb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 18:59:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::242;
 helo=mail-oi1-x242.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eprL7mwr; dkim-atps=neutral
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com
 [IPv6:2607:f8b0:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rPvk68lhzDqWt
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 18:57:54 +1100 (AEDT)
Received: by mail-oi1-x242.google.com with SMTP id u20so10167715oic.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 00:57:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+ipscCDhCltPMVSXcwaABkat0P1XLNamIU3q22ca/b4=;
 b=eprL7mwrrsjCnp/4zHjc/j1s9AJgIbn7qTQgEjaMpAPLqQSM2S7IFpN7J4j+e9uZz7
 0g2S1iDnBRmuq2ib0noJraYxCDZR98cIBrMdSWT2hEBhgeWxj08mG5X7KZYmyXJPCU0i
 KynIoAHVq9sLwieMz5eFTLTcNKchCG0BcUG9XpBZYKkRcX6mijmWMaE6xWuO/aHaxpGE
 5jgXZh4nIWuYxBob3+SW8ZhCCE/Cy+UvFXkMCNGS/LZBNscbBuiJd6YC9A6xKTjNK3zG
 spPnbJCX3qgRTyZUOc0S5pKc9LTZYqP2N3h9XcBRC/s40pHLopVUYpdRiyZv6XGvTrti
 j3kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+ipscCDhCltPMVSXcwaABkat0P1XLNamIU3q22ca/b4=;
 b=RtBcDruTGOCvFKsmN0KqLorHGfpwd5bk/04ZlXn/hbeE0ErYpcaFUukWbYuIGntZkC
 LXjvKqXvbBjciMbJAwt2Oe7DPo/5IE2+Kn3OJg6jAtFljsBCcTUWN2nA9thig1efQta7
 8gIPyxQOKTwbCXcIZ2/AdYoSDCb21Th1m5pGS7TZrLf+2TsIGjqQfuXCCEBfbYFreRIC
 MNil1rH6oGIhVMaXeiCj4GDJSie0C9FEbeARyA0Yia4rQMqPDEEAQJqU0bg4bugXFyvZ
 gPO9nUFo3wPYKH5CFVWBCSj5zqiCbba+fbcVpf10896UJMSZzFVsXnAr4Qn7yVySBlf4
 XyZA==
X-Gm-Message-State: ANhLgQ3QNO7iw4NHT81WTZfCPJNkRsjW+8UhGkSCmCBYlwuMToiIdrqE
 EqOQ/zNwzmEz3Gjf3crVYuk=
X-Google-Smtp-Source: ADFU+vtrqQS7LDW0ZaqXWmRdN1F1p47K+hiXfWjqZgJQouPW+xEwSglG1RNMjCP/sRYf9Vt005/AZg==
X-Received: by 2002:aca:b854:: with SMTP id i81mr6490664oif.22.1585555070879; 
 Mon, 30 Mar 2020 00:57:50 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id o1sm4131334otl.49.2020.03.30.00.57.49
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 30 Mar 2020 00:57:50 -0700 (PDT)
Date: Mon, 30 Mar 2020 00:57:47 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Clement Courbet <courbet@google.com>
Subject: Re: [PATCH v2] powerpc: Make setjmp/longjmp signature standard
Message-ID: <20200330075747.GA19343@ubuntu-m2-xlarge-x86>
References: <20200327100801.161671-1-courbet@google.com>
 <20200330064323.76162-1-courbet@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200330064323.76162-1-courbet@google.com>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, clang-built-linux@googlegroups.com,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 30, 2020 at 08:43:19AM +0200, Clement Courbet wrote:
> Declaring setjmp()/longjmp() as taking longs makes the signature
> non-standard, and makes clang complain. In the past, this has been
> worked around by adding -ffreestanding to the compile flags.
> 
> The implementation looks like it only ever propagates the value
> (in longjmp) or sets it to 1 (in setjmp), and we only call longjmp
> with integer parameters.
> 
> This allows removing -ffreestanding from the compilation flags.
> 
> Context:
> https://lore.kernel.org/patchwork/patch/1214060
> https://lore.kernel.org/patchwork/patch/1216174
> 
> Signed-off-by: Clement Courbet <courbet@google.com>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Tested-by: Nathan Chancellor <natechancellor@gmail.com>
> 
> ---
> 
> v2:
> Use and array type as suggested by Segher Boessenkool
> Cc: stable@vger.kernel.org # v4.14+
> Fixes: c9029ef9c957 ("powerpc: Avoid clang warnings around setjmp and longjmp")

Actual diff itself looks good but these two tags need to be above your
signoff to be included in the final changelog. Not sure if Michael will
want a v3 with that or if it can manually be done when applying.

Cheers,
Nathan
