Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1229B4676
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 06:25:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XVQQ0yr4zF3Sb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 14:25:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d42; helo=mail-io1-xd42.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="emGotdw5"; 
 dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XVND3F9GzDr9S
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 14:23:24 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id r26so4300844ioh.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JwEmRuubrpYwe1CsdHg62N6j61FWP1pgjmhPhn4b0VI=;
 b=emGotdw5dFz74G4fb74ggG6IWwBvuG3dx4jhC/YKy1vsXC2YA7rqXwNidOJl1X04C+
 fKNJukJTuBjE/WupLdF8p9mvk6N9bO/4qm3snyzb9OEGzYrBp5yFZ7RX1uEA5x8VMpl4
 irkY3gCi05fYlhsuBv0YLFjjtnQXAsV0veqkKSo56os/g1MH/+syMd+eWqEOZLpvjNgX
 2MpedNBYDUDykB4IMxURoDNKVllQDgQ/HDZhyyeF1pmicIlwvs/BQWuhw7yYxE/EInHI
 9Cz130P1KIY/VGKywN/w8mrvxnyI82SSQWGAS0RlHrYx8JPGBZSdqHqfV3BqeEZAd0zr
 i9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JwEmRuubrpYwe1CsdHg62N6j61FWP1pgjmhPhn4b0VI=;
 b=Omz9iLSHG2NbEbU65wqd/daf7gK71Cf+1+W/noN/7bLu1iGkgdYlJj5iZ0mVvVz9LL
 wkgzlaXOXn/4C+KKFd85daiPkEoo4Fn2CwMpWwpj1YX4SbqmFmxbS3U3QTtwgnOLsvzU
 +6NmobkK5c0IxsNofrWfLRGBy0wYchyXF/IcvZ/p9naiCWC0kWJPF/8IOBVu0T/Y12NL
 1/aI5Cw38j+lQ+jl4DNy3em7x/S9QTwRnTBEeTTUpYT9W+kkplk+jqtCeS1TBsuQzSq1
 nPScqiDdoeByv3ZUNVm2f+gcGJQQO/+5snJ/PT/f3sLxjf0iFVG/EnJFFUNOYpx+wTHv
 PTtQ==
X-Gm-Message-State: APjAAAVt2yhpGsnciaSHKyWRxE8ck/FBLfG1D8leb7OH//MWKonbo7LV
 mffIMxS6Bqi5N04nGE8hLXlhsExfK0rDYXHlsImicQ==
X-Google-Smtp-Source: APXvYqzc4nVPNUraeQwyzLfXDKEHjCTPGzZ3QbvmiftObVb8aUfud3vRl234+u6r45E5WN2HLwsf9I/oDiB8xsnaXZQ=
X-Received: by 2002:a02:2302:: with SMTP id u2mr954024jau.70.1568694200650;
 Mon, 16 Sep 2019 21:23:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-13-oohall@gmail.com>
 <20190917031558.GI21303@tungsten.ozlabs.ibm.com>
 <CAOSf1CGZmtCCKytFtDef+DLkASNFRGJE5z62P2S_t+aY7o9RiA@mail.gmail.com>
In-Reply-To: <CAOSf1CGZmtCCKytFtDef+DLkASNFRGJE5z62P2S_t+aY7o9RiA@mail.gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 17 Sep 2019 14:23:09 +1000
Message-ID: <CAOSf1CF2dbc83KEvuKfG5RgEjdG04_4=GC55R5yjA+w7UAP1=g@mail.gmail.com>
Subject: Re: [PATCH 12/14] powerpc/eeh: Add debugfs interface to run an EEH
 check
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 17, 2019 at 1:36 PM Oliver O'Halloran <oohall@gmail.com> wrote:
>
> On Tue, Sep 17, 2019 at 1:16 PM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
> >
> > On Tue, Sep 03, 2019 at 08:16:03PM +1000, Oliver O'Halloran wrote:
> > > Detecting an frozen EEH PE usually occurs when an MMIO load returns a 0xFFs
> > > response. When performing EEH testing using the EEH error injection feature
> > > available on some platforms there is no simple way to kick-off the kernel's
> > > recovery process since any accesses from userspace (usually /dev/mem) will
> > > bypass the MMIO helpers in the kernel which check if a 0xFF response is due
> > > to an EEH freeze or not.
> > >
> > > If a device contains a 0xFF byte in it's config space it's possible to
> > > trigger the recovery process via config space read from userspace, but this
> > > is not a reliable method. If a driver is bound to the device an in use it
> > > will frequently trigger the MMIO check, but this is also inconsistent.
> > >
> > > To solve these problems this patch adds a debugfs file called
> > > "eeh_dev_check" which accepts a <domain>:<bus>:<dev>.<fn> string and runs
> > > eeh_dev_check_failure() on it. This is the same check that's done when the
> > > kernel gets a 0xFF result from an config or MMIO read with the added
> > > benifit that it can be reliably triggered from userspace.
> > >
> > > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> >
> > Looks good, and I tested it with the next patch and it seems to work.
> >
> > But I think you should make it clear that this does not work with
> > the hardware "EEH error injection" facility accessible via debugfs in
> > err_injct (that doesn't seem clear to me from the commit message).
>
> It's not intended to be a separate mechanisms in the long term. I'm
> planning on converting this interface to make use the platform defined
> error injection mechanism once I can find how to use the PAPR ones
> reliably. The idea is to use this as a generic "cause an EEH to happen
> on this device" interface for userspace which we can use in test
> scripts and the like.

Urgh, I'm tired and thought this was the eeh_debugfs_break patch.

This (the _check) debugfs interface does work with the HW error
injection facilities. After the HW injects an error the PE is frozen,
but the kernel doesn't notice until something runs
eeh_dev_check_failure(). This interface gives userspace a reliable way
to do that rather than relying on drivers doing MMIO, or somewhere in
config space containing a 0xFF.

Oliver
