Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 001CF5BA71B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 08:57:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTPyM2H6gz3c4K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 16:57:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=JaDQfQ7k;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=sGC8fYZb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=JaDQfQ7k;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=sGC8fYZb;
	dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTPxl2X8lz2yxG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 16:56:43 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 6ECA45810B3;
	Fri, 16 Sep 2022 02:56:41 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 16 Sep 2022 02:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663311401; x=1663315001; bh=ueGAKpRYcu
	jBWcF1IXgswNcZrYqQkcImRwqmbgkey1c=; b=JaDQfQ7k6kUDjLkgWulb+k44LG
	PoGUzq9ERze57B3UCw1Lr/UcItwxa3G3mr7zmPK0Xphm70JczvLzd1kA+hhxWODE
	NYq8Dif/5aczXu7ypXVDW3nTRIjTcjO9zZ7r7K/OMEO6fU+eb0H2Sd9WadHtnIyO
	tM6P5XZOzHz9UmubPXzOM21ZXUAouvJnlmsyfJaYJ8H7mSderZE+k8SfIBbaaTaq
	TYJEri8jJ/9hcvIBRJxYu/whH9XulFw0ANVX1QXgjPXgulU68GiZvf4vr/oQPgpx
	Ez7bvWjloy6qGJZjvufavTiIOdwHI9bXcQk/dEF9kbD9XPDAdZbejFfRgFFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663311401; x=1663315001; bh=ueGAKpRYcujBWcF1IXgswNcZrYqQ
	kcImRwqmbgkey1c=; b=sGC8fYZbLrby8Hp+YxO3dPxr0Miys86/O4CmaHnxowfg
	Why62tHHU6o1iASdMwZIhzug1l/C9ZY86t2c58qr8iGzNaadfw56Xr196zgJkgUC
	4idalGpYlVVrUCPQgNznKbeUDmYmvUzbCeM0RLDgTM3LKrO9XwXoswicHSWWgHST
	pS2ZDgEl7d8B/Exylok772c5ekDMzVGzLXMBt+CsmNjGGF4Z/GB7h3NQd30mU4m6
	p4jDqTlzxDHSt3sZySPbR1cZx0GQTJsR4Z3arYZNgyImNxUdDg8kFoRbUsmMFbgV
	RemW2KSvuY5pqiXGtnV+y2Sg0zo4VE8Bu0vVDXVdTQ==
X-ME-Sender: <xms:KR4kYwSffnHjYHKzGqVDkBdHaOOmJq6MjehAfS3U2crt7N3MrNmqzQ>
    <xme:KR4kY9xobW2gst8mERHauy7ECNYvmX4KYOYuO6C2PY0AUWve0clBz9_9M3fbnD5b4
    3Iqv59tN4P-26GdqYw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduledgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffegffdutddvhefffeeltefhjeejgedvleffjeeigeeuteelvdettddulefg
    udfgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:KR4kY92l-03ZikVoN8fLpdm7POE8h46iwxyKKV01Z2AjeTgKUtI0AQ>
    <xmx:KR4kY0CZyR3c-ZlbB1hjsmS93LgUW07LZq57dbHpXW-B8um_SuMMQQ>
    <xmx:KR4kY5iEydEHOWpV3WR5sydfP9FjOquntROFC_oo8YHSRXbr4UuDog>
    <xmx:KR4kYzdby0oQlR-0FzICuAkIcM4buUOFviVe396msJ97gV2jxFdiQg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1E9F3B60086; Fri, 16 Sep 2022 02:56:41 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <94dc51a2-d548-4c4c-98df-cf97a4f94755@www.fastmail.com>
In-Reply-To: <20220916053300.786330-11-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-11-rmclure@linux.ibm.com>
Date: Fri, 16 Sep 2022 08:56:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rohan McLure" <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 10/23] powerpc: Use generic fallocate compatibility syscall
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

On Fri, Sep 16, 2022, at 7:32 AM, Rohan McLure wrote:
> The powerpc fallocate compat syscall handler is identical to the
> generic implementation provided by commit 59c10c52f573f ("riscv:
> compat: syscall: Add compat_sys_call_table implementation"), and as
> such can be removed in favour of the generic implementation.
>
> A future patch series will replace more architecture-defined syscall
> handlers with generic implementations, dependent on introducing generic
> implementations that are compatible with powerpc and arm's parameter
> reorderings.
>
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> V1 -> V2: Remove arch-specific fallocate handler.
> V2 -> V3: Remove generic fallocate prototype. Move to beginning of
> series.
> V4 -> V5: Remove implementation as well which I somehow failed to do.
> Replace local BE compat_arg_u64 with generic.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
