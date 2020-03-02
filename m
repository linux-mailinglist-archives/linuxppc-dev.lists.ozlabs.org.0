Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E0219176842
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 00:34:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wc1C0DtSzDqjW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 10:34:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WbzQ2GpMzDqTX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 10:32:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=gibson.dropbear.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=fOL3ol6d; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1007)
 id 48WbzQ1TRmz9sSM; Tue,  3 Mar 2020 10:32:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1583191970;
 bh=MFn7h1ABzuznlHRfe/7NuiIWmZMsu94D60+9MIMCwEI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fOL3ol6ddTUTQSICV7waezwPEvUm2UllHgl8WQF1pmp5+23sFbJnLJMgmxPApIF9T
 EGrWW5i6K8fQjOLvpntWIqZstzEJmJpJ5GdM1czCDb5vYGpsjhCxX6me/kokDBYORR
 rOiab3IvCclFKoKSNZQfC/9cd0Fns1mJugqGK97E=
Date: Tue, 3 Mar 2020 10:32:40 +1100
From: David Gibson <david@gibson.dropbear.id.au>
To: Ram Pai <linuxram@us.ibm.com>
Subject: Re: [RFC PATCH v1] powerpc/prom_init: disable XIVE in Secure VM.
Message-ID: <20200302233240.GB35885@umbus.fritz.box>
References: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dc+cDN39EJAMEtIO"
Content-Disposition: inline
In-Reply-To: <1582962844-26333-1-git-send-email-linuxram@us.ibm.com>
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
Cc: aik@ozlabs.ru, andmike@linux.ibm.com, groug@kaod.org,
 kvm-ppc@vger.kernel.org, clg@fr.ibm.com, sukadev@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--dc+cDN39EJAMEtIO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2020 at 11:54:04PM -0800, Ram Pai wrote:
> XIVE is not correctly enabled for Secure VM in the KVM Hypervisor yet.
>=20
> Hence Secure VM, must always default to XICS interrupt controller.
>=20
> If XIVE is requested through kernel command line option "xive=3Don",
> override and turn it off.
>=20
> If XIVE is the only supported platform interrupt controller; specified
> through qemu option "ic-mode=3Dxive", simply abort. Otherwise default to
> XICS.

Uh... the discussion thread here seems to have gotten oddly off
track.  So, to try to clean up some misunderstandings on both sides:

  1) The guest is the main thing that knows that it will be in secure
     mode, so it's reasonable for it to conditionally use XIVE based
     on that.

  2) The mechanism by which we do it here isn't quite right.  Here the
     guest is checking itself that the host only allows XIVE, but we
     can't do XIVE and is panic()ing.  Instead, in the SVM case we
     should force support->xive to false, and send that in the CAS
     request to the host.  We expect the host to just terminate
     us because of the mismatch, but this will interact better with
     host side options setting policy for panic states and the like.
     Essentially an SVM kernel should behave like an old kernel with
     no XIVE support at all, at least w.r.t. the CAS irq mode flags.

  3) Although there are means by which the hypervisor can kind of know
     a guest is in secure mode, there's not really an "svm=3Don" option
     on the host side.  For the most part secure mode is based on
     discussion directly between the guest and the ultravisor with
     almost no hypervisor intervention.

  4) I'm guessing the problem with XIVE in SVM mode is that XIVE needs
     to write to event queues in guest memory, which would have to be
     explicitly shared for secure mode.  That's true whether it's KVM
     or qemu accessing the guest memory, so kernel_irqchip=3Don/off is
     entirely irrelevant.

  5) All the above said, having to use XICS is pretty crappy.  You
     should really get working on XIVE support for secure VMs.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--dc+cDN39EJAMEtIO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAl5dl5UACgkQbDjKyiDZ
s5IdcBAAk8vR8o1rRAjpvuUwpmjQOgcIcmrKGPlv5xb7XV0NBMn05dyd95rvqdv1
ZkIRVlg7kPGIJJbdMifIHRGHasB7bpcVdWU8h4gJ2isjoy7ddVMFUSn5RJ76cahl
4GSpJn67kVtOngTmg6yYEOWZeZU8E/OC3iFM+r2dbprxrxKZg+cVQllNQyEo6tDe
3EMQKsUt1VJs36Y63HRqsWyivzUmmeiqZESWo0fgCJAnaa5C1i76GHJRL5ZS/dcs
keyDoa3A2sBnpqUZtN6hzMSkAwooh78h+vsL/utKzbL/8TUY6Us8Da7dJlpp0D+h
vCfRG8UTlVhBSDK7tEC6EhOou1eEKnwC4h1FJ4yyZxw98ukeAGcLruJ0t7O9YwK2
2sZnKzorYTOAetlRa8wXlXZttR0BaPz2V5/KrpMeIgq+lXiM2x7jNjHCjbVOo9Qw
KqUJtopeTBXVbzJIWhNhWr4rZLhXZIg2cJzBqMVV0smDCCMiBO8/zb3NZe7WN3OW
Yp+RxrT3+vhRiHPpb4TD3R2725DulVglB7dRU0TBuZWBLrfkSpspSa6zgEEDEnz6
VhVaWSrD6d3pti2c5GS7zKfyATueCpq1A2wJS54k9jJl/y26rmDAz/ky4haIMBvW
NL8d7pt+PlIXwi0ZF0NHr8mr5XE4gf3Qt1MNPpkRo5yaLoEK8YA=
=FpzO
-----END PGP SIGNATURE-----

--dc+cDN39EJAMEtIO--
