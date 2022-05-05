Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4216E51C56B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 May 2022 18:51:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KvKTf1P16z3bxM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 May 2022 02:51:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=rHlaH4vw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.82;
 helo=conssluserg-03.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=rHlaH4vw; 
 dkim-atps=neutral
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KvKSx6VVWz3bpB
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 May 2022 02:50:41 +1000 (AEST)
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 245Go9R5032566
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 6 May 2022 01:50:09 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 245Go9R5032566
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1651769409;
 bh=ygzkm43GrcDzhqnHIxLfBnu2vDnA92BUs+zoxtrNQp8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=rHlaH4vwxLfb6tf78FehbMA1mQ3g8XT18MOjx/BJwxbFFxQ1YA9zYdtWsfDchs3Ih
 CahvCWRRVGYUbjywaxHySSdky4cSBGE8SCjVlC6NKC0ytB84sGI+4F0/MvmGEg0j7P
 YRHRTM3JRNsgchINBv4VRhAbX8IE5L4F3v1/8Onkf7/5jet3veyQNovYi8deOW/cck
 RYzG5jNHNvAKotdWOSSgIRno8+HGyvEBY3FstpdKlOO/lESOG5gLeDU6kn0hRFhgDx
 xJUvl8jSXKth7RL2k9/i4vp52l8QIZxgXvEkZXiE9uvN5TFV9YodefmG8QUqhEXWho
 pnD19iFso237Q==
X-Nifty-SrcIP: [209.85.214.170]
Received: by mail-pl1-f170.google.com with SMTP id j14so4941045plx.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 May 2022 09:50:09 -0700 (PDT)
X-Gm-Message-State: AOAM532lrAVGWXHwLFAAp4qzP1DFWfuiRy+2JE77+vfGQ14+PW4+K392
 3JYFWKq8dbFrZcWI7Vcbua3d5yZpsdX8NyVZh1k=
X-Google-Smtp-Source: ABdhPJxFVg1PsB/pcXjIvUrAmLyyIQeQ5R29SzsliD7Nd4EgMkoKbYvt+QAlfLIfjHz1WUxVGwqiQnWQOB1ShcOtmY0=
X-Received: by 2002:a17:902:7891:b0:15e:cae9:7620 with SMTP id
 q17-20020a170902789100b0015ecae97620mr8573800pll.136.1651769408445; Thu, 05
 May 2022 09:50:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220505072244.1155033-1-masahiroy@kernel.org>
In-Reply-To: <20220505072244.1155033-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 May 2022 01:49:00 +0900
X-Gmail-Original-Message-ID: <CAK7LNATnCOKcbFXDY2Qik=6AJ31fQLKO+NW6fD-xY-muV5UQ-A@mail.gmail.com>
Message-ID: <CAK7LNATnCOKcbFXDY2Qik=6AJ31fQLKO+NW6fD-xY-muV5UQ-A@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] kbuild: yet another series of cleanups (modpost, 
 LTO, MODULE_REL_CRCS)
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
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
Cc: linux-s390 <linux-s390@vger.kernel.org>,
 Nicolas Schier a <nicolas@fjasle.eu>, Peter Zijlstra <peterz@infradead.org>,
 Nick Desaulniers <ndesaulniers@google.com>, linux-um@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Sami Tolvanen <samitolvanen@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ard Biesheuvel <ardb@kernel.org>,
 Kees Cook <keescook@chromium.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 5, 2022 at 4:24 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
>
> This is the third batch of cleanups in this development cycle.


This series is available at:
git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
lto-cleanup-v3








-- 
Best Regards
Masahiro Yamada
