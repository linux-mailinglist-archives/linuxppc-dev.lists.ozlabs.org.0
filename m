Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A01B2BEB3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 07:41:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45CjQW1FZFzDqMy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2019 15:41:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="VGP8dMK+"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45CjJb6Q8wzDqJg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2019 15:36:47 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id n5so8575364ioc.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 May 2019 22:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uOPv1qTEBbFYjQNPzSNmFNcH/nt/LDTtFw6ta2rIGHU=;
 b=VGP8dMK+aCp5KkT/EOWIZEoyi3SA+Jsz+tKSTdgYoFe0SJfO4sC9foGEr3wdQPpTLL
 HH3AfYgsgTNmt5iv9eQdfjbRlcTydjdt3PBg0YKp8fu7PDBjKD9rAaJNWDf1nGmiBC+a
 qjUQXVWoj8AGsx8t6/A6Ib17QYc01FBDEhYySq7w9uHaH2Lx78sExNDSBQ4CEeVqn6tB
 0MA7ENJ95MVHo6RKAbUCifU96QXrAHg+ZZ1n2Y6HMFEtx1YyP61SSdDaJ0MA6SEbZx/0
 3Gdq0ksWRgQIHl7UI+0w1InHjjfDeNR43Ozzpg/5DhJWkvDpYQvBHZwXCIdda77qFhmO
 jeUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uOPv1qTEBbFYjQNPzSNmFNcH/nt/LDTtFw6ta2rIGHU=;
 b=qY6MxlGR15oSdmKprMhv/8nxHWT9bWb/26KfvkG4gdUc12SnMNXslqOMm/HS8ORp1f
 Slj9Z/e8ZgJYQv0doPPEQBxyEFmtz9Xv1L4CttWK0/yiMfFCFdta48Y9gMVOg59MHGT+
 ZPlw8obrPFvD8o9inFzhE2F0CD56xv9sxk0n+5CZEL39NOs5yyXcf0FUNyFOdhpW4G+R
 WcdEMZRHJC+FI46NHaZpJe5lNV7GUL7N2YCrfdTgGSVIbE4RZQAjLdtrOpdPfhJEKqAr
 WaPow+M0lQUdvyRlW160LCl3sMN5obUNqZke2tFq2aNBmJVysWj9MxqTuzR4RukIuFRZ
 PFGg==
X-Gm-Message-State: APjAAAWezsijDppEc3LCPD+F9A2ujgjUnu7+Yy/uSHYWBylRLEeOlyhj
 98BFOk8mJxOYSenJ1AeeaoXCrD7OaOarSg21gd8=
X-Google-Smtp-Source: APXvYqyz8usNLv2CoGQTSe4nisOC+2Z6g2EAsInvH/MLl7QMebVv5X/qtF6kReCo+Llk3AM1TIYUPBqdv2ajpBFJtEE=
X-Received: by 2002:a5e:c70c:: with SMTP id f12mr7539299iop.293.1559021805684; 
 Mon, 27 May 2019 22:36:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190528040313.35582-1-shawn@anastas.io>
 <20190528040313.35582-2-shawn@anastas.io>
In-Reply-To: <20190528040313.35582-2-shawn@anastas.io>
From: Oliver <oohall@gmail.com>
Date: Tue, 28 May 2019 15:36:34 +1000
Message-ID: <CAOSf1CEFfbmwfvmdqT1xdt8SFb=tYdYXLfXeyZ8=iRnhg4a3Pg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] PCI: Introduce pcibios_ignore_alignment_request
To: Shawn Anastasio <shawn@anastas.io>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Sam Bobroff <sbobroff@linux.ibm.com>, linux-pci@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rppt@linux.ibm.com,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>,
 xyjxie@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 28, 2019 at 2:03 PM Shawn Anastasio <shawn@anastas.io> wrote:
>
> Introduce a new pcibios function pcibios_ignore_alignment_request
> which allows the PCI core to defer to platform-specific code to
> determine whether or not to ignore alignment requests for PCI resources.
>
> The existing behavior is to simply ignore alignment requests when
> PCI_PROBE_ONLY is set. This is behavior is maintained by the
> default implementation of pcibios_ignore_alignment_request.
>
> Signed-off-by: Shawn Anastasio <shawn@anastas.io>
> ---
>  drivers/pci/pci.c   | 9 +++++++--
>  include/linux/pci.h | 1 +
>  2 files changed, 8 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> index 8abc843b1615..8207a09085d1 100644
> --- a/drivers/pci/pci.c
> +++ b/drivers/pci/pci.c
> @@ -5882,6 +5882,11 @@ resource_size_t __weak pcibios_default_alignment(void)
>         return 0;
>  }
>
> +int __weak pcibios_ignore_alignment_request(void)
> +{
> +       return pci_has_flag(PCI_PROBE_ONLY);
> +}
> +
>  #define RESOURCE_ALIGNMENT_PARAM_SIZE COMMAND_LINE_SIZE
>  static char resource_alignment_param[RESOURCE_ALIGNMENT_PARAM_SIZE] = {0};
>  static DEFINE_SPINLOCK(resource_alignment_lock);
> @@ -5906,9 +5911,9 @@ static resource_size_t pci_specified_resource_alignment(struct pci_dev *dev,
>         p = resource_alignment_param;
>         if (!*p && !align)
>                 goto out;
> -       if (pci_has_flag(PCI_PROBE_ONLY)) {
> +       if (pcibios_ignore_alignment_request()) {
>                 align = 0;
> -               pr_info_once("PCI: Ignoring requested alignments (PCI_PROBE_ONLY)\n");
> +               pr_info_once("PCI: Ignoring requested alignments\n");
>                 goto out;
>         }

I think the logic here is questionable to begin with. If the user has
explicitly requested re-aligning a resource via the command line then
we should probably do it even if PCI_PROBE_ONLY is set. When it breaks
they get to keep the pieces.

That said, the real issue here is that PCI_PROBE_ONLY probably
shouldn't be set under qemu/kvm. Under the other hypervisor (PowerVM)
hotplugged devices are configured by firmware before it's passed to
the guest and we need to keep the FW assignments otherwise things
break. QEMU however doesn't do any BAR assignments and relies on that
being handled by the guest. At boot time this is done by SLOF, but
Linux only keeps SLOF around until it's extracted the device-tree.
Once that's done SLOF gets blown away and the kernel needs to do it's
own BAR assignments. I'm guessing there's a hack in there to make it
work today, but it's a little surprising that it works at all...

IIRC Sam Bobroff was looking at hotplug under pseries recently so he
might have something to add. He's sick at the moment, but I'll ask him
to take a look at this once he's back among the living

> diff --git a/include/linux/pci.h b/include/linux/pci.h
> index 4a5a84d7bdd4..47471dcdbaf9 100644
> --- a/include/linux/pci.h
> +++ b/include/linux/pci.h
> @@ -1990,6 +1990,7 @@ static inline void pcibios_penalize_isa_irq(int irq, int active) {}
>  int pcibios_alloc_irq(struct pci_dev *dev);
>  void pcibios_free_irq(struct pci_dev *dev);
>  resource_size_t pcibios_default_alignment(void);
> +int pcibios_ignore_alignment_request(void);
>
>  #ifdef CONFIG_HIBERNATE_CALLBACKS
>  extern struct dev_pm_ops pcibios_pm_ops;
> --
> 2.20.1
>
