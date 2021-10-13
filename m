Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 483C642B83B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 08:59:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HTk1G67Dpz30Bl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Oct 2021 17:59:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iYoXg2tr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=iYoXg2tr; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HTk0Z68Zpz2xt5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Oct 2021 17:59:08 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id a73so1451521pge.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 23:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ah8mNtDhQsWbV9KwnesQGFpsH5Aqgy4h8sZPRodsuTQ=;
 b=iYoXg2tr5uR+0Nm6/7bv2feTzNboP5MoWc+N3Mcwv2iDRVw0pFvhxWOd61gJnNH9su
 tIqFIxnUdQlKPtmJqrQ8BNteu39zfQaWMQasygpt32FcCdo7pqlDFdgKgPrXyx3AptwM
 zkZxhWFgsqIFBb3TLt1dhhopIbTg0apkRywBY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ah8mNtDhQsWbV9KwnesQGFpsH5Aqgy4h8sZPRodsuTQ=;
 b=IN8GTM5T6kgILEehb8l+dUG+FeWyIIqljwhH16qjrjSz6K7iw41dLzsMOwioXk4Aeo
 ykhg2ySpFjpofaAOw3mgSrqDzGeXmXrTpjXU5K5SGsDA3J2IQ2AwHV6gMK+zdQE7f77T
 EtNgPQUv2lzjvXErLyJA8DjewspGMXoCQL8wpIbZSI1aTZOpHJoO8ec74QMVYUadZSuD
 QGB6O80C+h6h9wAPSJ9l4R2LZTCXM7ldYiaFU3JrwbmfIWItHPgXO6MFWcs0E67VqCUj
 JRiVA7EfHh4g2hqiTF4GeE17Jbajlrcz1XJcXb9ZLaCT9/4JBjFMZ5pDFgtXV8oqczyn
 j/pQ==
X-Gm-Message-State: AOAM532sVtmWpzNTJ2u5HE7KV30SfvgK6RlLjoTzgVpSGbDLrXZaFxVy
 KU610hfaEHng99BXwmP4Yl/JuQ==
X-Google-Smtp-Source: ABdhPJzillT6hQ4qfjxKjNb7ySoarsV30yXxp2Jky0yj9b4NY2jS3CPORXAf7y3D7ilwslclDlQbpA==
X-Received: by 2002:a62:188c:0:b0:44d:6660:212b with SMTP id
 134-20020a62188c000000b0044d6660212bmr1056541pfy.8.1634108343817; 
 Tue, 12 Oct 2021 23:59:03 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id n21sm1086528pfv.115.2021.10.12.23.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 23:59:03 -0700 (PDT)
Date: Tue, 12 Oct 2021 23:59:02 -0700
From: Kees Cook <keescook@chromium.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v1 01/10] powerpc: Move 'struct ppc64_opd_entry' back
 into asm/elf.h
Message-ID: <202110122358.4AFDC0BC7@keescook>
References: <cover.1633964380.git.christophe.leroy@csgroup.eu>
 <8ff3ec195d695033b652e9971fba2dc5528f7151.1633964380.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8ff3ec195d695033b652e9971fba2dc5528f7151.1633964380.git.christophe.leroy@csgroup.eu>
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

On Mon, Oct 11, 2021 at 05:25:28PM +0200, Christophe Leroy wrote:
> 'struct ppc64_opd_entry' doesn't belong to uapi/asm/elf.h
> 
> It was initially in module_64.c and commit 2d291e902791 ("Fix compile
> failure with non modular builds") moved it into asm/elf.h
> 
> But it was by mistake added outside of __KERNEL__ section,
> therefore commit c3617f72036c ("UAPI: (Scripted) Disintegrate
> arch/powerpc/include/asm") moved it to uapi/asm/elf.h
> 
> Move it back into asm/elf.h, this brings it back in line with
> IA64 and PARISC architectures.
> 
> Fixes: 2d291e902791 ("Fix compile failure with non modular builds")
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

I'd agree with Arnd: this is a reasonable cleanup and nothing should be
using it.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
