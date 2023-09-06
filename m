Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92FD77943F9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 21:54:22 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=B9YGq+m+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=0eyhXlcs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgtP836fsz3c5L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Sep 2023 05:54:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=B9YGq+m+;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=0eyhXlcs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgtN814LMz2yW4
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Sep 2023 05:53:27 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id A7AB858128A;
	Wed,  6 Sep 2023 15:53:23 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 06 Sep 2023 15:53:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1694030003; x=1694037203; bh=VH
	oiOAVzKFrc1qoVv7v9Mr1BrXqTyFKUxLZW2/6sh7A=; b=B9YGq+m+TaGkZYwKEv
	mwtpybd3N+c0fMrFAnCMSThlV38UxHGUZar4YL61wnZ8hebh7VNwhdEot1JcM314
	t90DsstQsCqV320qKAeQxaOy7tIjIN6MM/i7+eNgzBWjvsQZqPhhSdxBflKsD8i4
	ZRmBezwM15eJWbtMRS/w4aPfiuZYSuhzLqNmuw0oqg7NEL0rlnGLcZEyGKEzrxEN
	G08pXwkhHEmxCZCmVwpMqwrwJ4jOuXUkafTKfsioh4wptnHthM/+o0QpCzaVlAt5
	p2HsVsrVY9rdSP1XPW2+akPPpXdZ+NhnO5DN6OVHV68jOgT0d4LVctgdofyw14lg
	P1wQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1694030003; x=1694037203; bh=VHoiOAVzKFrc1
	qoVv7v9Mr1BrXqTyFKUxLZW2/6sh7A=; b=0eyhXlcs6SwaXsTsohvaVHSDkEW5t
	pf9IsSwsFxNCmJrnjsC1r2Ar4uKNxAccIwEZcHP0Glfwt7Pk+h/JnKu5+mRrT8Kq
	IhOhf9SukEJcq9eb/lSO1m3E0oyB542WZP6lVYMF9zXLOsG7pFDQA7FcQlbIGsWO
	v/7uE15f2PEQTL46VW9VAMeDZf2i5MRnBuAxMk289lztpWbEepsINFs8crl/i4pi
	cZ6D7fyA0rWRODs/fQ5p4A4vUmfV2n21gu6zI9vyGqm0BY+5Rsgd482HgncvaExW
	Sz8l5d7mijRz1HFOBAzL8e10OB5UlqpB6CLhAj7KXk+bFmgGbRpuCuFfg==
X-ME-Sender: <xms:stj4ZMFT5bUXIujyx8rG3XMkkz8xGkw5hclkerDPojseR-OAKoh2EQ>
    <xme:stj4ZFUrxldM_py_4Cti_MuQgJweGk5z0Yka0QIrf8JQxP8NlU6tdbgihMPfx7dbz
    agIOq8G_U8LGbygxoU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrudehfedgudegudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:stj4ZGIpCwrWbQMuQnRKui1vq0jlD_Hw-xaxveFWC1c7nV6BvZOFpg>
    <xmx:stj4ZOEWKrXyPg7eu5ukVGzSe0cetY7fwF7mwZBQdjSY6eR8XT8jvQ>
    <xmx:stj4ZCWoKWWomrXTKgZTmEmwM7RaOCq6OifEZR2NKWwutIUZbzo0SQ>
    <xmx:s9j4ZLONDqSf7o5Z4aSE1onERACQAtFksbMuJmduHrqscQGtXIS0jA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AE25DB60089; Wed,  6 Sep 2023 15:53:22 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-711-g440737448e-fm-20230828.001-g44073744
Mime-Version: 1.0
Message-Id: <8865aa0a-ec40-41ca-a77e-9172cec49f07@app.fastmail.com>
In-Reply-To: <20230906144801.25297-3-tzimmermann@suse.de>
References: <20230906144801.25297-1-tzimmermann@suse.de>
 <20230906144801.25297-3-tzimmermann@suse.de>
Date: Wed, 06 Sep 2023 15:53:02 -0400
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Helge Deller" <deller@gmx.de>
Subject: Re: [PATCH v2 2/5] fbdev: Replace fb_pgprotect() with fb_pgprot_device()
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-fbdev@vger.kernel.org, linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org, sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 6, 2023, at 10:35, Thomas Zimmermann wrote:
> Rename the fbdev mmap helper fb_pgprotect() to fb_pgprot_device().
> The helper sets VMA page-access flags for framebuffers in device I/O
> memory. The new name follows pgprot_device(), which does the same for
> arbitrary devices.
>
> Also clean up the helper's parameters and return value. Instead of
> the VMA instance, pass the individial parameters separately: existing
> page-access flags, the VMAs start and end addresses and the offset
> in the underlying device memory rsp file. Return the new page-access
> flags. These changes align fb_pgprot_device() closer with pgprot_device.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>

This makes sense as a cleanup, but I'm not sure the new naming is helpful.

The 'pgprot_device' permissions are based on Arm's memory attributes,
which have slightly different behavior for "device", "uncached" and
"writecombine" mappings. I think simply calling this one pgprot_fb()
or fb_pgprot() would be less confusing, since depending on the architecture
it appears to give either uncached or writecombine mappings but not
"device" on the architectures where this is different.

      Arnd
