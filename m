Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECAE4096A7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 16:59:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7V4K1Srtz2ynm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 00:59:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qnKybz0B;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::735;
 helo=mail-qk1-x735.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=qnKybz0B; dkim-atps=neutral
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7V3d0kdXz2xrT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 00:58:34 +1000 (AEST)
Received: by mail-qk1-x735.google.com with SMTP id t190so10781941qke.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 07:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PFD9mJaBzJKTsxm4rXZDM/y2enE6R8R76CfOiZbw4HU=;
 b=qnKybz0B5oVmKPyqgPGoezg+mvumei8Ol/qbWrUBL+z62ewI9zUSkCFC3ftaPqEqcc
 gLXcRv87aSGCie0vaSkzGAl3kQXgkC4/cMVUpMQKuDFKsBoAS1IHqTdxQysnbdczJOs9
 Pu4STzHY57inMcRXJrQE9hKsnpZnUcw1041ZMn2SnOmiKaSW4im8jgqnPDHDkRaS2hMO
 FCbdndbc1iePtXhGd4fN5oN1itGrF+DfjK1T8umBrN34OGUzoiXQwF4C2w00P084yeq2
 OrUAHxHaX2SdmfZ1QcojHh7rP7jANKFxLBSi96UHn/K2atcNAZ+bcklkrFxEjvEReeXV
 MQ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PFD9mJaBzJKTsxm4rXZDM/y2enE6R8R76CfOiZbw4HU=;
 b=AFmrqnO1yUoqYewD3TcVdhDaFA1Cv/4OBaVBq1jXrsprww7i8/Ia0++xBVPO6rXyPi
 1N9nI7KdMftY5wW28Oifvh2tpNq9yaWiCU/uH8EVj/4lZjwW60gf7KQLjPgVCpZRa42F
 g3W58ql7tQYXNfCnELq7j0GRBdZcvDxIzQk5SvBOO+9Argmh+sVf6G5SXiVpQagI7Bps
 yv2//H04/u014dhhTATxi8uuwto6/pm7gpz90BsKaiEMkY37hAthPTCLD2nlfKnt8JHn
 WYNZpgeTVZ5hOBvIottiSmMDdWpgr4CKY6gllukQN88pYsCGA/rkL/IauSjp+zvE/0Ed
 d9rQ==
X-Gm-Message-State: AOAM532izI/zQxX8ZkjeX9xPLRcpv+aPlE1Bz6eb6G3St6gpwhR11E0g
 HhrNDshCBCPlkElwNjkNEWHZx1tT/GJIkIyRsYY=
X-Google-Smtp-Source: ABdhPJwh26MSRjVjkR7VkLGGkQY2c6BDDe1IfCUBySjVHMeGamtvhofk0Vh4g8ftw3wylX8g4u0wJNN4bwP+UgU/wSA=
X-Received: by 2002:a05:620a:254d:: with SMTP id
 s13mr16048qko.264.1631545111542; 
 Mon, 13 Sep 2021 07:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210910141940.2598035-1-schnelle@linux.ibm.com>
 <20210910141940.2598035-2-schnelle@linux.ibm.com>
 <87wnnnl67a.fsf@mpe.ellerman.id.au>
In-Reply-To: <87wnnnl67a.fsf@mpe.ellerman.id.au>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 14 Sep 2021 00:58:20 +1000
Message-ID: <CAOSf1CEQB_Fz_yF0pgs6xqJJ2Say1a2XFjOedO2mE=Qn_BgbnQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] powerpc: Drop superfluous pci_dev_is_added() calls
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Niklas Schnelle <schnelle@linux.ibm.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-pci <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Sep 11, 2021 at 9:09 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Niklas Schnelle <schnelle@linux.ibm.com> writes:
> > On powerpc, pci_dev_is_added() is called as part of SR-IOV fixups
> > that are done under pcibios_add_device() which in turn is only called in
> > pci_device_add() whih is called when a PCI device is scanned.
>
> Thanks for cleaning this up for us.
>
> > Now pci_dev_assign_added() is called in pci_bus_add_device() which is
> > only called after scanning the device. Thus pci_dev_is_added() is always
> > false and can be dropped.
>
> My only query is whether we can pin down when that changed.
>
> Oliver said:
>
>   The use of pci_dev_is_added() in arch/powerpc was because in the past
>   pci_bus_add_device() could be called before pci_device_add(). That was
>   fixed a while ago so It should be safe to remove those calls now.
>
> I trawled back through the history a bit but I can't remember/find which
> commit changed that, Oliver can you remember?

Yeah, on closer inspection that never happened. The re-ordering I was
thinking of was when the boot-time BAR assignments were moved in
3f068aae7a95 so they'd always occur before pci_bus_add_device() was
called. I think I got that change mixed up with commit 30d87ef8b38d
("powerpc/pci: Fix pcibios_setup_device() ordering") which moved some
of what what pcibios_device_add() did into pcibios_bus_add_device() to
harmonise the hot and coldplug paths.

As far as I can tell the pci_dev_is_added() check has been pointless
since the code was added in 6e628c7d33d9 ("powerpc/powernv: Reserve
additional space for IOV BAR according to the number of total_pe").
Even back then pci_device_add() was called first in both the normal
and OF based PCI probing paths so there's no circumstance where that
code would see the added flag set.

That patch was part of the PowerNV SRIOV support series which went
through quite a few iterations. My best guess is that check might have
been needed in an earlier version and was just carried forward until
it got merged. I didn't dig too deeply into the history though.

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
