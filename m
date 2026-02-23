Return-Path: <linuxppc-dev+bounces-17035-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPSyOJEXnGmq/gMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17035-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:02:09 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A9B3D1736EA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Feb 2026 10:02:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fKFFd1Qdvz3bkL;
	Mon, 23 Feb 2026 20:01:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771837269;
	cv=none; b=LYkaiaZKzUS9Qf/hVlb/XSh2FFPeTKndwrIzcKgWA2aTRNyhgfRYvK7G0sXPbE8H+6plGx465tRf1Z+sviLjQRW+aX2z1TcRROkHJvpY20sjoEUHjpMbuKw0rpV/5jTEPSMTBwMGKuhI8MLYgomH/h5hUBFEnIRkLkf9Q3BQ0hgSKDDYTLMvQFve+5zudIZW9LOYHGr0nZuVjWZaezA7XmSV1xKi5nWtgfKHzSYxLL4f9WHWuqsSItQbM4L32ls2pR0piTr/IJHpkHqhATmX5PLLvRiApsJ+w6BluFN2BArHBb3auVJvFaEUWW7Xn11+b6WI7wUdbVZRNZiyUj5NIA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771837269; c=relaxed/relaxed;
	bh=P5lFFDMfBIrpW6XseQq1jJQjIZGNoUH+oNYvxSeo3qs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iYPtFROyTgv4JB3a7Fr9SU31kuA88BQ4vjBKmQFmj14qpV2lzu59mv2v32BQVNRlVQ+JY86SQReStWw4Auqm//asWBfmz2JSHZnumCru58jmwowx4/U+/tmJgZmRM2Gm3obnQbdMKMEYd1zdMvyJNcduxyJ1ymNKeCYiPG1Hy14FhdDk6LplTKCElqw6R0gXN/sOEg9rBsv2/vhqbn8uOYasBa1CxP2p7snSFMqfkHQk+wFuJC0kQ+jhr6RHDdOhSuIVOKCu6rwa3+P5Fb+TEk4nXG28awU33uIa7Y2dRa2Cy4RTWwDbTKbFAh8U/m6DIiBfeLrC3AX5IYfYtx9Qhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MGC6nUA+; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MGC6nUA+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fKFFb5Nd7z3bf2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 20:01:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05FDF42D8B;
	Mon, 23 Feb 2026 09:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0789C116C6;
	Mon, 23 Feb 2026 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771837264;
	bh=4vuzCx1aOjRijmhGiJ5+UQ/LV7nStKuzYY7m4/tcVfc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=MGC6nUA+8iEkHYRirJB7Fcsr4TSf/P2GGv2A1OibnMvl75otkg0iwX0lTUqtPDN43
	 XqlhzXURlya0mXm/UG5rpAK+5iFNM4fOXrbOU5mP4QXNg0jisaAfQgRmJOVX8nsuYL
	 ZkkPwctaDiai5Lv2zFwqRlwKs7/ItkNZh66XdkS2gxdyIkNWH/vC0ydrjPG29gplEd
	 6N9vzfrI0+TWZPRSpEGcN3peP25qBdibf7cFf3EAuAtcbiEvaRrI5BuQ/dHLtjOESE
	 wk5TRZ/4BRK/Q7RdQGdHlGWhnfgmAdDoaT9XnTlGm8vxLH8ffNgnIvtB7sWGtGmQx+
	 Io5fZgB8X07dA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vuRoM-0000000Cun9-2AMJ;
	Mon, 23 Feb 2026 09:01:02 +0000
Date: Mon, 23 Feb 2026 09:01:02 +0000
Message-ID: <86qzqbal69.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to the msi-parent handling
In-Reply-To: <87seasv11z.ffs@tglx>
References: <20260218135203.2267907-1-maz@kernel.org>
	<20260218135203.2267907-4-maz@kernel.org>
	<87seasv11z.ffs@tglx>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
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
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: tglx@kernel.org, ioana.ciornei@nxp.com, chleroy@kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17035-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tglx@kernel.org,m:ioana.ciornei@nxp.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[maz@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A9B3D1736EA
X-Rspamd-Action: no action

On Sun, 22 Feb 2026 22:57:44 +0000,
Thomas Gleixner <tglx@kernel.org> wrote:
> 
> On Wed, Feb 18 2026 at 13:52, Marc Zyngier wrote:
> > Make the ITS code aware of fsl_mc devices by plumbing the devid
> > retrieval primitive.
> >
> > Signed-off-by: Marc Zyngier <maz@kernel.org>
> > ---
> >  drivers/irqchip/irq-gic-its-msi-parent.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
> > index 12f45228c8674..532c0d626ca04 100644
> > --- a/drivers/irqchip/irq-gic-its-msi-parent.c
> > +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
> > @@ -7,6 +7,7 @@
> >  #include <linux/acpi_iort.h>
> >  #include <linux/of_address.h>
> >  #include <linux/pci.h>
> > +#include <linux/fsl/mc.h>
> >  
> >  #include "irq-gic-its-msi-parent.h"
> >  #include <linux/irqchip/irq-msi-lib.h>
> > @@ -186,9 +187,11 @@ static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
> >  {
> >  	struct msi_domain_info *msi_info;
> >  	u32 dev_id;
> > -	int ret;
> > +	int ret = 0;
> >  
> > -	if (dev->of_node)
> > +	if (dev_is_fsl_mc(dev))
> > +		dev_id = fsl_mc_get_msi_id(dev);
> > +	else if (dev->of_node)
> >  		ret = of_pmsi_get_msi_info(domain->parent, dev, &dev_id, NULL);
> >  	else
> >  		ret = iort_pmsi_get_dev_id(dev, &dev_id);
> 
> This rejects as you are building against an unmerged change (I assume
> it's Lorenzos GIC5 stuff). I can fix it up when applying.

That was against vanilla 6.19. I'll rebase on -rc1 to satisfy myself
that this is still doing the right thing after the ACPI crap fest, and
repost the result.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

