Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D207754597
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 02:09:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qjATGNeW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2pcL0Vpqz3cGK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 10:09:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qjATGNeW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=broonie@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2n1M4fTZz3bvJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 08:57:27 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B29F661DF2;
	Fri, 14 Jul 2023 22:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73C28C433C8;
	Fri, 14 Jul 2023 22:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689375444;
	bh=P8clI5KtqQRzgFfns22g81I3g6E4+6MLCwEqWyZYU68=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qjATGNeW2AnMB8iSVCidFlZhH9OfkN7bAt2p7ldacOlxk00MBC0K43n0wGgdC/kES
	 5er615dq9DLL0q9cE1VNLaWlbFSi2IfYsicV7umDzTZyH4W2s60ky3l5tGI2zapesZ
	 a6IFRb5wsW2IyAbgdPu3qj324ZAqxXKa5uD5MSOHkbg0ycP0RX1WKos7Wx9s9h14c7
	 mr09nK6DvKTxBa912H2K859rBf/1exfAJQyuctMgVjw5UcRvPGqHIzg/7kZ1W2WHDS
	 fPdS6OedIvs2Ff2PDWFgTKxBrTglm+398FEIc7xd983iXS7+gUDgWarryvZetDtEg3
	 d1Xp1VJIV7NTA==
Date: Fri, 14 Jul 2023 23:57:06 +0100
From: Mark Brown <broonie@kernel.org>
To: Rick Edgecombe <rick.p.edgecombe@intel.com>
Subject: Re: [PATCH v9 01/42] mm: Rename arch pte_mkwrite()'s to
 pte_mkwrite_novma()
Message-ID: <b389274a-abed-40dc-8e33-7ce922ea9b61@sirena.org.uk>
References: <20230613001108.3040476-1-rick.p.edgecombe@intel.com>
 <20230613001108.3040476-2-rick.p.edgecombe@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Om+vkuYZS0OLKEiC"
Content-Disposition: inline
In-Reply-To: <20230613001108.3040476-2-rick.p.edgecombe@intel.com>
X-Cookie: Preserve the old, but know the new.
X-Mailman-Approved-At: Sat, 15 Jul 2023 10:04:45 +1000
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
Cc: kcc@google.com, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, david@redhat.com, eranian@google.com, Oleg Nesterov <oleg@redhat.com>, linux-mm@kvack.org, linux-csky@vger.kernel.org, Pavel Machek <pavel@ucw.cz>, "H . Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Nadav Amit <nadav.amit@gmail.com>, linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, dethoma@microsoft.com, Linus Torvalds <torvalds@linuxfoundation.org>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, x86@kernel.org, Eugene Syromiatnikov <esyr@redhat.com>, jamorris@linux.microsoft.com, szabolcs.nagy@arm.com, Ingo Molnar <mingo@redhat.com>, linux-snps-arc@lists.infradead.org, "H . J . Lu" <hjl.tools@gmail.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>, linux-alp
 ha@vger.kernel.org, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, openrisc@lists.librecores.org, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, debug@rivosinc.com, Florian Weimer <fweimer@redhat.com>, Michal Simek <monstr@monstr.eu>, John Allen <john.allen@amd.com>, linux-parisc@vger.kernel.org, Weijiang Yang <weijiang.yang@intel.com>, linux-api@vger.kernel.org, christina.schimpe@intel.com, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, Cyrill Gorcunov <gorcunov@gmail.com>, Dinh Nguyen <dinguyen@kernel.org>, rppt@kernel.org, Andrew.Cooper3@citrix.com, akpm@linux-foundation.org, torvalds@linux-foundation.org, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--Om+vkuYZS0OLKEiC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jun 12, 2023 at 05:10:27PM -0700, Rick Edgecombe wrote:
> The x86 Shadow stack feature includes a new type of memory called shadow
> stack. This shadow stack memory has some unusual properties, which requires
> some core mm changes to function properly.

This seems to break sparc64_defconfig when applied on top of v6.5-rc1:

In file included from /home/broonie/git/bisect/include/linux/mm.h:29,
                 from /home/broonie/git/bisect/net/core/skbuff.c:40:
/home/broonie/git/bisect/include/linux/pgtable.h: In function 'pmd_mkwrite':
/home/broonie/git/bisect/include/linux/pgtable.h:528:9: error: implicit declaration of function 'pmd_mkwrite_novma'; did you mean 'pte_mkwrite_novma'? [-Werror=implicit-function-declaration]
  return pmd_mkwrite_novma(pmd);
         ^~~~~~~~~~~~~~~~~
         pte_mkwrite_novma
/home/broonie/git/bisect/include/linux/pgtable.h:528:9: error: incompatible types when returning type 'int' but 'pmd_t' {aka 'struct <anonymous>'} was expected
  return pmd_mkwrite_novma(pmd);
         ^~~~~~~~~~~~~~~~~~~~~~

The same issue seems to apply with the version that was in -next based
on v6.4-rc4 too.

--Om+vkuYZS0OLKEiC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmSx0sEACgkQJNaLcl1U
h9Cgsgf+I5DDysBO4SJ+jmxeXww6HYCycJsoc6oA/wVf/wO7aTv89RFcAPpwMOoq
jZKiD/xiUtCMUcNE+ZtCQIYVymIrK1BBcNPzgflt5fa50gm53Hp2mcNFaUeriWjC
x2DfyH1wsfgAjwv14aKu1m59Y7xdhIQWZ4HTezaEFND/3GQTrvGy8tHMDL07GKWz
qL1gMkJ7kYVKEAf86IsSwbDBcSa/SV5cLbsL4S5GEm5K/hQcLwUqSw4WYuMLfNip
Eb4Napl5JYGKJcb/IQIm/PGQbmnKgijPg7mR0lvF6RWZk39wCFxKQizahf6cRCwv
HSMmlXJHILeOK57vaStYZJvapWZzdg==
=/plS
-----END PGP SIGNATURE-----

--Om+vkuYZS0OLKEiC--
