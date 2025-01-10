Return-Path: <linuxppc-dev+bounces-4982-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3AEA09402
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 15:46:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV4GV06Yhz3cYd;
	Sat, 11 Jan 2025 01:46:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.65
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736520369;
	cv=none; b=cK+++mo4IpNZx5t7DRLgC0qWP9wAWEOFG9pzAVMLr2YfxvNN0eKCmorfoe97nHf9ZsNefqP5e7n6qvXl5yuKJc5+bzaoKY+u9Z7zyh2z4qsiHAkpj5+0gjHC3/I2m/LFd6nXMuEE7f+wraKGf66g14b6fRANHM6HKZR98d557+DdZI1xjBltGs2neOCDhZ0WW2RZRSAjv77aOZq0cet+TxS/TBIhDWS+ShV7vRqBmSizrZHEFDKaP6pil2Io35+pnr5Pn0HFaDpyQwKWbCKYsR2UmhJcoaRYteRGW7TlofKwqmGqDS+1GQRJsCuZ7NFWeIi382CFqUhgAGYo80f5oA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736520369; c=relaxed/relaxed;
	bh=D0VkJu27Sxbh1i1XLm1qEj87CeB4KdKGqj1Z5VORNqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NjO+DUfMt5LDE2+TL7tP/fpJmWshZ0Cw3KDCWPKxK/qlnKzIDZk1WEKEuiCShA0/PQaubXwHe76jrN69crmWtG0NMJwHtLwbOP4J4vacloUKhjzKEeG5IOUN++Nbm5EPFPXCGgqvj/oxXamXe/rs+FLAMf/E6YbF0efkVrwsIQi2+8GsPUQmzPOQk6ZJzIvq7uRKox7UOX+q1IRAETLqPe7SmCCcrovO86c9A6q8euJsQybWS8Jwy33eEDU+aMKS7zG/EY1Eh1shIQ60PGLdZd2C7d+0TmbcRP36KYqPc442xrW7p/tCDF94zRRmqkOhNbmX2+HiIH6tOvnoSeJWkw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=mQTX3y8t; dkim-atps=neutral; spf=pass (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=mQTX3y8t;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.65; helo=mout01.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV4GN01Jgz3cY0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 01:46:00 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id EF1AF240027
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 15:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736520352; bh=dYYaYFEM24+iiQPImiW+lLFpDQ1hFqc+9xNycR8IE3k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=mQTX3y8tMVkoUzUoLoHNqk6Efo9PMc+vYEnVnhkKokT0BwTiK9uzovbdH4tps0r0c
	 WNYDYn6tkkBBp60NiXOpxTW8tCoTu3iHhx0cGxfHa9CqcJiaHp3yUJaXa+XZty6r0Y
	 jBh46z7ei2dg4UGJOIkBmcLwvekAcO/CX9eOqm4wrqJGDW8veA8mSo+t3++itJntsE
	 cP28ijJ8ZfvQYjVkTY1QbTVH1NypaPifrVjdlxuv7OePJbLYs3WMpSBvr2EFvvQRn+
	 yV/7+CROrI92h4qg9fk+xWYMRjZLnUgnQ4g6T3gis5vyOlIEYEctkUl4x9msX4V66g
	 JLiNfydXYIAbg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YV4G56d9Bz6tx7;
	Fri, 10 Jan 2025 15:45:49 +0100 (CET)
Date: Fri, 10 Jan 2025 14:45:49 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Rob Herring <robh@kernel.org>
Cc: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 14/19] powerpc: mpc83xx: Switch to of_platform_populate
Message-ID: <Z4EynSpNghUpjY8W@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-14-86f78ba2a7af@posteo.net>
 <CAL_JsqKU0AQ+ym_iDZSN5hNUTMF0bgjqu-aAVtG792Mw_eZTbg@mail.gmail.com>
 <Z3lKqLXphxeI1Gvo@probook>
 <CAL_Jsq+HrXpqi-mDJF+vyg5zL5mTD5FsCTSq_39U8DffKW+XYQ@mail.gmail.com>
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
In-Reply-To: <CAL_Jsq+HrXpqi-mDJF+vyg5zL5mTD5FsCTSq_39U8DffKW+XYQ@mail.gmail.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Jan 05, 2025 at 02:28:37PM -0600, Rob Herring wrote:
> On Sat, Jan 4, 2025 at 8:50 AM J. Neuschäfer <j.ne@posteo.net> wrote:
> >
> > On Thu, Jan 02, 2025 at 12:51:47PM -0600, Rob Herring wrote:
> > > On Thu, Jan 2, 2025 at 12:32 PM J. Neuschäfer via B4 Relay
> > > <devnull+j.ne.posteo.net@kernel.org> wrote:
[...]
> > > >  static const struct of_device_id of_bus_ids[] __initconst = {
> > > >         { .type = "soc", },
> > >
> > > of_platform_populate() won't work on this match unless there's a
> > > compatible in the node, too. Can we use compatible instead or are
> > > there a bunch of them?
> >
> > In arch/powerpc/boot/dts, I can find the following cases of device_type
> > = "soc" without compatible = "simple-bus":
> >
[...]
> > - arch/powerpc/boot/dts/asp834x-redboot.dts  (MPC83xx!)
> > - arch/powerpc/boot/dts/ksi8560.dts          (MPC85xx)
> >
> > i.e. there is one affected devicetree. I can simply patch that one in
> > the next iteration.
> 
> You can, but that doesn't fix existing DTBs with your kernel change.
> 
> We either have to determine no one cares about that platform or the
> ABI or add a fixup to add the compatible property.

The last substantial change to asp834x-redboot.dts happened in 2009,
so I think it's fairly safe to suspect that any remaining users are
stuck with old software versions; new or recurring users will have to do
some debugging to get the board up and running anyway.


> > >
> > > > -       { .compatible = "soc", },
> > > >         { .compatible = "simple-bus" },
> > > >         { .compatible = "gianfar" },
> > > > -       { .compatible = "gpio-leds", },
> > > > -       { .type = "qe", },
> > > > -       { .compatible = "fsl,qe", },
> > >
> > > Better still would be if we could move the remaining ones to the
> > > default table and just call of_platform_default_populate().
> >
> > of_platform_default_populate does sound preferable.
> >
> > I'll investigate why exactly the "gianfar" match is necessary and how to
> > fix it in the corresponding driver (I don't think it's general enough to
> > warrant being listed in of_default_bus_match_table).
> 
> That may work too.

I have investigated this issue now and will include a patch in the next
version.


Best regards,
J. Neuschäfer

