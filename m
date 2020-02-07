Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A526B155106
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 04:37:29 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48DLbB511BzDqcx
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Feb 2020 14:37:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::141;
 helo=mail-il1-x141.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pWt3XR9v; dkim-atps=neutral
Received: from mail-il1-x141.google.com (mail-il1-x141.google.com
 [IPv6:2607:f8b0:4864:20::141])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48DLYX1hp8zDqcM
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Feb 2020 14:35:59 +1100 (AEDT)
Received: by mail-il1-x141.google.com with SMTP id f5so521265ilq.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Feb 2020 19:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DkyBlQnsGWYOunpOP39CDKpa0kNDOmVZzh+CWdEEUfA=;
 b=pWt3XR9vgQzQSpdZiHe8UWv/QZXxkPsNv+95mzsCSAYKHEz0p+IJdic37tAuAHa/qh
 JdZL5jR8hs5aAHyGONZhStDF5qTKBtG14NjjyjGApwGMpvjg2g8L1l890MWA9Xjf37Q6
 tNxnyPgREdeR7y44U6tuy2ZFZsXtP94xzpSBEuQBWckbsrfflnNjO2WxLO3ldf/KpvUX
 E3xSZ0irWI2JoXFqpt9A7CQfXIefT+TFAuYqYPrzKPUg6Ko01TII1U5qltGmzwuoYg8F
 EhkpiUAnlRJsxN3KYzQHewZn6z5jw7K4k7m0XDOuy+F+kzMcML7M4H3DB4IOd9hnMMUR
 4o0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DkyBlQnsGWYOunpOP39CDKpa0kNDOmVZzh+CWdEEUfA=;
 b=gB8aSfmkArrzaecCg8LtdC90vx3zhh84eUAU6Uz7p9CkdpjQXlozoB0wZnX6C76nlt
 eOmQolFEKYVQaW6JU19Uq7Ag9Odk/lnHRJTGWhtzMEZ5g+Q0HByeyO6zbxD7FTjR/cej
 9+0tZzHYLms0nhRLX/X5zuJrdb8ykc56OjzqvFJt1zybgNusgrI93tadjxgg/lZDghnL
 MiduFnl1NjZKfU2PIjQ9lR1I7a1fsRs0Ty9iD6qry7ZGmZQtAS97iNk2coEptLbMABy+
 EMxoDiivB0JIF5lnoYc/OQs3I3xaH3Mtg15OMtIu9OiTVi3OzXzrsVV45BA1k6Y+M0HZ
 9c7w==
X-Gm-Message-State: APjAAAVs80MrNb7kAhDHey+7Bm2ml1ZPd02HKRDOkFHAdjKRJb54VXJj
 qz700KOnFf3OogHbeXskzWO1vpkiO02BWDFpRNQ=
X-Google-Smtp-Source: APXvYqwyk5zm3RnRFsJccxt27S3743mm8gVFEgtqzWDKIaxvGuwHYCQfarzoVkCGSbLuVgFKONcotl5AfpBWE+WIB1Q=
X-Received: by 2002:a92:d7c1:: with SMTP id g1mr7724117ilq.192.1581046556346; 
 Thu, 06 Feb 2020 19:35:56 -0800 (PST)
MIME-Version: 1.0
References: <20200203083521.16549-1-oohall@gmail.com>
 <20200203083521.16549-6-oohall@gmail.com>
 <20200207022412.GA21238@osmium>
In-Reply-To: <20200207022412.GA21238@osmium>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Fri, 7 Feb 2020 14:35:45 +1100
Message-ID: <CAOSf1CEBuv-5GLbOX6Kaux1zA2uNVheXRtDfjVkbx+wcKtZHng@mail.gmail.com>
Subject: Re: [PATCH 5/6] powerpc/eeh: Make early EEH init pseries specific
To: Sam Bobroff <sbobroff@linux.ibm.com>
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 7, 2020 at 1:24 PM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
>
> On Mon, Feb 03, 2020 at 07:35:20PM +1100, Oliver O'Halloran wrote:
> > The eeh_ops->probe() function is called from two different contexts:
> >
> > 1. On pseries, where set set EEH_PROBE_MODE_DEVTREE, it's called in
> "set set" -> "we set"
> >    eeh_add_device_early() which is supposed to run before we create
> >    a pci_dev.
> >
> > 2. On PowerNV, where we set EEH_PROBE_MODE_DEV, it's called in
> >    eeh_device_add_late() which is supposed to run *after* the
> >    pci_dev is created.
> >
> > The "early" probe is required because PAPR requires that we perform an RTAS
> > call to enable EEH support on a device before we start interacting with it
> > via config space or MMIO. This requirement doesn't exist on PowerNV and
> > shoehorning two completely separate initialisation paths into a common
> > interface just results in a convoluted code everywhere.
> >
> > Additionally the early probe requires the probe function to take an pci_dn
> > rather than a pci_dev argument. We'd like to make pci_dn a pseries specific
> > data structure since there's no real requirement for them on PowerNV. To
> > help both goals move the early probe into the pseries containment zone
> > so the platform depedence is more explicit.
> >
> I had a look around near your comment:
> > +                     // XXX: uh, do we have the rescan lock held here?
> And we definitely don't have the lock when it gets called via the module
> init path (as rpaphp is loaded) -- I tried it and there was no deadlock.
> I don't think we have the lock in other situations but I haven't
> unravelled it all enough yet to tell, either.

The other hotplug drivers seem to be taking the lock manually in their
enable_slot() callback. So I guess we need to be doing it there too.
I'll fix it in another patch since this one is a bit big.
