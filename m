Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C92391FFEB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 01:35:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nywv3TSKzDrMm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jun 2020 09:35:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=Ewi80sWV; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nyv216FJzDrMT
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jun 2020 09:34:05 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id s10so3682354pgm.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 16:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vzMoTDgws5PlJ9TvYEmWHyaZ7Qpk9jmHSWqWqw0ANTA=;
 b=Ewi80sWV0n+/DP/17c63Vb7jKadOV6GgvQKsky4OaGKjTCttb5aZmXV/DCO2N6Yg0I
 rUCGjVS7EuVlN5R12i7QA/VSKcv+O59aYhF2d3schmJmPZa0jzjhVAekNFxSIfqSNnIN
 35U8t1kWy7RnLJMTKWOtvvLRzLtyRm4dOLhJNK7V6o3tSFCJo9uo8qRmlCcvHXpNC+Lk
 X4+oMy9blcsGQ+Ft5/1GDNWFR2h4anquYBU3tqvS4sL73LwkNeNV/gGRWRREPpix7yGk
 CAvEYZK4bggM4XJLHThuSWxUmxzwU5zt9uiQRHADkqAthYcnS5ZWfV+cqMkBNyR8BgEi
 5mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vzMoTDgws5PlJ9TvYEmWHyaZ7Qpk9jmHSWqWqw0ANTA=;
 b=by1RXKml+jXNyLOQVR26K2xnQQ4iPaW9Ps0C58A7+vhU7T1i6q+V/ieShXPokTmR/t
 oSMYjaYwy/ImyK4o0g4g+bWRdSXXV72TR3ATql+8whfvt7o71MdkDkqqV73KVDXMYqWU
 tyRLMp0YiqjvuEYKakLYh4PgZK4zRceT1GrotGI9XPfkP6u4rMoPZEynjCQNSwyu+DNZ
 1xA+Qlfk6xS0QoeOmDuoTDHbQ4xD46OTERXDKlnNW6vvP5J+Lk7XM1RqM9Zi5phWbSqt
 Fk7UzeIitcGdXTYqZdIjiz2M2tfTcN6xoziulmEkk0TvGxx6VSyjeaNL0I9NIf2HT+Y0
 6SQw==
X-Gm-Message-State: AOAM5321qxxzeOXO8VAVWqWg26O5MyEh2DsBib1NtUxoi4bTZzeHTeuM
 hnhzzf0xYbclBB520PC8jmlkuSBpCgqypXatYIYAwg==
X-Google-Smtp-Source: ABdhPJylpCbzSialaLk8pB9ppDsJx1vLI57MrnJmVY8Ehtzn3RslDcnj32ZNhbjYtsX0HvPbYrYBOCZ1vsdRWTR/ZpE=
X-Received: by 2002:a63:a119:: with SMTP id b25mr772906pgf.10.1592523242019;
 Thu, 18 Jun 2020 16:34:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1590079968.git.christophe.leroy@csgroup.eu>
 <8c593895e2cb57d232d85ce4d8c3a1aa7f0869cc.1590079968.git.christophe.leroy@csgroup.eu>
 <20200616002720.GA1307277@ubuntu-n2-xlarge-x86>
 <68503e5e-7456-b81c-e43d-27cb331a4b72@xilinx.com>
 <20200616181630.GA3403678@ubuntu-n2-xlarge-x86>
 <50fb2dd6-4e8f-a550-6eda-073beb86f2ff@xilinx.com>
 <87bllidmk4.fsf@mpe.ellerman.id.au> <878sgmdmcv.fsf@mpe.ellerman.id.au>
 <CAKwvOdnkcjLGay0jdQ77kHTmKhE56F9jvzh01XWwEE8rjbhLAA@mail.gmail.com>
 <87tuz9ci7e.fsf@mpe.ellerman.id.au>
 <20200618031622.GA195@Ryzen-9-3900X.localdomain>
In-Reply-To: <20200618031622.GA195@Ryzen-9-3900X.localdomain>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 18 Jun 2020 16:33:50 -0700
Message-ID: <CAKwvOdnGPFndupGj0dZq8xfepYahVvsASGGbS10Ki19YmbqZHQ@mail.gmail.com>
Subject: Re: [PATCH v5 01/13] powerpc: Remove Xilinx PPC405/PPC440 support
To: Nathan Chancellor <natechancellor@gmail.com>
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
Cc: Robert Lippert <rlippert@google.com>, Arnd Bergmann <arnd@arndb.de>,
 Michal Simek <michal.simek@xilinx.com>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>, Greg Thelen <gthelen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 17, 2020 at 8:16 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Admittedly, we really do not have many PowerPC experts in our
> organization

Not with that attitude. :P /s
https://www.youtube.com/watch?v=Kck_upSlx60

> so we are supporting it on a "best effort" basis, which
> often involves using whatever knowledge is floating around or can be
> gained from interactions such as this :) so thank you for that!

That said, Google does have a significant amount of POWER machines in
the fleet used by our "prodkernel" teams.  Anecdotally, I've been
getting cc'ed on more and more internal bugs regarding ppc+clang+linux
kernels.  "prodkernel" is still in the process of moving a massive
fleet over to clang built kernels, but ppc is very important to
Google.  ppc32...I'm not so sure...let me ask some of our ppc folks
more about which uarch's and word sizes they really care about...

--
Thanks,
~Nick Desaulniers
