Return-Path: <linuxppc-dev+bounces-5008-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 08914A09765
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 17:28:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YV6Xp4Wwnz3cCd;
	Sat, 11 Jan 2025 03:28:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=185.67.36.66
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736526522;
	cv=none; b=OmvuM6C2Q01EAEPf9YG6P0BaHOY2wig2hnaDNxwBd0gRg+OcLF7W2s++jar1C41BhMgPsFTrSLaoUs7F54yo2VcPJO36/10Sh6KbR88mNCP/1n8mGiSE+zhH05/Wllj0fWBFc4oBQpZPbLh0Pj0E4ImEVdsgmbm284PtMN/byclIw02tpPMlBALZS+hFVSQa+fID1ebrp7ONn8Cyd19EZSrNTZjRg+KETYT1nyRTE5Lt8YM9bk5B2WZBbNNVoIJp+FMFNWB6U4hlr5j7HIREhskx7uk++IpCPj34N8RwFhGfWfHheMumIzUqLXNbmnjG/Wi0SfJWSAxfIua71wl3uw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736526522; c=relaxed/relaxed;
	bh=dF1mHI9Q+WZrs39+XYlX6FcIb2S/V2tW7HMNjye1Ovo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RkyFOtF6R5o0/z+xA4/FCvfzg4HdWoWmiFAqcdQaQjvI4w4T+awtIX4OXa3vclswbSyVZ0Ye/3BrZJTvOfnxSA2OogstVG0Nw4zOBdyR4Uil70CJy3cJQ+ck5M9dvuuXTFekPa/XZM17aqp1LWY3GVbR87niqcuflE21Q2iZoFI99evawwDrLN/SnBK1N9OXfLE4i1+xIqmij8PkKAKoO4mrhX0FUswZew8Al+RKgIln4cVjJkyZP+d1YRm16x7fvQxhY68jd4lGwFc5HrKnFCH9E3jdtvGgmErPexc5uiMhntO0Lvzg0lyQ4eBCwHq38U5FhLXcNjI6khqbyF8xYg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net; dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=WdpPGeH9; dkim-atps=neutral; spf=pass (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org) smtp.mailfrom=posteo.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=posteo.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=posteo.net header.i=@posteo.net header.a=rsa-sha256 header.s=2017 header.b=WdpPGeH9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=posteo.net (client-ip=185.67.36.66; helo=mout02.posteo.de; envelope-from=j.ne@posteo.net; receiver=lists.ozlabs.org)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YV6Xm0Jxqz3cBZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Jan 2025 03:28:38 +1100 (AEDT)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id BA422240101
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 17:28:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1736526512; bh=OWts1cTfEcqvunfpgiC/6+tnJNk+ma0tlrEZc31g47A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:From;
	b=WdpPGeH9npb33QnUOY81diFY2jW+kyyugTdHJvEGF9G1zEGqfaHygQjPTDm7UKCk/
	 XODtKbK5/zkMQq0bnsn88xVPtv5G3mTxL+2zuIPAhUXocsyDWkeB4iJMKmqM/YPcfq
	 0JYd6Jdo/D7qUbErY0X9l0skU86O9QV+pmS2T0MklAIlRGrdZION88sxqbUUTKi7xo
	 hUrQu9IbnbIN9cpZScAEgnqBVP4LNiQCvlggmDSpj6k3IqcogSH9ZwG8hLQ+ugbt4/
	 dzIAqPYeUQAazbBgdAE/RvL8TIzZG14jcE8aQJmJ+0C98uUDVKnoIXp+cTT49Cn2NF
	 1nD3E2eP4C0eg==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4YV6Xb2P9Xz6tw1;
	Fri, 10 Jan 2025 17:28:31 +0100 (CET)
Date: Fri, 10 Jan 2025 16:28:31 +0000
From: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: j.ne@posteo.net, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 10/19] powerpc: dts: Add MPC8314E devicetree
Message-ID: <Z4FKrwH1oEssxuWi@probook>
References: <20250102-mpc83xx-v1-0-86f78ba2a7af@posteo.net>
 <20250102-mpc83xx-v1-10-86f78ba2a7af@posteo.net>
 <e1c8ebd5-b01d-4338-a465-889853d1ef9f@kernel.org>
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
In-Reply-To: <e1c8ebd5-b01d-4338-a465-889853d1ef9f@kernel.org>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 04:21:58PM +0100, Krzysztof Kozlowski wrote:
> On 02/01/2025 19:31, J. Neuschäfer via B4 Relay wrote:
> > From: "J. Neuschäfer" <j.ne@posteo.net>
> > 
> > The MPC8314E is a variant of the MPC8315E without SATA controllers.
> > 
> > Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
> > ---
> >  arch/powerpc/boot/dts/mpc8314e.dtsi | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/arch/powerpc/boot/dts/mpc8314e.dtsi b/arch/powerpc/boot/dts/mpc8314e.dtsi
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..65a96a485dded5d4918d96b38778399d2f348190
> > --- /dev/null
> > +++ b/arch/powerpc/boot/dts/mpc8314e.dtsi
> > @@ -0,0 +1,7 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +// Copyright 2024 J. Neuschäfer
> > +#include "mpc8315e.dtsi"
> > +
> > +/* MPC8314E does not support SATA */
> > +/delete-node/ &sata0;
> > +/delete-node/ &sata1;
> 
> 
> You should not delete nodes. That's not really maintainable code. Either
> this is in base DTSI or it does not. If it does exist, then this delete
> is incorrect.
> 
> If it does not delete, you are not supposed to include other SoC/device
> which is not the subset of this one, so your includes are not correct.

With that in mind, I think it makes sense to structure these (up to)
four devices the other way around:

- MPC8314 as the base, because it has the least features
- MPC8314E, MPC8315E, and the currently unused MPC8315 based on MPC8314

I'll do that.

Best regards,
J. Neuschäfer

