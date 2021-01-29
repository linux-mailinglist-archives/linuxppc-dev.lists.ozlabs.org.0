Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9A9308D0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jan 2021 20:11:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DS6PZ2gM1zDrWN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 06:10:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::435;
 helo=mail-wr1-x435.google.com; envelope-from=lijunp213@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=DdVDH9ZX; dkim-atps=neutral
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DS6MP4kz6zDrT5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 06:09:05 +1100 (AEDT)
Received: by mail-wr1-x435.google.com with SMTP id g10so9912364wrx.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jan 2021 11:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=O23rlZtfo1FZK0qx/WutTi+hkYR2QPOf0nbtZy10Zxw=;
 b=DdVDH9ZXqAC6pKsXfQftK93OjTPC27Nw5D2M6I8L/f2uvZev0A9JsuKm0emyUXWDAF
 SM7M/J5PhQl9LL8FbOW4nNny9Or4Gkqp9wlfYzTawOjIgh2P71w8aSqwWH9J6OkZmR/z
 GpY8TDRxBO79rLhpmj6+29vwqm6hJmzjOy6ym74Rq3Qd5KbAWfoHO4pMnjuFrxqw5gbE
 9uGCmsJhWd+lFYGDpi2mUqyJdWdAgaeMHNofQjputA9/s65xjOmhqiCTbD+tW5nU+Ex1
 RJTAI7mK3KBmLP/le5Q01NDo6Ed8KhScv3SWrGEHMCjKt6GT6Tf5HZfXLQ5/5hIB8Y1Z
 5qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=O23rlZtfo1FZK0qx/WutTi+hkYR2QPOf0nbtZy10Zxw=;
 b=OyKQsHCNNxFYyT06JH92c+OKhDnFRiCySec1+jkHjIvIaKAaUVz+LTd2YBdZUfuVat
 N7epJ+lI+mtES/GGKueYqw7SB1oTK69wVsElstZq3A9m2477pS08IuM0zx8a7DFk/V2b
 Cn3JZKP3ntxVVM8sSz/Vww5JGZUG/sXiTNHZZHtqqUJkM6K9K8pFUIYm0exZwZJPq/QJ
 P3Rpd87TvpY/v9IsvMiKMpWEXhTFWl/ZaBXErJjl2cFvWc1qoPmlFMT1bXJ+1fgHvu5T
 DaWzb2jmEXYFRfIRBaPIKfUXaQoIdyqWM6BHdS1lyzY+jgLqR7zTYQRTK+txvUExwSpX
 ARhQ==
X-Gm-Message-State: AOAM530oGaAdHU7fIG2QQcurt18A0Lo37oMem5D2NnHEwMgRKLw+H+o+
 dN+sTMnzCK5Sq1gw+RiAjtqfmrgQ3boQbqMohx0=
X-Google-Smtp-Source: ABdhPJzAbgdkkapiGmzGouxTGwveq5m7LmJNveRCk+Kv9qY2evOh0QQsbBh6o6uIYkABxwRfFnIBxorHq8dmbcxo0OQ=
X-Received: by 2002:a5d:49cf:: with SMTP id t15mr6034971wrs.217.1611947338629; 
 Fri, 29 Jan 2021 11:08:58 -0800 (PST)
MIME-Version: 1.0
References: <20210127215010.99954-1-uwe@kleine-koenig.org>
In-Reply-To: <20210127215010.99954-1-uwe@kleine-koenig.org>
From: Lijun Pan <lijunp213@gmail.com>
Date: Fri, 29 Jan 2021 13:08:45 -0600
Message-ID: <CAOhMmr4ZMXS+R3AcdKm3qcePfuaZeC-0dNWvsSzowbv5hXo2-Q@mail.gmail.com>
Subject: Re: [PATCH] vio: make remove callback return void
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <uwe@kleine-koenig.org>
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
 Tyrel Datwyler <tyreld@linux.ibm.com>, sparclinux@vger.kernel.org,
 target-devel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 =?UTF-8?Q?Breno_Leit=C3=A3o?= <leitao@debian.org>,
 Peter Huewe <peterhuewe@gmx.de>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Jiri Slaby <jirislaby@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-scsi@vger.kernel.org, Nayna Jain <nayna@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Cyr <mikecyr@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 Lijun Pan <ljp@linux.ibm.com>, Matt Mackall <mpm@selenic.com>,
 Jens Axboe <axboe@kernel.dk>, Steven Royer <seroyer@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org,
 Jarkko Sakkinen <jarkko@kernel.org>, linux-crypto@vger.kernel.org,
 netdev@vger.kernel.org, Dany Madden <drt@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 27, 2021 at 6:41 PM Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.or=
g> wrote:
>
> The driver core ignores the return value of struct bus_type::remove()
> because there is only little that can be done. To simplify the quest to
> make this function return void, let struct vio_driver::remove() return
> void, too. All users already unconditionally return 0, this commit makes
> it obvious that returning an error code is a bad idea and makes it
> obvious for future driver authors that returning an error code isn't
> intended.
>
> Note there are two nominally different implementations for a vio bus:
> one in arch/sparc/kernel/vio.c and the other in
> arch/powerpc/platforms/pseries/vio.c. I didn't care to check which
> driver is using which of these busses (or if even some of them can be
> used with both) and simply adapt all drivers and the two bus codes in
> one go.
>
> Note that for the powerpc implementation there is a semantical change:
> Before this patch for a device that was bound to a driver without a
> remove callback vio_cmo_bus_remove(viodev) wasn't called. As the device
> core still considers the device unbound after vio_bus_remove() returns
> calling this unconditionally is the consistent behaviour which is
> implemented here.
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org>

Acked-by: Lijun Pan <ljp@linux.ibm.com>
