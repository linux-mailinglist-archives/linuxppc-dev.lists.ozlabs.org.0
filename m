Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F2D1D09E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 09:25:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49MR662TfMzDqs2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 May 2020 17:25:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sbobroff@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49MR4020yszDqWc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 17:23:42 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04D73Nrx008441
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 03:23:39 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3101ma0nat-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 03:23:39 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04D74Gwk012358
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 May 2020 03:23:39 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3101ma0n7v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 03:23:38 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 04D7KPgh004621;
 Wed, 13 May 2020 07:23:33 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 3100ub9298-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 13 May 2020 07:23:33 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04D7NVd938994066
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 May 2020 07:23:31 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 378795204F;
 Wed, 13 May 2020 07:23:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 8FE3952051;
 Wed, 13 May 2020 07:23:30 +0000 (GMT)
Received: from osmium (unknown [9.206.141.95])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 68F1AA01BF;
 Wed, 13 May 2020 17:23:24 +1000 (AEST)
Date: Wed, 13 May 2020 17:23:27 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: wenxiong@linux.vnet.ibm.com
Subject: Re: powerpc/pci: [PATCH 1/1]: PCIE PHB reset
Message-ID: <20200513072326.GB9115@osmium>
References: <1588857037-25950-1-git-send-email-wenxiong@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="QTprm0S8XgL7H0Dt"
Content-Disposition: inline
In-Reply-To: <1588857037-25950-1-git-send-email-wenxiong@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.676
 definitions=2020-05-13_02:2020-05-11,
 2020-05-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 cotscore=-2147483648 clxscore=1015 malwarescore=0 impostorscore=0
 suspectscore=1 lowpriorityscore=0 priorityscore=1501 mlxlogscore=999
 spamscore=0 phishscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2005130060
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


--QTprm0S8XgL7H0Dt
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

One other thing:

I tested the patch and this line is logged for each emulated PHB:

[    3.337057] pseries_get_pdn_addr: Failed to get address for PHB#0-PE# op=
tion=3D1 config_addr=3D0

And it's not really an error -- QEMU's emulated PHBs don't have EEH
support.

It's not a big deal, because there are other similar messages already
present but it would probably be better if this were suppressed for the
case where there's no support.

Cheers,
Sam.

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

--QTprm0S8XgL7H0Dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl67oGgACgkQMX8w6AQl
/iKy9Qf7BWGd6V05hZSPFvJKHzPNcR+FxNC+YjLFfT31UkxvbuaCvT4P+QmoJWPG
O1QmyASti/gPyCTJBsGDE9GrPLhZGQGssyBJK+GSsbQXqU0C95M6/lrXwBvEKioE
xU86QyzG3BFDrH4v444EDESrM0AzjbnjgbsZGqLdWHx2elb3Jit26rI2j77DG6tk
kaaeIdaXneYIIyB1ZcsjMvWF24EwcYmvnwb74zFa3vnX03rzI2HbcTA0SohDoJgH
7HE2gogq9izbXMLnX9UQ5zO86/lthVQzSamD+lZSn0Vm1hH14/qLxHpd2EnWqwkU
lKGr5sFqRLIHI26OxBIYa6Ga/NgNyw==
=XxIC
-----END PGP SIGNATURE-----

--QTprm0S8XgL7H0Dt--

