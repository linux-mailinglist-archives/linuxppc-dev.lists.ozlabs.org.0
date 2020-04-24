Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AA3941B6FA0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 10:15:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 497n6v3kNjzDqPg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Apr 2020 18:15:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::342;
 helo=mail-ot1-x342.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lKqcmeOk; dkim-atps=neutral
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 497n4S6BN6zDr7Q
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 18:13:44 +1000 (AEST)
Received: by mail-ot1-x342.google.com with SMTP id i27so10980027ota.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Apr 2020 01:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9dfPGeraK4o9r9iyl1y9Yo9qcc+FG0ESeUD3dyGuhgw=;
 b=lKqcmeOkeMm+YlfFoMTIdJDvtKNH+Net4lPcCtsnDIMy8AYfmPOyLS7SjO9jqlA6jn
 6+xhYwft+NCvscdw3ralt+caYFm0+slGDekfbXJaHPIWBQhraB+tdFeBjONWh56dzgD+
 TDITSMnq8iuveCIEjf0Rs3SQ/So3vKcQ88xKBjdhSYlrgetgm5VDAjQdN/D+esGtwVGk
 lDa7aJEeJ/A7zURoHz9+iq3BUIDArPdRmuzvaOd/NhY9Dt9jjkgX7JqDjW+ieqfiJkyf
 oH7LQMfP7+x+opJL0UWTex3zfvr6S38Ritft8+wtGa5T5Fcua/Dm3jsFQ0dG9Pgfg+kM
 NZxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=9dfPGeraK4o9r9iyl1y9Yo9qcc+FG0ESeUD3dyGuhgw=;
 b=WkCokWcm946tTfnB/hIN41iFQP7tp/wmgTd/uaJ03mdd7UqNzVthhqKmbEY/YJLwTH
 A+pBooclbJ2sgXGs++GOQWsISlAMeUhNFQnf7imnYhr0PqeO76AQlrFct3bz/nd1/j8z
 IXN3qPJCC9Z238VazZnQUNkEuy51S009TI7KRdlQwmSXqBtVv0VAHIGHXgtuhBGfB4lx
 hDv1iHjl2X3eda+2qqRhIFWJn//DNGvBXzNhIGK6Vk4IRIWGzuw78kun/merbAWSsKYX
 ow6Y96/NzE9QnT17eK3rog7A+L5sZGwmnNdO6D6vgLu7pAof+N7ayv4LVrgQOdoGl69d
 ZCWw==
X-Gm-Message-State: AGi0PuZgtLGEvjvtoJAh5+RXQAIPPKxIjfaSd+7HuCsFipKMFg0pnIL9
 dbKumZJcXj0Gu36LrWyi+Es=
X-Google-Smtp-Source: APiQypKJ2YOD8oDhU3sz3jK6pjD1VxIjJeE5OARyrPPZk06XM//yOeioy1T+fqu3r56/K4rAh4OOIQ==
X-Received: by 2002:aca:b487:: with SMTP id d129mr6408822oif.115.1587716020784; 
 Fri, 24 Apr 2020 01:13:40 -0700 (PDT)
Received: from ubuntu-s3-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id m189sm271658oig.12.2020.04.24.01.13.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 24 Apr 2020 01:13:40 -0700 (PDT)
Date: Fri, 24 Apr 2020 01:13:38 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] lib/mpi: Fix building for powerpc with clang
Message-ID: <20200424081338.GA32106@ubuntu-s3-xlarge-x86>
References: <20200413195041.24064-1-natechancellor@gmail.com>
 <20200414135731.GA8766@gondor.apana.org.au>
 <20200423163602.GA18872@ubuntu-s3-xlarge-x86>
 <87eesdh8hy.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87eesdh8hy.fsf@mpe.ellerman.id.au>
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
Cc: Herbert Xu <herbert@gondor.apana.org.au>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kbuild test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 24, 2020 at 01:23:37PM +1000, Michael Ellerman wrote:
> Nathan Chancellor <natechancellor@gmail.com> writes:
> > On Tue, Apr 14, 2020 at 11:57:31PM +1000, Herbert Xu wrote:
> >> On Mon, Apr 13, 2020 at 12:50:42PM -0700, Nathan Chancellor wrote:
> >> > 0day reports over and over on an powerpc randconfig with clang:
> >> > 
> >> > lib/mpi/generic_mpih-mul1.c:37:13: error: invalid use of a cast in a
> >> > inline asm context requiring an l-value: remove the cast or build with
> >> > -fheinous-gnu-extensions
> >> > 
> >> > Remove the superfluous casts, which have been done previously for x86
> >> > and arm32 in commit dea632cadd12 ("lib/mpi: fix build with clang") and
> >> > commit 7b7c1df2883d ("lib/mpi/longlong.h: fix building with 32-bit
> >> > x86").
> >> > 
> >> > Reported-by: kbuild test robot <lkp@intel.com>
> >> > Link: https://github.com/ClangBuiltLinux/linux/issues/991
> >> > Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> >> 
> >> Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
> >> -- 
> >> Email: Herbert Xu <herbert@gondor.apana.org.au>
> >> Home Page: http://gondor.apana.org.au/~herbert/
> >> PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt
> >
> > Might be better for you to take this instead. 0day just tripped over
> > this again.
> 
> Sorry I missed the ack. Will pick it up today.
> 
> cheers

Thank you!

Cheers,
Nathan
