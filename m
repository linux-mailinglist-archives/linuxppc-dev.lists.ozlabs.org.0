Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D388217B537
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 05:08:35 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48YYy84rfWzDr0k
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Mar 2020 15:08:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48YYwf1lZgzDqh3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 15:07:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=AN/iyWAo; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48YYwd1qSdz8t91
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Mar 2020 15:07:13 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48YYwd1GPmz9sRR; Fri,  6 Mar 2020 15:07:13 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=softfail (domain owner discourages use of this
 host) smtp.mailfrom=kernel.org (client-ip=210.131.2.90;
 helo=conssluserg-05.nifty.com; envelope-from=masahiroy@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256
 header.s=dec2015msa header.b=AN/iyWAo; 
 dkim-atps=neutral
Received: from conssluserg-05.nifty.com (conssluserg-05.nifty.com
 [210.131.2.90])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48YYwZ5n4Dz9sPK
 for <linuxppc-dev@ozlabs.org>; Fri,  6 Mar 2020 15:07:09 +1100 (AEDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com
 [209.85.217.43]) (authenticated)
 by conssluserg-05.nifty.com with ESMTP id 02646eGL024696
 for <linuxppc-dev@ozlabs.org>; Fri, 6 Mar 2020 13:06:40 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 02646eGL024696
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1583467601;
 bh=1ncTuHIScTyMk5Taq9h+PaYHUlk1ciBILDFFXrE1EGY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=AN/iyWAoAaHJzfTMA3AOJ3J+oK7YbDQoN4IIcFngK8nTHHzfeX/0CVBownZ1mLDCs
 aObsYtzo5qE7yW3XofKI5/HbCMuKndPaVRZHmocGqDxiAhC8mxCeXEQJDezHD13KC2
 sIHTgRKALwAjaw14kbBmF0/C9WNa9dFrHifTLG66dQW4ZWeSJTUz/eHb6axnhfGckC
 tz6vKR4AJ0V0T1bGXyTLdUY5cau3eWoQSG9STCWrmoi/Fh2sIM21+t2vuOu5yqyd8k
 zQlEe95Ksl6/J9YLUrEvvkIrnx6+kB8aeLUaV4l07myuxBDhF3I9AEMM7RTv9cwTTl
 q2QM25KfunLqg==
X-Nifty-SrcIP: [209.85.217.43]
Received: by mail-vs1-f43.google.com with SMTP id c18so695053vsq.7
 for <linuxppc-dev@ozlabs.org>; Thu, 05 Mar 2020 20:06:40 -0800 (PST)
X-Gm-Message-State: ANhLgQ3v3SFEiozcN9AZqQySXupbevffCXFsCk1ZNgVsXubmCXwgbScw
 l0NG7n+l0uRJXHQKzlycJDP+PY2HV88q0t9IGyU=
X-Google-Smtp-Source: ADFU+vuschWJHDj8euZdyGy+o4J220QDbrHnuo+M3bhxaiWSQnYbzLYxv/gCmox0lsIvqG8GQKiryVE9QJC9OGlDDK4=
X-Received: by 2002:a67:8c44:: with SMTP id o65mr983718vsd.181.1583467599524; 
 Thu, 05 Mar 2020 20:06:39 -0800 (PST)
MIME-Version: 1.0
References: <20200219000434.15872-1-mpe@ellerman.id.au>
 <48YT3Y2QBsz9sSs@ozlabs.org>
In-Reply-To: <48YT3Y2QBsz9sSs@ozlabs.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 6 Mar 2020 13:06:02 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQfREwzk4NwE5PzxOXGLcsk2BtjYNKvKx8g4_vxHmNHdw@mail.gmail.com>
Message-ID: <CAK7LNAQfREwzk4NwE5PzxOXGLcsk2BtjYNKvKx8g4_vxHmNHdw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/Makefile: Mark phony targets as PHONY
To: Michael Ellerman <patch-notifications@ellerman.id.au>
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
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 6, 2020 at 9:27 AM Michael Ellerman
<patch-notifications@ellerman.id.au> wrote:
>
> On Wed, 2020-02-19 at 00:04:34 UTC, Michael Ellerman wrote:
> > Some of our phony targets are not marked as such. This can lead to
> > confusing errors, eg:
> >
> >   $ make clean
> >   $ touch install
> >   $ make install
> >   make: 'install' is up to date.
> >   $
> >
> > Fix it by adding them to the PHONY variable which is marked phony in
> > the top-level Makefile, or in scripts/Makefile.build for the boot
> > Makefile.
> >
> > Suggested-by: Masahiro Yamada <masahiroy@kernel.org>
> > Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>
> Applied to powerpc next.
>
> https://git.kernel.org/powerpc/c/d42c6d0f8d004c3661dde3c376ed637e9f292c22
>

You do not have to double your Signed-off-by.



-- 
Best Regards
Masahiro Yamada
