Return-Path: <linuxppc-dev+bounces-17242-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qJmEIFQfoGmzfgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17242-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 11:24:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 498EE1A4305
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 11:24:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM6y56Pcsz2yFd;
	Thu, 26 Feb 2026 21:24:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772101453;
	cv=none; b=Jq46ni1o1t/flllVA15l3v5Bn2pbD1jhkA2S6eFCu9+WjRnrCG6TLvm5/nhMsUCVkLfEA/luWMov1bUSab1Lh5MHXESlICGlLmD9Wr6m71XLP2b/yL2pwn2ObqAmmT06hL1lRtirjwekjfCYj8z74lFGlVU3UEpv0MNweh0xOK4JO/JKPbQNUJ1Pl41D702Eksx3Dxv7LmhpyN9LxEoDsYgG8Fsvoz48zwJ0RBzUn13pWCfjSDWReilBC6lKTqT9vUcCCSxoiMwTyRClmRK555HGo+PWEHBXm8/a39Js0cQj2D8xtein3DHIno7hhO1MyCdsMQGvIvl0aw3peuh+2g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772101453; c=relaxed/relaxed;
	bh=sm64a9O9rK4Ai47DZclEUW07jSoi+FnNST7teOkGChg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kny4kIxsNKuNilQk2c3BcueMc+plymeRZeYd7Lw6g1GibW7lhaCHzLusW6q90MBjGXHSbb8Zf+tQ8YRuq5ZWF5v3iOWDhCcMjaH1WvdeOeAEwnrJe3HMA5UnfsICETHxvB2b7PUBRgeWivAQIArEVuJWIGF41ove91vjx//SJghW76c7BevcMUgNqh2veNzOXZ/na96jlfPnPCE7SxRpHLbpMONzIVaoRyGIGruQTPDw7jRP9QK+kyxbcIqpcTk5u1F0fpS1VgCMDl1AdipLZTt1Ne9+VTG3JuON3xfzbq72MjWm9Fnpr+ISHyTHS4ZAEHXKvHOCF8cOpUkHXxs1Zg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CqBSIZl/; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CqBSIZl/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM6y502m9z2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 21:24:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 9852D600AA;
	Thu, 26 Feb 2026 10:24:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30C68C2BC87;
	Thu, 26 Feb 2026 10:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772101450;
	bh=P8zq4XL1vIHvWaTfBf9OJPokXFV2/Uw/qIckm/L5wQg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=CqBSIZl/P5R11a+PbbwP8EJIEnape46aReEtYeFPGKuQwo6JuYPMOhUf/ivT/NGkB
	 eXMFnYLPc0Qug2v3GAlm2hfMo3AEhaOEyi3ZyF45CWN+wmg1Ytanhv9lAvK+0xMHh2
	 fkBzkKxMEF1f73kx0BbvlVzVwD2esgJecthJePIYctOyCgv1N+vOc4FeretrL+9dwl
	 yPVn11PrBJc5BXMOfxAd+eGXEmJnTZin8RXBEGmytdYJFgR2oDdrICNNK+pUzag+LJ
	 xPKXbyJ9ovIhvsM3RRZ/6Mf5FMQVv2aEgMpd/+fp7PW1VuyAdwBpXIwS3ii8jK7yQ3
	 rJt1fkAYF2yIg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id DD5D3F4006A;
	Thu, 26 Feb 2026 05:24:07 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-01.internal (MEProxy); Thu, 26 Feb 2026 05:24:07 -0500
X-ME-Sender: <xms:Rx-gaXkDrx5pnznR-SNMQS1tYTFTDjDVzc2UVuufzpa3L83PXaWj2A>
    <xme:Rx-gaVoEvkp6raOOwqQWPDa0cH-Ob-gPQix5xIzkuQVQm6h-NQbdzrS1pMcsoN3Ia
    -kZBU3FrMUKRHOIg7YnLpvy204Tr5tobrq5gruzze2vMtko18K1InM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeehjeekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrugcu
    uehivghshhgvuhhvvghlfdcuoegrrhgusgeskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekvdffkefhgfegveekfedtieffhfelgeetiedvieffhfekfeeikeetueeg
    teetteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheprghrugdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqudeijedthedttdejledqfeefvdduieegudehqdgrrhgusgeppe
    hkvghrnhgvlhdrohhrghesfihorhhkohhfrghrugdrtghomhdpnhgspghrtghpthhtohep
    feeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsphesrghlihgvnhekrdguvg
    dprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghp
    thhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohepughmihhtrh
    ihrdhkrghsrghtkhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehnphhighhgihhn
    sehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgvgeshhgrlhhlhihnrdgtohhmpd
    hrtghpthhtoheprhhosggvrhhtohdrshgrshhsuheshhhurgifvghirdgtohhmpdhrtghp
    thhtoheprhhosggvrhhtohdrshgrshhsuheshhhurgifvghitghlohhuugdrtghomhdprh
    gtphhtthhopegurghvvgdrhhgrnhhsvghnsehinhhtvghlrdgtohhm
X-ME-Proxy: <xmx:Rx-gaceSkD7L3hUQ-QIntX5c8SF2UJvuNnlnCMg5x0km8JqIId1NUw>
    <xmx:Rx-gaXnaIY1-tJR3H2eKYjQqxgSwsae5h1FvMCQzz1XTnwkXn4A87w>
    <xmx:Rx-gaWo6YeaJZds-Per8yiexkNYiocIFKlSdVrZEta5R-DmtVqRepA>
    <xmx:Rx-gaU9JdnIBR33acIHa5vRJ_FAVN8423onO6PDBDHqIfNIXMgTbhw>
    <xmx:Rx-gaS0UmRYHqy-FoG7gumIna3Ay9Z737XOXqgkPGLVVt4wqDB4deV7_>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AE587700065; Thu, 26 Feb 2026 05:24:07 -0500 (EST)
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
X-ThreadId: A6OHCiXwHjx-
Date: Thu, 26 Feb 2026 11:23:47 +0100
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Mimi Zohar" <zohar@linux.ibm.com>
Cc: "Coiby Xu" <coxu@redhat.com>, "Dave Hansen" <dave.hansen@intel.com>,
 linux-integrity@vger.kernel.org, "Heiko Carstens" <hca@linux.ibm.com>,
 "Roberto Sassu" <roberto.sassu@huaweicloud.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
 "H . Peter Anvin" <hpa@zytor.com>,
 "Roberto Sassu" <roberto.sassu@huawei.com>,
 "Dmitry Kasatkin" <dmitry.kasatkin@gmail.com>,
 "Eric Snowberg" <eric.snowberg@oracle.com>,
 "Paul Moore" <paul@paul-moore.com>, "James Morris" <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 "Jarkko Sakkinen" <jarkko@kernel.org>,
 "moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)"
 <linux-arm-kernel@lists.infradead.org>,
 "open list" <linux-kernel@vger.kernel.org>,
 "open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)"
 <linuxppc-dev@lists.ozlabs.org>,
 "open list:S390 ARCHITECTURE" <linux-s390@vger.kernel.org>,
 "open list:EXTENSIBLE FIRMWARE INTERFACE (EFI)"
 <linux-efi@vger.kernel.org>,
 "open list:SECURITY SUBSYSTEM" <linux-security-module@vger.kernel.org>,
 "open list:KEYS/KEYRINGS_INTEGRITY" <keyrings@vger.kernel.org>
Message-Id: <2115ea47-9a9f-4718-8531-4a9c2067899b@app.fastmail.com>
In-Reply-To: <ad471c33eeb9e21c49ac81032dc64555a2fb816f.camel@linux.ibm.com>
References: <20260115004328.194142-1-coxu@redhat.com>
 <20260115004328.194142-2-coxu@redhat.com>
 <CAMj1kXFXNo1-pMbo-VZrjQ3TYe1tufebrLr_avL12A0nHMSGnA@mail.gmail.com>
 <8bfa859ed3a4f1cf0db0ab64d8c1c3b24684582a.camel@linux.ibm.com>
 <CAMj1kXHsJNZoUEnbD1y=v4Ftuv9d2c08VckRV7ru4k4P83vZbQ@mail.gmail.com>
 <97b69bc79a5d9246f7a399510908c7b95b2e95e7.camel@linux.ibm.com>
 <CAMj1kXGx4ebaK87W7k0SNUNQnO9+=z1nmYxXC7retmp3OqRRFg@mail.gmail.com>
 <ac5e5e45c12e9b0bda19807e60b06057d74be0b3.camel@linux.ibm.com>
 <aW2i3yacr5TvWU-m@Rk>
 <1a0b6e5601a673a81f8823de0815f92b7afbeb60.camel@linux.ibm.com>
 <CAMj1kXFBMSEdRL8FotASbQO3dcfNG0bpp9Vnm5JPn-yjyDr=GA@mail.gmail.com>
 <ad471c33eeb9e21c49ac81032dc64555a2fb816f.camel@linux.ibm.com>
Subject: Re: [PATCH 1/3] integrity: Make arch_ima_get_secureboot integrity-wide
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.70 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	XM_UA_NO_VERSION(0.01)[];
	TAGGED_FROM(0.00)[bounces-17242-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[app.fastmail.com:mid];
	FORGED_RECIPIENTS(0.00)[m:zohar@linux.ibm.com,m:coxu@redhat.com,m:dave.hansen@intel.com,m:linux-integrity@vger.kernel.org,m:hca@linux.ibm.com,m:roberto.sassu@huaweicloud.com,m:catalin.marinas@arm.com,m:will@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:roberto.sassu@huawei.com,m:dmitry.kasatkin@gmail.com,m:eric.snowberg@oracle.com,m:paul@paul-moore.com,m:jmorris@namei.org,m:serge@hallyn.com,m:jarkko@kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:linux-security-module@vger.kernel.org,m:keyrings@vger.kernel.org,m:dmitrykasatkin@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	FORGED_SENDER(0.00)[ardb@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[redhat.com,intel.com,vger.kernel.org,linux.ibm.com,huaweicloud.com,arm.com,kernel.org,ellerman.id.au,gmail.com,linutronix.de,alien8.de,linux.intel.com,zytor.com,huawei.com,oracle.com,paul-moore.com,namei.org,hallyn.com,lists.infradead.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[ardb@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.991];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 498EE1A4305
X-Rspamd-Action: no action


On Wed, 25 Feb 2026, at 01:03, Mimi Zohar wrote:
> On Wed, 2026-01-21 at 17:25 +0100, Ard Biesheuvel wrote:
>> On Wed, 21 Jan 2026 at 16:41, Mimi Zohar <zohar@linux.ibm.com> wrote:
>> > 
>> > On Mon, 2026-01-19 at 12:04 +0800, Coiby Xu wrote:
>> > 
>> > > diff --git a/security/integrity/ima/Kconfig b/security/integrity/ima/Kconfig
>> > > index 976e75f9b9ba..5dce572192d6 100644
>> > > --- a/security/integrity/ima/Kconfig
>> > > +++ b/security/integrity/ima/Kconfig
>> > > @@ -311,6 +311,7 @@ config IMA_QUEUE_EARLY_BOOT_KEYS
>> > >   config IMA_SECURE_AND_OR_TRUSTED_BOOT
>> > >          bool
>> > >          depends on IMA_ARCH_POLICY
>> > > +       depends on INTEGRITY_SECURE_BOOT
>> > > 
>> > > 
>> > > Another idea is make a tree-wide arch_get_secureboot i.e. to move
>> > > current arch_ima_get_secureboot code to arch-specific secure boot
>> > > implementation. By this way, there will no need for a new Kconfig option
>> > > INTEGRITY_SECURE_BOOT. But I'm not sure if there is any unforeseen
>> > > concern.
>> > 
>> > Originally basing IMA policy on the secure boot mode was an exception.  As long
>> > as making it public isn't an issue any longer, this sounds to me.  Ard, Dave, do
>> > you have any issues with replacing arch_ima_get_secureboot() with
>> > arch_get_secureboot()?
>> 
>> I don't see an issue with that. If there is a legitimate need to
>> determine this even if IMA is not enabled, then this makes sense.
>
> Ard, Dave -
>
> FYI, Coiby posted v3 of this patch set[1], which is queued in the next-
> integrity-testing branch[2].
>
> [1]
> https://lore.kernel.org/linux-integrity/20260213012851.2532722-1-coxu@redhat.com/
>
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git/
>

Ack. Looks fine to me.


