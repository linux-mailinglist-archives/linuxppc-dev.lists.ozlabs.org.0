Return-Path: <linuxppc-dev+bounces-2428-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 90E449A518F
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Oct 2024 00:46:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XWGsC3Nsbz2yNB;
	Sun, 20 Oct 2024 09:46:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729377999;
	cv=none; b=dnGhWJkiXH/Fxnafl3eXLk1830gR1m4FdYkfM12/R22Iro3sNHBVbqVMLA40Mkw17yz9AaFNT5TYdPRyIoH25VzE593bjHOzWsAVvzpIZoDdx/u/iOyDWzdijJ5rqGKE+Q8/AXqdtg3fqBsdLRCex4thxaywxyF2FRSe3GY8cFkQQWvJO6PUS6rk8fFWENTapXmahb2O0EQAXSxZtaoxC0SYzpH1H1lXyQp+Eh1Kq7GW1K5mmD92RHijGe+lgJdyn46FKLvI/EUGWuIZUFI7VDOeq6QBqUNwlvZGa5hzmN99cqJiaMBoLEvx49V/nSQeLSIUNmkU1BZWXCbkvUO/Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729377999; c=relaxed/relaxed;
	bh=i3bCTk43umsvJ74jhOhtJX2DWBX3D6PnZcsnufvcp8o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G4/gh949mW5uSeNla1uNt8o7R0Tomnnp+50SCXG6WpwjmBccf+4sHolRbRXWU+jA/7TxK6iOBluua3E4xtOi4+uEkhLiAoQXb8eXnUKJ0fX9lxwNJHqdFXhaMPofx7cuOMRYOAC5jZOwTM23mgqIbd7pWvXryHNg/YlTDRWlL1Is0nYWWdoEZZmo/zkFLDskhqUlsmS15kFTZ1Cd9LPKYSQbTqgBNFyLH1m2r6xy1stuvOL6CK/O4oeEaZuV2q0IahxNMTNuiIkNnF0b7Nq/VPuaSJKNrrQVlLbnh4XbYQo1Rdmu6qjudS5Eed9MKXHUAkE7Ruy0zdU0sM2M98pNSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E/HcNmd7; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E/HcNmd7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XWGsB3yF5z2yMP
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Oct 2024 09:46:38 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33F055C4818;
	Sat, 19 Oct 2024 22:46:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D541DC4CEC5;
	Sat, 19 Oct 2024 22:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729377996;
	bh=dleiBE3DRHjc0T5DFKoso12VqwoykDzNi68HaltnD+Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E/HcNmd7ed6EfnQjDeLvwQq16g+Vsiv91/gyx/y3TItNr4YkOF+9xlSWM0ng70Enb
	 EfQ6W4qibdSpAat3tAcZGmRc2fYXuiLLcBLOJtlO4aLao4cugNUMhYe3/mMMvmvtmy
	 krht2xWJJkTziTYXrwNtx86c1tpAc1wx4O+74a08EUURK7gKF4cC83WTcGcLjOwACN
	 n9SpaJ43uCBmVLtR63Yq/0dZR6w3adjYhhvHR3c4gz6MmpunQYU1/SMh4aCN+n+wuE
	 IRlpcRBMlqjvJmJuEblyO3hK3/FE9x/BIX1JtKqvt7PVEBtM1ZKA1cHBB7OuMGy6AB
	 uYsHEV9N9bs9Q==
Date: Sat, 19 Oct 2024 15:46:33 -0700
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
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v6 8/8] x86/module: enable ROX caches for module text on
 64 bit
Message-ID: <ZxQ2yddv8blWOFDY@bombadil.infradead.org>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-9-rppt@kernel.org>
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
In-Reply-To: <20241016122424.1655560-9-rppt@kernel.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 03:24:24PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Enable execmem's cache of PMD_SIZE'ed pages mapped as ROX for module
> text allocations on 64 bit.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>

  Luis

