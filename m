Return-Path: <linuxppc-dev+bounces-8674-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43479ABC579
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 May 2025 19:20:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b1PZj40wXz2xWc;
	Tue, 20 May 2025 03:20:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747675213;
	cv=none; b=ScGVq/AkYFPfodtq4wFqLwkmRhYmfip6yHrORltFIbg4Thu5HqID/ry4HsirP3+KD5G2Y0spsuSxUgUuXxkbKaiprsK2pvab8zsKxOFSnXM8PFuUsE8f1f6I/f6A71JSMVedO4W11rsb+A25muF9yY7eeMaWxOzdslAh8zdYu/JGW87UzHfVVNWN4GJuc+Rg9nJBXeUPn/nRHbYasm/uZgWZUdhypTySvIpp55cmu20i6XZZ5wVXU6fRvPl1J+yhMjJFdtl2iA5pfQIU2+jJH3NA8BoZ48Ti5eojyOeULsGIYV/u5IpKbKBpPvlgemv/RX13THxqj3SGVmZxDShl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747675213; c=relaxed/relaxed;
	bh=82Q3lnjfEFrzEMTrgCM5r+zlsMR9gpMlajn90gQ21MU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=emuflJjjYBxknjnfqokCj9tjv2FEq8+xMWurkQb0e+cetvkykY+O6rOlykwoSrm1O2Om9GqX0qGSfz2mVXxAzpIHNJLdVNAj9zYA9shwYGhxHKXNrL+/vDUMyEBx+InLjOaf9oDQtzOrhv3oP7SPvur+NocT538rP/fxR7BpNIJzLV7QvJo255AN1MjutWk+37txHRxcX93i7gcnt+H0/wkNWcOpUpYqEvtoZIxfB99IJwLiBCLDsJr/tgswUIJO3SkcuR1tyHnKOjqOrCqcfVkJM5HT9tXfdyh9fi6w3KvLlvnVAM/3iQZ8Omj4r0IKkR4Pr8pGvxh1k7PcR+KJzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nv6a6o/9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nv6a6o/9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b1PZh03Mlz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 May 2025 03:20:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 984855C5516;
	Mon, 19 May 2025 17:17:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0486C4CEE4;
	Mon, 19 May 2025 17:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747675208;
	bh=/qDPGAJe6QWZQRFh5mkIaN3rUECBPrvhVDophOu0STQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nv6a6o/9GXqFce+WdqziKMZrgOnXd14Xk3g4S1nNlUHZltfdV2rEB9RDQCOmCeSgK
	 ebQsjcpfmgR6sWVWBw5dta/I6m1xLYkae6rTJ4OSb859vEywgddyloj50eaFEjRTPe
	 8FJ2qDU6rfYPGiDk1ORLqVzTGk/lQ8qlSrYclPnaRHuqKyuUafe4DFZ6lMgRdY6Wt1
	 dRptEgZtQ8qGZDrQUwGD8JbkbioWwAY9aSpa8iIJWxNVsecoqluy1Xci9uIALX28U6
	 ObnLi7IgFlid4DAXOMe7kw3cQbAB55J7ruXkv/fKErQRWuv0MXWPHfuo3pZS732DBZ
	 yyZPReh2t/BVw==
Date: Mon, 19 May 2025 20:19:48 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
	Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mark Brown <broonie@kernel.org>, Matt Turner <mattst88@gmail.com>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>,
	Stafford Horne <shorne@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vasily Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>,
	Will Deacon <will@kernel.org>, Praveen Kumar <pravkmr@amazon.de>,
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v2 10/13] arch, mm: set high_memory in free_area_init()
Message-ID: <aCtoNLf1FbtqijGr@kernel.org>
References: <20250313135003.836600-1-rppt@kernel.org>
 <20250313135003.836600-11-rppt@kernel.org>
 <mafs05xi0o9ri.fsf@amazon.de>
 <aCdveN2w9ThjVhae@kernel.org>
 <dc4e60dc-9b78-473a-9c18-3a2f128a02d2@ghiti.fr>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dc4e60dc-9b78-473a-9c18-3a2f128a02d2@ghiti.fr>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Alexandre,

On Mon, May 19, 2025 at 05:54:23PM +0200, Alexandre Ghiti wrote:
> Hi Mike,
> 
> I encountered the same error as Pratyush and the above diff fixes it: do you
> plan on sending this fix for 6.15?
> 
> If so, you can add:
> 
> Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>

Thanks!
Here's the patch:
https://lore.kernel.org/linux-mm/20250519171805.1288393-1-rppt@kernel.org

> Thanks,
> Alex

-- 
Sincerely yours,
Mike.

