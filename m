Return-Path: <linuxppc-dev+bounces-16978-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCbmMgPfl2nW9gIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16978-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 05:11:47 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E57641648BA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 05:11:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHGy95JCtz3cGg;
	Fri, 20 Feb 2026 15:10:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771560657;
	cv=none; b=h5ByTfsvgWJ/nlz7VWmRrARN6Cip9YrQ0MBoShhHq2RMLp1OTlBtBYETJUggJFKwERE0VuX8c9316QhDgWQI2HMzcweZNkgU5VPEq8GoHUxgOBvSWG17dI9Xxv6k2NUF9Qn0QfsmJjxvC+OqHl0QU5cD5N7bIOtwunYFQIvXBNLHH9AxUagLgTZNrSyDuriPtPskkmxkiHcFEpR0iU4dRXmSVLszBXtAUuIJ/20W6s578JzgNlRU27kcwY7gbzn+JthatUXZqQ0mCeWG5pRQ9P0UeG737FCnJYtah2YTxhfn3K5wmfTGUUej8QNZXMHhXzVrDLtzH0H+IxDS5JDeSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771560657; c=relaxed/relaxed;
	bh=/A0Yxvye63cj+hpAab8QOVcalyFGH3t35eHSGcH62hs=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=JiVNP+7alo7xUNQY8L1strFHXQ1noaLYZhH/2gnQGqsAFRALGQG89L27JzQjsyqH9nN4ISloehUCOHNbMBE/Oi9et7yZawqdNKSqVwRAY+eMJs3PzmjWUHii7ZHcmwUhKLsasNlNpHKDmHmcVPWkVKTbGpPDxCYO1nxZjkcaKU2xxTuQfw9Y30u4CMC4hJKPkVFFegU0AQMFGeuASrjRgUMWlVkQ1pnx1MvHDZOoJppkNMpQwc/Ts5qyMoAsXdxEX7yBqw4Z5VYa6UwntHSmaYjEiWZy9JnYtbKBD/oo5ewPRQMMrqH8jvJ/SYUdyYsblxUs/ZZkU6ndo8vpoXK5OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N1VrZuK9; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=N1VrZuK9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHGy85pC4z30N8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 15:10:56 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA55A6185D;
	Fri, 20 Feb 2026 04:10:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BD7FC116D0;
	Fri, 20 Feb 2026 04:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560654;
	bh=Wl/q2I9MW4EAYAIqkkPs9cMuPySyeP7Ys0yLcRoxiik=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=N1VrZuK9lrvi+0jv5UrnpCwpMzW70T8EtjcsHnyvYb/C3ysXhXnwcXh0J1BUrz/fQ
	 FXvJgc0MX5grtuvCDCjFOveYmh43k7YKrhJKjA6KNPY5GbthY3tSAB5Rd8DWyI60O4
	 60LGpZhdpz2TPplFhz9GOt22IkO9j9SafKfb23NhzY6Pqtbyy2AyC4nRduEnajg21H
	 pPrMunHoqFuSELpIJz/FNzbQUBVTQ/4/r5X9keCr5k8mekJQPLFSEN/1VTk4FKKX96
	 mGvQFqOn+07PQ7stZW8usaIlrYxFaew9yX4CoBIDJ2elY6T+mswJuAAcc8jX+e9rPf
	 2Anz+jmhWYL+g==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 3FEBA3809A88;
	Fri, 20 Feb 2026 04:11:04 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH 3.5] arm: make initialization of zero page independent of
 the
 memory map (was Re: [PATCH v2 22/28] arch, mm: consolidate initialization of
 nodes, zones and memory map)
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177156066278.189817.13783312336351868850.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:11:02 +0000
References: <aVpWpLV4Dut5Muo2@kernel.org>
In-Reply-To: <aVpWpLV4Dut5Muo2@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-riscv@lists.infradead.org, klarasmodin@gmail.com,
 akpm@linux-foundation.org, alexs@kernel.org, agordeev@linux.ibm.com,
 andreas@gaisler.com, bp@alien8.de, bcain@kernel.org, chleroy@kernel.org,
 catalin.marinas@arm.com, davem@davemloft.net, dave.hansen@linux.intel.com,
 david@kernel.org, dinguyen@kernel.org, geert@linux-m68k.org,
 guoren@kernel.org, hca@linux.ibm.com, deller@gmx.de, chenhuacai@kernel.org,
 mingo@redhat.com, johannes@sipsolutions.net, glaubitz@physik.fu-berlin.de,
 corbet@lwn.net, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 linmag7@gmail.com, mattst88@gmail.com, jcmvbkbc@gmail.com,
 mpe@ellerman.id.au, mhocko@suse.com, monstr@monstr.eu, muchun.song@linux.dev,
 osalvador@suse.de, palmer@dabbelt.com, pratyush@kernel.org, richard@nod.at,
 linux@armlinux.org.uk, shorne@gmail.com, surenb@google.com,
 tsbogend@alpha.franken.de, tglx@linutronix.de, gor@linux.ibm.com,
 vgupta@kernel.org, vbabka@suse.cz, will@kernel.org, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16978-lists,linuxppc-dev=lfdr.de,linux-riscv];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lists.infradead.org,gmail.com,linux-foundation.org,kernel.org,linux.ibm.com,gaisler.com,alien8.de,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,lwn.net,oracle.com,ellerman.id.au,suse.com,monstr.eu,linux.dev,suse.de,dabbelt.com,nod.at,armlinux.org.uk,google.com,alpha.franken.de,linutronix.de,suse.cz,vger.kernel.org,lists.linux-m68k.org,kvack.org,lists.ozlabs.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:linux-riscv@lists.infradead.org,m:klarasmodin@gmail.com,m:akpm@linux-foundation.org,m:alexs@kernel.org,m:agordeev@linux.ibm.com,m:andreas@gaisler.com,m:bp@alien8.de,m:bcain@kernel.org,m:chleroy@kernel.org,m:catalin.marinas@arm.com,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:hca@linux.ibm.com,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:corbet@lwn.net,m:Liam.Howlett@oracle.com,m:lorenzo.stoakes@oracle.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:muchun.song@linux.dev,m:osalvador@suse.de,m:palmer@dabbelt.com,m:pratyush@kernel.org,m:richard@nod.at,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tsbogend@alpha.franken.de,m:tglx@linutronix.de,m:gor@linux.ibm.com,m:vgupta@kernel.org,
 m:vbabka@suse.cz,m:will@kernel.org,m:x86@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-um@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:loongarch@lists.linux.dev,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FROM_NO_DN(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[66];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux-foundation.org:email]
X-Rspamd-Queue-Id: E57641648BA
X-Rspamd-Action: no action

Hello:

This patch was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Sun, 4 Jan 2026 14:01:40 +0200 you wrote:
> Andrew,
> 
> Can you please stick this between patch 3 (arm: introduce
> arch_zone_limits_init()) and patch 4 (arm64: introduce
> arch_zone_limits_init())?
> 
> From 35d016bbf5da7c08cc5c5547c85558fc50cb63aa Mon Sep 17 00:00:00 2001
> From: Klara Modin <klarasmodin@gmail.com>
> Date: Sat, 3 Jan 2026 20:40:09 +0200
> Subject: [PATCH] arm: make initialization of zero page independent of the
>  memory map
> 
> [...]

Here is the summary with links:
  - [3.5] arm: make initialization of zero page independent of the memory map (was Re: [PATCH v2 22/28] arch, mm: consolidate initialization of nodes, zones and memory map)
    https://git.kernel.org/riscv/c/18b7cc70dea8

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



