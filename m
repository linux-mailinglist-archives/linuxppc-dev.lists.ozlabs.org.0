Return-Path: <linuxppc-dev+bounces-11576-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C7FB3E5B7
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 15:42:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFqn43Qdkz2yyd;
	Mon,  1 Sep 2025 23:42:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756734152;
	cv=none; b=MYpiu6zFlF6d3dPxG0VVVdofM8D4XFO+fUnyS13bNnDs/+y+FG3YUtPIyzSee/c9rrc2zSZnp9nsYDMIWdkgubzQzwaF5Sq9CPctpR8jMET5o9rKxG5ezl/F704OenP2RJPM0MJvPs+bksWF2my5KlybXk1M5UTmcCdvUz0v2Ilivf0cdoIXEhqKH91HZS2wCc9j5FmdO50WJRJA3omciKwrOAIfuZZw5BSy0cfuIPDYNh/c1Fj6UiNl5DpldqCy8+63y4fb+QoBWt0/PSSWiQ+S5SK5NOHKuFg8xExPQDEDtqROn2FYb0DorrklTfQeTGghwec03R+I2xkCZrmYew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756734152; c=relaxed/relaxed;
	bh=D06UuwjAYlV6l7iTncZwN2SfO36CQk7GREFp9cWnrbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dx+Bp7Iwi7PQd/hmzw4YqihYE/IOdiBNl8pXxVAdKqofiAXdv8afnxCPjgfd60sVewWhs0EEjjfNXojeCQQU8Md3taELz10fmqxKKTHH88M7MoXy27IDp8g4oX+ns2cSdDgEwchRwI7JgyuKmjZedGWNe7rOHCAf2yi7D9iOhsHBxi7PmDAYSrVUyzAUscJ+7Mai9a8E21p3g2LXr5xXof08wZG8+Fl6eEOQSW6JDIv+bk8twDKkIvDGCvFewgfPzhs61/wcU+zI4kUog9cGgZB3cl4kSEU8uQ2PF54M8CMpnaO21k5rb8l/uiPiPnXrYsu+WITjWlnYLyfW8kak0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hhAgv3jy; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=hhAgv3jy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFqn34XStz2xxr
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 23:42:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7EA9544C2A;
	Mon,  1 Sep 2025 13:42:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA2A3C4CEF0;
	Mon,  1 Sep 2025 13:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756734149;
	bh=Vh7XUBI8fbBk4XZ8pKOtZH1UfNJDpJTXo419bu2F3VE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hhAgv3jysX69gBwri906yWypXEK80NcNcU75ZV9/QeXQCy7l2f36k4byfNVTER6IP
	 gOpTcCFplnwo778jgs8p6iIv5w82lNMr1NdsMRGJMrKmcMxP4YY2DKw+dekKbGSucF
	 fH1UC9E5PgUSkFcL53l8SZJBBuh5k12ZnrsQltX79STLRHqZnRwbCiiL2r1trnqoDx
	 puTp0teu7LJmcMXEaHizKLVFBrc6SbxJk1xEnU8p4L+3jrFGOH2GOvXFX8s+j/Uzcc
	 iESOxfINPv0beoEDy4YTocStDSjRMNPUi5KjJ3O7gh5nCTPwxK3fbka9qE414MrABB
	 Q6ziiIx0FS2KA==
From: Christian Brauner <brauner@kernel.org>
To: Simon Schuster <schuster.simon@siemens-energy.com>
Cc: Christian Brauner <brauner@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-block@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	apparmor@lists.ubuntu.com,
	selinux@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	stable@vger.kernel.org,
	Dinh Nguyen <dinguyen@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Kees Cook <kees@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Tejun Heo <tj@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Paul Moore <paul@paul-moore.com>,
	Serge Hallyn <sergeh@kernel.org>,
	James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	John Johansen <john.johansen@canonical.com>,
	Stephen Smalley <stephen.smalley.work@gmail.com>,
	Ondrej Mosnacek <omosnace@redhat.com>,
	Kentaro Takeda <takedakn@nttdata.co.jp>,
	Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Brian Cain <bcain@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michal Simek <monstr@monstr.eu>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jonas Bonn <jonas@southpole.se>,
	Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>,
	Stafford Horne <shorne@gmail.com>,
	"James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
	Helge Deller <deller@gmx.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>
Subject: Re: [PATCH v2 0/4] nios2: Add architecture support for clone3
Date: Mon,  1 Sep 2025 15:41:21 +0200
Message-ID: <20250901-sauer-stunk-49def0170f7d@brauner>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
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
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=1648; i=brauner@kernel.org; h=from:subject:message-id; bh=Vh7XUBI8fbBk4XZ8pKOtZH1UfNJDpJTXo419bu2F3VE=; b=owGbwMvMwCU28Zj0gdSKO4sYT6slMWRsXbQgjNu70HTe/oL9c9q1am5UpWv3Rf4/axBS2d225 DLTetc9HaUsDGJcDLJiiiwO7Sbhcst5KjYbZWrAzGFlAhnCwMUpABNJDGb4796daOqUVCMcef3h SZ6HDAFLrq8xmcSxzTOQKT+CvTO3n+G/d83ztvwDXH+ZHPU+vLlcvOafQ5/X9C+bSnabHoy/7bC TBwA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp; fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, 01 Sep 2025 15:09:49 +0200, Simon Schuster wrote:
> This series adds support for the clone3 system call to the nios2
> architecture. This addresses the build-time warning "warning: clone3()
> entry point is missing, please fix" introduced in 505d66d1abfb9
> ("clone3: drop __ARCH_WANT_SYS_CLONE3 macro"). The implementation passes
> the relevant clone3 tests of kselftest when applied on top of
> next-20250815:
> 
> [...]

Seems fine to me. Thanks for fixing this.

---

Applied to the kernel-6.18.clone3 branch of the vfs/vfs.git tree.
Patches in the kernel-6.18.clone3 branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: kernel-6.18.clone3

[1/4] copy_sighand: Handle architectures where sizeof(unsigned long) < sizeof(u64)
      https://git.kernel.org/vfs/vfs/c/04ff48239f46
[2/4] copy_process: pass clone_flags as u64 across calltree
      https://git.kernel.org/vfs/vfs/c/5b38576cb8d3
[3/4] arch: copy_thread: pass clone_flags as u64
      https://git.kernel.org/vfs/vfs/c/04e760acd97f
[4/4] nios2: implement architecture-specific portion of sys_clone3
      https://git.kernel.org/vfs/vfs/c/d7109d2a2358

