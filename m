Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 423C0849F97
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Feb 2024 17:36:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=b1RMH9tz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTBpt1Mm9z3cPm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 03:36:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=b1RMH9tz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.183.200; helo=relay7-d.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTBp812LVz30YR
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 03:35:58 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C2DE2000C;
	Mon,  5 Feb 2024 16:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1707150952;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=vq+7j5rxUfbX5WXgjjUMJLefHoCSzp73T0/QzZgsJQ0=;
	b=b1RMH9tzIEZtvIz/qE6IM+rZBJEFptCrP116L6aKsjBxZ484rRCOYnu6uxibhlNrchhW09
	WkDDsVhsWh1GKP4Nznz6+g9CWjpcRCJxrNQhkOr5EOlwa71KLMrKjPqQ+Sdcz7ue+fiEqM
	qmx8CEztbG97ao52gOnkOnO2oKCzhekdwOEEkwkmz1LFKMydDrhLMeTEHIlH+c1/4qhMZz
	aoz6csxFiWLYE9CkM/1NncamijP3au1So3PepP7zh3+T6wTMb5s55Dul2asYDf0T73nQmD
	mS8qDH9dtHEH0IodS1uriDqd4ZPNF/dyV2ZcyRlsId4LhlwXWXTYsfrrTR7ggg==
Date: Mon, 5 Feb 2024 17:35:50 +0100
From: Herve Codina <herve.codina@bootlin.com>
To: Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v2 1/6] net: wan: Add support for QMC HDLC
Message-ID: <20240205173550.2a6b8f20@bootlin.com>
In-Reply-To: <d174364c12366b1f5eeb616cba078f6682d629f5.camel@redhat.com>
References: <20240130084035.115086-1-herve.codina@bootlin.com>
	<20240130084035.115086-2-herve.codina@bootlin.com>
	<b1968b5c7e88edd448d5f55b57dfa40257b2b06c.camel@redhat.com>
	<20240205152208.73535549@bootlin.com>
	<d174364c12366b1f5eeb616cba078f6682d629f5.camel@redhat.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.38; x86_64-redhat-linux-gnu)
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
Cc: Andrew Lunn <andrew@lunn.ch>, Vadim Fedorenko <vadim.fedorenko@linux.dev>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Mark Brown <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Jakub Kicinski <kuba@kernel.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 05 Feb 2024 16:49:33 +0100
Paolo Abeni <pabeni@redhat.com> wrote:

[...
> > > 
> > > In general is quite bad that the existing infra does not allow
> > > leveraging NAPI. Have you considered expanding the QMC to accomodate
> > > such user?  
> > 
> > I cannot mask/unmask the 'end of transfer' interrupt.
> > Indeed, other streams use this interrupt among them audio streams and so
> > masking the interrupt for HDLC data will also mask the interrupt for audio
> > data.  
> 
> Uhm... I fear the above makes the available options list empty :(
> 
> > At the HDLC driver level, the best I can to is to store a queue of complete
> > HDLC skbs (queue filled on interrupts) and send them to the network stack
> > when the napi poll() is called.
> > 
> > I am not sure that this kind of queue (additional level between always
> > enabled interrupts and the network stack) makes sense.
> > 
> > Do you have any opinion about this additional queue management for NAPI
> > support?  
> 
> With such idea in place, what HDLC-level data will be accessed by the
> napi context? The RX interrupts will remain unmasked after the
> interrupt and before the napi poll right? That would be
> problematic/could cause drop if the ingress pkt/interrupt rate will be
> higher that what the napi could process - and that in turn could bring
> back old bad livelock times :(

Indeed.
So the best thing to do is to keep this driver without NAPI support.

Best regards,
Hervé
