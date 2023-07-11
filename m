Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF0474ED7A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 14:01:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=H7uwXwbt;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Rgq5drIf;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0fbf5Fjrz3cWc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 22:01:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=H7uwXwbt;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Rgq5drIf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0dyh2P7fz30fg
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 21:32:44 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 6110358017D;
	Tue, 11 Jul 2023 07:32:42 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute6.internal (MEProxy); Tue, 11 Jul 2023 07:32:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1689075162; x=1689082362; bh=3i
	BxzwnTyVw6BqHPrJ35gyKi0bdZzNDDY557YK2M5BM=; b=H7uwXwbtdwfCUWjYfS
	zgTdjbt8fxtM5Pb28mR/huI06k1IvvPqw4hdyam/o9wLh6jdLvizXH5ZQxklDpSV
	FBR2nNAQdmcHSZmXLilQ9dcc6MuP3QWa8oB2IhW2o0P/DWdab3W70i6347xG0h8N
	L7iXKiaN5/ayKK7HkXD90lrisKPfb46y0IIKdN4pkE/IkTRyrHAgHFf0UgPbG+No
	enZExOWKk8KjvsmumQVRnQv7eggmyBcDymYqVw4PDAzDnxiOTbSSyLG9uRtsufBG
	wLG3GytQY6cvibjCwWOGIAOYCMwXlgvdo+o+i9J/TpuZALMMrixBgXGq9xKpWA/v
	4CGw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1689075162; x=1689082362; bh=3iBxzwnTyVw6B
	qHPrJ35gyKi0bdZzNDDY557YK2M5BM=; b=Rgq5drIfuHuuZkUneRD+VI6DElB7d
	5n/AuoZd0ePjCCw2n2Gnd/geE/5jAyST+jy/QxZJVAF9bfxcCVfUo4x6eZ8VDRjw
	WQ2RD1Ad9q+d19mlEaDWr1aV2szbzILkOvodcUv/xlBn8EQn96wWT6oebDSpAjUM
	czKfx7Y/MyPCanFFnz5sOS+du/U+vwEV9QFVhiowRVvy2pjfdMITy8sh8EeXj0ce
	tcWEVfbHpLavonVLK50zLhuA3pmQx2/pce1QGcB3y6wyrO3DZI5vLaIcy5Oj+7Vr
	oruNupTS5F21XAIYtWr9RnHP+bOqXM2IvqLTXBNtTRTiduCYohpTsuXYA==
X-ME-Sender: <xms:2T2tZKYOMygNw6Aj89mQQ1ghTQ6-yQsd8o7r85aG-9-rzIQIlJQIlQ>
    <xme:2T2tZNZ85LnFoVTTu3wLlUCJ6rMAYupG_5XgADucFfawjtPnfjdALr66wheaO1Jox
    ytE7iH3Dvkl3hyUDLA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrfedtgdegudcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedvnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:2T2tZE_DGQ-Q7oe2w7tNuApK4x90Riy4y-owH55cM_dj9YQ402zfnQ>
    <xmx:2T2tZMqOKGeFvcDOqawVN_0M-9RzE1Ikidfr910Z6V2KN8I8DYa34g>
    <xmx:2T2tZFoMCmfr4xdPRGYd1uVu9ZIfzyoNqiT7ixVXkk0SOqXtXPK0mg>
    <xmx:2j2tZFzb8-OhR9fhPlZym1UMLqdjr9HKK5MmjOcHUjEyzVOjoVGZJA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7023E1700090; Tue, 11 Jul 2023 07:32:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-531-gfdfa13a06d-fm-20230703.001-gfdfa13a0
Mime-Version: 1.0
Message-Id: <0c59140d-e58d-4fb6-a94c-f829bb802db3@app.fastmail.com>
In-Reply-To:  <3098381cf93a5010e878319c6218d2c5851746c0.1689074739.git.legion@kernel.org>
References: <87o8pscpny.fsf@oldenburg2.str.redhat.com>
 <cover.1689074739.git.legion@kernel.org>
 <3098381cf93a5010e878319c6218d2c5851746c0.1689074739.git.legion@kernel.org>
Date: Tue, 11 Jul 2023 13:32:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexey Gladkov" <legion@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 "Alexander Viro" <viro@zeniv.linux.org.uk>
Subject: Re: [PATCH v3 1/5] Non-functional cleanup of a "__user * filename"
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 11 Jul 2023 21:56:57 +1000
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, fenghua.yu@intel.com, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Palmer Dabbelt <palmer@sifive.com>, heiko.carstens@de.ibm.com, x86@kernel.org, stefan@agner.ch, ldv@altlinux.org, David Howells <dhowells@redhat.com>, Kim Phillips <kim.phillips@arm.com>, Paul Mackerras <paulus@samba.org>, Deepa Dinamani <deepa.kernel@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, hare@suse.com, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-arm-kernel@lists.infradead.org, Catalin Marinas <catalin.marinas@arm.com>, jhogan@kernel.org, firoz.khan@linaro.org, Matt Turner <mattst88@gmail.co
 m>, Florian Weimer <fweimer@redhat.com>, gor@linux.ibm.com, Peter Zijlstra <peterz@infradead.org>, glebfm@altlinux.org, tycho@tycho.ws, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-m68k@lists.linux-m68k.org, Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, christian@brauner.io, rth@twiddle.net, Jens Axboe <axboe@kernel.dk>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, ralf@linux-mips.org, paul.burton@mips.com, linux-alpha@vger.kernel.org, schwidefsky@de.ibm.com, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 11, 2023, at 13:25, Alexey Gladkov wrote:
> From: Palmer Dabbelt <palmer@sifive.com>
>
> The next patch defines a very similar interface, which I copied from
> this definition.  Since I'm touching it anyway I don't see any reason
> not to just go fix this one up.
>
> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
