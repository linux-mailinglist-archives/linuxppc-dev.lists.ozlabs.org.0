Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A331FB45F6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 05:21:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XT0t0tjrzF3xS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 13:21:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=sbobroff@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XSyc4KDHzF3Kc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 13:19:35 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H3GeHW169607
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 23:19:33 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v0u13s7ue-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 23:19:32 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 17 Sep 2019 04:19:30 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 04:19:28 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8H3JRVK51773682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 03:19:27 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A285FA4054;
 Tue, 17 Sep 2019 03:19:27 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D3FCA405C;
 Tue, 17 Sep 2019 03:19:27 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 03:19:27 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (unknown [9.81.192.242])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8FDEFA019A;
 Tue, 17 Sep 2019 13:19:25 +1000 (AEST)
Date: Tue, 17 Sep 2019 13:19:24 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 13/14] powerpc/eeh: Add a eeh_dev_break debugfs interface
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-14-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="JsihDCElWRmQcbOr"
Content-Disposition: inline
In-Reply-To: <20190903101605.2890-14-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19091703-0016-0000-0000-000002ACEFA0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091703-0017-0000-0000-0000330D908A
Message-Id: <20190917031923.GJ21303@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170036
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


--JsihDCElWRmQcbOr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 08:16:04PM +1000, Oliver O'Halloran wrote:
> Add an interface to debugfs for generating an EEH event on a given device.
> This works by disabling memory accesses to and from the device by setting
> the PCI_COMMAND register (or the VF Memory Space Enable on the parent PF).
>=20
> This is a somewhat portable alternative to using the platform specific
> error injection mechanisms since those tend to be either hard to use, or
> straight up broken. For pseries the interfaces also requires the use of
> /dev/mem which is probably going to go away in a post-LOCKDOWN world
> (and it's a horrific hack to begin with) so moving to a kernel-provided
> interface makes sense and provides a sane, cross-platform interface for
> userspace so we can write more generic testing scripts.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Looks good to me. Tested with the previous patch.

Tested-by: Sam Bobroff <sbobroff@linux.ibm.com>
Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>

> ---
>  arch/powerpc/kernel/eeh.c | 139 +++++++++++++++++++++++++++++++++++++-
>  1 file changed, 138 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index ace1c5a6b8ed..a55d2f01da1d 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1894,7 +1894,8 @@ static ssize_t eeh_dev_check_write(struct file *fil=
p,
>  	char buf[20];
>  	int ret;
> =20
> -	ret =3D simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
> +	memset(buf, 0, sizeof(buf));
> +	ret =3D simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, coun=
t);
>  	if (!ret)
>  		return -EFAULT;
> =20
> @@ -1931,6 +1932,139 @@ static const struct file_operations eeh_dev_check=
_fops =3D {
>  	.read   =3D eeh_debugfs_dev_usage,
>  };
> =20
> +static int eeh_debugfs_break_device(struct pci_dev *pdev)
> +{
> +	struct resource *bar =3D NULL;
> +	void __iomem *mapped;
> +	u16 old, bit;
> +	int i, pos;
> +
> +	/* Do we have an MMIO BAR to disable? */
> +	for (i =3D 0; i <=3D PCI_STD_RESOURCE_END; i++) {
> +		struct resource *r =3D &pdev->resource[i];
> +
> +		if (!r->flags || !r->start)
> +			continue;
> +		if (r->flags & IORESOURCE_IO)
> +			continue;
> +		if (r->flags & IORESOURCE_UNSET)
> +			continue;
> +
> +		bar =3D r;
> +		break;
> +	}
> +
> +	if (!bar) {
> +		pci_err(pdev, "Unable to find Memory BAR to cause EEH with\n");
> +		return -ENXIO;
> +	}
> +
> +	pci_err(pdev, "Going to break: %pR\n", bar);
> +
> +	if (pdev->is_virtfn) {
> +#ifndef CONFIG_IOV
> +		return -ENXIO;
> +#else
> +		/*
> +		 * VFs don't have a per-function COMMAND register, so the best
> +		 * we can do is clear the Memory Space Enable bit in the PF's
> +		 * SRIOV control reg.
> +		 *
> +		 * Unfortunately, this requires that we have a PF (i.e doesn't
> +		 * work for a passed-through VF) and it has the potential side
> +		 * effect of also causing an EEH on every other VF under the
> +		 * PF. Oh well.
> +		 */
> +		pdev =3D pdev->physfn;
> +		if (!pdev)
> +			return -ENXIO; /* passed through VFs have no PF */
> +
> +		pos  =3D pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_SRIOV);
> +		pos +=3D PCI_SRIOV_CTRL;
> +		bit  =3D PCI_SRIOV_CTRL_MSE;
> +#endif /* !CONFIG_IOV */
> +	} else {
> +		bit =3D PCI_COMMAND_MEMORY;
> +		pos =3D PCI_COMMAND;
> +	}
> +
> +	/*
> +	 * Process here is:
> +	 *
> +	 * 1. Disable Memory space.
> +	 *
> +	 * 2. Perform an MMIO to the device. This should result in an error
> +	 *    (CA  / UR) being raised by the device which results in an EEH
> +	 *    PE freeze. Using the in_8() accessor skips the eeh detection hook
> +	 *    so the freeze hook so the EEH Detection machinery won't be
> +	 *    triggered here. This is to match the usual behaviour of EEH
> +	 *    where the HW will asyncronously freeze a PE and it's up to
> +	 *    the kernel to notice and deal with it.
> +	 *
> +	 * 3. Turn Memory space back on. This is more important for VFs
> +	 *    since recovery will probably fail if we don't. For normal
> +	 *    the COMMAND register is reset as a part of re-initialising
> +	 *    the device.
> +	 *
> +	 * Breaking stuff is the point so who cares if it's racy ;)
> +	 */
> +	pci_read_config_word(pdev, pos, &old);
> +
> +	mapped =3D ioremap(bar->start, PAGE_SIZE);
> +	if (!mapped) {
> +		pci_err(pdev, "Unable to map MMIO BAR %pR\n", bar);
> +		return -ENXIO;
> +	}
> +
> +	pci_write_config_word(pdev, pos, old & ~bit);
> +	in_8(mapped);
> +	pci_write_config_word(pdev, pos, old);
> +
> +	iounmap(mapped);
> +
> +	return 0;
> +}
> +
> +static ssize_t eeh_dev_break_write(struct file *filp,
> +				const char __user *user_buf,
> +				size_t count, loff_t *ppos)
> +{
> +	uint32_t domain, bus, dev, fn;
> +	struct pci_dev *pdev;
> +	char buf[20];
> +	int ret;
> +
> +	memset(buf, 0, sizeof(buf));
> +	ret =3D simple_write_to_buffer(buf, sizeof(buf)-1, ppos, user_buf, coun=
t);
> +	if (!ret)
> +		return -EFAULT;
> +
> +	ret =3D sscanf(buf, "%x:%x:%x.%x", &domain, &bus, &dev, &fn);
> +	if (ret !=3D 4) {
> +		pr_err("%s: expected 4 args, got %d\n", __func__, ret);
> +		return -EINVAL;
> +	}
> +
> +	pdev =3D pci_get_domain_bus_and_slot(domain, bus, (dev << 3) | fn);
> +	if (!pdev)
> +		return -ENODEV;
> +
> +	ret =3D eeh_debugfs_break_device(pdev);
> +	pci_dev_put(pdev);
> +
> +	if (ret < 0)
> +		return ret;
> +
> +	return count;
> +}
> +
> +static const struct file_operations eeh_dev_break_fops =3D {
> +	.open	=3D simple_open,
> +	.llseek	=3D no_llseek,
> +	.write	=3D eeh_dev_break_write,
> +	.read   =3D eeh_debugfs_dev_usage,
> +};
> +
>  #endif
> =20
>  static int __init eeh_init_proc(void)
> @@ -1949,6 +2083,9 @@ static int __init eeh_init_proc(void)
>  		debugfs_create_file_unsafe("eeh_dev_check", 0600,
>  				powerpc_debugfs_root, NULL,
>  				&eeh_dev_check_fops);
> +		debugfs_create_file_unsafe("eeh_dev_break", 0600,
> +				powerpc_debugfs_root, NULL,
> +				&eeh_dev_break_fops);
>  		debugfs_create_file_unsafe("eeh_force_recover", 0600,
>  				powerpc_debugfs_root, NULL,
>  				&eeh_force_recover_fops);
> --=20
> 2.21.0
>=20

--JsihDCElWRmQcbOr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl2AULsACgkQMX8w6AQl
/iJnvAf8Cb5Y82jGnhkMsnp4OQ4z3EMyw+eql7OQuLAi5hoRXNVoHn6NTQuZg5J6
TmjGn1v5WyezXcSrjVpiuw1r4cEu9l9cLv6EryD+6Q/Fuju82FsZs3YKRZUpErPL
Z+EiDJEYImBFDpMa41munX0BdAqr4OssRBghL5RQnHfu9MxPhegveP8x0lNT3dFt
S3hw9X/fAPJk/LppqrNouSn9og2ftMTEjzQAirSWP2YMt3iy/L5WTpDows/LKbkZ
K7DnHFrd6jLhWmB0mOfPDLpFrFXJeV2B40FRU1kWxpOqE9oKNAtPTmmZZvQHA2dN
Sj+obVeQlRgedHKLbz4tu2YTmNN2eg==
=lRy6
-----END PGP SIGNATURE-----

--JsihDCElWRmQcbOr--

