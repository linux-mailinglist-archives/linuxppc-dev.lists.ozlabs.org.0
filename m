Return-Path: <linuxppc-dev+bounces-6458-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E937A43BF3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2025 11:41:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z2Dfr2qQ8z30VF;
	Tue, 25 Feb 2025 21:41:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.140
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740480084;
	cv=none; b=Ke26emZAyRrYrZD2/YWiIDLdaoSKZ5ftI/kgMxo8qkqNNRLnw5Ajsmzl0+AOuYxy7UybEhRJJGekK7fjDyIa2KDXUNbGKMxk/97vS31Vr7zeeRLx1r1MtlKrYKIkwztg/nx6apFjYpaFSca5izWjFjY2ViRDg55HwIeXRi+wF2cY2sXcd+NoIwl7cKfwx2ddIh/nhOD8s0c9bIIDXFRsmow3EHLjm3way0jGi2cDZ4i4mMN7XE3c1/8ZKhhWBJCMZDONHkliF8mkc43L1xl5APZS96fxDJ/J54kHBlhqpRUbKmLreQsReAqV1Klg2qYtPoEbw+/JIti1bXJxyn+H3A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740480084; c=relaxed/relaxed;
	bh=XK5p1hiUrczS04SoL3Bp/F/Lh9UgXsKum/DNMyd+O3I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=RnECKJ6qioEsh3yhD+7EcJlvK2eDay0uzjun3U9s0UDAnehXlLPUiqNQPLf55lUzv0HrdjL68z0tD0yM//VqStUep3wedzEvijNTsAp2wpoike62RcPGKDlsWT/6GgukDHh35F8BvSkgsuJH+54H3d3rSFqkbNZPnYOf4/G8KlQfcritTKF0U8b1Rn25K05LAo3AOkDii019D2qzGA8YCGs9OAzchwqv+8PjPVsVAOx1h6w4Teaf4Sy1HjztoUFCaCt+o/TkTFKaQeld9TfNWTPf+6G0UNCNjljCNB9LRD827mPp4tmUUM54ZiPOs/4R063L6GdrKmX3+KcURp5RDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=RBJ4drAk; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XoA4obnl; dkim-atps=neutral; spf=pass (client-ip=202.12.124.140; helo=flow-b5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=RBJ4drAk;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XoA4obnl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.140; helo=flow-b5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-b5-smtp.messagingengine.com (flow-b5-smtp.messagingengine.com [202.12.124.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z2Dfm2jnPz30TS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 21:41:19 +1100 (AEDT)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailflow.stl.internal (Postfix) with ESMTP id 771401D40AAF;
	Tue, 25 Feb 2025 05:41:15 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-11.internal (MEProxy); Tue, 25 Feb 2025 05:41:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1740480075;
	 x=1740487275; bh=XK5p1hiUrczS04SoL3Bp/F/Lh9UgXsKum/DNMyd+O3I=; b=
	RBJ4drAkDi4M6YBkaCDOqDyN5wCHQPYi9+AfGeMwqY/qpNlNFQ3tUtNMuSxkJ916
	AnAegG6ilVT6O5uhDSEx4RZgpKZtmcqPbnB/tH9tRlk4RDW39k0AGiYBU1jRhdUr
	0Wp8LzI5Xq4OSPrzxTYuGKCxBqH536zeTNHfAmYadWnxvyQLwTwug8UaY2x0sBhE
	TaYKcfLoj6PBTY+w1ccIaD5DeAY7uj6B+MKb8xxobj3E0SCTdBkjZE39GHupz8I8
	P4/OLlpAFyiajOh9YEldB+9a/ToImHuvkhihwEDeZU56TrrvssXSpocCa1psxdvw
	fzxLkrazdsA6vRMN18y2SA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1740480075; x=
	1740487275; bh=XK5p1hiUrczS04SoL3Bp/F/Lh9UgXsKum/DNMyd+O3I=; b=X
	oA4obnliMVtK81ARPbqdZ07OboZjzjkmDRfWTS1tcVjsjmsa17tHABHV4RDSsdyq
	KN0jtmkGK6jEcr3bnIjGm1udZPSR6Y/uRgz1obXxSGFcBdpZaNQlhrIbaOxzmjYe
	v3oAm5kFs7hXBLtLO0she2IdbNoY4zE/nrLXuZ1NjF8hTEg03kDl6iohyRjlXxEu
	wn0e6sw6GsaW9VF7xzEMVXuISb6u7cPbSiHT4yPKL43ke1j540dT6H7CvcdaxoRj
	OeXZ44bFHFPdTDULpkJM7vwnp1E9nq0r3biwQBKaVYKkPrA373Xv2tyaX/FfxTg3
	L7XIQyDN1NK8yjsyyf9Ig==
X-ME-Sender: <xms:SJ69Z8PIPrKoIf0WLmDVsJZRD0UIErH0GFbM-vreL38xFgXO-WbIGQ>
    <xme:SJ69Zy_J1MKQPKLDORJXm1Rch9Uhl8hOI_pv6gYaR1AaaUjQuZHUiMJN3beSmP7Gm
    kPv2q8QxKGje-8bV68>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdekudegkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeh
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpd
    hrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgt
    phhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtoh
    eplhhinhhugiesrghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegthhhrihhs
    thhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepuggrvhgvmh
    esuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmihgtseguihhgihhkohgurdhn
    vghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtoh
    eprghnughrvggrshesghgrihhslhgvrhdrtghomh
X-ME-Proxy: <xmx:SJ69ZzQ7DlK47wxwEdju5ydbxXko8vqNS1vPjJgdtsbTgehkaks9OQ>
    <xmx:SJ69Z0tZE6pDE5BZwf2s5KHij7mengaxDMV7dwwvVFAexTZQz6Zx_w>
    <xmx:SJ69Z0cr3mO3NoRQleVX3wpKPk9j9PA-yGSDh95R3j9y8YpsBBW7pQ>
    <xmx:SJ69Z43T1BgmWCTnSnOsbP_Zj1FXm0XrXiAlYIW-7e5AqkjZ2TzBxA>
    <xmx:S569Z7uEE9GKvRJyoyVMzDIQM5s6J6f_qx_1sZuvcT1k8e2bLBLD7mtJ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 82A852220072; Tue, 25 Feb 2025 05:41:12 -0500 (EST)
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
MIME-Version: 1.0
Date: Tue, 25 Feb 2025 11:40:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christian Brauner" <brauner@kernel.org>
Cc: "Amir Goldstein" <amir73il@gmail.com>,
 "Andrey Albershteyn" <aalbersh@redhat.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>, "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Chris Zankel" <chris@zankel.net>,
 "Max Filippov" <jcmvbkbc@gmail.com>,
 "Alexander Viro" <viro@zeniv.linux.org.uk>, "Jan Kara" <jack@suse.cz>,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-api@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-xfs@vger.kernel.org, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>,
 "Theodore Ts'o" <tytso@mit.edu>
Message-Id: <3c860dc0-ba8d-4324-b286-c160b7d8d2c4@app.fastmail.com>
In-Reply-To: <20250225-strom-kopflos-32062347cd13@brauner>
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org>
 <20250221181135.GW21808@frogsfrogsfrogs>
 <CAOQ4uxgyYBFqkq6cQsso4LxJsPJ4uECOdskXmz-nmGhhV5BQWg@mail.gmail.com>
 <20250224-klinke-hochdekoriert-3f6be89005a8@brauner>
 <6b51ffa2-9d67-4466-865e-e703c1243352@app.fastmail.com>
 <20250225-strom-kopflos-32062347cd13@brauner>
Subject: Re: [PATCH v3] fs: introduce getfsxattrat and setfsxattrat syscalls
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 25, 2025, at 11:22, Christian Brauner wrote:
> On Tue, Feb 25, 2025 at 09:02:04AM +0100, Arnd Bergmann wrote:
>> On Mon, Feb 24, 2025, at 12:32, Christian Brauner wrote:
>> 
>> The ioctl interface relies on the existing behavior, see
>> 0a6eab8bd4e0 ("vfs: support FS_XFLAG_COWEXTSIZE and get/set of
>> CoW extent size hint") for how it was previously extended
>> with an optional flag/word. I think that is fine for the syscall
>> as well, but should be properly documented since it is different
>> from how most syscalls work.
>
> If we're doing a new system call I see no reason to limit us to a
> pre-existing structure or structure layout.

Obviously we could create a new structure, but I also see no
reason to do so. The existing ioctl interface was added in
in 2002 as part of linux-2.5.35 with 16 bytes of padding, half
of which have been used so far.

If this structure works for another 23 years before we run out
of spare bytes, I think that's good enough. Building in an
incompatible way to handle potential future contents would
just make it harder to use for any userspace that wants to
use the new syscalls but still needs a fallback to the
ioctl version.

     Arnd

