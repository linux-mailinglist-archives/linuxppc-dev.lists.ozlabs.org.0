Return-Path: <linuxppc-dev+bounces-17074-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNp4COesnGlyJwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17074-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 20:39:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F6617C778
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 20:39:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKWPv4kKkz3bfV;
	Tue, 24 Feb 2026 06:39:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771875555;
	cv=none; b=fIw+XedhKakKjmsPL+D6eKRomSVDNXmnPT9MLUJwZewspWWEX504mvb2g4gsWUeMnxpL3cBJ59jRpGAaLbRek1PQsjpm4eL4ZCC42//wfNZ48ngLnvDz3lf13ryCqJcrZKnqZskTV7PCpi1VEjUe9PRWLFVZHkEz4Ts/Q6wzNaap+52VkzL4BXfL55pk8o4GGbHa03iMUzKFuFOU/+lRjYNNvS+qA2usnl393DRZvJbfRLoG7477RQ/MzkmYx07reoxIHSU9N/3XcgVjwrEcJx74lQB35HxGLH/I5c87v1/NO+3HV830cJ7VJlcK4rjXEjs7CgKyds1Hbpux7dE8Ug==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771875555; c=relaxed/relaxed;
	bh=iV7zWYF6J6WpT/f5e8g/euFwDkWlgKg+5Yw0o7YIYp0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=eMBXp66FRxrbXbGbDLEwWBQkpX7W9Sig/HZoRrucwqVEeniCFl/lcqmJdciqCRgR9e5dDaV3xBClUEnxUyLX/Q6dfWUpw5oMFoe4szR8KTE9ozZyFU+852F4Cm5a5h58+peSWKjP3qFEw4dFKCNnXWvCl2QV/N63lrDwoUnPOKWevCkRgqNs6TmkVve4Bu4JqC4DFzsZaIPaeOcG5oRocxo+Z3vcSTPEKb6PCYgcGik/icESXNtEZrokvopNY4SLHI62av3kYspcjOstI9xkgUwNLiCGSvqvdt3EXta+Z8CgQ8dwuX7socTkWSws8Sa/PxQb4AA0njaASzE/s1RrCg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kYk9VjnA; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kYk9VjnA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKWPt5nyQz3bZm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 06:39:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D11A26013F;
	Mon, 23 Feb 2026 19:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7402BC116C6;
	Mon, 23 Feb 2026 19:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771875552;
	bh=IveoHd9zrLRR33yx6epdsO9eF0MPbX7n9btdHNCQv2o=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=kYk9VjnA/HYov/kkCKDpWeJ6E9SOQNpGx2QdxK4pbCdkshTk91n7/116gQW6D7RAV
	 fdPjG9EteJGvN/svoEfpKzSnG08xo60tT5uIIrPA5bd2Yl8vLD6AIn6I3MU6VgWTOH
	 eF4r4x0wQ8wCT0n7cpOI1oXZkoZXzb9QMwr+pEZLa8zSIZNwQ0RmmZxqSLT8b70NQg
	 E0Q6u7/A5NQgpkkU4PP76fTmwni3zeUWoFesRyz4owHuHGZc3rqNZIC/8u0Yk1IB09
	 2q8R40V9VDKt5GeXJWze5cCRC1Esw8UyXt6LPrGa4o/DSCNmP2FnBRgoWAhsSWh/2s
	 p7YBrEqRX6kEQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 538B9F40068;
	Mon, 23 Feb 2026 14:39:10 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Mon, 23 Feb 2026 14:39:10 -0500
X-ME-Sender: <xms:3qycaddGJqMakJznO8KINaxIcIUhszzQB6a7VPRKpqEBr9Wq2SVbmA>
    <xme:3qycaWAntHYIagFkdClUg8BW0W1z3wtjIFYiCac3xEkBhz5EKsTCNTVzZelSmA7ys
    6L7IN00Pd3__HCp6x1l3AqaBruiXTS4XLMRdI23SP-JvEYZzGe--j8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeekuddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeejhfetveehvefhteekgeelffdtgffgvddtkeeguddvvdduuddvieetjeff
    veefjeenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    feekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghp
    thhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohepnhhitghkrd
    guvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtthhopehn
    phhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhlvghrsehgmhigrd
    guvgdprhgtphhtthhopehjuhhsthhinhhsthhithhtsehgohhoghhlvgdrtghomhdprhgt
    phhtthhopehmohhrsghosehgohhoghhlvgdrtghomhdprhgtphhtthhopehjrghmvghsrd
    gsohhtthhomhhlvgihsehhrghnshgvnhhprghrthhnvghrshhhihhprdgtohhm
X-ME-Proxy: <xmx:3qycaTVDR64kR1jkDUKhlJw7ttsh1mfDYJPnYtybFwWmz_VWFQ9lbQ>
    <xmx:3qycaXSJmLqfdupxfVLz3XiAmF9afvvlTV3fA_mxt1V0uAVBbcEIRw>
    <xmx:3qycaTBcnIfDJonOBxIi3NLUy9hBMhQw1lYTTav-8RplZAABxoW3Cg>
    <xmx:3qycaekuqMGz8NKZr28U5CNsbCrrFj3msxkNFLOxvdt8BpW0DP7QYA>
    <xmx:3qycabmUs8as38t_yBivTwckVLq6-HlT36EIVzSmr1DhxHas2Lam8lk->
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 257E8700065; Mon, 23 Feb 2026 14:39:10 -0500 (EST)
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
X-ThreadId: AcM5pYIp-jco
Date: Mon, 23 Feb 2026 20:38:47 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Nathan Chancellor" <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>
Cc: "Linus Torvalds" <torvalds@linux-foundation.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>,
 "James Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H . Peter Anvin" <hpa@zytor.com>,
 "Ilias Apalodimas" <ilias.apalodimas@linaro.org>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>, "Kees Cook" <kees@kernel.org>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <9ba5bb34-2356-4c10-a3d3-f122abe1073b@app.fastmail.com>
In-Reply-To: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
Subject: Re: [PATCH 0/2] kbuild: Switch from '-fms-extensions' to
 '-fms-anonymous-structs' when available
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-17074-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:torvalds@linux-foundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:ilias.apalodimas@linaro.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	FORGED_SENDER(0.00)[ardb@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,arm.com,kernel.org,xen0n.name,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,alien8.de,linux.intel.com,zytor.com,linaro.org,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[ardb@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 33F6617C778
X-Rspamd-Action: no action



On Mon, 23 Feb 2026, at 20:10, Nathan Chancellor wrote:
> Hi all,
>
> The kernel enabled '-fms-extensions' in commit c4781dc3d1cf ("Kbuild:
> enable -fms-extensions") in 6.19 to gain access to a Microsoft
> (originally Plan 9) extension around including a tagged structure/union
> anonymously in an other structure/union. Since then, Clang 23.0.0
> (current main) has added a flag to enable only that extension, rather
> than all Microsoft extensions, '-fms-anonymous-structs' [1]. Using this
> narrower compiler option would have avoided the build error fixed by
> commit a6773e6932cb ("jfs: Rename _inline to avoid conflict with clang's
> '-fms-extensions'"). While these errors are not expected to be common,
> using the narrower option when available has no drawbacks because the
> kernel only cares about this extension in '-fms-extensions', no others.
> While this could result in build errors for folks using
> '-fms-anonymous-structs' if a developer uses another extension in
> '-fms-extensions' (either intentionally or unintentionally), flagging
> these uses for further scrutiny seems worthwhile.
>
> This series converts the build system to use that flag when it is
> available. The first patch consolidates all of the C dialect flags into
> a single variable to make future updates to the dialect flags less
> painful, as updating the logic in every place that uses their custom
> built C flags is getting cumbersome (and C23 is looming). The second
> patch makes the actual switch.
>
> I would like Nicolas to carry this in the Kbuild tree for 7.1, please
> provide Acks as necessary.
>
> [1]: 
> https://github.com/llvm/llvm-project/commit/c391efe6fb67329d8e2fd231692cc6b0ea902956
>
> ---
> Nathan Chancellor (2):
>       kbuild: Consolidate C dialect options
>       kbuild: Use '-fms-anonymous-structs' if it is available
>

Acked-by: Ard Biesheuvel <ardb@kernel.org>

