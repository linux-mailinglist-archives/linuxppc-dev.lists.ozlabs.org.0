Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5B46F9E98
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 06:11:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QF7C43Y01z3cdj
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 14:11:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=juls6grs;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CGYjyoQG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=russell.cc (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=ruscur@russell.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=russell.cc header.i=@russell.cc header.a=rsa-sha256 header.s=fm1 header.b=juls6grs;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=CGYjyoQG;
	dkim-atps=neutral
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QF7BD2M8Nz2xKS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 14:10:44 +1000 (AEST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 14BBA3200917;
	Mon,  8 May 2023 00:10:42 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 08 May 2023 00:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=russell.cc; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1683519041; x=1683605441; bh=z6bsV0fAdjv5CM8vpOaTBe1PvIT1MhT8D51
	BxvQssaE=; b=juls6grs9X0U35l4E/kOsD78PSjCJuCFg6YdWkl9Fi1TA5k27xJ
	ahwGx3cB+HsdmjgmDJ7BWpu9l+mQmGobqqsA5wjAA85HkJVcUNRXS1P0A1QNK/rl
	ALX8glfNiP+g48KlNtur0lq7aGemsilBXPJTebyWYJ/CJizCF/mpdmz4pGz0lnjX
	PZdA8jHXxwroWl5/bNZNHcX8CnRtqAzB9jwN7CQoGMHqV7e7Kvp0fKk/zPbyguyE
	HaHclFlJNNou0tBHEoEEwHfGTMQIFGONhKZMTMehPQDQybUQdnZqf5Olp6+pFhi9
	WC+ejngT+e7w2yy/Sh+Bt1a44BVxiT53ymQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1683519041; x=1683605441; bh=z6bsV0fAdjv5CM8vpOaTBe1PvIT1MhT8D51
	BxvQssaE=; b=CGYjyoQGbGaq8bi8iD0r2HwkwO/4KxQbYk26vijaxnahwFxaj0E
	qLfa4UOVoUDzywFVNa1MsVu6zaXXq/vNQXOobddXC0jsb2AqIwO3UtgrGiMQVNmu
	ODIIvyRnwvbZ4S7yYP+0sIJAUvFpI/HBMlddhvDrtHKnlCvlerQagM+hC2HqdmaP
	hoyCazldK8OTo0LyAYT32EuS849wLKROsUGS8HlqdpwRhv2+X8dp/rXr8csxKTJ6
	QI+rk7Be834TtoOmTtse6IMZDSFwZB3rEwtT5NP99AlYBu1jKSm80DX5vegXv00I
	ljuVcj0W7zGHm6SLpwzYY8ohMs20op+Eiyg==
X-ME-Sender: <xms:QXZYZHCQgnq_bANawk3Ui-0q5o6SObIa2TEHLKHqWIXjO4J_I3QSbw>
    <xme:QXZYZNg7kgbTi3q3qqtulTx6c49pxG0z_J-moRr0x2mPBLyIqQLkYkbaNVeaAR6W7
    Zk_h4SVFb7x9DQFHw>
X-ME-Received: <xmr:QXZYZCnjh6APTSl5nyPmPg98coHtqiqqdY2LjM8hk3z8Ymzie-fdpE6iPtSlD0jCLs988aUqU-afmiqn1-8C9j7h9r43tbYbL__BZR4mER23bQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefjedgkedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    gfrhhlucfvnfffucdludehmdenucfjughrpefkuffhvfevffgjfhgtgfgfggesthhqredt
    tderjeenucfhrhhomheptfhushhsvghllhcuvehurhhrvgihuceorhhushgtuhhrsehruh
    hsshgvlhhlrdgttgeqnecuggftrfgrthhtvghrnheptefgieelhfeufeevvdekheeifeej
    gfefgeehtedukeeigfduuddtueekteevleelnecuvehluhhsthgvrhfuihiivgeptdenuc
    frrghrrghmpehmrghilhhfrhhomheprhhushgtuhhrsehruhhsshgvlhhlrdgttg
X-ME-Proxy: <xmx:QXZYZJz6oawHFLHZwKs1QhhJJXX4VUmeajYo563Gso7rsdeFQEp6pQ>
    <xmx:QXZYZMSgM5RHoQsmMq7jMW9leXJEfapHkq0anBnMhJ7BgVmqcNdnNA>
    <xmx:QXZYZMYnAioWopRPZJpHy1hmKstPr6QWYFtLorZbKYj0-vc3wlBogA>
    <xmx:QXZYZHI9axPUM-nC_qCzkbCcH9zylCNrzhitRnYVdgx5Uh_COumfzw>
Feedback-ID: i4421424f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 May 2023 00:10:40 -0400 (EDT)
Message-ID: <30ab5c2c60d2de235e6c4be629f0697d7ec95daa.camel@russell.cc>
Subject: Re: [PATCH v2 05/12] powerpc/dexcr: Support userspace ROP protection
From: Russell Currey <ruscur@russell.cc>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 08 May 2023 14:10:37 +1000
In-Reply-To: <20230330055040.434133-6-bgray@linux.ibm.com>
References: <20230330055040.434133-1-bgray@linux.ibm.com>
	 <20230330055040.434133-6-bgray@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1 (3.48.1-1.fc38) 
MIME-Version: 1.0
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
Cc: npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 2023-03-30 at 16:50 +1100, Benjamin Gray wrote:
> The ISA 3.1B hashst and hashchk instructions use a per-cpu SPR
> HASHKEYR
> to hold a key used in the hash calculation. This key should be
> different
> for each process to make it harder for a malicious process to
> recreate
> valid hash values for a victim process.
>=20
> Add support for storing a per-thread hash key, and setting/clearing
> HASHKEYR appropriately.
>=20
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>

Reviewed-by: Russell Currey <ruscur@russell.cc>
