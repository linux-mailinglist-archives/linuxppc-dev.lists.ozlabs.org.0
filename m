Return-Path: <linuxppc-dev+bounces-6104-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA630A3150A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 20:24:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ysrwz20RSz3013;
	Wed, 12 Feb 2025 06:24:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.136
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739301875;
	cv=none; b=F3Kt1tCFHqnetwML0oVjkZzlBi6hNiSkcKrykfUWZ71pcthnt5LqCk346HyXWZbNayZbATe4v/0YZbIKb8FKdWCgl0dvkHTdQn+cQFdRNJqghQ/66ywAioMrcwLlRhJU4xFRiAReQcxOcG+Ga/wKCwztDconUPxsd1Mx4j+pOC7slCXrI0YWtHQnFjx5uMmM+oRnMZT6nLhTQ3qblos9QtVFovsJoGST/bz/G5F1LK/ijM2o6LyeBTuocopgBs6kmnjEineB8qRfvTc66c+8MPG7Yb8/VpkpBhD3Se2cIDtrwwveVVDhXYXLMhs+sa3Jk9y78HEjGMA+FCKuwQu9dA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739301875; c=relaxed/relaxed;
	bh=c3d2vNEaLKWV5MP/R/ATr1E1H0RvMwxHYf1Cp5qlV3I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Fob953I3RsfIzMM782yPMGx4npvPfzLlUjfhx8RM3kM7mBLkFn/nF+8/KFKo8/ZnVeCNABZiQxRcdQIbs2zzgDRiPjhEY4S924xq2sY1g9AtNnmuCeRKbIhUO0WIigFi0GgztvpkgXrmqpUeYiqMQ1GU2NGD1RfV1e/wuoOxlZKx5ReTPwui88Wn2ZW57UjLsmREXBIxvNUXY99Kn8FoickV0siqpsJUb3d6t3GsT9au+ZDD26kvIcwRDttD94N4dO2wVUmUcxumfveqxK9ho0SYagOqUn9mvJV2GnBzztwl+yLPoKfnN4OibXut4Yksu8iBSkCOMzpIF6HIo9Pr+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=H1mk6Diq; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kpJwh4ER; dkim-atps=neutral; spf=pass (client-ip=103.168.172.136; helo=flow-a1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=H1mk6Diq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kpJwh4ER;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.136; helo=flow-a1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-a1-smtp.messagingengine.com (flow-a1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ysrwv3vnmz2yyJ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Feb 2025 06:24:31 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id 33B60201429;
	Tue, 11 Feb 2025 14:24:27 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 11 Feb 2025 14:24:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1739301867;
	 x=1739309067; bh=c3d2vNEaLKWV5MP/R/ATr1E1H0RvMwxHYf1Cp5qlV3I=; b=
	H1mk6DiqkFxdaYDq+XrnH8tSDTT8Wz0IzX6XL6dUXhL78edeBCmXPGsNalqy0uVh
	qfVX/eprmx9jfhnZLIibSxEnb/yvox+Psohl6D+biy1usicOOYfycAQ2/lHbv7lM
	ms22mxqpOENU1kVoeVGl9qKtHG5mrujViCEqY0VqdFfcppxn9atgtNyvfUPWmoke
	iSaUJwdmeT5vL2m9nOgiPbOQ8inT6fzN26/QdI3b3ROKoE+2F5hJFKlCRtQC3y3c
	pNkD/sKqZig+fogqosYE5BTnVmyK6o10RK5f/h5GDNzrhM5tSiEXUMV0Q3nN/9rS
	xa4XKlLduvuE5qltdHFuwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1739301867; x=
	1739309067; bh=c3d2vNEaLKWV5MP/R/ATr1E1H0RvMwxHYf1Cp5qlV3I=; b=k
	pJwh4ERJCdsI83YQZOuod4nqq8kn1u8tNVYkl/OjbgBveJxUNjHPRWiuP/sMWePe
	hWZL7RWcLgrDzeKv5GrR3PoYeTufoc3U4SB55vLC3FbOavO5wEdBzvHuqivBxaRF
	6YUgMOaaWBUp0mJhL6e90goXp5VxfeaB5fOPaZMtqvaTzZGmRI8co5Pb+1yhZ1Jd
	+tqS4S/sXSHnDsDIvtzzmvXuOx5xRuW4+VXNR41QorPX56/udIxvXWKZq54TC1r5
	JYZoW9xCcEKfQyyQAwd/KvNTPMcZsKIIArH5WPCoYAMp23vY3HTia10D0pKRzo20
	tsZ725bobRorlkRPbnT9Q==
X-ME-Sender: <xms:56OrZ_4r1fGeTYVnaod-wO2NzZ2NHYdVHCIZdYDdVEN3CUE3aLipBw>
    <xme:56OrZ04LaJcJB8g_4vy2jK4AcZwVH4jm5wnhLceIhsETEDChYT_p2vDhAdsalScNE
    UHLbNjYgU53zxr38K0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegudekfecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:56OrZ2c8vfiXY8n3dexb_wHcIKTMgG6o3iBcrDJCGSo83cktB116vA>
    <xmx:56OrZwKurjJ9VsGmWmqTvUmqikgs5yszNjLYSbIodcQKb37uQS1vVg>
    <xmx:56OrZzKn0eY8SDxacs2AIw8al8AHb-BF-N93qSumfcz0FNW0tdUaZQ>
    <xmx:56OrZ5y4eaI6MBsTqZJwzGJSKmez8ij-IaW_MKIlyU1hTpHti9F-SA>
    <xmx:66OrZ5ZaEgYHz5-gr-91ZnpSgt3C2jX-ZjBTONvD9HLTwxOizyBpb0N7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 6103B2220072; Tue, 11 Feb 2025 14:24:23 -0500 (EST)
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
Date: Tue, 11 Feb 2025 20:24:02 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andrey Albershteyn" <aalbersh@redhat.com>,
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
 "Alexander Viro" <viro@zeniv.linux.org.uk>,
 "Christian Brauner" <brauner@kernel.org>, "Jan Kara" <jack@suse.cz>,
 =?UTF-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>,
 =?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-api@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-xfs@vger.kernel.org
Message-Id: <f4276a02-57cd-4703-be3c-4210e4a033a9@app.fastmail.com>
In-Reply-To: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org>
References: <20250211-xattrat-syscall-v3-1-a07d15f898b2@kernel.org>
Subject: Re: [PATCH v3] fs: introduce getfsxattrat and setfsxattrat syscalls
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Feb 11, 2025, at 18:22, Andrey Albershteyn wrote:
> From: Andrey Albershteyn <aalbersh@redhat.com>
>
> Introduce getfsxattrat and setfsxattrat syscalls to manipulate inode
> extended attributes/flags. The syscalls take parent directory fd and
> path to the child together with struct fsxattr.
>
> This is an alternative to FS_IOC_FSSETXATTR ioctl with a difference
> that file don't need to be open as we can reference it with a path
> instead of fd. By having this we can manipulated inode extended
> attributes not only on regular files but also on special ones. This
> is not possible with FS_IOC_FSSETXATTR ioctl as with special files
> we can not call ioctl() directly on the filesystem inode using fd.
>
> This patch adds two new syscalls which allows userspace to get/set
> extended inode attributes on special files by using parent directory
> and a path - *at() like syscall.
>
> Also, as vfs_fileattr_set() is now will be called on special files
> too, let's forbid any other attributes except projid and nextents
> (symlink can have an extent).
>
> CC: linux-api@vger.kernel.org
> CC: linux-fsdevel@vger.kernel.org
> CC: linux-xfs@vger.kernel.org
> Signed-off-by: Andrey Albershteyn <aalbersh@redhat.com>

I checked the syscall.tbl additions and the ABI to ensure that
it follows the usual guidelines and is portable across
all architectures, this looks good. Thanks for addressing
my v1 comments:

Acked-by: Arnd Bergmann <arnd@arndb.de>

Disclaimer: I have no idea if the new syscalls are a good
idea or if they are fit for the purpose, I trust the
VFS maintainers will take care of reviewing that.

