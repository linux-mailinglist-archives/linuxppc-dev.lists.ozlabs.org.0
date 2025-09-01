Return-Path: <linuxppc-dev+bounces-11570-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FA0B3E507
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Sep 2025 15:31:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cFqXh59cPz2yxN;
	Mon,  1 Sep 2025 23:31:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.137
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756733508;
	cv=none; b=UmGw/UZQxJaRvGGGWPMzpzeKLwZpGg/8McH4TbR8PknW8w82qzas8aCJh0mcSjeW5c2JDHdjSiW2/8Nq8GBqHSE4ZSIS/BPM2UU8Rc9sn3QIcoyt3vDVFhTO8CFm4OsK893Mrz7H3yB4WYfnpN5rLSWCMcIhgh4zHorwJc0nJeyE7kDuf9NEFkSTepGVkUWkvfcvBS/TEcrfcz2b5z+Q8i5HqHtX+ar7ELU0ioUGfSi5qR8qohGETkp0rw2FuN5bM3cqaqaExZlurOVybPq3YyNMuXLsuBKqMUzFuVdxnOsQ+knqBanCkbCwSbliQMuAUm0EfjJwtBcrV6HrEuscbw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756733508; c=relaxed/relaxed;
	bh=Eznu89d4Wi9DxarExeHtKpzVjwvcq68i7OTy3S868gA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=aDAn0ZSvDKuuUve5+YWLDpYFrKOyvmkGFFszz7/67Ixd/EmR4vbuSyn1DNsC0joO6+XBGEVRL1lhkmmrBJG+KNvZu+U/VJ5Gn2kLFYzonktfZiVCMFRytfKufx88rTTT6VarED5BeSFugZh/+jFHH96fNAW/V7oAPCn3Xqoy5TXF0tvgJFz0p+NimMbvSN1Gdta4m1lerFoJ2arAIzMdyT9XKpYpyfkTJUVnZhiu+DiQKk3T0qV7dGmCkt9nHAcRfsYUTHZf0X5X0+q860WmfgCGsm+9YnkdHhdJJckjrgpsAX0YLElADOst2VNAcsdNntAoJKux+jokdUA74NbiUw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=j6cv+uWE; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DSMSTkhz; dkim-atps=neutral; spf=pass (client-ip=202.12.124.137; helo=flow-b2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=j6cv+uWE;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=DSMSTkhz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.137; helo=flow-b2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-b2-smtp.messagingengine.com (flow-b2-smtp.messagingengine.com [202.12.124.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cFqXg2dCcz2yx8
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Sep 2025 23:31:47 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailflow.stl.internal (Postfix) with ESMTP id 5D0C61300A65;
	Mon,  1 Sep 2025 09:31:43 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 01 Sep 2025 09:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1756733503;
	 x=1756740703; bh=Eznu89d4Wi9DxarExeHtKpzVjwvcq68i7OTy3S868gA=; b=
	j6cv+uWEmN4tRp4L+tzI/9Zq6plmAiANvC3bo2w95zYsUC+H+2erTLZ0M6N7rnUE
	0WJqmOlYYzOb6wa1b0ygTdG8BC5pYAWdzw2aqVPy+8gMQw3BlT0hWNGrjJ5655BK
	jDWe+Joso3PW8J2CnKz3MeMzgwGqXtpLwj39pSqXUuiPUDezRBK0v5/xoU+sFox3
	GWlZUV/LVedziW2nrloxdmm+vcN5X4cO58hdosyWO1W7tMLZTaRBkEP/5cheXfwp
	+K5jjBJhDLT22wliXgMPdBEhiHMG/Km2fCAWR75bU4MZMr7W2ppn+8l8thXubf8x
	H1W/5LtJ+sW5tj5YEJdOHw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1756733503; x=
	1756740703; bh=Eznu89d4Wi9DxarExeHtKpzVjwvcq68i7OTy3S868gA=; b=D
	SMSTkhz+YqIgiIvkfFhIfiL/7qZcqhBI4oCB9ZKy/r9OlCO0VYO0928G7HzW3t1X
	R5CRMBk05X1v8XiPu0gU8Dsn6nFpXoqjPCqceWub8u0XqW6tCJ1OP7wG35dQCrI7
	aSnljlc2n08wq1OFKrRVZX0kwVGoKguuQ/7/Dcw10oaWILbODGBPN66UY2hV+Hsl
	Pxzc3wqxsF+FDOrc6yCoojuU69bPtOK3gY/ELK/7yp9zj2ym+EvtTx/qYimHAc9i
	BoY9nsK3bIOPmDgoDjHr1nj4App+jYB2XmiH3LFMvgce7UfNmWvVI5wf8Kk3A7Gi
	iHW0WInKpkLoSLGn621+A==
X-ME-Sender: <xms:PKC1aIcONhsW8pFWOV14Sq7PTSfGUzdsPiv1pf9lSeQIoeQuUROA1Q>
    <xme:PKC1aKOVe-VGCwHjIr1-HCUTyP2eI6IVsjiZwzoJs8XrW5uMtrI3FpSZ6Dsf67EKk
    UVTmDVgbd78EjylEJU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduledvvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehvghhuphhtrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfi
    hilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopeigkeeisehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehlihhnuhigqdhmmheskhhvrggtkhdrohhrghdprhgtphhtthhope
    gurghlihgrsheslhhisggtrdhorhhgpdhrtghpthhtoheprhhitghhrghrugdrhhgvnhgu
    vghrshhonheslhhinhgrrhhordhorhhgpdhrtghpthhtohepvhhinhgtvghnthdrghhuih
    htthhotheslhhinhgrrhhordhorhhgpdhrtghpthhtoheprghnnhgrqdhmrghrihgrsehl
    ihhnuhhtrhhonhhigidruggvpdhrtghpthhtohepthhglhigsehlihhnuhhtrhhonhhigi
    druggv
X-ME-Proxy: <xmx:PKC1aPW1RGYxcaPPwQB08we1CrOb0vWdovfn6r5qNGsSUnTRNoysJw>
    <xmx:PKC1aACPYBlQb5Uv6Ak1zXW3vbtk9zPb7jxSCaujwkmIdsz7VISSsA>
    <xmx:PKC1aBANLPAWF_L6c2MK_OSvCPKCWVpa-XxY8Gz3G2h9a5ymRg7i6Q>
    <xmx:PKC1aOYWrsQphouZ9KK0mtpQNLo0VBdm9yK6cb4vr0A_2uyW7_Wa4w>
    <xmx:P6C1aLu2umbwmZJroLvt1vyRUndw9ctOMRaDydbyr815g78VacSqp4S2>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 68A5D700068; Mon,  1 Sep 2025 09:31:40 -0400 (EDT)
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
X-ThreadId: A1XJ5FccVF4B
Date: Mon, 01 Sep 2025 15:30:20 +0200
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
Message-Id: <78ca3a1f-2ed9-4450-95ef-d690cf4aace1@app.fastmail.com>
In-Reply-To: 
 <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
References: 
 <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
 <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
Subject: Re: [PATCH v2 3/4] arch: copy_thread: pass clone_flags as u64
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 1, 2025, at 15:09, Simon Schuster via B4 Relay wrote:
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

Reviewed-by: Arnd Bergmann <arnd@arndb.de>

