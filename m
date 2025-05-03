Return-Path: <linuxppc-dev+bounces-8267-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61639AA80A2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 May 2025 14:13:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZqRWm6pdmz2xpn;
	Sat,  3 May 2025 22:13:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.145
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746261072;
	cv=none; b=eY2kAQDIxxgBITPX3DrUS19JvX6+8hsruO3sov1OV/U1bslk1KWzjePaMTCLxMZ8KGuK5kd+RX5yb1q59Vx8d4SyqwgeG7HaaUW9Qy3HwGJOvtnH5r8/CI8/YU1kR5Mxr1X9WfrHWr1uSIUrI2MJiSOeHovT9NjQjY3sWmiSuBr5YL+HKpfH0Di5W3TbwaOBNkQdH8owJ5Qbayncfchn+itMq3DkwAqERPmftMo1Eh05IS8zj1uZm9GN+XfwpYiU/c5+eAllzX3Nqj4Xr6tJLK8fDPS7BX+Rjg+osZDjV5UHxiDGKfxGut+4d8239JKsgPBAndNWtHb1z47SSQVd7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746261072; c=relaxed/relaxed;
	bh=YbA3t4O0ws4/G+0KLAK9b+z79wK2zrxCaAB1nZbeZZ0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KizBh+Hoj/ZdbED481EW69g/Wn048Fl61xQ2gnYNvyUAvhi8TzgYsy0qcOh/b/XjydCbD50aMg+Rw7yaSrbXEcIKfTOkRRXPbEf5z/6vmsjhwTfFgoW4kXdYEJFiYtJObAzv3zOlRmQF0H2CAviW0VfSrJrxqjBhfQRM/uZNOY02ifEDlSHPhHuGBOobS02tAFI6kH4+2FkfL9RvXwuxuBBthWrWyIeDS4vNjxoM5Am148aK3UmN7vU9VfjxlRq0Q8SnpuSL5dq2Eo/NK5mIzhpat/Sy9s0oANBzlO1rFZRokE9gaM+lrx+JWOtFmMiimh5VlwTjt+5MlDiQWUD2xA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bzzt.net; dkim=pass (2048-bit key; unprotected) header.d=bzzt.net header.i=@bzzt.net header.a=rsa-sha256 header.s=fm1 header.b=aJJGaPF7; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=PvTjBSuG; dkim-atps=neutral; spf=pass (client-ip=202.12.124.145; helo=fout-b2-smtp.messagingengine.com; envelope-from=arnout@bzzt.net; receiver=lists.ozlabs.org) smtp.mailfrom=bzzt.net
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=bzzt.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bzzt.net header.i=@bzzt.net header.a=rsa-sha256 header.s=fm1 header.b=aJJGaPF7;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=PvTjBSuG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bzzt.net (client-ip=202.12.124.145; helo=fout-b2-smtp.messagingengine.com; envelope-from=arnout@bzzt.net; receiver=lists.ozlabs.org)
X-Greylist: delayed 654 seconds by postgrey-1.37 at boromir; Sat, 03 May 2025 18:31:09 AEST
Received: from fout-b2-smtp.messagingengine.com (fout-b2-smtp.messagingengine.com [202.12.124.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZqLbd5DGdz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 May 2025 18:31:09 +1000 (AEST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfout.stl.internal (Postfix) with ESMTP id 1101E114021A;
	Sat,  3 May 2025 04:20:09 -0400 (EDT)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-12.internal (MEProxy); Sat, 03 May 2025 04:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bzzt.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1746260408;
	 x=1746346808; bh=YbA3t4O0ws4/G+0KLAK9b+z79wK2zrxCaAB1nZbeZZ0=; b=
	aJJGaPF7fdUue464isXL5YmMzDuzeFfRcAA0wKMSkLP3aWuphivhrsMgBEmQ16I2
	skXiyG8jkumDkHl+mZZzMdJndgcwm+Cb3kJK98qzJXanfLWONNqF4dVlWxqPFdQQ
	W0D6JkvUXbZn03VRDfp/I8FVtPWo3OA/8bA49qoEzGBglpJ4rsE/h7mBPJKLCxXM
	sR/9kFCYPSZETFkF2nVQPwE18X9Wy+r4lIegqls9GrzZMMDqYaJNfjXjqt5MchZX
	ykwUvI27vV/f+G311ataVt1xXxVZ+zQrJa1RbndlWkC3rKpEfVW54gRrbQMn7g69
	VVSWGItUEr+2kfBSSe7v8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1746260408; x=
	1746346808; bh=YbA3t4O0ws4/G+0KLAK9b+z79wK2zrxCaAB1nZbeZZ0=; b=P
	vTjBSuGdzuqTgkEwHI7dqZD+5GNb2UZMjiQXrZxUj+KPQWFKz2uzV77mBvOsvlkn
	GNp2LQytg4kaoczzpI0s0PlIlKwdyduqKEuzeIN0LINtPkRutw+fPqJEUi4IEKcb
	5pivJlpAj1m4j1aiwsq2KlwqdcT91xGe2vfrmRHJ34p2dMWqsldTrtCuaiijiIf4
	7pEiPH26wm4bKV+E5GwKThV16eXfotsLRPbG1k05dXshvxe13DYGwYqlAh242npy
	nm8p3SUpDJf17MZ8VWn6hHP8YHVhBdIpRuKwJRj9fQKWcu0UXQqWdUty1jldaH+r
	zRKi/IzQFC6cV3CQJfidA==
X-ME-Sender: <xms:ttEVaEN4-c5CykjET8U5O4qfKyTV82EMPzDgpH2MlURIPXOAshWuHQ>
    <xme:ttEVaK-C_oGDdo2dol2NikafdeZphPbK8hFlqLLBGxjN_pxkv6E4eZ8VtdyM9X-5G
    ZM9fDAGjRQU4U9zEl8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeegkeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertder
    tdejnecuhfhrohhmpedftehrnhhouhhtucfgnhhgvghlvghnfdcuoegrrhhnohhuthessg
    iiiihtrdhnvghtqeenucggtffrrghtthgvrhhnpefhveeiffelkeffueelteevieekudev
    hffggfduledvveehjeefudehueeftdeuleenucevlhhushhtvghrufhiiigvpedtnecurf
    grrhgrmhepmhgrihhlfhhrohhmpegrrhhnohhuthessgiiiihtrdhnvghtpdhnsggprhgt
    phhtthhopeefiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepkhhptgihrhguse
    grrhgthhhlihhnuhigrdhorhhgpdhrtghpthhtoheprghrnhgusegrrhhnuggsrdguvgdp
    rhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupd
    hrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohepughm
    ihhtrhihrdhkrghsrghtkhhinhesghhmrghilhdrtghomhdprhgtphhtthhopehmtggrjh
    huleehsehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdr
    tghomhdprhgtphhtthhopehsrghmihhtohhlvhgrnhgvnhesghhoohhglhgvrdgtohhmpd
    hrtghpthhtohepshgvrhhgvgeshhgrlhhlhihnrdgtohhm
X-ME-Proxy: <xmx:ttEVaLQ2ezVd3AW0DYeyq3k6apNlWDSIcWbME8z6FnOLP3G_KDW0Yw>
    <xmx:ttEVaMtub0N_YcTjSA4MOhIRPEB4-BfDE-ToKHFozzMoZKmSOiCF_Q>
    <xmx:ttEVaMdSZD0ig7FBV4fV5-yZ-4GcriyyGU9CrVB2S7iW8BBUcqRbhA>
    <xmx:ttEVaA2lcKj49OvnrUhp08UM0Y0_8cPbeijTalhUCJzz_-9ZtIpxnA>
    <xmx:uNEVaLWpRs2Cg5vusRl9jLRByoYl2wtuESQCRNFl3-PEemUef6AhZDxG>
Feedback-ID: i8a1146c4:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 57EA118A006B; Sat,  3 May 2025 04:20:06 -0400 (EDT)
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
Date: Sat, 03 May 2025 10:19:17 +0200
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
Message-Id: <072b392f-8122-4e4f-9a94-700dadcc0529@app.fastmail.com>
In-Reply-To: 
 <b586e946c8514cecde65f98de8e19eb276c09703.camel@HansenPartnership.com>
References: <20250429-module-hashes-v3-0-00e9258def9e@weissschuh.net>
 <f1dca9daa01d0d2432c12ecabede3fa1389b1d29.camel@HansenPartnership.com>
 <840b0334-71e4-45b1-80b0-e883586ba05c@t-8ch.de>
 <b586e946c8514cecde65f98de8e19eb276c09703.camel@HansenPartnership.com>
Subject: Re: [PATCH v3 0/9] module: Introduce hash-based integrity checking
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 2, 2025, at 15:30, James Bottomley wrote:
> On Fri, 2025-05-02 at 08:53 +0200, Thomas Wei=C3=9Fschuh wrote:
> > Specifically the output of any party can recreate bit-by-bit
> > identical copies of all specified artifacta previous build (the
> > public key, module signatures) is not available during the rebuild or
> > verification.
>=20
> You just strip the signatures before verifying reproducibility.

If the goal is: "verify the Linux Kernel is reproducible", that could wo=
rk.
It gets increasingly cumbersome when you're trying to check the reproduc=
ibility
of some larger artifact that embeds the Linux kernel (and lots of other =
stuff),
like an ISO or disk image, though: you'd have to unpack/mount it, check =
all its
contents individually (perhaps recursively), and strip signatures in 'ju=
st the
right places'.

Writing such tooling is a chore, but of course feasible: diffoscope alre=
ady
comes a long way (though checking large images may take some resources).=
 The
problem is trusting such tooling: instead of 'simply' checking the image=
s are
identical, suddenly I now have to convince myself there's no shenanigans
possible in the disk image interpretation and other check tooling, which=
 gets
nontrivial fast.

> All current secure
> build processes (hermetic builds, SLSA and the like) are requiring
> output provenance (i.e. signed artifacts).  If you try to stand like
> Canute against this tide saying "no signed builds", you're simply
> opposing progress for the sake of it

I don't think anyone is saying 'no signed builds', but we'd enjoy being =
able to
keep the signatures as detached metadata instead of having to embed them=
 into
the 'actual' artifacts.


Kind regards,

Arnout

