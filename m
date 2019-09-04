Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E91A2A77DF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 02:26:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NPkL5X0qzDqm9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 10:26:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::342; helo=mail-wm1-x342.google.com;
 envelope-from=natechancellor@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="s823D9jM"; 
 dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NPhB1ygBzDqV6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 10:24:07 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id n2so1440254wmk.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 17:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=+kGji0iEqvX2PbYbdW45C9GxA697L85/6dAAQKl+YqI=;
 b=s823D9jMikjUnE0COKWdQm/5U4/NnfIueifeneGq16e97vNfIELcg2uISDJC5H8Osu
 mkf7end+YfLLnME+nIbdTcGf8L3mr/WrKyX/l1DiTowgansH74ndS7WLYnhy0hQO9F0K
 N8xC0HX2mYKW+Mkv4YnyZkRNwM5jTY+He1FfAeVw6hAI+S1FcM/X1C3HuOz+V1yyGQu5
 HaphnnucdoJtfT4Ljfx7+pXTfb8COZztaEZ5RJ2wOavoaxjWqCx2lIYg/QA7gpTWlBYL
 s820/Lyd8uH5qB7MhN1eK/MGWtG3lExath8vlfPqIsMpi25nX3PJgc9sv/129uVc+1Ia
 tdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+kGji0iEqvX2PbYbdW45C9GxA697L85/6dAAQKl+YqI=;
 b=TJ913SP1+ohkx5UenQHquP7Fi0eW/RqnksbEZJPtgdv2IKnxecRK030IWm0wGb9ucH
 J/pDHxrfUb+e6dSOm4NfRDhOJdyl5kWroQkgcI8d2lDoEHhmSeFDSWTzBhCHOqDQ9ATi
 zqfdmQaFLKUuII5h2Odm6ppURu6ACcKo3zzUXbRpvaMt4Dfg/yZwV9MCnP6po3+6HF6Y
 0JPyt4bHfZ7x3NofI+yhwrzirlaCbma4eZIinva+XJiQ4NIqMT3YGEPfkdKdmeMnDjAc
 4rYrLUSNWH21O4rwflp3IOy5jqFXyn3vcXudvzG+6Tf5JQ+KVD/YO3Kq2cpZsFPOV7zA
 FgPg==
X-Gm-Message-State: APjAAAVWruSndQf1tg3kU1Prp/Ai4//Wk48OnUN6LLwdIhS0hGnvcc8G
 DBBAZc+D1lVC9X6FGGLx1Ac=
X-Google-Smtp-Source: APXvYqyRT9H5yO3lBr9uzkfqAogtNcUrdzoodQwtPgDJnVgYlLavOlowlxIb5ZUBH6+0p1L8IqP6Sg==
X-Received: by 2002:a1c:4c06:: with SMTP id z6mr1965649wmf.47.1567556643727;
 Tue, 03 Sep 2019 17:24:03 -0700 (PDT)
Received: from archlinux-threadripper ([2a01:4f8:222:2f1b::2])
 by smtp.gmail.com with ESMTPSA id b26sm1242242wmj.14.2019.09.03.17.24.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 17:24:03 -0700 (PDT)
Date: Tue, 3 Sep 2019 17:24:01 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Avoid clang warnings around setjmp and longjmp
Message-ID: <20190904002401.GA70635@archlinux-threadripper>
References: <20190812023214.107817-1-natechancellor@gmail.com>
 <878srdv206.fsf@mpe.ellerman.id.au>
 <20190828175322.GA121833@archlinux-threadripper>
 <CAKwvOdmXbYrR6n-cxKt3XxkE4Lmj0sSoZBUtHVb0V2LTUFHmug@mail.gmail.com>
 <20190828184529.GC127646@archlinux-threadripper>
 <6801a83ed6d54d95b87a41c57ef6e6b0@AcuMS.aculab.com>
 <20190903055553.GC60296@archlinux-threadripper>
 <20190903193128.GC9749@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190903193128.GC9749@gate.crashing.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>, "# 3.4.x" <stable@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 David Laight <David.Laight@aculab.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 03, 2019 at 02:31:28PM -0500, Segher Boessenkool wrote:
> On Mon, Sep 02, 2019 at 10:55:53PM -0700, Nathan Chancellor wrote:
> > On Thu, Aug 29, 2019 at 09:59:48AM +0000, David Laight wrote:
> > > From: Nathan Chancellor
> > > > Sent: 28 August 2019 19:45
> > > ...
> > > > However, I think that -fno-builtin-* would be appropriate here because
> > > > we are providing our own setjmp implementation, meaning clang should not
> > > > be trying to do anything with the builtin implementation like building a
> > > > declaration for it.
> > > 
> > > Isn't implementing setjmp impossible unless you tell the compiler that
> > > you function is 'setjmp-like' ?
> > 
> > No idea, PowerPC is the only architecture that does such a thing.
> 
> Since setjmp can return more than once, yes, exciting things can happen
> if you do not tell the compiler about this.
> 
> 
> Segher
> 

Fair enough so I guess we are back to just outright disabling the
warning.

Cheers,
Nathan
