Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6691B756F4C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 00:00:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZEoHMX2J;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4bbn2Flbz2ytm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 08:00:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ZEoHMX2J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4Sm60l4bz2xwD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 02:51:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F381E6117E;
	Mon, 17 Jul 2023 16:51:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812EAC433C7;
	Mon, 17 Jul 2023 16:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689612706;
	bh=GDoZ+CsfFo9PibsTP4iZm+ttTgfHxn11DDJbAlCFH8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZEoHMX2JdQeUVyNkgdWBKI6yr5pe/INc5DfODCru+00fN8J5XJg/01FraxC5Uf+FG
	 XLGyykcZarElT+yfQ88/qw3rxbdtmQwlMm4MVMWcjVA8W1BzI++pek5YZKKBwI7XR6
	 Vc/WH98m5BnS7DdeM2++eaKr94hk2O0k89Bc1b9ybe/FsHvQBWZ/9PaJFm5XUvbhPh
	 78TOOOqQ+Nd6w2oOqOYhgVZm+Y7ykGxydEmczeSZwjlePi5nZMkHrFdDg9hL8zxSio
	 SCc95tvYUaXDed+x2C7VwVXHcnKo0+0JBdhxm/Vl4xw/gxBOwJrvOMJAyCgSMZ+3MK
	 +O+f2UpDtYbxQ==
Date: Mon, 17 Jul 2023 17:51:31 +0100
From: Mark Brown <broonie@kernel.org>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v9 01/42] mm: Rename arch pte_mkwrite()'s to
 pte_mkwrite_novma()
Message-ID: <285d346e-14e7-4f43-9b5b-faded6205142@sirena.org.uk>
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
 <20230613001108.3040476-2-rick.p.edgecombe@intel.com>
 <b389274a-abed-40dc-8e33-7ce922ea9b61@sirena.org.uk>
 <87acbb49fa83b0e3f261315a531e105da9e5b9d6.camel@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="klyEM8Lfv/18WVhb"
Content-Disposition: inline
In-Reply-To: <87acbb49fa83b0e3f261315a531e105da9e5b9d6.camel@intel.com>
X-Cookie: Not a flying toy.
X-Mailman-Approved-At: Tue, 18 Jul 2023 07:55:09 +1000
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
Cc: "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, "david@redhat.com" <david@redhat.com>, "szabolcs.nagy@arm.com" <szabolcs.nagy@arm.com>, "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "Eranian, Stephane" <eranian@google.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "Yang, Weijiang" <weijiang.yang@intel.com>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "pavel@ucw.cz" <pavel@ucw.cz>, "hpa@zytor.com" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "nadav.amit@gmail.com" <nadav.amit@gmail.com>, "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "dethoma@microsoft.com" <dethoma@microsoft.com>, "torvalds@linuxfoundation.org" <torvalds@linuxfoundation.org>, "corbet@lwn.n
 et" <corbet@lwn.net>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "Syromiatnikov, Eugene" <esyr@redhat.com>, "jamorris@linux.microsoft.com" <jamorris@linux.microsoft.com>, "peterz@infradead.org" <peterz@infradead.org>, "mingo@redhat.com" <mingo@redhat.com>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "hjl.tools@gmail.com" <hjl.tools@gmail.com>, "keescook@chromium.org" <keescook@chromium.org>, "arnd@arndb.de" <arnd@arndb.de>, "jannh@google.com" <jannh@google.com>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, "openrisc@lists.librecores.org" <openrisc@lists.librecores.org>, "bp@alien8.de" <bp@alien8.de>, "Lutomirski, Andy" <luto@kernel.o
 rg>, "oleg@redhat.com" <oleg@redhat.com>, "tglx@linutronix.de" <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "debug@rivosinc.com" <debug@rivosinc.com>, "fweimer@redhat.com" <fweimer@redhat.com>, "monstr@monstr.eu" <monstr@monstr.eu>, "john.allen@amd.com" <john.allen@amd.com>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "kcc@google.com" <kcc@google.com>, "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>, "Schimpe, Christina" <christina.schimpe@intel.com>, "rdunlap@infradead.org" <rdunlap@infradead.org>, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "gorcunov@gmail.com" <gorcunov@gmail.com>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "rppt@kernel.org" <rppt@kernel.org>, "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "Torvalds, Linus" <torvalds@linux-foundation.org>,
  "kirill.shutemov@linux.intel.com" <kirill.shutemov@linux.intel.com>, "mike.kravetz@oracle.com" <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--klyEM8Lfv/18WVhb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 17, 2023 at 03:55:50PM +0000, Edgecombe, Rick P wrote:
> On Fri, 2023-07-14 at 23:57 +0100, Mark Brown wrote:

> > The same issue seems to apply with the version that was in -next
> > based
> > on v6.4-rc4 too.

> The version in your branch is not the same as the version in tip (which
> had a squashed build fix). I was able to reproduce the build error with
> your branch. But not with the one in tip rebased on v6.5-rc1. So can
> you try this version:
> https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=x86/shstk&id=899223d69ce9f338056f4c41ef870d70040fc860

Ah, I'd not seen that patch or that tip had been rebased - I'd actually
been using literally the branch from tip as my base at whatever point I
last noticed it changing up until I rebased onto -rc1.

--klyEM8Lfv/18WVhb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS1cZIACgkQJNaLcl1U
h9DfWwf/Qv2sx8Qywn2HA+F1wJsVWOOqaPIZzIVBQ5Kg2bysQK3YMNLLZWKdXMsh
sTgXGVlr5oANLjP/hYxvcaxk16N1y51q6PuBh4lJN1w37tEdph1ZIcSejQY/jKpf
fKFWHZ++2w+lXvIOB/7rYQe+XutmQzCVmL0Cod8zxf2UhC4WJe9/3RCKxi6rfxuV
NXldTW7h7dqnurbev4TX4npwjcetNGofPUer7VZD7o1vRKXvX9VLG42UbeV4cu+g
ICKZmGwC9G23gWg0Ql2QkeOr43PLBo4AocKhyO6B22uYLOrA8BQHJUrbnD4ZUyD+
4rWq0iWXOnrixnw11LOSSIVZ2HkwmQ==
=SaIl
-----END PGP SIGNATURE-----

--klyEM8Lfv/18WVhb--
