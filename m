Return-Path: <linuxppc-dev+bounces-7275-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08409A6C199
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 18:33:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK8gf5Wtfz30T3;
	Sat, 22 Mar 2025 04:33:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.139
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742578430;
	cv=none; b=JWYG3+1zQmsg9Hkkke4bmWSC+Rg4QT6GwWbCr1Ji/clKLTG9B6LchXKG32gk0vQa+zJpE4XOqy2iekAIdUn+berNSw6XTwBz7uG+hFbnvyR+rzwqsxukrYYOPy6S1oo7DoAhIJ+bq72gH+tOCfDCyAWIMMg9BjhojUJvQBkon7Lqu+EwUc5kJRwHIR1Sq07eppEdEKYb3YiUOL5ex/Btn9ydik7yDeUM5Q3a2QJHd9HwQZjrzn45zTXx3kz0cVq4NN1NadmAdV4xjroK5qlSOhiKc1IukFItjGnKn27lC/PfSl6oSmivjAvUcY6ngM9Rb3u4/MqNA2MMtbDVBba8lg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742578430; c=relaxed/relaxed;
	bh=jcHwQGpQOx6GZtNDddAxOwDOWSoyBujaJTuqoyGqXDA=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=VbCG62vpeq9oESTCmvJRoPXieUXA/pSrlEjC1wx0o2snCVl5oOCgjL9lzVFgS1GgNXCXV2RmgV733LW+2yDghmKbv6Y9yeWfgMdGqOUxgR62bilEmuVFgNQZeraehmMtjPcl/YTqR7oGeuLfoxyiVOxXmxN/IY4T93b8h+kxwuovyenlUFGE6oTwaYcXm5HwgESkoAyYCgsV/o1VUeE/RTdhzBcGUP7mWxlWZ4418+oVULmlFyq8+ewM0aOw2nm2tkd+Noa0ybbL8G+RCHWGmGFQMzoUfcZGL7Qljaz9drWqpWFMMk9OfOEqfkqQXm3jCvL/+iUEUJfTgJ6DtNyQsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=DLLkrbjx; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Ui4Dx6rw; dkim-atps=neutral; spf=pass (client-ip=103.168.172.139; helo=flow-a4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=DLLkrbjx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Ui4Dx6rw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.139; helo=flow-a4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-a4-smtp.messagingengine.com (flow-a4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK8gb1Vcnz30Ns
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 04:33:46 +1100 (AEDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailflow.phl.internal (Postfix) with ESMTP id F0255202146;
	Fri, 21 Mar 2025 13:33:42 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Fri, 21 Mar 2025 13:33:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742578422;
	 x=1742585622; bh=jcHwQGpQOx6GZtNDddAxOwDOWSoyBujaJTuqoyGqXDA=; b=
	DLLkrbjxdeZ5VZIGvPAZd4NM/kpOB5yjaRA2bvhlRZZqiAajItla9WOumvbn54t1
	awAa2WdDiftQwM9VUrrdOy2B8L6rbJZP1L2CHyFMjUo2bYV5jiVdUCBJ+txYzcyX
	YfNdALHqJ8vA1g0fKqj/rYooeIPG8pW0+DKZ5pjBDdQ/ov2TUOQvQoS7XX0pmiXf
	E0jtTwHqb2w3VcZDUJJbENArof3r2e/WJIEaKvPw8kCHgD/xH5vt/Oaa41CisOOt
	aLby2QkmaE23J33Sau22v+uw207knEJBvxfygvvXmXMkokkBEsxQ+juulQzszHxF
	prI/sAddxyIp9Iv/S2/Rhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742578422; x=
	1742585622; bh=jcHwQGpQOx6GZtNDddAxOwDOWSoyBujaJTuqoyGqXDA=; b=U
	i4Dx6rw8n6KelCD0qaTj5zmZdQsre1O+uqLIzcbok/RNBBKaWZy4PEX4GXch+Jbj
	lGeF4rm/KmmivV4flBuVWpy9M3ugVKbWVfcXdHTDAu4/CJgKdGaPnkWToVcfc1Hw
	pGV6HAeXLkOX5OanKtfkRnUF8XHkfi0qbIavNs+iHqhH4TTY1MrqulMRfI/e6DwS
	PJXbL6UQXAhfw+r1cX0pjR9yekCg707nyiuGR2GY3F0MLay1n+DxG8jMS6OyEQen
	5c7eHiflpY3UpwHTif8k8jnnl5jgO/iJjoATUB+TYxcGJdukz4ej7g5g44pnW5D5
	wL+dD+0XGM01ti8O6vuyQ==
X-ME-Sender: <xms:9aLdZ1FWQqOziPqqoohR2Ek7ZIBNYbxHCOcRkjf-xbQHxvCD9abBXw>
    <xme:9aLdZ6WibTWFxk_WdQPYzwJQ8ENd3FCvBOXO81gFbAz0-NmJ4fiVzoewL77Jow-f_
    b8Bs0S4SK0muK6g9C8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduhedujedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    feejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkvggvshgtohhokhestghhrh
    homhhiuhhmrdhorhhgpdhrtghpthhtohepuggrnhhivghlsehffhiflhhlrdgthhdprhgt
    phhtthhopegrihhrlhhivggusehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvghssh
    grnhgurhhordgtrghrmhhinhgrthhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggr
    vhhiughgohifsehgohhoghhlvgdrtghomhdprhgtphhtthhopehkuhhnihhtqdguvghvse
    hgohhoghhlvghgrhhouhhpshdrtghomhdprhgtphhtthhopehmtggrnhgrlhesihhgrghl
    ihgrrdgtohhmpdhrtghpthhtohepjhgrnhhirdhnihhkuhhlrgesihhnthgvlhdrtghomh
    dprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:9aLdZ3LWSj3ee0DpgDBVQgR9N6em0f5-W_bT607OLi8J56P-PHjwdg>
    <xmx:9aLdZ7EmgyfsMK79595Ji4fqyaEgzpUx28qERgbScF30VauOkMTTZA>
    <xmx:9aLdZ7VDCg0me11XgjTCMnOtsbEkwp9VdJtw9WRuZpovB9sSdPMWvQ>
    <xmx:9aLdZ2MO9qdvK_ExIyuwHK5jCpMbl8MVknK5QRVW7ddiQcxb6VhGrQ>
    <xmx:9qLdZ7URYi_A7oI0zqTv7Ebk9x9UFrrUdpb50OelwEli-e3q19QxBoz_>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 1F6E52220072; Fri, 21 Mar 2025 13:33:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-ThreadId: T46bf3c12e1d9de2d
Date: Fri, 21 Mar 2025 18:33:19 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>,
 "Alessandro Carminati" <acarmina@redhat.com>, linux-kselftest@vger.kernel.org
Cc: "Dave Airlie" <airlied@gmail.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 "Dan Carpenter" <dan.carpenter@linaro.org>,
 "Kees Cook" <keescook@chromium.org>,
 =?UTF-8?Q?Daniel_D=C3=ADaz?= <daniel.diaz@linaro.org>,
 "David Gow" <davidgow@google.com>,
 "Arthur Grillo" <arthurgrillo@riseup.net>,
 "Brendan Higgins" <brendan.higgins@linux.dev>,
 "Naresh Kamboju" <naresh.kamboju@linaro.org>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Maxime Ripard" <mripard@kernel.org>,
 =?UTF-8?Q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 "Daniel Vetter" <daniel@ffwll.ch>,
 "Thomas Zimmermann" <tzimmermann@suse.de>,
 "Alessandro Carminati" <alessandro.carminati@gmail.com>,
 "Jani Nikula" <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 kunit-dev@googlegroups.com, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 loongarch@lists.linux.dev, x86@kernel.org,
 "Linaro Kernel Functional Testing" <lkft@linaro.org>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>
Message-Id: <a6f90bdb-8459-4d33-8874-7e724bd22d9f@app.fastmail.com>
In-Reply-To: <b6bb68f0-7e93-4db2-9fe6-f615f06ddeb1@roeck-us.net>
References: <20250313114329.284104-1-acarmina@redhat.com>
 <20250313114329.284104-11-acarmina@redhat.com>
 <b6bb68f0-7e93-4db2-9fe6-f615f06ddeb1@roeck-us.net>
Subject: Re: [PATCH v4 10/14] s390: Add support for suppressing warning backtraces
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Mar 21, 2025, at 18:05, Guenter Roeck wrote:
> On 3/13/25 04:43, Alessandro Carminati wrote:
>
> gcc 10.3.0 and later do not have this problem. I also tried s390 builds 
> with gcc 9.4
> and 9.5 but they both crash for unrelated reasons.
>
> If this is a concern, the best idea I have is to make KUNIT_SUPPRESS_BACKTRACE
> depend on, say,
> 	depends on CC_IS_CLANG || (CC_IS_GCC && GCC_VERSION >= 100300)
>
> A more complex solution might be to define an architecture flag such
> as HAVE_SUPPRESS_BACKTRACE, make that conditional on the gcc version
> for s390 only, and make KUNIT_SUPPRESS_BACKTRACE depend on it.

That is probably fine, there are very few users on s390 that build
their own kernels, and they likely all have modern compilers anyway.

I should still send a patch to raise the minimum compiler version to
gcc-8.1, but unfortunately that is not enough here.

     Arnd

