Return-Path: <linuxppc-dev+bounces-2334-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5010B9A1654
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 01:58:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTSbL6t0Yz3bbS;
	Thu, 17 Oct 2024 10:58:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729123102;
	cv=none; b=DckLZ2RYFCy5UrA3mpiHKXDS4nOVyng3R1yG88OHo0uCi4En4ypqbRwqlQITjW/bXU5pAxJsAtaNITwKGRzvawL6jubgdByZs+gTr0pf2BFJgIkB8K76lImOExVj/VdNqLfAg8JJ9zGRtOj7hZknPdksGRV2tjCPeJT78uy6ShGhr9d9rMOOFemmfLkLfja2LiQ5Cu7Gsf0O1rPKwkSjURABndeJ7R3+eFLowDlwnbrWAOc7tNhUSIa0Nkkrsn64RvA/aXRGfFjxE4T3Ia+PBDCOkAl/hyafgn8rLxaob64v8CAkK2aqCl5i1jmzPpquCJPcgG+uIX6Vya13H5ZBmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729123102; c=relaxed/relaxed;
	bh=E/0jVX1ynRBLjz392OEzox61biVXJJJAy4k1d8yOf0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZmwSaGLKLG22fER3NvA4KJECTzMk8OW7DYmFZ0p5bfKZRhQi30B6EoVd5shGiY6Y+QMuOT95+XHXC+phTyGsKkvHp8N6iUotq5+5HyT+uvgPO44A3ALSNME2/52pyyLJ4Rb1kCW+sUbYPLenlfcyoUoQfFcx4WgfYDkjBtI8hsIg/rp5mxZ+Pky566lxFmFIoBPB3mQI8X9BCO1Cb0HdN8uoj2Y+gBNjU7mhRW30W2qR1iGNvFICy9xX7ENyjLmM/HW7bL8lwfoqjTyjR4PfNIkj9Ja1Cyg6OdnWU25K+9SChzUEJq1QYJB1AJSgx5J0D8VxkBVAlhWaZSLxCTSzfA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aUyJRTRo; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=aUyJRTRo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=mcgrof@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTSbK5Sb4z3bZr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 10:58:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DEA45A4293C;
	Wed, 16 Oct 2024 23:58:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0128CC4CEC5;
	Wed, 16 Oct 2024 23:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729123098;
	bh=dl4ZMMi6UkY66eeJUj39rk75iod/Rq4ydDN6GkT6Ce0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aUyJRTRo0x2+3z/2y/FQ+aEK3XYUoN8mcz2N9MbvfVeg7WtoOgXSHf9qFPMa9WqK4
	 I4Eb7NqiTNyvOxrYQ0Ck1crWzLXaJyBVvU1iHXhrLqptfZmWv1nwU+oeXM6onwo7B1
	 Bjome/eLzoTdbg0LAyDRkQaPt6vpNKaP3Fks19G43RKkcc3xWsk/OAukW5yOL9KK4T
	 DRNRLea/INzHDvb30jc2JX11dyzgwAjaplu5U/zrOnXLPkT+ALdxPNd3g3qhlwF7Nb
	 IhixQCW/u2nVSk7r2vmTsqvA+1zxrdLaddel3zcxJ5QIG57g91CYpQvbUsqReiBH8k
	 JX5BKTdKfsQpQ==
Date: Wed, 16 Oct 2024 16:58:15 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Christoph Hellwig <hch@infradead.org>, Petr Pavlu <petr.pavlu@suse.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
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
	sparclinux@vger.kernel.org, x86@kernel.org, kdevops@lists.linux.dev
Subject: Re: [PATCH v5 7/8] execmem: add support for cache of large ROX pages
Message-ID: <ZxBTFyyzZhByMjmo@bombadil.infradead.org>
References: <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
 <ZwjXz0dz-RldVNx0@infradead.org>
 <ZwuIPZkjX0CfzhjS@kernel.org>
 <20241013202626.81f430a16750af0d2f40d683@linux-foundation.org>
 <Zw1uBBcG-jAgxF_t@bombadil.infradead.org>
 <Zw3rDS3GRWZe4CBu@bombadil.infradead.org>
 <Zw4DlTTbz4QwhOvU@kernel.org>
 <Zw7MirnsHnhRveBB@bombadil.infradead.org>
 <Zw-YN4JIltntY52Y@kernel.org>
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
In-Reply-To: <Zw-YN4JIltntY52Y@kernel.org>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 01:40:55PM +0300, Mike Rapoport wrote:
> On Tue, Oct 15, 2024 at 01:11:54PM -0700, Luis Chamberlain wrote:
> > On Tue, Oct 15, 2024 at 08:54:29AM +0300, Mike Rapoport wrote:
> > > On Mon, Oct 14, 2024 at 09:09:49PM -0700, Luis Chamberlain wrote:
> > > > Mike, please run this with kmemleak enabled and running, and also try to get
> > > > tools/testing/selftests/kmod/kmod.sh to pass.
> > > 
> > > There was an issue with kmemleak, I fixed it here:
> > > 
> > > https://lore.kernel.org/linux-mm/20241009180816.83591-1-rppt@kernel.org/T/#m020884c1795218cc2be245e8091fead1cda3f3e4
> > 
> > Ah, so this was a side fix, not part of this series, thanks.
> > 
> > > > I run into silly boot issues with just a guest.
> > > 
> > > Was it kmemleak or something else?
> > 
> > Both kmemleak and the kmod selftest failed, here is a run of the test
> > with this patch series:
> > 
> > https://github.com/linux-kdevops/linux-modules-kpd/actions/runs/11352286624/job/31574722735
> 
> Is there a kernel log to look at? Could not find it in the run report

No, I forgot to include the guestfs console on artifacts, I'll do that
in the next run.

  Luis

