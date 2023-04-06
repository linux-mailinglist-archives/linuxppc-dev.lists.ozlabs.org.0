Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BDC56D9B1A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 16:50:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pskv51fXqz3g7V
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Apr 2023 00:50:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=EWWMukw3;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rUv6i+tW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.17; helo=wnew3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=EWWMukw3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=rUv6i+tW;
	dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pskm56ldvz3gBZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Apr 2023 00:44:21 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.west.internal (Postfix) with ESMTP id 888492B06973;
	Thu,  6 Apr 2023 10:44:17 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 06 Apr 2023 10:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680792257; x=1680799457; bh=Va
	G4DIeiqknCp5VUw5TWbqr8Q6Xy/qs0760D+gB2/CE=; b=EWWMukw3BXb4Q/h2C/
	YS7dzTsU0Ar5/xROCa1/7bm3aePP1XNH9H2e8o71Ztok9LPbZQQCzO/hHG6ZPM1p
	GoCeoL832i+xKeNkS0KXU8c0WXOWNUN02App/G+QHK5CjSeDsvT54IC+UKLq5y0W
	7Bj0u+pXCcYRPzXBsUqe5DlmO1VzXH5ZTLEgPjdccmXA/6z2kb2GzEFUrIuyZoJL
	JE205jnLgaiETXL15uw4jCFU3tP+QRZn/8HvPxiftfXcO7a3UgEoiBimB5zsyODA
	rh1xpm67rsR3MA5GCAtJVR1sPuC6xq0Wqfo86Rjl+6m1rQKEicJ8/hOQkK2gfgKs
	SXRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680792257; x=1680799457; bh=VaG4DIeiqknCp
	5VUw5TWbqr8Q6Xy/qs0760D+gB2/CE=; b=rUv6i+tWNj90SnYvslS0D9SQvYEia
	hbth2DWbO6XoNOCPL0tQo0K5pGEzOxLlpTdzm9k/1tZklpQW57yikfYIpTuH0Oen
	FpzdiO+ssCVt7O1z6Q5P4IqYIp15PFvYkqBOqnKQnnSdL+YWBrv3O/8kPg6TB3Ty
	nP4AQs+RY8jkA8BD2EQMS9JAiQfaha8PDirIUX5DMjBpFPvO43av/mIe+ypzD/Mq
	rQI6lRY09fj7bETJ5kpUkImmWeeGn82AK+9+PegtKb4qJiuKwD1VSSkpLgKQq5Je
	QuhTYv5sbksq2vqZt7Ajex2obQmTZjZX/Zb5y96hPatPiMCd+y2OEMZZg==
X-ME-Sender: <xms:wNouZNHPa0TYmwB2r--5RtnOLRPAja0qtAEYACVjkTGVAgZvDkZu9w>
    <xme:wNouZCVePxlYaemLqrpfpWGxVOOM4y1dgc5cEsXgXvS0KUHqiJTJHrD2ayxERgDtu
    LARQW9FlguB3_hH47w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejfedgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:wdouZPKrDIYPd5_lNpIWwD1dm3PopYDH_mzSp_r4l6k3ItjXO9cK3g>
    <xmx:wdouZDEO3BmqQX8s9GpXZv_fvUkhsmGasqLZB0SmcMu_589oaCj0Kg>
    <xmx:wdouZDXV4YbtggYa_LRgP3NzenKzP1-bmca0EJqhagkOthPGPz6iNg>
    <xmx:wdouZKMF_xP1FnBqI73ZlUYXbIcQL6US9hEkrDdfk3w-HL8Jt1308E982bM>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id E83EBB60093; Thu,  6 Apr 2023 10:44:16 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <27c1210f-4e40-4bbc-905b-155427465e00@app.fastmail.com>
In-Reply-To: <20230406143019.6709-3-tzimmermann@suse.de>
References: <20230406143019.6709-1-tzimmermann@suse.de>
 <20230406143019.6709-3-tzimmermann@suse.de>
Date: Thu, 06 Apr 2023 16:43:56 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Daniel Vetter" <daniel.vetter@ffwll.ch>, "Helge Deller" <deller@gmx.de>,
 "Javier Martinez Canillas" <javierm@redhat.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v2 02/19] arch/arc: Implement <asm/fb.h> with generic helpers
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mips@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, Vineet Gupta <vgupta@kernel.org>, sparclinux@vger.kernel.org, linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 6, 2023, at 16:30, Thomas Zimmermann wrote:
> +
>  static inline void fb_pgprotect(struct file *file, struct vm_area_struct *vma,
>  				unsigned long off)
>  {
>  	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
>  }
> +#define fb_pgprotect fb_pgprotect

I still feel that for architectures like arc that don't have
pgprot_writecombine(), it would b best to go with the
generic implementation that currently behaves the exact
same way. If pgprot_writecombine() gets added in the future,
it would cause the architecture to behave as expected rather
than introducing the same bug that mips has.

      Arnd
