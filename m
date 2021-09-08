Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 141FA40323D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 03:38:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H44XC6tmkz2yRK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Sep 2021 11:38:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=bithVZit;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2c;
 helo=mail-qv1-xf2c.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=bithVZit; dkim-atps=neutral
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H44WX1kpmz2xYG
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Sep 2021 11:37:26 +1000 (AEST)
Received: by mail-qv1-xf2c.google.com with SMTP id gf5so351518qvb.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Sep 2021 18:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ciBzCjagQnTip0jhcuPtA6NB3onzElPc291uOOyrzyM=;
 b=bithVZitjX59Lt3RcjNnDfJU/uUHPRrRkBDyknarhntnoXj1G1iASqbCbdRhUo8Pt+
 FLV7z+W1O2JmgFRT+v3sCKCrhguRv38WbDPivEuQAOrdEMPR978YFR3uo5M1/7qdBI3L
 TVR/BczxCBKRzQm1liSpdbfmtiPuA/JChcClxVYzaFBzPn/Cy+Z8XC2f6n37GxzuY+k7
 mhKRqTyFNeV2HN22zApu3nlxxMFMxcSTf26Ecxz813ag7CQbzOdaOVR8LEX2t27h3E7L
 gypmOInhelID1nSq5dNuub0y5sPGnWK4RVggceJIxrdRlZthcZ/fZRuDxRVAl91y3Tci
 rQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ciBzCjagQnTip0jhcuPtA6NB3onzElPc291uOOyrzyM=;
 b=SHFE7KT2N6lvTn63PAOmBwA6mpCgiYMTx8rvtrIF4W5yePwdv4i3/YWSRKIvi/dn1c
 zl72Lq0nqP/8sqYYQj7PPTMq1E5Q8OFhmnDpI/XtfRLLMet0jv4zOcsBwUqJewsgYgGu
 glMYjTSq6WBHz+rMYM5jfjv8yfnVDtJ+TMl/BKDWLfijd/o+L/4+6bvnJV1I85lQIMTA
 XdbMfV82svEj5D94bvvKL9SmwleMBQNLqsulaPMJBj5XD+/mKz1O3q98mN8bp0deqjo2
 g6Uyaodb9xse20XUW8MDNsPrXaaPQkt/Enn/vj5FQcopKwiRLXa0QXIv8z54+v0CpRag
 VLsw==
X-Gm-Message-State: AOAM530IeDaqWhRIizUhJrQOgP3pYbHK9F/CV+dRdK5auBIJVrkcyelB
 oTyBu9v4tC4y5ZDTfZM7/PLO177F8S22KIuzd+Q=
X-Google-Smtp-Source: ABdhPJyZX8Ws4H4CK//9vF6DwOfMVVDxAED9g7heseyQVdqgO/Dg6FserqZ3XyM3raWxTLzCUa//Kzk5ma7acROdNGk=
X-Received: by 2002:a0c:80ce:: with SMTP id 72mr1195106qvb.39.1631065042341;
 Tue, 07 Sep 2021 18:37:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210906094927.524106-1-schnelle@linux.ibm.com>
 <CAOSf1CFyuf9FaeSNparj+7W0mKTPvtcM8vxjHDSFsNDC6k_7xQ@mail.gmail.com>
 <e739c2919f97e277849a1bc1324a20df6a7d59eb.camel@linux.ibm.com>
 <0c9326c943c0e6aa572cc132ee2deb952bf41c7f.camel@linux.ibm.com>
In-Reply-To: <0c9326c943c0e6aa572cc132ee2deb952bf41c7f.camel@linux.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Wed, 8 Sep 2021 11:37:11 +1000
Message-ID: <CAOSf1CH2T-R44qx1mGpJQ8WgD0upxG8sQNud_5L3SHYZJm9LRA@mail.gmail.com>
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

On Tue, Sep 7, 2021 at 10:21 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>
> On Tue, 2021-09-07 at 10:45 +0200, Niklas Schnelle wrote:
> > On Tue, 2021-09-07 at 12:04 +1000, Oliver O'Halloran wrote:
> > > On Mon, Sep 6, 2021 at 7:49 PM Niklas Schnelle <schnelle@linux.ibm.com> wrote:
> > > > Patch 3 I already sent separately resulting in the discussion below but without
> > > > a final conclusion.
> > > >
> > > > https://lore.kernel.org/lkml/20210720150145.640727-1-schnelle@linux.ibm.com/
> > > >
> > > > I believe even though there were some doubts about the use of
> > > > pci_dev_is_added() by arch code the existing uses as well as the use in the
> > > > final patch of this series warrant this export.
> > >
> > > The use of pci_dev_is_added() in arch/powerpc was because in the past
> > > pci_bus_add_device() could be called before pci_device_add(). That was
> > > fixed a while ago so It should be safe to remove those calls now.
> >
> > Hmm, ok that confirms Bjorns suspicion and explains how it came to be.
> > I can certainly sent a patch for that. This would then leave only the
> > existing use in s390 which I added because of a dead lock prevention
> > and explained here:
> > https://lore.kernel.org/lkml/87d15d5eead35c9eaa667958d057cf4a81a8bf13.camel@linux.ibm.com/
> >
> > Plus the need to use it in the recovery code of this series. I think in
> > the EEH code the need for a similar check is alleviated by the checks
> > in the beginning of
> > arch/powerpc/kernel/eeh_driver.c:eeh_handle_normal_event() especially
> > eeh_slot_presence_check() which checks presence via the hotplug slot.
> > I guess we could use our own state tracking in a similar way but felt
> > like pci_dev_is_added() is the more logical choice.

The slot check is mainly there to prevent attempts to "recover"
devices that have been surprise removed (i.e NVMe hot-unplug). The
actual recovery process operates off the eeh_pe tree which is frozen
in place when an error is detected. If a pci_dev is added or removed
it's not really a problem since those are only ever looked at when
notifying drivers which is done with the rescan_remove lock held. That
said, I wouldn't really encourage anyone to follow the EEH model since
it's pretty byzantine.

> Looking into this again, I think we actually can't easily track this
> state ourselves outside struct pci_dev. The reason for this is that
> when e.g. arch/s390/pci/pci_sysfs.c:recover_store() removes the struct
> pci_dev and scans it again the new struct pci_dev re-uses the same
> struct zpci_dev because from a platform point of view the PCI device
> was never removed but only disabled and re-enabled. Thus we can only
> distinguish the stale struct pci_dev by looking at things stored in
> struct pci_dev itself.

IMO the real problem is removing and re-adding the pci_dev. I think
it's something that's done largely because the PCI core doesn't really
provide any better mechanism for getting a device back into a
known-good state so it's abused to implement error recovery. This is
something that's always annoyed me since it conflates recovery with
hotplug. After a hot-(un)plug we might have a different device or no
device. In the recovery case we expect to start and end with the same
device. Why not apply the same logic to the pci_dev?

Something I was tinkering with before I left IBM was re-working the
way EEH handles recovering devices that don't have a driver with error
handling callbacks to something like:

1. unbind the driver
2. pci_save_state()
3. do the reset
4. pci_restore_state()
5. re-bind the driver

That would allow keeping the pci_dev around and let me delete a pile
of confusing code which handles binding the eeh_dev to the new
pci_dev. The obvious problem with that approach is the assumption the
device is functional enough to allow saving the config space, but I
don't think that's a deal breaker. We could stash a copy of the device
state before we allow drivers to attach and use that to restore the
device after the reset. The end result would be the same known-good
state that we'd get after a re-scan.

> That said, I think for the recovery case we might be able to drop the
> pci_dev_is_added() and rely on pdev->driver != NULL which we check
> anyway and that should catch any PCI device that was already removed.

Would that work if there was an error on a device without a driver
bound? If you're just trying to stop races between recovery and device
removal then pci_dev_is_added() is probably the right tool for the
job. Trying to substitute it with a proxy seems like a bad idea.
