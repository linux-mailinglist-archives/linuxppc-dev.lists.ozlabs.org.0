Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B31C363999
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 05:08:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FNsFk4rTVz3bqM
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Apr 2021 13:08:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au header.a=rsa-sha256 header.s=201602 header.b=WyWGtrmK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=dgibson@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=gibson.dropbear.id.au header.i=@gibson.dropbear.id.au
 header.a=rsa-sha256 header.s=201602 header.b=WyWGtrmK; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FNsFG4rztz304D
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Apr 2021 13:07:46 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FNsFD4bfyz9vG3; Mon, 19 Apr 2021 13:07:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1618801664;
 bh=5b9p2pFUf9CvasgQR2C2eohBtdxAe1bRW7b9lyDorGc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WyWGtrmKuwtXAtyzrGCxvTcsYEIYhyJcRn20YmgITLthNgn+InvHIwnvrGeQn87Cc
 eg4/3u/WBtgBNOzObBzhE7NcEu01tk2u/eF6DXCKSHh/Op5RSJ3D9jnq3aPwcXq4fT
 HDjUItbxKh1bjibsvw9RZfObetf3yvw1ayP29SVQ=
Date: Mon, 19 Apr 2021 11:17:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/smp: Reintroduce cpu_core_mask
Message-ID: <YHzaMVm3nJfTtDrs@yekko.fritz.box>
References: <20210415120934.232271-1-srikar@linux.vnet.ibm.com>
 <20210415120934.232271-2-srikar@linux.vnet.ibm.com>
 <YHkCvuNfZLQRxjU8@yekko.fritz.box>
 <20210416054549.GF2633526@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="MFiVFzh7bcjXr8e3"
Content-Disposition: inline
In-Reply-To: <20210416054549.GF2633526@linux.vnet.ibm.com>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 hegdevasant@linux.vnet.ibm.com, qemu-ppc@nongnu.org,
 Cedric Le Goater <clg@kaod.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--MFiVFzh7bcjXr8e3
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 16, 2021 at 11:15:49AM +0530, Srikar Dronamraju wrote:
> * David Gibson <david@gibson.dropbear.id.au> [2021-04-16 13:21:34]:
>=20
> Thanks for having a look at the patches.
>=20
> > On Thu, Apr 15, 2021 at 05:39:32PM +0530, Srikar Dronamraju wrote:
> > > Daniel reported that with Commit 4ca234a9cbd7 ("powerpc/smp: Stop
> > > updating cpu_core_mask") QEMU was unable to set single NUMA node SMP
> > > topologies such as:
> > >  -smp 8,maxcpus=3D8,cores=3D2,threads=3D2,sockets=3D2
> > >  i.e he expected 2 sockets in one NUMA node.
> >=20
> > Well, strictly speaking, you can still set that toplogy in qemu but a
> > PAPR guest with that commit will show as having 1 socket in lscpu and
> > similar things.
> >=20
>=20
> Right, I did mention the o/p of lscpu in QEMU with the said commit and
> with the new patches in the cover letter. Somehow I goofed up the cc
> list for the cover letter.
>=20
> Reference for the cover letter:
> https://lore.kernel.org/linuxppc-dev/20210415120934.232271-1-srikar@linux=
=2Evnet.ibm.com/t/#u
>=20
> > Basically, this is because PAPR has no meaningful distinction between
> > cores and sockets.  So it's kind of a cosmetic problem, but it is a
> > user-unexpected behaviour that it would be nice to avoid if it's not
> > excessively difficult.
> >=20
> > > The above commit helped to reduce boot time on Large Systems for
> > > example 4096 vCPU single socket QEMU instance. PAPR is silent on
> > > having more than one socket within a NUMA node.
> > >=20
> > > cpu_core_mask and cpu_cpu_mask for any CPU would be same unless the
> > > number of sockets is different from the number of NUMA nodes.
> >=20
> > Number of sockets being different from number of NUMA nodes is routine
> > in qemu, and I don't think it's something we should enforce.
> >=20
> > > One option is to reintroduce cpu_core_mask but use a slightly
> > > different method to arrive at the cpu_core_mask. Previously each CPU's
> > > chip-id would be compared with all other CPU's chip-id to verify if
> > > both the CPUs were related at the chip level. Now if a CPU 'A' is
> > > found related / (unrelated) to another CPU 'B', all the thread
> > > siblings of 'A' and thread siblings of 'B' are automatically marked as
> > > related / (unrelated).
> > >=20
> > > Also if a platform doesn't support ibm,chip-id property, i.e its
> > > cpu_to_chip_id returns -1, cpu_core_map holds a copy of
> > > cpu_cpu_mask().
> >=20
> > Yeah, the other weirdness here is that ibm,chip-id isn't a PAPR
> > property at all - it was added for powernv.  We then added it to qemu
> > for PAPR guests because that was the way at the time to get the guest
> > to advertise the expected number of sockets.  It therefore basically
> > *only* exists on PAPR/qemu for that purpose, so if it's not serving it
> > we need to come up with something else.
> >=20
>=20
> Do you have ideas on what that something could be like?

Not really, sorry.

> So if that's
> more beneficial then we could move over to that scheme. Also apart
> from ibm,chip-id being not a PAPR property, do you have any other
> concerns with it.

I think if we can keep ibm,chip-id doing this job, that would be
simplest - as long as our PAPR usage isn't implying semantics which
contradict what it does on powernv.  AIUI C=E9dric thought it did that,
but with further discussion it seems like that might have been a
misunderstanding incorrectly conflating chip-id with NUMA nodes.

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--MFiVFzh7bcjXr8e3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmB82jEACgkQbDjKyiDZ
s5L7sxAAhOOsv20tBp2GK9H74lgiIMHzZYvxtL8LXsmmEllEszIn4NFHtlXS5Kj9
33rre6qjE8mqITuBW0678YHDmbaLssYUrSfWuSLHvhN1aFQc84jMUDYf0wkG3MvW
hb4sXwrSE4AYmWzWQFQ9No1fqIxITRqJbx1xmu6I+/dn4T0mbWzVBI4GPcq05wjK
VrHVjaFbZ+i0CQJfvMImDWdT4ALump4nKz/99am4JctJ3YgOQMhbb4nQaYdmrBGL
/wh47cbBF6x8iBZU/F2KCAGfT5cefBhiRs1KYQkqXoG4NJuDlQXNcVPA6ozrmCec
qdah3VGQ3uTc5LgKzDBJ8RtCHd3Dz/xD3mB+Wr0b/HCc9uhGjeOb82z44T0jkWB7
+Dhgd804L1elKr3W8xApXVbeC0Z654mqbX8vlFaaNtgZb9hghVcpQutIM+SjGXtE
VIxDSWDTGIWU6OerLDYGH4JkAVCA84HXzmrg5Y7mcPqB3EwCoOLXdFeAfdTG2WI9
SXk7D+4UF1oV2Sr63L9kJQOUEpNcV/SgGexc5FM74+zunaTh4tC+SG7dYTL59a4Z
wnbypGc4evJNsbma22I+Ae8+q5boTf+cltBjKDeMbldokc2lz29lKFuRA+YdTuTd
hq6zhjcBKfblduNq1rSMJER+ud+ZtqagRz1dlBjYXeJZ04mLzO0=
=VaNN
-----END PGP SIGNATURE-----

--MFiVFzh7bcjXr8e3--
