Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 021824B1BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 07:55:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TDgZ1nyFzDqML
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 15:55:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TDdc1BF5zDqLp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 15:53:23 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5J5ptgg033117
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 01:53:21 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t7epfs6d4-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 01:53:20 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Wed, 19 Jun 2019 06:53:19 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 06:53:17 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5J5rGJc42729522
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 05:53:16 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B67F0A405D;
 Wed, 19 Jun 2019 05:53:16 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 20303A4051;
 Wed, 19 Jun 2019 05:53:16 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jun 2019 05:53:16 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D22FBA01FB;
 Wed, 19 Jun 2019 15:53:14 +1000 (AEST)
Date: Wed, 19 Jun 2019 15:53:13 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: Oliver <oohall@gmail.com>
Subject: Re: [PATCH v2 6/6] powerpc/eeh: Refactor around eeh_probe_devices()
References: <cover.1557203383.git.sbobroff@linux.ibm.com>
 <a3e33cf84e4d6a957259e04533c85a37db0d2aef.1557203383.git.sbobroff@linux.ibm.com>
 <CAOSf1CFYtmbq2ZMpAPuJiyG7gkUO=w-mp-61jW1uQCHfF3=LpQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5/uDoXvLw7AC5HRs"
Content-Disposition: inline
In-Reply-To: <CAOSf1CFYtmbq2ZMpAPuJiyG7gkUO=w-mp-61jW1uQCHfF3=LpQ@mail.gmail.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-TM-AS-GCONF: 00
x-cbid: 19061905-0020-0000-0000-0000034B5DB2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061905-0021-0000-0000-0000219EAEFD
Message-Id: <20190619055313.GB24143@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190047
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--5/uDoXvLw7AC5HRs
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 05, 2019 at 03:49:15PM +1000, Oliver wrote:
> On Tue, May 7, 2019 at 2:30 PM Sam Bobroff <sbobroff@linux.ibm.com> wrote:
> >
> > Now that EEH support for all devices (on PowerNV and pSeries) is
> > provided by the pcibios bus add device hooks, eeh_probe_devices() and
> > eeh_addr_cache_build() are redundant and can be removed.
> >
> > Move the EEH enabled message into it's own function so that it can be
> > called from multiple places.
> >
> > Note that previously on pSeries, useless EEH sysfs files were created
> > for some devices that did not have EEH support and this change
> > prevents them from being created.
> >
> > Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> > ---
> > v2 - As it's so small, merged the enablement message patch into this on=
e (where it's used).
> >    - Reworked enablement messages.
> >
> >  arch/powerpc/include/asm/eeh.h               |  7 ++---
> >  arch/powerpc/kernel/eeh.c                    | 27 ++++++-----------
> >  arch/powerpc/kernel/eeh_cache.c              | 32 --------------------
> >  arch/powerpc/platforms/powernv/eeh-powernv.c |  4 +--
> >  arch/powerpc/platforms/pseries/pci.c         |  3 +-
> >  5 files changed, 14 insertions(+), 59 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/=
eeh.h
> > index 12baf1df134c..3994d45ae0d4 100644
> > --- a/arch/powerpc/include/asm/eeh.h
> > +++ b/arch/powerpc/include/asm/eeh.h
> > @@ -283,13 +283,12 @@ struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe);
> >
> >  struct eeh_dev *eeh_dev_init(struct pci_dn *pdn);
> >  void eeh_dev_phb_init_dynamic(struct pci_controller *phb);
> > -void eeh_probe_devices(void);
> > +void eeh_show_enabled(void);
> >  int __init eeh_ops_register(struct eeh_ops *ops);
> >  int __exit eeh_ops_unregister(const char *name);
> >  int eeh_check_failure(const volatile void __iomem *token);
> >  int eeh_dev_check_failure(struct eeh_dev *edev);
> >  void eeh_addr_cache_init(void);
> > -void eeh_addr_cache_build(void);
> >  void eeh_add_device_early(struct pci_dn *);
> >  void eeh_add_device_tree_early(struct pci_dn *);
> >  void eeh_add_device_late(struct pci_dev *);
> > @@ -333,7 +332,7 @@ static inline bool eeh_enabled(void)
> >          return false;
> >  }
> >
> > -static inline void eeh_probe_devices(void) { }
> > +static inline void eeh_show_enabled(void) { }
> >
> >  static inline void *eeh_dev_init(struct pci_dn *pdn, void *data)
> >  {
> > @@ -351,8 +350,6 @@ static inline int eeh_check_failure(const volatile =
void __iomem *token)
> >
> >  static inline void eeh_addr_cache_init(void) { }
> >
> > -static inline void eeh_addr_cache_build(void) { }
> > -
> >  static inline void eeh_add_device_early(struct pci_dn *pdn) { }
> >
> >  static inline void eeh_add_device_tree_early(struct pci_dn *pdn) { }
> > diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> > index 1ed80adb40a1..f905235f0307 100644
> > --- a/arch/powerpc/kernel/eeh.c
> > +++ b/arch/powerpc/kernel/eeh.c
> > @@ -163,6 +163,16 @@ static int __init eeh_setup(char *str)
> >  }
> >  __setup("eeh=3D", eeh_setup);
> >
> > +void eeh_show_enabled(void)
> > +{
> > +       if (eeh_has_flag(EEH_FORCE_DISABLED))
> > +               pr_info("EEH: Recovery disabled by kernel parameter.\n"=
);
> > +       else if (eeh_has_flag(EEH_ENABLED))
> > +               pr_info("EEH: Capable adapter found: recovery enabled.\=
n");
> > +       else
> > +               pr_info("EEH: No capable adapters found: recovery disab=
led.\n");
> > +}
> > +
> >  /*
> >   * This routine captures assorted PCI configuration space data
> >   * for the indicated PCI device, and puts them into a buffer
> > @@ -1156,23 +1166,6 @@ static struct notifier_block eeh_reboot_nb =3D {
> >         .notifier_call =3D eeh_reboot_notifier,
> >  };
> >
>=20
> > -void eeh_probe_devices(void)
> > -{
> > -       struct pci_controller *hose, *tmp;
> > -       struct pci_dn *pdn;
> > -
> > -       /* Enable EEH for all adapters */
> > -       list_for_each_entry_safe(hose, tmp, &hose_list, list_node) {
> > -               pdn =3D hose->pci_data;
> > -               traverse_pci_dn(pdn, eeh_ops->probe, NULL);
> > -       }
> > -       if (eeh_enabled())
> > -               pr_info("EEH: PCI Enhanced I/O Error Handling Enabled\n=
");
> > -       else
> > -               pr_info("EEH: No capable adapters found\n");
> > -
> > -}
>=20
> The one concern I have about this is that PAPR requires us to enable
> EEH for the device before we do any config accesses. From PAPR:
>=20
> R1=E2=80=937.3.11.1=E2=80=935. For the EEH option: If a device driver is =
going to
> enable EEH and the platform has not defaulted
> to EEH enabled, then it must do so before it does any operations with
> its IOA, including any configuration
> cycles or Load or Store operations.
>=20
> So if we want to be strictly compatible we'd need to ensure the
> set-eeh-option RTAS call happens before we read the VDID in
> pci_scan_device(). The pseries eeh_probe() function does this
> currently, but if we defer it until the pcibios call happens we'll
> have done a pile of config accesses before then. Maybe it doesn't
> matter, but we'd need to do further testing under phyp or work out
> some other way to ensure it's done pre-probe.

Hmm! I had not looked at this specifically, but I don't think I've made
it any worse. The reordering is all underneath pcibios_init(), and it
changes things from this...

	for each PHB: pcibios_scan_phb() and then pci_bus_add_devices().
	pcibios_resource_survey() [calls ppc_md.pcibios_fixup()->eeh_probe_devices=
()]

=2E.. to this:

	for each PHB: pcibios_scan_phb()
	pcibios_resource_survey()
	for each PHB: pci_bus_add_devices()
	ppc_md.pcibios_fixup()->eeh_probe_devices()

So either way, the EEH probe (and therefore setup) happens last. Moving
the probe into pseries_pcibios_bus_add_device() actually moves it a
little earlier than before.

Just for kicks, I instrumented rtas_pci_read_config() and it shows
that there are indeed several accesses before the probe function is
called. Here's the first:

pcibios_init() ->
pcibios_scan_phb() ->
__of_scan_bus() ->
of_scan_pci_dev() ->
of_create_pci_dev() ->
set_pcie_port_type() ->
pci_find_capability()

Most of that is PowerPC specific, and there's already an EEH hack in
of_scan_pci_dev(), so I tried a quick hack to probe there and it does
seem at least boot OK. And it's before any accesses! :-)

What do you think? (Although, I think I'd prefer to leave this as follow
up work.)

> >  /**
> >   * eeh_init - EEH initialization
> >   *
> > diff --git a/arch/powerpc/kernel/eeh_cache.c b/arch/powerpc/kernel/eeh_=
cache.c
> > index f93dd5cf6a39..c40078d036af 100644
> > --- a/arch/powerpc/kernel/eeh_cache.c
> > +++ b/arch/powerpc/kernel/eeh_cache.c
> > @@ -278,38 +278,6 @@ void eeh_addr_cache_init(void)
> >         spin_lock_init(&pci_io_addr_cache_root.piar_lock);
> >  }
> >
> > -/**
> > - * eeh_addr_cache_build - Build a cache of I/O addresses
> > - *
> > - * Build a cache of pci i/o addresses.  This cache will be used to
> > - * find the pci device that corresponds to a given address.
> > - * This routine scans all pci busses to build the cache.
> > - * Must be run late in boot process, after the pci controllers
> > - * have been scanned for devices (after all device resources are known=
).
> > - */
> > -void eeh_addr_cache_build(void)
> > -{
> > -       struct pci_dn *pdn;
> > -       struct eeh_dev *edev;
> > -       struct pci_dev *dev =3D NULL;
> > -
> > -       for_each_pci_dev(dev) {
> > -               pdn =3D pci_get_pdn_by_devfn(dev->bus, dev->devfn);
> > -               if (!pdn)
> > -                       continue;
> > -
> > -               edev =3D pdn_to_eeh_dev(pdn);
> > -               if (!edev)
> > -                       continue;
> > -
> > -               dev->dev.archdata.edev =3D edev;
> > -               edev->pdev =3D dev;
> > -
> > -               eeh_addr_cache_insert_dev(dev);
> > -               eeh_sysfs_add_device(dev);
> > -       }
> > -}
> > -
> >  static int eeh_addr_cache_show(struct seq_file *s, void *v)
> >  {
> >         struct pci_io_addr_range *piar;
> > diff --git a/arch/powerpc/platforms/powernv/eeh-powernv.c b/arch/powerp=
c/platforms/powernv/eeh-powernv.c
> > index 90729d908a54..22a94f4b8586 100644
> > --- a/arch/powerpc/platforms/powernv/eeh-powernv.c
> > +++ b/arch/powerpc/platforms/powernv/eeh-powernv.c
> > @@ -259,9 +259,7 @@ int pnv_eeh_post_init(void)
> >         struct pnv_phb *phb;
> >         int ret =3D 0;
> >
> > -       /* Probe devices & build address cache */
> > -       eeh_probe_devices();
> > -       eeh_addr_cache_build();
> > +       eeh_show_enabled();
> >
> >         /* Register OPAL event notifier */
> >         eeh_event_irq =3D opal_event_request(ilog2(OPAL_EVENT_PCI_ERROR=
));
> > diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platfo=
rms/pseries/pci.c
> > index 37a77e57893e..d6a5f4f27507 100644
> > --- a/arch/powerpc/platforms/pseries/pci.c
> > +++ b/arch/powerpc/platforms/pseries/pci.c
> > @@ -242,8 +242,7 @@ void __init pSeries_final_fixup(void)
> >
> >         pSeries_request_regions();
> >
> > -       eeh_probe_devices();
> > -       eeh_addr_cache_build();
> > +       eeh_show_enabled();
> >
> >  #ifdef CONFIG_PCI_IOV
> >         ppc_md.pcibios_sriov_enable =3D pseries_pcibios_sriov_enable;
> > --
> > 2.19.0.2.gcad72f5712
> >
>=20

--5/uDoXvLw7AC5HRs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl0JzcMACgkQMX8w6AQl
/iL5PAf7BCJguKrkaj5w0/ShROgrznDg2/Tr0sS24YXa5bIfDj2v1uXd2pAB1NcE
QJTvaOeD1IFD4j0ldai5Nv4wcbN49li3BjKTpHgI0em94QyCWwAsUT++lXMCXIeF
6D1eljMjJUxM6tshzJe2M78XMQs0neyp1G1UNc1Q1rJE77sjm3vBKv5g7iaAhYN7
0onBegI52OLxdpQAutXeY7QTpoB/lrb0KlzaLagMrL40vQ6s05xRKZYpQ3THJx0j
YHruayBp/YJ+Y3Q+XIhitu7CfyDBTEdiIEz5vCrHdCoQkwDX5uG4RNAuIKTLm/Zq
faDViqwuPhuGabMpOMzYqgT25WpVCg==
=eLxz
-----END PGP SIGNATURE-----

--5/uDoXvLw7AC5HRs--

