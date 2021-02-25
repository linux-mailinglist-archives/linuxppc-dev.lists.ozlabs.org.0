Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D7332512D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 15:03:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmZJW1QkGz3dpS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Feb 2021 01:03:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iGKh9gRL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=arnd@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=iGKh9gRL; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmZGK4T62z3dsd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Feb 2021 01:01:45 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22C5F64F14
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614261702;
 bh=gB6SQ75V2Rk37+UKLUfmsXNjtKCUUEXnmz4FEJPQVQY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=iGKh9gRLvR8o04SWuKsCmipjtlzTrYuO47BWoJKHisDTteOpg/JDJDJJNnt+rGTTb
 0rw4Z/+2u64PifagBhihDsPlyJ67Y3oQmsZn/oOul3KOK4yi2rGalMnkTSGw0hDAQu
 5UCXh/aLF+AKNOXFFYPj9pbvUcZ+cJQXjOePkvmGZX37GfJUD/b8DZYdke/mmAKvZT
 fAGvXP4lcs8maCpu0ckyrKPIoHkrpGb6cRtLNo09qQE/bWR08AfpprntjG9xmxGdei
 eNSETbirr5t3ogcQ9xtRSswYiW1kh8gzy8rrgKIT9HRwylXF4qapcoQRRth0EghGpX
 ctCpWU8hVtI2A==
Received: by mail-oo1-f43.google.com with SMTP id s10so1384275oom.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 06:01:42 -0800 (PST)
X-Gm-Message-State: AOAM533JZg8zJJBNiSH/8TPvlsvjqGh4bUkNuSxqcfdlGBXxtzhTOUIW
 Ef+AZnneYm9KdU2snxLu4mNtKTTlHgIo26jQ3w4=
X-Google-Smtp-Source: ABdhPJy0Z8oAC8F3qvd9r/HrjNWv0zSRZwzOF/sqWqHtbHpdIOPcLKBh4nK6FxEKGL+hdddWAENt07LK/yhwcmvgmrE=
X-Received: by 2002:a4a:870c:: with SMTP id z12mr2391944ooh.15.1614261701193; 
 Thu, 25 Feb 2021 06:01:41 -0800 (PST)
MIME-Version: 1.0
References: <20210224072516.74696-1-uwe@kleine-koenig.org>
 <87sg5ks6xp.fsf@mpe.ellerman.id.au>
In-Reply-To: <87sg5ks6xp.fsf@mpe.ellerman.id.au>
From: Arnd Bergmann <arnd@kernel.org>
Date: Thu, 25 Feb 2021 15:01:25 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1q=zqyOxBgV-nprpN3jBczZWexupkA1Wy6g+AEW6rQqw@mail.gmail.com>
Message-ID: <CAK8P3a1q=zqyOxBgV-nprpN3jBczZWexupkA1Wy6g+AEW6rQqw@mail.gmail.com>
Subject: Re: [PATCH v2] vio: make remove callback return void
To: Michael Ellerman <mpe@ellerman.id.au>
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
Cc: Cristobal Forno <cforno12@linux.ibm.com>,
 Tyrel Datwyler <tyreld@linux.ibm.com>, sparclinux <sparclinux@vger.kernel.org>,
 target-devel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?Q?Breno_Leit=C3=A3o?= <leitao@debian.org>,
 Peter Huewe <peterhuewe@gmx.de>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Jiri Slaby <jirislaby@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-scsi <linux-scsi@vger.kernel.org>, Nayna Jain <nayna@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Cyr <mikecyr@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 linux-block <linux-block@vger.kernel.org>, Lijun Pan <ljp@linux.ibm.com>,
 Matt Mackall <mpm@selenic.com>, Jens Axboe <axboe@kernel.dk>,
 Steven Royer <seroyer@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Jarkko Sakkinen <jarkko@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "open list:HARDWARE RANDOM NUMBER GENERATOR CORE"
 <linux-crypto@vger.kernel.org>, Networking <netdev@vger.kernel.org>,
 Dany Madden <drt@linux.ibm.com>, Paulo Flabiano Smorigo <pfsmorigo@gmail.com>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 25, 2021 at 12:52 PM Michael Ellerman <mpe@ellerman.id.au> wrot=
e:
>
> Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org> writes:
> > The driver core ignores the return value of struct bus_type::remove()
> > because there is only little that can be done. To simplify the quest to
> > make this function return void, let struct vio_driver::remove() return
> > void, too. All users already unconditionally return 0, this commit make=
s
> > it obvious that returning an error code is a bad idea and makes it
> > obvious for future driver authors that returning an error code isn't
> > intended.
> >
> > Note there are two nominally different implementations for a vio bus:
> > one in arch/sparc/kernel/vio.c and the other in
> > arch/powerpc/platforms/pseries/vio.c. I didn't care to check which
> > driver is using which of these busses (or if even some of them can be
> > used with both) and simply adapt all drivers and the two bus codes in
> > one go.
>
> I'm 99% sure there's no connection between the two implementations,
> other than the name.
>
> So splitting the patch by arch would make it easier to merge. I'm
> reluctant to merge changes to sparc code.

The sparc subsystem clearly started out as a copy of the powerpc
version, and serves roughly the same purpose, but the communication
with the hypervisor is quite different.

As there are only four drivers for the sparc vio subsystem:
drivers/block/sunvdc.c
drivers/net/ethernet/sun/ldmvsw.c
drivers/net/ethernet/sun/sunvnet.c
drivers/tty/vcc.c
maybe it would make sense to rename those to use distinct
identifiers now?

       Arnd
