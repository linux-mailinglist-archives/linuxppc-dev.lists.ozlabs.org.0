Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D601A7ACA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 07:39:05 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46NXgS4jrQzDqqY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Sep 2019 15:39:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="F++lDZyr"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46NXdW1HR0zDqjy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Sep 2019 15:37:16 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id 205so10041880pfw.2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Sep 2019 22:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=uE8xeQ7vNKg/s6NUUP8wb0BKxjOZa8xbhpDvYMGFXO0=;
 b=F++lDZyrC2eVfSHOVXko4T72RXSBTSeAwJG9fgn3u+9G8PDwCa14qTG/cIwj22Rf8g
 t7Jj5s6mmPoxTiaGxRI+uL++ezS8u99rA7WC/BfzO0bw/YcMls1HLcjRefL/HWcWtpdm
 ikM3u7yNhgXgUbQH677gq7iYdwGzCBexvY1TB9j4y6VN6fklGpWW4Pb8vcth+gyivJ8v
 EW1g5vhaK1gxoCf9BwoXYdLp55WYwSZ6cFe+IHAAkBw7drh+BpzACjY/BzEXxDmbx0PW
 MZ0lCGNx2sRsS+fhekgSWR/JTXrnIX2zl5xglYiOuNxAE6BXtthXoFQJ4ym0MIN7pmNW
 yUbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=uE8xeQ7vNKg/s6NUUP8wb0BKxjOZa8xbhpDvYMGFXO0=;
 b=tA4955ZZJ3cja/T80Han19wcTL/OrmYcHdM7xzC0dIKuyohzpd4WAFrTfuDT1Ve79I
 UtdJTJiBWxX8JdGoCBI3Z3s2GzEqfgLsoh6IgrPlicXmn0va6SfXRh3xrp9EhHGtXiuv
 mOBafCKG/nIJSQWa6Lg7HZdZOadzjWVZwI8qVj7IXrS/n9nR9HCcmnZ2/onXeD945OIA
 6UgJpHsa780wxf5zpeRY7hijYwe3x8mbyqhUxRw7nXMP5+Jg99nEj9Y2YVFduY9UTSxd
 uOHUojixvibAxZz2xp1l5492XJ7OnORAjHJILaDHrFsYfaIymVxTcYCIkxl48I3zY5ri
 rZvQ==
X-Gm-Message-State: APjAAAV2PP6KVceK7rptFYYNvtko9HbptttkwOKFudZFcWgK0tWb+2rq
 W9Dwysa7jsAlUmbml3iH//o=
X-Google-Smtp-Source: APXvYqyEFAAw+BNftadAQ4oorLGOkbtIzvUAeY+P0+LwqoUZPLjHBY7F2Cw7K1dHnhI8XPJEakvcZQ==
X-Received: by 2002:a17:90a:360b:: with SMTP id
 s11mr3254703pjb.30.1567575432983; 
 Tue, 03 Sep 2019 22:37:12 -0700 (PDT)
Received: from wafer.ozlabs.ibm.com ([122.99.82.10])
 by smtp.googlemail.com with ESMTPSA id q33sm2063273pja.29.2019.09.03.22.37.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2019 22:37:12 -0700 (PDT)
Message-ID: <026a6bfbfd8268c5158bc48fb43907cc13442561.camel@gmail.com>
Subject: Re: [PATCH v5 18/23] powerpc/pci: Handle BAR movement
From: Oliver O'Halloran <oohall@gmail.com>
To: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>, 
 linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Date: Wed, 04 Sep 2019 15:37:07 +1000
In-Reply-To: <20190816165101.911-19-s.miroshnichenko@yadro.com>
References: <20190816165101.911-1-s.miroshnichenko@yadro.com>
 <20190816165101.911-19-s.miroshnichenko@yadro.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.4 (3.32.4-1.fc30) 
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
Cc: Bjorn Helgaas <helgaas@kernel.org>, linux@yadro.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 2019-08-16 at 19:50 +0300, Sergey Miroshnichenko wrote:
> Add pcibios_rescan_prepare()/_done() hooks for the powerpc platform. Now if
> the device's driver supports movable BARs, pcibios_rescan_prepare() will be
> called after the device is stopped, and pcibios_rescan_done() - before it
> resumes. There are no memory requests to this device between the hooks, so
> it it safe to rebuild the EEH address cache during that.
> 
> CC: Oliver O'Halloran <oohall@gmail.com>
> Signed-off-by: Sergey Miroshnichenko <s.miroshnichenko@yadro.com>
> ---
>  arch/powerpc/kernel/pci-hotplug.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-hotplug.c
> index 0b0cf8168b47..18cf13bba228 100644
> --- a/arch/powerpc/kernel/pci-hotplug.c
> +++ b/arch/powerpc/kernel/pci-hotplug.c
> @@ -144,3 +144,13 @@ void pci_hp_add_devices(struct pci_bus *bus)
>  	pcibios_finish_adding_to_bus(bus);
>  }
>  EXPORT_SYMBOL_GPL(pci_hp_add_devices);
> +
> +void pcibios_rescan_prepare(struct pci_dev *pdev)
> +{
> +	eeh_addr_cache_rmv_dev(pdev);
> +}
> +
> +void pcibios_rescan_done(struct pci_dev *pdev)
> +{
> +	eeh_addr_cache_insert_dev(pdev);
> +}

Is this actually sufficent? The PE number for a device is largely
determined by the location of the MMIO BARs. If you move a BAR far
enough the PE number stored in the eeh_pe would need to be updated as
well.

