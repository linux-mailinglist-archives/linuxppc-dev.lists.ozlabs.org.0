Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E62714249EC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 00:38:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPq9S5pbQz2ywY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 09:38:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=FIrtOed5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=shorne@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=FIrtOed5; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPq8q0SmCz2yL7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 09:37:46 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id x4so2643926pln.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Oct 2021 15:37:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=u2ABEJkCd1WJjIKZz+HrMsC2GEgILkJNEDXWHfmz6WM=;
 b=FIrtOed5QowKUvESH0rG0wvV+3jKddQCuuIuBfhHRTk8T8VmPDFwv1/sTJAAFMgoXe
 HXkN7YWXjhF/zrR2F/U+/MkjdMr28Eiiif61PM8lgdzeGlwKVNoy3cZO3oVwxlf1y4Qq
 ML0Zxd6olLxMEd7tbUGjRpK/R7cb1ynklKOEnOsKGuHS+AR9eM3gQhrSgwrpbIXxDltH
 O/Ru0l0Mwm5WP0mW7srNV2jrlVjnmHbcXmHAwvScFtyDBwPixATxWKZZPvwE9Leemq7b
 /FuyLrO0jdPkAaWnvyISUJPK4unL1H92dmReVh6yyqBPX6EVv7yFmcldM3IfxchdNGsR
 dHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u2ABEJkCd1WJjIKZz+HrMsC2GEgILkJNEDXWHfmz6WM=;
 b=u3RhE3MOPkTJd5rYNFFRjfQcmn5iidWxp1V5cexCH5FXTG9I1687Ui2nOP95cVTtzp
 CCAXrzMZxBqH3cLY2EhfGGJwtYxKfcZ1003dsuea4TEXyj6vwIiHd2ZZNjtOquV2RdfX
 2lAy5gi5rzRzHW8sUNQMD1wG8m+f0eBuOM9trAIF9ZNLyqmOHp6+G9MDapZ48lmoD0BD
 ugn+SjuNEOylHnE7KKwnw0dYFY+oDVwaqi5TJQuRrGRl+ze1U9pDcDSIzI8aoPLklYJJ
 a6FQgmZSM3W06iYql3Zr6n+NDIbt8iEJGmUWLkeibJ79nqISC95RTlXQcDRglxk4HIlh
 JyFA==
X-Gm-Message-State: AOAM5314vcR7oaLOmv1SCgN1nv+PgU+DORCln9mv7LE7g6NOE4Y18HJe
 iGmEdLhKHSIcOi2ohaqVXfY=
X-Google-Smtp-Source: ABdhPJz4BaWTMOr4ZP31Nn4C5AszSnkpRS3L0Y1gfKAehJA2FRUXByCD1kztbcVi2shP0MV6GW1oQQ==
X-Received: by 2002:a17:90b:1804:: with SMTP id
 lw4mr830200pjb.174.1633559862671; 
 Wed, 06 Oct 2021 15:37:42 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
 by smtp.gmail.com with ESMTPSA id c18sm20848814pge.69.2021.10.06.15.37.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 15:37:41 -0700 (PDT)
Date: Thu, 7 Oct 2021 07:37:39 +0900
From: Stafford Horne <shorne@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 06/12] openrisc: Use of_get_cpu_hwid()
Message-ID: <YV4lM/YJ4V4EAlZb@antec>
References: <20211006164332.1981454-1-robh@kernel.org>
 <20211006164332.1981454-7-robh@kernel.org> <YV4KkAC2p9D4yCnH@antec>
 <20211006212728.GM10333@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211006212728.GM10333@gate.crashing.org>
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
Cc: Rich Felker <dalias@libc.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Jonas Bonn <jonas@southpole.se>, Rob Herring <robh@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 linux-csky@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 bcm-kernel-feedback-list@broadcom.com, James Morse <james.morse@arm.com>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Ray Jui <rjui@broadcom.com>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 Yoshinori Sato <ysato@users.osdn.me>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Segher,

On Wed, Oct 06, 2021 at 04:27:28PM -0500, Segher Boessenkool wrote:
> On Thu, Oct 07, 2021 at 05:44:00AM +0900, Stafford Horne wrote:
> > You have defined of_get_cpu_hwid to return u64, will this create compiler
> > warnings when since we are storing a u64 into a u32?
> > 
> > It seems only if we make with W=3.
> 
> Yes.  This is done by -Wconversion, "Warn for implicit conversions that
> may alter a value."

Yeah, that is what I found out when I looked into it.

> > I thought we usually warned on this.
> 
> This warning is not in -Wall or -Wextra either, it suffers too much from
> false positives.  It is very natural to just ignore the high bits of
> modulo types (which is what "unsigned" types *are*).  Or the bits that
> "fall off" on a conversion.  The C standard makes this required
> behaviour, it is useful, and it is the only convenient way of getting
> this!

Thanks for the background, It does make sense. I guess I was confused with java
which requires casting when you store to a smaller size.  I.e.

    Test.java:5: error: incompatible types: possible lossy conversion from int to short
	s = i;

-Stafford
