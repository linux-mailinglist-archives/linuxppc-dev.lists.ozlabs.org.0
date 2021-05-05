Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 984E23745B3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 19:51:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fb44y4YdBz300x
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 May 2021 03:50:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=g8v3452g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.80;
 helo=conssluserg-01.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=g8v3452g; 
 dkim-atps=neutral
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fb44Q0P0Dz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 May 2021 03:50:29 +1000 (AEST)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 145Ho6QY027132
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 6 May 2021 02:50:07 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 145Ho6QY027132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1620237007;
 bh=jvguRX8pqZ4XJCYrxdDcZZ1jIBmYyFi1DYiU2rFpI+Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g8v3452gN8HaY+3KgC7mg7IEMQEerT886lesiQ1r8/d0W1p4gS6kMxU8C9A/AgNsc
 4BqbErAbLtcOu/6o4aQd6nH+hNpSzMarCyqxdV6c+502rITlc8wHMIjEF/g5SnrqTn
 5Lu+vBoxlC0O5LS7DrQfhTyudOyP5URKBYS2EPTUaxGNJzvAjW+FHIFA5buPeP9itZ
 1SbdmcqgX23H+/1g0Yj9WmLTXKIcOUr4I9iAwMHg4oSlVsMM/CU+6Dzyr5zL2qJSH8
 sD48jJq2vZKch0zuYbexhyEioo1Zfg/1aBYyv20rTNZLOTiGMMoQtUPVGuDMmicqGg
 iSg69+xvxX+Dg==
X-Nifty-SrcIP: [209.85.214.181]
Received: by mail-pl1-f181.google.com with SMTP id e2so1509183plh.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 May 2021 10:50:07 -0700 (PDT)
X-Gm-Message-State: AOAM532pvuLGITMDJdMnKCW0rbEEaKSvv2dtotpL3CL2rRF6LjbaEywm
 iZZDT163sPKKpipyxCIF5ss6Ku4nE50Cp2PHtZw=
X-Google-Smtp-Source: ABdhPJwOlYfRNDTIvaamvhcY4mlQDjji6m4TpH8m4X/qsM5m/Jz/mF2aR5QVqUmET8K1YE+Ov90kjSkFJG3e6YThBA0=
X-Received: by 2002:a17:902:32b:b029:ee:fa93:9551 with SMTP id
 40-20020a170902032bb02900eefa939551mr216769pld.47.1620237006584; Wed, 05 May
 2021 10:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20210424114841.394239-1-masahiroy@kernel.org>
 <2f8ccc46-16a1-e0fe-7cb0-0912295153ee@tessares.net>
In-Reply-To: <2f8ccc46-16a1-e0fe-7cb0-0912295153ee@tessares.net>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 6 May 2021 02:49:26 +0900
X-Gmail-Original-Message-ID: <CAK7LNASz11t3YQ509CYbpLDFOmo7eJkT78KKQjCqLR-FKKLZnA@mail.gmail.com>
Message-ID: <CAK7LNASz11t3YQ509CYbpLDFOmo7eJkT78KKQjCqLR-FKKLZnA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: replace LANG=C with LC_ALL=C
To: Matthieu Baerts <matthieu.baerts@tessares.net>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 Mat Martineau <mathew.j.martineau@linux.intel.com>,
 Matthias Maennich <maennich@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 mptcp@lists.01.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 27, 2021 at 4:30 AM Matthieu Baerts
<matthieu.baerts@tessares.net> wrote:
>
> Hi,
>
> Thank you for the patch!
>
> On 24/04/2021 13:48, Masahiro Yamada wrote:
> > LANG gives a weak default to each LC_* in case it is not explicitly
> > defined. LC_ALL, if set, overrides all other LC_* variables.
> >
> >   LANG  <  LC_CTYPE, LC_COLLATE, LC_MONETARY, LC_NUMERIC, ...  <  LC_ALL
> >
> > This is why documentation such as [1] suggests to set LC_ALL in build
> > scripts to get the deterministic result.
> >
> > LANG=C is not strong enough to override LC_* that may be set by end
> > users.
> >
> > [1]: https://reproducible-builds.org/docs/locales/
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  arch/powerpc/boot/wrapper                          | 2 +-
> >  scripts/nsdeps                                     | 2 +-
> >  scripts/recordmcount.pl                            | 2 +-
> >  scripts/setlocalversion                            | 2 +-
> >  scripts/tags.sh                                    | 2 +-
> >  tools/testing/selftests/net/mptcp/mptcp_connect.sh | 2 +-
>
> Acked-by: Matthieu Baerts <matthieu.baerts@tessares.net> (mptcp)
>
> Cheers,
> Matt
> --
> Tessares | Belgium | Hybrid Access Solutions
> www.tessares.net


Applied to linux-kbuild.


-- 
Best Regards
Masahiro Yamada
