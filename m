Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 45FA04BA718
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 18:28:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K01yP5nvmz3cbB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 04:28:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=nifty.com header.i=@nifty.com header.a=rsa-sha256 header.s=dec2015msa header.b=hvNZ4ikL;
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
 header.s=dec2015msa header.b=hvNZ4ikL; 
 dkim-atps=neutral
X-Greylist: delayed 4177 seconds by postgrey-1.36 at boromir;
 Fri, 18 Feb 2022 04:28:11 AEDT
Received: from conssluserg-01.nifty.com (conssluserg-01.nifty.com
 [210.131.2.80])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K01xl6VQVz3bPM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 04:28:11 +1100 (AEDT)
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com
 [209.85.215.179]) (authenticated)
 by conssluserg-01.nifty.com with ESMTP id 21HHRug2005961
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 02:27:57 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 21HHRug2005961
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1645118877;
 bh=l1TyzWfQ0jAdhokclSQdnzp8UboMTXXAhan3iI6BUk4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hvNZ4ikLbPjFV/y7ChTE5b8OQBL4g8ZAbtTOwQUZywEnlNF2G/aTi0H1hOhjyGN1C
 NHEvmztYFCF9Dc6V+hJ5X/wHyELb7nkaACM0wtDbd1+6U7R7+rDFLUXLtZq0w84U3W
 BVfybmzISX6N+vJbJd360lhJt+4BjRbSdwMcbxAFVXLN1dvr/KzBnHTTvkMEwi2rGw
 1F0F3DqlPQseUBPJmjskaAJFRh4BWjbcpSq8s9JNDIlKwAPaNXW3e3v/K/zuxd+7Vj
 l04cKXOH+QyAL/gsJtSNW0MqjhMRjyrIRZpPCWh9tKNIq0WeSu5TcRpw/ib8raCV+x
 uk3hly0CQ39pQ==
X-Nifty-SrcIP: [209.85.215.179]
Received: by mail-pg1-f179.google.com with SMTP id 132so5619656pga.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 09:27:57 -0800 (PST)
X-Gm-Message-State: AOAM533NFc+dS+t6ANf0W0kbZuQrXbNV+j+CRqi6VUATFKZ8owno5tKT
 V8PISgSlaSL8LTXAway04+uXEi59McZTG+HsSHw=
X-Google-Smtp-Source: ABdhPJxBWdwy+sIqV6zpRtht5DZ0OmlC41IapWVAe36IX2cFMRgSnZS9d19h+BtDYudfRbxf5PEvVUO6wlOp73L12Wo=
X-Received: by 2002:a05:6a00:a01:b0:4cc:61e5:c548 with SMTP id
 p1-20020a056a000a0100b004cc61e5c548mr4081108pfh.68.1645118876247; Thu, 17 Feb
 2022 09:27:56 -0800 (PST)
MIME-Version: 1.0
References: <978951d76d8cb84bab347c7623bc163e9a038452.1645100305.git.christophe.leroy@csgroup.eu>
 <35bcd5df0fb546008ff4043dbea68836@AcuMS.aculab.com>
 <d38e5e1c-29b6-8cc6-7409-d0bdd5772f23@csgroup.eu>
 <9b8ef186-c7fe-822c-35df-342c9e86cc88@csgroup.eu>
 <3c2b682a7d804b5e8749428b50342c82@AcuMS.aculab.com>
 <CAK7LNASWTJ-ax9u5yOwHV9vHCBAcQTazV-oXtqVFVFedOA0Eqw@mail.gmail.com>
 <2e38265880db45afa96cfb51223f7418@AcuMS.aculab.com>
In-Reply-To: <2e38265880db45afa96cfb51223f7418@AcuMS.aculab.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 18 Feb 2022 02:27:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNASvBLLWMa+kb5eGJ6vpSqob_dBUxwCnpHZfL-spzRG7qA@mail.gmail.com>
Message-ID: <CAK7LNASvBLLWMa+kb5eGJ6vpSqob_dBUxwCnpHZfL-spzRG7qA@mail.gmail.com>
Subject: Re: [PATCH net v3] net: Force inlining of checksum functions in
 net/checksum.h
To: David Laight <David.Laight@aculab.com>
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
 Ingo Molnar <mingo@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 18, 2022 at 1:49 AM David Laight <David.Laight@aculab.com> wrote:
>
> From: Masahiro Yamada
> > Sent: 17 February 2022 16:17
> ...
> > No.  Not that one.
> >
> > The commit you presumably want to revert is:
> >
> > a771f2b82aa2 ("[PATCH] Add a section about inlining to
> > Documentation/CodingStyle")
> >
> > This is now referred to as "__always_inline disease", though.
>
> That description is largely fine.
>
> Inappropriate 'inline' ought to be removed.
> Then 'inline' means - 'really do inline this'.


You cannot change "static inline" to "static"
in header files.

If  "static inline" meant __always_inline,
there would be no way to negate it.
That's why we need both inline and __always_inline.




> Anyone remember massive 100+ line #defines being
> used to get code inlined 'to make it faster'.
> Sometimes being expanded several times in succession.
> May have helped a 68020, but likely to be a loss on
> modern cpu with large I-cache and slow memory.
>
>         David
>
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)


--
Best Regards
Masahiro Yamada
