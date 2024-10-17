Return-Path: <linuxppc-dev+bounces-2349-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40D269A24C9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Oct 2024 16:17:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XTqf66XFSz2yMt;
	Fri, 18 Oct 2024 01:17:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729174622;
	cv=none; b=YG5ZM4DaQWeg0kMtH0CT9iJCqFvufTNpCnMOhxc+pYHOSpeDXNvr3x2Kjc3KG+it2WItGkKdH1of9WCRhriqE3hqzyvz1LYWD5zVmjsUOx0Hw38JbhjYXKmVcUBY/YSf43vVLJoVnc9Tapi5uTALVtkbw9rH9mC/cCS2gbVeLYH2KsJQ7H5OQC7APYY7fs6IHy1acwvUiP4BHuN+OEjGOr/Rtv/YhMXM5PKDSe+7Bhe2ITT62MYY45Vs+eqP1avjNUX0TQgBUQQVuwyX6V0axlNR5i3fwFZBhWXbpSyQfXl96YxCYEhTRvXOYXOIZXvJcRfz/timHbLUrE1E2EFf0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729174622; c=relaxed/relaxed;
	bh=0RENO6sDDMYvvOCfRHws5B4+D5uhU/+pdf+qOzKG6CE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N2jiu05HYj+8ja7sWFjtNJao77PMp/CD32JuSjz0W2NbnjTKxvBmGmXjOCCMjEX6xEXWHiRfz+VC7FAPnQcou9nZt03FjyqTGn8govd0sUCa+iiDx6+p/bDwicb+yZl5Fo+WMeGv6j/sf2/VuHhQLvB1McCxIMdPC8W9lhFXq5tuNN2PWHrZuvDf37/Flm6TrOfBnYfpu3ttqfaPmpeHbFMriyCiylrcd33fDr+lo57ZQyqFGqlfz2h8mLzQG/LZ/h5aIJmtSR1O52F7HiKq9Boau+R08pBVm9QTK+DSjIZUYFVfAXucfyZVCDDkmE83hJrYiiJaFDUwCOX13mKq1Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=o9tl=rn=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=o9tl=rn=goodmis.org=rostedt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XTqf43zccz2xfR
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Oct 2024 01:17:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AEE875C4F0A;
	Thu, 17 Oct 2024 14:16:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E652CC4CEC3;
	Thu, 17 Oct 2024 14:16:49 +0000 (UTC)
Date: Thu, 17 Oct 2024 10:17:12 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Luis Chamberlain
 <mcgrof@kernel.org>, Andreas Larsson <andreas@gaisler.com>, Andy Lutomirski
 <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann
 <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>, Brian Cain
 <bcain@quicinc.com>, Catalin Marinas <catalin.marinas@arm.com>, Christoph
 Hellwig <hch@infradead.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dinh Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven
 <geert@linux-m68k.org>, Guo Ren <guoren@kernel.org>, Helge Deller
 <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Kent Overstreet
 <kent.overstreet@linux.dev>, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Mark Rutland <mark.rutland@arm.com>, Masami Hiramatsu
 <mhiramat@kernel.org>, Matt Turner <mattst88@gmail.com>, Max Filippov
 <jcmvbkbc@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>, Michal Simek
 <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Peter Zijlstra <peterz@infradead.org>, Richard
 Weinberger <richard@nod.at>, Russell King <linux@armlinux.org.uk>, Song Liu
 <song@kernel.org>, Stafford Horne <shorne@gmail.com>, Suren Baghdasaryan
 <surenb@google.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Thomas Gleixner <tglx@linutronix.de>, Uladzislau Rezki <urezki@gmail.com>,
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
Message-ID: <20241017101712.5a052712@gandalf.local.home>
In-Reply-To: <20241016170128.7afeb8b0@gandalf.local.home>
References: <20241016122424.1655560-1-rppt@kernel.org>
	<20241016122424.1655560-7-rppt@kernel.org>
	<20241016170128.7afeb8b0@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 16 Oct 2024 17:01:28 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> If this is only needed for module load, can we at least still use the
> text_poke_early() at boot up?
> 
>  	if (ftrace_poke_late) {
>  		text_poke_queue((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
> 	} else if (system_state == SYSTEM_BOOTING) {
> 		text_poke_early((void *)ip, new_code, MCOUNT_INSN_SIZE);
>  	} else {
>  		mutex_lock(&text_mutex);
>  		text_poke((void *)ip, new_code, MCOUNT_INSN_SIZE);
>  		mutex_unlock(&text_mutex);
>  	}
> 
> ?
> 
> The above if statement looks to slow things down just slightly, but only by
> 2ms, which is more reasonable.

I changed the above to this (yes it's a little hacky) and got my 2ms back!

-- Steve

DEFINE_STATIC_KEY_TRUE(ftrace_modify_boot);

static int __init ftrace_boot_init_done(void)
{
	static_branch_disable(&ftrace_modify_boot);
	return 0;
}
/* Ftrace updates happen before core init */
core_initcall(ftrace_boot_init_done);

/*
 * Marked __ref because it calls text_poke_early() which is .init.text. That is
 * ok because that call will happen early, during boot, when .init sections are
 * still present.
 */
static int __ref
ftrace_modify_code_direct(unsigned long ip, const char *old_code,
			  const char *new_code)
{
	int ret = ftrace_verify_code(ip, old_code);

	if (ret)
		return ret;

	/* replace the text with the new text */
	if (static_branch_unlikely(&ftrace_modify_boot)) {
		text_poke_early((void *)ip, new_code, MCOUNT_INSN_SIZE);
	} else if (ftrace_poke_late) {
		text_poke_queue((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
	} else {
		mutex_lock(&text_mutex);
		text_poke((void *)ip, new_code, MCOUNT_INSN_SIZE);
		mutex_unlock(&text_mutex);
	}
	return 0;
}

