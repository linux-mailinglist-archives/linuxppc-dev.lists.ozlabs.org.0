Return-Path: <linuxppc-dev+bounces-5342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C482A13B91
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2025 15:04:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYl4564WRz301Y;
	Fri, 17 Jan 2025 01:04:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=65.109.113.108
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737036293;
	cv=none; b=aINnjHC/ZxY+iL/eqHiCOkmoHq7LDq7WHPp0OFxJScvSGTNSqyrlM4dZi1Lyun5B43sLp2HIplJ+Od6/JZLsMeEOuo7KciGCopOQroxXuLJyk4x0LMURYobxX8IqE5vlLHnAqFgg7rKqYp6SPhyhLqma7fp/eMibXYHefyUvbyq+QD89Oo9WldIMSOQJ39PyPbFLOlkiASomTXH68vrGmc/VnmUm9m3AZ8mq6uGxmeK4EMgnONZ6ZVvwxHFEzldUD32Ufnike34JFkZzMUeJSfYrXpz6Ny+CHZTnM9QFsoNMn0QoQnehhgUGbhB+4B+AQ6udKuNkgaOiph/RLHg92Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737036293; c=relaxed/relaxed;
	bh=ugKrbojVRwTBmPMKkHUcaS2aDcqRv9OqaSevzpXMYOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hefjz69IfVMAd5rTPAlYm3d/lm6MscnSWtLvlW7QK/ykRcjua3Cl7vnHQQp9sk+d0OkoxE9t9+ODXjT1+UVEJZzsztFGrELfECbOXtnRNpEzPQk52XO3lNaNx+5WqLd6nmvxi6LhclKWa9QFtssRGuXMaecxuYmbZBvZkItHLjI0Ec4qnyhoYGN62BOAQtQvPcvZ1uO47VcxoCG0frZ2ImxVVZ7Z2mj54LOhpvHnIj2sSo7mE9CAhexINoArqyZWSdAC8FGZeaWsTYEiBpoWR8UXE9UxbMKf4Da0iFosCXyvK1OaxByrSQf69Tm/eKe8CsRllOFraF6e/oWHCGXfHg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=AoUcPN70; dkim-atps=neutral; spf=pass (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=AoUcPN70;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=65.109.113.108; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYl444Dcnz2yV8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2025 01:04:51 +1100 (AEDT)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 64DEC40E0288;
	Thu, 16 Jan 2025 14:04:47 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 2AjLmPaIv3rS; Thu, 16 Jan 2025 14:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1737036284; bh=ugKrbojVRwTBmPMKkHUcaS2aDcqRv9OqaSevzpXMYOg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AoUcPN70r71GRskEbBjwKB5t2IpKoOvWroHj7Gj+yh3TXIQq4jAaeXsAtKetsP+we
	 7U42EJbMPBRZdphzKgKJnl1FaXd4+NOPdDL1SkgOkJuvHbUXMBGkSPz+3v8h7dNhmT
	 Hnpwxe9r0qX772w6Op3rP2iEyZS27E/nwn39RIAvFhrt8U3AgFlwZ1zghfPHzcZ8zO
	 c/4ymjaW+0fTU8jpLPb236iMCAWdJa4hZ/QKzL2ReUqqUBynyzdljxfL49TuGZKsUK
	 HuZUYY0mmrBW4uLQ4YxKMwtuKAzOBBOTZPyqnz4H81TmMZX9A3znFZ3JT09PpbLLCS
	 Ia6e5nKvzD4mq+MXsOmJ3+GXejTE4cvNoC5h043TIg2mzfveb9shxPPW6gBlFTA53E
	 7jgElnzIfinsMoQwVSg6i18FLDzY50+kqVz9+zbr5gpiPs5LeCwLYM/Aq1u2fGPpZ0
	 0Ls41+wYzo1pfh0OpM+GBydt5tkuWtf+9452THH3PFkEdzhwGbhRprrYvj75bnToTh
	 nRx4uZELom9gJdmd+ZcYZKN5oNcUaiz0Ijo4hBEtkfRieSbS8RUd1mN91KKgO2qVid
	 d+CXJjbRpPfJbO67fm64t8fRGqM3v/OqRo/Z09m5/2qMM0veqGpRWUhNKQ3qXXaJz4
	 pfAh9T0l+/f8chSy2nlAbhlU=
Received: from zn.tnic (p200300ea971f934f329c23fffea6a903.dip0.t-ipconnect.de [IPv6:2003:ea:971f:934f:329c:23ff:fea6:a903])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id B67F640E0286;
	Thu, 16 Jan 2025 14:03:01 +0000 (UTC)
Date: Thu, 16 Jan 2025 15:02:58 +0100
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
Message-ID: <20250116140258.GDZ4kRkvEGYovA_J5u@fat_crate.local>
References: <20250110-asi-rfc-v2-v2-0-8419288bc805@google.com>
 <20250110-asi-rfc-v2-v2-1-8419288bc805@google.com>
 <20250116001858.GDZ4hQctZe_PFvJ0AJ@fat_crate.local>
 <20250116102747.GAZ4jfI9HG3K-PW7nf@fat_crate.local>
 <CA+i-1C1sXC1tbo9ytuex0eBD3gUbQwnNP8rvOhCv=JV+oSHo1g@mail.gmail.com>
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
In-Reply-To: <CA+i-1C1sXC1tbo9ytuex0eBD3gUbQwnNP8rvOhCv=JV+oSHo1g@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Jan 16, 2025 at 02:22:42PM +0100, Brendan Jackman wrote:
> Sure. I'm actually not even sure that for a [PATCH]-quality thing this
> cross-cutting commit even makes sense - once we've decided on the
> general way to solve this problem, perhaps the changes should just be
> part of the commit that needs them?

Right, that sounds better.

> It feels messy to have a patch that "does multiple things", but on the
> other hand it might be annoying to review a patch that says "make a
> load of random changes across the kernel, which are needed at various
> points in various upcoming patches, trust me".
> 
> Do you have any opinion on that?

You're absolutely right - we do things when we need them and not before.
Otherwise, often times things get done preemptively and then forgotten only
for someone to notice way later and undo them again.

> (BTW, since a comment you made on another series (can't find it on
> Lore...), I've changed my writing style to avoid stuff like this in
> comments & commit messages in general, but this text all predates
> that. I'll do my best to sort all that stuff out before I send
> anything as a [PATCH].)

Thanks!

Btw, good and funny way to use "[PATCH]-quality" to mean non-RFC. :-P

> Oh, I didn't notice your update until now. But yeah I also couldn't
> reproduce it on a Sapphire Rapids machine and on QEMU with this patch
> applied on top of tip/master (37bc915c6ad0f).

Yeah, it feels like toolchain-related but I can't put my finger on it yet.
We'll see if and when this thing will re-surface its ugly head...

:-)

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

