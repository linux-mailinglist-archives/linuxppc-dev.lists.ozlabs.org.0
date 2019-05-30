Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 317862F7A5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 08:57:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Dz0f4TvWzDqW9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2019 16:57:22 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45DyzJ5r7MzDqTG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 16:56:11 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4U6svWQ127192
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 02:56:07 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sta87g4wv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2019 02:56:07 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Thu, 30 May 2019 07:56:05 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 30 May 2019 07:56:01 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4U6u0qM52101362
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 May 2019 06:56:00 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 436004204C;
 Thu, 30 May 2019 06:56:00 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A2D304204B;
 Thu, 30 May 2019 06:55:59 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 30 May 2019 06:55:59 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 635B3A01EA;
 Thu, 30 May 2019 16:55:58 +1000 (AEST)
Date: Thu, 30 May 2019 16:55:57 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: Oliver <oohall@gmail.com>
Subject: Re: [EXTERNAL] Re: [PATCH v3 1/3] PCI: Introduce
 pcibios_ignore_alignment_request
References: <20190528040313.35582-1-shawn@anastas.io>
 <20190528040313.35582-2-shawn@anastas.io>
 <CAOSf1CEFfbmwfvmdqT1xdt8SFb=tYdYXLfXeyZ8=iRnhg4a3Pg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="TB36FDmn/VVEgNH/"
Content-Disposition: inline
In-Reply-To: <CAOSf1CEFfbmwfvmdqT1xdt8SFb=tYdYXLfXeyZ8=iRnhg4a3Pg@mail.gmail.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-TM-AS-GCONF: 00
x-cbid: 19053006-0028-0000-0000-00000372DD29
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19053006-0029-0000-0000-00002432A459
Message-Id: <20190530065556.GA29428@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-30_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905300051
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
Cc: Shawn Anastasio <shawn@anastas.io>, linux-pci@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rppt@linux.ibm.com,
 Paul Mackerras <paulus@samba.org>, Bjorn Helgaas <bhelgaas@google.com>,
 xyjxie@linux.vnet.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--TB36FDmn/VVEgNH/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 28, 2019 at 03:36:34PM +1000, Oliver wrote:
> On Tue, May 28, 2019 at 2:03 PM Shawn Anastasio <shawn@anastas.io> wrote:
> >
> > Introduce a new pcibios function pcibios_ignore_alignment_request
> > which allows the PCI core to defer to platform-specific code to
> > determine whether or not to ignore alignment requests for PCI resources.
> >
> > The existing behavior is to simply ignore alignment requests when
> > PCI_PROBE_ONLY is set. This is behavior is maintained by the
> > default implementation of pcibios_ignore_alignment_request.
> >
> > Signed-off-by: Shawn Anastasio <shawn@anastas.io>
> > ---
> >  drivers/pci/pci.c   | 9 +++++++--
> >  include/linux/pci.h | 1 +
> >  2 files changed, 8 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
> > index 8abc843b1615..8207a09085d1 100644
> > --- a/drivers/pci/pci.c
> > +++ b/drivers/pci/pci.c
> > @@ -5882,6 +5882,11 @@ resource_size_t __weak pcibios_default_alignment=
(void)
> >         return 0;
> >  }
> >
> > +int __weak pcibios_ignore_alignment_request(void)
> > +{
> > +       return pci_has_flag(PCI_PROBE_ONLY);
> > +}
> > +
> >  #define RESOURCE_ALIGNMENT_PARAM_SIZE COMMAND_LINE_SIZE
> >  static char resource_alignment_param[RESOURCE_ALIGNMENT_PARAM_SIZE] =
=3D {0};
> >  static DEFINE_SPINLOCK(resource_alignment_lock);
> > @@ -5906,9 +5911,9 @@ static resource_size_t pci_specified_resource_ali=
gnment(struct pci_dev *dev,
> >         p =3D resource_alignment_param;
> >         if (!*p && !align)
> >                 goto out;
> > -       if (pci_has_flag(PCI_PROBE_ONLY)) {
> > +       if (pcibios_ignore_alignment_request()) {
> >                 align =3D 0;
> > -               pr_info_once("PCI: Ignoring requested alignments (PCI_P=
ROBE_ONLY)\n");
> > +               pr_info_once("PCI: Ignoring requested alignments\n");
> >                 goto out;
> >         }
>=20
> I think the logic here is questionable to begin with. If the user has
> explicitly requested re-aligning a resource via the command line then
> we should probably do it even if PCI_PROBE_ONLY is set. When it breaks
> they get to keep the pieces.
>=20
> That said, the real issue here is that PCI_PROBE_ONLY probably
> shouldn't be set under qemu/kvm. Under the other hypervisor (PowerVM)
> hotplugged devices are configured by firmware before it's passed to
> the guest and we need to keep the FW assignments otherwise things
> break. QEMU however doesn't do any BAR assignments and relies on that
> being handled by the guest. At boot time this is done by SLOF, but
> Linux only keeps SLOF around until it's extracted the device-tree.
> Once that's done SLOF gets blown away and the kernel needs to do it's
> own BAR assignments. I'm guessing there's a hack in there to make it
> work today, but it's a little surprising that it works at all...
>=20
> IIRC Sam Bobroff was looking at hotplug under pseries recently so he
> might have something to add. He's sick at the moment, but I'll ask him
> to take a look at this once he's back among the living

There seems to be some code already in the kernel that will disable
PCI_PROBE_ONLY based on a device tree property, so I did a quick test
today and it seems to work. Only a trivial tweak is needed in QEMU to
do it (have spapr_dt_chosen() add a node called "linux,pci-probe-only"
with a value of 0), and that would allow us to set it only for QEMU (and
not PowerVM) if that's what we want to do. Is that useful?

(I haven't done any real testing yet but the guest booted up OK.)

> > diff --git a/include/linux/pci.h b/include/linux/pci.h
> > index 4a5a84d7bdd4..47471dcdbaf9 100644
> > --- a/include/linux/pci.h
> > +++ b/include/linux/pci.h
> > @@ -1990,6 +1990,7 @@ static inline void pcibios_penalize_isa_irq(int i=
rq, int active) {}
> >  int pcibios_alloc_irq(struct pci_dev *dev);
> >  void pcibios_free_irq(struct pci_dev *dev);
> >  resource_size_t pcibios_default_alignment(void);
> > +int pcibios_ignore_alignment_request(void);
> >
> >  #ifdef CONFIG_HIBERNATE_CALLBACKS
> >  extern struct dev_pm_ops pcibios_pm_ops;
> > --
> > 2.20.1
> >
>=20

--TB36FDmn/VVEgNH/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAlzvfnUACgkQMX8w6AQl
/iLbOwf/d0gNgnSqs8kTnw36ULHdsfnYqJ1nnP1JdurEmTRvPQmXzeIHWFqDcs8O
IQGdXSiM2A+K53DAppyOR+VA11rlk1xPPMllSjR5OYGXBqRIEnILf2775KVAVFRO
xBbuLwoaf5ALbncD47CUZIQrj/SCcm5eaQTG/gFZplYfGQXybiSzvAEWCpNglC34
7m/jfyQHxJ6jlxU9dllz/RlFChiE4Opv2G2romtnL+Ysf+NwLccArSz0LC6ZQ1Gk
2Ar3LGpWIPwnXYVC9vUJMDwxYRL9dWX1I7WiksD/P0021gjVpe0XkntRqvhILmbb
AkPDkvXYmBkoEMYSPunaff28TpkXdQ==
=pvCZ
-----END PGP SIGNATURE-----

--TB36FDmn/VVEgNH/--

