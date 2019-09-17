Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E05FB4610
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 05:40:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XTQC6CdqzF3j6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 13:40:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::d44; helo=mail-io1-xd44.google.com;
 envelope-from=oohall@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="BqFn+4zm"; 
 dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XTLd1t2gzF3xZ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 13:36:56 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id d17so4043417ios.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 20:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=o+vkBfEmG+8Wsk4JTOBNSiZTsQzfK/IcPa9tQPAudgM=;
 b=BqFn+4zm7MwVktn4jhQQ/41yy4OT4ZN7pNf1NdqAHoI7+yJZnZQzCg+bSSp3o+m4it
 sHgmTy0NB0N4QyI6bHcFNomqq5y63BgBT6SRUymxp5T/n58uc39jHlzyHeUbTuibl/FR
 Ivt+rviivQbK5XsNHHA/CoWcMD4/pCFyxtRUL0F+dX5syOl2PYGIT3jyex187UYnQtQa
 yGazWVyfyghg6hqAdNofvKPVE+xSo2Ohjh2BVyz84qvygBYRkOdUIG9U4T+BcQ+GBQic
 vGeyTkoYVshKY5mrJCdzx4gA7qrcFVKpBmq/eRa8Xc15yENM0wX4OO2qjvGMAwUbb/KA
 oZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=o+vkBfEmG+8Wsk4JTOBNSiZTsQzfK/IcPa9tQPAudgM=;
 b=mj+IMa1txqC+rkhZiULBOrpjtEmAMV9H7JmfKgPF/hF2gQqydTlKFAnTB1ahDBmVW3
 6rz7dO4Pl05GFLAsuDAR5zJJdDXN9fXMY64ZTkesGAAC8u6J7jUclQKidgh5DkdW2kar
 6lcizmLeL9+oa/wcL+VkOWBTbAR1fd01ecCHXr8DYhb01+eDP8LEi+gn/fOuhiNuVl5C
 d6fGwsmUokA9Ey7lbkXYW/tTTSxusEaGDCZIat0ycrYDJm+CNBlRztMyA+Te3AIkeP0E
 nPJzDFQwLhYwUGGBBkktKvekItJEi1zGwj2wRVUZBf3e2PSXpfeBqQ65F1HhhTn4qF24
 U0mA==
X-Gm-Message-State: APjAAAWj3USQphEDQUSklGwSc3Jk+ozDqE1UdNt3d5BpNf82/jdhqhuj
 SllCwnUfGeoSg2Qqpp43VyOW42Iyxu86LPylclY=
X-Google-Smtp-Source: APXvYqwSRkNsLnt+CMkbe/eVOzJDsLX0NpfyvXMTPMmQ4rlKKZDOA9kctgVIu0TkjJk7dF9j/TzK61IcIJeZjD5fnEE=
X-Received: by 2002:a5e:df04:: with SMTP id f4mr1424884ioq.192.1568691413156; 
 Mon, 16 Sep 2019 20:36:53 -0700 (PDT)
MIME-Version: 1.0
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-13-oohall@gmail.com>
 <20190917031558.GI21303@tungsten.ozlabs.ibm.com>
In-Reply-To: <20190917031558.GI21303@tungsten.ozlabs.ibm.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 17 Sep 2019 13:36:42 +1000
Message-ID: <CAOSf1CGZmtCCKytFtDef+DLkASNFRGJE5z62P2S_t+aY7o9RiA@mail.gmail.com>
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

On Tue, Sep 17, 2019 at 1:16 PM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
>
> On Tue, Sep 03, 2019 at 08:16:03PM +1000, Oliver O'Halloran wrote:
> > Detecting an frozen EEH PE usually occurs when an MMIO load returns a 0xFFs
> > response. When performing EEH testing using the EEH error injection feature
> > available on some platforms there is no simple way to kick-off the kernel's
> > recovery process since any accesses from userspace (usually /dev/mem) will
> > bypass the MMIO helpers in the kernel which check if a 0xFF response is due
> > to an EEH freeze or not.
> >
> > If a device contains a 0xFF byte in it's config space it's possible to
> > trigger the recovery process via config space read from userspace, but this
> > is not a reliable method. If a driver is bound to the device an in use it
> > will frequently trigger the MMIO check, but this is also inconsistent.
> >
> > To solve these problems this patch adds a debugfs file called
> > "eeh_dev_check" which accepts a <domain>:<bus>:<dev>.<fn> string and runs
> > eeh_dev_check_failure() on it. This is the same check that's done when the
> > kernel gets a 0xFF result from an config or MMIO read with the added
> > benifit that it can be reliably triggered from userspace.
> >
> > Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
>
> Looks good, and I tested it with the next patch and it seems to work.
>
> But I think you should make it clear that this does not work with
> the hardware "EEH error injection" facility accessible via debugfs in
> err_injct (that doesn't seem clear to me from the commit message).

It's not intended to be a separate mechanisms in the long term. I'm
planning on converting this interface to make use the platform defined
error injection mechanism once I can find how to use the PAPR ones
reliably. The idea is to use this as a generic "cause an EEH to happen
on this device" interface for userspace which we can use in test
scripts and the like.
