Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 146354BAF2E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 02:37:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0DpY2S0cz3cWS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 12:37:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=IWhfFvte;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.81;
 helo=conssluserg-02.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=IWhfFvte; 
 dkim-atps=neutral
Received: from conssluserg-02.nifty.com (conssluserg-02.nifty.com
 [210.131.2.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0Dnq2cBHz3cDn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 12:37:02 +1100 (AEDT)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id 21I1aPj4025894
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 10:36:26 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-02.nifty.com 21I1aPj4025894
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1645148186;
 bh=VKdbuX5iAWZp7EuE5zh/xocsqym/fIrci0mPxooYe28=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=IWhfFvtew4XU+l1tL7Sq692w35/peSkY5xMOmfIiDPmNJsFG/dLnh6hvuX7ZTQUAv
 RRW+NYubKgOIhXlWjhKo/2EDILOCt78EfK6HwxqRRfooUeivpKtY1htnxsEICsK9f7
 E5ql2bG+4s1DtHOKKdrpXy044p38x41eVsw9RIgZFPss5pUUwxst2PuCkvzz9UvlJh
 +1RmkYZhSo9R5pPRI81FNE6r2L6eQHnKUKh4ulAcVwXBKvxh39KYHGOFSKlRQphiJy
 n7ZaF4Z/STeLg4vjvCaaV4QaRvbPk6GKJlpASNp11lAs8w/T/9J6IF4nN+lGAbtnBB
 CfH4t3KPiPU3A==
X-Nifty-SrcIP: [209.85.216.41]
Received: by mail-pj1-f41.google.com with SMTP id
 n19-20020a17090ade9300b001b9892a7bf9so10990335pjv.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 17:36:26 -0800 (PST)
X-Gm-Message-State: AOAM5309eZAQ/NM381E/yIIIR8KV+8lf3fH9or7Gi41/4RPqCMGYwAIc
 Okk8CUv086C63LO5GdvRspw7QpcRNZbFTerUtCA=
X-Google-Smtp-Source: ABdhPJy0Ae337oqKkEUoK4O3IKhPlww6tXbKq+aJYguPXt6um9PiI+8T8dLczPOUtLJexLG3bu+W8fp8Z0qZsjNXFyc=
X-Received: by 2002:a17:90b:4d84:b0:1b9:4109:7118 with SMTP id
 oj4-20020a17090b4d8400b001b941097118mr10117749pjb.119.1645148185337; Thu, 17
 Feb 2022 17:36:25 -0800 (PST)
MIME-Version: 1.0
References: <978951d76d8cb84bab347c7623bc163e9a038452.1645100305.git.christophe.leroy@csgroup.eu>
 <35bcd5df0fb546008ff4043dbea68836@AcuMS.aculab.com>
 <d38e5e1c-29b6-8cc6-7409-d0bdd5772f23@csgroup.eu>
 <9b8ef186-c7fe-822c-35df-342c9e86cc88@csgroup.eu>
 <3c2b682a7d804b5e8749428b50342c82@AcuMS.aculab.com>
 <CAK7LNASWTJ-ax9u5yOwHV9vHCBAcQTazV-oXtqVFVFedOA0Eqw@mail.gmail.com>
 <2e38265880db45afa96cfb51223f7418@AcuMS.aculab.com>
 <CAK7LNASvBLLWMa+kb5eGJ6vpSqob_dBUxwCnpHZfL-spzRG7qA@mail.gmail.com>
 <20220217180735.GM614@gate.crashing.org>
In-Reply-To: <20220217180735.GM614@gate.crashing.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 18 Feb 2022 10:35:48 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQ3tdOEYP7LjSX5+vhy=eUf0q-YiktQriH-rcr1n2Q3aA@mail.gmail.com>
Message-ID: <CAK7LNAQ3tdOEYP7LjSX5+vhy=eUf0q-YiktQriH-rcr1n2Q3aA@mail.gmail.com>
Subject: Re: [PATCH net v3] net: Force inlining of checksum functions in
 net/checksum.h
To: Segher Boessenkool <segher@kernel.crashing.org>
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
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 David Laight <David.Laight@aculab.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 18, 2022 at 3:10 AM Segher Boessenkool
<segher@kernel.crashing.org> wrote:
>
> On Fri, Feb 18, 2022 at 02:27:16AM +0900, Masahiro Yamada wrote:
> > On Fri, Feb 18, 2022 at 1:49 AM David Laight <David.Laight@aculab.com> wrote:
> > > That description is largely fine.
> > >
> > > Inappropriate 'inline' ought to be removed.
> > > Then 'inline' means - 'really do inline this'.
> >
> > You cannot change "static inline" to "static"
> > in header files.
>
> Why not?  Those two have identical semantics!

e.g.)


[1] Open  include/linux/device.h with your favorite editor,
     then edit

static inline void *devm_kcalloc(struct device *dev,

    to

static void *devm_kcalloc(struct device *dev,


[2] Build the kernel









>
>
> Segher







-- 
Best Regards
Masahiro Yamada
