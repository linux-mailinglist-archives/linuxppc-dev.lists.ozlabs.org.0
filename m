Return-Path: <linuxppc-dev+bounces-11604-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D653FB3F64A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 09:12:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGH503Dc3z307q;
	Tue,  2 Sep 2025 17:12:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756797172;
	cv=none; b=NZodya3uKSpA9cnRk90Y9mTcFZpUhRUB1XoWWIpgVMoD6qdeif1vNxp5JUV30mvz7+pZ3OKO541f1esH9aokOGOGQXjMBFx51D9wyU1e5faIBecn3/SS8jOd8yWRiapIKPnbfHVXff2JFvL2cRT+a9pWFpH6R2bFZt8ohXUwv12UbgwhRsvg5UuE59EXGXWydyz3y+ngAqtw7iI6mMlAJNYvmZUhbiRdJCwwMYJprsVehdYo4zaQtNLNtj98hl7sitQYh3QFnR0O1xOxpSSAP3WtzLZl7X2rRG7eNRR4wXd4MF6suKpHkpk8X6zf+jgxf3kxiXql54q0PeujfccH8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756797172; c=relaxed/relaxed;
	bh=h7e86hl0UV9Yd9fEU7lHS/lq+4/qNkF5NKsTGqMW0Gs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Oyc8YaHmXFoSDERjEY6GX5I/rojJwUwYT9sQPvaMhtCGToQTbtvHpAr26uDuPKLirOvzWZeYmfsWh6q+KBpfLI9dFgKMPNaZH7A0Fh2LUOxveKWO5FldiUMJqVhz1stsXXiwq3zBr6op+BIdbkHTfrBqy82Kjqmsbm0TUJWL+95KBmWPM2Zmk3kVqQ7HFsDsSBF9OepV5ZpzetVrcoLeklgdWnPVgbbj8Q2XJuNztfE8ypiyqM9E5f3c5LzfvvkkIgRxBgHZATt0w3/X6J7BhlItxOhml+c05VVWCw1UcYhxhigxOEyY/s3TIkjmXpDUcimXiXYAr7jXyJvyeV3ejA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; dkim=fail header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=XV9R3DCg reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org) smtp.mailfrom=gaisler.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=XV9R3DCg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gaisler.com (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 595 seconds by postgrey-1.37 at boromir; Tue, 02 Sep 2025 17:12:49 AEST
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGH4x4mcTz2yrg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 17:12:49 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4cGGsM6JC5z1DPkm;
	Tue,  2 Sep 2025 09:02:47 +0200 (CEST)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4cGGsH2GP0z1FXjK;
	Tue,  2 Sep 2025 09:02:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1756796567;
	bh=h7e86hl0UV9Yd9fEU7lHS/lq+4/qNkF5NKsTGqMW0Gs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=XV9R3DCgzqtpsDdLU5B6YmrRSDSwOb/e+RN3Y/eiKzfpmARJpEfk4rM3nFZX0bFUT
	 Cgk+F60Qfnp/lcw23nKISESK50dxfqXIzcv7lABAQzI+QL2HTB89cK9os+EVA7PGjD
	 2JhF3WzYfsb9MEQHgbmUEpzjWOe7UaJDN1f3QJPTIjlP5MtBhYOcxRaj/x5aIgyAIx
	 VylpL5fKm3LmJNVO1eTnB/fXzhohsODH/8iwc5vr/F7Q+FJODNFYRjy3a+H0jjVZXA
	 zhn5kjjNaRe2tU3x5rK51dkv4aqaegmt92utDpWIUQsQcnBLirXe5OB9CcfJT7NVBK
	 WwxEwsTBW60LQ==
Message-ID: <f2371539-cd4e-4d70-9576-4bb1c677104c@gaisler.com>
Date: Tue, 2 Sep 2025 09:02:41 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] arch: copy_thread: pass clone_flags as u64
To: schuster.simon@siemens-energy.com, Dinh Nguyen <dinguyen@kernel.org>,
 Christian Brauner <brauner@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 Kees Cook <kees@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Guo Ren <guoren@kernel.org>,
 Oleg Nesterov <oleg@redhat.com>, Jens Axboe <axboe@kernel.dk>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
 Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>,
 James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 Frederic Weisbecker <frederic@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Masami Hiramatsu
 <mhiramat@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 John Johansen <john.johansen@canonical.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Ondrej Mosnacek <omosnace@redhat.com>,
 Kentaro Takeda <takedakn@nttdata.co.jp>,
 Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Brian Cain <bcain@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
 WANG Xuerui <kernel@xen0n.name>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Michal Simek <monstr@monstr.eu>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Jonas Bonn <jonas@southpole.se>,
 Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
 Stafford Horne <shorne@gmail.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-perf-users@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
 <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-09-01 15:09, Simon Schuster via B4 Relay wrote:
> From: Simon Schuster <schuster.simon@siemens-energy.com>
> 
> With the introduction of clone3 in commit 7f192e3cd316 ("fork: add
> clone3") the effective bit width of clone_flags on all architectures was
> increased from 32-bit to 64-bit, with a new type of u64 for the flags.
> However, for most consumers of clone_flags the interface was not
> changed from the previous type of unsigned long.
> 
> While this works fine as long as none of the new 64-bit flag bits
> (CLONE_CLEAR_SIGHAND and CLONE_INTO_CGROUP) are evaluated, this is still
> undesirable in terms of the principle of least surprise.
> 
> Thus, this commit fixes all relevant interfaces of the copy_thread
> function that is called from copy_process to consistently pass
> clone_flags as u64, so that no truncation to 32-bit integers occurs on
> 32-bit architectures.
> 
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>
> ---

Thanks for this and for the whole series! Needed foundation for a
sparc32 clone3 implementation as well.

>  arch/sparc/kernel/process_32.c   | 2 +-
>  arch/sparc/kernel/process_64.c   | 2 +-

Acked-by: Andreas Larsson <andreas@gaisler.com> # sparc

Cheers,
Andreas


