Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A226EB450A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 03:02:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XPwr11bVzF3gP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 11:02:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XPtk14KHzF3dF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 11:01:01 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H0ux9H102595
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:00:58 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v2h81qb2s-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:00:58 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 17 Sep 2019 02:00:56 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 02:00:54 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8H10rJ634603136
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 01:00:53 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84BA6A4067;
 Tue, 17 Sep 2019 01:00:53 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3646A4062;
 Tue, 17 Sep 2019 01:00:52 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 01:00:52 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (unknown [9.81.192.242])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3BF81A019A;
 Tue, 17 Sep 2019 11:00:50 +1000 (AEST)
Date: Tue, 17 Sep 2019 11:00:48 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 04/14] powerpc/eeh: Check slot presence state in
 eeh_handle_normal_event()
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-5-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Q0rSlbzrZN6k9QnT"
Content-Disposition: inline
In-Reply-To: <20190903101605.2890-5-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19091701-0016-0000-0000-000002ACDE70
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091701-0017-0000-0000-0000330D7F00
Message-Id: <20190917010048.GD21303@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170009
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


--Q0rSlbzrZN6k9QnT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 08:15:55PM +1000, Oliver O'Halloran wrote:
> When a device is surprise removed while undergoing IO we will probably
> get an EEH PE freeze due to MMIO timeouts and other errors. When a freeze
> is detected we send a recovery event to the EEH worker thread which will
> notify drivers, and perform recovery as needed.
>=20
> In the event of a hot-remove we don't want recovery to occur since there
> isn't a device to recover. The recovery process is fairly long due to
> the number of wait states (required by PCIe) which causes problems when
> devices are removed and replaced (e.g. hot swapping of U.2 NVMe drives).
>=20
> To determine if we need to skip the recovery process we can use the
> get_adapter_state() operation of the hotplug_slot to determine if the
> slot contains a device or not, and if the slot is empty we can skip
> recovery entirely.
>=20
> One thing to note is that the slot being EEH frozen does not prevent the
> hotplug driver from working. We don't have the EEH recovery thread
> remove any of the devices since it's assumed that the hotplug driver
> will handle tearing down the slot state.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Looks good, but some comments, below.

> ---
>  arch/powerpc/kernel/eeh_driver.c | 60 ++++++++++++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_d=
river.c
> index 18a69fac4d80..52ce7584af43 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -27,6 +27,7 @@
>  #include <linux/irq.h>
>  #include <linux/module.h>
>  #include <linux/pci.h>
> +#include <linux/pci_hotplug.h>
>  #include <asm/eeh.h>
>  #include <asm/eeh_event.h>
>  #include <asm/ppc-pci.h>
> @@ -769,6 +770,46 @@ static void eeh_pe_cleanup(struct eeh_pe *pe)
>  	}
>  }
> =20
> +/**
> + * eeh_check_slot_presence - Check if a device is still present in a slot
> + * @pdev: pci_dev to check
> + *
> + * This function may return a false positive if we can't determine the s=
lot's
> + * presence state. This might happen for for PCIe slots if the PE contai=
ning
> + * the upstream bridge is also frozen, or the bridge is part of the same=
 PE
> + * as the device.
> + *
> + * This shouldn't happen often, but you might see it if you hotplug a PC=
Ie
> + * switch.
> + */

I don't think the function name is very good; it does check the slot but
it doesn't tell you what a true result means -- but I don't see an
obviously great alternative either. If it can return false positives, it's
really testing for empty so maybe 'eeh_slot_definitely_empty()' or
'eeh_slot_maybe_populated()'?

> +static bool eeh_slot_presence_check(struct pci_dev *pdev)
> +{
> +	const struct hotplug_slot_ops *ops;
> +	struct pci_slot *slot;
> +	u8 state;
> +	int rc;
> +
> +	if (!pdev)
> +		return false;
> +
> +	if (pdev->error_state =3D=3D pci_channel_io_perm_failure)
> +		return false;
> +
> +	slot =3D pdev->slot;
> +	if (!slot || !slot->hotplug)
> +		return true;
> +
> +	ops =3D slot->hotplug->ops;
> +	if (!ops || !ops->get_adapter_status)
> +		return true;
> +
> +	rc =3D ops->get_adapter_status(slot->hotplug, &state);
> +	if (rc)
> +		return true;
> +
> +	return !!state;
> +}
> +
>  /**
>   * eeh_handle_normal_event - Handle EEH events on a specific PE
>   * @pe: EEH PE - which should not be used after we return, as it may
> @@ -799,6 +840,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>  	enum pci_ers_result result =3D PCI_ERS_RESULT_NONE;
>  	struct eeh_rmv_data rmv_data =3D
>  		{LIST_HEAD_INIT(rmv_data.removed_vf_list), 0};
> +	int devices =3D 0;
> =20
>  	bus =3D eeh_pe_bus_get(pe);
>  	if (!bus) {
> @@ -807,6 +849,23 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>  		return;
>  	}
> =20
> +	/*
> +	 * When devices are hot-removed we might get an EEH due to
> +	 * a driver attempting to touch the MMIO space of a removed
> +	 * device. In this case we don't have a device to recover
> +	 * so suppress the event if we can't find any present devices.
> +	 *
> +	 * The hotplug driver should take care of tearing down the
> +	 * device itself.
> +	 */
> +	eeh_for_each_pe(pe, tmp_pe)
> +		eeh_pe_for_each_dev(tmp_pe, edev, tmp)
> +			if (eeh_slot_presence_check(edev->pdev))
> +				devices++;

In other parts of the EEH code we do a get_device() on edev->pdev before
passing it around, it might be good to do that here too.

> +
> +	if (!devices)
> +		goto out; /* nothing to recover */

Does this handle an empty, but frozen, PHB correctly? (Can that happen?)

> +
>  	eeh_pe_update_time_stamp(pe);
>  	pe->freeze_count++;
>  	if (pe->freeze_count > eeh_max_freezes) {
> @@ -997,6 +1056,7 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>  		}
>  	}
> =20
> +out:
>  	/*
>  	 * Clean up any PEs without devices. While marked as EEH_PE_RECOVERYING
>  	 * we don't want to modify the PE tree structure so we do it here.
> --=20
> 2.21.0
>=20

--Q0rSlbzrZN6k9QnT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl2AMD8ACgkQMX8w6AQl
/iL65Qf+MB2BDlgIh/39nZX2sVx03fbFrL76LrwuP8WUHwY+xLBYTYkqRw5tpc2u
xe70vYh4olk7TNJjvAY0GJKkdCVnlhCcnPlBCcP2eZyVkiBop+1SLg14c9IjCnwU
LflPGKkAa/+U1FHkhm9DOaTe/d4gMaEHY0cuZYVOtqet5WTOhk8/Ns1y9gc82yvn
0c39RIesc5QFAn/k6j6/SygChkvXtRs2HXvQ2t76iHYqhG/zUcCgNqL6jKyl+TX1
R9PAwqACK6xH1NBAX2l0d7IvdapymMRVPPCiHPspq4aGXblOLhPD0dYmp5Kk8L4B
ip36H2dHjkA5kczj0ja8mkJ/BZQYyQ==
=LMK4
-----END PGP SIGNATURE-----

--Q0rSlbzrZN6k9QnT--

