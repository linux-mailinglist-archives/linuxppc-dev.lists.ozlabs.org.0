Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C771B4536
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 03:25:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XQQq3MRZzF38w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 11:25:23 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XQNs4LQ3zDrWR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 11:23:40 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H1M52L043566
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:23:38 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v2hkbf0hb-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 21:23:38 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 17 Sep 2019 02:23:36 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 02:23:33 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8H1NX4A29950182
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 01:23:33 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1A9311C04C;
 Tue, 17 Sep 2019 01:23:32 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4C2C811C054;
 Tue, 17 Sep 2019 01:23:32 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 01:23:32 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (unknown [9.81.192.242])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 26E67A019A;
 Tue, 17 Sep 2019 11:23:29 +1000 (AEST)
Date: Tue, 17 Sep 2019 11:23:27 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 11/14] powerpc/eeh: Set attention indicator while
 recovering
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-12-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="EemXnrF2ob+xzFeB"
Content-Disposition: inline
In-Reply-To: <20190903101605.2890-12-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19091701-4275-0000-0000-000003675814
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091701-4276-0000-0000-00003879BB99
Message-Id: <20190917012326.GH21303@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-16_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170014
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


--EemXnrF2ob+xzFeB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 08:16:02PM +1000, Oliver O'Halloran wrote:
> I am the RAS team. Hear me roar.
>=20
> Roar.
>=20
> On a more serious note, being able to locate failed devices can be helpfu=
l.
> Set the attention indicator if the slot supports it once we've determined
> the device is present and only clear it if the device is fully recovered.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Looks good, although I think it would be clearer if you could separate
checking the slot from raising the alert.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

> ---
>  arch/powerpc/kernel/eeh_driver.c | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/eeh_driver.c b/arch/powerpc/kernel/eeh_d=
river.c
> index 0d34cc12c529..80bd157fcb45 100644
> --- a/arch/powerpc/kernel/eeh_driver.c
> +++ b/arch/powerpc/kernel/eeh_driver.c
> @@ -803,6 +803,10 @@ static bool eeh_slot_presence_check(struct pci_dev *=
pdev)
>  	if (!ops || !ops->get_adapter_status)
>  		return true;
> =20
> +	/* set the attention indicator while we've got the slot ops */
> +	if (ops->set_attention_status)
> +		ops->set_attention_status(slot->hotplug, 1);
> +
>  	rc =3D ops->get_adapter_status(slot->hotplug, &state);
>  	if (rc)
>  		return true;
> @@ -810,6 +814,28 @@ static bool eeh_slot_presence_check(struct pci_dev *=
pdev)
>  	return !!state;
>  }
> =20
> +static void eeh_clear_slot_attention(struct pci_dev *pdev)
> +{
> +	const struct hotplug_slot_ops *ops;
> +	struct pci_slot *slot;
> +
> +	if (!pdev)
> +		return;
> +
> +	if (pdev->error_state =3D=3D pci_channel_io_perm_failure)
> +		return;
> +
> +	slot =3D pdev->slot;
> +	if (!slot || !slot->hotplug)
> +		return;
> +
> +	ops =3D slot->hotplug->ops;
> +	if (!ops || !ops->set_attention_status)
> +		return;
> +
> +	ops->set_attention_status(slot->hotplug, 0);
> +}
> +
>  /**
>   * eeh_handle_normal_event - Handle EEH events on a specific PE
>   * @pe: EEH PE - which should not be used after we return, as it may
> @@ -1098,6 +1124,12 @@ void eeh_handle_normal_event(struct eeh_pe *pe)
>  	 * we don't want to modify the PE tree structure so we do it here.
>  	 */
>  	eeh_pe_cleanup(pe);
> +
> +	/* clear the slot attention LED for all recovered devices */
> +	eeh_for_each_pe(pe, tmp_pe)
> +		eeh_pe_for_each_dev(tmp_pe, edev, tmp)
> +			eeh_clear_slot_attention(edev->pdev);
> +
>  	eeh_pe_state_clear(pe, EEH_PE_RECOVERING, true);
>  }
> =20
> --=20
> 2.21.0
>=20

--EemXnrF2ob+xzFeB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl2ANY4ACgkQMX8w6AQl
/iICjAf+Ijft9QHrkD6WgIkTF71hzHG6QZ2Iy8owa5GnvQ7MG+hKcevWQNiHRkSC
oXtLFkrCm6kid7MH1W0aXM933Z7yzAXSqEdeve8NCwGJ1U+KY5UTaWf7aEjb4RjP
Q6lIohzSuPPx9Uw3uJSB6H9QtujAKyCpO23edFko58+j73fVrm+GwEOECCRx7fbU
mAb3NWs02HgqxZbhOQ4Bf9cEXbtPii0EaB7AnPqnV9ir0J4589Bb3TGyW8zJcWMJ
eSBi/4VG6PL7Nb3g0OEAEDd5NsjuG2wVbI5zYe0dDGY/YZ1rnHxYOwUliF0ydIU/
G2y4WckG0ZFb5MlEZygxx+XjFbiOoQ==
=qGWA
-----END PGP SIGNATURE-----

--EemXnrF2ob+xzFeB--

