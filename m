Return-Path: <linuxppc-dev+bounces-1032-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0515A96CFEE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2024 09:02:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WzqzY33plz2xr2;
	Thu,  5 Sep 2024 17:02:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.139
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725519395;
	cv=none; b=FsnvRkApiCfrPafJAys6TbfU3Br4DWEawmUgbfZLDBf076NGOlIHWfMFbCRDhdyo0kh98lndR00g3lE4yhqerEkGIojf3CCswXKgaQJZtXcGssEw3hg9+uOhFTvh5YbqOC1OqMNbnbm1npvQt6uQjzbBo+c1XNveMwPX8tX+c/zpa4Hol/jnDIdx6gYr+jW7yHWwmLW+Ia9ktQEz1Ftczn3Cjc496wM0OJPU1wtHnFZ/T/EG9eGEO2zBvfQOTccuD2Jzl0uda0D7VTHIvjoHFhe1+U8TZX37oP35qBZjkvVPKIBzSyl/KFCe9Y+ihnab04/ymV68mjW/48T3vkdvCw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725519395; c=relaxed/relaxed;
	bh=Mf2wLWEzbgEDGO9xDiUM7qVc6lrNS1Frm04RYEBk1sI=;
	h=DKIM-Signature:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To; b=CE1WBal3jxUkTmExYACN4qS3T2frH0mCH3aS13Wy9vxp4lOTmFuWWGiTw6wUstw6RimhV5kWKzeUqxhQzKnIwkek+79CW3ttcoRVuHq2M+j8Dmx+Uck2AKRcvIrkxgFoVeOPgm8eyY/Xg2PAUQX41PtZd130fp5a0U1UlL6OHtp4pPqzkaB0OLQ5hQvTBcHMMDstH8ZSBIFRbLqFGt/BHTStEM5SJPLevnC835iN8OnSiqolxkH3sHvZaZkbW5qnOfJtJCgxR8vCm6BznsWFA6/cHTEogUlA7p9fgwmtdyTA2xUrPSpbYopYhxpPNzhHszVJ2UFLmWReo2sKh/kmoA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name; dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm2 header.b=Q8crL5EL; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=OU81mlQL; dkim-atps=neutral; spf=pass (client-ip=103.168.172.139; helo=flow4-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org) smtp.mailfrom=shutemov.name
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=shutemov.name
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=shutemov.name header.i=@shutemov.name header.a=rsa-sha256 header.s=fm2 header.b=Q8crL5EL;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=OU81mlQL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=shutemov.name (client-ip=103.168.172.139; helo=flow4-smtp.messagingengine.com; envelope-from=kirill@shutemov.name; receiver=lists.ozlabs.org)
X-Greylist: delayed 496 seconds by postgrey-1.37 at boromir; Thu, 05 Sep 2024 16:56:33 AEST
Received: from flow4-smtp.messagingengine.com (flow4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WzqsF0NNDz2xr2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2024 16:56:33 +1000 (AEST)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailflow.phl.internal (Postfix) with ESMTP id 2A50C200312;
	Thu,  5 Sep 2024 02:48:13 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-07.internal (MEProxy); Thu, 05 Sep 2024 02:48:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=shutemov.name;
	 h=cc:cc:content-type:content-type:date:date:from:from
	:in-reply-to:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=fm2; t=1725518893; x=
	1725526093; bh=Mf2wLWEzbgEDGO9xDiUM7qVc6lrNS1Frm04RYEBk1sI=; b=Q
	8crL5ELpizMZj53aZEPPP8KupjNzGuUtN+S5Eql/8fjeevh2FEI8C/KRzBgjisY8
	ios3Pgjc7SkHZNFrwTBdbN9vLV0hQOPZ0eGAbRLWcSFDhE/k/dFK/6686hm06Qc7
	j+d1+irVVZvEWixrzNwCK0W0NFAOLfexqwJSuWjLycECHToeCwRE/1nGc1l53s4y
	bTxHKlADHmHXtzGUzzaiGYjtQhWPUZPI1/USh3xl6u1Sv+0nc2TPrbw6UIkv/TH5
	o0fe/l4uJKU0W7HYU3dmXPK5TN/niHwvbSVEfHyU6/SyMLvAiqJybTS8Vdvh4PKb
	H+eYihXIcEOzrl4xD0b/g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1725518893; x=1725526093; bh=Mf2wLWEzbgEDGO9xDiUM7qVc6lrN
	S1Frm04RYEBk1sI=; b=OU81mlQLPJz3hQL5seRxaoll2jedmTxaU/rc98Aelm4E
	LAxjKKoyXT3sGMCDk5gVUo9sxMNF10KBdu8zNR469iNU+zb+tCPxEiRvZRViIIGY
	4fRFF6UlbxvVpD5zNmimnvrmkdHBLjbsEEMeFENIAWyU688aW4sL4S7nK33Ed+/W
	TyoXbq/qhCQqfRaAUgcJL4Qlr9Fj3Kdw1fErx8TN92mDg+L0IfsQjqkdjZyqKyoX
	xxZY1zHYiN3d8+EpCTErHeTz8LagFsN6v0fROg/TqD03KtfFlVXL4OQSdmSkjWEs
	7+FNGRNxSZmK+xVN+gK5oYOL0OpwypHDNQIa583pLA==
X-ME-Sender: <xms:KVTZZtmPE-thdTnuY_8p_VYbScCFsLPUpHQE1sSDWOUGpPhis5okIQ>
    <xme:KVTZZo1Rk7zksy2dploGdpr-AyeT9WYUGP1TsK2AxLpGyZ512Gxr45tn13iRPanwo
    jUygEc69YU63tyiwpI>
X-ME-Received: <xmr:KVTZZjq_WhH3u82jxZ84wXaPI17hSYcHUbnROaZ7wU0ggfeJ3nMXkfr_MNvXqfbD0Tby-A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehkedguddugecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdfstddttddv
    necuhfhrohhmpedfmfhirhhilhhlucetrdcuufhhuhhtvghmohhvfdcuoehkihhrihhllh
    esshhhuhhtvghmohhvrdhnrghmvgeqnecuggftrfgrthhtvghrnhepffdvveeuteduhffh
    ffevlefhteefveevkeelveejudduvedvuddvleetudevhfeknecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlsehshhhuthgvmhho
    vhdrnhgrmhgvpdhnsggprhgtphhtthhopeehjedpmhhouggvpehsmhhtphhouhhtpdhrtg
    hpthhtoheptghhrghrlhhivgesrhhivhhoshhinhgtrdgtohhmpdhrtghpthhtoheprghr
    nhgusegrrhhnuggsrdguvgdprhgtphhtthhopehrihgthhgrrhgurdhhvghnuggvrhhsoh
    hnsehlihhnrghrohdrohhrghdprhgtphhtthhopehinhhksehjuhhrrghsshhitgdrphgr
    rhhkrdhmshhurdhruhdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilhdrtghomh
    dprhgtphhtthhopehvghhuphhtrgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhi
    nhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopehguhhorhgvnheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheptghhvghnhhhurggtrghisehkvghrnhgvlhdr
    ohhrgh
X-ME-Proxy: <xmx:KVTZZtnzzMVFQMQuTZtC752mZiRRbs6t6YcMoPbuWvOsshNuIpN2ZA>
    <xmx:KVTZZr2NqJHS-K1m6CZXX9gA76bE8gj6MA6NfpzKnkdoePcXVRrFGA>
    <xmx:KVTZZsvDPoUpWv-9vcqAuPt1ffOgwMCdy7jO9etPU_H5-IK1rvsyPg>
    <xmx:KVTZZvVQYxvPemikvBptMQf8FFNrgJR1-TyZmjrtc_-NhbXBtGvm-w>
    <xmx:LVTZZrXmQ5mCcW2zvtjGPHJiDs11N1_ZXK9wQrKvm9JMfjCFohmINZ7A>
Feedback-ID: ie3994620:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Sep 2024 02:47:52 -0400 (EDT)
Date: Thu, 5 Sep 2024 09:47:47 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
 	Richard Henderson <richard.henderson@linaro.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 	Matt Turner <mattst88@gmail.com>, Vineet Gupta <vgupta@kernel.org>,
 	Russell King <linux@armlinux.org.uk>, Guo Ren <guoren@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, 	WANG Xuerui <kernel@xen0n.name>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, 	Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 	Christophe Leroy <christophe.leroy@csgroup.eu>,
 Naveen N Rao <naveen@kernel.org>,
 	Alexander Gordeev <agordeev@linux.ibm.com>,
 Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
 	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 	Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 	Yoshinori Sato <ysato@users.sourceforge.jp>,
 Rich Felker <dalias@libc.org>,
 	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 "David S. Miller" <davem@davemloft.net>,
 	Andreas Larsson <andreas@gaisler.com>,
 Thomas Gleixner <tglx@linutronix.de>, 	Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>,
 	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, 	Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 	Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>,
 	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
 	linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org,
 	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev, 	linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 	linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, 	linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH RFC v2 0/4] mm: Introduce MAP_BELOW_HINT
Message-ID: <yu7um2tcxg2apoz372rmzpkrfgbb42ndvabvrsp4usb2e3bkrf@huaucjsp5vlj>
References: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>
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
In-Reply-To: <20240829-patches-below_hint_mmap-v2-0-638a28d9eae0@rivosinc.com>

On Thu, Aug 29, 2024 at 12:15:57AM -0700, Charlie Jenkins wrote:
> Some applications rely on placing data in free bits addresses allocated
> by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> address returned by mmap to be less than the 48-bit address space,
> unless the hint address uses more than 47 bits (the 48th bit is reserved
> for the kernel address space).
> 
> The riscv architecture needs a way to similarly restrict the virtual
> address space. On the riscv port of OpenJDK an error is thrown if
> attempted to run on the 57-bit address space, called sv57 [1].  golang
> has a comment that sv57 support is not complete, but there are some
> workarounds to get it to mostly work [2].
> 
> These applications work on x86 because x86 does an implicit 47-bit
> restriction of mmap() address that contain a hint address that is less
> than 48 bits.
> 
> Instead of implicitly restricting the address space on riscv (or any
> current/future architecture), a flag would allow users to opt-in to this
> behavior rather than opt-out as is done on other architectures. This is
> desirable because it is a small class of applications that do pointer
> masking.

This argument looks broken to me.

The "small class of applications" is going to be broken unless they got
patched to use your new mmap() flag. You are asking for bugs.

Consider the case when you write, compile and validate a piece of software
on machine that has <=47bit VA. The binary got shipped to customers.
Later, customer gets a new shiny machine that supports larger address
space and your previously working software is broken. Such binaries might
exist today.

It is bad idea to use >47bit VA by default. Most of software got tested on
x86 with 47bit VA.

We can consider more options to opt-in into wider address space like
personality or prctl() handle. But opt-out is no-go from what I see.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov

