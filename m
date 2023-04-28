Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 827F06F129B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 09:42:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q74MK38Msz3f7r
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Apr 2023 17:42:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=DclSOfxi;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZK/ac6fy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.19; helo=wout3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=DclSOfxi;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ZK/ac6fy;
	dkim-atps=neutral
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q74LL62ZMz3cBX
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Apr 2023 17:41:45 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 615423200319;
	Fri, 28 Apr 2023 03:41:39 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 28 Apr 2023 03:41:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm2; t=
	1682667698; x=1682754098; bh=IpndvKPF8+ZBYjcJVQBy1hma252/YYop7a9
	JdT/8deI=; b=DclSOfxipXonjr10Zfze2g04tEcMacCmPEMQj9KSUXPgBjVvL3b
	MQo6fuWFJzT27nHJRs74jQBGwTtn2n2KHu5aTUjHmlrE0229hVE5oHF9yZDkS3ew
	p1PmAZmZsXTagjeqlDcNnPsWoMKrE3WDRUgwOnllR2Mxd40mEjio8JDSoZrBhcLY
	EpF/qnQ//QXfqOClL6sTo+6QcKph0TMZrseOTG+p/07lIk+CJDRuw9l1QbbyGXjO
	Eb35nUJHmU87iS3+aXTcjIEw3yWT1ZcEtVJ4ScA81na/2JXShjG0jXm+bNsByN9H
	0auAMaDbwZPPaqpkQeZO7SI/+wjiURWUsIw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1682667698; x=1682754098; bh=IpndvKPF8+ZBYjcJVQBy1hma252/YYop7a9
	JdT/8deI=; b=ZK/ac6fyNoZWTXPXbTwDD4R131otN5WDVVkeFrFt0hh+B+HJxI8
	X1G/CekMUpexmmrmmtZG9J6nlcBpYM2so1ttFbssFuvmAd/ypJumITr52uxj1kqy
	Zy5c2xC/bhpYC6ggOg+MvqevGn68/zmzyOJ/3I3FVAlKSomAD5e4Rd6yFIqBKGoS
	hfpNiJGqsm98wDNSPOSseTUhCzwwWb6vjvWT3xqdwN747++XNPbtRAEMqvBh4uIw
	8a5wbLZI4Yp1uAxenqy8Yq0fZoWyfdJOOTsgpDQXZZOenD4BGJ/pbNjPRx5NNA7H
	eRdIwS64tODrt1vngpa6XkfH9l9gVEeJE5g==
X-ME-Sender: <xms:sXhLZC_w2Ek7ASHPBn9INJdoLclKFnb0_xbl3lC3xmLCPyKQXxk-BA>
    <xme:sXhLZCuacs7cUiWYO0nEuiBYqB32l5BX1MLYeiBEMcK-fUP18Owr4Xr3Py6CFXhZd
    _Jcbs_IxCTeOMDCEhI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfedujedguddvhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedf
    tehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrf
    grthhtvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudek
    tdfgjeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    eprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:sXhLZICeUj5YmbBGBf_2m0H6PdWJkxUh3cvjU_9w54cXtxEeD9Uaeg>
    <xmx:sXhLZKfodyYkaB9AElovPFxDfwUHR8mUJf5ooIYAhxFkIsxA5POH_w>
    <xmx:sXhLZHPdS6QKadaKE8YtYrFaIvC03TvHzezzcglBLhUn06N1drpMBQ>
    <xmx:snhLZPb3qpLzi_KGSCW3CvjqMT17lW441eMUaxBX-rqa1NYZ3zdyZQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1B945B60086; Fri, 28 Apr 2023 03:41:37 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-374-g72c94f7a42-fm-20230417.001-g72c94f7a
Mime-Version: 1.0
Message-Id: <52dd950a-e714-4ebe-a663-4e0ec6463d03@app.fastmail.com>
In-Reply-To:  <168155718437.13678.714141668943813263.stgit@skinsburskii.localdomain>
References:  <168155718437.13678.714141668943813263.stgit@skinsburskii.localdomain>
Date: Fri, 28 Apr 2023 08:40:51 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Stanislav Kinsburskii" <skinsburskii@linux.microsoft.com>
Subject: Re: [PATCH 0/7] Expect immutable pointer in virt_to_phys/isa_virt_to_bus
 prototypes
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: linux-ia64@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Dave Hansen <dave.hansen@linux.intel.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, linux-mips@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, linux-hexagon@vger.kernel.org, Omar Sandoval <osandov@fb.com>, Linux-Arch <linux-arch@vger.kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, Helge Deller <deller@gmx.de>, x86@kernel.org, Stanislav Kinsburskii <stanislav.kinsburskii@gmail.com>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Brian Cain <bcain@quicinc.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Chris Down <chris@chrisdown.name>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Ivan Kokshaysky <ink@
 jurassic.park.msu.ru>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Apr 15, 2023, at 12:17, Stanislav Kinsburskii wrote:
> This series is aimed to address compilation warnings when a constant p=
ointer
> is passed to virt_to_phys and isa_virt_to_bus functions:
>
>   warning: passing argument 1 of =E2=80=98virt_to_phys=E2=80=99 discar=
ds =E2=80=98const=E2=80=99=20
> qualifier from pointer target type
>   warning: passing argument 1 of =E2=80=98isa_virt_to_bus=E2=80=99 dis=
cards =E2=80=98const=E2=80=99=20
> qualifier from pointer target type
>
> The change(s) is the same for all architectures, but it's split into a=
 series on
> per-arch basis to simplify applying and testing on the maintainers sid=
e.
>

Looks all good to me. If everyone is happy with it, I'll queue it up
after in the asm-generic tree for 6.5, once rc1 is out.

 Arnd
