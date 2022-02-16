Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC5E64B8DBC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 17:20:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzNVP3MHcz3cVL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 03:20:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=awiYRJK7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::534;
 helo=mail-pg1-x534.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=awiYRJK7; dkim-atps=neutral
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzNTh2w0Nz3089
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 03:20:05 +1100 (AEDT)
Received: by mail-pg1-x534.google.com with SMTP id 195so2565909pgc.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 08:20:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SUEK1OPatjz/xS89rOiQIJkojmQppC70TLq4uXsnOCU=;
 b=awiYRJK7xVss9qUlz/+ZAsH80T6s71tCIdTOeiyrQ0x99UFr0wnuctr63kQIRgErZp
 Pjfqzv1BqeebYXL4GcrP/MyMzdMDlGQjvfr6bbW2B//BH8jrUYt1XEZHs+OKMGfIVuiv
 RJpsPjfFgg4A8/+DgzM1yTr8QymR2qoNgB2u0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SUEK1OPatjz/xS89rOiQIJkojmQppC70TLq4uXsnOCU=;
 b=eGSYlRTaSFvYU8v04UCWGSpF0pUC+18Q5nh2Bw2FycbAZAgK8tjrPSJDk88T1XY1fA
 +b47hktHhqIffHn7Z6fWhPK8O77H0MNhZJDK+TcmbL7tDKv8k4VGtl5zgv9JQ8xwVenY
 CtrTmRipDnyXtjg0NxpV/7mIjZHJJ5SDY4Py14FW6LBjDTfkPo5xPmVYwWw6R0wq0hbX
 NQVYXltLWG3Me4DFkjP6C+qmDZU/1zr8wTYZ6xwOPgICE7dJEgk2yLnCY0Ju4FCsAZqj
 w1Qu+qI3YXDuCNY06wA8kUvo2Cplk5IqQtK8NsyB2AyxWXmcA2n6gO6voo4qmlNpVgTe
 eolw==
X-Gm-Message-State: AOAM533FgB+rXH0hE/lYee2Eya5++QhhWEgZitHE+LMHzafjsPbhZ7B7
 PtHxHkGHqPRGoADS8lClDy+tfA==
X-Google-Smtp-Source: ABdhPJwkMae/H/K70R+Ctzw/galxZ1wgyt9T2ZBccthHmsi3muEDVk9x1KPlstE3Ys6++5ijnUTmdw==
X-Received: by 2002:a63:86:0:b0:36c:48e8:627e with SMTP id
 128-20020a630086000000b0036c48e8627emr2940332pga.53.1645028403498; 
 Wed, 16 Feb 2022 08:20:03 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id x4sm1535073pjq.2.2022.02.16.08.20.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 08:20:03 -0800 (PST)
Date: Wed, 16 Feb 2022 08:20:02 -0800
From: Kees Cook <keescook@chromium.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v4 00/13] Fix LKDTM for PPC64/IA64/PARISC v4
Message-ID: <202202160818.7C3862B@keescook>
References: <cover.1644928018.git.christophe.leroy@csgroup.eu>
 <202202150807.D584917D34@keescook>
 <87y22bm25y.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87y22bm25y.fsf@mpe.ellerman.id.au>
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
 Helge Deller <deller@gmx.de>, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 16, 2022 at 11:22:33PM +1100, Michael Ellerman wrote:
> Kees Cook <keescook@chromium.org> writes:
> > On Tue, Feb 15, 2022 at 01:40:55PM +0100, Christophe Leroy wrote:
> >> PPC64/IA64/PARISC have function descriptors. LKDTM doesn't work
> >> on those three architectures because LKDTM messes up function
> >> descriptors with functions.
> >> 
> >> This series does some cleanup in the three architectures and
> >> refactors function descriptors so that it can then easily use it
> >> in a generic way in LKDTM.
> >
> > Thanks for doing this! It looks good to me. :)
> 
> How should we merge this series, it's a bit all over the map.
> 
> I could put it in a topic branch?

That's fine by me -- I had assumed it'd go via the ppc tree. But if
you'd rather I take it as a topic branch I can do that too.

-- 
Kees Cook
