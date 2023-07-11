Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D729874F527
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 18:27:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=gP63zABR;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=m1UezYn4;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0mVx5PmHz3cW0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jul 2023 02:27:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=gP63zABR;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=m1UezYn4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0mTx137Fz2xgt
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jul 2023 02:26:44 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 84EC758017C;
	Tue, 11 Jul 2023 12:26:40 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Tue, 11 Jul 2023 12:26:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1689092800; x=1689100000; bh=W5
	R3dRJEuDedU4mfmE2aIPLz0te1yZv4ob1QkUmzMKM=; b=gP63zABRkc0l4ZDRzA
	IcIlubpQx10krBxfi6pSfXeZPbUBJIuA+RSw0J6LLqQ+2BJKh5G/7DRrk5pXnrdx
	U24FbW5DD/zOqQzMB8CBVZA2kbn+RVRF2Ghncu6DcB/0+3xZfCM2T4ywgpza7I3+
	yAh05maGr6dkYVBnLow0XIE0FgZBQpVGCgT0T0QncwjOLaL9Oo/e+E5GHZVzPFH1
	h7ULRPg+yuOEbXndaLZsHHEwYs6WCSXcD8zn3sxf3CZgxcWkqsrD7Zi9tNkSO/ue
	VP2bgk2R9uCJHeQ+YiRTRj7zHMiib1NX20grN65M+eUZDoW7jczNd8ffT8+c8xw7
	aY5g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1689092800; x=1689100000; bh=W5R3dRJEuDedU
	4mfmE2aIPLz0te1yZv4ob1QkUmzMKM=; b=m1UezYn4Zaq5khPovqjd8NiiXmvLm
	0w9sms25pOrqRNO8M57L+8g0MRTbtp7OR2ei95a1m7lMkyiyDNoalIfc7TfoQY+5
	bKH9VTWCvc4bmPEjubZEW8asIYrDMpk/DxAAwG4CN3Pxx7GenUUO3U4+7kL7apxS
	QuXgezcdLRNUtjTqb5d7/IW1b4V+S4tpu6XVOSlkip5tg5XHk5RPrFf2Wc+1lX9i
	MOWpFLR5qNJz4Inrq4cBaccsRwogrp15/y82ysT8TnBqtzi0q3SFfVoMW31B/aT6
	ukQWwwWm+0aafmJpWePUj7GlIkNRTZkijalxzd8rrdWmrJ3CCpB5t3CKQ==
X-ME-Sender: <xms:vYKtZE69711ZzrX1UfDAH_wKoV8StTKa7ojHt5ftztcoR9k9-OGNdg>
    <xme:vYKtZF7KBdORSzhM4wNvO2XDDmElD90TlyzRX4_570VbiMw-c3clqgQP0TtQxeTfY
    CotuIX7qGul8wElt5Y>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfedtgddutddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:vYKtZDf2TxeMAGBfVkoV3uAZUtvHIYPcVxEfb6Qcl0msm4N_19_3Tw>
    <xmx:vYKtZJKr2LWiBxmL9EcO6DcfFSNv43PdZKjfBvnGIO_aJ8RJOMJmzA>
    <xmx:vYKtZIL9QRrfHKZLVkXaIn76A4_BYMk3sVMAvOaTg-eQl07FtWdz2Q>
    <xmx:wIKtZOTn3w0yspPsZlSmTu8WcSU0C03X-RbItER0PdanY6sWL9EObg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CE2AA1700090; Tue, 11 Jul 2023 12:26:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <8d8cef73-1733-4e0b-bede-034895a820bd@app.fastmail.com>
In-Reply-To:  <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
References: <cover.1689074739.git.legion@kernel.org>
 <cover.1689092120.git.legion@kernel.org>
 <a677d521f048e4ca439e7080a5328f21eb8e960e.1689092120.git.legion@kernel.org>
Date: Tue, 11 Jul 2023 18:26:17 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexey Gladkov" <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 "Alexander Viro" <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v4 3/5] arch: Register fchmodat2, usually as syscall 452
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Palmer Dabbelt <palmer@sifive.com>, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, David Howells <dhowells@redhat.com>, Kim Phillips <kim.phillips@arm.com>, Paul Mackerras <paulus@samba.org>, Deepa Dinamani <deepa.kernel@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, hare@suse.com, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Catalin Marinas <catalin.marinas@arm.com>, jhogan@kernel.org, Matt Turner <mattst88@gmail.com>, Florian Weimer <fweimer@redhat.com>, gor@linux.ibm.com, glebfm@altlinux.org, tycho@t
 ycho.ws, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, christian@brauner.io, Jens Axboe <axboe@kernel.dk>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, Peter Zijlstra <peterz@infradead.org>, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023, at 18:16, Alexey Gladkov wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> This registers the new fchmodat2 syscall in most places as nuber 452,
> with alpha being the exception where it's 562.  I found all these sites
> by grepping for fspick, which I assume has found me everything.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Signed-off-by: Alexey Gladkov <legion@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>
