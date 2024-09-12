Return-Path: <linuxppc-dev+bounces-1286-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40008976700
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2024 12:54:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4Dp571jhz2yQj;
	Thu, 12 Sep 2024 20:54:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726138445;
	cv=none; b=d2kky3dI4A6+gwht860sR28GFXYbz2i54toCjFLx5wE6DSuKtIgHN1uy94BeYKDfrp8d4TjIrV/iSDvKjA9UimVgZMdLK/myT6nXRbft0jZw0s20sHtlKrbPiPLq5rr6jaF4R/BSrw9IxH6GLtQPR5TnpjyoDOA3DzrGLysqKmIVTqXkEPbfdSt5yjieiZf4VHAiuohQEz83IcoCiDWfFyR5VClmzSH4VfPK4fSVBloTEvziWX6/f2bX9aym0HJDGtb/6spxI0rblk1ZwKEdr9/C4ay4wPzKPCSGBMPsMLsIjFr80pVLYsLa/fDKgsjLNGuOwwyqqKgAYPj2kTLHHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726138445; c=relaxed/relaxed;
	bh=Tcu3WzYhkhRIl8zoELqQRKUTsUk2UOjbt0o1Dc4AHjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kr/lnhj0r2MEzcCHxAMURxfoCeddlibQwLm3sbm15CnOmNWOKoOOWqR7aimpsc4v7Usl57rcN4wafgRmvcTyb7wk8D9kRcD4WzKOX1I7IWaTgJ1BKRLA92TDblYpiIL+y9c1/Jqh7OOz14xhtJT49gEndtMI8aq5dAflNeLTfPTWqsg4eV+R07VK1rMX4syokrTX+HCvtHeLqafKqRiKN1vKoqG1TZh1Xnn8aFkQePTIUCkSVLHQWJ2uFiqAxLrjtEFbt1Ev9qIylAl+OEsg6sfgHkve2Y2pa9s1bbDTl0JCb0Kq8DZz6SWv0ThP8ooJp4d0j5MljzKShelY5e10qQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4Dp46TkVz2yHs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2024 20:54:04 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8DC035C5AA4;
	Thu, 12 Sep 2024 10:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C3EC4CEC3;
	Thu, 12 Sep 2024 10:53:51 +0000 (UTC)
Date: Thu, 12 Sep 2024 11:53:49 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>, guoren <guoren@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	"James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
	Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Muchun Song <muchun.song@linux.dev>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	shuah <shuah@kernel.org>, Christoph Hellwig <hch@infradead.org>,
	Michal Hocko <mhocko@suse.com>,
	"Kirill A. Shutemov" <kirill@shutemov.name>,
	Chris Torek <chris.torek@gmail.com>,
	Linux-Arch <linux-arch@vger.kernel.org>,
	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
	loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
	linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-abi-devel@lists.sourceforge.net
Subject: Re: [PATCH RFC v3 1/2] mm: Add personality flag to limit address to
 47 bits
Message-ID: <ZuLIPZId9aHcAY2j@arm.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
 <20240905-patches-below_hint_mmap-v3-1-3cd5564efbbb@rivosinc.com>
 <9fc4746b-8e9d-4a75-b966-e0906187e6b7@app.fastmail.com>
 <CAJF2gTTVX9CFM3oRZZP3hGExwVwA_=n1Lrq_0DQKWA+-ZbOekg@mail.gmail.com>
 <f23b18c6-1856-4b59-9ba3-59809b425c81@app.fastmail.com>
 <Ztrq8PBLJ3QuFJz7@arm.com>
 <oshwto46wbbgneiayj63umllyozm3c4267rvpszqzaopwnt2l7@6mxl5vydtons>
 <ZuDoExckq21fePoe@ghost>
 <ZuHfp0_tAQhaymdy@arm.com>
 <ZuKHpFB+uWuJe2xm@ghost>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZuKHpFB+uWuJe2xm@ghost>

On Wed, Sep 11, 2024 at 11:18:12PM -0700, Charlie Jenkins wrote:
> Opting-in to the higher address space is reasonable. However, it is not
> my preference, because the purpose of this flag is to ensure that
> allocations do not exceed 47-bits, so it is a clearer ABI to have the
> applications that want this guarantee to be the ones setting the flag,
> rather than the applications that want the higher bits setting the flag.

Yes, this would be ideal. Unfortunately those applications don't know
they need to set a flag in order to work.

A slightly better option is to leave the default 47-bit at the kernel
ABI level and have the libc/dynamic loader issue the prctl(). You can
control the default with environment variables if needed.

We do something similar in glibc for arm64 MTE. When MTE is enabled, the
top byte of an allocated pointer contains the tag that must not be
corrupted. We left the decision to the C library via the
glibc.mem.tagging tunable (Android has something similar via the app
manifest). An app can change the default if it wants but if you run with
old glibc or no environment variable to say otherwise, the default would
be safe. Distros can set the environment to be the maximum range by
default if they know the apps included have been upgraded and tested.

-- 
Catalin

