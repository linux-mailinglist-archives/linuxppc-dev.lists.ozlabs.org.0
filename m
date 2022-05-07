Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A071851E451
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 07:27:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KwGCQ1WmVz3cNF
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 May 2022 15:27:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=qqr93irq;
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
 header.s=dec2015msa header.b=qqr93irq; 
 dkim-atps=neutral
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com
 [210.131.2.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KwGBM4Vrdz3cCV
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 May 2022 15:26:19 +1000 (AEST)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176]) (authenticated)
 by conssluserg-03.nifty.com with ESMTP id 2475Q3BX030811
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 7 May 2022 14:26:03 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 2475Q3BX030811
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1651901163;
 bh=FfZkot1xX9/3A26jW6H/8b0WNAiDAR0EcY13U3/8Ct0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=qqr93irqpgGLWGLyLAfqZgsX5jjfq/RxKBnTEtjWvy4l1rhh3kJW+UzHInES1fdpP
 vy8047FpoTUHyrZGZ3dBiaY96raqfLzcc0R5ltjccNpxcsHC+gtN8AWK45leUJAF0a
 wN4PyLzXKWrKpFZFBxqy889fCnpvScuWS2zV263IW+MXZckJktkX4gvmfDis0bGP1z
 +2bbAP6AeUiqwZswpayVSpWShE0GCEi6fb++fCFlydc/3wUbfzF7aMEe7pDQqZf1OX
 nQtlFGxp3reMpdFn/c4OMzT6b1IUi5LcW6bavRrv/jX4gj6m8YPjwXS2ftyDASBLfJ
 P91SLgQLkM0hw==
X-Nifty-SrcIP: [209.85.214.176]
Received: by mail-pl1-f176.google.com with SMTP id x18so9293156plg.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 May 2022 22:26:03 -0700 (PDT)
X-Gm-Message-State: AOAM531PZswCLbLxqzKMRVhmooum7kvv60qEuIo3rXSiAQKgMiOxLRbJ
 clWvElevMhHWkb5GTUYtauIWKpNsNfzKK3tfu9o=
X-Google-Smtp-Source: ABdhPJz/0IPfWjlKJGTu0YSnMBSWgwcJp83smiYNjc8NlYMvw4l6ht/5A57T92PaEldUnyvY+t3vLEb0KSQNQvhbfZs=
X-Received: by 2002:a17:902:9887:b0:151:6e1c:7082 with SMTP id
 s7-20020a170902988700b001516e1c7082mr7014096plp.162.1651901162954; Fri, 06
 May 2022 22:26:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220501130749.1123387-1-masahiroy@kernel.org>
 <YnT3GtU975OsXVuN@gondor.apana.org.au>
 <CAK7LNASkQ_14NYu7K_eEOG4boBMpKEXyrOzDJMOjcT5paC7E1A@mail.gmail.com>
 <YnXTPPXRlCpUvoKz@gondor.apana.org.au>
In-Reply-To: <YnXTPPXRlCpUvoKz@gondor.apana.org.au>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 7 May 2022 14:24:54 +0900
X-Gmail-Original-Message-ID: <CAK7LNAReyv20PAb1LdkoBhR_x1pvLQJA7a=jMZYf11TmK9h-iQ@mail.gmail.com>
Message-ID: <CAK7LNAReyv20PAb1LdkoBhR_x1pvLQJA7a=jMZYf11TmK9h-iQ@mail.gmail.com>
Subject: Re: [PATCH] crypto: vmx - Align the short log with Makefile cleanups
To: Herbert Xu <herbert@gondor.apana.org.au>
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
Cc: Nayna Jain <nayna@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 =?UTF-8?Q?Breno_Leit=C3=A3o?= <leitao@debian.org>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 7, 2022 at 11:02 AM Herbert Xu <herbert@gondor.apana.org.au> wrote:
>
> On Sat, May 07, 2022 at 12:25:32AM +0900, Masahiro Yamada wrote:
> >
> > Sorry, I just noticed the 0day bot had reported the error.
> >
> > I sent v2.    (CONFIG_LITTLE_ENDIAN  --> CONFIG_CPU_LITTLE_ENDIAN)
> >
> > https://lore.kernel.org/lkml/20220506150820.1310802-1-masahiroy@kernel.org/
> >
> >
> > Could you replace it, or fix it up, please?
>
> Please send me an incremental patch.

Done.

BTW, you added a wrong Reported-by tag:
https://git.kernel.org/pub/scm/linux/kernel/git/herbert/cryptodev-2.6.git/commit/?id=b52455a73db95ef90fd3c2be84db77b55be43f46

It is a clean up patch, where 0day bot did not report anything.




-- 
Best Regards
Masahiro Yamada
