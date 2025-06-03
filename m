Return-Path: <linuxppc-dev+bounces-9095-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAA1AACC733
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 15:00:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBW6W6PBXz2yKq;
	Tue,  3 Jun 2025 23:00:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.183
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748955651;
	cv=none; b=khDZMsKwbb/jHqD9N+niudW8xsiQHtXvIOQdB/PlhfuRUQFC2ePkssud4U3bwJwO35d6oqMld5sB25iB8at2eWOOied21klGGdv7ky1/MUjC+3X90FWrL8Zo1iy7FFSPIREYHH4B1Xt0GYc6uvIIz9Yn/X/PmZrrD2oOl3/isHJbybwOj5sCB5ic9nbsEIq2RnvqAznKuxt3jSU51MmreczH6hCIWCE7ZzsPwmvKMMpq7b1y3MVcmACbMox4dwUikyvSkALGc2AQL9jQdNYb5Zjb/vxuZcu4sMcQgVDBxoYpHR7YLnRPRPJJN1FHgOywwxG6oKIszmltyrBANOuqcw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748955651; c=relaxed/relaxed;
	bh=r0f0rDdQI9JtcODUz8UbT4rs2Gv29SPYkIxKjn9q+Vk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aZbnxomt3HrEFtTPWt1nS6gDscLgEm/VYVTRY8ewU/JyU6pB895CVLclbGC2ss3xdfsiegtr7Y5waHrYJnbcZ7qNA6xqhUqLhRrfc4x9V844FVWnRP/imQW0835OTiKuXkavLrqSpGFAmIQJiNBvuN+kTsYZxEXWfrpK77PjtGcW6hO/f3Fqln4+Gq3N+qetOGS46nez1A2/XPxMwvxFcoKkMXfBOf5yhAVVJw/bCgZuc387Vz6K2QzsMh/eilgDqxb4iBfY5HWMqcF/jk+xT90WTtzvep74oKO9LA5tuerNiuRbaSbU7VqUpfLh9Kce+ykqNnByjc7oULALfx33YA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=avm.de; spf=pass (client-ip=91.218.175.183; helo=out-183.mta0.migadu.com; envelope-from=nicolas.schier@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=quarantine dis=none) header.from=avm.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.183; helo=out-183.mta0.migadu.com; envelope-from=nicolas.schier@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 93 seconds by postgrey-1.37 at boromir; Tue, 03 Jun 2025 23:00:50 AEST
Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBW6V36qGz2xXP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Jun 2025 23:00:50 +1000 (AEST)
Date: Tue, 3 Jun 2025 14:58:47 +0200
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Nicolas Schier <n.schier@avm.de>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andreas Larsson <andreas@gaisler.com>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Borislav Petkov <bp@alien8.de>, Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Chris Zankel <chris@zankel.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Jonas Bonn <jonas@southpole.se>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Naveen N Rao <naveen@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rich Felker <dalias@libc.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 2/2] arch: use always-$(KBUILD_BUILTIN) for vmlinux.lds
Message-ID: <20250603-sturdy-gaur-of-security-7effbb@l-nschier-aarch64>
References: <20250602181256.529033-1-masahiroy@kernel.org>
 <20250602181256.529033-2-masahiroy@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250602181256.529033-2-masahiroy@kernel.org>
Organization: AVM GmbH
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jun 03, 2025 at 03:12:54AM +0900, Masahiro Yamada wrote:
> The extra-y syntax is deprecated. Instead, use always-$(KBUILD_BUILTIN),
> which behaves equivalently.
>=20
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>=20
>  arch/alpha/kernel/Makefile      | 2 +-
>  arch/arc/kernel/Makefile        | 2 +-
>  arch/arm/kernel/Makefile        | 2 +-
>  arch/arm64/kernel/Makefile      | 2 +-
>  arch/csky/kernel/Makefile       | 2 +-
>  arch/hexagon/kernel/Makefile    | 2 +-
>  arch/loongarch/kernel/Makefile  | 2 +-
>  arch/m68k/kernel/Makefile       | 2 +-
>  arch/microblaze/kernel/Makefile | 2 +-
>  arch/mips/kernel/Makefile       | 2 +-
>  arch/nios2/kernel/Makefile      | 2 +-
>  arch/openrisc/kernel/Makefile   | 2 +-
>  arch/parisc/kernel/Makefile     | 2 +-
>  arch/powerpc/kernel/Makefile    | 2 +-
>  arch/riscv/kernel/Makefile      | 2 +-
>  arch/s390/kernel/Makefile       | 2 +-
>  arch/sh/kernel/Makefile         | 2 +-
>  arch/sparc/kernel/Makefile      | 2 +-
>  arch/um/kernel/Makefile         | 2 +-
>  arch/x86/kernel/Makefile        | 2 +-
>  arch/xtensa/kernel/Makefile     | 2 +-
>  21 files changed, 21 insertions(+), 21 deletions(-)
>=20

Reviewed-by: Nicolas Schier <n.schier@avm.de>

