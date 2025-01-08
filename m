Return-Path: <linuxppc-dev+bounces-4865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 024F3A063A7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 18:46:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSwM63kClz30V1;
	Thu,  9 Jan 2025 04:46:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::332"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736358370;
	cv=none; b=darsuSiU1NwZmAvykG0gJ7m2iTsQJHOmHO0oDfBLvAPJvExcTOdooJYld29GOW4F2oET8/2SdkB9wQIiFFADVwBu31ZqkCaQ1TDn7EfTgpBj4BoX5UV+lcsrg47vSbYln6LUvfEsa/VdGjz+D0qpIV/pHHXBwfpJ+1K6ZJ0iOaXpgMKLrdAeDvyGi5kWhQPwTx6zbCJAtYyDjg7mIdLYdvMzibbYLjKNhhI2VPQPPzdk7TOCf9jymwnSIh7E+4sw8gmceExEeE+rMO3oAG6xbHJefOYK8loKyWEqO4U4XLO7S7W3ISILIVuGvmJEyiBOHvf18K5f+PxK95WvNnEv/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736358370; c=relaxed/relaxed;
	bh=CntFd34V+ZehwA1bDAGud6oqD/tsVSgbkgAOGItU+Es=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdtotyngWvk8vtm5f+xp91Mn7iY04eHah8EQJgLN7BZ8iIi0E+H2lR+7AMTbOr8YjoPWaY5ATNplnq9qCFPZaYjCGV3D9MkP0srHLQDP3+jJppmhxaXgYL+teAaDmgfovK/IPPBc9hA4vrFy+lJ1geu6gu/Dm33E8J2BkrEQlCSdL8RQFW4aE6hAfyuBF08avUbip83XB4HyRxL14tJXJ1KD2r6FECXe6rK2SC6O/QJR4Pm43/iEbu1jfWU71r26GErczp+7NUe8kAugQB05SuA5yqbMmWMgoG4uhMCApNaXP8tySU1DH9sP8y79K77P7nqK1Uh0WkPI3NhxnTG4Ag==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C8Ns3Sx1; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=C8Ns3Sx1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::332; helo=mail-wm1-x332.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSwM34fZQz2ydW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2025 04:46:06 +1100 (AEDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-436202dd730so695975e9.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2025 09:46:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736358356; x=1736963156; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CntFd34V+ZehwA1bDAGud6oqD/tsVSgbkgAOGItU+Es=;
        b=C8Ns3Sx1Dd+wBfb+3VRg+T2Tk0WSG6NFRZWGSDL0FXJ7RJbYtbtBt5/CDB/U62DefK
         /16UiIdkUZt6OWX5zJ0JknVO+BceY7OQf/EkcIbdE41UYL9Qmo4GE0kS9p+RLolwRCtg
         eO975w91sbl0N4W7XxUxNkH81wlHXYMl0G/tUa9orueKcjjMnmJADvwaDbIbKda5tbQI
         isXYyRA/ifmHnqnreYrUJW7CHOw2w01iQtBCnv9e5SYd8OhpiIwb4fNIbS9kcvtCCH9n
         BOG4CA3x1rATGVra8HTz1th5HhqXycCWtKDd5bKvodqiqSYLA6JRDxiQ+43x37T8hTxh
         xLmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736358356; x=1736963156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CntFd34V+ZehwA1bDAGud6oqD/tsVSgbkgAOGItU+Es=;
        b=BTiEnwMYHJqSgoqiM/P4wN01N3+lzy8SQxzj+fzZ/OL0f2b2xGl6RQnCfZEjhje6FS
         9pdgZirxcdG+72FnIbX2LTMBhlxHWjMZGz/r/JY4AQovIPzl/l9xjpAGzCyZJ6S7ff1I
         ExEZssH5qIgcETR+uitDVOGlDZGSuJeDxItHDlVJMUoyR9Yg/TWGkqGv94g/x3adfu9N
         9QDpeAsO1SQQe43Xs4obEnS8qMWRe7Esc8MTBlA4NK8z5mQeI4FwqjXRKAM0kgzvY7bx
         FMmNR4J7y1EAg0QApsRDkIaE/5gtbVnkCmtuftz1kcspcjLPgqlYALcay6ZCpDAbPIDD
         shqg==
X-Forwarded-Encrypted: i=1; AJvYcCV/inSbf+Di/gpoGOA/vMOqjwZo/LJTZHwxlouQSUrL/SOsbRuXslAzgbP2fQvYh9zqRtiKOJNiq0dWDY8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwfBFWUvrnwIwn+5dX4mk/au6gfq+Q+M3eMoTYKtKH1S9US9+vr
	gj2tqwIZRr9Bri4lZ3vlN4tNSLE1xUx6LWXi0DNagpkUvcnI0P5IK+xUbv7rcKgHQxmEO9kwjvW
	YpWHa3zPFTUpxOOVE/A5W9o8PCQY=
X-Gm-Gg: ASbGncvcRuYsnkw4KkihOp6O4yVGzQhYccALx3OefId/n7rTuaHWA2JZtNfxdYjw2nb
	P3+fofLgMKGVUYiOiaGqKj13Rm8L7JZ06dO8zi7oj
X-Google-Smtp-Source: AGHT+IENYaJN9qJzVvS74XH6AptDhLta++2dMAjueUTCbMsr4OTDR6rI80EcBDLV3vhFQ2EURExJxkFEPfZHEixQvQg=
X-Received: by 2002:a05:6000:18a3:b0:385:f0dc:c9fd with SMTP id
 ffacd0b85a97d-38a8730dcf2mr3304762f8f.27.1736358356386; Wed, 08 Jan 2025
 09:45:56 -0800 (PST)
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
References: <20241228-sysfs-const-bin_attr-simple-v2-0-7c6f3f1767a3@weissschuh.net>
 <CAADnVQ+E0z8mY4BF9qamPh1XV9qs2jZ03bfYz2tVw8E4nFVWBw@mail.gmail.com> <0cbfd352-ee3b-4670-afae-8e56d888e8c3@t-8ch.de>
In-Reply-To: <0cbfd352-ee3b-4670-afae-8e56d888e8c3@t-8ch.de>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 8 Jan 2025 09:45:45 -0800
X-Gm-Features: AbW1kvYKPSAAqEJsfNmyLOCD7SVL_sAo95rJ07iFN2FuKSqH132N8xtEs5_kMIo
Message-ID: <CAADnVQJMV-zRcDKftZ-MbKEJQ7XGmPteMYCS0Bm5siBEXUK=Fw@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] sysfs: constify bin_attribute argument of sysfs_bin_attr_simple_read()
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Daniel Gomez <da.gomez@samsung.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-modules@vger.kernel.org, 
	bpf <bpf@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Dec 31, 2024 at 2:30=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> On 2024-12-30 16:50:41-0800, Alexei Starovoitov wrote:
> > On Sat, Dec 28, 2024 at 12:43=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@w=
eissschuh.net> wrote:
> > >
> > > Most users use this function through the BIN_ATTR_SIMPLE* macros,
> > > they can handle the switch transparently.
> > >
> > > This series is meant to be merged through the driver core tree.
> >
> > hmm. why?
>
> Patch 1 changes the signature of sysfs_bin_attr_simple_read().
> Before patch 1 sysfs_bin_attr_simple_read() needs to be assigned to the
> callback member .read, after patch 1 it's .read_new.
> (Both callbacks work exactly the same, except for their signature,
> .read_new is only a transition mechanism and will go away again)
>
> > I'd rather take patches 2 and 3 into bpf-next to avoid
> > potential conflicts.
> > Patch 1 looks orthogonal and independent.
>
> If you pick up 2 and 3 through bpf-next you would need to adapt these
> assignments. As soon as both patch 1 and the modified 2 and 3 hit
> Linus' tree, the build would break due to mismatches function pointers.
> (Casting function pointers to avoid the mismatch will blow up with KCFI)

I see. All these steps to constify is frankly a mess.
You're wasting cpu and memory for this read vs read_new
when const is not much more than syntactic sugar in C.
You should have done one tree wide patch without doing this _new() hack.

Anyway, rant over. Carry patches 2,3. Hopefully they won't conflict.
But I don't want to see any constification patches in bpf land
that come with such pointless runtime penalty.

