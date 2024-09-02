Return-Path: <linuxppc-dev+bounces-865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB7D1968461
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 12:16:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wy4R52pWgz2xsd;
	Mon,  2 Sep 2024 20:16:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725272177;
	cv=none; b=J+kxleiZUaqjlfiW/kXi+vnbePPSCx5jtKZFnugS+/zqH7V02T5qUZ0dgehuoLCEpMU/yswGzyT38U6myPxliXENoEDmpk5tDmvhIyqEFXk/4LUUZVeBerH1m6VcVoBGQyYh2s+kbK47hCDAdQVG0qkFKyS8az7giaDfYEM5mg21TYkPtJ+Mr/4Fuk+68SB8geBT80MJRZODzvPVDKY8WgDoc/Qp9m1ZkYPHuSZESzNK5DCVDr1Vk5Omup/0UMtBEkKNIo6rXvpnkEXyFbuysP8JFyGqgO3b9hQhVrgyV4OlkpC6euhsW3R6Hay292fvXG6kj11HJpYOU/z7RjLyHg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725272177; c=relaxed/relaxed;
	bh=3RNolP0Fo/GSx4B9IVA751JpgSB5qu66Jzzq2ZzhW5o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=KG/RLmnRsufjE/tyTC4yur5S4wvGgrhwB6l/kDjieF8RWVU1S5rhYLo+sEWE2r7umEzDeH8yIyqLf+A6KUQZHTRozqxm8p0dmwLSnEJhEZMnixq9nHUVvwu3KxRAETkgZ6J7hstz71wqyu2YIAGGn05061PwIU9heCQUVgUUaGXk+KiouEuEw04v5MTfRGsBPftz+HDwO54J3NFMGe7tVLMoszKPmm08qALIoxOuGyXavDjNICnPhp4HMIQ/nCSXXVx0M7bR5V1T6lULTFJz7B+ZNfR1Dha6raqi7IKZb230PnepIDoKKftN7TtXJkpGBuQ05z684wHlRXNHgrV6TA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=eswqT4+k; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=e+ExLf/f; dkim-atps=neutral; spf=pass (client-ip=103.168.172.147; helo=fout4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=eswqT4+k;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=e+ExLf/f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.147; helo=fout4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout4-smtp.messagingengine.com (fout4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wy4R2088Vz2xZY
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Sep 2024 20:16:12 +1000 (AEST)
Received: from phl-compute-04.internal (phl-compute-04.nyi.internal [10.202.2.44])
	by mailfout.nyi.internal (Postfix) with ESMTP id C92021380366;
	Mon,  2 Sep 2024 06:16:08 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-04.internal (MEProxy); Mon, 02 Sep 2024 06:16:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1725272168;
	 x=1725358568; bh=3RNolP0Fo/GSx4B9IVA751JpgSB5qu66Jzzq2ZzhW5o=; b=
	eswqT4+kmM9y1ZYn3In9gFzhOS2csprktMPRjMHRe/gaK25CIc6SgXNQXTjo8Wa6
	jXmC2wkMn5BtLXhHHt+6xNogKhOvkO6AUAAQsOiZ5nssDIiVYzdakHa1x3rAXl22
	bA6DTspqAz53Dbl3SKNjf3fhn11sxjtMBBF8qwOgJSlx6gwpf3l/00PfOudUyJOD
	N62jErUHi3spuhKABZyv4uKFCZBOYePT+vLDideOnSkYH+nNZOzQf8QERsYm6/6z
	YF7vX2u6krQg9HJA5XgZqsVLNWLBbghGXpmwlSBbjEplONaJyCuC2nYppHf3OXi4
	lAANex0FtnYzPfx47tLLYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725272168; x=
	1725358568; bh=3RNolP0Fo/GSx4B9IVA751JpgSB5qu66Jzzq2ZzhW5o=; b=e
	+ExLf/fMAWshxJVvPU1X5yEAdOHmK9hNB/yqQ8kxmmyTLD9dpvXsUA9mt0wMpRBR
	B4QmKgK8Egjn6RxhnaL9URjmo66lCeEnwLLsEHmsPXIR9lQkQZswPrb+GbLyEjuF
	T/AfVyywjsTrFM2lQfzFag0I4DWVjbAmEBviZeeD/1S4bL4HjqWmvpSvxnTg2JuF
	EdUYQvyhYVV3hAgINmXuKz44cQ4sIJoRa6lzwNVOaFk/fDzVtQypNHdmKQYbYivV
	cvdU2uxnoM5IrJAEqai7L6UtWdV2Ib/lph2qViDl4WnAp22ysWUbQYIqXRWkJMd5
	rPYDYkIKoWfAPwGkXPK5w==
X-ME-Sender: <xms:aJDVZm5k9mjxtlOIpXK9ChinEhWo609Ro2nvgiHoILV06Mjeyy7MiQ>
    <xme:aJDVZv6ygVCfotEnPBexS1EfrO2vKvnkwttQLJ1F-hEwbxrbra3n1coDUtGzwHpAa
    p2_qaojohSkRvOwirg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudehfedgvdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhepudeffeetfeekveffkeeuheffteevuefhvdeuteeg
    udfghefhffehffejhfdugeeinecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrh
    hnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepjedpmhhouggvpe
    hsmhhtphhouhhtpdhrtghpthhtohephhgvrhhvvgdrtghoughinhgrsegsohhothhlihhn
    rdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouh
    hprdgvuhdprhgtphhtthhopehsohgtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegs
    rgholhhurdhluheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehlihhnuh
    igqdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgpd
    hrtghpthhtohepgihirgholhgvihdrfigrnhhgseifihhnughrihhvvghrrdgtohhm
X-ME-Proxy: <xmx:aJDVZlfCkQv5YD1df9WF3UxV8-73LSebwlij2g30dyCjtygfi9GwJw>
    <xmx:aJDVZjJVwcDSlCvpIjUMNajK4iw7UrvwyBsL1SfT0JoBDGE-8E5TBg>
    <xmx:aJDVZqL2N-eo5zr8upQI_c6H1_jYkgDdHfM34Vxk1I5Srhf9VL9Kxw>
    <xmx:aJDVZkwrqBQecRS2uMx6CwFSTma0df7hJs2WjIA-zQ6hHauyqYgw7g>
    <xmx:aJDVZrr41cGF5Hg3e63WAQOgDseqUDR6ogJbcjhun26z1kfb7FSYBlGZ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 471F92220087; Mon,  2 Sep 2024 06:16:08 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Date: Mon, 02 Sep 2024 10:15:34 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, soc@kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
Cc: "Herve Codina" <herve.codina@bootlin.com>,
 "Xiaolei Wang" <xiaolei.wang@windriver.com>,
 "Baolu Lu" <baolu.lu@linux.intel.com>
Message-Id: <cc725b99-12f3-4476-948c-8b00af563dfd@app.fastmail.com>
In-Reply-To: <dfafbd92-1e61-4e80-aa5c-2bfbe1defbeb@csgroup.eu>
References: <dfafbd92-1e61-4e80-aa5c-2bfbe1defbeb@csgroup.eu>
Subject: Re: [GIT PULL] SOC FSL for 6.12
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2024, at 13:44, Christophe Leroy wrote:
> Hi Arnd,
>
> Please pull the following Freescale Soc Drivers changes for 6.12:
> - A series from Herv=C3=A9 Codina that bring support for the newer ver=
sion of=20
> QMC (QUICC Multi-channel Controller) and TSA (Time Slots Assigner) fou=
nd=20
> on MPC 83xx micro-controllers.
> - Misc changes for qbman freescale drivers
>
> There are no conflicts with latest linux-next tree.

Hi Christophe,

I've tried pulling this but ran into a few issues here, none of which
are related to the actual patches in your branch that look totally
fine to me:

> The following changes since commit 5be63fc19fcaa4c236b307420483578a569=
86a37:
>
>    Linux 6.11-rc5 (2024-08-25 19:07:11 +1200)
>
> are available in the Git repository at:
>
>    https://github.com/chleroy/linux.git tags/soc_fsl-6.12-1
>
> for you to fetch changes up to 1fe683bf6113da3cb694bc18ae655b2ee10ba39=
3:
>
>    Merge branch 'support-for-quicc-engine-tsa-and-qmc' (2024-08-25=20
> 20:48:47 +0200)

- There is no tag description in here, which would give me an empty
  changelog text for the merge commit, or force me to summarize your
  contents myself. Please describe the contents of your branch in a coup=
le
  of short paragraphs, in a way that helps me and future readers of
  the changelog understand what kind of work is being done. Don't
  repeat the oneline commit messages of the individual patches though,
  as they show up right under your summary anyway.

- You have not signed the tag, so there is no way for me to verify that
  you are actually the person that uploaded the branch. Ideally this
  should be signed with a gpg key that is on the kernel keyring, but
  even a brand new key is better than nothing because that way I can
  at least check that your next pull requests are signed by the same
  account as this one. Since you use a github.com account, this is
  even more important, as I can't easily see if you are the only person
  that is able to push to the github user 'chleroy'.
  Using a git tree on either git.kernel.org or your own domain would
  be ideal here, but github works if that is all you can easily do.

- My branch is based on 6.11-rc4, while your tag is on top of 6.11-rc5,
  so pulling it into my tree would require a backmerge that I try to
  avoid (it shows up when Linus pulls from me). Please rebase on
  an earlier -rc, ideally 6.11-rc1 unless you have a reason to need
  something later.

- Please add the linux-arm-kernel and powerpc mailing lists to cc
  for the pull request, so the PR gets properly archived. I saw this
  was missing because I could not apply it using

    b4 pr dfafbd92-1e61-4e80-aa5c-2bfbe1defbeb@csgroup.eu

  This command failed as none of the mailing list archives have
  your message ID.

Please resend with all of the above changed.

       Arnd

