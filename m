Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97742B8F8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 09:24:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTkYs1nLLz307l
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 18:24:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=I6w+qFwP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::42a;
 helo=mail-pf1-x42a.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=I6w+qFwP; dkim-atps=neutral
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTkYC5kWMz2xtQ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 18:23:57 +1100 (AEDT)
Received: by mail-pf1-x42a.google.com with SMTP id g14so1692041pfm.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 00:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=a+STDQupphuK/7Y3WCz3HFR7aiY2eZV5V/OCb+gsLGo=;
 b=I6w+qFwPBk9quxtMfcJjbCISh5NslqMD7RdikCpk68hT3HijzJ6U/NXdwAKbOum8vu
 vS3MxhZN9eoIgGDE3MBgTwkD9wwygGF3hFe/u5FZ9aYt5bDUp5/SKHaBIb9JSSrj/Eo+
 hIxM+4qao33lcbsDFkeMBUVK1pi5/3teC4vZw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=a+STDQupphuK/7Y3WCz3HFR7aiY2eZV5V/OCb+gsLGo=;
 b=Yz03afsNmPc+lyObfTnbFKoCuFY0G0mZcgglanZzncUppgMXwbkZbmksNdyK2+UUJC
 L4a/TMIVShMBBB4RKiYOBQKcNL1m/NEfffUjssyfz4ASqlsF2jv7m3B69UixE9DEgCrB
 0PMZNTG3fKNjt81vfkRwqIwpefLmeP/0zAWPIvXvgF+uNmsi3xPlnhq2nDty9Z+dv7r4
 zn48dAV7E8Ri3iliYeGp91tCFQua8w82H6A3aWcmBhz+fVHNR4fArm/aNbGYJWdWRVYv
 IlJdAQ3TcD6+c1blEyHp1P7Lc83WtHYtfhmaQnob+6bBHtVhDBXTf5esvZnb/SZQ9J+a
 cdqA==
X-Gm-Message-State: AOAM530YJ9dI41GsuLcfK5IOOGpBbmk+l+Ye5hHU8195RxHUsyIWZivy
 nTbvAl+Sj6A5M25oeLo+zaqMug==
X-Google-Smtp-Source: ABdhPJwUdjDXsZD6PJOkAL4X8A7lF2TLTDyO8KSYEbRyWhK7gdzTiI5rlXDwv4Yr1q/D3xOPKfxUmw==
X-Received: by 2002:a63:6c89:: with SMTP id h131mr16767067pgc.47.1634109834205; 
 Wed, 13 Oct 2021 00:23:54 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id t125sm3280014pfc.119.2021.10.13.00.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Oct 2021 00:23:53 -0700 (PDT)
Date: Wed, 13 Oct 2021 00:23:53 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 09/10] lkdtm: Fix lkdtm_EXEC_RODATA()
Message-ID: <202110130018.7B2129375@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <7da92e59e148bd23564d63bdd8bcfaba0ba6d1f1.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7da92e59e148bd23564d63bdd8bcfaba0ba6d1f1.1633964380.git.christophe.leroy@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>,
 linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 11, 2021 at 05:25:36PM +0200, Christophe Leroy wrote:
> Behind a location, lkdtm_EXEC_RODATA() executes a real function,
> not a copy of do_nothing().
>
> So do it directly instead of using execute_location().
>
> And fix displayed addresses by dereferencing the function descriptors.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  drivers/misc/lkdtm/perms.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/misc/lkdtm/perms.c b/drivers/misc/lkdtm/perms.c
> index 442d60ed25ef..da16564e1ecd 100644
> --- a/drivers/misc/lkdtm/perms.c
> +++ b/drivers/misc/lkdtm/perms.c
> @@ -153,7 +153,14 @@ void lkdtm_EXEC_VMALLOC(void)
>
>  void lkdtm_EXEC_RODATA(void)
>  {
> -	execute_location(lkdtm_rodata_do_nothing, CODE_AS_IS);
> +	pr_info("attempting ok execution at %px\n",
> +		dereference_symbol_descriptor(do_nothing));
> +	do_nothing();
> +
> +	pr_info("attempting bad execution at %px\n",
> +		dereference_symbol_descriptor(lkdtm_rodata_do_nothing));
> +	lkdtm_rodata_do_nothing();
> +	pr_err("FAIL: func returned\n");
>  }

(In re-reading this more carefully, I see now why kallsyms.h is used
earlier: _function_ vs _symbol_ descriptor.)

In the next patch:

static noinline void execute_location(void *dst, bool write)
{
...
       func = setup_function_descriptor(&fdesc, dst);
       if (IS_ERR(func))
               return;

       pr_info("attempting bad execution at %px\n", dst);
       func();
       pr_err("FAIL: func returned\n");
}

What are the conditions for which dereference_symbol_descriptor works
but dereference _function_descriptor doesn't?

--
Kees Cook
