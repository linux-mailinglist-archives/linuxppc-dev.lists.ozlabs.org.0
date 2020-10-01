Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id ABD1D27FD1F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 12:17:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C28Fj3cBLzDqND
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Oct 2020 20:17:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::141;
 helo=mail-lf1-x141.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AK9x/1EH; dkim-atps=neutral
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C28Cl2hDnzDqKZ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Oct 2020 20:15:54 +1000 (AEST)
Received: by mail-lf1-x141.google.com with SMTP id 77so5892192lfj.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Oct 2020 03:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yP779foQVZTd7hBfYzc8x5HVVPD9H4ll26i7mjT38To=;
 b=AK9x/1EH5gmexWNak1NPEzY9C74BazOc3JDXGwjqNUYcPD0WRVvwvO7XyOuJe1igMR
 PDhTED3odbMFCjTZgn+J4TmZoeMRwBWYMDn0RuEYqTkUivByeORR1sdQL7sm33qgxStO
 FHxypX75VqTWUPh7OIpG7ePL+TPvgkQb4i6hnnTZK6eGOvYJIEoMLG4Cr9J6zuen0oYR
 tcaya7K8VMxi1iUfDFtpa7JfMOwxH9VirfJJqaqVCus3De3e5Qe0AYweZ5jaAaC6jg1R
 AG+hBeq3eyXohdJAK7/rft0pIHE1kDo6K9BjWDzK0K9lXs9bXQsm3saY9kQyF3Aq1V9t
 0lEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yP779foQVZTd7hBfYzc8x5HVVPD9H4ll26i7mjT38To=;
 b=sk2Lts7/rnPOh7MxBSDvVEyml5s5+a9Xr5VkqZorbo0+sOgZZLUu4befoVIy2l9US4
 E+iKgOSfizWJnc+sRH7bE1/LWW8ycWkplGhVyul4AQCn/7UzG09A3mGA+WEDft8116Rs
 3ewC5yxhWHlMMenYSChEtJbFFflVCYxBbM0HHUHZhdGpmI2GCzjHOx5+i1uqFlpQjVeq
 /LHIq5a1u2G/0OdIyyWayZ2GHLBqSUknX+nFwbQ6gYwVnqQnLmbn/6Txda8zhu6qtXgV
 WyPBvZMejgC9cXoGYyVmVtWF1EifPwUQsyMy1qQQG/aAFlIzjsJQt7Tdz7bT5rZRN9nQ
 MdfA==
X-Gm-Message-State: AOAM5316rW23P55fshsatT4zOmcI8JOots1h+zFa5vWzSORUNm6OTTGz
 caTVTzsqqRPOAkq9p4ZZ8SXUB8UhRYqibb7FKUM=
X-Google-Smtp-Source: ABdhPJzE0B3XYSFoxxWCoIujQIlIrX0GFgwGjx6ozGWiaiVey1qgI0/wjkOI3kDNFY6QX+0v9OhDOWTJ77VtvbMwoNk=
X-Received: by 2002:a19:7e8d:: with SMTP id z135mr2532283lfc.158.1601547350476; 
 Thu, 01 Oct 2020 03:15:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOd=s+N4+X94sTams_hKn8uV5Hc6QyCc7OHyOGC-JFesS8A@mail.gmail.com>
 <20200929192549.501516-1-ndesaulniers@google.com>
 <CA+icZUVgfnVQ1=zjUGhGKnJAs9g3Q06sWN3ffNdrfZMZLCEkbA@mail.gmail.com>
 <133589afbe999347454dfcc46ae782897bf9e3a2.camel@perches.com>
 <46f69161e60b802488ba8c8f3f8bbf922aa3b49b.camel@perches.com>
 <CAKwvOdkhyvTpY6pHT+CLSsBFuKRWsXucjbwN_tyJAsryZXvG1A@mail.gmail.com>
 <417ffa3fd3fba5d4a481db6a0b0c9b48cbbb17c4.camel@perches.com>
 <CAKwvOd=P+j0RaQfHsXPfB0EL3oRgAu8Q0+spUOn_v-p2+3=3pw@mail.gmail.com>
 <aefe941251d5d58062d06099afb58dea1d1d4e17.camel@perches.com>
 <46040e2776a4848add06126ce1cb8f846709294f.camel@perches.com>
In-Reply-To: <46040e2776a4848add06126ce1cb8f846709294f.camel@perches.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 1 Oct 2020 12:15:39 +0200
Message-ID: <CANiq72mSjs4myQQtUoegjRggjTx9UF70nAcWoXRoTeLMOuf0xQ@mail.gmail.com>
Subject: Re: [RFC PATCH next-20200930] treewide: Convert macro and uses of
 __section(foo) to __section("foo")
To: Joe Perches <joe@perches.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Kees Cook <keescook@chromium.org>, "Paul E . McKenney" <paulmck@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Lai Jiangshan <jiangshanlai@gmail.com>, Josh Triplett <josh@joshtriplett.org>,
 Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>,
 rcu@vger.kernel.org, Clang-Built-Linux ML <clang-built-linux@googlegroups.com>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Sedat Dilek <sedat.dilek@gmail.com>, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Joe,

On Thu, Oct 1, 2020 at 12:56 AM Joe Perches <joe@perches.com> wrote:
>
> So I installed the powerpc cross compiler, and
> nope, that doesn't work, it makes a mess.

Thanks a lot for reviving the script and sending the treewide cleanup!

> So it looks like the best option is to exclude these
> 2 files from conversion.

Agreed. Nevertheless, is there any reason arch/powerpc/* should not be
compiling cleanly with compiler.h? (CC'ing the rest of the PowerPC
reviewers and ML).

Cheers,
Miguel
