Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352A0612C7C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 20:45:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0mvv0D6Vz3cFt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 06:44:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=YcrjoliI;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fXiXfJlV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.26; helo=out2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=YcrjoliI;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=fXiXfJlV;
	dkim-atps=neutral
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0mts2PWWz2y35
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 06:44:03 +1100 (AEDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id A44805C0089;
	Sun, 30 Oct 2022 15:43:59 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Sun, 30 Oct 2022 15:43:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1667159039; x=1667245439; bh=RY8rR7d4cE
	K7NC6MNjZkdPe/HCyeseCpAgG3zsf1oFk=; b=YcrjoliI5+x+26qfOLGHfPUW1b
	qU8XZI0CuCoGGlynz6VHuMwKQgnpjmEdiUYNgkepEDFpZarXzoNTOQg5zlceb2d3
	GWNWjoECBrMCu+9Y7lZu7MMoWcWHjvxC0Qq46xQsfesWj2Mq2CPEq0XPrT12kCwD
	AdTal9HPHKRLLsLxuiz7RNoqLE5RbJ417VSBO5JkiATosnnHRMfzT3Mg2ht26lji
	Q+KAFBf2YRsiVutOqaYR8dUeM8pAinz0Kf+vSF0PR4VH8k6A7LQ1LaaxUIXNBKs+
	OoZvOqOMHJD+l0N39qjsIgND6FGN3CvnZeW0vVBq98gNVRu5i1nvlNSe//dg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1667159039; x=1667245439; bh=RY8rR7d4cEK7NC6MNjZkdPe/HCye
	seCpAgG3zsf1oFk=; b=fXiXfJlVaJsIP0etUaLKATAEWXIJPWQwukqvKUQReUic
	VpRgp8IWtc883+ewGCFEeNCGZdHXm45PDYx0zcCSbK4JJv85CxeCG3SXQWVIy/lJ
	5dwMbTbqZ8m+VKXqlDxqI3oHf9e1pcLNpXc7iy8Mv61ihbXb6VEA7KmiKWCTD/8+
	NE3/VuM1BWMjH79UmkqO04RFswt84KvkbKlmWefsdq2E3t/S0dA2OCIoF6MAKag1
	dHGR10fCv4+vRQwhv95jpTI7mFDc4O0TimnuTYuxE9kJKvIbGl9zVGR7UW2yGpZd
	BDxehaqKwW8jlxDh4/69KZi0cSb5AHdSSv7RKfifVA==
X-ME-Sender: <xms:_9NeY0nfd2oTuTAU37H_3cwVCNli3u2cvb0xZ6OGYqCvnI-_zTFjig>
    <xme:_9NeYz3E53TOptTNEnT_RqVNrcHPL1QWTZSYzKdyQ1IttBQ-6zamqjecDdaLE3kPX
    _ABj2K2E8TlOY91x1E>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedruddtgddufedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:_9NeYyq0mca0jk1oPnzO_1b3uW-tGsbvnXwE1oB3TtzjIOUuRmpD1w>
    <xmx:_9NeYwne6m5NNbU7wsOB8lIsW9xsWLoYE_cfgvhxMmCUeOHsZbPT5A>
    <xmx:_9NeYy1kDPgpA7i8BevqiE8nKN5X06I_CABi6m-_oOP-PvMRicW67A>
    <xmx:_9NeY39B0vW1_qD6BrVS7cHfnJaIHElkZpkuLFEt23uRvB9qcojhLQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1B0F4B60089; Sun, 30 Oct 2022 15:43:59 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1087-g968661d8e1-fm-20221021.001-g968661d8
Mime-Version: 1.0
Message-Id: <8d567e4a-6972-458d-b220-eec56ba52ed9@app.fastmail.com>
In-Reply-To: <87h6zlgwb1.fsf@igel.home>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-22-rmclure@linux.ibm.com> <87h6zlgwb1.fsf@igel.home>
Date: Sun, 30 Oct 2022 20:43:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andreas Schwab" <schwab@linux-m68k.org>,
 "Rohan McLure" <rmclure@linux.ibm.com>
Subject: Re: [PATCH v6 21/25] powerpc: Provide syscall wrapper
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
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Oct 30, 2022, at 16:34, Andreas Schwab wrote:
> This breaks powerpc32.  The fallocate syscall misinterprets its
> arguments.

It was fixed in

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e237506238352f3bfa9cf3983cdab873e35651eb

     Arnd
