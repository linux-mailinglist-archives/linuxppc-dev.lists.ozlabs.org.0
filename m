Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0C78748AA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 08:27:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=P8vhRTSJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tr19942xJz3dgN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 18:27:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=P8vhRTSJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::225; helo=relay5-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr18S2brTz3cS3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 18:27:00 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B4D5C1C0008;
	Thu,  7 Mar 2024 07:26:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1709796409;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xj17IIU3mZI+eCLparz/ED3UapItdhG48ep26M0JvY0=;
	b=P8vhRTSJ518ktE6j0m/qxCBcIS1lVkemkyN85nYa4BoMpelyHYZzXuFRpZ1cWIGgeTKCBM
	ookJUy2RR8mU8frm6nQKWx70so7K3yARVwe6MrxU/w6HIftKGVPEbuZVFDLA4EnpwamyEJ
	Z0vxtCZdfs41BY05p4RLwWCA/sucJT8L5DAr5i3ZcDux/N3Nk/yzqInuObynnyOGFn3xJd
	rTC8IAzW+6rLPUp3V0/5+gSD6ythsBBsPWUOkccVjpTydkWwcoxfzUKjR3lJG71q7Jahwy
	EApL63PwkFSXpTgVVZTv4IV+mWrLvuuYWeo5CAELvB/7tMF6rCCOQMkR/aCTFw==
Date: Thu, 7 Mar 2024 08:26:46 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Yury Norov <yury.norov@gmail.com>
Subject: Re: [PATCH v6 4/5] net: wan: fsl_qmc_hdlc: Add runtime timeslots
 changes support
Message-ID: <20240307082646.6e9198df@bootlin.com>
In-Reply-To: <ZehqRMZwtazTf6P6@yury-ThinkPad>
References: <20240306080726.167338-1-herve.codina@bootlin.com>
	<20240306080726.167338-5-herve.codina@bootlin.com>
	<ZehqRMZwtazTf6P6@yury-ThinkPad>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: herve.codina@bootlin.com
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
Cc: Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yury,

On Wed, 6 Mar 2024 05:06:12 -0800
Yury Norov <yury.norov@gmail.com> wrote:

...
> > +static int qmc_hdlc_xlate_ts_info(struct qmc_hdlc *qmc_hdlc,
> > +				  const struct qmc_chan_ts_info *ts_info, u32 *slot_map)
> > +{
> > +	DECLARE_BITMAP(ts_mask_avail, 64);
> > +	DECLARE_BITMAP(ts_mask, 64);
> > +	DECLARE_BITMAP(map, 64);
> > +	u32 array32[2];  
> 
> NIT. Bad name. I'd suggest slot_array, or something.
> 

A new iteration of this series is planned.
I will change to slot_array as suggested.

Best regards,
Hervé
