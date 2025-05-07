Return-Path: <linuxppc-dev+bounces-8378-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7DBAADD17
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 May 2025 13:16:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zst520JRsz2yLB;
	Wed,  7 May 2025 21:16:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746604576;
	cv=none; b=OV5W6iEg8oVTXg2ry/ZX+i1+qckVyAfnHCHcjwY89hSUTPbtPv4OXkMuee4KKO+z4LEYCJNSsOTuGdDKow0ijwsda7ZS1Bu81msVPeNc+bS3BFLqzda1f+Dgaf56SFbTa4fw/uBV52WPvYsmhWStQHj3tCRhOXo6DIIegveGSm1qCiNzX2CTzY0uiR9r5dY+NKpMnStq9Sy7iKhBaL/B1ENYyekX0vn3vStOUYt9EpojjA5Q54mkiYI/ErxgL1gz7FdqBMoTfKR2vQWQargTX5g2a412ISkQwsBK40RRXoMyXGjedaJzjyvKdqG2BAu2xZWe2YbD/7qaHESWAcE8JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746604576; c=relaxed/relaxed;
	bh=JcQmMXNVSlii7PXek34Y/lx8uJAyMcBAejqngOH419Y=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=YaJPdwmrTL5OLIT6bzFfVpe02izgnh7wgDmMmvJ/CJifIrPC48E284hh+aONj3gY6ae3x/PMlNocwkCrVgxaX6dwdNiagvyHfx8NmQaFSBRdn9Xdk+5SfSCcCGFLP8rzSE96++B8fz4HVV6tNOpzBY1LeBh1IDBUpaoWIe3tbRz57MfZ3HjrPSOjuVxf0s7/3ETQ5j8azpAIk9I4qESNVHyGtVxfHx602Vj1vRvgCIeQNe0MFEx+rJiJFGXGqKJSp7Q+TnN+CigF4EubKF4BtX5LrgkQDdouFhv+t/ZBgSEypjeg0G7zxQWg/daHRr1LHd/al/uZ/RCl112QZD3QlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bzzt.net; dkim=pass (2048-bit key; unprotected) header.d=bzzt.net header.i=@bzzt.net header.a=rsa-sha256 header.s=fm1 header.b=m6ixM4t0; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kZA4fxjI; dkim-atps=neutral; spf=pass (client-ip=103.168.172.159; helo=fhigh-a8-smtp.messagingengine.com; envelope-from=arnout@bzzt.net; receiver=lists.ozlabs.org) smtp.mailfrom=bzzt.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bzzt.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bzzt.net header.i=@bzzt.net header.a=rsa-sha256 header.s=fm1 header.b=m6ixM4t0;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=kZA4fxjI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bzzt.net (client-ip=103.168.172.159; helo=fhigh-a8-smtp.messagingengine.com; envelope-from=arnout@bzzt.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 412 seconds by postgrey-1.37 at boromir; Wed, 07 May 2025 17:56:14 AEST
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZsndV081rz2xVq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 May 2025 17:56:13 +1000 (AEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B39121140120;
	Wed,  7 May 2025 03:49:18 -0400 (EDT)
Received: from phl-imap-01 ([10.202.2.91])
  by phl-compute-12.internal (MEProxy); Wed, 07 May 2025 03:49:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bzzt.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1746604158;
	 x=1746690558; bh=JcQmMXNVSlii7PXek34Y/lx8uJAyMcBAejqngOH419Y=; b=
	m6ixM4t0Bd5/+Uss2nIYQ1/8T+lGP87Kg95DJvDFeb7DqFU29pVjw++3Li/Ley4k
	ZrzM0BTeOpxvwh0sxNtp1QLtmfEYacvZlaBLB36B/w5i+GcjjskXQ0NzqZ/J8mTP
	0YaZMKdN2faVUFAATg5ZwGTmea9qyr9RUA6YVKZsk0Ynsui8h881co/aN0ZXJuwi
	5Sj7qnbnfM/R3UdL8fSmn+rvlyKNZHlus1rZIwTZiL7RBtLT9PzGjn64VYzcfQcL
	K31sNpaJp+rsMDYUDKWzrVzvYvr+Orkj6MVMJBYkLw1cNBnaMgMmUWIW90Mo1Pz8
	Th8btXk/wU2H3HrP1aEw3A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746604158; x=
	1746690558; bh=JcQmMXNVSlii7PXek34Y/lx8uJAyMcBAejqngOH419Y=; b=k
	ZA4fxjIvrDac2vbflfR/MW94tnMJZme863HxGuBbuLxnJnRgxnFSpP9pmL1bJ6Hn
	GwrmAA0bCs013xnar98UKcdvEKlDyOMViA6Ll+6K0qq4GehsaoV25FXc095wkrfm
	ARJbKlcWT+oSnf3JFc/90YW82bEOsZ6Q05NtJirhJsI2n6diyAXIfLOztBgceqlv
	zMCw/UOhobb+tlAbOVIkP5KjU91f+R/jwFvELLUZ2kIUna7Kr57xbbWw1Lc+YFNc
	9GdUEF5rtofNpvc0UeGxakfKT3O5BroTxokSKGbhNBCPSe8rxTVj1ZDoNivbyC0a
	E10rzrUGPhBZWCiPGqFFA==
X-ME-Sender: <xms:ehAbaFqS2VNSdrrCBKfKPArS0Gqyyqv5CLshf_qm6RWOqC7P6yzTdQ>
    <xme:ehAbaHpIDmwdOxMLOentJK9Nd5ZQ-GbYT2KYBTe9j5pBuLP1Z84rJCkZnNpuwkFU1
    MvZkTrEA8H9ukbh2wc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeeifedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhhouhhtucfgnhhgvghlvghnfdcuoegrrhhnohhuthessg
    iiiihtrdhnvghtqeenucggtffrrghtthgvrhhnpeefgefgfeektdefkeeludetteefkeef
    ffdvkeeujeegveethfdthfffjedvgedtueenucffohhmrghinhepkhgvrhhnvghlrdhorh
    hgpdguvggsihgrnhdrohhrghdpvghnghgvlhgvnhdrvghunecuvehluhhsthgvrhfuihii
    vgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhhouhhtsegsiiiithdrnhgvth
    dpnhgspghrtghpthhtohepfeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehk
    phgthihrugesrghrtghhlhhinhhugidrohhrghdprhgtphhtthhopegrrhhnugesrghrnh
    gusgdruggvpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhho
    uhhprdgvuhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtph
    htthhopegumhhithhrhidrkhgrshgrthhkihhnsehgmhgrihhlrdgtohhmpdhrtghpthht
    ohepmhgtrghjuhelheesghhmrghilhdrtghomhdprhgtphhtthhopehnphhighhgihhnse
    hgmhgrihhlrdgtohhmpdhrtghpthhtohepshgrmhhithholhhvrghnvghnsehgohhoghhl
    vgdrtghomhdprhgtphhtthhopehsvghrghgvsehhrghllhihnhdrtghomh
X-ME-Proxy: <xmx:ehAbaCPQCmtU0_XRz8-vmJUTunODN6LJ5XAJdUQXl8MZC_JaCjxFOg>
    <xmx:ehAbaA59wckYPtLYhTZVffPcvxO_BZijemUeXnd5cHTnWqBB3GWO6g>
    <xmx:ehAbaE6X6GZm-X-h7CHtIj_tqXHUMbSzEVEZwOfDgLuZu2J5RbipmQ>
    <xmx:ehAbaIgcx2n28RoC1hGQYgUotGxNuE0nTYRb07t4aUhf_rREVRpkqQ>
    <xmx:fhAbaPRdhTA1xuKM3DUYaFI8sfLgbhVSaXODaU-UBjVBXGPdpqtaF29z>
Feedback-ID: i8a1146c4:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 74285336007C; Wed,  7 May 2025 03:49:14 -0400 (EDT)
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
X-ThreadId: T5f9a5891fefab612
Date: Wed, 07 May 2025 09:47:23 +0200
From: "Arnout Engelen" <arnout@bzzt.net>
To: "James Bottomley" <James.Bottomley@hansenpartnership.com>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Nathan Chancellor" <nathan@kernel.org>, "Arnd Bergmann" <arnd@arndb.de>,
 "Luis Chamberlain" <mcgrof@kernel.org>,
 "Petr Pavlu" <petr.pavlu@suse.com>,
 "Sami Tolvanen" <samitolvanen@google.com>,
 "Daniel Gomez" <da.gomez@samsung.com>,
 "Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>, "Jonathan Corbet" <corbet@lwn.net>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>, "Mimi Zohar" <zohar@linux.ibm.com>,
 "Roberto Sassu" <roberto.sassu@huawei.com>,
 "Dmitry Kasatkin" <dmitry.kasatkin@gmail.com>,
 "Eric Snowberg" <eric.snowberg@oracle.com>,
 "Nicolas Schier" <nicolas.schier@linux.dev>,
 =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <f.gruenbichler@proxmox.com>,
 "Mattia Rizzolo" <mattia@mapreri.org>, kpcyrd <kpcyrd@archlinux.org>,
 "Christian Heusel" <christian@heusel.eu>,
 =?UTF-8?Q?C=C3=A2ju_Mihai-Drosi?= <mcaju95@gmail.com>,
 linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-modules@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Message-Id: <6615efdc-3a84-4f1c-8a93-d7333bee0711@app.fastmail.com>
In-Reply-To: 
 <2413d57aee6d808177024e3a88aaf61e14f9ddf4.camel@HansenPartnership.com>
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
 <f1dca9daa01d0d2432c12ecabede3fa1389b1d29.camel@HansenPartnership.com>
 <840b0334-71e4-45b1-80b0-e883586ba05c@t-8ch.de>
 <b586e946c8514cecde65f98de8e19eb276c09703.camel@HansenPartnership.com>
 <072b392f-8122-4e4f-9a94-700dadcc0529@app.fastmail.com>
 <2413d57aee6d808177024e3a88aaf61e14f9ddf4.camel@HansenPartnership.com>
Subject: Re: [PATCH v3 0/9] module: Introduce hash-based integrity checking
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, May 6, 2025, at 15:24, James Bottomley wrote:
> I'll repeat the key point again: all modern hermetic build systems come
> with provenance which is usually a signature.

I'm not sure the 'hermetic build' parallel is so applicable here: typically a
hermetic build will produce an artifact and a signature, and when you embed
that result in a larger aggregate, you only embed the artifact (not the
signature) and sign the aggregate. With module signatures, the module *and*
their signatures are embedded in the aggregate (e.g. ISO, disk image), which is
where (at least in my case) the friction comes from.

> Plus, you've got to remember that a signature is a cryptographic
> function of the hash over the build minus the signature.  You can't
> verify a signature unless you know how to get the build minus the
> signature.  So the process is required to be deterministic.

Right: there is no friction validating the module signatures, that is fine.
There is friction validating the aggregate artifact (e.g. ISO, disk image),
though, because of those signatures embedded into it.

As you mentioned earlier, of course this is *possible* to do (for example by
adding the signatures as inputs to the second 'independent' build or by
creating a hard-to-validate 'check recipe' running the build in reverse).
Still, checking modules at run time by hash instead of by signature would be a
much simpler option for such scenario's.

> > > All current secure build processes (hermetic builds, SLSA and the
> > > like) are requiring output provenance (i.e. signed artifacts).  If
> > > you try to stand like Canute against this tide saying "no signed
> > > builds", you're simply opposing progress for the sake of it
> > 
> > I don't think anyone is saying 'no signed builds', but we'd enjoy
> > being able to keep the signatures as detached metadata instead of
> > having to embed them into the 'actual' artifacts.
> 
> We had this debate about 15 years ago when Debian first started
> reproducible builds for the kernel.  Their initial approach was
> detached module signatures.  This was the original patch set:
> 
> https://lore.kernel.org/linux-modules/20160405001611.GJ21187@decadent.org.uk/
> 
> And this is the reason why Debian abandoned it:
> 
> https://lists.debian.org/debian-kernel/2016/05/msg00384.html

That is interesting history, thanks for digging that up. Of the 2 problems Ben
mentions running into there, '1' does not seem universal (I think this feature
is indeed mainly interesting for systems where you don't _want_ anyone to be
able to load locally-built modules), and '2' is a problem that detached
signatures have but module hashes don't have.

> The specific problem is why detached signatures are almost always a
> problem: after a period of time, particularly if the process for
> creating updated artifacts gets repeated often matching the output to
> the right signature becomes increasingly error prone.

I haven't experienced that issue with the module hashes yet.

> Debian was, however, kind enough to attach what they currently do to
> get reproducible builds to the kernel documentation:
> 
> https://docs.kernel.org/kbuild/reproducible-builds.html

Cool, I was aware of that page but didn't know it was initially contributed by
Debian.

> However, if you want to detach the module signatures for packaging, so
> the modules can go in a reproducible section and the signatures
> elsewhere, then I think we could accommodate that (the output of the
> build is actually unsigned modules, they just get signed on install).

At least I don't really come to this from the packaging perspective, but from
the "building an independently verifiable ISO/disk image" perspective.
Separating the modules and the signatures into separate packages doesn't help
me there, since they'd still both need to be present on the image.


Kind regards,

-- 
Arnout Engelen
Engelen Open Source
https://engelen.eu

