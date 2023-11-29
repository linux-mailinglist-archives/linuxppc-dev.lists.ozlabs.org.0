Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD5D7FD809
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 14:27:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=vKBW0r96;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xAansMvw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SgKqY0rwkz3dBq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 00:27:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=vKBW0r96;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=xAansMvw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SgKpZ2tDwz2xQG
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 00:26:13 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id AF3245C021F;
	Wed, 29 Nov 2023 08:26:09 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 29 Nov 2023 08:26:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1701264369; x=1701350769; bh=En
	NHMzNNhXXe+ZGCbFAIkLtQY3cIn4dBzLKtatweIgU=; b=vKBW0r96FdMc4AIn8k
	jENExr517J9gMNxiC4jw/k9cxb1tvxP+Au0eYGBY5jVU6w06heSSuuqp72pu7hrF
	3rsDT7EvqIu6/nUgE0VDxBk4tvuFCdQI2TRxqWsJ8YQBSYpGyCdPEpX5ZBa+idQe
	lxuuqG+YZkMFNF1/cJ1vlvF6AHVGNPe25VzGs6mf+O89A0XFy3wC4GIGShBBLqDe
	wVOJndc8VjmEF/47Oh70baGcIF+OYEyHQAALXL5x8A+w80a9G1bdOuv7A+Nkvaz2
	sJ9BhBwXpVnB5nUWvOxr+7CDQ+73j8PWixgKHYwopfFCJHPHqo9fLXd4o/yxE+8r
	fsAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1701264369; x=1701350769; bh=EnNHMzNNhXXe+
	ZGCbFAIkLtQY3cIn4dBzLKtatweIgU=; b=xAansMvwXxjVvbWaFR0NmeWUBYvJp
	I22avyC2oqh7vQDu9uHsrTH+9k+J1wOPvAAnDkwdWFVicvbMYwGy5Hl7GH5Qr90q
	dPnE2BoEGICQJpasP91CFJx/+P2qjPkQZQtpCIWbQeF09eQ02hYvZpljPutcqckR
	RLYi98OroE+g83kOpb+3Y6J7lchhy3pns39ddnHXInzm8QLyqBpP5thEw0fPs9He
	34lfcmXM0biCtsexT27q1MVhbJf9xg2vKw02s0D4CCGyq/VHb4jS9mGXBlUDO1lQ
	Lthm1czAm/fJ7HQV0pSwyzl44uC5yZVhOgN2gNqjJ6t5dsxV2thKz9ISw==
X-ME-Sender: <xms:8TtnZRqeOEWiWdlc8ZRQtfPdt8nDIKBP9Qq8d9JIgFDXtzpFXHfjPQ>
    <xme:8TtnZTrJFOu12VCfSprM9_5HbimYrIL5LMrDac1FPVTYMisT1HMORgFFZ9SaAZlhR
    4-uJwBFkBJhpmX-q7g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrudeihedghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
    ertderredtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegr
    rhhnuggsrdguvgeqnecuggftrfgrthhtvghrnhepffegffdutddvhefffeeltefhjeejge
    dvleffjeeigeeuteelvdettddulefgudfgnecuvehluhhsthgvrhfuihiivgeptdenucfr
    rghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:8TtnZeMhfIlUFCcVE5zMIAhZsVxID321UdCuPRsBKnnPVktuHoreyw>
    <xmx:8TtnZc7Lc2zdSH02m5c77aws-fHuyaTYX2ZTy5nMDkm_jjwNl-i6cQ>
    <xmx:8TtnZQ6flPj4517uogu2klNxkpHjYPO1kkTMxKEpUEBjl6ZCT4MLZw>
    <xmx:8TtnZVUpz8HBYnk_eiCNW2oc3URrjAmgdmkZBNeoN7gmzHaXMIuM2g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 5E049B6008D; Wed, 29 Nov 2023 08:26:09 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1234-gac66594aae-fm-20231122.001-gac66594a
MIME-Version: 1.0
Message-Id: <f85d34dc-e310-4766-9161-deae7acb340e@app.fastmail.com>
In-Reply-To: <20231129131919.2528517-5-mpe@ellerman.id.au>
References: <20231129131919.2528517-1-mpe@ellerman.id.au>
 <20231129131919.2528517-5-mpe@ellerman.id.au>
Date: Wed, 29 Nov 2023 14:25:49 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 5/5] powerpc/64s: Fix CONFIG_NUMA=n build
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 29, 2023, at 14:19, Michael Ellerman wrote:
> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
> index 7f9ff0640124..72341b9fb552 100644
> --- a/arch/powerpc/mm/mmu_decl.h
> +++ b/arch/powerpc/mm/mmu_decl.h
> +
> +#ifdef CONFIG_MEMORY_HOTPLUG
> +int create_section_mapping(unsigned long start, unsigned long end,
> +			   int nid, pgprot_t prot);
> +#endif

This one should probably go next to the remove_section_mapping()
declaration in arch/powerpc/include/asm/sparsemem.h for consistency.

I would personally remove the #ifdef as well, but there is
already one in that file.

     Arnd
