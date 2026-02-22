Return-Path: <linuxppc-dev+bounces-17016-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCPsMPaJm2n21QMAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17016-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 23:57:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3E0170A7C
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Feb 2026 23:57:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fJzsY38wTz30FD;
	Mon, 23 Feb 2026 09:57:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771801073;
	cv=none; b=bmFu7LDk9LtR6/Z1wHvyuhLzaL9VIwpljPzabh42QPYmtVzsKn8BS/S57Asj7neS0kynYON/MQ4S5UCo6f6/ZfHjn/TijSgWgKKJ8wNbvT81h0SzaKT/wTHPrdv5XmaYMoUPM5ehhC+k1k0DU8KYWcocy3UwLzjdwqM5wrV/Rr2x7oxu3aMe0LcyLtzEDQWZKCR55Eaz/XtgaDMa/mC+iblyGqAwOj2CUaX23CKaWB7eCUnrq5ItRvQCl25yrWRROlECwVDzE+lqSOyVaF5mhVyp1fQlm66sXvvTr/+vuoD2DG4SxdUy2Tt9dqLUYB1iEuANsIFfLmfeXpYTpJ4G3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771801073; c=relaxed/relaxed;
	bh=x61JP+etTRQ861pjyF7vVsQLGayevNtjxLjoJXnwvRc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=T2r6f2QMMSM8euy16ibtkikKSsF/SmYacQ6SX5K6S9846XKlDQmsXfGiEp8NPcXannqzqF1oaWaltim6VHxumG7fk1fzEWYgqR227R/TLH/B+bkoH5UrHlmzmQ3M7HRRBD749gu6V9jMED5B0L8B8+XhwC2VtYYUyAPtGo7qKM2KTiZyKK+yrhOjYHc7Lh4tDE+7d+UEjbVTnLHmdK2fwZHv4IGS4Yq+V0lpI8/kLNtd/QpDHZFThSCxEyInem0p4QbU6hbLqrLBFINdzaW6u0whdknKuBh/dJ+rHu26GcxT5Icqp/JxN565dc2JwL08p8RFY52GIcBIPKSC3/H1Zw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PHcE3UBY; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=tglx@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=PHcE3UBY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=tglx@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fJzsX41vnz2xQB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Feb 2026 09:57:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3C28C6001D;
	Sun, 22 Feb 2026 22:57:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18C6DC116D0;
	Sun, 22 Feb 2026 22:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771801067;
	bh=fis4ioZILk6YcO2e9aX1BhjpjjEJRJjSqIX9ksTd+PI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=PHcE3UBYlVJH0/QQPn+Z3nz7JzCa7yUOXaHtfCJM9mBKSwkidICJuiiKLES+5qk0m
	 LHTaxT2ekSsK9lpRYAMiknXzd1i9tNLGUQH6XkDS0tS/mFEWG4wW48LFb87JpPmeoS
	 HIMExp8CNZhyLqeetuN86TAb5ykg48glOdjY7ZRGjgQ+PIhu57kU5lRcGeSe2OIh9v
	 xuO9l4k9WL/OzqMzt+99Pcw62wedxIO0YexlyOIaYPafoXZKO72jpzxDEC3YJgsU4Y
	 /ISB31GMzBzSViYDCWEXItlJ3/ZE4hxk+GQZhcU1Uq/ISbkCGPNtwWjAJuJ6TcjvJ1
	 JGSwpG5gjtNrQ==
From: Thomas Gleixner <tglx@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Ioana Ciornei <ioana.ciornei@nxp.com>,
 "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/6] irqchip/gic-v3-its: Add fsl_mc device plumbing to
 the msi-parent handling
In-Reply-To: <20260218135203.2267907-4-maz@kernel.org>
References: <20260218135203.2267907-1-maz@kernel.org>
 <20260218135203.2267907-4-maz@kernel.org>
Date: Sun, 22 Feb 2026 23:57:44 +0100
Message-ID: <87seasv11z.ffs@tglx>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.79 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17016-lists,linuxppc-dev=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:maz@kernel.org,m:ioana.ciornei@nxp.com,m:chleroy@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linuxppc-dev@lists.ozlabs.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[tglx@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tglx@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6E3E0170A7C
X-Rspamd-Action: no action

On Wed, Feb 18 2026 at 13:52, Marc Zyngier wrote:
> Make the ITS code aware of fsl_mc devices by plumbing the devid
> retrieval primitive.
>
> Signed-off-by: Marc Zyngier <maz@kernel.org>
> ---
>  drivers/irqchip/irq-gic-its-msi-parent.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/irqchip/irq-gic-its-msi-parent.c b/drivers/irqchip/irq-gic-its-msi-parent.c
> index 12f45228c8674..532c0d626ca04 100644
> --- a/drivers/irqchip/irq-gic-its-msi-parent.c
> +++ b/drivers/irqchip/irq-gic-its-msi-parent.c
> @@ -7,6 +7,7 @@
>  #include <linux/acpi_iort.h>
>  #include <linux/of_address.h>
>  #include <linux/pci.h>
> +#include <linux/fsl/mc.h>
>  
>  #include "irq-gic-its-msi-parent.h"
>  #include <linux/irqchip/irq-msi-lib.h>
> @@ -186,9 +187,11 @@ static int its_pmsi_prepare(struct irq_domain *domain, struct device *dev,
>  {
>  	struct msi_domain_info *msi_info;
>  	u32 dev_id;
> -	int ret;
> +	int ret = 0;
>  
> -	if (dev->of_node)
> +	if (dev_is_fsl_mc(dev))
> +		dev_id = fsl_mc_get_msi_id(dev);
> +	else if (dev->of_node)
>  		ret = of_pmsi_get_msi_info(domain->parent, dev, &dev_id, NULL);
>  	else
>  		ret = iort_pmsi_get_dev_id(dev, &dev_id);

This rejects as you are building against an unmerged change (I assume
it's Lorenzos GIC5 stuff). I can fix it up when applying.

Thanks,

        tglx

