Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED4FFAE5E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 11:20:50 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47CgcF5rcfzF6Gb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 21:20:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.15; helo=mx1.suse.de;
 envelope-from=nsaenzjulienne@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=suse.de
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CgYd73FPzF3bt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 21:18:29 +1100 (AEDT)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CE8D6B547;
 Wed, 13 Nov 2019 10:18:26 +0000 (UTC)
Message-ID: <fc488c5ff7dc7e1b9d96660f0da9b423b3f5094a.camel@suse.de>
Subject: Re: unify the dma_capable definition
From: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
To: Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org, 
 Russell King <linux@armlinux.org.uk>
Date: Wed, 13 Nov 2019 11:18:25 +0100
In-Reply-To: <20191113073539.9660-1-hch@lst.de>
References: <20191113073539.9660-1-hch@lst.de>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-cvyL9zADiQPcce4MqJVv"
User-Agent: Evolution 3.34.1 
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-cvyL9zADiQPcce4MqJVv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2019-11-13 at 08:35 +0100, Christoph Hellwig wrote:
> Hi all,
>=20
> there is no good reason to have different version of dma_capable.
> This series removes the arch overrides and also adds a few cleanups
> in the same area.

Reviewed-by: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

for the whole series,
Thanks!


--=-cvyL9zADiQPcce4MqJVv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEErOkkGDHCg2EbPcGjlfZmHno8x/4FAl3L2HEACgkQlfZmHno8
x/4wSQf/XC3BfmBQXcl1ZtWzTr+4bUfUUlsKGdPH0jSKURaYqy7S86ww5oUlbFMC
GIc3I7oN23Q6+p5XDoS/T+tZytUy7HyMB8Z6JRrMjigkV8t0gW58PbjzcHeYQxVL
XnfiZTwo/uVYqJyaPQFDmeHn2H8FpeJkX9oGPohHAY4QX6Iw/dc4cO9S6be933vr
ri4Hau+t8D6/9iT2Wkl7x7hUqinW1yo/6MXhyx44tCpT6RxAimXnK01Gb2G35hiO
t+qRXCA6dvnKlkm4wBQExVT9w1hJt0rHQpcnA5Psb16thfClv3X7esvIMAS4NiJO
mn9iwYlDzdlqgyHT8Qz+Q7qTS9YZog==
=EWiZ
-----END PGP SIGNATURE-----

--=-cvyL9zADiQPcce4MqJVv--

