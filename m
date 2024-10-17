Return-Path: <linuxppc-dev+bounces-2338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35A269A1E8B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 11:36:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTjQ43HLVz2yHs;
	Thu, 17 Oct 2024 20:36:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1:d65d:64ff:fe57:4e05"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729157772;
	cv=none; b=Ze0bFJxzayJDrw/CpWwmhrPccaS+toyMbu5wdj89HwG1Zj9adjB+WAa6nT/FMd/4donWvKqXLJETtNwekvgGNXt9P150I5G6bpRofQ5vZlp4sT13PScFQXmy9zqq4ePSCiIEPVY7XqYNF4W1Frfiga3RauaM7hIMGEIlfnVacQHd2+sjEiWOhEn8U+8IPm+EQM4qITQys7i8jNneuHXm2u0prBQBgBQQWgRD2CKpFv8Jdkl0NHQwSncTgaZwCKuO8JvKFXsAnK2GYsOJTr7LcaO0AsyjGpnGN2S2aqKO6PUqlZd1XgDCZUGzhQFu6uYoh6qLJHfaRGVBZW7KxL1V4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729157772; c=relaxed/relaxed;
	bh=VVu7cX1SI2+XfnYlKmwbrDG3+CJWOAmt2jAl9wbUo9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGhsXyfgP60OtP2iQZINq+IHjfFE+UN//DN7YYKmt52Ouod8smeHOEstAIDqr6VU7y+qSmH9Nx0coOzMSjRvCrUDKZZyQNZi/vsfgGRoebWawvofxh8DHAG4cZyqIeBXVRyB6mvCAYhLmfctUGXkzWGAUAna73e5B54yRHCGRBFul+z9WFTywBiJ0CDSRq6bferpFku+L9f6JFiwWRg3rugJWHMsWbr3rV0AHqv87ZXwtiW2EyXkdHKSe21+smQHFqkfYfxBP/uLYRgoW6Pk+5sGqZ7lgOsxvntYkLM3AbmAph6OjMc2sihpDIXxRSrW/XdlK5uWL2xeuYITR/hgXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTjPt2sq3z30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Oct 2024 20:35:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VVu7cX1SI2+XfnYlKmwbrDG3+CJWOAmt2jAl9wbUo9k=; b=XiFI8B0ovduSIe40JjuY242meO
	1tWdoXPB8Y4u6FvdJlkOh0pr/b+ptTLEARYM4Fz0YcPpgeZ6S8vIFL3pv7C67je495kkW38x9jgPx
	kZcvMosNEICP21MaeTfL4OcNrqj3D/g6hBzGdP9sE2b36zBWvYJp4QWDybwMxKdlcL3ZpeYi7ki7+
	suQtk2YIywEtSE8+GUQPkWxddDo9J2uY+LZoII7Oa4V1WDt8U55u9QC4d2zaOtcNPZVh6JsT6n2VV
	yz3mabQVBKOF3bVpb3D/1s3d5tFfjBLa1mZAU7RdfOnmovvB/POi51RCfYsgOa7ik7FCs2q+EK5D6
	fjlJqizw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Mua-000000075pE-1Ofh;
	Thu, 17 Oct 2024 09:35:17 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EF73A3005AF; Thu, 17 Oct 2024 11:35:15 +0200 (CEST)
Date: Thu, 17 Oct 2024 11:35:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
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
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
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
Subject: Re: [PATCH v6 6/8] x86/module: prepare module loading for ROX
 allocations of text
Message-ID: <20241017093515.GU16066@noisy.programming.kicks-ass.net>
References: <20241016122424.1655560-1-rppt@kernel.org>
 <20241016122424.1655560-7-rppt@kernel.org>
 <20241016170128.7afeb8b0@gandalf.local.home>
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
In-Reply-To: <20241016170128.7afeb8b0@gandalf.local.home>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 16, 2024 at 05:01:28PM -0400, Steven Rostedt wrote:
> On Wed, 16 Oct 2024 15:24:22 +0300
> Mike Rapoport <rppt@kernel.org> wrote:
> 
> > diff --git a/arch/x86/kernel/ftrace.c b/arch/x86/kernel/ftrace.c
> > index 8da0e66ca22d..b498897b213c 100644
> > --- a/arch/x86/kernel/ftrace.c
> > +++ b/arch/x86/kernel/ftrace.c
> > @@ -118,10 +118,13 @@ ftrace_modify_code_direct(unsigned long ip, const char *old_code,
> >  		return ret;
> >  
> >  	/* replace the text with the new text */
> > -	if (ftrace_poke_late)
> > +	if (ftrace_poke_late) {
> >  		text_poke_queue((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
> > -	else
> > -		text_poke_early((void *)ip, new_code, MCOUNT_INSN_SIZE);
> > +	} else {
> > +		mutex_lock(&text_mutex);
> > +		text_poke((void *)ip, new_code, MCOUNT_INSN_SIZE);
> > +		mutex_unlock(&text_mutex);
> > +	}
> >  	return 0;
> >  }
> 
> So this slows down the boot by over 30ms. That may not sound like much, but
> we care very much about boot times. This code is serialized with boot and
> runs whenever ftrace is configured in the kernel. The way I measured this,
> was that I added:
> 

> If this is only needed for module load, can we at least still use the
> text_poke_early() at boot up?

Right, so I don't understand why this is needed at all.
ftrace_module_init() runs before complete_formation() which normally
switches to ROX, as such ftrace should be able to continue to do direct
modifications here.

Which reminds me, at some point I did patches adding a
MODULE_STATE_UNFORMED callback in order for static_call / jump_label to
be able to avoid the expensive patching on module load as well (arguably
ftrace should be using that too, instead of a custom callback).

