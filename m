Return-Path: <linuxppc-dev+bounces-16971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GAvVJdDel2nW9gIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 05:10:56 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9865B164827
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Feb 2026 05:10:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fHGxn3QJcz3blq;
	Fri, 20 Feb 2026 15:10:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771560637;
	cv=none; b=hONamT4Sm3Vu3BW+TR5IG8ZHSL3Q+T4Ydw3GnJByEH/5Ygeg3QsXTAp6D+3UgP+6Loes9xhLMM9axdKxWdq9QJPqJc2UgIm7OEnM7zkaZiAJgrclSF9m4VUx5t4e2GCr10Z9EFglySxu9wTWBYXn8tJuhWzD1fCiNVRoUJGULOzp9JSb5Pin3cF8eomh27xV1rXkkCiYbyKcBERetDrguLeD2MZUmgH5LGW5OmE046382Hq4eF0Gz0cJrpFMycZ+g2gWm8oUUTrcuKCWY/lp8G6GhLKJgMHb1Q0Y8wFFzdF05g5s56s3Qo8goA/8iEHQwy1PN3Qs0UPkuUnRem9hNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771560637; c=relaxed/relaxed;
	bh=UmtwuF9rplNR1YcI1IPERFnu/d2QeRotv3msVVu+S8Y=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=XeT6ry+v0aA2NHNu/ibVVHBiIU3KWnmRmFYTVOBLUgr9f/AxdPvWMlyFAxF1n0yZIykvRBwTZdLcPS8i7e7h1ivWKsXBqxDr9HVhpeeDAYo4AUL3j1gqqzABb3vEq8f3hGEqpwKFBNwSkZwPpGzIvtAb3mB6LT4RuRt0AIiqIYdggNdqhDvac8ncWpHqqMss5s5QwSpxRwzAlSPUjR32+Yn63AIh609q9AugSzloQkmkmC5MsSajz1Q6nYeK6CNN3QuveE8Y7sPwscxccZItcnm48itM6S9sYKQKZDiADC4Tq9TFFS9aGtKlVdNCzfEXZXGC5fhlw0bUtgSVWARn6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BY31bXLu; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BY31bXLu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+linux-riscv@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fHGxm4DpLz3bZm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Feb 2026 15:10:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4DD1061853;
	Fri, 20 Feb 2026 04:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E068FC116D0;
	Fri, 20 Feb 2026 04:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771560633;
	bh=im5T2AhfGDyXaPXyhpLfgJGQ91DbQgM5VZmwKBunt1A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=BY31bXLuYwaDNUvbU0KhmqMJP3M/Awj2XilOUUrqfd5tse5Bs+Sof47ei7f2ySnfn
	 tFNi7q7K9gluSvI0HlMVWVeaLxpkyoeKBDi/rrNOewr0OuAFpDC7j/iRqwMKPlJ5Wa
	 P3ScJYlX18vFMmmARgpPLIChzrvUE2kp6Q3jnE9jYkAe7srv3PTOOcxMtCzqbU7qAw
	 IToOjDmvHez/A8mTg3Q3sBsLUBSNAWxLa0iZsksGoJ/G/rax+WVfDfh7lH4OceXS15
	 qVM1jLAxgENfoZP8fJU+Wp+4V3bOt53kAg6T75fF/G3mbGiObvL/fXyvhcTJ2XNYm0
	 uwW0QrKe9zoGw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CFE83809A88;
	Fri, 20 Feb 2026 04:10:43 +0000 (UTC)
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
Subject: Re: [PATCH v3 00/29] arch, mm: consolidate hugetlb early reservation
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <177156064229.189817.6698956997773300471.git-patchwork-notify@kernel.org>
Date: Fri, 20 Feb 2026 04:10:42 +0000
References: <20260111082105.290734-1-rppt@kernel.org>
In-Reply-To: <20260111082105.290734-1-rppt@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-riscv@lists.infradead.org, akpm@linux-foundation.org,
 alexs@kernel.org, agordeev@linux.ibm.com, andreas@gaisler.com, bp@alien8.de,
 bcain@kernel.org, chleroy@kernel.org, catalin.marinas@arm.com,
 davem@davemloft.net, dave.hansen@linux.intel.com, david@kernel.org,
 dinguyen@kernel.org, geert@linux-m68k.org, guoren@kernel.org,
 hca@linux.ibm.com, deller@gmx.de, chenhuacai@kernel.org, mingo@redhat.com,
 johannes@sipsolutions.net, glaubitz@physik.fu-berlin.de, corbet@lwn.net,
 klarasmodin@gmail.com, Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com,
 linmag7@gmail.com, mattst88@gmail.com, jcmvbkbc@gmail.com,
 mpe@ellerman.id.au, mhocko@suse.com, monstr@monstr.eu, muchun.song@linux.dev,
 osalvador@suse.de, palmer@dabbelt.com, pratyush@kernel.org, richard@nod.at,
 ritesh.list@gmail.com, linux@armlinux.org.uk, shorne@gmail.com,
 surenb@google.com, tsbogend@alpha.franken.de, tglx@linutronix.de,
 gor@linux.ibm.com, vgupta@kernel.org, vbabka@suse.cz, will@kernel.org,
 x86@kernel.org, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-openrisc@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16971-lists,linuxppc-dev=lfdr.de,linux-riscv];
	FREEMAIL_CC(0.00)[lists.infradead.org,linux-foundation.org,kernel.org,linux.ibm.com,gaisler.com,alien8.de,arm.com,davemloft.net,linux.intel.com,linux-m68k.org,gmx.de,redhat.com,sipsolutions.net,physik.fu-berlin.de,lwn.net,gmail.com,oracle.com,ellerman.id.au,suse.com,monstr.eu,linux.dev,suse.de,dabbelt.com,nod.at,armlinux.org.uk,google.com,alpha.franken.de,linutronix.de,suse.cz,vger.kernel.org,lists.linux-m68k.org,kvack.org,lists.ozlabs.org,lists.linux.dev];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:rppt@kernel.org,m:linux-riscv@lists.infradead.org,m:akpm@linux-foundation.org,m:alexs@kernel.org,m:agordeev@linux.ibm.com,m:andreas@gaisler.com,m:bp@alien8.de,m:bcain@kernel.org,m:chleroy@kernel.org,m:catalin.marinas@arm.com,m:davem@davemloft.net,m:dave.hansen@linux.intel.com,m:david@kernel.org,m:dinguyen@kernel.org,m:geert@linux-m68k.org,m:guoren@kernel.org,m:hca@linux.ibm.com,m:deller@gmx.de,m:chenhuacai@kernel.org,m:mingo@redhat.com,m:johannes@sipsolutions.net,m:glaubitz@physik.fu-berlin.de,m:corbet@lwn.net,m:klarasmodin@gmail.com,m:Liam.Howlett@oracle.com,m:lorenzo.stoakes@oracle.com,m:linmag7@gmail.com,m:mattst88@gmail.com,m:jcmvbkbc@gmail.com,m:mpe@ellerman.id.au,m:mhocko@suse.com,m:monstr@monstr.eu,m:muchun.song@linux.dev,m:osalvador@suse.de,m:palmer@dabbelt.com,m:pratyush@kernel.org,m:richard@nod.at,m:ritesh.list@gmail.com,m:linux@armlinux.org.uk,m:shorne@gmail.com,m:surenb@google.com,m:tsbogend@alpha.franken.de,m:tglx@linutronix.de,m:gor@linux.ibm.
 com,m:vgupta@kernel.org,m:vbabka@suse.cz,m:will@kernel.org,m:x86@kernel.org,m:linux-alpha@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-csky@vger.kernel.org,m:linux-cxl@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-hexagon@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-m68k@lists.linux-m68k.org,m:linux-mips@vger.kernel.org,m:linux-mm@kvack.org,m:linux-openrisc@vger.kernel.org,m:linux-parisc@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-sh@vger.kernel.org,m:linux-snps-arc@lists.infradead.org,m:linux-um@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,m:loongarch@lists.linux.dev,m:sparclinux@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[patchwork-bot@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[67];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux-foundation.org:email]
X-Rspamd-Queue-Id: 9865B164827
X-Rspamd-Action: no action

Hello:

This series was applied to riscv/linux.git (fixes)
by Andrew Morton <akpm@linux-foundation.org>:

On Sun, 11 Jan 2026 10:20:34 +0200 you wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
> 
> Hi,
> 
> Order in which early memory reservation for hugetlb happens depends on
> architecture, on configuration options and on command line parameters.
> 
> [...]

Here is the summary with links:
  - [v3,01/29] alpha: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/ba1c86874e25
  - [v3,02/29] arc: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/7988e8518904
  - [v3,03/29] arm: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/30a66f8a8cd3
  - [v3,04/29] arm: make initialization of zero page independent of the memory map
    https://git.kernel.org/riscv/c/18b7cc70dea8
  - [v3,05/29] arm64: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/60b35af0a6aa
  - [v3,06/29] csky: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/37318eb97f23
  - [v3,07/29] hexagon: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/934afdf7f4cc
  - [v3,08/29] loongarch: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/63cadcb731c9
  - [v3,09/29] m68k: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/41b08a7abf89
  - [v3,10/29] microblaze: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/2ce38c9ae840
  - [v3,11/29] mips: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/f61385e29444
  - [v3,12/29] nios2: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/3b1b0e5797bd
  - [v3,13/29] openrisc: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/1d28b1142383
  - [v3,14/29] parisc: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/950696afe400
  - [v3,15/29] powerpc: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/27bebe446f8d
  - [v3,16/29] riscv: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/db8cdb0ad603
  - [v3,17/29] s390: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/76c4c463bbc0
  - [v3,18/29] sh: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/8bfa6c2259f4
  - [v3,19/29] sparc: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/6ad7ea22cf6f
  - [v3,20/29] um: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/531de7f02d51
  - [v3,21/29] x86: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/34f6b9c6e417
  - [v3,22/29] xtensa: introduce arch_zone_limits_init()
    https://git.kernel.org/riscv/c/2d3c8c5f33e0
  - [v3,23/29] arch, mm: consolidate initialization of nodes, zones and memory map
    https://git.kernel.org/riscv/c/d49004c5f0c1
  - [v3,24/29] arch, mm: consolidate initialization of SPARSE memory model
    https://git.kernel.org/riscv/c/4267739cabb8
  - [v3,25/29] mips: drop paging_init()
    https://git.kernel.org/riscv/c/5dea39496c68
  - [v3,26/29] x86: don't reserve hugetlb memory in setup_arch()
    https://git.kernel.org/riscv/c/6632314fddc4
  - [v3,27/29] mm, arch: consolidate hugetlb CMA reservation
    https://git.kernel.org/riscv/c/9fac145b6d3f
  - [v3,28/29] mm/hugetlb: drop hugetlb_cma_check()
    https://git.kernel.org/riscv/c/7a9c0bf0aec6
  - [v3,29/29] Revert "mm/hugetlb: deal with multiple calls to hugetlb_bootmem_alloc"
    https://git.kernel.org/riscv/c/743758ccf8be

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



