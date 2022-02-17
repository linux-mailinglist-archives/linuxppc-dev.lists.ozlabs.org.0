Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 734714B9A1B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 08:51:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jzn7t72Zlz3cW0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 18:51:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DBcvVtY1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=DBcvVtY1; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jzn7C6bD5z30Mf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 18:50:31 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 20DDF61B22
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 07:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A13C340EB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 07:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645084228;
 bh=mjFs6zWH8/AqiitYOR0rg+8IkEbypYLpH0MSBavFTDs=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=DBcvVtY1B0J8/v1qUUMIu1R8Bj2PBQcrKqGIauB+s62jnSEJksbDQCtaMy/5QNgKS
 jHCF2BidlKTwoWCq8f4JIDse8QG21V8S1xP8yvtmIN11UZ8MoP8PzXkGIs0UIVPMLJ
 XWMW69GPxHylDj/BWsD4VkxMxYzc2t+4fEo5qLxprQu7LAcdaYl4JsxidDLO+WEs/6
 hwxJk6zF/e8YRV/mO6D4Z7uRvQDoG3SkHQIEejEDtmIkHZi+6cSh+6VGcRreHY5WZf
 rPr4wyJLRdp3fZQiodXzh6eTbQy+wolWzba/sV53d/qRRd2QoI3lmnmxaNygUZ/Vqx
 ANLAFaXbdq6Mg==
Received: by mail-wm1-f45.google.com with SMTP id w13so2118363wmi.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 23:50:28 -0800 (PST)
X-Gm-Message-State: AOAM532wNM/Ov76sqEX2wuOcO3nAKSWfMsLOlR/RlYVGz1xnBjLKf9R8
 4jD3RUhx5bscU/KBUl3uCt40cjKBlTgTlM0GQCI=
X-Google-Smtp-Source: ABdhPJxVHiNpam6v+gNoOoH0mO2de38FsGKKulVVSeiH+uDoJW6u9JTqRXgzs52TA7IQLSGpUpbHMUpXX+Sk75rMI5w=
X-Received: by 2002:a05:600c:2108:b0:34e:870:966e with SMTP id
 u8-20020a05600c210800b0034e0870966emr4902681wml.173.1645084215917; Wed, 16
 Feb 2022 23:50:15 -0800 (PST)
MIME-Version: 1.0
References: <20220216131332.1489939-1-arnd@kernel.org>
 <00496df2-f9f2-2547-3ca3-7989e4713d6b@csgroup.eu>
In-Reply-To: <00496df2-f9f2-2547-3ca3-7989e4713d6b@csgroup.eu>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 17 Feb 2022 08:49:59 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3_dPbjB23QffnYMtw+5ojfwChrVC8LLMQqNctU7Nh+mQ@mail.gmail.com>
Message-ID: <CAK8P3a3_dPbjB23QffnYMtw+5ojfwChrVC8LLMQqNctU7Nh+mQ@mail.gmail.com>
Subject: Re: [PATCH v2 00/18] clean up asm/uaccess.h, kill set_fs for good
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "dalias@libc.org" <dalias@libc.org>,
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>,
 "peterz@infradead.org" <peterz@infradead.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>,
 "guoren@kernel.org" <guoren@kernel.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "will@kernel.org" <will@kernel.org>, "ardb@kernel.org" <ardb@kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "bcain@codeaurora.org" <bcain@codeaurora.org>,
 "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 "deller@gmx.de" <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "geert@linux-m68k.org" <geert@linux-m68k.org>,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "hca@linux.ibm.com" <hca@linux.ibm.com>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "richard@nod.at" <richard@nod.at>,
 "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>,
 "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>,
 "viro@zeniv.linux.org.uk" <viro@zeniv.linux.org.uk>,
 "shorne@gmail.com" <shorne@gmail.com>, "monstr@monstr.eu" <monstr@monstr.eu>,
 "tsbogend@alpha.franken.de" <tsbogend@alpha.franken.de>,
 "nickhu@andestech.com" <nickhu@andestech.com>,
 "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dinguyen@kernel.org" <dinguyen@kernel.org>,
 "ebiederm@xmission.com" <ebiederm@xmission.com>,
 "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "green.hu@gmail.com" <green.hu@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 17, 2022 at 8:20 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Le 16/02/2022 =C3=A0 14:13, Arnd Bergmann a =C3=A9crit :
> >
> > Christoph Hellwig and a few others spent a huge effort on removing
> > set_fs() from most of the important architectures, but about half the
> > other architectures were never completed even though most of them don't
> > actually use set_fs() at all.
> >
> > I did a patch for microblaze at some point, which turned out to be fair=
ly
> > generic, and now ported it to most other architectures, using new gener=
ic
> > implementations of access_ok() and __{get,put}_kernel_nocheck().
> >
> > Three architectures (sparc64, ia64, and sh) needed some extra work,
> > which I also completed.
> >
> > The final series contains extra cleanup changes that touch all
> > architectures. Please review and test these, so we can merge them
> > for v5.18.
>
> As a further cleanup, have you thought about making a generic version of
> clear_user() ? On almost all architectures, clear_user() does an
> access_ok() then calls __clear_user() or similar.

This already exists in include/asm-generic/uaccess.h, but that file is
currently not as easy to use as it should be. I've previously looked into
what it would take to get more architectures to use common code
in that file, but I currently have no plans to work on that.

> Maybe also the same with put_user() and get_user() ? After all it is
> just access_ok() followed by __put_user() or __get_user() ? It seems
> more tricky though, as some architectures seems to have less trivial
> stuff there.

Same here: architectures can already provide a __put_user_fn()
and __get_user_fn(), to get the generic versions of the interface,
but few architectures use that. You can actually get all the interfaces
by just providing raw_copy_from_user() and raw_copy_to_user(),
but the get_user/put_user versions you get from that are fairly
inefficient.

> I also see all architectures have a prototype for strncpy_from_user()
> and strnlen_user(). Could be a common prototype instead when we have
> GENERIC_STRNCPY_FROM_USER / GENERIC_STRNLEN_USER
>
> And we have also
> user_access_begin()/user_read_access_begin()/user_write_access_begin()
> which call access_ok() then do the real work. Could be made generic with
> call to some arch specific __user_access_begin() and friends after the
> access_ok() and eventually the might_fault().

In my opinion, the biggest win would be to move the type-agnostic part of
get_user/put_user into completely generic code, this is what architectures
get wrong the most, see patch 02/18 in this series for instance.

What I'd like to see is that architectures only provide fixed-length
versions of unsafe_get_user()/unsafe_put_user(), with the type-agnostic
versions (get_user(), __get_user(), unsafe_get_user() and their put
versions) all defined once in include/linux/uaccess.h based on those.

I tried implementing this in the past, but unfortunately the resulting
object code from my generalized implementation was worse than
what we have today, so I did not continue that work.

      Arnd
