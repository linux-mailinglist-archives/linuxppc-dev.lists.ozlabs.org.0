Return-Path: <linuxppc-dev+bounces-17367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKkELApYoWldsQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 09:38:34 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E6E1B49E9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 09:38:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMhYf6QTmz2xMt;
	Fri, 27 Feb 2026 19:38:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772181510;
	cv=none; b=CCP0bJC1k8Kqro3HOAef+Zse6EaLmyiHzdy+2Xjh/fOJ22y/vPIe6Vr+0SkgX7n7iKFOAb1rRSAZ+6POUx5z8zDnT5k4tXXR9+WW3VLZ0/hGLktI3j7dLzOB743dRPqvJcXay3vdOrmDsy/5KrxqK2jAumDD6XhScmgAkH+ukBQyqNqgy2IBOuZ9OX2l4SbBwMJscXUCuJq3icEUytLxfyDYee2zrEsN9U288zxzivu8yjsohxfy+L/74M1SHm5E7ZGDomuXmJAxkGncO5IoSb3zmz8arS6RB2ZPQAa6wLdIa3cJYVUPe6C5yHUyTUGZaMQ/1i+uQzQRUrL8y68iBA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772181510; c=relaxed/relaxed;
	bh=B8/5bI+d66y81V2rFiaH4FWnj6qjMkY7SACemFjjFkQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z48XjU4IgkKxkI1q9fAsK6Vbu5M5GNMNgQ8lZMAlA226YSwCodhL3Z/q8HJ5MbSw40C66NwIKPLzns+BpSxY93Ge2roCHP8W0uh+FIdCTuTEmmiXlvDdeYNcE+g/XOqXIZJPpGkDyZke4ebPhBsJRfj5Y8XRZpXv0Ib1WH8ycoqfRcv/x076DnS36J5i/oLt5AAIIbE01v9CxisKdOLAenP27IWJZweXXZb9mTXJlYQE/TTmYauUaHvW4873TKlCVa4/9CXYHBl4hDw8bOX3rXJNAS3UKusx3v+Kt+ZaW2WAp0p4VN/CYIKYDUI+THkkFF3Z+vBSo7oq5sHIwqc1nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rRWuw9/T; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rRWuw9/T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=brgl@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMhYf0krtz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 19:38:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id EF65144548
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 08:38:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF4FDC19422
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 08:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772181507;
	bh=B8/5bI+d66y81V2rFiaH4FWnj6qjMkY7SACemFjjFkQ=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc:From;
	b=rRWuw9/TnLwpOnG2Dpa/ftMLizMNL6RcO4Fp7w9HPl1gDrgoIXsuZRVJ6muNILsPc
	 WTjb91b2F65aXORG6g28JbNgIdZUHVWHJCAYlCQB8eDyHhU2yeJG1YJp69uC4e/CwC
	 C0WF8d5iqzKBJGc7+Qab+/E74MhB/O1WKKr6mEg7uf7NIV1JZyKDDlJ2rrXEWD+ary
	 1INp5PzUpApixPN78wGg9+v+Eh6SP0OMrTYQVbJy9DjJjxQvsYdEOZ+O/rczHUzo63
	 cXpJVCvz6/uOeaet8B4gG0IwxYWqKZC01R4d9xkn15DBakmkYwAbstEp170PWksfep
	 hGiLJ/2BmEn+g==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-389f200c26eso17081131fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 00:38:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXISr7Ke0uEwXi+TZe8A8CKSzDo1XxAcibZXIYXf5dTzvvYRW9ijrSybNfzzcQ3BY+c2TceKBv2f3vuujU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YygI3u2mxZ5h/Km4HYHj3N3uuZcjMR/tj7AgGgk0FoY5zPt4PUL
	xa4yHgmHzeT/YGEY7k/dkhGWhsHOTQJafjcIpAJjKmVGBnSSFIk6YIUDV6PnTT5AvOT7tlwTrCE
	2thycRX0mHhgfW9SfV4eKzBwTRN1Gqz+w+rc8SiIimg==
X-Received: by 2002:a2e:a10b:0:b0:389:ef35:fb9e with SMTP id
 38308e7fff4ca-389ff15f2f5mr11325631fa.24.1772181505403; Fri, 27 Feb 2026
 00:38:25 -0800 (PST)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Feb 2026 00:38:23 -0800
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 27 Feb 2026 00:38:23 -0800
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <aaCrT1SvMCIKQDmc@ninjato>
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
References: <20260223-i2c-printk-helpers-v2-0-13b2a97762af@oss.qualcomm.com> <aaCrT1SvMCIKQDmc@ninjato>
Date: Fri, 27 Feb 2026 00:38:23 -0800
X-Gmail-Original-Message-ID: <CAMRc=MfwR7TfAFXO4opu7a=v84MK9hY048woPg+-09wkGJgWFg@mail.gmail.com>
X-Gm-Features: AaiRm52Yb9kd_att7B9hKBtSpFgOcTtzo7FDwU7A01PqlXP6UIrlHqDUHcGb-x8
Message-ID: <CAMRc=MfwR7TfAFXO4opu7a=v84MK9hY048woPg+-09wkGJgWFg@mail.gmail.com>
Subject: Re: [PATCH v2 00/13] i2c: add and start using i2c_adapter-specific
 printk helpers
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Khalil Blaiech <kblaiech@nvidia.com>, Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>, 
	Manivannan Sadhasivam <mani@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-actions@lists.infradead.org, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-media@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
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
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17367-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,sholland.org,nvidia.com,suse.com,linux.ibm.com,ellerman.id.au,suse.de,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org,oss.qualcomm.com];
	RCPT_COUNT_TWELVE(0.00)[24];
	FORGED_RECIPIENTS(0.00)[m:wsa+renesas@sang-engineering.com,m:andi.shyti@kernel.org,m:wens@kernel.org,m:jernej.skrabec@gmail.com,m:samuel@sholland.org,m:kblaiech@nvidia.com,m:asmaa@nvidia.com,m:jdelvare@suse.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:afaerber@suse.de,m:mani@kernel.org,m:mchehab@kernel.org,m:linux-i2c@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-sunxi@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-actions@lists.infradead.org,m:brgl@kernel.org,m:linux-media@vger.kernel.org,m:bartosz.golaszewski@oss.qualcomm.com,m:wsa@sang-engineering.com,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.988];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[brgl@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: C8E6E1B49E9
X-Rspamd-Action: no action

On Thu, 26 Feb 2026 21:21:35 +0100, Wolfram Sang
<wsa+renesas@sang-engineering.com> said:
> On Mon, Feb 23, 2026 at 09:59:29AM +0100, Bartosz Golaszewski wrote:
>> It's been another year of discussing the object life-time problems at
>> conferences. I2C is one of the offenders and its problems are more
>> complex than those of some other subsystems. It seems the revocable[1]
>> API may make its way into the kernel this year but even with it in
>> place, I2C won't be able to use it as there's currently nothing to
>> *revoke*. The struct device is embedded within the i2c_adapter struct
>> whose lifetime is tied to the provider device being bound to its driver.
>>
>> Fixing this won't be fast and easy but nothing's going to happen if we
>> don't start chipping away at it. The ultimate goal in order to be able
>> to use an SRCU-based solution (revocable or otherwise) is to convert the
>> embedded struct device in struct i2c_adapter into an __rcu pointer that
>> can be *revoked*. To that end we need to hide all dereferences of
>> adap->dev in drivers.
>>
>> This series addresses the usage of adap->dev in device printk() helpers
>> (dev_err() et al). It introduces a set of i2c-specific helpers and
>> starts using them across bus drivers. For now just 12 patches but I'll
>> keep on doing it if these get accepted. Once these get upstream for
>> v6.20/7.0, we'll be able to also start converting i2c drivers outside of
>> drivers/i2c/.
>
> I applied the series to for-current but squashed the user conversions
> into patch 1. Changes are trivial enough and I don't want the pull
> request to look excessive, so it can go in smoothly. Hope you are fine
> with it.
>

Sure, do you still want me to send these changes in separate patches for
review?

Bart

