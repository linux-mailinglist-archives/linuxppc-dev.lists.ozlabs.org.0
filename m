Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C4519CF89
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 06:52:50 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tncH0YdJzDr0t
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 15:52:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1041;
 helo=mail-pj1-x1041.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vabQ03yg; dkim-atps=neutral
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tnZm1djfzDqP3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 15:51:28 +1100 (AEDT)
Received: by mail-pj1-x1041.google.com with SMTP id fh8so2468604pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Apr 2020 21:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=oteR2i2AegQm00umObXtdObSeT3RqVJH0jZFFrkDIkU=;
 b=vabQ03ygw6rjzCsyQnFCOBKpyMolJJQ9VO6KuPvc8FqfEqIJQU/ta6utyFdx166WQ2
 UTPUJawNSWMv6ZOe32zihX2EYMXHz9KQoT2yrd6yKAuPFAExGuHXo8xa7Td7LKt/cfjW
 NHQqhbP3ySFWgS4HvgNLHs0Ju3VEvPoGpzcFu8T5t+7wkoI5qyljwUN/CuVEay3HAUd8
 2XWjrWuJ4anWvFYy1g4h+jEQncAR+7W1f4AZyindFW3cL5U0tnsLlsBwRHhwgbGDWXkH
 Jdddw+c8oQ7QZTgkGqYzIfNMMbRHAYYo+Hl7+wM3h0Ki5+0uMA9RL9EskAF9Hrwn04GS
 rKcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=oteR2i2AegQm00umObXtdObSeT3RqVJH0jZFFrkDIkU=;
 b=aFieAcv/zPmKE4y2oHNqNcG8eU6NY7pkBghLdDqMzH9DhUOOczuZAh4PMnwfGuCIhV
 Zoa4lpxNlGwMFH9TLKnhovoz6eb+LIfNjvZeibg0MElvclcQpIQaU4wYr8Ha1BO4nDMs
 JCad7zuJYCJIQZlavL8GB5P5iQ7lgVRzP45+HKY+Z9HOQsTpdVEfnLm9HON/tLRRQQn0
 gbl2VK4OFW8FERKgiEMQJoGP+rwXc8GHyGWtsHtl8UC0twNdQLjEIuQRmFfNaDrkVEt7
 tt/l1lEUA5F6Yt8/wznLsrFrbVRA6W9pYrAS15/5s1UztZAup6DCU/KdntYKvHMsyDIL
 w/2Q==
X-Gm-Message-State: AGi0Puaqg2U5mIRyaVtplI0jZa6zwrYDkFJEH1uu91LCAGSHLDviOPa5
 NfBXk1cMzWftiLtQ7jrZwfVGI4xA
X-Google-Smtp-Source: APiQypKX/o8MyvR3iQV+/Il8o7pjczYBwrTmieWEvl/ZT3IjLK06bX+lKEVfRdn+SnLRKNmpehC3sQ==
X-Received: by 2002:a17:90a:290a:: with SMTP id
 g10mr2517007pjd.81.1585889484587; 
 Thu, 02 Apr 2020 21:51:24 -0700 (PDT)
Received: from 192-168-1-12.tpgi.com.au (220-245-129-32.tpgi.com.au.
 [220.245.129.32])
 by smtp.googlemail.com with ESMTPSA id my15sm5042428pjb.28.2020.04.02.21.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Apr 2020 21:51:24 -0700 (PDT)
Message-ID: <505121b7e9f40708aef50a2fae0932d3e535e616.camel@gmail.com>
Subject: Re: [PATCH 2/4] powerpc/eeh: Release EEH device state synchronously
From: Oliver O'Halloran <oohall@gmail.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Fri, 03 Apr 2020 15:51:18 +1100
In-Reply-To: <6b3ce475194cd3c1aefd876e311b5a218c3a627a.1585544197.git.sbobroff@linux.ibm.com>
References: <cover.1585544197.git.sbobroff@linux.ibm.com>
 <6b3ce475194cd3c1aefd876e311b5a218c3a627a.1585544197.git.sbobroff@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-03-30 at 15:56 +1100, Sam Bobroff wrote:
> EEH device state is currently removed (by eeh_remove_device()) during
> the device release handler, which is invoked as the device's reference
> count drops to zero. This may take some time, or forever, as other
> threads may hold references.
> 
> However, the PCI device state is released synchronously by
> pci_stop_and_remove_bus_device(). This mismatch causes problems, for
> example the device may be re-discovered as a new device before the
> release handler has been called, leaving the PCI and EEH state
> mismatched.
> 
> So instead, call eeh_remove_device() from the bus device removal
> handlers, which are called synchronously in the removal path.
> 
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
>  arch/powerpc/kernel/eeh.c         | 26 ++++++++++++++++++++++++++
>  arch/powerpc/kernel/pci-hotplug.c |  2 --
>  2 files changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 17cb3e9b5697..c36c5a7db5ca 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1106,6 +1106,32 @@ static int eeh_init(void)
>  
>  core_initcall_sync(eeh_init);
>  
> +static int eeh_device_notifier(struct notifier_block *nb,
> +			       unsigned long action, void *data)
> +{
> +	struct device *dev = data;
> +
> +	switch (action) {
> +	case BUS_NOTIFY_DEL_DEVICE:
> +		eeh_remove_device(to_pci_dev(dev));
> +		break;
> +	default:
> +		break;
> +	}

A comment briefly explaining why we're not doing anything in the add
case might be nice.

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>

> +	return NOTIFY_DONE;
> +}
> +
> +static struct notifier_block eeh_device_nb = {
> +	.notifier_call = eeh_device_notifier,
> +};
> +
> +static __init int eeh_set_bus_notifier(void)
> +{
> +	bus_register_notifier(&pci_bus_type, &eeh_device_nb);
> +	return 0;
> +}
> +arch_initcall(eeh_set_bus_notifier);
> +
>  /**
>   * eeh_add_device_early - Enable EEH for the indicated device node
>   * @pdn: PCI device node for which to set up EEH
> diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
> index d6a67f814983..28e9aa274f64 100644
> --- a/arch/powerpc/kernel/pci-hotplug.c
> +++ b/arch/powerpc/kernel/pci-hotplug.c
> @@ -57,8 +57,6 @@ void pcibios_release_device(struct pci_dev *dev)
>  	struct pci_controller *phb = pci_bus_to_host(dev->bus);
>  	struct pci_dn *pdn = pci_get_pdn(dev);
>  
> -	eeh_remove_device(dev);
> -
>  	if (phb->controller_ops.release_device)
>  		phb->controller_ops.release_device(dev);
>  

