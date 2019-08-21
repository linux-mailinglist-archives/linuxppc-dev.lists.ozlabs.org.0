Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB6597055
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 05:30:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CtT13LnHzDr80
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Aug 2019 13:29:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CtR65H97zDr0X
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Aug 2019 13:28:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 46CtR602z0z9s4Y;
 Wed, 21 Aug 2019 13:28:17 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Sam Bobroff <sbobroff@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 05/12] powerpc/eeh: EEH for pSeries hot plug
In-Reply-To: <72ae8ae9c54097158894a52de23690448de38ea9.1565930772.git.sbobroff@linux.ibm.com>
References: <cover.1565930772.git.sbobroff@linux.ibm.com>
 <72ae8ae9c54097158894a52de23690448de38ea9.1565930772.git.sbobroff@linux.ibm.com>
Date: Wed, 21 Aug 2019 13:28:13 +1000
Message-ID: <87ftlv5h9u.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: aik@ozlabs.ru, oohall@gmail.com, tyreld@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sam Bobroff <sbobroff@linux.ibm.com> writes:
> diff --git a/arch/powerpc/kernel/of_platform.c b/arch/powerpc/kernel/of_platform.c
> index 427fc22f72b6..11c807468ab5 100644
> --- a/arch/powerpc/kernel/of_platform.c
> +++ b/arch/powerpc/kernel/of_platform.c
> @@ -81,7 +81,8 @@ static int of_pci_phb_probe(struct platform_device *dev)
>  	pcibios_claim_one_bus(phb->bus);
>  
>  	/* Finish EEH setup */
> -	eeh_add_device_tree_late(phb->bus);
> +	if (!eeh_has_flag(EEH_FORCE_DISABLED))
> +		eeh_add_device_tree_late(phb->bus);

This breaks cell_defconfig which has CONFIG_EEH=n.

That's because while eeh_add_device_tree_late() has an empty definition
in that case, eeh_has_flag() and EEH_FORCE_DISABLED do not.

Let me know how you want to fix it, if it's small just send me an
incremental diff.

cheers
