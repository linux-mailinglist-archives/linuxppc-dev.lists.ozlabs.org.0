Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7642D42BBA3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 11:31:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTnNR11ycz3c85
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 20:31:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZVG9fsei;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=ZVG9fsei; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTjjG44scz2xtv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 17:45:52 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id g9so1117544plo.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 23:45:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=w0j2Ihdi/0685L8FT6WteZp6O1hKULY2lNZfHOgIHSc=;
 b=ZVG9fseiMJi5y7uNc0U//uB9qmTc4gJH0ueiRXhntI+xclAF1mY0ZabBN0HENHjmuQ
 Wd2tZE7h7XcVk1DbOBPcKKRzFh73LE1iY97UMVdM/LDFC8CDxtoZ3SUXBlDw8iyhvu6V
 muglMpS8KRkUeK+EwwJZIYurw/HXNEkgWVJds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=w0j2Ihdi/0685L8FT6WteZp6O1hKULY2lNZfHOgIHSc=;
 b=nKXSbFvpcHPUsTAJIStNUBmAHKRUxj0a8mvTUyvx9EgrloxdTVNLAo7ERmpsRQFEDm
 gT9C7k6azYG1FxTTJTkQogyQgGKcb5/8R9xdIFmqfLEVvlYhLSfAlA6Ei2wUB0nz4fID
 81zZRXIW0NUVJNVFHXfpSOlkuLhnTwdc3dwlzBW10o2e5feNg6PhobVgbM7/FUrYNgpy
 QgopOPkyJsD4jwXgTj34XUdB9TqyWRm5VOczg5oIKM7WNgVrOAwfjvTVr7V4/ZJJgWA5
 67uOO6T+LQ77bfdp+6dqODlTkctsgVH9vKWkMuVseb2EeLq1DDmVNOzzUOHclgfxXqob
 zjIg==
X-Gm-Message-State: AOAM5324rS/0PvFPEpdiGhCCGtaROQmKRlaXXHb07Pc/3ut8L7wXFAXV
 i2aqxl4KwsFMMrZhD7Rc133LCw==
X-Google-Smtp-Source: ABdhPJzjo8AWROfTHh1Xk5YI6pRx05t7IBlItdI3oMMrcEgEqW1hgXJ6mKwWSXyPV/CEcnXRlFzD6Q==
X-Received: by 2002:a17:90b:1c8f:: with SMTP id
 oo15mr11233854pjb.169.1634107548649; 
 Tue, 12 Oct 2021 23:45:48 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id i124sm13247931pfc.153.2021.10.12.23.45.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:45:48 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:45:47 -0700
From: Kees Cook <keescook@chromium.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH 2/2] kbuild: use more subdir- for visiting subdirectories
 while cleaning
Message-ID: <202110122345.4B8FE35AED@keescook>
References: <20211013063622.548590-1-masahiroy@kernel.org>
 <20211013063622.548590-2-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211013063622.548590-2-masahiroy@kernel.org>
X-Mailman-Approved-At: Wed, 13 Oct 2021 20:30:31 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, linux-mips@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Rich Felker <dalias@libc.org>,
 Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 linux-riscv@lists.infradead.org, Vincent Chen <deanbo422@gmail.com>,
 Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Paul Mackerras <paulus@samba.org>, Jonas Bonn <jonas@southpole.se>,
 Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Marc Zyngier <maz@kernel.org>, Helge Deller <deller@gmx.de>,
 linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 Ley Foon Tan <ley.foon.tan@intel.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linux-alpha@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-parisc@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Matt Turner <mattst88@gmail.com>,
 linux-snps-arc@lists.infradead.org, uclinux-h8-devel@lists.sourceforge.jp,
 linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>,
 Robert Richter <rric@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linux-kbuild@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Nathan Chancellor <nathan@kernel.org>, linux-m68k@lists.linux-m68k.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Richard Henderson <rth@twiddle.net>,
 William Cohen <wcohen@redhat.com>, Chris Zankel <chris@zankel.net>,
 Michal Simek <monstr@monstr.eu>, Michal Marek <michal.lkml@markovi.net>,
 Julien Thierry <jthierry@redhat.com>, Nick Hu <nickhu@andestech.com>,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 openrisc@lists.librecores.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Borislav Petkov <bp@alien8.de>, Vineet Gupta <vgupta@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 x86@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 13, 2021 at 03:36:22PM +0900, Masahiro Yamada wrote:
> Documentation/kbuild/makefiles.rst suggests to use "archclean" for
> cleaning arch/$(SRCARCH)/boot/.
> 
> Since commit d92cc4d51643 ("kbuild: require all architectures to have
> arch/$(SRCARCH)/Kbuild"), we can use the "subdir- += boot" trick for
> all architectures. This can take advantage of the parallel option (-j)
> for "make clean".
> 
> I also cleaned up the comments. The "archdep" target does not exist.
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>

I like the clean-up!

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
