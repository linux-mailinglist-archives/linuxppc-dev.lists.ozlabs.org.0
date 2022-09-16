Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5945BA718
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 08:56:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTPwy0rNpz3c2d
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 16:56:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=T5hoge+K;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=snkZRwKM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=T5hoge+K;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=snkZRwKM;
	dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTPwD6hc3z2yxG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 16:55:24 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.nyi.internal (Postfix) with ESMTP id 14F75580E23;
	Fri, 16 Sep 2022 02:55:21 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Fri, 16 Sep 2022 02:55:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663311321; x=1663314921; bh=S5kTMgQG2X
	deqag4z0DuGjwBmvYRdpjKaBZvs0hManQ=; b=T5hoge+KBlRUZaPtEl+Onl8KWu
	VGnLiWPyLlwyqj5f4Z0714k3QKbQVZk7Mxsn91a7xE2dBrf86h5PicoDqzXTl36U
	cavn2lfSzqQB/0F0WmUW1seFts9dlayCZmFtVDQfNFhImFnv910dWUGHw7dIsdXZ
	hOIYPRF1r7WHcr0CsARz6RBQgJse7ScVjNuJId7q+/9EuwwbNjaU4mPiGhkE1NAT
	vO3ZPrOFnMhbMXtcTngOaBPNbBsLbQsMpU+UXZHWkk6CHasfuNwcd4pkttfxL0zs
	twbNKUv2SLlAfLnE6kb1lJZCoJ+VCIGpvz94tWOZbLp/fEwSad2TkDicNblw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663311321; x=1663314921; bh=S5kTMgQG2Xdeqag4z0DuGjwBmvYR
	dpjKaBZvs0hManQ=; b=snkZRwKMA8/+zUrOy4NclOhrw0TyT9qZgUUWcrlmzStC
	qRUN088i7KquLSKY2CbzA5Pq9S16eb1FZmDpf/KwekHYQv05D7P6UgqnQ6nqf4YA
	9k04bosutiISx4+bck0fjKBu9WM9br/0cIaslLIENf5Eu0pD85epkNWMyuvZ95xE
	6pffLh8ycYB01aYwzekwtrZlIuVjvuj3Z7+Or0y7k1wzXXvbmld0GJVJOYxHPUPB
	GzCXe+xp0f9RS2i2t9drEbFcr28GhjBLLMgrlgYXB031nmFNLOl+eDL8AuFSSCm1
	TrR9lS0sPflN+Iyxg6LYF5U9tkMeEXZocarVccVA+A==
X-ME-Sender: <xms:2B0kYyE0tht0SAM3wPeMtDT5KI8UwyC37qKxnqJFONnTA8OATouFRw>
    <xme:2B0kYzX0y3Ne6stSCOczWYud89brNL3wifmekD1IufVrm5-gAlid1IzfWblNEVBte
    3p-LGwZWKKMYQ-w7Vw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeduledgudduvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgedvueffledvhfduvdeghefggfehvedutdeigeejtedtieeigfdtvdfgveef
    iedtnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:2B0kY8Lwepm8iy5goKU69F_kOGV8pfRrksMrxEP_Btd7GQtOCShzQA>
    <xmx:2B0kY8E6YkEF-HsSVqzdiZ13ileiIzpsm8H9zgJooDJM6r3Pn7jzbA>
    <xmx:2B0kY4UuzNvgiS_3ewtY2Lw1wouBu7gP1LSg8EwNX-D3SRJMx6Vo8w>
    <xmx:2R0kY7CYZEBeKb7h56EWIVmvJnIPPvq7hrVg0edgfhAroxsyDHNEXw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C93B4B60086; Fri, 16 Sep 2022 02:55:20 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <e2c6ee79-6b4b-4f2f-87af-691e461c97ad@www.fastmail.com>
In-Reply-To: <20220916053300.786330-9-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-9-rmclure@linux.ibm.com>
Date: Fri, 16 Sep 2022 08:54:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rohan McLure" <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 08/23] powerpc: Fix fallocate and fadvise64_64 compat parameter
 combination
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
> As reported[1] by Arnd, the arch-specific fadvise64_64 and fallocate
> compatibility handlers assume parameters are passed with 32-bit
> big-endian ABI. This affects the assignment of odd-even parameter pairs
> to the high or low words of a 64-bit syscall parameter.
>
> Fix fadvise64_64 fallocate compat handlers to correctly swap upper/lower
> 32 bits conditioned on endianness.
>
> A future patch will replace the arch-specific compat fallocate with an
> asm-generic implementation. This patch is intended for ease of
> back-port.
>
> [1]: 
> https://lore.kernel.org/all/be29926f-226e-48dc-871a-e29a54e80583@www.fastmail.com/
>
> Fixes: 57f48b4b74e7 ("powerpc/compat_sys: swap hi/lo parts of 64-bit 
> syscall args in LE mode")
> Reported-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>

Looks good, thanks!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Cc: stable@vger.kernel.org # v5.12+
