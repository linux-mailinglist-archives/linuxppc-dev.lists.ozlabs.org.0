Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A26A45BDDD6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 09:10:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MWt443GyVz30Ly
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 17:10:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=dPZYYFda;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=sHmEpw5+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.26; helo=wnew1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=dPZYYFda;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=sHmEpw5+;
	dkim-atps=neutral
Received: from wnew1-smtp.messagingengine.com (wnew1-smtp.messagingengine.com [64.147.123.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MWt3L4Pzdz2xKf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Sep 2022 17:10:05 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id CD7E32B06061;
	Tue, 20 Sep 2022 03:10:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Tue, 20 Sep 2022 03:10:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm1; t=1663657801; x=1663661401; bh=QlxnNVv7i+
	PpEqqID8tgmDpyNekPLAvI8LJUcfgrRKI=; b=dPZYYFdaQ3GIE3eS+pQ/sFUYZN
	me2N1jTPLH+vLTxv3n0D6TNrfu1JkTSWcAysSaepplZZ+hifpSDmWIAmnUw26x/c
	Wk6fjcOY30YbxCIVrvE9zM9a5ARhJ61RzNcHmu6iiXpBBCJfKZB5hBJc+GMgZjYi
	W8KhBCvdEzEywwTjmjmDOf+RPIzU5t0cDg0pyIrwpWcr/eyG3zY3G0OX/b5MgqHX
	jA5qqTkoklMs/8YDWghy0rvoAQ8EHS9FX7HOuPE3CkiZ38OuGzs8E+clwyQ5Fi5K
	QZAH6dbPnnKqvnvEckEeDTRgmeLxT1CpEmypheeiXQ6n/8zcs3kxmJlD25XA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1663657801; x=1663661401; bh=QlxnNVv7i+PpEqqID8tgmDpyNekP
	LAvI8LJUcfgrRKI=; b=sHmEpw5+fLJJv2jevpxknicwZ70xsg9gD2aFeGe9q6UN
	BgrgpHZcX3wqF5fM0Uk7zDwP/0vjFZCMv7hH/BgEKui7dB2/E3uhWKvmDOdVy3b8
	cRMIBe/IEN/HvVmbLA9+rlqbF7F6Litiz182q1IzfCS2dLCtsx8o55ASY/qUTRDW
	EunjQ8bWcuWkZ7tI46uwqt6Bu917QbtZ76NLKfWXMCe2e1tjt3F8IN6wMj4a8LCM
	gdAZm5aPx0yiKtxERYp1ktIXszoKCC6CpwHCF1KgNTP2neIpkURg3LgMy9gH3hs8
	y4YcN+79Xef5a8y4qCrpos+YI4cOG6y7RSu7Ci3y8A==
X-ME-Sender: <xms:SWcpY7qDgTulHhZJTF-qouM7ttMXxXm4PG6Ee1NMP3DsL3AEuaapjg>
    <xme:SWcpY1pO7LXN8Yy4FKvj2zWHfOZxMH4NjmrU3aLyMV6nCbrcrN0_IKkrUWDqM84eB
    MLEYhkqFggewwLwBGs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfedvkedguddukecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffegffdutddvhefffeeltefhjeejgedvleffjeeigeeuteelvdettddulefg
    udfgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:SWcpY4OQWgJqvdx1h_iV5Tuxw5ROry4xNCbdeTeaAdp_XQzuQ7uNpQ>
    <xmx:SWcpY-6lDHZyykH30u4_nD76obnj6RZi82jZhpvAV3_gG9LCxIHRrA>
    <xmx:SWcpY64-IjgRDiFupIeO50Iwj1Iq9M2WhC_BW-bAOXXbi5TPg22Hsg>
    <xmx:SWcpY3Uy5uCiEzyavkZee4hClziMMVCloQHdnDo0lZLgpFeTENT27JpPQGU>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 11AEEB60086; Tue, 20 Sep 2022 03:10:00 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-935-ge4ccd4c47b-fm-20220914.001-ge4ccd4c4
Mime-Version: 1.0
Message-Id: <21eb6db5-a291-4435-9d8f-2baee8fae11e@www.fastmail.com>
In-Reply-To: <20220916053300.786330-10-rmclure@linux.ibm.com>
References: <20220916053300.786330-1-rmclure@linux.ibm.com>
 <20220916053300.786330-10-rmclure@linux.ibm.com>
Date: Tue, 20 Sep 2022 09:09:40 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rohan McLure" <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 09/23] asm-generic: compat: Support BE for long long args in 32-bit
 ABIs
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
> 32-bit ABIs support passing 64-bit integers by registers via argument
> translation. Commit 59c10c52f573 ("riscv: compat: syscall: Add
> compat_sys_call_table implementation") implements the compat_arg_u64
> macro for efficiently defining little endian compatibility syscalls.
>
> Architectures supporting big endianness may benefit from reciprocal
> argument translation, but are welcome also to implement their own.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
