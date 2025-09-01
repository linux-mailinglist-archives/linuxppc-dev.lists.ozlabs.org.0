Return-Path: <linuxppc-dev+bounces-11572-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 953D2B3E534
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 15:36:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFqdh3gG9z2yt0;
	Mon,  1 Sep 2025 23:36:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.137
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756733768;
	cv=none; b=PYBfJY46ST28RhopmWhjVuTiuWuJOsEaSy33f/lceds3X+e+xpAMbdtR6Hu339r6hIunMB5UubqRCi+/nqHaXN/cRAHL9W7IKpD5pu49vt+O8QsgSJR071H+NyXBp0/yarP7mO7PRGPZ+PGYUG77zI8x+8O51Vc/XMnaGyouEVWPPkvrCx9KUvd9qNAmfZ5YEt/c2N2ptWkl680K2dt6ov3jVYJJ5Lr6+771VaA2/j1fSd9tm8TGQW6Uaau6QU+icNcjv7Hn661qZ7r++1wykBltYnV5AIeC8LoxveumNBT7mmthftvAlZyk+T00k6PDdGseF+5JR5YhAAkEGtoVRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756733768; c=relaxed/relaxed;
	bh=EkyOW6EUUTV+C/dNjMz2+XFswtE2xmJVWwojlRsa6wQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=LCV3vCE+YpSHOIqglvsTRHpbHXI7NW+iuSKRjcjZbu9gKc4G40PRMfuZocovn2Ftqn2sX9nfzzuEHHdVwzKTSS6bq26FYNbQqos/JWOlQ+xEUYlrqFb3NGp9mDXpqkaC1lcnVFGqNwTKdbrI/e61Hid1z5il3isPkcyI2gxMHntp6h335tX3DhYCI3HstOsdzet3bYbh9QEaq8LLbLZnsDR1/NH+KnicareHvuFMCbWxCJMUCtjlzW6vBb8+5EMN0EqErRSRdTM+Ah4k3Sr71AaiXVP321fbFJUAK07YaFyKlNVv8C3CQp7l4hWE7a7hrFEJ8Iv/CHC1jKoHDybetQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=iqQoAqNv; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YZdEcITL; dkim-atps=neutral; spf=pass (client-ip=202.12.124.137; helo=flow-b2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=iqQoAqNv;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=YZdEcITL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.137; helo=flow-b2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFqdg4CD0z2xBV
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 23:36:07 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 7D2251300C7D;
	Mon,  1 Sep 2025 09:36:03 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 01 Sep 2025 09:36:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756733763;
	 x=1756740963; bh=EkyOW6EUUTV+C/dNjMz2+XFswtE2xmJVWwojlRsa6wQ=; b=
	iqQoAqNvegrh6j4CIJgpRxtWPa4GfHGJHLJTeEiexLv/cC5adGMhR8mu9arcNl1O
	I+SViigwx5fkDtvAUK3JQvr9LUo9tSyD34ZzpwtKWl4oFpF9VVsko6G0wgKCFOrB
	Wgwk3+poGXpme23gg9tOI5NyS1XAjU0UtkVbuQdc6FHKDGjmCvobEZ9KxeWcp220
	ubS3J54j+pFRzIZl5cfhA3pOQm3sGNXHxwAVgi/uBnkXKL329bISvPyPgjUgQwA9
	8FW2trQiznoacWZhLt9i6H2QSMNg8TYnbJn1BTlhuZoxeGDnw5hk4Tdb29vm1nUY
	bZXVgQ/h5beUsffzWqRmug==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756733763; x=
	1756740963; bh=EkyOW6EUUTV+C/dNjMz2+XFswtE2xmJVWwojlRsa6wQ=; b=Y
	ZdEcITLqgPB8jj8CHPxaiDUBffgGZ2F11HyGFeXL1aqJLq4I4uY3ERkYEVyLePpp
	o/psznaJhEHGBKJ1kQdFcm4CnwWSHMxVhZ1tegHG4+vQZnEWzWcfLawto2oOCNBm
	Q/nmgawaUaDpiYJcIgjle3tNvGPP7HrGRlkZTVjBSyx3SdL+Ubvbaw2NllbE0UKR
	5PpaPKDdUnQpnidtMabM7ViC4q/rsdCRkhJmrsQb7pfEcghJVlhRRIXKOl1ByAL6
	97jtMnFynzRNFQoG7yviaZDvoKIlFw/RFuOZzAvP0wULCLGRMZMgHnd0YvSE2EEr
	37ywaIwtBcs1nPsRIxnAw==
X-ME-Sender: <xms:QqG1aMBAb1qwptbTZfcieXRiGZJ-sUTLCT0kfm4oU2mfCmb2rLE59w>
    <xme:QqG1aOgtge6O1bXGieZrbSKSwHUnyy_Eoot2uP8L9kA1s2-ybgS8kAo4MwLH_ML4e
    xXpfwuSam7mVev1zuY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledvvdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgepfeenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehvghhuphhtrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    hilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhope
    gurghlihgrsheslhhisggtrdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhgu
    vghrshhonheslhhinhgrrhhordhorhhgpdhrtghpthhtohepvhhinhgtvghnthdrghhuih
    htthhotheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghnnhgrqdhmrghrihgrsehl
    ihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigi
    druggv
X-ME-Proxy: <xmx:QqG1aJZQk38pWZPUfRtMdGUj4gUf32jREDDlB8cSddU8-Bte6a_BGA>
    <xmx:QqG1aI0LMalgb6WOOoOvBq_ZHFcA810ON4N6sxEckbEx2UH355DlHQ>
    <xmx:QqG1aBnD05OhcRlHKCFLP4CiLGcm0kJsZXFJNAUtGT5thazjIMDFJw>
    <xmx:QqG1aLuu7r7Df2HXyPIO-14-qQlreeIXRd5bgYb73qe7TD5XXuvCoQ>
    <xmx:Q6G1aKbfgfdq7WHr6K7GavWXAT9kKUqpMQgMvatETMxCn_gjK_opBczb>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 72651700065; Mon,  1 Sep 2025 09:36:02 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
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
X-ThreadId: AHNSoFB7hZ_J
Date: Mon, 01 Sep 2025 15:35:42 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "schuster.simon@siemens-energy.com" <schuster.simon@siemens-energy.com>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Christian Brauner" <brauner@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "David Hildenbrand" <david@redhat.com>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>, "Mike Rapoport" <rppt@kernel.org>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Michal Hocko" <mhocko@suse.com>, "Ingo Molnar" <mingo@redhat.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Juri Lelli" <juri.lelli@redhat.com>,
 "Vincent Guittot" <vincent.guittot@linaro.org>,
 "Dietmar Eggemann" <dietmar.eggemann@arm.com>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Benjamin Segall" <bsegall@google.com>, "Mel Gorman" <mgorman@suse.de>,
 "Valentin Schneider" <vschneid@redhat.com>,
 "Kees Cook" <kees@kernel.org>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 guoren <guoren@kernel.org>, "Oleg Nesterov" <oleg@redhat.com>,
 "Jens Axboe" <axboe@kernel.dk>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Jan Kara" <jack@suse.cz>,
 "Tejun Heo" <tj@kernel.org>, "Johannes Weiner" <hannes@cmpxchg.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 "Paul Moore" <paul@paul-moore.com>, "Serge Hallyn" <sergeh@kernel.org>,
 "James Morris" <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Simon Horman" <horms@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 "Arnaldo Carvalho de Melo" <acme@kernel.org>,
 "Namhyung Kim" <namhyung@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Alexander Shishkin" <alexander.shishkin@linux.intel.com>,
 "Jiri Olsa" <jolsa@kernel.org>, "Ian Rogers" <irogers@google.com>,
 "Adrian Hunter" <adrian.hunter@intel.com>,
 "John Johansen" <john.johansen@canonical.com>,
 "Stephen Smalley" <stephen.smalley.work@gmail.com>,
 "Ondrej Mosnacek" <omosnace@redhat.com>,
 "Kentaro Takeda" <takedakn@nttdata.co.jp>,
 "Tetsuo Handa" <penguin-kernel@i-love.sakura.ne.jp>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Brian Cain" <bcain@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Jonas Bonn" <jonas@southpole.se>,
 "Stefan Kristiansson" <stefan.kristiansson@saunalahti.fi>,
 "Stafford Horne" <shorne@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Chris Zankel" <chris@zankel.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, Netdev <netdev@vger.kernel.org>,
 linux-perf-users@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org
Message-Id: <35893d46-6caf-49ea-bbae-6e1cab6b2914@app.fastmail.com>
In-Reply-To: 
 <20250901-nios2-implement-clone3-v2-4-53fcf5577d57@siemens-energy.com>
References: 
 <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
 <20250901-nios2-implement-clone3-v2-4-53fcf5577d57@siemens-energy.com>
Subject: Re: [PATCH v2 4/4] nios2: implement architecture-specific portion of
 sys_clone3
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 1, 2025, at 15:09, Simon Schuster via B4 Relay wrote:
> From: Simon Schuster <schuster.simon@siemens-energy.com>
>
> This commit adds the sys_clone3 entry point for nios2. An
> architecture-specific wrapper (__sys_clone3) is required to save and
> restore additional registers to the kernel stack via SAVE_SWITCH_STACK
> and RESTORE_SWITCH_STACK.
>
> Signed-off-by: Simon Schuster <schuster.simon@siemens-energy.com>

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

