Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DEF77DBDCF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 17:27:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rxq0OUiV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJzFz2ZxBz3cW7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Oct 2023 03:27:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Rxq0OUiV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJzF539c9z2yN8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Oct 2023 03:27:05 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BAB1160B33
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 16:27:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C969C433CC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 16:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698683222;
	bh=EhkKNngUQNbFcyqQ0JE73xgCCt67m/WrBqvUp8zSB8M=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Rxq0OUiVhGvEvUTP4+DZhVXhhfKxvQf0ybhfzd7+/5OBmskwzS9z5gKqRX5XzYLS6
	 k62r71Uvvyg3kGGCCTO4sLhe07ix4CSL4nGtA15i4lO0zMmb+aUxXfieL/mW6cx3uz
	 vzf/7uifEwRi4DPneEOMvdDsEFR6QkZBhE8Q5R+sn2MFxBHJvBdKTV1wDM5x7tguwl
	 TdOPnekBAGtpV6lq0LdVJriCKuJLFWjho9aAZpLd5NPh2cIJdYVdURGNuzgLTnOBz+
	 ZCd1fIRSgqiLu9H1FhsfPiMO6cjqsw2hqDz3KnmqYO7c+/MYZ5wYnMnVwrzNfFgoJU
	 2dBbZA3IVxRMA==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-507a62d4788so7111185e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 09:27:02 -0700 (PDT)
X-Gm-Message-State: AOJu0YxaeIcWBr0RaQHFRjrN2mPkTGBHfzqDYZoXb+pAlMb+WAN4bjaH
	htPHoqy3F2fLNndpF3G8uT9tPC8gW7pyfgJ0TQ==
X-Google-Smtp-Source: AGHT+IF5zHYs7vQJ85FKme3sDrgJWcT2F+8Etvi0m8ptOud26W/x21H+QA1KvtesBLW1W68PJ2Kt8twUnRJf3ZS29as=
X-Received: by 2002:ac2:521b:0:b0:507:f0f2:57bd with SMTP id
 a27-20020ac2521b000000b00507f0f257bdmr6882239lfl.66.1698683220637; Mon, 30
 Oct 2023 09:27:00 -0700 (PDT)
MIME-Version: 1.0
References: <20231018233815.34a0417f@yea>
In-Reply-To: <20231018233815.34a0417f@yea>
From: Rob Herring <robh@kernel.org>
Date: Mon, 30 Oct 2023 11:26:48 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+qcc7ERmGAywp=7oGT=XGoBsMO839_jtzxeNcCN-dS_A@mail.gmail.com>
Message-ID: <CAL_Jsq+qcc7ERmGAywp=7oGT=XGoBsMO839_jtzxeNcCN-dS_A@mail.gmail.com>
Subject: Re: Several kmemleak reports + "refcount_t: underflow;
 use-after-free" at boot when OF_UNITTEST + OF_OVERLAY is set (Kernel
 v6.6-rc6, PowerMac G5 11,2)
To: Erhard Furtner <erhard_f@mailbox.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 18, 2023 at 4:38=E2=80=AFPM Erhard Furtner <erhard_f@mailbox.or=
g> wrote:
>
> Greetings!
>
> Getting this at every boot on my G5 with kernel v6.6-rc6 with OF_UNITTEST=
 and OF_OVERLAY selected:
>
> [...]
> ### dt-test ### EXPECT \ : OF: ERROR: of_node_release() detected bad
> of_node_put() on /testcase-data/refcount-node ### dt-test ### pass
> of_unittest_lifecycle():3189 OF: ERROR: of_node_release() detected bad
> of_node_put() on /testcase-data/refcount-node ### dt-test ### EXPECT / : =
OF:
> ERROR: of_node_release() detected bad of_node_put() on
> /testcase-data/refcount-node ### dt-test ### EXPECT \ : ------------[ cut=
 here
> ]------------ ### dt-test ### EXPECT \ : WARNING: <<all>> ### dt-test ###
> EXPECT \ : refcount_t: underflow; use-after-free. ### dt-test ### EXPECT =
\ :

The test tells you to expect a use-after-free...

> ---[ end trace <<int>> ]--- ### dt-test ### pass of_unittest_lifecycle():=
3209
> ------------[ cut here ]------------
> refcount_t: underflow; use-after-free.

Then you get a use-after-free. Looks like it is working as designed.

I believe it's the same with kmemleak.

Note that running DT unittests also taints the kernel. That's because
they are not meant to be run on a production system.

Rob
