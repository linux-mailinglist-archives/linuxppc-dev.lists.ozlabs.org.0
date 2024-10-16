Return-Path: <linuxppc-dev+bounces-2306-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 023279A07B3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2024 12:45:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XT6zt6RwHz2y3Z;
	Wed, 16 Oct 2024 21:44:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729075498;
	cv=none; b=SlDm39nJtg68LV8di5wUrX09fjal58KW9N8VYe+A47qZQHXmW44qikqu9Q4eM50d95RpEZcnkABaRETAeRx8hN2+I2h55i44GtU1hH7toJqFmYLQf9gYTheWdOs+Ffn9nKQM0SLbQO8YDX/vq9pvNXSnrZbNZhhz0uco6GNSOFojdI+1/P4fEHPx8XrfRXexC+jbDwIER/x2norhCD6WAgA7e5iRDh77aw3X0Po0rAIsUk6lbROFnSJrgt5n1Rt8bLufmswOPhTl0N40nlSh9ZKNG+KFePkcmUA+2f4jHIcb6AEJLRwBb/BH/xy5vBh5XOT7Bnd9BzWD7dmNBoZylQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729075498; c=relaxed/relaxed;
	bh=IJ/fbmZrOQ0WiBQGxvnDjUBF5iSxmGU1H7rV7VMVhIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cfHbyZJVSz8RgzYi5rm7V9BRT0W2bmlc+NTJI4yUiBqgRhSZFo+EkawbfGBBeNZdYwsZGaW+hJ/rN1Pui3xIY8r0XlXSyaZSAe6w1k/lUXCur+1jQd1CfvYlhFFIl940CxtgqkvdNG9A8O9z9y78ll05UTsrJTXIHwTepQNMepkgqUoSyNNiYdZmCAdkYEe8VnG0MQomrXHunveTMft/IGukqn1lCcchAF6ztwxSmWQ6dge6hMk005d6+al4aHKBT0XVY8GNqe+qT1ky85TOOb33MYTqePFSdFMadbSoiQmrGDc1VO+E6QGwnsGNViWXKqPIHTOvflh/7m3qzJvNhQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tu7R+TE5; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tu7R+TE5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XT6zs5LDmz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2024 21:44:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D240E5C5FDD;
	Wed, 16 Oct 2024 10:44:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A439EC4CEC5;
	Wed, 16 Oct 2024 10:44:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729075491;
	bh=REY0yUs/eb8jGqS7iPmNLu0O7M3zjCPm2K1uOQnlIfY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tu7R+TE5l4rMjxEyzDDIH6fpt5ZNmC1c7xJx7SQDlI9CzDxMt5yOQnVYNAW9hdV8J
	 OeaDo9Hr12xvhUKQgId1tm4/CewmMpWCLOk3wgiUJwXyvWq4QlFB+Uh/pOgd95q0F1
	 zyNekZpzro5oJZ2JEUpyorUNUZLep/wgUFWwzFdkGHL+BF7JNIRifDS33KF/5qGC2v
	 jYrUvBLfr/xZZ4LfL7bWflm1YPeuIUzgGbLP+eWNj7AbuOUcsPGdhrgXCl4uUGrO38
	 j9PqqivnqqmoYQsjfU9edkgWUJ3Ic8/MVLUiY8xlv+pKvbZQmwKQdokHEcp8hCdCUB
	 nLnfE4mx3UK6g==
Date: Wed, 16 Oct 2024 13:40:55 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>
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
Message-ID: <Zw-YN4JIltntY52Y@kernel.org>
References: <20241009180816.83591-8-rppt@kernel.org>
 <Zwd7GRyBtCwiAv1v@infradead.org>
 <ZwfPPZrxHzQgYfx7@kernel.org>
 <ZwjXz0dz-RldVNx0@infradead.org>
 <ZwuIPZkjX0CfzhjS@kernel.org>
 <20241013202626.81f430a16750af0d2f40d683@linux-foundation.org>
 <Zw1uBBcG-jAgxF_t@bombadil.infradead.org>
 <Zw3rDS3GRWZe4CBu@bombadil.infradead.org>
 <Zw4DlTTbz4QwhOvU@kernel.org>
 <Zw7MirnsHnhRveBB@bombadil.infradead.org>
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
In-Reply-To: <Zw7MirnsHnhRveBB@bombadil.infradead.org>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 15, 2024 at 01:11:54PM -0700, Luis Chamberlain wrote:
> On Tue, Oct 15, 2024 at 08:54:29AM +0300, Mike Rapoport wrote:
> > On Mon, Oct 14, 2024 at 09:09:49PM -0700, Luis Chamberlain wrote:
> > > Mike, please run this with kmemleak enabled and running, and also try to get
> > > tools/testing/selftests/kmod/kmod.sh to pass.
> > 
> > There was an issue with kmemleak, I fixed it here:
> > 
> > https://lore.kernel.org/linux-mm/20241009180816.83591-1-rppt@kernel.org/T/#m020884c1795218cc2be245e8091fead1cda3f3e4
> 
> Ah, so this was a side fix, not part of this series, thanks.
> 
> > > I run into silly boot issues with just a guest.
> > 
> > Was it kmemleak or something else?
> 
> Both kmemleak and the kmod selftest failed, here is a run of the test
> with this patch series:
> 
> https://github.com/linux-kdevops/linux-modules-kpd/actions/runs/11352286624/job/31574722735

Is there a kernel log to look at? Could not find it in the run report
 
>   Luis

-- 
Sincerely yours,
Mike.

