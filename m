Return-Path: <linuxppc-dev+bounces-2422-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 464A49A5139
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2024 00:17:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWGCL627Kz2yLg;
	Sun, 20 Oct 2024 09:17:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729376238;
	cv=none; b=oLYuRZfHr6NlycVtAjwxh3oCPv/x4yot2IWVxCW0ZtkWhafrnHbIDojev3/M6xpfh0RlLCeRUhdF8FI6tv2pZo5JVTjv7cgZt8pQqLT0MoJ7Najo1HDGSXpsEbG7F96wlmCbyqStTqQpg04BqJ2efah6OneVTspfJuQUlX6j2A9AuxrpDFLGayVX/avN0HRhLvs/DKRg6Mwc0NNgCiUNR8leXjK0xJTX75emwpdtV9cQ7TGJc2OhvrDpxd+9ZveGbINNYRkFn8acgpvljKDj0rEkV9Mgtc2214T4lvhvFbOvmMAQ+ZCHGcKtJnmBm128LkNDIjcR9HEdKvPL4Ox+NA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729376238; c=relaxed/relaxed;
	bh=J8neFLH65vUyWmWIgY7wipZgUu3sVyGFmmQDvuZjGWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IWN9tvTANfLQnir1jdXQOtIkZ39Ta7Pm48MPFW+QDGnkb7AfeFW02dv6I7azrQ2DGtwZwoRhEwdRKnsDtK48WGOtXT4EH5pFVNdzyp3vHBCziKpo9ZPcrcq3YETt7mDLNhc0xBVaG7L9ysqR5h931eqN/zY0fVTxSx/UQ0qe4zdOcm/Kgr8LnsHDnouLL/ZybKBt49opRH305WoxrTJbul/4heHEaIf5Av4B5qJrHS/+sAUE0APTkC5dVajdu5nxMqyrZ2ukpikpWdgLCgyUE2n+QHr1NPHQTqgnofXAPf/zWECLUNX1KspzSV28qQwGXoOC0f5O7i+jq8BoMUxK3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y3/Gl4uf; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Y3/Gl4uf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWGCK4Dwrz2xdZ
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2024 09:17:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 01DECA40448;
	Sat, 19 Oct 2024 22:17:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2BF9C4CEC5;
	Sat, 19 Oct 2024 22:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729376233;
	bh=Z2c0wsfmuX1zi8SflpbS251BcU2hxlDOujSruYyu/d0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y3/Gl4ufOW+DMjq3rv6lYuhhIdTKFTpnYyq9HW3K85Fpw/HAzL0vMrW4IM6WgA6ot
	 bjEzE8mPv3G48TEzrc49STj8tErEueRnWJWErlpFGCRDNYXxf9im+wvXTmSV4zaKV0
	 ldRIuiJMSPHK7+jcRgJoan6AukGaTfuRN0fLb0k4bEoOLO4bzzu30c0zr4xQe5rqsB
	 ele2dWq5/Lat3gCmSxFXcXRfJdqOONJR5Y9PAtRblqYiPb3tzG5o6SkuYpbslQB3Wg
	 ZrBARuLjQoY8sKdBblenF5FJQAR6rsrhvv/Ra8Vcs8mcf/tC+y4RqwTBTJVaeAg57/
	 Qr4B5j9wt3E/A==
Date: Sat, 19 Oct 2024 15:17:10 -0700
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
Subject: Re: [PATCH v6 1/8] mm: vmalloc: group declarations depending on
 CONFIG_MMU together
Message-ID: <ZxQv5vUuaFBT6Kxd@bombadil.infradead.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-2-rppt@kernel.org>
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
In-Reply-To: <20241016122424.1655560-2-rppt@kernel.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 03:24:17PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> There are a couple of declarations that depend on CONFIG_MMU in
> include/linux/vmalloc.h spread all over the file.
> 
> Group them all together to improve code readability.
> 
> No functional changes.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis

