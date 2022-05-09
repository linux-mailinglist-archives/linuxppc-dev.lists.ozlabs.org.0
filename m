Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF2251F857
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 11:40:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KxbkJ3TJCz3cSh
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 May 2022 19:40:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.43; helo=mail-wm1-f43.google.com;
 envelope-from=wei.liu.linux@gmail.com; receiver=<UNKNOWN>)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kxbjt27tRz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 May 2022 19:39:45 +1000 (AEST)
Received: by mail-wm1-f43.google.com with SMTP id bg25so8022512wmb.4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 May 2022 02:39:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=MIo4iJaNWWiT8L0aREHccyFQKBU+YIpBaS+29bvc/oc=;
 b=iIyLU7LcL/ZBLQujpAmanO3fezSR49jtY3GoXMcAVu0sxw9g2gRDxGqrIAgDo0PLlk
 Hh3dn0+xZvKg0fjVHY8pR3JPKwPxFpDdX5NiXWEiFKuxrqJwQQN8796LPscm+w/9KrrZ
 etD3+8pJASF3yuja8uEofxAxJStbTsXhGs28A1NOXgUbPR+hUncDXCAl18j9i/I+/XjT
 FtBWDmV45KHh5y9YXTNWCHeuR2ZcqIQSFpGjDDu3pZRCgWn00P6yNH36NBM/k12xcTYP
 IecmEdittDjgbarjSGIfYn9Vvx32+R1s1jpqWGKirQ9enS0h4BLM0p8GYh3u/fzEeMS3
 UDMw==
X-Gm-Message-State: AOAM532KtgIxWSzr2sBhiAkVKwm9ct0S6igKMjPaq6U03DVPjMsnJC0M
 538i+cxpBnN9nA+bo9mwBSQ=
X-Google-Smtp-Source: ABdhPJz/KKcTrgbBKiQDbLem0UVallm03r9n1V5yq/fpMjCoclkduFXgbKOowrI9BpO7enF+NSOlDA==
X-Received: by 2002:a7b:c4c8:0:b0:394:26c5:b79e with SMTP id
 g8-20020a7bc4c8000000b0039426c5b79emr15176076wmk.15.1652089180818; 
 Mon, 09 May 2022 02:39:40 -0700 (PDT)
Received: from liuwe-devbox-debian-v2 ([51.145.34.42])
 by smtp.gmail.com with ESMTPSA id
 w7-20020adfee47000000b0020c5253d8efsm10503017wro.59.2022.05.09.02.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 02:39:40 -0700 (PDT)
Date: Mon, 9 May 2022 09:39:38 +0000
From: Wei Liu <wei.liu@kernel.org>
To: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v6 00/23] Rust support
Message-ID: <20220509093938.fdrh5hhhreqi46wn@liuwe-devbox-debian-v2>
References: <20220507052451.12890-1-ojeda@kernel.org>
 <202205070056.ACC3C3D@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202205070056.ACC3C3D@keescook>
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
Cc: Wei Liu <wei.liu@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kbuild@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-gpio@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 linux-kselftest@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 live-patching@vger.kernel.org, linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 07, 2022 at 01:06:18AM -0700, Kees Cook wrote:
> On Sat, May 07, 2022 at 07:23:58AM +0200, Miguel Ojeda wrote:
> > ## Patch series status
> > 
> > The Rust support is still to be considered experimental. However,
> > support is good enough that kernel developers can start working on the
> > Rust abstractions for subsystems and write drivers and other modules.
> 
> I'd really like to see this landed for a few reasons:
> 
> - It's under active development, and I'd rather review the changes
>   "normally", incrementally, etc. Right now it can be hard to re-review
>   some of the "mostly the same each version" patches in the series.
> 
> - I'd like to break the catch-22 of "ask for a new driver to be
>   written in rust but the rust support isn't landed" vs "the rust
>   support isn't landed because there aren't enough drivers". It
>   really feels like "release early, release often" is needed here;
>   it's hard to develop against -next. :)

+1 to both points. :-)
