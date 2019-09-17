Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CD291B45F1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 05:18:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46XSwr30MszDqBc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 13:18:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XSth3GDRzF3qp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Sep 2019 13:16:11 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8H3CRY8006827
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 23:16:08 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2v2k7u6px1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Sep 2019 23:16:08 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 17 Sep 2019 04:16:06 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 17 Sep 2019 04:16:04 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8H3G3Ud52625462
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 03:16:03 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3194D4C050;
 Tue, 17 Sep 2019 03:16:03 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F8044C040;
 Tue, 17 Sep 2019 03:16:02 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 03:16:02 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (unknown [9.81.192.242])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CC45FA019A;
 Tue, 17 Sep 2019 13:16:00 +1000 (AEST)
Date: Tue, 17 Sep 2019 13:15:59 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 12/14] powerpc/eeh: Add debugfs interface to run an EEH
 check
References: <20190903101605.2890-1-oohall@gmail.com>
 <20190903101605.2890-13-oohall@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="v2/QI0iRXglpx0hK"
Content-Disposition: inline
In-Reply-To: <20190903101605.2890-13-oohall@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19091703-0020-0000-0000-0000036DEE36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091703-0021-0000-0000-000021C39003
Message-Id: <20190917031558.GI21303@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170035
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


--v2/QI0iRXglpx0hK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 03, 2019 at 08:16:03PM +1000, Oliver O'Halloran wrote:
> Detecting an frozen EEH PE usually occurs when an MMIO load returns a 0xF=
Fs
> response. When performing EEH testing using the EEH error injection featu=
re
> available on some platforms there is no simple way to kick-off the kernel=
's
> recovery process since any accesses from userspace (usually /dev/mem) will
> bypass the MMIO helpers in the kernel which check if a 0xFF response is d=
ue
> to an EEH freeze or not.
>=20
> If a device contains a 0xFF byte in it's config space it's possible to
> trigger the recovery process via config space read from userspace, but th=
is
> is not a reliable method. If a driver is bound to the device an in use it
> will frequently trigger the MMIO check, but this is also inconsistent.
>=20
> To solve these problems this patch adds a debugfs file called
> "eeh_dev_check" which accepts a <domain>:<bus>:<dev>.<fn> string and runs
> eeh_dev_check_failure() on it. This is the same check that's done when the
> kernel gets a 0xFF result from an config or MMIO read with the added
> benifit that it can be reliably triggered from userspace.
>=20
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>

Looks good, and I tested it with the next patch and it seems to work.

But I think you should make it clear that this does not work with
the hardware "EEH error injection" facility accessible via debugfs in
err_injct (that doesn't seem clear to me from the commit message).

Tested-by: Sam Bobroff <sbobroff@linux.ibm.com>
Reviewed-by: Sam Bobroff <sbobroff@linux.ibm.com>
> ---
>  arch/powerpc/kernel/eeh.c | 61 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 61 insertions(+)
>=20
> diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> index 46d17817b438..ace1c5a6b8ed 100644
> --- a/arch/powerpc/kernel/eeh.c
> +++ b/arch/powerpc/kernel/eeh.c
> @@ -1873,6 +1873,64 @@ static const struct file_operations eeh_force_reco=
ver_fops =3D {
>  	.llseek	=3D no_llseek,
>  	.write	=3D eeh_force_recover_write,
>  };
> +
> +static ssize_t eeh_debugfs_dev_usage(struct file *filp,
> +				char __user *user_buf,
> +				size_t count, loff_t *ppos)
> +{
> +	static const char usage[] =3D "input format: <domain>:<bus>:<dev>.<fn>\=
n";
> +
> +	return simple_read_from_buffer(user_buf, count, ppos,
> +				       usage, sizeof(usage) - 1);
> +}
> +
> +static ssize_t eeh_dev_check_write(struct file *filp,
> +				const char __user *user_buf,
> +				size_t count, loff_t *ppos)
> +{
> +	uint32_t domain, bus, dev, fn;
> +	struct pci_dev *pdev;
> +	struct eeh_dev *edev;
> +	char buf[20];
> +	int ret;
> +
> +	ret =3D simple_write_to_buffer(buf, sizeof(buf), ppos, user_buf, count);
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
> +	edev =3D pci_dev_to_eeh_dev(pdev);
> +	if (!edev) {
> +		pci_err(pdev, "No eeh_dev for this device!\n");
> +		pci_dev_put(pdev);
> +		return -ENODEV;
> +	}
> +
> +	ret =3D eeh_dev_check_failure(edev);
> +	pci_info(pdev, "eeh_dev_check_failure(%04x:%02x:%02x.%01x) =3D %d\n",
> +			domain, bus, dev, fn, ret);
> +
> +	pci_dev_put(pdev);
> +
> +	return count;
> +}
> +
> +static const struct file_operations eeh_dev_check_fops =3D {
> +	.open	=3D simple_open,
> +	.llseek	=3D no_llseek,
> +	.write	=3D eeh_dev_check_write,
> +	.read   =3D eeh_debugfs_dev_usage,
> +};
> +
>  #endif
> =20
>  static int __init eeh_init_proc(void)
> @@ -1888,6 +1946,9 @@ static int __init eeh_init_proc(void)
>  		debugfs_create_bool("eeh_disable_recovery", 0600,
>  				powerpc_debugfs_root,
>  				&eeh_debugfs_no_recover);
> +		debugfs_create_file_unsafe("eeh_dev_check", 0600,
> +				powerpc_debugfs_root, NULL,
> +				&eeh_dev_check_fops);
>  		debugfs_create_file_unsafe("eeh_force_recover", 0600,
>  				powerpc_debugfs_root, NULL,
>  				&eeh_force_recover_fops);
> --=20
> 2.21.0
>=20

--v2/QI0iRXglpx0hK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl2AT+kACgkQMX8w6AQl
/iITwQf+IcRphKrQtsVKIHQJgvfK5XL0zRbnEH+DMGIknARRi3boZ0c5XBmcp0pT
HhjmRNgfSSaBTI/geGYEb1affM5WfJ8IoIfu2NqWMPmt34bhxJG7q1MYd7tZLvnP
tCrXL5HkZ7Yd7oDNoXmHImSDLY/VFGb6E5gioobAGgm7fDPLjPQqIJwH5EQCTh4S
T3LzkdfBi+89t4akHFsd2wJMPRoipx+6r1i0ahyxKVfYlu2xqfQzMyNnSWKLl6Qd
i3LoYk9YK7n0nYB/ry7stmWqislEyRRWHP6OzJXyQMhgolb48hS4mx3+sSwx5NWC
SZ4Ty1PwRJoRVQJkSBPr0EMexD6iPQ==
=lY/H
-----END PGP SIGNATURE-----

--v2/QI0iRXglpx0hK--

