Return-Path: <linuxppc-dev+bounces-12431-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4362EB8AA49
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 18:50:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSz5z2Z1xz3cj1;
	Sat, 20 Sep 2025 02:50:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758210680;
	cv=none; b=jpWGmX6POFyPFmQjC3vElIByCvOrMMK9rB2Jtcm0ELCEUm6SZr9Phr718FbzRexHvcxDSJ/VqXjgZEDAY+jQGCOsEC5WHU5o3V1AvQkVzOV3Zv6h1viDhnb7LSwr4K80iNVCdGyOz8WhKT5c49mDY6EIdRG2dA3dmsfycPbO6jvb5TpPgtkvpzRHv1zkJRpqyYk8CUzJIfgi/EJf5PrH350Hf87R3OpSUgNbztobGdA+UE7FQYcRLk3V4qKZDhHNu1l7zHyyE0E/mHTmxvtq6tozvuw8KMuXU14GjQ7OPMsLYbude3QiveHfw4K5hFgJAnppgqkNHAL7K+k2Kk9VkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758210680; c=relaxed/relaxed;
	bh=fl//kCkijlzCVR9mkoTjy3hmrs7lH+dhZH4qnaeCWrc=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=Ds3N8LvWewTRB6dlB8BP+x1tZAunX9hc6ENyPpu2xMuwE6IrhxMLO7o6lYAOpVCCp/YAloKFK3jDcJqOYFlpG1Y7a41vLLO7dpEf58kjp3lZmU695AIGpI0o1XTLe3a5u7XSSUeUAFM6+llkvOmAHGf7hj0si+3wmFBpUDig2WJht7Db4qChACW6OnEVoyqaCMcpBXtdurny2AdzMAzH9k8nq8LbqClkfcEG8jE2WGBn6uOHrR3jfa3ie9K70VlI1AU9RHSNo9NzNf5aTgRyM6IqZos6bH8weN/Qjl01O4UU8GpcT6x9GbA1LtNqIgT8s22wVstP5qVNiK3L4fzd5g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lAxccBgH; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=pjw@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lAxccBgH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=pjw@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSKqq4Pxsz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 01:51:19 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3015643217;
	Thu, 18 Sep 2025 15:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D77DBC4CEE7;
	Thu, 18 Sep 2025 15:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758210677;
	bh=e6XJbeklgFNXwruDywAZe7vowNbZUbwBKpZS63m54og=;
	h=Date:From:To:cc:Subject:In-Reply-To:References:From;
	b=lAxccBgHQJMGKL6W5XO/kIBHMi2AladIz8qPWx4MBG7gpBrzHZckIimBwgkALGSoK
	 RTpLe7661eFC5B/7BhfypSLu8ciNLbjbhnW0/Uiw7F9qtuf/K/hOn+NGzmTK4Elius
	 Puw/h1XtP570vHRTCm/o6CmMUjRekyChiJ42E7YZlGDJw6uFwLqKV4izLQfNVxc+1W
	 3GgwOdBMEpO6bPhXxyYgbuGAlwFII7VeYUA20OL3bsW1JzfLATB4CEE7Um16odYOB9
	 O8FOQqOy+9iE5VgV50GipK6qrDd5viCwdSnAqnhpyMVlV7VT8suWp23kcrZWa2l0BA
	 qFbk69uCk7f8g==
Date: Thu, 18 Sep 2025 09:51:07 -0600 (MDT)
From: Paul Walmsley <pjw@kernel.org>
To: Simon Schuster <schuster.simon@siemens-energy.com>
cc: Dinh Nguyen <dinguyen@kernel.org>, Christian Brauner <brauner@kernel.org>, 
    Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>, 
    David Hildenbrand <david@redhat.com>, 
    Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
    "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
    Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
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
    =?ISO-8859-15?Q?Michal_Koutn=FD?= <mkoutny@suse.com>, 
    Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
    James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
    Anna-Maria Behnsen <anna-maria@linutronix.de>, 
    Frederic Weisbecker <frederic@kernel.org>, 
    Thomas Gleixner <tglx@linutronix.de>, 
    Masami Hiramatsu <mhiramat@kernel.org>, 
    "David S. Miller" <davem@davemloft.net>, 
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
    Andreas Larsson <andreas@gaisler.com>, Richard Weinberger <richard@nod.at>, 
    Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
    Johannes Berg <johannes@sipsolutions.net>, Borislav Petkov <bp@alien8.de>, 
    Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
    "H. Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>, 
    Max Filippov <jcmvbkbc@gmail.com>, linux-mm@kvack.org, 
    linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
    linux-csky@vger.kernel.org, linux-block@vger.kernel.org, 
    linux-fsdevel@vger.kernel.org, cgroups@vger.kernel.org, 
    linux-security-module@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
    netdev@vger.kernel.org, linux-perf-users@vger.kernel.org, 
    apparmor@lists.ubuntu.com, selinux@vger.kernel.org, 
    linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org, 
    linux-arm-kernel@lists.infradead.org, linux-hexagon@vger.kernel.org, 
    loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org, 
    linux-mips@vger.kernel.org, linux-openrisc@vger.kernel.org, 
    linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
    linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, 
    sparclinux@vger.kernel.org, linux-um@lists.infradead.org
Subject: Re: [PATCH v2 3/4] arch: copy_thread: pass clone_flags as u64
In-Reply-To: <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
Message-ID: <ffb22e54-6b7d-5b88-4217-e67870051c6e@kernel.org>
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com> <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
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
Content-Type: text/plain; charset=US-ASCII
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 1 Sep 2025, Simon Schuster via B4 Relay wrote:

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

Acked-by: Paul Walmsley <pjw@kernel.org> # for RISC-V

Thanks!


- Paul

