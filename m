Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CA99B98AF0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 07:52:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46DYZc3v8SzDrHg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Aug 2019 15:52:08 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46DYWq2bDvzDqnv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 15:49:42 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7M5lDpZ073137
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 01:49:40 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uhn198cu7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Aug 2019 01:49:39 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Thu, 22 Aug 2019 06:49:38 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 22 Aug 2019 06:49:35 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7M5nYb949676448
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Aug 2019 05:49:34 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E0F44C046;
 Thu, 22 Aug 2019 05:49:34 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D18334C044;
 Thu, 22 Aug 2019 05:49:33 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Aug 2019 05:49:33 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5CE1DA021A;
 Thu, 22 Aug 2019 15:49:32 +1000 (AEST)
Date: Thu, 22 Aug 2019 15:49:31 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 1/3] powerpc/sriov: Remove VF eeh_dev state when
 disabling SR-IOV
References: <20190821062655.19735-1-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ikeVEW9yuYc//A+q"
Content-Disposition: inline
In-Reply-To: <20190821062655.19735-1-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19082205-0016-0000-0000-000002A1592E
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082205-0017-0000-0000-00003301902C
Message-Id: <20190822054930.GA25172@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-22_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908220061
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


--ikeVEW9yuYc//A+q
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 21, 2019 at 04:26:53PM +1000, Oliver O'Halloran wrote:
> When disabling virtual functions on an SR-IOV adapter we currently do not
> correctly remove the EEH state for the now-dead virtual functions. When
> removing the pci_dn that was created for the VF when SR-IOV was enabled
> we free the corresponding eeh_dev without removing it from the child devi=
ce
> list of the eeh_pe that contained it. This can result in crashes due to t=
he
> use-after-free.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---
> No Fixes: here since I'm not sure if the commit that added this actually
> introduced the bug. EEH is amazing.

Yep.

> I suspect backporting this would cause more problems than it solves since
> reliably replicating the crash required enabling memory poisoning and
> hacking a device driver to remove the PCI error handling callbacks so
> the EEH fallback path (which removes and re-probes PCI devices)
> would be used.

I gave this a quick test with some added instrumentation, and I can see
that the new code is used during VF removal and it doesn't cause any new
problems. I agree that even if it's difficult to trigger, it was
definitely a bug.

Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
Tested-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
>  arch/powerpc/kernel/pci_dn.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
> index 6556b57..795c4e3 100644
> --- a/arch/powerpc/kernel/pci_dn.c
> +++ b/arch/powerpc/kernel/pci_dn.c
> @@ -244,9 +244,22 @@ void remove_dev_pci_data(struct pci_dev *pdev)
>  				continue;
> =20
>  #ifdef CONFIG_EEH
> -			/* Release EEH device for the VF */
> +			/*
> +			 * Release EEH state for this VF. The PCI core
> +			 * has already torn down the pci_dev for this VF, but
> +			 * we're responsible to removing the eeh_dev since it
> +			 * has the same lifetime as the pci_dn that spawned it.
> +			 */
>  			edev =3D pdn_to_eeh_dev(pdn);
>  			if (edev) {
> +				/*
> +				 * We allocate pci_dn's for the totalvfs count,
> +				 * but only only the vfs that were activated
> +				 * have a configured PE.
> +				 */
> +				if (edev->pe)
> +					eeh_rmv_from_parent_pe(edev);
> +
>  				pdn->edev =3D NULL;
>  				kfree(edev);
>  			}
> --=20
> 2.9.5
>=20

--ikeVEW9yuYc//A+q
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl1eLOUACgkQMX8w6AQl
/iLrqwf9Fwk6UDEOhHp6YtwjP5tlsimnNk7HqdYMDhVI7JYPMebooLEQWh2uUg0Z
cUhdXv9Ixp2WkQKWYMRKnoBxUBhzIM8TqU0FWNsba+k4kBeWbBPvXES52/hwU2Ae
p5H114DNGmZWyPjxBKvtapVcNDTdre4F2nZg02W1ZRtYx5TD319mRcggMyJi3f0Q
hvNS85XISefil12apIbiMTh1tfofC+a32IN5koHjrEGrFm+1THdeoVdJFxw+7S9o
dAM1gbGoc1q2pA+51NIYSr+q2xX6Yt1JRwn1z4o3I/O9W6q6JNzNiprLGgfVxtN2
3dD3z2ToTICv/mIX4b1FXp2+T0jbrw==
=Tbi/
-----END PGP SIGNATURE-----

--ikeVEW9yuYc//A+q--

