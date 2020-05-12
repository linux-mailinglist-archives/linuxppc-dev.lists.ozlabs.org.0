Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CC51CEC74
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 07:30:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49LmbN1FHPzDqtK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 May 2020 15:30:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49LmYf2jvRzDqlg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 15:28:37 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04C51ZG4026556
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 01:28:34 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30wsa04hre-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 01:28:34 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04C52uKV036931
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 May 2020 01:28:34 -0400
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 30wsa04hpt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 01:28:34 -0400
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04C5PUkY031686;
 Tue, 12 May 2020 05:28:32 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04fra.de.ibm.com with ESMTP id 30wm55jb1y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 May 2020 05:28:32 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04C5SUkv61210718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 May 2020 05:28:30 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 538BBA4051;
 Tue, 12 May 2020 05:28:30 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id AFD75A4055;
 Tue, 12 May 2020 05:28:29 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 12 May 2020 05:28:29 +0000 (GMT)
Received: from osmium (unknown [9.206.141.95])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C7461A01D8;
 Tue, 12 May 2020 15:28:23 +1000 (AEST)
Date: Tue, 12 May 2020 15:28:26 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: wenxiong@linux.vnet.ibm.com
Subject: Re: powerpc/pci: [PATCH 1/1]: PCIE PHB reset
Message-ID: <20200512052825.GA9115@osmium>
References: <1588857037-25950-1-git-send-email-wenxiong@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="azLHFNyN32YCQGCU"
Content-Disposition: inline
In-Reply-To: <1588857037-25950-1-git-send-email-wenxiong@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-12_01:2020-05-11,
 2020-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 bulkscore=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0
 impostorscore=0 phishscore=0 mlxlogscore=999 mlxscore=0 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005120040
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
Cc: brking@linux.vnet.ibm.com, oohall@gmail.com, linuxppc-dev@lists.ozlabs.org,
 wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--azLHFNyN32YCQGCU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 07, 2020 at 08:10:37AM -0500, wenxiong@linux.vnet.ibm.com wrote:
> From: Wen Xiong <wenxiong@linux.vnet.ibm.com>
>=20
> Several device drivers hit EEH(Extended Error handling) when triggering
> kdump on Pseries PowerVM. This patch implemented a reset of the PHBs
> in pci general code. PHB reset stop all PCI transactions from previous
> kernel. We have tested the patch in several enviroments:
> - direct slot adapters
> - adapters under the switch
> - a VF adapter in PowerVM
> - a VF adapter/adapter in KVM guest.
>=20
> Signed-off-by: Wen Xiong <wenxiong@linux.vnet.ibm.com>

Hi Wen Xiong,

I saw Oliver's review and I think he's covered the main issues I was
going to raise:
- This will run and produce some spurious errors on powernv. (I think
  distros do compile in both pseries and powernv.)
- There's a bit of code duplication but it's probably OK for this patch.

I have a few other minor comments, below:

> ---
>  arch/powerpc/platforms/pseries/pci.c | 153 +++++++++++++++++++++++++++
>  1 file changed, 153 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platform=
s/pseries/pci.c
> index 911534b89c85..aac7f00696d2 100644
> --- a/arch/powerpc/platforms/pseries/pci.c
> +++ b/arch/powerpc/platforms/pseries/pci.c
> @@ -11,6 +11,8 @@
>  #include <linux/kernel.h>
>  #include <linux/pci.h>
>  #include <linux/string.h>
> +#include <linux/crash_dump.h>
> +#include <linux/delay.h>
> =20
>  #include <asm/eeh.h>
>  #include <asm/pci-bridge.h>
> @@ -354,3 +356,154 @@ int pseries_root_bridge_prepare(struct pci_host_bri=
dge *bridge)
> =20
>  	return 0;
>  }
> +
> +/**
> + * pseries_get_pdn_addr - Retrieve PHB address
> + * @pe: EEH PE
> + *
> + * Retrieve the assocated PHB address. Actually, there're 2 RTAS
> + * function calls dedicated for the purpose. We need implement
> + * it through the new function and then the old one. Besides,
> + * you should make sure the config address is figured out from
> + * FDT node before calling the function.
> + *
> + */
> +static int pseries_get_pdn_addr(struct pci_controller *phb)
> +{
> +	int ret =3D -1;
> +	int rets[3];
> +	int ibm_get_config_addr_info;
> +	int ibm_get_config_addr_info2;
> +	int config_addr =3D 0;
> +	struct pci_dn *root_pdn, *pdn;
> +
> +	ibm_get_config_addr_info2   =3D rtas_token("ibm,get-config-addr-info2");
> +	ibm_get_config_addr_info    =3D rtas_token("ibm,get-config-addr-info");
> +
> +	root_pdn =3D PCI_DN(phb->dn);
> +	pdn =3D list_first_entry(&root_pdn->child_list, struct pci_dn, list);
> +	config_addr =3D (pdn->busno << 16) | (pdn->devfn << 8);
> +
> +	if (ibm_get_config_addr_info2 !=3D RTAS_UNKNOWN_SERVICE) {
> +		/*
> +		 * First of all, we need to make sure there has one PE
> +		 * associated with the device. Otherwise, PE address is
> +		 * meaningless.
> +		 */

This comment might be better if it explained how using option=3D0
with ibm_get_config_addr tests the PE.

> +		ret =3D rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
> +			config_addr, BUID_HI(pdn->phb->buid),
> +			BUID_LO(pdn->phb->buid), 1);
> +		if (ret || (rets[0] =3D=3D 0)) {
> +			pr_warn("%s: Failed to get address for PHB#%x-PE# "
> +				"option=3D%d config_addr=3D%x\n",
> +				__func__, pdn->phb->global_number, 1, rets[0]);
> +			return -1;
> +		}
> +
> +		/* Retrieve the associated PE config address */
> +		ret =3D rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
> +			config_addr, BUID_HI(pdn->phb->buid),
> +			BUID_LO(pdn->phb->buid), 0);
> +		if (ret) {
> +			pr_warn("%s: Failed to get address for PHB#%x-PE# "
> +				"option=3D%d config_addr=3D%x\n",
> +				__func__, pdn->phb->global_number, 0, rets[0]);
> +			return -1;
> +		}
> +		return rets[0];
> +	}
> +
> +	if (ibm_get_config_addr_info !=3D RTAS_UNKNOWN_SERVICE) {
> +		ret =3D rtas_call(ibm_get_config_addr_info, 4, 2, rets,
> +			config_addr, BUID_HI(pdn->phb->buid),
> +			BUID_LO(pdn->phb->buid), 0);
> +		if (ret || rets[0]) {
> +			pr_warn("%s: Failed to get address for PHB#%x-PE# "
> +				"config_addr=3D%x\n",
> +				__func__, pdn->phb->global_number, rets[0]);
> +			return -1;
> +		}
> +		return rets[0];
> +	}
> +
> +	return ret;
Can this ever return anything other than 0?

> +}
> +
> +static int __init pseries_phb_reset(void)
> +{
> +	struct pci_controller *phb;
> +	int config_addr;
> +	int ibm_set_slot_reset;
> +	int ibm_configure_pe;
> +	int ret;
> +
> +	if (is_kdump_kernel() || reset_devices) {
> +		pr_info("Issue PHB reset ...\n");
> +		ibm_set_slot_reset =3D rtas_token("ibm,set-slot-reset");
> +		ibm_configure_pe =3D rtas_token("ibm,configure-pe");
> +
> +		if (ibm_set_slot_reset =3D=3D RTAS_UNKNOWN_SERVICE ||
> +				ibm_configure_pe =3D=3D RTAS_UNKNOWN_SERVICE) {
> +			pr_info("%s: EEH functionality not supported\n",
> +				__func__);
> +		}
> +
> +		list_for_each_entry(phb, &hose_list, list_node) {
> +			config_addr =3D pseries_get_pdn_addr(phb);
> +			if (config_addr =3D=3D -1)
> +				continue;
> +
> +			ret =3D rtas_call(ibm_set_slot_reset, 4, 1, NULL,
> +				config_addr, BUID_HI(phb->buid),
> +				BUID_LO(phb->buid), EEH_RESET_FUNDAMENTAL);
> +
> +			/* If fundamental-reset not supported, try hot-reset */
> +			if (ret =3D=3D -8)
> +				ret =3D rtas_call(ibm_set_slot_reset, 4, 1, NULL,
> +					config_addr, BUID_HI(phb->buid),
> +					BUID_LO(phb->buid), EEH_RESET_HOT);
> +
> +			if (ret) {
> +				pr_err("%s: fail with rtas_call fundamental reset=3D%d\n",
> +					__func__, ret);

This error might be a bit confusing, since it's not clear if the result
came from the fundamental or hot-reset.

> +				continue;
> +			}
> +		}
> +		msleep(EEH_PE_RST_SETTLE_TIME);
> +
> +		list_for_each_entry(phb, &hose_list, list_node) {
> +			config_addr =3D pseries_get_pdn_addr(phb);
> +			if (config_addr =3D=3D -1)
> +				continue;
> +
> +			ret =3D rtas_call(ibm_set_slot_reset, 4, 1, NULL,
> +				config_addr, BUID_HI(phb->buid),
> +				BUID_LO(phb->buid), EEH_RESET_DEACTIVATE);
> +			if (ret) {
> +				pr_err("%s: fail with rtas_call deactive=3D%d\n",
> +					__func__, ret);
> +				continue;
> +			}
> +		}
> +		msleep(EEH_PE_RST_SETTLE_TIME);
> +
> +		list_for_each_entry(phb, &hose_list, list_node) {
> +			config_addr =3D pseries_get_pdn_addr(phb);
> +			if (config_addr =3D=3D -1)
> +				continue;
> +
> +			ret =3D rtas_call(ibm_configure_pe, 3, 1, NULL,
> +				config_addr, BUID_HI(phb->buid),
> +				BUID_LO(phb->buid));
> +			if (ret) {
> +				pr_err("%s: fail with rtas_call configure_pe =3D%d\n",
> +					__func__, ret);

These errors might be more useful if they indicated which PHB caused the
error.

> +				continue;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +postcore_initcall(pseries_phb_reset);
> +
> --=20
> 2.18.1
>=20

--azLHFNyN32YCQGCU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl66M/QACgkQMX8w6AQl
/iLi9wf/TBeD6OMQFXG6i/UTuRn5qJlN+4qsgSEjJpMi3jI1VNy+VnNenjoDqsxD
uBgVuEzrLIs+oG78FfiXAvF+2M0hg0ZoQTMJvvL+MHNgFXixv02e5YwOZiJMcDvW
mc0ADAhCHK9QijQLXNerAFSckOmqnlgYEfIIfZ4nYVEgmn8NJx8S2vMxQYaoD1Xz
hM/SqKeTSN/mh9urpGqLXo2vHZCcokA+iL3r+VSHdmnYfnnZnWQgTjbjpyY7UL4S
37zimz5cEU/3zX/cnmKcxJX27q7wicx4paB03THN0KBZCGxIIp+HC/jmwah/CdHX
L2mrjQLyG6h7W1X5HNRKgZEhQpWnMg==
=auu/
-----END PGP SIGNATURE-----

--azLHFNyN32YCQGCU--

