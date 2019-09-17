Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB784B44FD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 02:55:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XPm13RTZzF3Fj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 10:55:13 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XPfd1r0VzF3by
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 10:50:33 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H0kbin144952
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 20:50:30 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v2h04qr31-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 20:50:30 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 17 Sep 2019 01:50:28 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 01:50:27 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8H0oQfD17301832
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 00:50:26 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1412411C058;
 Tue, 17 Sep 2019 00:50:26 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7323211C04C;
 Tue, 17 Sep 2019 00:50:25 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 00:50:25 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (unknown [9.81.192.242])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id EB424A019A;
 Tue, 17 Sep 2019 10:50:23 +1000 (AEST)
Date: Tue, 17 Sep 2019 10:50:22 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 02/14] powerpc/eeh: Fix race when freeing PDNs
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-3-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="4SFOXa2GPu3tIq4H"
Content-Disposition: inline
In-Reply-To: <20190903101605.2890-3-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19091700-0020-0000-0000-0000036DDC28
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091700-0021-0000-0000-000021C37D8D
Message-Id: <20190917005021.GB21303@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170007
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


--4SFOXa2GPu3tIq4H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 08:15:53PM +1000, Oliver O'Halloran wrote:
> When hot-adding devices we rely on the hotplug driver to create pci_dn's
> for the devices under the hotplug slot. Converse, when hot-removing the
> driver will remove the pci_dn's that it created. This is a problem because
> the pci_dev is still live until it's refcount drops to zero. This can
> happen if the driver is slow to tear down it's internal state. Ideally, t=
he
> driver would not attempt to perform any config accesses to the device once
> it's been marked as removed, but sometimes it happens. As a result, we
> might attempt to access the pci_dn for a device that has been torn down a=
nd
> the kernel may crash as a result.
>=20
> To fix this, don't free the pci_dn unless the corresponding pci_dev has
> been released.  If the pci_dev is still live, then we mark the pci_dn with
> a flag that indicates the pci_dev's release function should free it.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

If I understand this, it works because when
pci_remove_device_node_info() calls pci_get_domain_bus_and_slot(),
it either:
a) returns null, meaning the pci_dev is already gone, the release
handler is already called, and the PDN can be removed there, or
b) returns non-null and atomically increases the refcount and the
release handler won't be called until after we've set the DEAD flag and
released our reference.

Looks good to me,

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/pci-bridge.h |  1 +
>  arch/powerpc/kernel/pci-hotplug.c     |  7 +++++++
>  arch/powerpc/kernel/pci_dn.c          | 21 +++++++++++++++++++--
>  3 files changed, 27 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/pci-bridge.h b/arch/powerpc/include=
/asm/pci-bridge.h
> index 54a9de01c2a3..69f4cb3b7c56 100644
> --- a/arch/powerpc/include/asm/pci-bridge.h
> +++ b/arch/powerpc/include/asm/pci-bridge.h
> @@ -183,6 +183,7 @@ struct iommu_table;
>  struct pci_dn {
>  	int     flags;
>  #define PCI_DN_FLAG_IOV_VF	0x01
> +#define PCI_DN_FLAG_DEAD	0x02    /* Device has been hot-removed */
> =20
>  	int	busno;			/* pci bus number */
>  	int	devfn;			/* pci device and function number */
> diff --git a/arch/powerpc/kernel/pci-hotplug.c b/arch/powerpc/kernel/pci-=
hotplug.c
> index 0b0cf8168b47..fc62c4bc47b1 100644
> --- a/arch/powerpc/kernel/pci-hotplug.c
> +++ b/arch/powerpc/kernel/pci-hotplug.c
> @@ -55,11 +55,18 @@ EXPORT_SYMBOL_GPL(pci_find_bus_by_node);
>  void pcibios_release_device(struct pci_dev *dev)
>  {
>  	struct pci_controller *phb =3D pci_bus_to_host(dev->bus);
> +	struct pci_dn *pdn =3D pci_get_pdn(dev);
> =20
>  	eeh_remove_device(dev);
> =20
>  	if (phb->controller_ops.release_device)
>  		phb->controller_ops.release_device(dev);
> +
> +	/* free()ing the pci_dn has been deferred to us, do it now */
> +	if (pdn && (pdn->flags & PCI_DN_FLAG_DEAD)) {
> +		pci_dbg(dev, "freeing dead pdn\n");
> +		kfree(pdn);
> +	}
>  }
> =20
>  /**
> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
> index 5614ca0940ca..4e654df55969 100644
> --- a/arch/powerpc/kernel/pci_dn.c
> +++ b/arch/powerpc/kernel/pci_dn.c
> @@ -320,6 +320,7 @@ void pci_remove_device_node_info(struct device_node *=
dn)
>  {
>  	struct pci_dn *pdn =3D dn ? PCI_DN(dn) : NULL;
>  	struct device_node *parent;
> +	struct pci_dev *pdev;
>  #ifdef CONFIG_EEH
>  	struct eeh_dev *edev =3D pdn_to_eeh_dev(pdn);
> =20
> @@ -333,12 +334,28 @@ void pci_remove_device_node_info(struct device_node=
 *dn)
>  	WARN_ON(!list_empty(&pdn->child_list));
>  	list_del(&pdn->list);
> =20
> +	/* Drop the parent pci_dn's ref to our backing dt node */
>  	parent =3D of_get_parent(dn);
>  	if (parent)
>  		of_node_put(parent);
> =20
> -	dn->data =3D NULL;
> -	kfree(pdn);
> +	/*
> +	 * At this point we *might* still have a pci_dev that was
> +	 * instantiated from this pci_dn. So defer free()ing it until
> +	 * the pci_dev's release function is called.
> +	 */
> +	pdev =3D pci_get_domain_bus_and_slot(pdn->phb->global_number,
> +			pdn->busno, pdn->devfn);
> +	if (pdev) {
> +		/* NB: pdev has a ref to dn */
> +		pci_dbg(pdev, "marked pdn (from %pOF) as dead\n", dn);
> +		pdn->flags |=3D PCI_DN_FLAG_DEAD;
> +	} else {
> +		dn->data =3D NULL;
> +		kfree(pdn);
> +	}
> +
> +	pci_dev_put(pdev);
>  }
>  EXPORT_SYMBOL_GPL(pci_remove_device_node_info);
> =20
> --=20
> 2.21.0
>=20

--4SFOXa2GPu3tIq4H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl2ALc0ACgkQMX8w6AQl
/iKekwf9GcWW2AJGewM2OZfSxvKfPq1insicYWnlo1jlzwYARIB0MwMD3ZV3S71t
9wO2G9fG0IIekagb2VHzcVgDB1SVLPrhKD7NsbVmpzF6VEkBpBxFz3wGgT0uWmge
7vHiiCIyT2lE/tCthSy8mHu26fDVDOSd3lI3pB9/d9WNmFK6liQ8KnOu0wrBQ7x3
u2ha441gdYq/rcTg5dTG2CwCwVkHdnY+GmGDS41yy05iMCKAVHUf8kmJDWb8rHD3
XAa+W9a9QAbNE8KB0SAIp//yvu1x2tW1jKVszh77B/iN0Cfv5EHnDvOMLAoRp+aa
+F2BJrFjbWXmW40e2L/7CTRH3Dasgw==
=nwhE
-----END PGP SIGNATURE-----

--4SFOXa2GPu3tIq4H--

