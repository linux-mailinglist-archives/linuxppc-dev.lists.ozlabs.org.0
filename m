Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F133A62CFA9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 01:32:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCLTV68wgz3cLs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 11:32:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=noLKefdE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=keescook@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=noLKefdE;
	dkim-atps=neutral
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCLSX4nsDz3cJv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 11:31:22 +1100 (AEDT)
Received: by mail-pl1-x629.google.com with SMTP id p12so111165plq.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Nov 2022 16:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bfYTHCNCtdWeHJf9pplhisQ2FfqYgZ1s/D8ukZJ0aF0=;
        b=noLKefdE/A5/nbmTvR6mJw3cGxk/a7fIL83IBp5Ph1Sax30+McHCvDQ9202nLf5uce
         hPc2gZOe0LsvudzlGDyBmEAgwDGtCwPT27+S6nCdQzTHR81ueFyHGEG25Bj0t5HJUYw6
         csu11i/pEoPga4S6lvqc8FbzvURZMsHN35+PY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bfYTHCNCtdWeHJf9pplhisQ2FfqYgZ1s/D8ukZJ0aF0=;
        b=eErI5S6iS74VhyE9lWUPAPKnYp+GhiWy/wkPNWi0XCUsg5F3/+9IWxXjQ8EDVoUZvF
         ZEyw6kGpJfkSAtsI0+AU4pcB9zfltywx3kfRvhbrBXpDCz/THELZAUSc9ZlEj2cW5kmm
         0w3DlGDmsQWlNaNnwp9EUN2hQ4rhZW/Xz1ZpCloj9Zblg+pzvFNmrbeToMM0m7jPywZG
         oGSbWMJhZTEapJasMrXmeY+BoAPr75D1jsR3U+wWijVvaBQHTPfBi9ZZ/k4ifjfdK0Fv
         85SWrULFlFRihj3icHsl6QyJ+1TmEJG0roj2aAoAKhHgnWDKeiQcYsuwqDpSe2FqX48A
         7XZA==
X-Gm-Message-State: ANoB5pnWpUIDCG9PWfwI9wvBXGMuc8W2b1bogZdz4k0wnnMqYpWK78BT
	r6Si/6T45Zj8WVhFfTIvKsCTGA==
X-Google-Smtp-Source: AA0mqf5LCeBMlQYf9iRokqtAPq5JSpm9R+EnXlxq59oA8dqbtgC+he2PCZJy9QgLdGN/YL6SFM4OFA==
X-Received: by 2002:a17:90a:6949:b0:213:188c:158d with SMTP id j9-20020a17090a694900b00213188c158dmr343097pjm.11.1668645079035;
        Wed, 16 Nov 2022 16:31:19 -0800 (PST)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id s1-20020a170902ea0100b00174f61a7d09sm12946657plg.247.2022.11.16.16.31.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 16:31:18 -0800 (PST)
Date: Wed, 16 Nov 2022 16:31:18 -0800
From: Kees Cook <keescook@chromium.org>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: [PATCH v2 3/3] treewide: use get_random_u32_between() when
 possible
Message-ID: <202211161628.164F47F@keescook>
References: <20221114164558.1180362-1-Jason@zx2c4.com>
 <20221114164558.1180362-4-Jason@zx2c4.com>
 <202211161436.A45AD719A@keescook>
 <Y3V4g8eorwiU++Y3@zx2c4.com>
 <Y3V6QtYMayODVDOk@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y3V6QtYMayODVDOk@zx2c4.com>
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
Cc: "Darrick J . Wong" <djwong@kernel.org>, patches@lists.linux.dev, netdev@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>, ydroneaud@opteya.com, Herbert Xu <herbert@gondor.apana.org.au>, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Jason Gunthorpe <jgg@nvidia.com>, Catalin Marinas <catalin.marinas@arm.com>, Jakub Kicinski <kuba@kernel.org>, linux-mips@vger.kernel.org, linux-media@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Jani Nikula <jani.nikula@linux.intel.com>, linux-block@vger.kernel.org, SeongJae Park <sj@kernel.org>, loongarch@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Theodore Ts'o <tytso@mit.edu>, linux-parisc@vger.kernel.org, "Martin K . Petersen" <martin.petersen@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mmc@vger.kernel.org, linux-kerne
 l@vger.kernel.org, Christoph =?iso-8859-1?Q?B=F6hmwalder?= <christoph.boehmwalder@linbit.com>, linux-crypto@vger.kernel.org, Sakari Ailus <sakari.ailus@linux.intel.com>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 17, 2022 at 01:03:14AM +0100, Jason A. Donenfeld wrote:
> On Thu, Nov 17, 2022 at 12:55:47AM +0100, Jason A. Donenfeld wrote:
> > 2) What to call it:
> >    - between I still like, because it mirrors "I'm thinking of a number
> >      between 1 and 10 and..." that everybody knows,
> >    - inclusive I guess works, but it's not a preposition,
> >    - bikeshed color #3?
> 
> - between
> - ranged
> - spanning
> 
> https://www.thefreedictionary.com/List-of-prepositions.htm
> - amid
> 
> Sigh, names.

I think "inclusive" is best. The other words still don't provide
unambiguous language. It's the language used in formal math, e.g.
sigma-notation, etc. It's an adjective for "get random" (verb, noun).

-- 
Kees Cook
