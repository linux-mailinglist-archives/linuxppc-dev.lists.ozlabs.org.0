Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1874450E86B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Apr 2022 20:39:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KnDMK6b3Nz3bwp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Apr 2022 04:39:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.180;
 helo=mail-yw1-f180.google.com; envelope-from=rjwysocki@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KnDLw4dy5z2xgJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 04:39:20 +1000 (AEST)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-2f7c57ee6feso63644657b3.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Apr 2022 11:39:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qK8e2AVrSefevGs2imvyVDDkPKL0eZ2yImHKmj2kieU=;
 b=UTTGsYg0qBe9lCa+o0M+Baca/8+7tvbQ6LvcDO+lmNvfkdNRktZVPmAoQcB97xVEGy
 CARil0xeT2mdfgmYdO54v34TWVLXJySoWU0yTpo1l2B5Kcq+s/GxnIR+HIg5zKmDtZ2t
 ZC5dDRif58ike7Fgmu+k+Is5iwIFGCtcTtTZIO92YaHnVFmMFEh2dK09jr5Mr65XUY8O
 laGQA8K6oAeqjnVMpk+GUTFpGQxTj2QwKr3+/dYAhwgMy5cewaOpbFI58LTCHvVVco3W
 T/F9FHrL8DqD0FkiLzesxP3DWZFYKRobE3uZDOyiornmkQgULNNu7FsN8ZDrwAbjfTlL
 lY8A==
X-Gm-Message-State: AOAM533jBFnz9yNaKmpQn4XtwL622SznJ06OQtdTCe6VHHiR5qa1zwAc
 IsTYtwnpkNCby7yKeFl4mKK9YUQrIpB77eyftJY=
X-Google-Smtp-Source: ABdhPJyX2wtgcldMFdGQD6xuBRzIvUcLOck00Bh9QMuV5obcAZBrDOa4Dhb+1z3doxcjU9Q/k7OQjfZ8azxMw1ZuAQc=
X-Received: by 2002:a81:36cf:0:b0:2e5:2597:a026 with SMTP id
 d198-20020a8136cf000000b002e52597a026mr18178120ywa.301.1650911956879; Mon, 25
 Apr 2022 11:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220423150132.GA1552054@bhelgaas>
 <44ebf450aa3300e02aba6ec009d8bea20c0fc535.camel@linux.intel.com>
In-Reply-To: <44ebf450aa3300e02aba6ec009d8bea20c0fc535.camel@linux.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 25 Apr 2022 20:39:05 +0200
Message-ID: <CAJZ5v0hs1HPaJNZticZfxz+CeAVuq-Rrw7J50-wv6-wWn5L_2Q@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] PCI/PM: Fix pci_pm_suspend_noirq() to disable PTM
To: David Box <david.e.box@linux.intel.com>, Bjorn Helgaas <helgaas@kernel.org>
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
Cc: "sathyanarayanan.kuppuswamy@linux.intel.com"
 <sathyanarayanan.kuppuswamy@linux.intel.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Wysocki,
 Rafael J" <rafael.j.wysocki@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "koba.ko@canonical.com" <koba.ko@canonical.com>, "Jingar,
 Rajvi" <rajvi.jingar@intel.com>, Kai-Heng Feng <kai.heng.feng@canonical.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
 "baolu.lu@linux.intel.com" <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 25, 2022 at 8:33 PM David E. Box
<david.e.box@linux.intel.com> wrote:
>
> On Sat, 2022-04-23 at 10:01 -0500, Bjorn Helgaas wrote:
> > On Sat, Apr 23, 2022 at 12:43:14AM +0000, Jingar, Rajvi wrote:
> > > > -----Original Message-----
> > > > From: Bjorn Helgaas <helgaas@kernel.org>
> > > > On Thu, Apr 14, 2022 at 07:54:02PM +0200, Rafael J. Wysocki wrote:
> > > > > On 3/25/2022 8:50 PM, Rajvi Jingar wrote:
> > > > > > For the PCIe devices (like nvme) that do not go into D3 state still
> > > > > > need to
> > > > > > disable PTM on PCIe root ports to allow the port to enter a lower-
> > > > > > power PM
> > > > > > state and the SoC to reach a lower-power idle state as a whole. Move
> > > > > > the
> > > > > > pci_disable_ptm() out of pci_prepare_to_sleep() as this code path is
> > > > > > not
> > > > > > followed for devices that do not go into D3. This patch fixes the
> > > > > > issue
> > > > > > seen on Dell XPS 9300 with Ice Lake CPU and Dell Precision 5530 with
> > > > > > Coffee
> > > > > > Lake CPU platforms to get improved residency in low power idle states.
> > > > > >
> > > > > > Fixes: a697f072f5da ("PCI: Disable PTM during suspend to save power")
> > > > > > Signed-off-by: Rajvi Jingar <rajvi.jingar@intel.com>
> > > > > > Suggested-by: David E. Box <david.e.box@linux.intel.com>
> > > > > > ---
> > > > > >   drivers/pci/pci-driver.c | 10 ++++++++++
> > > > > >   drivers/pci/pci.c        | 10 ----------
> > > > > >   2 files changed, 10 insertions(+), 10 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
> > > > > > index 8b55a90126a2..ab733374a260 100644
> > > > > > --- a/drivers/pci/pci-driver.c
> > > > > > +++ b/drivers/pci/pci-driver.c
> > > > > > @@ -847,6 +847,16 @@ static int pci_pm_suspend_noirq(struct device
> > > > > > *dev)
> > > > > >       if (!pci_dev->state_saved) {
> > > > > >               pci_save_state(pci_dev);
> > > > > > +             /*
> > > > > > +              * There are systems (for example, Intel mobile chips
> > > > > > since
> > > > Coffee
> > > > > > +              * Lake) where the power drawn while suspended can be
> > > > significantly
> > > > > > +              * reduced by disabling PTM on PCIe root ports as this
> > > > > > allows the
> > > > > > +              * port to enter a lower-power PM state and the SoC to
> > > > > > reach a
> > > > > > +              * lower-power idle state as a whole.
> > > > > > +              */
> > > > > > +             if (pci_pcie_type(pci_dev) == PCI_EXP_TYPE_ROOT_PORT)
> > > > > > +                     pci_disable_ptm(pci_dev);
> > > >
> > > > Why is disabling PTM dependent on pci_dev->state_saved?  The point of
> > > > this is to change the behavior of the device, and it seems like we
> > > > want to do that regardless of whether the driver has used
> > > > pci_save_state().
> > >
> > > Because we use the saved state to restore PTM on the root port.
> > > And it's under this condition that the root port state gets saved.
> >
> > Yes, I understand that pci_restore_ptm_state() depends on a previous
> > call to pci_save_ptm_state().
> >
> > The point I'm trying to make is that pci_disable_ptm() changes the
> > state of the device, and that state change should not depend on
> > whether the driver has used pci_save_state().
>
> We do it here because D3 depends on whether the device state was saved by the
> driver.
>
>         if (!pci_dev->state_saved) {
>                 pci_save_state(pci_dev);
>
>                 /* disable PTM here */
>
>                 if (pci_power_manageable(pci_dev))
>                         pci_prepare_to_sleep(pci_dev);
>         }
>
>
> If we disable PTM before the check, we will have saved "PTM disabled" as the
> restore state. And we can't do it after the check as the device will be in D3.
>
> As to disabling PTM on all devices, I see no problem with this, but the
> reasoning is different. We disabled the root port PTM for power savings.

Right.  As per the comment explaining why it is disabled.

> >
> > When we're putting a device into a low-power state, I think we want to
> > disable PTM *always*, no matter what the driver did.  And I think we
> > want to do it for all devices, not just Root Ports.
> >
> > Bjorn
>
