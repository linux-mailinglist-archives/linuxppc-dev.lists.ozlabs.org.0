Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8266E439B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 11:23:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0M755L70z3ccg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 19:23:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=hoxslnOK;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MR4yxKuz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.27; helo=wnew2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=hoxslnOK;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=MR4yxKuz;
	dkim-atps=neutral
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com [64.147.123.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0M673mMzz3cLh
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Apr 2023 19:22:54 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id DD2C02B066BA;
	Mon, 17 Apr 2023 05:22:47 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 17 Apr 2023 05:22:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1681723367; x=1681730567; bh=peYP/lOIqmvTTJ2GJZFK05PdIeVxfQrMTMT
	dWlxN2bY=; b=hoxslnOKq5L0fgq1KZ5uwFxkfCsDUbQoEitttD9Gb157/4VvDaL
	fzRTYgwNrKhMTGBEWYk5kV4pCoKxj3IQV0FpUtGeddLg5GfVlMhZex8QF6mhL8p9
	gvwX4MSUzxesv1YcnaqKaa4Hf8aEonHOEB+LqYDIenoy4k9B5AvOOz7WXYv6rPww
	vauHxzq0EC93J9INj8HpYFP0uokUJZlvJ0DGwXpWQ8LUcqRJMmLECR08O/Gg7C4C
	FExoluX3ejusbKwfN3AFnDxBNc0Jh1L5n5E2k8MJ529jR2BSvuckTFMjwePw4/jA
	IVxKZIBctylYcZmrJ3YTpI6yusKyhHnhjmw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1681723367; x=1681730567; bh=peYP/lOIqmvTTJ2GJZFK05PdIeVxfQrMTMT
	dWlxN2bY=; b=MR4yxKuz3/tjr23pAzsFitwD0Txq7SZ+LasC5Fyh1rdL9W+5uLQ
	QWuTkcsnaN+XbFlYxewK49c7zL/ltjC0cAxyGzvY+pAqila9tzloSXls1fSGTLU8
	83j+ql9LP2Am/jKxSL+2eFTD9s2a+pAHNF1s4l+85O8VFC4gAEQAX/IiexVaT7mA
	1njCOrvD++JH4RDb7rqDNfo30GjQVpEJWnie2UNVdXN3+HoTO7VAHqni1UoK4zJb
	K0nmV8AH3mMhRqTjxdJcDOoA4dxU/4N4+juQYM/HVijErDhMcN+7kkXCY9vJtEKX
	A6hZ5WwaK7trmU2l173N30Rm9x+GYS13Hyg==
X-ME-Sender: <xms:5g89ZGh1XGEKu3GOwuyxUAI_aRj0-gXb1yU9cH41yOyGtrZXXEBRxw>
    <xme:5g89ZHCJrzk8kcvbfI9uoi9xOXxIpgIcnUMY2tPn_xA8atud9UMgflJi8xJj_xxVr
    3CIR7jk9VrljLNWmYA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeliedguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:5g89ZOF82A9szmMdiIKfUdndIY5Y_J2WWepzSI164UFVULZ600rDfg>
    <xmx:5g89ZPS9rsGZ3-6dQW4K4hejhxqnpa-f-mX9DnhlkCPRmeMFlap6YA>
    <xmx:5g89ZDzdQ2ec3Pn4h3UEvgarbJnSwOf3ZSGbcWd6YhZnAMBHYJ805Q>
    <xmx:5w89ZEqvqQ-8qIHbFuXLaLZUzpDWtqOdQ0aVq4skLKD0cgTZu8vkwIppGeY>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2AD08B60086; Mon, 17 Apr 2023 05:22:46 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <55abd7af-acb8-47ce-89db-1722bcf0cb9c@app.fastmail.com>
In-Reply-To: <2b4f75b8-aa83-8e41-7c99-7c8d573c0f31@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
 <20230406143019.6709-2-tzimmermann@suse.de>
 <CAMuHMdUfViWzPbB+GcGUwxmGNxAohfq71Jed3DzS=Cb+gBzotg@mail.gmail.com>
 <2b4f75b8-aa83-8e41-7c99-7c8d573c0f31@suse.de>
Date: Mon, 17 Apr 2023 11:22:24 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>
Subject: Re: [PATCH v2 01/19] fbdev: Prepare generic architecture helpers
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>, Helge Deller <deller@gmx.de>, linux-mips@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 17, 2023, at 11:03, Thomas Zimmermann wrote:
> Am 11.04.23 um 10:08 schrieb Geert Uytterhoeven:
>> On Thu, Apr 6, 2023 at 4:30=E2=80=AFPM Thomas Zimmermann <tzimmermann=
@suse.de> wrote:

>>> +#ifndef fb_pgprotect
>>> +#define fb_pgprotect fb_pgprotect
>>> +static inline void fb_pgprotect(struct file *file, struct vm_area_s=
truct *vma,
>>> +                               unsigned long off)
>>=20
>> Does this affect any noMMU platforms that relied on fb_pgprotect()
>> doing nothing before?
>> Perhaps the body below should be protected by "#ifdef CONFIG_MMU"?
>
> I cannot conclusively answer this question, but I did some grep'ing=20
> ('git grep ndef | grep CONFIG_MMU'):
>
> Only the architectures in this patchset provide <asm/fb.h> but nothing=20
> anywhere uses <asm-generic/fb.h> yet. And of those architectures, only=20
> arm and m68k have !CONFIG_MMU cases. Those are handled in the rsp=20
> patches. I think we're good.

Agreed. The generic version is just a more elaborate way to do
nothing here, as the=20

     vma->vm_page_prot =3D pgprot_writecombine(vma->vm_page_prot);

line on nommu just turns into a self-assignment of the same member
that was set the line before.

     Arnd
