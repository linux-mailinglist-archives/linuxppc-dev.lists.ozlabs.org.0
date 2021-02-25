Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EBA324F70
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 12:50:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmWLr6f93z3ck0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 22:50:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iSkCaS/D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=iSkCaS/D; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmWLS4nsfz3cKl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 22:50:07 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4DmWLG6r0dz9sVF;
 Thu, 25 Feb 2021 22:49:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1614253805;
 bh=/SYtgE5qENlSC96VzcIwZTaGUmL6HCYNrQHwHPYZSs4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=iSkCaS/DJVPQlH0gbL+LD45kazqnKgdUXrGSiY0t5rVH7XgWyEZ3dVcZQMrrdzWxb
 5MgqcVG9pQkFcrHW+MXEpmHj5iL5Dc/O0Q3xerdpbA7nNL2QioWinUYOGNO1CftmBu
 foAGxV0uCzTC0mgQqEJOVDt+y1/5VQz2b92Jel0/OqIMCucyj2A49/JmP77ew5X9ex
 7ocZxtF4Q7Ij1XMzTR+G4KGixhAD12BQzG5y3VyTqzm+g5IL6UR67JPFL4nCBTOTxL
 1NBGWLbvxkYV3zB/XybDZ47lwrc8H7FUaYmZhnqcTWr1RcqeZBKCgq+EBQqZHvNLXS
 lfxhg1WNI9+Mg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, Benjamin
 Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, "David S.
 Miller" <davem@davemloft.net>, Jens Axboe <axboe@kernel.dk>, Matt Mackall
 <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, Peter Huewe
 <peterhuewe@gmx.de>, Jarkko Sakkinen <jarkko@kernel.org>, Jason Gunthorpe
 <jgg@ziepe.ca>, Haren Myneni <haren@us.ibm.com>, Breno =?utf-8?Q?Leit?=
 =?utf-8?Q?=C3=A3o?=
 <leitao@debian.org>, Nayna Jain <nayna@linux.ibm.com>, Paulo Flabiano
 Smorigo <pfsmorigo@gmail.com>, Steven Royer <seroyer@linux.ibm.com>, Arnd
 Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Cristobal Forno <cforno12@linux.ibm.com>, Jakub Kicinski
 <kuba@kernel.org>, Dany Madden <drt@linux.ibm.com>, Lijun Pan
 <ljp@linux.ibm.com>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>, Tyrel
 Datwyler <tyreld@linux.ibm.com>, "James E.J. Bottomley"
 <jejb@linux.ibm.com>, "Martin K. Petersen" <martin.petersen@oracle.com>,
 Michael Cyr <mikecyr@linux.ibm.com>, Jiri Slaby <jirislaby@kernel.org>
Subject: Re: [PATCH v2] vio: make remove callback return void
In-Reply-To: <20210224072516.74696-1-uwe@kleine-koenig.org>
References: <20210224072516.74696-1-uwe@kleine-koenig.org>
Date: Thu, 25 Feb 2021 22:49:54 +1100
Message-ID: <87sg5ks6xp.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-block@vger.kernel.org,
 target-devel@vger.kernel.org, linux-crypto@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Uwe Kleine-K=C3=B6nig <uwe@kleine-koenig.org> writes:
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

I'm 99% sure there's no connection between the two implementations,
other than the name.

So splitting the patch by arch would make it easier to merge. I'm
reluctant to merge changes to sparc code.

The list of powerpc specific drivers is:

  drivers/char/hw_random/pseries-rng.c
  drivers/char/tpm/tpm_ibmvtpm.c
  drivers/crypto/nx/nx-842-pseries.c
  drivers/crypto/nx/nx.c
  drivers/misc/ibmvmc.c
  drivers/net/ethernet/ibm/ibmveth.c
  drivers/net/ethernet/ibm/ibmvnic.c
  drivers/scsi/ibmvscsi/ibmvfc.c
  drivers/scsi/ibmvscsi/ibmvscsi.c
  drivers/scsi/ibmvscsi_tgt/ibmvscsi_tgt.c
  drivers/tty/hvc/hvcs.c

cheers
