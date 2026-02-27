Return-Path: <linuxppc-dev+bounces-17400-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6IYtIma7oWmjwAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17400-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 16:42:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A13BE1BA134
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 16:42:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMsyp62Kfz2xYw;
	Sat, 28 Feb 2026 02:42:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772206946;
	cv=none; b=hYSvl/xRkWt9BfokyLEub3ArM8aTlBRzTKo+UarqDL5h9puY8Hb/fEOmyZuQk7rIqty4T5qaf7kmq+tEGpxR/K71rGKtjru8sN9nlAxtCZt2tDEqahJjOjfH3QPGUy636cNJLAX7VHmeKevbEpq6UvkaWt7wv/Im/TI1++L8ES0w3X8kzzQ5VKi7CI5dRDhDmamjaIyl1y0Ey/skxmfHZi+G7fXjCYCQBChN8rZYXGY4sLdIT4ZPUV01pRMUoM3atqsi11zcTNccUoxUpPgsMftJ60pFhrro03ucUzEK/IQoOlzp4R9H9R86lfATl7hir93UK8U8JnxPZXyUgxmjBw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772206946; c=relaxed/relaxed;
	bh=sdCPwqd3I1Oda3Lh95ge0A49tYvELGgPEvmK4+J0ABA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RMcMu6c88vP7Rkn1RtXff7kEdSR/JlvCH3iTcpuYVrsNrponJpGCzX4wpMwXJ8I1CrTC8p3i3oBsc72e81YgAbmMbjtFb1ha+2jzzZ2BvM1ub4GMIOKnQBA3QMkMXZE/80BPnVOwWiSvzURokZh4NZJ468MIg7I1c6SISGXtI3zPLjns79MSJqYTae6WquF9XzkyXac4dn1fpdQ1heXMdlF/tzz9J0chWpWOzvP+VBBDP6cD8SqPs4d6dngxNGiTzssH4LcwBug4YacqEkUCeAb05cCpg1UwclMBPK5Qr3sPkxWoILaZ2vCM26dCqZDa0rFAaDSVLG9f7e30z/cp0A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LBGFhqUB; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=LBGFhqUB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMsyn5tQzz2xLv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 02:42:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 58C2944458
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 15:42:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39206C2BCC4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 15:42:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772206943;
	bh=STzTxb6AkecD0Oj2uXWbAE7smRP8JD9AAxkR2Qux/Sc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=LBGFhqUBtQI9BbpwK46VoHQn50/6CaY1vQ5PIc4y5spoYCP25Jf0LROem1fHBjUy4
	 yeI4JK9t+VAFfxsB/FRVdfK2qMAp7BaBH+/oWL+LnHZG992H0B/CcnUUAoiNPkt5su
	 u377zsPtAQxl/Qcm2oYsywZEuG0OqtFcTLP7OjoWey7QG/JHyvrV4iN6xZaOIqUa06
	 vfJFlrWT+r202v79WRMwFVhTxOamgJ/igAb5KSIJ4HqzNmfDIAyq7QGRarn4/4y6Qh
	 NxQCbSDcfMyB0gb6ik4hp18xL7FM5BoFy0P7SgHelPVuHedFnta+qYHiFlGS3xx2xF
	 pZng7DsL48SLg==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-389fb626b67so23605261fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 07:42:23 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU7TbquVp6dBRP+bPAG8UBxk1VFEJCO3G/Kb2xKAAbIZhVl5emhXFuTwqhBs5FoJ5dGKjyrc5j9Nux78lA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz+O1Qrd+RGXQlX1baqVpb9hestbd4+veGbeEVlFXdGF1QRv6cd
	+QUgLQcnziZ407C9HQ64AU+S9TyZe0WACsTfJr23Q96Y10dg8L0PxsTzAyg5RuPu59jq52z4HQZ
	X/DGAHT5sLREkWI1UQrIUZcPEq2cPwROclAFRIkJGig==
X-Received: by 2002:a05:651c:41d8:b0:384:9b92:c5b7 with SMTP id
 38308e7fff4ca-389ff143720mr18998801fa.15.1772206941514; Fri, 27 Feb 2026
 07:42:21 -0800 (PST)
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
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com>
 <aaFcs1miP88QWmtH@hovoldconsulting.com> <aaFfEsfh0xTh0b1y@shikoro> <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
In-Reply-To: <aaFsZbiLYSz_YEjw@hovoldconsulting.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Fri, 27 Feb 2026 16:42:09 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
X-Gm-Features: AaiRm51scY9nN4P8ovfss040XTmsPoSnyMQYg9QuZyNCyHcgWecCdT1v9mdLWqo
Message-ID: <CAMRc=MfcvD1nJy=zpoCkSkJq6WjyXQxFUZ4QE6vyCS+XFCn5AA@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Johan Hovold <johan@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Khalil Blaiech <kblaiech@nvidia.com>, 
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-actions@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17400-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[sang-engineering.com,oss.qualcomm.com,kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:johan@kernel.org,m:wsa+renesas@sang-engineering.com,m:bartosz.golaszewski@oss.qualcomm.com,m:andi.shyti@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:kblaiech@nvidia.com,m:asmaa@nvidia.com,m:jdelvare@suse.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-actions@lists.infradead.org,m:linux-media@vger.kernel.org,m:wsa@sang-engineering.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: A13BE1BA134
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 11:06=E2=80=AFAM Johan Hovold <johan@kernel.org> wr=
ote:
>
> On Fri, Feb 27, 2026 at 10:08:34AM +0100, Wolfram Sang wrote:
>
> > > Wolfram, I noticed you merged these last night. Please think again an=
d
> > > let's discuss the end result here. There's no question that there are
> > > lifetime issues in i2c, but this is not the way to solve it.
> >
> > I did think again and do not see a way how the life cycle problems can
> > be solved while drivers happily access the device struct of the adapter=
.
>
> There's nothing special about the struct device. What matters is that
> drivers don't free memory that's still in use by the core.
>
> > Whatever the solution to the core problem is (revocable, custom SRCU,
> > something else), I still think this step is needed in any case. If I am
> > wrong with this opinion, please enlighten me. Pointer to some existing
> > thread is OK, too. I didn't have the bandwidth to read the revocable
> > mail threads.
>
> It's not even about revocable or SRCU, that's just an implementation
> detail.
>
> It seems all that is needed is to decouple the struct i2c_adapter from
> the driver data and have core manage the lifetime of the former using
> the reference count of the embedded struct device.
>

I feel like we've discussed it already under v1 or elsewhere.

This is a weird pattern you sometimes see where a driver allocates
something and passes the ownership to the subsystem.  This often
causes confusion among driver authors, who logically assume that if
you allocate something, you are responsible for freeing it. Since this
is C and not Rust (where such things are tracked by the compiler), I
strongly believe we should strive to keep ownership consistent: the
driver should free resources it allocated within the bounds of the
lifetime of the device it controls. The subsystem should manage the
data it allocated - in this case the i2c adapter struct device.

I know there are a lot of places where this is done in the kernel but
let's not introduce new ones. This is a bad pattern.

But even if you decided this is the way to go, I fail to see how it
would be easier than what I'm trying to do. You would have to modify
*all* I2C bus drivers as opposed to only modifying those that access
the underlying struct device. Or am I missing something?

Bartosz

> Then you can use an rwsem, SRCU, revocable or something else to handle
> devices going away while they are in use.
>

