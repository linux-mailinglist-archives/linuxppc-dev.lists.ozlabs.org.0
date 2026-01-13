Return-Path: <linuxppc-dev+bounces-15624-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D39D18461
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 12:00:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr5qx3z2Wz2yFY;
	Tue, 13 Jan 2026 22:00:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768302013;
	cv=none; b=Rqqrz2/8NBdcu9+yqONMrUENgiJS7R/9umni0xXvew9tOyVOo7708NxFFwr7pLhox587fdmZ0tKZuq4/TjG77Ty8PuyEzkSM5q6rJMS1CxSGOTXFKqFNRdCmIEiEoORvdn430E0NFD9eJPC74JJt6SMlS4tJNLKls4+tlUOZokWjnoXL1Z3JbIPTkY050B30ntEYYVZPLQvxW1d/VSSmMQGNfi9LeMRBp+bcIID07EgkBiqMY58nyQH9ZgBwEQoLLLDkE3GZG87zduXzxK85Ur1lheIrXsCj/ucWrCj8RzE6dUyIwwtbrrgIN8naxw098AKGvitUME/KTa5SkzRibA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768302013; c=relaxed/relaxed;
	bh=2Hm3klV9uiE/Rwd0k0xCU9t68/lMBtjH2KuL+woZfe0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=APo/ptaJK8D+bDeHYl3e2lPlj5uJkIWZBrjJcRJYV4tvtFJiwDlQKpqzlZFzZS8+N6+0nXrrzGkOeYQXDjsUYlRZE/WG72lNEONtwUcj1/6jp+tSN/FxYl10ezeXbppS0edwS7IU3G8IuovQb55tACFp7tR5467PkGKhJvLuFycTwepClsTIOkU0YhcfZo9rQY7leUI/Vpd3OSI2LIStIqoHR4gdrqjpdFUhDhsHHD9Ry7y6z1tldji7tYboBcuww/ssi/LFvl8WtqdVHLvGnQ1SzdDY6W1Ql+FQcrCtGBJ6o7LVRJz4rsUyWyXNdzl4qDqFrGOkqgpraI2Qyk0ByA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NwF0qwTo; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=NwF0qwTo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr5qw2yxfz2xWP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 22:00:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F7E64417E
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 10:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 507FAC2BCF5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 10:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768301980;
	bh=2Hm3klV9uiE/Rwd0k0xCU9t68/lMBtjH2KuL+woZfe0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=NwF0qwToUauraa6lwGSTGA01XdZiijTDMINatulyxb4YTkNmr4XCu2OdDvbHM3+Nv
	 XcgUFS/AO33VALDwBvoKaP0ReB9TCSJkGQ9mA6iKf1WqtG3OYCzrloy5W7IU/f4Y3L
	 3jlUM7mYlTXRUCN41ik6iBkLKd8tL8fbAzVx7IL0eY/vv9FhOVUfXJjW/bjjA01Xnt
	 Z/AXOrqLLyThHofNi5bCNJL4Qvj9Eit02nE7qTyZR9+GEMD7bG/H7cVsRuma+xee1n
	 5rYRS1k0chDJI3pj5AzU5ZZmb7nvW293W0A6AZtfuSIgVhIdl/AddR0rFjRnIbQYFf
	 h5rqaXl7PwuQQ==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38316445a67so35833841fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 02:59:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXehMDSVPdX0oKjobhdtYc388b5KaBssHbP9kE8aaKCyz9sd0BiI2W/oI/FeH/ztscVG9Q+pTSCbeCjEjA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy37Y49eMH2eTT1lPmP2ZH/AwH6qtQ40CSkwQ5a4lHzMdwPyE4T
	+24gpo6lIgEI8DaC+aPnOFwWdPzMGV6HBxi/3aip9RYyAO/4MJogiyCoDaCX/MXtw893iU+oK+Z
	PVXfHg5vro0zZAdkZGXUQJi7/HVABKJ+hfd20vXu8Pg==
X-Google-Smtp-Source: AGHT+IGcmwmSIyLMyyShT8GjGLmzzGIi3k+GcAB52Nf27mmBCIl5woR+Nq0F41SPuLO1vsApeIkdFdNTDNszbvq1ee4=
X-Received: by 2002:a05:651c:2212:b0:37a:584c:23fb with SMTP id
 38308e7fff4ca-382ff6dd8eemr58925311fa.20.1768301977156; Tue, 13 Jan 2026
 02:59:37 -0800 (PST)
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
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com> <aWYiJbtueA8g3srn@ninjato>
In-Reply-To: <aWYiJbtueA8g3srn@ninjato>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Tue, 13 Jan 2026 11:59:25 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>
X-Gm-Features: AZwV_Qh-1r_ecwLNV2XfQsZ1XcvcpdCoswobPzSyba32xUDeV7eWsZEVfP38rEk
Message-ID: <CAMRc=MfseaLWfYuhz=5MxRw9dtBvOM4X6brPwT2PJ4Fq7rGbfg@mail.gmail.com>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, linux-actions@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jan 13, 2026 at 11:45=E2=80=AFAM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
>
> Hi Bart,
>
> > can be *revoked*. To that end we need to hide all dereferences of
> > adap->dev in drivers.
>
> I haven't actually tested the code yet (but will do so this week). But I
> already want to feed back that I approve of the general concept of
> abstracting away drivers access to the struct device by something we can
> then convert to SRCU in a central place.
>
> This mail is to discuss the timeline of these series. My preferred
> solution is to aim for inclusion right after 7.0-rc1 is released. That
> gives me enough time to test and you some more time to address review
> comments. Bold wish, but maybe we can even get dependencies into 6.19
> before (like the i2c_dbg rename for the saa7134 driver. Is there a patch
> for it already?).
>
> Does that work for you?

Yes, I agree it's too late to queue it for v7.0. I actually wanted to
rename my macro to i2c_debug() to avoid a conflict with saa7134 but
you're right, I may submit a patch for that instead for v7.0.

Bart

