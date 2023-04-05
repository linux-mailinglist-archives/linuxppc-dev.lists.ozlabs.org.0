Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C58C06D82B9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 17:54:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ps8MM4wnlz3fBL
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 01:54:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=YAuUXEBH;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=X0YUdqlM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=YAuUXEBH;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=X0YUdqlM;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ps8LQ4CQmz3cML
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 01:53:33 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.west.internal (Postfix) with ESMTP id 958B632007CF;
	Wed,  5 Apr 2023 11:53:25 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 05 Apr 2023 11:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680710005; x=1680796405; bh=Nw
	bB+EHW5S+V11givdbxuIy2Uf+thntoCfTqZWxMcBg=; b=YAuUXEBHlJ+kw9Zmtu
	9I5T+IGhxkBqddi19dn4r+kNWXx/0s7MbpimtmFPL+aPlqdAyBvCvEsdsYUd5tTf
	dBua9XG68Yl0nAEEaOyNWPgbGp6alKd9HHDJSvPFHUNlT8zuWj1g9huygqraxlWC
	Y+7aQ0Y5o6JpEn9vn6pvB592FVfSJZTE0wQ53CHjaAn3N3A83rdRSbIzi5UNwgov
	IcI7SaTPzh0bHkde+aJv1IK0dSQpj45he+L1xtfkD90bXKLSnl9xy0H9KtD29GkI
	2+G9FZEVKV8Ap9yXYVustJlay4HAIUJFWpO3k3GqLJgcjagxLjHlqMCd0ESl4Zi8
	VyAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680710005; x=1680796405; bh=NwbB+EHW5S+V1
	1givdbxuIy2Uf+thntoCfTqZWxMcBg=; b=X0YUdqlMVBOCdYHJ8fMsj7rw5LYNz
	ZGJ0nWIBBIL3CKMDRVVw2YGPAAiFOVnx7L1394T+EXUfeUzEKvYMxNmF0dJpg65D
	qT9JFnQfBWcM5VGeF55Js0uJ5ogNkDIdRPUREUIHT1EtxI8FePekTl0V4NAuAe5Y
	qNymd5gN9jUrHF8b/D8IDIAoOBs1X79EO2v/otVPN+ytEPy8eYxvMw6YOZAONkMt
	5RApka5ld90qALBZBcg+sniYxlayLf3ViaDFB298sG58vLKWLb118o2FnrdR0eT0
	dNfDQuIkc53XS6ntd6jHdr0SIi5xBB7v6AC/Ua1W+XfuOjYh6m52RqtGw==
X-ME-Sender: <xms:dJktZBPFWqBnr6mfzO8DOWuR7c2ENV4acvVeClXUTDoQiGEtbLwiIg>
    <xme:dJktZD8XL0MU9X_rpIxSZPrpwdJrQZi4UNvkvOPT8n1qmRwJJhnzaxlhv6m8EtCUs
    E1IXfLm605CI-wMb7E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgleehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:dJktZATYY_Gq6fxyBxmSUcz4MrTxtMytmGT595pv1iPmDASW8AykXw>
    <xmx:dJktZNv9KVxTxhp3cBNuP4GxEpbXZJqZRlFfZTzbjmsLL8Lq-zBh9Q>
    <xmx:dJktZJecGyTQlt79mmyr2IRJEdz3IZbauZ6UTCmdguaRSG1KRzZvdQ>
    <xmx:dZktZMB0Nzly1u5fZB3wNDYr-LgmhzIWAQJpCsBbi2IUq8MXyn4L5g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C4968B60098; Wed,  5 Apr 2023 11:53:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <92fe3838-41f0-4e27-8467-161553ff724f@app.fastmail.com>
In-Reply-To: <20230405150554.30540-2-tzimmermann@suse.de>
References: <20230405150554.30540-1-tzimmermann@suse.de>
 <20230405150554.30540-2-tzimmermann@suse.de>
Date: Wed, 05 Apr 2023 17:53:03 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Daniel Vetter" <daniel.vetter@ffwll.ch>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 01/18] fbdev: Prepare generic architecture helpers
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 5, 2023, at 17:05, Thomas Zimmermann wrote:
> Generic implementations of fb_pgprotect() and fb_is_primary_device()
> have been in the source code for a long time. Prepare the header file
> to make use of them.
>
> Improve the code by using an inline function for fb_pgprotect() and
> by removing include statements.
>
> Symbols are protected by preprocessor guards. Architectures that
> provide a symbol need to define a preprocessor token of the same
> name and value. Otherwise the header file will provide a generic
> implementation. This pattern has been taken from <asm/io.h>.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

Moving this into generic code is good, but I'm not sure
about the default for fb_pgprotect():

> +
> +#ifndef fb_pgprotect
> +#define fb_pgprotect fb_pgprotect
> +static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
> +				unsigned long off)
> +{ }
> +#endif

I think most architectures will want the version we have on
arc, arm, arm64, loongarch, and sh already:

static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
                                unsigned long off)
{
       vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
}

so I'd suggest making that version the default, and treating the
empty ones (m68knommu, sparc32) as architecture specific
workarounds.

I see that sparc64 and parisc use pgprot_uncached here, but as
they don't define a custom pgprot_writecombine, this ends up being
the same, and they can use the above definition as well.

mips defines pgprot_writecombine but uses pgprot_noncached
in fb_pgprotect(), which is probably a mistake and should have
been updated as part of commit 4b050ba7a66c ("MIPS: pgtable.h:
Implement the pgprot_writecombine function for MIPS").

    Arnd
