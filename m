Return-Path: <linuxppc-dev+bounces-15623-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E776D1820E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jan 2026 11:45:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dr5VN5Sbdz2xWP;
	Tue, 13 Jan 2026 21:45:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768301100;
	cv=none; b=iDhhSik6jMyW2gPLAPNPvtY10grKNljZRCFZq4gh5OEZKGkTGYtsq0AsIIY3jMYvY7J2hjr38Bjv1edK82qZpxhWpS1T4BIllW/WzjZ8xC9AbC9oo/jD3EGB1z9TdHsEt0LA6VRjGYrsSyS66l3CA1LwtrfCPbWNXT65KihenPaZ1lfp5Zu4BqOeYO8uocR0JbdanO0ncFv6fLXNMUREbxpYKUzJ9kVADUw42Tgn7ujnOOn2cNc8GrF6G/f/Um2RDCVfjMC/Oo4Z2T4ZTLgmn7OIu8XSvNjRfn7bYRAKD1rerLnaSG6sz69tjGeJNNzWLv/Y6TZEJ1d+8tlP4g7Crw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768301100; c=relaxed/relaxed;
	bh=m2C1Cq0R3bvdmMZOqB7Bn3CVMUrTKnWJxHrygGNnHrE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fmphWIYJkpst8UYCaObSviD5t69LuEjfawSEsJOxcml4faLXJ1j5xnrFMXHuEfu3RTAW+rUNwzHw6Tk6dNez0EYLl8Ne7HJTkG5zus2Iu0YBYJB0xVpOvqVV+SyKr7/ECjVeOxokX07HfJqgzWeuBVBwp79Lx0RdeMjBEfQ3xfjmL0d7J2bxX8oiG7vDTHpaeB6bpFP9OUyDi8F7UjoS5mtqZaBfFsYlSTgmis4M5LaaK0XwbmHxbzxOkXLzFdeKC+5+wUJ/BGDP5mw99sDTfZw0hc2rK0RKfzshrPZrbbx7btJSehDeQohbILXZNK03AzbY18dUpmZNODlLtEBjRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bTwKlxI0; dkim-atps=neutral; spf=pass (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=sang-engineering.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=bTwKlxI0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sang-engineering.com (client-ip=194.117.254.33; helo=mail.zeus03.de; envelope-from=wsa+renesas@sang-engineering.com; receiver=lists.ozlabs.org)
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dr5VL3Cv1z2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jan 2026 21:44:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=m2C1
	Cq0R3bvdmMZOqB7Bn3CVMUrTKnWJxHrygGNnHrE=; b=bTwKlxI0nNgr2gHLIeSB
	hDI8XILoB+81bZJ+jIufbsZhBJUuEzmD0vh5h+s9IvO7roXyWaEULZ7Wn79e3tZN
	in9xNMNISPenr4zopohkNIgTmUXV5kVd5Naaxc/Q+RkmzEj0rhg6aIpiO2DM5+Sq
	G2MZj+FXPLVXoEliD3QywcEJ2j9O5lUCV7w2AVODnlPdN+3v//mswbc39uTttSta
	rJn5n8o5kAKnugMOZvIHvbsx1Jrj2UzDhtJwYpPzRl5Az2uRstgYvdFvudaWXdZR
	B/Ijw+Tq6rUSmi2kZ6fTvMXr/5iH+i83NRWekmbXSSfCLOD5Nrp9U1iz7SZpS5l0
	kg==
Received: (qmail 1645245 invoked from network); 13 Jan 2026 11:44:54 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 11:44:54 +0100
X-UD-Smtp-Session: l3s3148p1@a+yNrkJIftoujnvx
Date: Tue, 13 Jan 2026 11:44:53 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Khalil Blaiech <kblaiech@nvidia.com>,
	Asmaa Mnebhi <asmaa@nvidia.com>, Jean Delvare <jdelvare@suse.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>,
	Manivannan Sadhasivam <mani@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-actions@lists.infradead.org,
	Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH 00/12] i2c: add and start using i2c_adapter-specific
 printk helpers
Message-ID: <aWYiJbtueA8g3srn@ninjato>
References: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251223-i2c-printk-helpers-v1-0-46a08306afdb@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Bart,

> can be *revoked*. To that end we need to hide all dereferences of
> adap->dev in drivers.

I haven't actually tested the code yet (but will do so this week). But I
already want to feed back that I approve of the general concept of
abstracting away drivers access to the struct device by something we can
then convert to SRCU in a central place.

This mail is to discuss the timeline of these series. My preferred
solution is to aim for inclusion right after 7.0-rc1 is released. That
gives me enough time to test and you some more time to address review
comments. Bold wish, but maybe we can even get dependencies into 6.19
before (like the i2c_dbg rename for the saa7134 driver. Is there a patch
for it already?).

Does that work for you?

Happy hacking and thanks again for doing all this!

   Wolfram


