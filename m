Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C40C177E24B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 15:13:16 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=vnOGsLEB;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=J253saPL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RQpV24ZJ7z3cM5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Aug 2023 23:13:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=vnOGsLEB;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=J253saPL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.21; helo=wout5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RQpT32qYSz2yTc
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Aug 2023 23:12:22 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 1C83A3200941;
	Wed, 16 Aug 2023 09:12:15 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 16 Aug 2023 09:12:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1692191534; x=1692277934; bh=ZR
	T106v0hiqgMDmrCmS6eySFqP6+naQFmpKPfl1LC4A=; b=vnOGsLEBWf6iRqdcGe
	aKN5BWG0fJGAVU6JVIXw2r5trEbi4U8HGAkyD0+6xPYUebCuLdj/BgvHcLXQ3VWz
	DM86GEBHF5q/32OBTSQ1jAmNdTLIKRxKeTpDjT17bQgiqwms96qRRheqtFVNxibZ
	hwb68kNFhtdjc0mMi067Ltuik7Sz8Ub0DzdHrBDczZvPLkmNw72p43WeSwcA6Uhd
	jlAAKWZ6Al07ksUMdho4dSrDxHjxQNY7apoz3xCtR88uxRhkG9xkFDGscnnRTo5l
	WiGl5SfVo9TNOcr+c7G2H0chHBT3ePUGo7ZEdPXRmkEqRq9XFAWEkvI8BxCAowqC
	qylw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1692191534; x=1692277934; bh=ZRT106v0hiqgM
	DmrCmS6eySFqP6+naQFmpKPfl1LC4A=; b=J253saPLCyaYpeIDlShp7YvjJgenV
	Ht1wUlTeHrAp+sMBGixfNZyUOs+v29RrlwC/Ff32lR6rR8Ptf/e2eCzpS7zg4WOK
	JYImEvkjD5EcWi13FT1qPlKSW+lxLDrtzkAe+SPR9zQ5OXHVI5o5ZavoAdaJjrvF
	mYs/WGtCNnfkuosVJ63bXDJlTIEuUUTya6gHAHWER0NlUHQA4H1Y/6SUWW5k7VGX
	CgelTXP6IMV844RF/eUDrOP+e8y9sL3KhWck/HUsbwg8VPAFec37UpcjQLZf4mWh
	uldSfe9YCl3AXDW8zsfBvdpTuUvrJa25ROBLezhFUT/OIhB48LEBQcZnA==
X-ME-Sender: <xms:K8vcZHO8GGtKsWaqQcWz1qpw7lABKKHBkhe_YqZz2EzFfnfT05ISiA>
    <xme:K8vcZB-r0Y6dBNf9v4cUL_7yF6uQAKk9sv7-_V3dOoxP_cvdsp3JLUt2S3lonyhXT
    Ls1v4Sr_SabhXlhEhc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedruddtledgieduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:K8vcZGQO-MgdXr5jJldoDAQTHH6Ovgm0uSHlTvzKqKADkMryTvW66g>
    <xmx:K8vcZLtkn6_JnzcwFpD1vZfMnl9JtfeWnWAVnzNARqjEiksaIcRtOg>
    <xmx:K8vcZPepBT5Oy2rf3fQLmMFTs8XTCaO1eXozKuHr43Q9B1oPLmqWGA>
    <xmx:LsvcZBc7lnjA2S24fyGf-1Kbi-eqlGDcVFzJeOS9w2dwF53-Geo3HA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C1305B60089; Wed, 16 Aug 2023 09:12:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <0681968f-743d-4b55-bb1e-dbd665ea8783@app.fastmail.com>
In-Reply-To: <20230816055010.31534-1-rdunlap@infradead.org>
References: <20230816055010.31534-1-rdunlap@infradead.org>
Date: Wed, 16 Aug 2023 15:11:35 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Randy Dunlap" <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] treewide: drop CONFIG_EMBEDDED
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-riscv@lists.infradead.org, Greg Ungerer <gerg@linux-m68k.org>, Linux-Arch <linux-arch@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Masahiro Yamada <masahiroy@kernel.org>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, Jonas Bonn <jonas@southpole.se>, Albert Ou <aou@eecs.berkeley.edu>, linux-kbuild@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <
 monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Max Filippov <jcmvbkbc@gmail.com>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Aug 16, 2023, at 07:50, Randy Dunlap wrote:
> There is only one Kconfig user of CONFIG_EMBEDDED and it can be
> switched to EXPERT or "if !ARCH_MULTIPLATFORM" (suggested by Arnd).
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jason A. Donenfeld <Jason@zx2c4.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>
