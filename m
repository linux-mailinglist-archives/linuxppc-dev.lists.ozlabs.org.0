Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D9F2A3BB0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 06:10:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CQHtG5MjQzDq9W
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Nov 2020 16:10:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RPwBQPLT; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CQHC94HyLzDqD8
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Nov 2020 15:40:21 +1100 (AEDT)
Received: by mail-io1-xd44.google.com with SMTP id m9so3523234iox.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Nov 2020 20:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=kyN1XeWyQpkbiJCeFGA26wLQw+p9xunsGOlf3ZLborY=;
 b=RPwBQPLTrZ3EMYbCp7SoD5ujiPpnye+sHtn72lwrunMvg+rlqqM7BFQ5CK6mKtQM6I
 0FmFhKg3FHZyTJUOBOYuYCP9xIcK04MIo15Euk7wOJzBomvGP0dnUWi9HpCsAe1uYpSg
 gYCStvPrS0ZECmXZA1e/mWY9HRH/oEn+2s27Vi4NEXGgPZcwPbkopl0meTVava5hu/gF
 EJAV1tmrm38vj0HbfBGEHQTN3ysz2ZTortd8JU2ollTZAqLXZ1YPESD0R7W/9sclKmbr
 X2NY8kYvsNp38YQbr2NuK1DmbdRydDn6XIU7hoGDWQu6bxxRnWeKg1DRyepsGo//vq25
 /Shg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=kyN1XeWyQpkbiJCeFGA26wLQw+p9xunsGOlf3ZLborY=;
 b=R99wo0K8W4Kqthdubcxz2kMH8J26dH0Qx5kUh/TYtuClS/hsySbemw9Nd+GjveQdOE
 xAyX+7Mwpr6QMOkB2Z6WCafuUAxHW6eWhzee8hBD7RHgw/igv5vutUqa0NrEKC/UHbyu
 XlK5u30DBHBme3TtfYoONdBEqvP0Cy3m6zbGZjs4SMzRrLU8iZ9EoyLNCVxr6qbkwv3G
 bp+tpXT1cUJpiXCl7jhsJ/t4Qdkn7Ev5SedcxFBLf54niYr3Vug0R5+OqyKEc5xgHUkB
 ZtUyoH2GaH3F1P68oytr3rdz06yIp6RI7rmeLGB55if7YI8ogbNoH5HO9M28e0C11npV
 0A3Q==
X-Gm-Message-State: AOAM5305nFh1/q4p/K+4BNgeHRkK9bXXSmkQ9XfwkS+b1YH2g8kSheLG
 YlaUV/dPT7xronTtgz76ZI9SinaAJ4wrIAOtWms=
X-Google-Smtp-Source: ABdhPJyvABDrMU7RNxRcJtmrOH21gElCtLNzWUfKNY4J0ZhliqU+g4STqw5+59sOHoG430d7LfRreTSoBRpO81UaykY=
X-Received: by 2002:a5e:9743:: with SMTP id h3mr12614836ioq.158.1604378418103; 
 Mon, 02 Nov 2020 20:40:18 -0800 (PST)
MIME-Version: 1.0
References: <20200807101854.844619-1-clg@kaod.org>
 <9c5eca863c63e360662fae7597213e8927c2a885.camel@redhat.com>
 <fce8ffe1-521c-8344-c7ad-53550e408cdc@kaod.org>
 <89726af2-00ca-9d47-f417-4bea8d5b8b1f@ozlabs.ru>
 <3497b725-9108-9f63-9cc2-ac7b1dd06c09@kaod.org>
In-Reply-To: <3497b725-9108-9f63-9cc2-ac7b1dd06c09@kaod.org>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Tue, 3 Nov 2020 15:40:07 +1100
Message-ID: <CAOSf1CFwsc1uqcdaF5Et7eHjZGMB0gZcwQFykkVwQR0B+PvsHw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/pci: unmap legacy INTx interrupts when a PHB
 is removed
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Qian Cai <cai@redhat.com>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 3, 2020 at 1:39 AM C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> On 10/14/20 4:55 AM, Alexey Kardashevskiy wrote:
> >
> > How do you remove PHBs exactly? There is no such thing in the powernv p=
latform, I thought someone added this and you are fixing it but no. PHBs on=
 powernv are created at the boot time and there is no way to remove them, y=
ou can only try removing all the bridges.
>
> yes. I noticed that later when proposing the fix for the double
> free.
>
> > So what exactly are you doing?
>
> What you just said above, with the commands :
>
>   echo 1 >  /sys/devices/pci0031\:00/0031\:00\:00.0/remove
>   echo 1 >  /sys/devices/pci0031\:00/pci_bus/0031\:00/rescan

Right, so that'll remove the root port device (and Bus 01 beneath it),
but the PHB itself is still there. If it was removed the root bus
would also disappear.
