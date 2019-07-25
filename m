Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FDB74405
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 05:35:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vHsH1LcTzDqM7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 13:34:59 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vHqY3qTFzDqM0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 13:33:28 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6P3XIwS136084
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 23:33:25 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ty1wk53k9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 23:33:23 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Thu, 25 Jul 2019 04:33:15 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 25 Jul 2019 04:33:13 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6P3XCTc34472112
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jul 2019 03:33:12 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 68481A4054;
 Thu, 25 Jul 2019 03:33:12 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0F76A405F;
 Thu, 25 Jul 2019 03:33:11 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 25 Jul 2019 03:33:11 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6FDE9A018C;
 Thu, 25 Jul 2019 13:33:10 +1000 (AEST)
Date: Thu, 25 Jul 2019 13:33:09 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH v3 9/9] powerpc/eeh: Convert log messages to eeh_edev_*
 macros
References: <d5bbb2e9a39da905d656524bdf9e1b6705fd526a.1563853440.git.sbobroff@linux.ibm.com>
 <201907241746.mKIx06OX%lkp@intel.com>
 <CAOSf1CGW9+6TRkbQRqNPcGY9o-=s3YVRGO4GWcKx22ZkXvwCpg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2oS5YaxWCcQjTEyO"
Content-Disposition: inline
In-Reply-To: <CAOSf1CGW9+6TRkbQRqNPcGY9o-=s3YVRGO4GWcKx22ZkXvwCpg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19072503-0020-0000-0000-00000356EB1C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072503-0021-0000-0000-000021AADDB0
Message-Id: <20190725033308.GA6209@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-25_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1907250040
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Tyrel Datwyler <tyreld@linux.vnet.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 kbuild test robot <lkp@intel.com>, kbuild-all@01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--2oS5YaxWCcQjTEyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 24, 2019 at 07:47:55PM +1000, Oliver O'Halloran wrote:
> On Wed, Jul 24, 2019 at 7:24 PM kbuild test robot <lkp@intel.com> wrote:
> >
> > Hi Sam,
> >
> > I love your patch! Yet something to improve:
> >
> > [auto build test ERROR on linus/master]
> > [also build test ERROR on v5.3-rc1 next-20190724]
> > [if your patch is applied to the wrong git tree, please drop us a note =
to help improve the system]
> >
> > url:    https://github.com/0day-ci/linux/commits/Sam-Bobroff/powerpc-64=
-Adjust-order-in-pcibios_init/20190724-134001
> > config: powerpc-defconfig (attached as .config)
> > compiler: powerpc64-linux-gcc (GCC) 7.4.0
> > reproduce:
> >         wget https://raw.githubusercontent.com/intel/lkp-tests/master/s=
bin/make.cross -O ~/bin/make.cross
> >         chmod +x ~/bin/make.cross
> >         # save the attached .config to linux build tree
> >         GCC_VERSION=3D7.4.0 make.cross ARCH=3Dpowerpc
> >
> > If you fix the issue, kindly add following tag
> > Reported-by: kbuild test robot <lkp@intel.com>
> >
> > All errors (new ones prefixed by >>):
> >
> >    arch/powerpc/kernel/eeh_driver.c: In function 'eeh_add_virt_device':
> > >> arch/powerpc/kernel/eeh_driver.c:459:17: error: unused variable 'pdn=
' [-Werror=3Dunused-variable]
> >      struct pci_dn *pdn =3D eeh_dev_to_pdn(edev);
>=20
> FYI this happens when CONFIG_IOV isn't set. Adding a __maybe_unused
> annotation fixes it.

Ah, thanks. This must be in eeh_add_virt_device().

Since there's now only a single use of pdn in that function, maybe we
can remove the variable, and the IOV case can do this:
	pci_iov_add_virtfn(edev->physfn, eeh_dev_to_pdn(edev)->vf_index);

> >                     ^~~
> >    cc1: all warnings being treated as errors
> >
> > vim +/pdn +459 arch/powerpc/kernel/eeh_driver.c
> >
> > 77bd7415 arch/powerpc/platforms/pseries/eeh_driver.c Linas Vepstas 2005=
-11-03  454
> > bf773df9 arch/powerpc/kernel/eeh_driver.c            Sam Bobroff   2018=
-09-12  455  static void *eeh_add_virt_device(struct eeh_dev *edev)
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  456  {
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  457      struct pci_driver *driver;
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  458      struct pci_dev *dev =3D eeh_dev_to_pci_dev(edev);
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04 @459      struct pci_dn *pdn =3D eeh_dev_to_pdn(edev);
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  460
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  461      if (!(edev->physfn)) {
> > 6dad7bbd arch/powerpc/kernel/eeh_driver.c            Sam Bobroff   2019=
-07-23  462              eeh_edev_warn(edev, "Not for VF\n");
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  463              return NULL;
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  464      }
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  465
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  466      driver =3D eeh_pcid_get(dev);
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  467      if (driver) {
> > 46d4be41 arch/powerpc/kernel/eeh_driver.c            Sam Bobroff   2018=
-05-25  468              if (driver->err_handler) {
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  469                      eeh_pcid_put(dev);
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  470                      return NULL;
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  471              }
> > 46d4be41 arch/powerpc/kernel/eeh_driver.c            Sam Bobroff   2018=
-05-25  472              eeh_pcid_put(dev);
> > 46d4be41 arch/powerpc/kernel/eeh_driver.c            Sam Bobroff   2018=
-05-25  473      }
> > 67086e32 arch/powerpc/kernel/eeh_driver.c            Wei Yang      2016=
-03-04  474
> >
> > :::::: The code at line 459 was first introduced by commit
> > :::::: 67086e32b56481531ab1292b284e074b1a8d764c powerpc/eeh: powerpc/ee=
h: Support error recovery for VF PE
> >
> > :::::: TO: Wei Yang <weiyang@linux.vnet.ibm.com>
> > :::::: CC: Michael Ellerman <mpe@ellerman.id.au>
> >
> > ---
> > 0-DAY kernel test infrastructure                Open Source Technology =
Center
> > https://lists.01.org/pipermail/kbuild-all                   Intel Corpo=
ration
>=20

--2oS5YaxWCcQjTEyO
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAl05IukACgkQMX8w6AQl
/iKKQQf/aon/v0++ynRs7vZGH1sBZLIF2w18OkrYOM++1oaY2HV09MXECvUod7sd
pr1iv6zgj9YNabZzEDq1zqAYVDg4+hjIrEvCOqC1Pf3S+/Sv+dr8a4lTv7cA8gS6
rMncuzmrn+D12gpEnlYfk/NgGZaJ2XoMEXIjmrgAQEcoxZy5+rw2tnSw9xaPIDyG
byxAL8uh7D+XLChISZ6gfBJpeA9juciK3INkOYGVTyJcq3wtRgkrUeNJT/7+toJP
hxkjoP6r4P5Im5yhqXdrGNemgzf75Pddan3u9HIlGY8UpHBx8a4hAw0vle9Fh6bl
RxDX6fmZU/MBq1tuTG2tkvSp7WxdzQ==
=oChm
-----END PGP SIGNATURE-----

--2oS5YaxWCcQjTEyO--

