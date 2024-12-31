Return-Path: <linuxppc-dev+bounces-4544-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 645859FEEB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Dec 2024 11:31:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YMq4t3H8sz2yRc;
	Tue, 31 Dec 2024 21:31:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735641070;
	cv=none; b=EFjjLcXM1lLBJ3K7fvjuHIjD+4zz92A/5zxAC4NBH9k6X+bpAFMs+AbxEpi66s79XepUJHcBp+SNGdCrP9DS5ni95sTpnvhnyWSZ8C7kCSH2JvM/cmfSukQkA1G7mGduvWiyJIgqlW43q4Z3Xal46iT3qhHikAyWHyi/KDYr/ko5SBcoqc3Hk+Clg0eUHsoraye6ykSPacYhGGaW7WaWbtg3e0lWw3CAJqJ/L44tKtys2hI9EeE3LcNNnUWJXCONqh9AK7+ENiTI24h04QRZIxcsDVhdVutNoDtus6+1r/5+eIS/ct0Wg/isnxw41+l+8CpKvn9eP0IJdDQnw66f4w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735641070; c=relaxed/relaxed;
	bh=wFldJZG4JoLWgf9yTijyV0byjaEeQbF5srsLFpZOp4w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EhuKVPQyAiBI4DqkA7wMDLqeQwn4SwOhMrsHR/+SweBoG2gkT0WAOAO690UrFD8Jrb+45SOKoVrGZzMYAf9PVFUYvlX6BoMaHmrjNh6rH2k/Nlz/QKmLdkPqQSj0Dn9kQJMiIKc8ZNIx66h+2LtIJsd/MxUiFZzDJ3s8G0d5Y3TIXsH13EOhowKxwrnCh4MMLwGhDtQhtpQ2TM/Od3bWgQLg8IjD0mM0tDd26qJa9Xnr9KF6gYk8+itJP9TP3PKoKwc0xfyA+m6guAeMd0zDAs2KwJ18vssj8vQboiw90pHD1sK7wRPVTlYcyUbKXHOJtInBpzVzPQ17mSWCcya1Xg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=UEC2ZwhD; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=UEC2ZwhD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YMq4m5mrGz2yNH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Dec 2024 21:30:57 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1735641050;
	bh=4WpB7p6ZcZfKydZjt9Pw6SFgQmWRdOIiB6z20vQcdqg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEC2ZwhDxV5XTXZrc9RSUrw990XCjxNtuzV1rt4h9taux0InFTexNqNvKISUQnu9M
	 ANQRa+jNB+4qFDnWpi4a4kRn2pMBslONPxV4D4jq32v+cuC03aKz2cIlMx2ocJ1GXg
	 MS+kr7jeBlqxCdj2D+xwmyVbnKSSvy+11GntmUOI=
Date: Tue, 31 Dec 2024 11:30:50 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, 
	Hao Luo <haoluo@google.com>, Jiri Olsa <jolsa@kernel.org>, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-modules@vger.kernel.org, bpf <bpf@vger.kernel.org>
Subject: Re: [PATCH v2 0/3] sysfs: constify bin_attribute argument of
 sysfs_bin_attr_simple_read()
Message-ID: <0cbfd352-ee3b-4670-afae-8e56d888e8c3@t-8ch.de>
References: <20241228-sysfs-const-bin_attr-simple-v2-0-7c6f3f1767a3@weissschuh.net>
 <CAADnVQ+E0z8mY4BF9qamPh1XV9qs2jZ03bfYz2tVw8E4nFVWBw@mail.gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQ+E0z8mY4BF9qamPh1XV9qs2jZ03bfYz2tVw8E4nFVWBw@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2024-12-30 16:50:41-0800, Alexei Starovoitov wrote:
> On Sat, Dec 28, 2024 at 12:43 AM Thomas Weißschuh <linux@weissschuh.net> wrote:
> >
> > Most users use this function through the BIN_ATTR_SIMPLE* macros,
> > they can handle the switch transparently.
> >
> > This series is meant to be merged through the driver core tree.
> 
> hmm. why?

Patch 1 changes the signature of sysfs_bin_attr_simple_read().
Before patch 1 sysfs_bin_attr_simple_read() needs to be assigned to the
callback member .read, after patch 1 it's .read_new.
(Both callbacks work exactly the same, except for their signature,
.read_new is only a transition mechanism and will go away again)

> I'd rather take patches 2 and 3 into bpf-next to avoid
> potential conflicts.
> Patch 1 looks orthogonal and independent.

If you pick up 2 and 3 through bpf-next you would need to adapt these
assignments. As soon as both patch 1 and the modified 2 and 3 hit
Linus' tree, the build would break due to mismatches function pointers.
(Casting function pointers to avoid the mismatch will blow up with KCFI)
Of course Linus can fix this up easily, but it somebody would need to
keep track of it and I wanted to avoid manual intervention.
Or we spread out both parts over two development cycles; maybe Greg can
even pick up patch 1 late in the 6.13 cycle.

Personally I am fine with any approach.

