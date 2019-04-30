Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8CEF01E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 07:55:42 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tW3J3jb3zDqDb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 15:55:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tW1m5cMRzDqB2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 15:54:20 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3U5qRkx147176
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:54:18 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s6gkfg1g4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:54:17 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 30 Apr 2019 06:54:15 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 30 Apr 2019 06:54:13 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3U5sC3u42795262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 05:54:12 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A629D5204F;
 Tue, 30 Apr 2019 05:54:12 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0BCF552052;
 Tue, 30 Apr 2019 05:54:12 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id DA13DA01D2;
 Tue, 30 Apr 2019 15:54:10 +1000 (AEST)
Date: Tue, 30 Apr 2019 15:54:09 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 6/8] powerpc/eeh: Initialize EEH address cache earlier
References: <cover.1553050609.git.sbobroff@linux.ibm.com>
 <0ca5b600a69f73323b269e4bfdaec1a53cdb4282.1553050609.git.sbobroff@linux.ibm.com>
 <ab420fc4bdfae1bd85f3e478eb1629b1e41f768c.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="JWEK1jqKZ6MHAcjA"
Content-Disposition: inline
In-Reply-To: <ab420fc4bdfae1bd85f3e478eb1629b1e41f768c.camel@gmail.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-TM-AS-GCONF: 00
x-cbid: 19043005-0020-0000-0000-00000337B591
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19043005-0021-0000-0000-0000218A321A
Message-Id: <20190430055409.GC9630@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300039
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--JWEK1jqKZ6MHAcjA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2019 at 08:13:53PM +1000, Oliver O'Halloran wrote:
> On Wed, 2019-03-20 at 13:58 +1100, Sam Bobroff wrote:
> > The EEH address cache is currently initialized and populated by a
> > single function: eeh_addr_cache_build().  While the initial population
> > of the cache can only be done once resources are allocated,
> > initialization (just setting up a spinlock) could be done much
> > earlier.
> >=20
> > So move the initialization step into a separate function and call it
> > from a core_initcall (rather than a subsys initcall).
> >=20
>=20
> > This will allow future work to make use of the cache during boot time
> > PCI scanning.
>=20
> What's the idea there? Checking for overlaps in the BAR assignments?

The idea is just to be able to populate the cache earlier during boot
time, because that allows more code to be consolidated:

Before this set, the pcibios_add_device handlers were called during boot
but they couldn't populate the cache because it wasn't set up. Instead,
the handlers did nothing and a separate sweep was done after setting up
the cache. (This is annoying because when devices are added after boot,
the pcibios_add_device handlers are the only place where the cache can
be populated.)

> > Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/eeh.h  |  3 +++
> >  arch/powerpc/kernel/eeh.c       |  2 ++
> >  arch/powerpc/kernel/eeh_cache.c | 13 +++++++++++--
> >  3 files changed, 16 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/=
eeh.h
> > index e217ccda55d0..791b9e6fcc45 100644
> > --- a/arch/powerpc/include/asm/eeh.h
> > +++ b/arch/powerpc/include/asm/eeh.h
> > @@ -295,6 +295,7 @@ int __init eeh_ops_register(struct eeh_ops *ops);
> >  int __exit eeh_ops_unregister(const char *name);
> >  int eeh_check_failure(const volatile void __iomem *token);
> >  int eeh_dev_check_failure(struct eeh_dev *edev);
> > +void eeh_addr_cache_init(void);
> >  void eeh_addr_cache_build(void);
> >  void eeh_add_device_early(struct pci_dn *);
> >  void eeh_add_device_tree_early(struct pci_dn *);
> > @@ -362,6 +363,8 @@ static inline int eeh_check_failure(const volatile =
void __iomem *token)
> > =20
> >  #define eeh_dev_check_failure(x) (0)
> > =20
> > +static inline void eeh_addr_cache_init(void) { }
> > +
> >  static inline void eeh_addr_cache_build(void) { }
> > =20
> >  static inline void eeh_add_device_early(struct pci_dn *pdn) { }
> > diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> > index 3dcff29cb9b3..7a406d58d2c0 100644
> > --- a/arch/powerpc/kernel/eeh.c
> > +++ b/arch/powerpc/kernel/eeh.c
> > @@ -1219,6 +1219,8 @@ static int eeh_init(void)
> >  	list_for_each_entry_safe(hose, tmp, &hose_list, list_node)
> >  		eeh_dev_phb_init_dynamic(hose);
> > =20
> > +	eeh_addr_cache_init();
> > +
> >  	/* Initialize EEH event */
> >  	return eeh_event_init();
> >  }
> > diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_=
cache.c
> > index 9c68f0837385..f93dd5cf6a39 100644
> > --- a/arch/powerpc/kernel/eeh_cache.c
> > +++ b/arch/powerpc/kernel/eeh_cache.c
> > @@ -267,6 +267,17 @@ void eeh_addr_cache_rmv_dev(struct pci_dev *dev)
> >  	spin_unlock_irqrestore(&pci_io_addr_cache_root.piar_lock, flags);
> >  }
> > =20
> > +/**
> > + * eeh_addr_cache_init - Initialize a cache of I/O addresses
> > + *
> > + * Initialize a cache of pci i/o addresses.  This cache will be used to
> > + * find the pci device that corresponds to a given address.
> > + */
> > +void eeh_addr_cache_init(void)
> > +{
> > +	spin_lock_init(&pci_io_addr_cache_root.piar_lock);
> > +}
>=20
> You could move this out of the pci_io_addr_cache structure and use
> DEFINE_SPINLOCK() too. We might even be able to get rid of the hand-
> rolled interval tree in eeh_cache.c in favour of the generic
> implementation (see mm/interval_tree.c). I'm pretty sure the generic
> one is a drop-in replacement, but I haven't had a chance to have a
> detailed look to see if there's any differences in behaviour.

Sounds good, I'll try to take a look at doing it in a future patch :-)

> > +
> >  /**
> >   * eeh_addr_cache_build - Build a cache of I/O addresses
> >   *
> > @@ -282,8 +293,6 @@ void eeh_addr_cache_build(void)
> >  	struct eeh_dev *edev;
> >  	struct pci_dev *dev =3D NULL;
> > =20
> > -	spin_lock_init(&pci_io_addr_cache_root.piar_lock);
> > -
> >  	for_each_pci_dev(dev) {
> >  		pdn =3D pci_get_pdn_by_devfn(dev->bus, dev->devfn);
> >  		if (!pdn)
>=20

--JWEK1jqKZ6MHAcjA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAlzH4wEACgkQMX8w6AQl
/iITkAf9GAXkUlcj3rRFfJYcIdvRpdrGIt15kBy+gkDcAZHmApAQ2TIvajGrN3w7
zz7vc2tjxm7DzodDT4yIDc6zxRpO7DCRvcFtVuAuHY9Dzc9YpfM6Os3mkmGGJjKK
/pbzJNDTgh/gyawsCCj6TrGJUlhG3Irr+dPJ4asOdd5dkTcq4ISbQQRdy/A1KQr5
QGyt61Kf1mbMczlPPL2cZhmliw2ykhTAWqIm1TuQJvgOV85P7VY5nN29RwysI1CT
bKY+Ppc5tgYoHBcHlK38AA5aT/tGXPvVGcDNv5LXXCZVMMxr/VDWJQQFpVRXR6+x
CqH58xmMRGNxhf6mye2sBxLgkibeuQ==
=nhNT
-----END PGP SIGNATURE-----

--JWEK1jqKZ6MHAcjA--

