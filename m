Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E0B38DFD0C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 07:17:23 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46y1wJ74lTzDqLS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2019 16:17:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::241;
 helo=mail-oi1-x241.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ab/j3x+f"; 
 dkim-atps=neutral
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46y1tH6bGkzDqJs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2019 16:15:35 +1100 (AEDT)
Received: by mail-oi1-x241.google.com with SMTP id s71so239720oih.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 22:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6rY2Wjoe2GHPPcQrTvZ8onLLc/wPWzZXs6sWpQV54Tw=;
 b=ab/j3x+fg+cZiHLu3xqUGr4m5ASYRpmL96jgg7Cxv17KIdEo23ZnGKI5FtlQqPRQpZ
 OzRSyHfgpgCJjKr6yv/lGLqF5i0LyAgJCLvb9jCXPQAfYjSVM4iu7chEOKWAPUlS+oa1
 SI0W467DTaXUKR40SCcbPTUrSW4GsVpShEF9XHpChvQ03IpaHhOJa5xatrikIN0+doI1
 tX0p6uKLXKC15E8nD7CDyXuAFbupnjUyOLSmIdSp1QBOzrSTtEywmaZassw5HbgupmO1
 1XpvcQVWVhBGlsmtc3CGAF/TsmB51iR3XvgG1K6xcmp5KoceyMuAIqSfNaRPTBosJ5hF
 zXKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6rY2Wjoe2GHPPcQrTvZ8onLLc/wPWzZXs6sWpQV54Tw=;
 b=qQNVunZL/w8cuHGFiPdUP+7hTdNIx5eY8rCqpDfQW2hB02PhMEqsksYKILOkuVYZ+r
 q0Baiv905674mE8n57fWQMHjEgsCD4F3EycEkm7iAfWpJw5N5eJjmKTRp/2ZZ6WKZg5M
 Wbzz3vn1VbnZaOTJGp9cSwreKSMP4N8DgBI5bguRq7Wbgyll+F2FfXIQcQq7QKf033BK
 lhncMmwPEU6miBj1DE2BQhQR4PKLn8ziqWxTN5fCGqKcSK4jd6WTKwdlHwo183EhbfnQ
 FEKecU6ZG/+FIsA/zF79wh3k3C/QQPf3UCo4v3rHczdqJ5+zV9CPLtI4PMaTlBeHYBfF
 F67Q==
X-Gm-Message-State: APjAAAWsVM52zqIy+v0pJb9W+fY1Xn/KAjMNO8BVMs7I0Ste8oYdj4+v
 uzQNF/VLxqydLzLZyXoGU5g=
X-Google-Smtp-Source: APXvYqyysJTAcB6ZzJCttmbfooVDtrC7YfJzT5YfjPwTR2JyhMcoWVGSp/baLb+hkx/xq7ZFdm7Msg==
X-Received: by 2002:a05:6808:b07:: with SMTP id
 s7mr1288447oij.162.1571721331706; 
 Mon, 21 Oct 2019 22:15:31 -0700 (PDT)
Received: from ubuntu-m2-xlarge-x86 ([2604:1380:4111:8b00::1])
 by smtp.gmail.com with ESMTPSA id k93sm4869194otc.30.2019.10.21.22.15.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 21 Oct 2019 22:15:31 -0700 (PDT)
Date: Mon, 21 Oct 2019 22:15:29 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH v4 3/3] powerpc/prom_init: Use -ffreestanding to avoid a
 reference to bcmp
Message-ID: <20191022051529.GA44041@ubuntu-m2-xlarge-x86>
References: <20190911182049.77853-1-natechancellor@gmail.com>
 <20191014025101.18567-1-natechancellor@gmail.com>
 <20191014025101.18567-4-natechancellor@gmail.com>
 <20191014093501.GE28442@gate.crashing.org>
 <CAKwvOdmcUT2A9FG0JD9jd0s=gAavRc_h+RLG6O3mBz4P1FfF8w@mail.gmail.com>
 <20191014191141.GK28442@gate.crashing.org>
 <20191018190022.GA1292@ubuntu-m2-xlarge-x86>
 <20191018200210.GR28442@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191018200210.GR28442@gate.crashing.org>
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 18, 2019 at 03:02:10PM -0500, Segher Boessenkool wrote:
> On Fri, Oct 18, 2019 at 12:00:22PM -0700, Nathan Chancellor wrote:
> > Just as an FYI, there was some more discussion around the availablity
> > and use of bcmp in this LLVM bug which spawned
> > commit 5f074f3e192f ("lib/string.c: implement a basic bcmp").
> > 
> > https://bugs.llvm.org/show_bug.cgi?id=41035#c13
> > 
> > I believe this is the proper solution but I am fine with whatever works,
> > I just want our CI to be green without any out of tree patches again...
> 
> I think the proper solution is for the kernel to *do* use -ffreestanding,
> and then somehow tell the kernel that memcpy etc. are the standard
> functions.  A freestanding GCC already requires memcpy, memmove, memset,
> memcmp, and sometimes abort to exist and do the standard thing; why cannot
> programs then also rely on it to be the standard functions.
> 
> What exact functions are the reason the kernel does not use -ffreestanding?
> Is it just memcpy?  Is more wanted?
> 
> 
> Segher

I think Linus summarized it pretty well here:

https://lore.kernel.org/lkml/CAHk-=wi-epJZfBHDbKKDZ64us7WkF=LpUfhvYBmZSteO8Q0RAg@mail.gmail.com/

Cheers,
Nathan
