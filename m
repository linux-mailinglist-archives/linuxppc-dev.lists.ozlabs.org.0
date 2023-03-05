Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC4A6AB207
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 21:11:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVCXs4KsDz3cH9
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 07:11:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=M+iX57D3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=CYjynxi2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.29; helo=out5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=M+iX57D3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=CYjynxi2;
	dkim-atps=neutral
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVCWm29x9z3c4B
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 07:10:58 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 456115C00E6;
	Sun,  5 Mar 2023 15:10:53 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sun, 05 Mar 2023 15:10:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1678047053; x=1678133453; bh=cjW13UmZQsjwyJDeHx5kIcthGLujwjX/c4O
	TYrUnVEo=; b=M+iX57D3tki6mdnYuiW2+/TVDcTnCB2Ga/GIjvvg25JyIDtZhzU
	mLkYC+yAY4SFZTnNttwjLlO8DD8yCYVw2kqWR6oHe88HECHGwU2I7Axt7fx139oN
	etVdN33n4Awn9hGCJAMtMjqHAQtx2VRikVcaIkNPJ7OSOLVm6//NltGUsHzgIj37
	6Q3ejPZj5Yi2cHI9b414CB+2Y/WNWnifgSj0Gzxyz7KQ4KCQRarWS5CulHYbi5eC
	ag9J4dSS2qmKbTaLa9/5xYv+fAFL3Yxj7jbc/4GSpKvlOtsPrPUdGxBgQX6SJ5Z/
	5TNCZ2yUU9mfrFdl1+bt1hfGmpR+ALzk/+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
	1678047053; x=1678133453; bh=cjW13UmZQsjwyJDeHx5kIcthGLujwjX/c4O
	TYrUnVEo=; b=CYjynxi2XdbvcwdySeuJXuc1PmUeES5qN5N0+ACWBaHPfzz2mdY
	KOtHjXR5RghXHpnlzSUA3NKQ8HzaPRpU50fjVFpJJj2Vy6sGAfy9/jRTA0VzqhBk
	8GsAumW0PCYRukJgw9SVPtwhkxwpu7ePss7hnK46F7qIf9wvuoF9/IIYqYHLSQ6S
	WYeQ8pkNDtW0oDCAUXUKxKH9ooj8BOTq4NG7N1mHccROcNqGiApuSD4gGmN67hlg
	/JkwqqShEOb8mieY78lGMfW+Gz28CVp4X2Co4shGbu4N41Qb30SR08YRmY/mYRXg
	wfIYMYkcUjgcGZeIAy669di3WjfqzK4B1xQ==
X-ME-Sender: <xms:TPcEZBo-q52j-jqchY2XGMpcTPYR06yXpKAxCmCfSK69n_WJZvxBew>
    <xme:TPcEZDrpog9WoSHrCoXbSnoa2mLg-BTyPhTgGzmB-0qEgXBt4T7_tYyFgcQXJBgjV
    lAj5AsSTwmqOpGlKmY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvddtgedgudefgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgfekueelgeeigefhudduledtkeefffejueelheelfedutedttdfgveeu
    feefieegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:TPcEZOPBv0ou0224OqiUylR9QEbHsuuPAEnRPF5o8Yfvrtw8YAv_tg>
    <xmx:TPcEZM7r_vfyT0vMjnpfebYe8dIUVygFUa3KtMBPW88bfxP-LizgeA>
    <xmx:TPcEZA4_keGj9AgoFlOut-Hu30B0X1Jw1pHtsEd1RMfb_pDQw2T6KA>
    <xmx:TfcEZLJhlAB4TepxklBPOSFU5nuw9mrTxiy269e0J3uc6tV0KxUo8A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 15985B60086; Sun,  5 Mar 2023 15:10:51 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-183-gbf7d00f500-fm-20230220.001-gbf7d00f5
Mime-Version: 1.0
Message-Id: <5dec69d0-0bc9-4f6c-8d0d-ee5422783100@app.fastmail.com>
In-Reply-To:  <CAMuHMdXoM24uAZGcjBtscNMOSY_+4u08PEOR7gOfCH7jvCceDg@mail.gmail.com>
References: <20230303102817.212148-1-bhe@redhat.com>
 <20230303102817.212148-3-bhe@redhat.com> <87sfej1rie.fsf@mpe.ellerman.id.au>
 <CAMuHMdXoM24uAZGcjBtscNMOSY_+4u08PEOR7gOfCH7jvCceDg@mail.gmail.com>
Date: Sun, 05 Mar 2023 21:10:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michael Ellerman" <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 2/2] arch/*/io.h: remove ioremap_uc in some architectures
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-parisc@vger.kernel.org, Baoquan He <bhe@redhat.com>, linux-sh@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, linux-m68k@lists.linux-m68k.org, Luis Chamberlain <mcgrof@kernel.org>, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 5, 2023, at 10:29, Geert Uytterhoeven wrote:
>
> On Sun, Mar 5, 2023 at 10:23=E2=80=AFAM Michael Ellerman <mpe@ellerman=
.id.au> wrote:
>> Maybe that exact code path is only reachable on x86/ia64? But if so
>> please explain why.
>>
>> Otherwise it looks like this series could break that driver on powerpc
>> at least.
>
> Indeed.

When I last looked into this, I sent a patch to use ioremap()
on non-x86:

https://lore.kernel.org/all/20191111192258.2234502-1-arnd@arndb.de/

    Arnd
