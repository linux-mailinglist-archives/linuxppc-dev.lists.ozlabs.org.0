Return-Path: <linuxppc-dev+bounces-17858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ABL1Kk9jq2mmcgEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17858-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 00:29:19 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8115228B1C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 00:29:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSN0C5GN1z3cDy;
	Sat, 07 Mar 2026 10:29:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.141
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772839755;
	cv=none; b=d3fHXZua9g2yLrrFY7X3TwYVg8rH0087MG8QxEqACDXiGoQ6n0CGi5+pwHoSeA9BgMn0jn9ZGmEA9b4B+GqfvgloZNKTuWqdHyvxGURN9F8lGEcuZLYFCWk0S5F5FchY9h2ycUi2PF4GX6X+4ZUrkGDFlyfXy+9EEWHp+QG+VSNj0svW+iQVtqc6xDGzF3o9jgUZstjzOs8h37h0LyLIFkxRF12rAgOiAQTh2iBja3F/bWKMJmbSrD+ujX62wYRsk7zjF6gR+6QSWteUDPiqvzb2ZXHkOz7ktVQ++I5b9WYjLQ63UriQM/n+LksCRVjInCdqNGPQP4hw2yYcIoMMRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772839755; c=relaxed/relaxed;
	bh=GETdZGM4YA8yA694WxEZkZM09wEgzGQFz172whB4Qxk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=cJDJrYd20EYG2wwYixTzXrH6by/9+bSuY8EJa7/0mh6enJH5EN7Iw61oKkCKF6yIdGijuY0SLSol/7ZmyVFCJUQfcIltTYzaB/WWGQFJ3ABAKXJU2TdhFHObTXmdmDib7Kykqdhtj8rtVam55daR5qYQvH0MaxdOvjRUtHYX2EyPlsmFkptQ0wYVgoc3ATGmRTzrHEsE+kY0pCKuzEprVyyHUtg988qtV1rTLWeg8004LKGiOXdzyX5rjniAuLi0sByuEd79vdRgGEM0ndPoB/zJy5nYv+OlBOpRggc2Xphd5FDe/iQWXOOv4+weImsNDvxVrzLMByG/bzyDu3Njcw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=DZLtQeEa; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=wseMXmnJ; dkim-atps=neutral; spf=pass (client-ip=103.168.172.141; helo=flow-a6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=DZLtQeEa;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=wseMXmnJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.141; helo=flow-a6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-a6-smtp.messagingengine.com (flow-a6-smtp.messagingengine.com [103.168.172.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSN0832Jtz3cDf
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 10:29:11 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 468D31380B55;
	Fri,  6 Mar 2026 18:29:08 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Fri, 06 Mar 2026 18:29:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772839748;
	 x=1772846948; bh=GETdZGM4YA8yA694WxEZkZM09wEgzGQFz172whB4Qxk=; b=
	DZLtQeEaE1Dg/BQ7D4AeSS6PstNxPQGzBfjmzElVIT2ViU5ATfpUTqv7ybEr9Ht1
	oNWpbiqL2pq7dtr+d/nQeWQrsgtFOolMVDDHLGag5CqmqYuNkKJu2fV6pYT4kFal
	VDcmU/ygQtSSYNKAlWfynduCxhSfxMxJ/q6eqKV67R8jo3kpmDwFf+3Ik4ZFpRP+
	kvRibMs1AygZJ5Mt/9LmTVRSM1O1u1satUPynemVwMfrv1RBET+4vzB1y5wKEJxP
	mNV8qPxnb6oCZhF7tZuLWePLcH4p1BgF4X0Dl+jJZpUQtYR5ZhLhvmsR+wjOQQGx
	O2oXve4Du80lwmuLrMWrCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1772839748; x=
	1772846948; bh=GETdZGM4YA8yA694WxEZkZM09wEgzGQFz172whB4Qxk=; b=w
	seMXmnJeT7pXctEfb0cuHkhDGFIved/RrLP41GOYSHJZIudzgjXdkCaMKc3/fuOc
	VZSiKq/sFK46Wv0P1yfi6XTTGcjVcOF4t16lFjNAn0khkeQexoCxqlKk20jAOh5Z
	3FXnJc/w+W/aHe8VwOhDWyYQlwq2ziIThwloozu1G1am3J/+FA4JrhkVlv382NxA
	OLKtCAKtzSbyQfVzIG1J+C+7UP4aLUuKtIeM+0s/AdlXgqDkeRlkd44mZXcj+fa3
	w3JdHa4D+s/qlnJKWqICmb+3+32uBHUCjfdPoY02ErP23mAM8KZErJQaJiORqdAK
	1b4FEirgnOfR6NSecGlLA==
X-ME-Sender: <xms:QmOraWsyLvlZyKLelmZchVJg1xBgRira818lH5Wjars5zRp85n6CQw>
    <xme:QmOraWRtKrrRDmlCNZGOpBg7hN286NecEsEM-hXsK-CEU4Kvci-J_B3E_EW-_GbjF
    PGKco_Wq02UUw_hQh5BDkaiv8zqs7AnWCU8vkT9nPcakQV0ANylFxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvjedtiedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepfeefpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhope
    gumhhithhrhidrkhgrshgrthhkihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhi
    tghkrdguvghsrghulhhnihgvrhhsodhlkhhmlhesghhmrghilhdrtghomhdprhgtphhtth
    hopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepjhhushhtihhnshht
    ihhtthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepmhhorhgsohesghhoohhglhgvrd
    gtohhmpdhrtghpthhtohepshgvrhhgvgeshhgrlhhlhihnrdgtohhmpdhrtghpthhtohep
    rhhosggvrhhtohdrshgrshhsuheshhhurgifvghirdgtohhmpdhrtghpthhtoheprghrug
    gssehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:QmOraRrSb10jiymrzAb9WoZsi2Tz-RWq3EgTbOMgthiE6ddf2js5fg>
    <xmx:QmOraV59nHhEl8HgbMxhoT5o00wgqHOBxJi98jSFMQacjFhPKo6bVA>
    <xmx:QmOraeTzKignEiBCyYkH7DDUy6V7Tt_Ly1cVrUvLgxoPLAb5URLvJA>
    <xmx:QmOraV22SWxKf9dNjfi4R5SgY50umdOU57z7mmavyGXn0CHg06wlMA>
    <xmx:RGOraemTV6W3wcgRW43rhHE9NEY71V2JSNopp6mLKexfMh9JtslQFcRw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 629A3700065; Fri,  6 Mar 2026 18:29:06 -0500 (EST)
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
Precedence: list
MIME-Version: 1.0
X-ThreadId: AYSH_HmCkp7N
Date: Sat, 07 Mar 2026 00:28:27 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Mimi Zohar" <zohar@linux.ibm.com>,
 "Roberto Sassu" <roberto.sassu@huawei.com>,
 "Dmitry Kasatkin" <dmitry.kasatkin@gmail.com>,
 "Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 "Jarkko Sakkinen" <jarkko@kernel.org>,
 "Ard Biesheuvel" <ardb@kernel.org>, "Coiby Xu" <coxu@redhat.com>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Eric Snowberg" <eric.snowberg@oracle.com>,
 "Nick Desaulniers" <nick.desaulniers+lkml@gmail.com>,
 "Bill Wendling" <morbo@google.com>,
 "Justin Stitt" <justinstitt@google.com>,
 "Andrew Donnellan" <ajd@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linux-integrity@vger.kernel.org,
 linux-security-module@vger.kernel.org, keyrings@vger.kernel.org,
 llvm@lists.linux.dev
Message-Id: <e16f0912-c928-4f25-94f8-18b260416ce3@app.fastmail.com>
In-Reply-To: <20260306225648.GC2746259@ax162>
References: <20260306150421.270124-1-arnd@kernel.org>
 <20260306225648.GC2746259@ax162>
Subject: Re: [PATCH] integrity: avoid using __weak functions
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: B8115228B1C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-17858-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[arnd@arndb.de,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:arnd@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:zohar@linux.ibm.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:jarkko@kernel.org,m:ardb@kernel.org,m:coxu@redhat.com,m:npiggin@gmail.com,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:eric.snowberg@oracle.com,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:ajd@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-integrity@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:keyrings@vger.kernel.org,m:llvm@lists.linux.dev,m:dmitrykasatkin@gmail.com,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,ellerman.id.au,huawei.com,gmail.com,paul-moore.com,namei.org,hallyn.com,kernel.org,redhat.com,oracle.com,google.com,lists.ozlabs.org,vger.kernel.org,lists.linux.dev];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[arndb.de:dkim,messagingengine.com:dkim]
X-Rspamd-Action: no action

On Fri, Mar 6, 2026, at 23:56, Nathan Chancellor wrote:
> On Fri, Mar 06, 2026 at 04:03:24PM +0100, Arnd Bergmann wrote:
>
> Thanks, I noticed this as well. The version I came up with and have been
> locally testing is the following, which is a little bit more compact.
>
>  arch/Kconfig                     |  3 +++
>  arch/powerpc/Kconfig             |  1 +
>  arch/s390/Kconfig                |  1 +
>  arch/s390/kernel/ipl.c           | 10 +++++-----
>  include/linux/secure_boot.h      |  4 ++++
>  security/integrity/Makefile      |  2 +-
>  security/integrity/secure_boot.c | 16 ----------------
>  7 files changed, 15 insertions(+), 22 deletions(-)
>

Right, your version looks good to me as well.

       Arnd

