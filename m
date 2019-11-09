Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B7801F5F5D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Nov 2019 14:25:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479HvL2nVvzF789
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 00:25:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.50.32; helo=7.mo69.mail-out.ovh.net;
 envelope-from=groug@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 949 seconds by postgrey-1.36 at bilbo;
 Sun, 10 Nov 2019 00:23:41 AEDT
Received: from 7.mo69.mail-out.ovh.net (7.mo69.mail-out.ovh.net [46.105.50.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479Hs94w2dzF6JK
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 00:23:37 +1100 (AEDT)
Received: from player798.ha.ovh.net (unknown [10.108.35.103])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 5518A6DE60
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Nov 2019 14:07:41 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player798.ha.ovh.net (Postfix) with ESMTPSA id 9B921BFA4E0F;
 Sat,  9 Nov 2019 13:07:36 +0000 (UTC)
Date: Sat, 9 Nov 2019 14:07:35 +0100
From: Greg Kurz <groug@kaod.org>
To: christophe lombard <clombard@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/3] powerpc/pseries: Fixup config space size of
 OpenCAPI devices
Message-ID: <20191109140735.52e0698e@bahia.lan>
In-Reply-To: <35141b5c-a48c-d0c8-a566-cd3e36121c59@linux.vnet.ibm.com>
References: <20191022075247.16266-1-clombard@linux.vnet.ibm.com>
 <20191022075247.16266-4-clombard@linux.vnet.ibm.com>
 <f80de6db-cfea-5897-288f-64d002b25d8d@linux.ibm.com>
 <35141b5c-a48c-d0c8-a566-cd3e36121c59@linux.vnet.ibm.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Ovh-Tracer-Id: 13410593792977508658
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvfedghedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfesthhqredtredtjeenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehlihhnuhigphhptgdquggvvheslhhishhtshdrohiilhgrsghsrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
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
Cc: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>,
 fbarrat@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 7 Nov 2019 09:46:25 +0100
christophe lombard <clombard@linux.vnet.ibm.com> wrote:

> On 05/11/2019 06:01, Andrew Donnellan wrote:
> > On 22/10/19 6:52 pm, christophe lombard wrote:
> >> Fix up the pci config size of the OpenCAPI PCIe devices in the pseries
> >> environment.
> >> Most of OpenCAPI PCIe devices have 4096 bytes of configuration space.
> >=20
> > It's not "most of", it's "all" - the OpenCAPI Discovery and=20
> > Configuration Spec requires the use of extended capabilities that fall=
=20
> > in the 0x100-0xFFF range.
> >=20
> >>
> >> Signed-off-by: Christophe Lombard <clombard@linux.vnet.ibm.com>
> >> ---
> >> =C2=A0 arch/powerpc/platforms/pseries/pci.c | 9 +++++++++
> >> =C2=A0 1 file changed, 9 insertions(+)
> >>
> >> diff --git a/arch/powerpc/platforms/pseries/pci.c=20
> >> b/arch/powerpc/platforms/pseries/pci.c
> >> index 1eae1d09980c..3397784767b0 100644
> >> --- a/arch/powerpc/platforms/pseries/pci.c
> >> +++ b/arch/powerpc/platforms/pseries/pci.c
> >> @@ -291,6 +291,15 @@ static void fixup_winbond_82c105(struct pci_dev*=
=20
> >> dev)
> >> =C2=A0 DECLARE_PCI_FIXUP_HEADER(PCI_VENDOR_ID_WINBOND,=20
> >> PCI_DEVICE_ID_WINBOND_82C105,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 fixup_winbond_82c105);
> >> +static void fixup_opencapi_cfg_size(struct pci_dev *pdev)
> >> +{
> >> +=C2=A0=C2=A0=C2=A0 if (!machine_is(pseries))
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return;
> >> +
> >> +=C2=A0=C2=A0=C2=A0 pdev->cfg_size =3D PCI_CFG_SPACE_EXP_SIZE;
> >> +}
> >> +DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_IBM, 0x062b,=20
> >> fixup_opencapi_cfg_size);
> >=20
> > An OpenCAPI device can have any PCI ID, is there a particular reason=20
> > we're limiting this to 1014:062b? On PowerNV, we check the PHB type to=
=20
> > determine whether the device is OpenCAPI or not, what's the equivalent=
=20
> > for pseries?
> >=20
>=20
> Thanks for the review. For pseries, there is no specific OpenCapi PHB=20
> type which constraints this kind of request.
> We are working to found an other solution.
>=20

Well... we have an old PAPR+ addendum draft that mentions an "open-capi"
PHB type. The specification was never finalized and AFAIK PowerVM doesn't
support the OpenCAPI interface, so we didn't stick to the addendum during
our in-house prototyping. But now that we want to upstream things, I think
we should probably come up with a dedicated PHB type.

> >> +
> >> =C2=A0 int pseries_root_bridge_prepare(struct pci_host_bridge *bridge)
> >> =C2=A0 {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct device_node *dn, *pdn;
> >>
> >=20
>=20

