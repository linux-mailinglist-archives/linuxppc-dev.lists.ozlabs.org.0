Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E868030F744
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 17:10:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWk6b3FvjzDwqn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Feb 2021 03:10:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=srs0=wcox=hg=linuxfoundation.org=gregkh@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org
 header.a=rsa-sha256 header.s=korg header.b=SbGXD2TY; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWk4g6jzrzDwnk
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Feb 2021 03:08:51 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B37B264F6A;
 Thu,  4 Feb 2021 16:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1612454929;
 bh=3IAPQCCNYn5V60zzmVrr36a9HtGkWRc99HBODO496rg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SbGXD2TYulwmiUQymxa1aJ6E9gI3aWMtXnHBN5sPgXVrkpXtCbu+v0ZHPxelGg3kf
 OCEK7Js2lxNP6OULdJSFxzpq9FfVDxZmJCQNHvO0+GZx0qC8q1M2tspWFbV3CM2ebX
 7vYTxzaaKedXFZO77mr+R3l5UMy2ORCNsruSabzc=
Date: Thu, 4 Feb 2021 17:08:46 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Subject: Re: [PATCH] vio: make remove callback return void
Message-ID: <YBwcDmtefa2WmS90@kroah.com>
References: <20210127215010.99954-1-uwe@kleine-koenig.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210127215010.99954-1-uwe@kleine-koenig.org>
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
 Breno =?iso-8859-1?Q?Leit=E3o?= <leitao@debian.org>,
 Peter Huewe <peterhuewe@gmx.de>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Jiri Slaby <jirislaby@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-scsi@vger.kernel.org, Nayna Jain <nayna@linux.ibm.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Michael Cyr <mikecyr@linux.ibm.com>,
 Jakub Kicinski <kuba@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, linux-block@vger.kernel.org,
 Lijun Pan <ljp@linux.ibm.com>, Matt Mackall <mpm@selenic.com>,
 Jens Axboe <axboe@kernel.dk>, Steven Royer <seroyer@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>,
 linux-crypto@vger.kernel.org, Dany Madden <drt@linux.ibm.com>,
 Paulo Flabiano Smorigo <pfsmorigo@gmail.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 27, 2021 at 10:50:10PM +0100, Uwe Kleine-König wrote:
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
> Signed-off-by: Uwe Kleine-König <uwe@kleine-koenig.org>
> ---
> Hello,
> 
> note that this change depends on
> https://lore.kernel.org/r/20210121062005.53271-1-ljp@linux.ibm.com which removes
> an (ignored) return -EBUSY in drivers/net/ethernet/ibm/ibmvnic.c.
> I don't know when/if this latter patch will be applied, so it might take
> some time until my patch can go in.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
