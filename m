Return-Path: <linuxppc-dev+bounces-5338-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C199FA137DB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 11:29:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYfHs5ggXz3bjs;
	Thu, 16 Jan 2025 21:29:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f9:3051:3f93::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737023385;
	cv=none; b=V+SG+9zn0A9VLQDx4zUha7elEeNopDKD6uNroAaLmGWXs4GWzUL51mN2krpO10uRzsp75dN4+/yW5KwSz6LWo/jUbHj1M3ZGhesW2IAHB1vw8fsoZFoocIWLcdZFwEz+kvrnToO7DLLkaMeB9WIgi/nLAD7Ow5MANPn+xAbM0eApGlimjcA5T+1nie+k7vIkLAAgx9IFU+AEsmHvbiChHpVFfDrMbRcjyauvbCMUyt9rJ3yd0XsuYhwzM3GtqDvmH7mqZr5lMy9v64jS9VFPcG9LPg9UieIDC6xE7vzAqmu4DU42FOxZ73x5+w0O/Yn5bs3ZqWIqmGxzFJ+1k+A0dg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737023385; c=relaxed/relaxed;
	bh=GQBvA11kyxIGOlMc4gw5ALfkgQqX/TyrIH9O3oAvLFA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llhMGARHC/ekxsjH3d8NYEgae2tpuFsfXmlFP0cu+oZYkKl8tgt629BoCdsb767PYz/Dw/lhr9I6O6imYtRshBVaoIf3fvgUK0Rnl3mgzn5a77MchOxNv4C1X7UwGpzArDHwY4XVa0TBMj0d0BkVIPRLBkyKWSyqudjXOvAMJEqSg7/e/3VC+k2mMqywLgIiSgCPWha91dWOddzkj6niuYP6Hb671gLH4vdQNtp/mafI/OqWbOXeRRWLfegoe8FSHqDPjVid8d25vi44c2IQL0iFAnQ+K/V2QBHLpJqbzHskHHLHTfHpgGTQb24ZhsGh6etTk/tA96JAKDn5u7cLog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=FM40lE/0; dkim-atps=neutral; spf=pass (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=FM40lE/0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 36462 seconds by postgrey-1.37 at boromir; Thu, 16 Jan 2025 21:29:44 AEDT
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYfHr4x7bz301n
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 21:29:44 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id C3C7840E02BE;
	Thu, 16 Jan 2025 10:29:39 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id MFOmT_gDX9aa; Thu, 16 Jan 2025 10:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1737023375; bh=GQBvA11kyxIGOlMc4gw5ALfkgQqX/TyrIH9O3oAvLFA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FM40lE/0clitssFsEKe5JK0a143dAnkAItQNq6yMfahZmpGeSTt09D5HGf0pFLbt8
	 ulpp29oYaFstDERke8ThqjtXoN04wo6eTBNIkCpJpYEXzS9U9b6shsRrnjlVJY+eKW
	 TBn1/+CZ9ngMH08pwT66FQz7AXQy6uCPmHYlis0QOsac6iB9mWKsXjQbzbnmjnFYRL
	 rZuO8syduQMjrFLSjkGi0HDUyE5i/fs8xiEFxdQfkwB7MgmrqT5n5XzifvkD8pCoqz
	 5X1jUm0gItWfUGbyRkcvKB+w0NCTaoWmvE8UGl8msx3A8F9pgsooW7AjKtjxpPd8Lg
	 Fb16TJfn+gMvgYR9ZsMlvBBT0VyKZ8xqAHFUwbZBUJJBetncTrqjjppvD9l7XGyf4m
	 juTTN1zpyhjrfd7TJsAviRyvUSFuCvbml3Dt2L9NGpEIVm/zwFrWYVYuT654H8gFk2
	 2Yj2R3th9hwTaGTH/t/mjjo+AyzreQe3eFBzv5ejybagmNkRrbkC3tIXtHARl+Igxz
	 KDg7YnAEPlNEP63WkcD8y4HxsuP37idpXVeYFeL/U5iPMx4eRF2w1AcbW6UgXuHjtO
	 b3RYhp+4K4Ia7A1PVcGG9NkyVI2JCvCFPMGn35tDMiM9QmJ3MEVxqzNgvDl6r7hKMW
	 MGq/1HBafOJLETwhOQ5EmCKY=
Received: from zn.tnic (p200300ea971f93c3329c23fFFEa6a903.dip0.t-ipconnect.de [IPv6:2003:ea:971f:93c3:329c:23ff:fea6:a903])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9F55140E028B;
	Thu, 16 Jan 2025 10:27:52 +0000 (UTC)
Date: Thu, 16 Jan 2025 11:27:47 +0100
From: Borislav Petkov <bp@alien8.de>
To: Brendan Jackman <jackmanb@google.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Guo Ren <guoren@kernel.org>,
	Brian Cain <bcain@quicinc.com>, Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Dinh Nguyen <dinguyen@kernel.org>, Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Christoph Hellwig <hch@infradead.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mike Rapoport <rppt@kernel.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Dennis Zhou <dennis@kernel.org>, Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>, x86@kernel.org,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-arch@vger.kernel.org, linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, kvm@vger.kernel.org,
	linux-efi@vger.kernel.org
Subject: Re: [PATCH RFC v2 01/29] mm: asi: Make some utility functions
 noinstr compatible
Message-ID: <20250116102747.GAZ4jfI9HG3K-PW7nf@fat_crate.local>
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
 <20250110-asi-rfc-v2-v2-1-8419288bc805@google.com>
 <20250116001858.GDZ4hQctZe_PFvJ0AJ@fat_crate.local>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250116001858.GDZ4hQctZe_PFvJ0AJ@fat_crate.local>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 16, 2025 at 01:18:58AM +0100, Borislav Petkov wrote:
> Long story short, lemme try to poke around tomorrow to try to figure out what
> actually happens. It could be caused by the part of Rik's patches and this one
> inlining things. We'll see...

Looks transient... The very similar guest boots fine on another machine. Let's
watch this...

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

