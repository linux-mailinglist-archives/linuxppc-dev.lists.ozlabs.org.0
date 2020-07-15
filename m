Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5740E220357
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 06:22:15 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B643S4rv6zDqZm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 14:22:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::142;
 helo=mail-il1-x142.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bQAhGIZJ; dkim-atps=neutral
Received: from mail-il1-x142.google.com (mail-il1-x142.google.com
 [IPv6:2607:f8b0:4864:20::142])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B63zq2vpyzDqQX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 14:19:03 +1000 (AEST)
Received: by mail-il1-x142.google.com with SMTP id a11so844973ilk.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 21:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+vY2OIlneWe5ztE2bvwwhli0jm6HqPh+OWIpoUB8BSw=;
 b=bQAhGIZJE7XGnGYhwL0/1olYisauxe9ymI6u2tgG5vEOuz2Nq+QlDtF7dhHuDuByuD
 qW96jNuM4d+gf7D3wc8J8orrZQS9iM0Icv2ATeffIzl0qNeTkHmX83cMCjFi8nTTJm5v
 7ig6QsacBF0GCuiO/mGKrMcs7KLcULwA6yDS5Bhdj00wAveDS58I1htt6LsbCi5aopAo
 94cRQMbn77WvY0ntAe3eMQsVBODihtWQxeS8Nk4f6gtDn95RBRSxHL19GMAyBDy2dM6S
 N6sPHPVxHB/cnaCH/kcUf5eC7pYe8YR2n8bCiJu6OiN1Jb3CBLYelLNvpnWbwRHuU5zs
 q8/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+vY2OIlneWe5ztE2bvwwhli0jm6HqPh+OWIpoUB8BSw=;
 b=WrvCndJUY1mEFV3cbJI4+t1ATU8vT7/TsnIfjsml00IJDsRRUBUQ2E8RiGrKo9TNDe
 cprJikvWLNJN1LxadLteEziwTI2L3LFrbZuEzrfRB+aH3w390S9XilW2Ojz+uf5ZJ787
 07/BZWApO4xaxhrcx4jsmhUw6yeHPn0z/sKg8I627WB45uS4ck0hzITBf7KX9jADokGk
 4A9mKjssnW6Ev2kKoLZq3pTuSoFN50rZH46/jZuapeGexgwGGHH5uiseuqqqVqpL9DGq
 MQcXSlmC/gx4RH15rYBGi5WT5nrFByAaHpdbB/g7OC7DJyGGSZ3Cqvz+XWC3sBVLM4f7
 WLaQ==
X-Gm-Message-State: AOAM531WKlvv+xscTDfU1TG481R4ag5I06DfwbJYhAOZW5S3cMKOWxJ6
 H18KII1O9+tB784xA8WzwQz0UOhqFxgbXqqTGAg=
X-Google-Smtp-Source: ABdhPJxbEVXkXtWoblqKfj5L8JbBLsjm2+xbwAB3m5diPF3AzSD/1a23QyEn3OuWSfYYBfrU93OGI/PkJJ/ZoDLhhcU=
X-Received: by 2002:a92:9a97:: with SMTP id c23mr8119143ill.258.1594786739362; 
 Tue, 14 Jul 2020 21:18:59 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a3NWSZw6678k1O2eJ6-c5GuW7484PRvEzU9MEPPrCD-yw@mail.gmail.com>
 <20200714184550.GA397277@bjorn-Precision-5520>
 <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3EZX8=649R9cYF6_=ivh1Xyrgsc5mUtS=d5yvQ3doZaQ@mail.gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 15 Jul 2020 14:18:47 +1000
Message-ID: <CAOSf1CEviMYySQhyQGks8hHjST-85wGpxEBasuxwSX_homBJ2A@mail.gmail.com>
Subject: Re: [RFC PATCH 00/35] Move all PCIBIOS* definitions into arch/x86
To: Arnd Bergmann <arnd@arndb.de>
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-pci <linux-pci@vger.kernel.org>, bjorn@helgaas.com,
 Paul Mackerras <paulus@samba.org>, sparclinux <sparclinux@vger.kernel.org>,
 Toan Le <toan@os.amperecomputing.com>, Christoph Hellwig <hch@lst.de>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Rob Herring <robh@kernel.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Sagi Grimberg <sagi@grimberg.me>, Kevin Hilman <khilman@baylibre.com>,
 Russell King <linux@armlinux.org.uk>, Ley Foon Tan <ley.foon.tan@intel.com>,
 Greg Ungerer <gerg@linux-m68k.org>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Jakub Kicinski <kuba@kernel.org>, Matt Turner <mattst88@gmail.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Guenter Roeck <linux@roeck-us.net>, Bjorn Helgaas <helgaas@kernel.org>,
 Ray Jui <rjui@broadcom.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Jens Axboe <axboe@fb.com>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Shuah Khan <skhan@linuxfoundation.org>, Keith Busch <kbusch@kernel.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Richard Henderson <rth@twiddle.net>, Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 "Saheed O. Bolarinwa" <refactormyself@gmail.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Bjorn Helgaas <bhelgaas@google.com>, "David S. Miller" <davem@davemloft.net>,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 15, 2020 at 8:03 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> - Most error checking is static: PCIBIOS_BAD_REGISTER_NUMBER
>   only happens if you pass an invalid register number, but most
>   callers pass a compile-time constant register number that is
>   known to be correct, or the driver would never work. Similarly,
>   PCIBIOS_DEVICE_NOT_FOUND wouldn't normally happen
>   since you pass a valid pci_device pointer that was already
>   probed.

Having some feedback about obvious programming errors is still useful
when doing driver development. Reporting those via printk() would
probably be more useful to those who care though.

> - config space accesses are very rare compared to memory
>   space access and on the hardware side the error handling
>   would be similar, but readl/writel don't return errors, they just
>   access wrong registers or return 0xffffffff.
>   arch/powerpc/kernel/eeh.c has a ton extra code written to
>   deal with it, but no other architectures do.

TBH the EEH MMIO hooks were probably a mistake to begin with. Errors
detected via MMIO are almost always asynchronous to the error itself
so you usually just wind up with a misleading stack trace rather than
any kind of useful synchronous error reporting. It seems like most
drivers don't bother checking for 0xFFs either and rely on the
asynchronous reporting via .error_detected() instead, so I have to
wonder what the point is. I've been thinking of removing the MMIO
hooks and using a background poller to check for errors on each PHB
periodically (assuming we don't have an EEH interrupt) instead. That
would remove the requirement for eeh_dev_check_failure() to be
interrupt safe too, so it might even let us fix all the godawful races
in EEH.

> - If we add code to detect errors in pci_read_config_*
>   and do some of the stuff from powerpc's
>   eeh_dev_check_failure(), we are more likely to catch
>   intermittent failures when drivers don't check, or bugs
>   with invalid arguments in device drivers than relying on
>   drivers to get their error handling right when those code
>   paths don't ever get covered in normal testing.

Adding some kind of error detection to the generic config accessors
wouldn't hurt, but detection is only half the problem. The main job of
eeh_dev_check_failure() is waking up the EEH recovery thread which
actually handles notifying drivers, device resets, etc and you'd want
something in the PCI core. Right now there's two implementations of
that reporting logic: one for EEH in arch/powerpc/eeh_driver.c and one
for AER/DPC in drivers/pci/pcie/err.c. I think the latter could be
moved into the PCI core easily enough since there's not much about it
that's really specific to PCIe. Ideally we could drop the EEH specific
one too, but I'm not sure how to implement that without it devolving
into callback spaghetti.

Oliver
