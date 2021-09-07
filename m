Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E6264021DD
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 04:05:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H3TBK2C2fz2ybK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Sep 2021 12:05:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=HDcmens1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::733;
 helo=mail-qk1-x733.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=HDcmens1; dkim-atps=neutral
Received: from mail-qk1-x733.google.com (mail-qk1-x733.google.com
 [IPv6:2607:f8b0:4864:20::733])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H3T9d3CTTz2xY7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Sep 2021 12:04:51 +1000 (AEST)
Received: by mail-qk1-x733.google.com with SMTP id f22so8608855qkm.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Sep 2021 19:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Cs7mCMI8BIob2gIpwkwVdKulQz4rvKjl/wf+ynJ6z9Y=;
 b=HDcmens1LBj3rKlpU88n/WQYdnrYpD37I8npnEyNuzee+6ZEblyd/Lr4TAgkqwMK6K
 R6hWuXJdkfWY9YsSrqKtNMelU45wevTKv4D3KGpqlE4aXcYgE+eBMk06rf9+vIcqvK65
 f6LIFboepPzZnEyOj08SsrrxZtUVy/RuJ54rs2JpyXwEworSh0cHJry4qFPQItAtFHzO
 rtp5xbXTmJYDHtaj9OYRWdIR9coIM0wC15tyRm0CcVTue4uH6/8HHgSowpVMJvyWr3Lr
 PjTTvD2VGBc5WESZaojfSJCRBFe3b6UqaIZJw2x8e/UuHtt//oOeB76EttA7HL2G5olL
 dyVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Cs7mCMI8BIob2gIpwkwVdKulQz4rvKjl/wf+ynJ6z9Y=;
 b=GIqud8sP+1lvHfIsd6Gsahd31c3NBWhEDntmdjOdESQNsoQK61t+zhqRRvXRWLHm4l
 gXTNmvFmi4i0pPJmqyUvkWjwsx5u2mVMpzMevdc7yEYtjN92938hbJ/lLgWX7lpQn7aL
 BoYx1x/OHNMYec9xrMSDhLENUsoTyIq2XPtIWvYPkyQe79mJrL+7AnHXuK2A8sbNfzr5
 novWFIXM9zTn5qZAwqxY22yRfl8CvQrfe3BUoZL/ZP1OgqVHa1l9jpOWBOQbbBk6+wFi
 1nJfTioC+jUzms7Jw0kazhmfnzClXKI/yk8oCx3q+B9yGQoFT02qpr3RBhW2oTu60pcq
 ziDw==
X-Gm-Message-State: AOAM531KeMPbFhlwIw3SVWrwpJeV/gb3BT9h+dYqFUMxpT96MI6F1Xl4
 x+JnMiQjGPgNEIaLn0vbTXJa6hXX15Xi9YuVA+8=
X-Google-Smtp-Source: ABdhPJyPg7oCTcfJ+n3qrn/GXcHEf5/fzs+entEJl9L+5Q4TATk2fCWAfQJ24e71W6LlWk7EKphw3XVEKn+yW1Ze+jE=
X-Received: by 2002:a05:620a:1299:: with SMTP id
 w25mr13651420qki.391.1630980286653; 
 Mon, 06 Sep 2021 19:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210906094927.524106-1-schnelle@linux.ibm.com>
In-Reply-To: <20210906094927.524106-1-schnelle@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 7 Sep 2021 12:04:35 +1000
Message-ID: <CAOSf1CFyuf9FaeSNparj+7W0mKTPvtcM8vxjHDSFsNDC6k_7xQ@mail.gmail.com>
Subject: Re: [PATCH 0/5] s390/pci: automatic error recovery
To: Niklas Schnelle <schnelle@linux.ibm.com>
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
Cc: linux-s390@vger.kernel.org, Pierre Morel <pmorel@linux.ibm.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Linas Vepstas <linasvepstas@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 6, 2021 at 7:49 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>
> Patch 3 I already sent separately resulting in the discussion below but without
> a final conclusion.
>
> https://lore.kernel.org/lkml/20210720150145.640727-1-schnelle@linux.ibm.com/
>
> I believe even though there were some doubts about the use of
> pci_dev_is_added() by arch code the existing uses as well as the use in the
> final patch of this series warrant this export.

The use of pci_dev_is_added() in arch/powerpc was because in the past
pci_bus_add_device() could be called before pci_device_add(). That was
fixed a while ago so It should be safe to remove those calls now.

> Patch 4 "PCI: Export pci_dev_lock()" is basically an extension to commit
> e3a9b1212b9d ("PCI: Export pci_dev_trylock() and pci_dev_unlock()") which
> already exported pci_dev_trylock(). In the final patch we make use of
> pci_dev_lock() to wait for any other exclusive uses of the pdev to be finished
> before starting recovery.

Hmm, I noticed the EEH
(arch/powerpc/kernel/eeh_driver.c:eeh_pe_report_edev())  and the
generic PCIe error recovery code (see
drivers/pci/pcie/err.c:report_error_detected()) only call
device_lock() before entering the driver's error handling callbacks. I
wonder if they should be using pci_dev_lock() instead. The only real
difference is that pci_dev_lock() will also block user space from
accessing the device's config space while error recovery is in
progress which seems sensible enough.
