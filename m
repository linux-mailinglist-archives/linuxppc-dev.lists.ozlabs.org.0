Return-Path: <linuxppc-dev+bounces-4543-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 678529FEBFC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Dec 2024 01:51:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YMZCZ4W1Zz2yXm;
	Tue, 31 Dec 2024 11:51:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::435"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735606266;
	cv=none; b=BT0j+JqRARiHzKZR5Iv7iqQq19bB7tgJn0hdMr6Hxn2bH54/znnJagf+cpvRYp9zf+WkqJaM4C/C0phQUoQ4pT52589gqby2eYIv/xi9eI4pg9sxPFxFC+lGDiUi6eoR/hi8uQBi3ScGywa7gHjTDOLpjdyIcoDA7O1Y+COGd9FiiHymPk2PTLDBc2Hd8DJpT4q+YR/cQC8HLJdkz7zCHGDN5kcGnAaW0iHDof8nZ37cDwqe8EZG0ZG40l88tysfRqbC0PKZsA54BEzAhPKE1ROLiWcombPvAlVxAGi8t7FTbX3RN5lxevOwcBTLL3Q1COqsbH5ZfJ7VggWmn8liVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735606266; c=relaxed/relaxed;
	bh=jBkqqQJEX4PILbfyFsL7OxaUiUrJXdz4wzgXDhfUd88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kHdW00LRIrGbZgF5aNiV4QRaIDvs5kzWOo17JTmXBKOskD3Hd8KWsKxtBLJD8w9Bg09W/MFESChUR5ALK5cTF7qhBqrX9PbXxlnDEvtjtW9TBY1LucO2rwghWzTTa1ccVG2ycV76ya9PUff7R218Vs6Tr65gr8onbSwZzgbO9ZOUGcdlrf0pcAS+cDKDCSJPsEElvG3meOi1KwQpeLlMZ6EuZCvhp9QCKrBfjDW9PTOr7F0JYvAsRtWWfukt4TT9qRmw/wtxoQT1iQJpxpDlVMpg9oqjP3HFva+0bSMlq8mkZMIOX9pceANR5m/GmiS0655vju72b33T0Vp2cj43QQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I7GVfa+/; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=I7GVfa+/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435; helo=mail-wr1-x435.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YMZCT6htcz2yTs
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Dec 2024 11:51:00 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-385de9f789cso7281467f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Dec 2024 16:50:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735606253; x=1736211053; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBkqqQJEX4PILbfyFsL7OxaUiUrJXdz4wzgXDhfUd88=;
        b=I7GVfa+/NyzLjs1f75HHu7xjfpd8SsPsQY5pip4/cbwTPns80XgAeM3/t8PIVwslc/
         JE7jdwykNBpMHpgv6i95Hbwqs+CX/uMux2bekYmtY+hDjRwz5Gpev816TEySIsIBuLsz
         8lCicIbgzOeW8I1+Jl/7uzHaL+IuuLUyDGRh5N3WDCpJ/UZcWWCuZqrXHVPrbFq0JD3G
         H/UvWI2sZ2XeafMXD3mpyKiI0jwDQTrE+Yp8NjLR5bWJ9Qt8kcIIpQFCJaExNAuQ1oBk
         j63i5S7/Cw1zcqnBp2Agc5vk9OAHmWqVQLZ4iVUaWAievq4A1hdkAE8JjXauvTPK7ToU
         IJKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735606253; x=1736211053;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jBkqqQJEX4PILbfyFsL7OxaUiUrJXdz4wzgXDhfUd88=;
        b=ZaG6511SluK23ip7tnMJ8PC3wfren7JfHPtOuTe76R61ii5mz8EfisE0yRBzN4NjFv
         UsQ8i0p42lsQO+kpJOVyFeJ3BrkLiaF6UqoX50L832T4p7fcCWkSAWiWpMcFtSPqblUl
         OxY3HP585J1o9fsCuTv7VovQ+zHiTmBcPzv2dTXSAhdsIM2hjWogZsxil+/UaxA8MkBe
         Am293ut8oaHb0pkGi2ooMcJ4ujefIkKi3VDOOe5nst2wGP3C5w7LYbIJ+E3fngXOyrah
         yCiHFI8AaiOaG6/GlVKAEEWRSP3RtJcKbNTr0pilPQP85ohve70ejm0vlTKdnvB6LzIG
         7Fgg==
X-Forwarded-Encrypted: i=1; AJvYcCWxdr7Ibsae9ufGtuqy5Kr2etgyAtQGCYhcZFmpEvzp5kDXec5nfc9xRvxP7qYyZC0kxIhvaCDQiLPvEPE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyPwCPEnOQEEqXu1x3SVqzWiYGG79c2iRk1jwNIKr5eVA8li/FN
	wLXp4eh5bpTwHUz3TiOgWjPhJXflCurjKen+mT2ATJCgjtXL3xGDzAwx2TxlldIte9yByCg3d9q
	gs6LkvM2h0/FpVE+mhHHx9s3ySSM=
X-Gm-Gg: ASbGnct/Tjz3jmW4C09uGCrUwwo5LdgH5swvI/6Au1v186TsAJyvJ7K0I7A6ljwXfwS
	DHSbbkxIERzeeXvNnnhr6jpbCnF1ljpKZ5JVx4zaThb3LyCtDYx8fCnJMfgulypHKwMS3fQ==
X-Google-Smtp-Source: AGHT+IHYZ3UJyt6hDvoR2xtV+VlHNg98hIR1jdQVb8Ns3euF9qlwYgJ4dQnlgdHYZ0r/ahF8PnTZBtAZCh5A71J/EuE=
X-Received: by 2002:a5d:6d0a:0:b0:385:dffb:4d56 with SMTP id
 ffacd0b85a97d-38a22408d23mr38366182f8f.53.1735606252876; Mon, 30 Dec 2024
 16:50:52 -0800 (PST)
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
In-Reply-To: <20241228-sysfs-const-bin_attr-simple-v2-0-7c6f3f1767a3@weissschuh.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 30 Dec 2024 16:50:41 -0800
Message-ID: <CAADnVQ+E0z8mY4BF9qamPh1XV9qs2jZ03bfYz2tVw8E4nFVWBw@mail.gmail.com>
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

On Sat, Dec 28, 2024 at 12:43=E2=80=AFAM Thomas Wei=C3=9Fschuh <linux@weiss=
schuh.net> wrote:
>
> Most users use this function through the BIN_ATTR_SIMPLE* macros,
> they can handle the switch transparently.
>
> This series is meant to be merged through the driver core tree.

hmm. why?

I'd rather take patches 2 and 3 into bpf-next to avoid
potential conflicts.
Patch 1 looks orthogonal and independent.

