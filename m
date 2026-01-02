Return-Path: <linuxppc-dev+bounces-15168-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 46984CEF22C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 02 Jan 2026 19:05:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4djWnJ4pY2z2yFj;
	Sat, 03 Jan 2026 05:05:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767377108;
	cv=none; b=hcLgACzXdqJ6WQsAJcL50RoD2rjeupSxzq0o5BUdQytR0kUsOCCEo4OMy5FJjZIp4/Ic5a8CpmF9zTszemZHzHl5myyCuzk0JeiEJmJMq+B0GR20YM1SVxJY17mWINHohRXE9qy9HiAPrOpTLSeDoULgx0o0LdLbSU8H4bjM7CHoayMv2asWDT/JuUFlx2gpj7/93JeYAeCQUOq63qd9GY9FjIHhpokWT/yOLVtqUFZ0JAPbf4qSeH2WsMzrNX6lw26zrWjsufMCPb9EHDOHkfN2xjf2YBznCdf7SgbFSjiZXPannlccv6VWKlxrato65WB4EW2UCGRgbWWZ8bBUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767377108; c=relaxed/relaxed;
	bh=WK/bgpNIq35gMtTCTtjcDTohaC0NThBM9ONBNETbhsU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=OyNShv8L7ZzIuKgqsVdFGXnjS3EutUlSYs0qO3QL6bxIkM1gI549d1V+cxtuuDjhpufsOGzhKuqkxCH9rtUNnWudQVpZXr42arFTzuw4ARnkcYoDh8BJLnnO70OQ7XZ3aARnAj5JSKlnamyeVA8LndVDpMANVa/Rz4an+SAurB3CTOFdxFHW+oYhpjTq2/5ggarWkjtYBt1DpYoQc+lcMUceCjyDRmtVRxrVdG99hRJmW/TvSxg+Wi2hhVm5Z8TMP/ovYTOFLM/8D7scZdcVDIeIacJYagsYrokfRKbZTycPSinOeqQNPuJ3CEZYI+u2iObAGHuTqCDDWiWG8BZLMA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=m4LVIjF3; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=m4LVIjF3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4djWnG5lpXz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 03 Jan 2026 05:05:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2F6A16013C;
	Fri,  2 Jan 2026 18:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDEB7C116B1;
	Fri,  2 Jan 2026 18:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1767377072;
	bh=9Q3BCyqOSN+oJgFNTsghHD+u6iamA25tuC/5QoeUzQI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=m4LVIjF3/x1+uJPkmzdQVneFBhdr/tNflWJvzon2aAKXFzapOWWp8T9zfIUe6d3Fu
	 /gElMshb/CMy7xVVdFVFtfq0zPQL7Po74BU1gTpXa7kMFv+gt7F6M9I77NtH9DPO1l
	 PeYULVm06wYXARz/UnbL6bNqJludz4ddsr/It9s4=
Date: Fri, 2 Jan 2026 10:04:30 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Alex Shi <alexs@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Andreas Larsson <andreas@gaisler.com>, Borislav Petkov <bp@alien8.de>,
 Brian Cain <bcain@kernel.org>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 "David S. Miller" <davem@davemloft.net>, Dave Hansen
 <dave.hansen@linux.intel.com>, David Hildenbrand <david@kernel.org>, Dinh
 Nguyen <dinguyen@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Guo Ren <guoren@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Helge
 Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, John Paul
 Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Jonathan Corbet
 <corbet@lwn.net>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>, Magnus Lindholm <linmag7@gmail.com>,
 Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Michal Hocko <mhocko@suse.com>,
 Michal Simek <monstr@monstr.eu>, Muchun Song <muchun.song@linux.dev>, Oscar
 Salvador <osalvador@suse.de>, Palmer Dabbelt <palmer@dabbelt.com>, Pratyush
 Yadav <pratyush@kernel.org>, Richard Weinberger <richard@nod.at>, Russell
 King <linux@armlinux.org.uk>, Stafford Horne <shorne@gmail.com>, Suren
 Baghdasaryan <surenb@google.com>, Thomas Bogendoerfer
 <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, Vasily
 Gorbik <gor@linux.ibm.com>, Vineet Gupta <vgupta@kernel.org>, Vlastimil
 Babka <vbabka@suse.cz>, Will Deacon <will@kernel.org>, x86@kernel.org,
 linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-csky@vger.kernel.org, linux-cxl@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, sparclinux@vger.kernel.org
Subject: Re: [PATCH 00/28] arch, mm: consolidate hugetlb early reservation
Message-Id: <20260102100430.623bc1d19b867588bc64f890@linux-foundation.org>
In-Reply-To: <aVdswNM9PUN6Kr8Q@kernel.org>
References: <20251228124001.3624742-1-rppt@kernel.org>
	<20251231172714.a7fe44e856c14fdc8fe1cb43@linux-foundation.org>
	<aVdswNM9PUN6Kr8Q@kernel.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 2 Jan 2026 08:59:12 +0200 Mike Rapoport <rppt@kernel.org> wrote:

> > > I tried to trim the distribution list and although it's still quite long
> > > if you feel that someone was wrongly excluded please add them back.
> > 
> > I'll add these to mm.git's mm-new branch for some testing.  I'll
> > suppress the usual email storm because 41 * 28 is a lot of emails ;)
> 
> kbuild reported failures on some configurations so I'm anyway going to send
> a lot of emails for v2 :)

Cool, I grabbed v2.

