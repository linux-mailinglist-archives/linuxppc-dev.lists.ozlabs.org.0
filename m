Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB2285B3D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 09:06:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463zv75XblzDqPf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 17:06:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=jniethe5@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ZWe0oN5D"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463zs451jCzDqd3
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 17:04:56 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id r7so43557988pfl.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Aug 2019 00:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:date:in-reply-to:references:user-agent
 :mime-version:content-transfer-encoding;
 bh=c0V14G8p6vykZnloanIkAZoD9oqigp3QjYkzIb2Hc1o=;
 b=ZWe0oN5D5Zy5T7YaFR9St99Jo6JmjkJi14QJ5Osjp1sJ5NrI15I+hK79FaZACBA39Q
 /F/cIb1lJixNbuzdRK9I0U6GFsVO7t8PlIa/dX1g3UcCVKjUSrIqv+3ihAdeGz74S/w5
 V06ZMdYVmWmvJE3k4WRudDpdZsNwlHgTQhzFnvhpas99ap/5JVc5YRPM/8eUfcG/6nV6
 X3Q7wRah5WUVk8wWcc5bX07R/q5qJnzQYDNtDZz82TQR59z4X5zMkWTcaBolZ8r5kjnL
 n8l5gNf68rWlKL3X3mpO7kZ955mIqJBhmZuHOCoMOJiXRtatuCq8drFcLMf9b2z+6t2w
 Y04w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=c0V14G8p6vykZnloanIkAZoD9oqigp3QjYkzIb2Hc1o=;
 b=T5AlWWJrRBKbjbLWVxn+wKonfj39TWe/jz6iBOXfcIEJR5k7FleMAcZZWdaswWKmzj
 xfmkOesFt/Dx1ODxEY4hRSd9M2rafbqyPi1vhlCZt3k9fmhpPAg9A872FQJJvlTkby3D
 PlTl9PWfqbJgfm+njX4ugMdT8otif5nND6A/TKmBVAih9I6FyStARv3n444K1/lVE/wf
 KlanNnqHabFOG3TS1q9r3uSWTY35tbGDm9XEj0CgMLWjD7+AtiYiGYVQKcBo5hp5d6BK
 WLH8i3qLTs1gleESl+ICgU0LY5XZV6jgSoK3O76AZTdSBDw/vje2jPa7orUpipReclFL
 dBgg==
X-Gm-Message-State: APjAAAWhsxJWm4Hdb+U7ILTooK85BnW2dXBkI+IqldoR3egPdZxbKDTe
 yrvOsAoCTEwM1O1/9YsaIg4=
X-Google-Smtp-Source: APXvYqw3Kpfm7m3xqwdbpBXcwe6eH1Oau/rcb22sLtyVzkTdodoLiU9W6kgKf5OHApFtLSwUGvzAkA==
X-Received: by 2002:a17:90b:28f:: with SMTP id
 az15mr2509220pjb.18.1565247892731; 
 Thu, 08 Aug 2019 00:04:52 -0700 (PDT)
Received: from pasglop.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id x128sm137904538pfd.17.2019.08.08.00.04.51
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 00:04:52 -0700 (PDT)
Message-ID: <1da83896323a35fc91312cd8eaf3a82b819f84eb.camel@gmail.com>
Subject: Re: [PATCH v4 7/9] powerpc/eeh: Add bdfn field to eeh_dev
From: Jordan Niethe <jniethe5@gmail.com>
To: Sam Bobroff <sbobroff@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Date: Thu, 08 Aug 2019 17:04:49 +1000
In-Reply-To: <1cd007696df2db87a0b1e5677520806d4d9b3e24.1565149456.git.sbobroff@linux.ibm.com>
References: <cover.1565149456.git.sbobroff@linux.ibm.com>
 <1cd007696df2db87a0b1e5677520806d4d9b3e24.1565149456.git.sbobroff@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.1 (3.30.1-1.fc29) 
Mime-Version: 1.0
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

On Wed, 2019-08-07 at 13:44 +1000, Sam Bobroff wrote:
> From: Oliver O'Halloran <oohall@gmail.com>
> 
> Preparation for removing pci_dn from the powernv EEH code. The only
> thing we really use pci_dn for is to get the bdfn of the device for
> config space accesses, so adding that information to eeh_dev reduces
> the need to carry around the pci_dn.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> [SB: Re-wrapped commit message, fixed whitespace damage.]
> Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/eeh.h     | 2 ++
>  arch/powerpc/include/asm/ppc-pci.h | 2 ++
>  arch/powerpc/kernel/eeh_dev.c      | 2 ++
>  3 files changed, 6 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/eeh.h
> b/arch/powerpc/include/asm/eeh.h
> index 7f9404a0c3bb..bbe0798f6624 100644
> --- a/arch/powerpc/include/asm/eeh.h
> +++ b/arch/powerpc/include/asm/eeh.h
> @@ -121,6 +121,8 @@ static inline bool eeh_pe_passed(struct eeh_pe
> *pe)
>  struct eeh_dev {
>  	int mode;			/* EEH mode			*/
>  	int class_code;			/* Class code of the device	
> */
> +	int bdfn;			/* bdfn of device (for cfg ops) */
> +	struct pci_controller *controller;

The other members of the structure get a comment, maybe it would be
more consistant if this one did too?

>  	int pe_config_addr;		/* PE config address		
> */
>  	u32 config_space[16];		/* Saved PCI config space	
> */
>  	int pcix_cap;			/* Saved PCIx capability	
> */
> diff --git a/arch/powerpc/include/asm/ppc-pci.h
> b/arch/powerpc/include/asm/ppc-pci.h
> index cec2d6409515..72860de205a0 100644
> --- a/arch/powerpc/include/asm/ppc-pci.h
> +++ b/arch/powerpc/include/asm/ppc-pci.h
> @@ -74,6 +74,8 @@ static inline const char *eeh_driver_name(struct
> pci_dev *pdev)
>  
>  #endif /* CONFIG_EEH */
>  
> +#define PCI_BUSNO(bdfn) ((bdfn >> 8) & 0xff)
> +
>  #else /* CONFIG_PCI */
>  static inline void init_pci_config_tokens(void) { }
>  #endif /* !CONFIG_PCI */
> diff --git a/arch/powerpc/kernel/eeh_dev.c
> b/arch/powerpc/kernel/eeh_dev.c
> index c4317c452d98..7370185c7a05 100644
> --- a/arch/powerpc/kernel/eeh_dev.c
> +++ b/arch/powerpc/kernel/eeh_dev.c
> @@ -47,6 +47,8 @@ struct eeh_dev *eeh_dev_init(struct pci_dn *pdn)
>  	/* Associate EEH device with OF node */
>  	pdn->edev = edev;
>  	edev->pdn = pdn;
> +	edev->bdfn = (pdn->busno << 8) | pdn->devfn;
> +	edev->controller = pdn->phb;
>  
>  	return edev;
>  }

