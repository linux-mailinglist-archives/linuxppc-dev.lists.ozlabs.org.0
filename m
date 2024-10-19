Return-Path: <linuxppc-dev+bounces-2426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3827B9A5171
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2024 00:32:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWGYK0qNJz2yMk;
	Sun, 20 Oct 2024 09:32:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729377173;
	cv=none; b=KBBtEZz3KPrdyqFRHAX9oLg4lp1Ch5eeKRzQal7b/Di/MKiBBVLuGTbkI5RoT802siPg8hMdsaRozcgPN8c5Vqogtea8sEmKOTjRWznl9FMrGcC1F9S2nr3QbLBqTDxfRtkUfNrUFQN/HzgEu5aEoht3Qtn8QY7kGyqyp9Cq90Vun1kGBhftxo+Vvq/cKMRrQld0Tv5TuZ70HsuiFFxYpARSHgBhOqBhniC2QorWr0r7qk8ItiZI2jQQeSImwHJC8sadp+Ufb4hvNzX8B4nD0jVDQwZh++Julq8fAyn1dZiyncTjC8jIUujmGxYfT8q+Qq0D+6j5H2gimkQ6gSTfBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729377173; c=relaxed/relaxed;
	bh=6U/MXBANaCIhbBTgy1iP8gWqP4/mPXJe/ul6wCvAkuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AxLkm8TbD4CrsntZbIqGS1UZ7fOdy59OhpYiRgo7swNf+N2CDJNiVNeb2tA3TgfNfV58flM4J8FmHfbHU2ZMqM3+MNbANmtTpFmSZQPOXgv55dv9kXk0VZLOQ7Ixpj1m8ABlQZAD6pF4EQIxnJ5Vcguy/6Z9k+ettwWztfSm21YMWdgtb5FWJOoqOgFt/ypCGgYQyXqb/mJ1BvNswvndCMgu3ZTXqnhG98maMUtWAA2FUXkeEVLmOVRCjvGCcEJnacj5ck88S5AbP5KfdvNfA5BHjYP7N2uF9/TjHe7Vojo35KwY0PxIn3xv0+tEo8si1lJbHz8D28XuMYTel3aOGQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tFrPQGZG; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tFrPQGZG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWGYJ03w0z2yMP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2024 09:32:51 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F1013A403C4;
	Sat, 19 Oct 2024 22:32:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08CB8C4CEC5;
	Sat, 19 Oct 2024 22:32:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729377168;
	bh=tXAHb3/33MongE4AilsDsGXF/gFBIt2F2QSYX1Ig+Ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tFrPQGZG5ks5EiB9Mnc/4AmJdwPhHC/bJiwRWWIfX818gCaPcWQh1XlbBHiE/H5xN
	 F0xn4R9NyrCX5rbT4E/r2bI3eWePDaxoGl02Glr8IDOcawqbsqwcHEy31pJkVKsHd1
	 R80j5rV7rbUbChGdgHidqCABQhZUdpYtq1OU/j70YJ0eKHQEKfqrNrOXLJ6Lhywvvk
	 lEeXyrtVkQ3cXx2b3vA47dSohi5i4ZoSOIVgfvjj1oOSBCAm7WZjXI5kAP0Q/IpH9F
	 aRnwWgNhVNQVUt/uiOOxM+3soGdJDEHOHKUHGach+M7x6L3jzPDjXMTepSfZKjSd31
	 DPfJEVpKd5tKQ==
Date: Sat, 19 Oct 2024 15:32:45 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v6 5/8] arch: introduce set_direct_map_valid_noflush()
Message-ID: <ZxQzjWVTi1lvOQnT@bombadil.infradead.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-6-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241016122424.1655560-6-rppt@kernel.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 03:24:21PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Add an API that will allow updates of the direct/linear map for a set of
> physically contiguous pages.
> 
> It will be used in the following patches.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis

