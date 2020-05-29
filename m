Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C12361E7303
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 05:18:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49Y8sv6D4dzDqcP
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 May 2020 13:18:43 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Y8rH5YBSzDqZD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 May 2020 13:17:19 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 04T32m6o179411
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 23:17:15 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31as1bj16c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 23:17:15 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04T3CkMB027174
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 May 2020 23:17:14 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31as1bj15m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 28 May 2020 23:17:14 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 04T3Fp6Y022996;
 Fri, 29 May 2020 03:17:12 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 316uf8mhtt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 29 May 2020 03:17:12 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 04T3H99Y45154444
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 29 May 2020 03:17:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1D744C050;
 Fri, 29 May 2020 03:17:09 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2DA174C052;
 Fri, 29 May 2020 03:17:09 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 29 May 2020 03:17:09 +0000 (GMT)
Received: from osmium (unknown [9.206.205.176])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CC9C7A03B1;
 Fri, 29 May 2020 13:17:07 +1000 (AEST)
Date: Fri, 29 May 2020 13:17:06 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: wenxiong@linux.vnet.ibm.com
Subject: Re: powerpc/pci: [PATCH 1/1 V3] PCIE PHB reset
Message-ID: <20200529030644.GA4254@osmium>
References: <1590499319-6472-1-git-send-email-wenxiong@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="d6Gm4EdcadzBjdND"
Content-Disposition: inline
In-Reply-To: <1590499319-6472-1-git-send-email-wenxiong@linux.vnet.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-05-28_08:2020-05-28,
 2020-05-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 mlxscore=0 impostorscore=0 spamscore=0 suspectscore=1
 bulkscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 cotscore=-2147483648 lowpriorityscore=0 clxscore=1015 classifier=spam
 adjust=0 reason=mlx scancount=1 engine=8.12.0-2004280000
 definitions=main-2005290017
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


--d6Gm4EdcadzBjdND
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2020 at 08:21:59AM -0500, wenxiong@linux.vnet.ibm.com wrote:
> From: Wen Xiong <wenxiong@linux.vnet.ibm.com>
>=20
> Several device drivers hit EEH(Extended Error handling) when triggering
> kdump on Pseries PowerVM. This patch implemented a reset of the PHBs
> in pci general code when triggering kdump. PHB reset stop all PCI
> transactions from normal kernel. We have tested the patch in several
> enviroments:
> - direct slot adapters
> - adapters under the switch
> - a VF adapter in PowerVM
> - a VF adapter/adapter in KVM guest.
>=20
> Signed-off-by: Wen Xiong <wenxiong@linux.vnet.ibm.com>

Looks good to me.
Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

(It would be easier to review if you included a patchset change log and
CC'd people who reviewed earlier versions.)

Cheers,
Sam.

>=20
> ---
>  arch/powerpc/platforms/pseries/pci.c | 152 +++++++++++++++++++++++++++
>  1 file changed, 152 insertions(+)
>=20
> diff --git a/arch/powerpc/platforms/pseries/pci.c b/arch/powerpc/platform=
s/pseries/pci.c
> index 911534b89c85..cb7e4276cf04 100644
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
> @@ -354,3 +356,153 @@ int pseries_root_bridge_prepare(struct pci_host_bri=
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
> +		 * associated with the device. If option is 1, it
> +		 * queries if config address is supported in a PE or not.
> +		 * If option is 0, it returns PE config address or config
> +		 * address for the PE primary bus.
> +		 */
> +		ret =3D rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
> +			config_addr, BUID_HI(pdn->phb->buid),
> +			BUID_LO(pdn->phb->buid), 1);
> +		if (ret || (rets[0] =3D=3D 0)) {
> +			pr_warn("%s: Failed to get address for PHB#%x-PE# option=3D%d config_=
addr=3D%x\n",
> +				__func__, pdn->phb->global_number, 1, rets[0]);
> +			return -1;
> +		}
> +
> +		/* Retrieve the associated PE config address */
> +		ret =3D rtas_call(ibm_get_config_addr_info2, 4, 2, rets,
> +			config_addr, BUID_HI(pdn->phb->buid),
> +			BUID_LO(pdn->phb->buid), 0);
> +		if (ret) {
> +			pr_warn("%s: Failed to get address for PHB#%x-PE# option=3D%d config_=
addr=3D%x\n",
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
> +			pr_warn("%s: Failed to get address for PHB#%x-PE# config_addr=3D%x\n",
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
> +				pr_err("%s: PHB#%x-PE# failed with rtas_call activate reset=3D%d\n",
> +					__func__, phb->global_number, ret);
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
> +				pr_err("%s: PHB#%x-PE# failed with rtas_call deactive reset=3D%d\n",
> +					__func__, phb->global_number, ret);
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
> +				pr_err("%s: PHB#%x-PE# failed with rtas_call configure_pe =3D%d\n",
> +					__func__, phb->global_number, ret);
> +				continue;
> +			}
> +		}
> +	}
> +
> +	return 0;
> +}
> +machine_postcore_initcall(pseries, pseries_phb_reset);
> +
> --=20
> 2.18.1
>=20

--d6Gm4EdcadzBjdND
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl7QfrAACgkQMX8w6AQl
/iJdqgf/ZlK7V1Mf1gHkmQqBto6bIzvxWLnx8XSpR7FvFWg6mb0W+/21iQ3L6841
64REvzfTFDtexzoOV0q+/u/FA1h1QQgcWcwDwl5wXe/yiv7YoUayfDpb68pFRIMo
qdp6ZUSoPlqa8/UwCdW1VHEBqOivwG/97saq5cdTnXLVT2h95XDsKUQelHI00MY+
xEjvfPEMNoooysZCqDZnHXeBRlag/eIH0kfBI5HsQviwPIKsgmnrIoJNleIbraCb
AuwXZKTKr1Iip3D2TUUUGoGYeQ/r+GeXDjynjzCwDlrTk5LvG9xjy5QrU/M2AERU
SvTQD4q4wFt9oRoAU4L5R3utYhMYsQ==
=NR1f
-----END PGP SIGNATURE-----

--d6Gm4EdcadzBjdND--

