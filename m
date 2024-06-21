Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB18911F9E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 10:57:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=H7mCTDwx;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=K4cdFx4S;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W5B7w4Kbzz30Ts
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 18:57:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=H7mCTDwx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=K4cdFx4S;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.159; helo=fhigh8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh8-smtp.messagingengine.com (fhigh8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W5B780sqvz30Ts
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 18:56:51 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.nyi.internal (Postfix) with ESMTP id 153A01140210;
	Fri, 21 Jun 2024 04:56:50 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Fri, 21 Jun 2024 04:56:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1718960210; x=1719046610; bh=LCP3GPJDV8
	F/N+nAlcGiBZYx7s7qKdEXuPIAtCYCsw8=; b=H7mCTDwxBhL6/3nl2kvwH7Z2jf
	vHvRWJWjo62xKNC7P63pFKMi0lGQH1oK9d5uLt4KZnRj6RDabX6f042YKlcBY7VL
	ZZq1IVlKZ2tgE49wrDxmbx5ZugEMclHbG+fKzej1xJSCVx2tZvZ3YPE5yAhRu1hX
	g6XV6uYI8W0AZrAHJH7GLQD/PzjDkfnuabR9xUItNv+SX/LSx1+9CeE43E1pWrsw
	H3/6KJ+q3UXf2HjYInaAx+URfx3SrV1MtmOIAqug46Iecs28LMSKwCe+Wulv7Yzh
	+lVLEByNlljBiKAtUqzaNB80GN0U3FbfHu66zSBtt4AZT/eJby+pGlrYPqRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1718960210; x=1719046610; bh=LCP3GPJDV8F/N+nAlcGiBZYx7s7q
	KdEXuPIAtCYCsw8=; b=K4cdFx4S224MYRT+r8L/r9U1j5q9lsA7B7hhlIrlPjWc
	7EDb3ZPjlybzPs2NKQgEkl/fSHKd0CDqzFXj7P3t+qGfnRRJ78YrIYGTuI3sC43Q
	6y8H6AA1V0PIijyE6xMkgGupwrnRWrZbay1fonLCHWP6Qa/M3EcTzWO0bm0ePn1Q
	O38dmf9if6C4B+mrVHd9kbUcCSEJwcWVo6jkCthFmcFHahki2cGoOM3KesCvklVz
	YT5grRrYymPqsYUACYcdY9Sp9ICM60lfM3yEmkxnIiJkr+UigAeW3QKYo6psB+j+
	ytsTijk6h1ZVtxvQRM1KQbzMrZL3rRnt47XsyTlhYw==
X-ME-Sender: <xms:UEB1Zm4izm0yfspkW7ydjajHNz_V1xCdigbmfAZFmL5oM63ee-Wyhw>
    <xme:UEB1Zv6YEV3Oe7A3j2UMK3TBnvu3IWBefk9T9nUTdlpS5WMN3RIeTZ_JYgTz2Q3Id
    Mp3CcHRYUWGMbC0aLk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrfeefgedguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:UEB1ZlewerVmgQOEvLDFfmzpJCOmUBZQGyRAmjbsdJfs6xzQkp-YFA>
    <xmx:UEB1ZjKrwsZrMN1BtdbMbDwR4OJmLJPFU-kCoOw2HcS_usyMMgHDsw>
    <xmx:UEB1ZqKUDfHnKePjmuIj68bW7G0CAsctQb5pzimSurs_Ge9Zp4ONZA>
    <xmx:UEB1ZkxxkNjEJAVWyRsEOh7wRilHzDQTxq6cEooXIRlUnDuIBwJ2SA>
    <xmx:UkB1ZqViuRkEf_iw5Waz5bDUqxF18TnrV2GO1kTJMH4GWiGo1Svimx46>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 38B95B6008D; Fri, 21 Jun 2024 04:56:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-522-ga39cca1d5-fm-20240610.002-ga39cca1d
MIME-Version: 1.0
Message-Id: <ba14c4fb-e6a7-46b3-a030-081482264a99@app.fastmail.com>
In-Reply-To:  <1537113c4396cd043a08a72bdca80cccfa2d54d9.camel@physik.fu-berlin.de>
References: <20240620162316.3674955-1-arnd@kernel.org>
 <20240620162316.3674955-8-arnd@kernel.org>
 <e80809ba-ee81-47a5-9b08-54b11f118a78@gmx.de>
 <1537113c4396cd043a08a72bdca80cccfa2d54d9.camel@physik.fu-berlin.de>
Date: Fri, 21 Jun 2024 10:56:27 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Helge Deller" <deller@gmx.de>, "Arnd Bergmann" <arnd@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/15] parisc: use generic sys_fanotify_mark implementation
Content-Type: text/plain
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, guoren <guoren@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "musl@lists.openwall.com" <musl@lists.openwall.com>, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, LTP List <ltp@lists.linux.it>, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Xi Ruoyao <libc-alpha@sourceware.org>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, linux-hexagon@vger.kernel.org, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 21, 2024, at 10:52, John Paul Adrian Glaubitz wrote:
> Hi Helge and Arnd,
>
> On Thu, 2024-06-20 at 23:21 +0200, Helge Deller wrote:
>> The patch looks good at first sight.
>> I'll pick it up in my parisc git tree and will do some testing the
>> next few days and then push forward for 6.11 when it opens....
>
> Isn't this supposed to go in as one series or can arch maintainers actually
> pick the patches for their architecture and merge them individually?
>
> If yes, I would prefer to do that for the SuperH patch as well as I usually
> prefer merging SuperH patches in my own tree.

The patches are all independent of one another, except for a couple
of context changes where multiple patches touch the same lines.

Feel free to pick up the sh patch directly, I'll just merge whatever
is left in the end. I mainly want to ensure we can get all the bugfixes
done for v6.10 so I can build my longer cleanup series on top of it
for 6.11.

   Arnd
