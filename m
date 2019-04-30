Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F07CAF013
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 07:46:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44tVrX3g1MzDqRW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2019 15:46:20 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44tVpt0Kp2zDqQ5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 15:44:53 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x3U5gGZi027318
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:44:50 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2s6fmf9p7w-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2019 01:44:49 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sbobroff@linux.ibm.com>;
 Tue, 30 Apr 2019 06:44:48 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 30 Apr 2019 06:44:47 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x3U5ikGI51380442
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Apr 2019 05:44:46 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DF36AE051;
 Tue, 30 Apr 2019 05:44:46 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ABCF5AE053;
 Tue, 30 Apr 2019 05:44:45 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 30 Apr 2019 05:44:45 +0000 (GMT)
Received: from tungsten.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8DBE8A01D2;
 Tue, 30 Apr 2019 15:44:44 +1000 (AEST)
Date: Tue, 30 Apr 2019 15:44:43 +1000
From: Sam Bobroff <sbobroff@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH 5/8] powerpc/eeh: Add eeh_show_enabled()
References: <cover.1553050609.git.sbobroff@linux.ibm.com>
 <ad8cf11e3151fd39c6a9deedc0098d50274c75e4.1553050609.git.sbobroff@linux.ibm.com>
 <7d93d678a1e37a1efb935f88fbc91f134d298ac8.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="R3G7APHDIzY6R/pk"
Content-Disposition: inline
In-Reply-To: <7d93d678a1e37a1efb935f88fbc91f134d298ac8.camel@gmail.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
X-TM-AS-GCONF: 00
x-cbid: 19043005-0016-0000-0000-00000276B961
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19043005-0017-0000-0000-000032D3423F
Message-Id: <20190430054442.GB9630@tungsten.ozlabs.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-04-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1904300038
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


--R3G7APHDIzY6R/pk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 18, 2019 at 08:01:36PM +1000, Oliver O'Halloran wrote:
> On Wed, 2019-03-20 at 13:58 +1100, Sam Bobroff wrote:
> > Move the EEH enabled message into it's own function so that future
> > work can call it from multiple places.
> >=20
> > Signed-off-by: Sam Bobroff <sbobroff@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/eeh.h |  3 +++
> >  arch/powerpc/kernel/eeh.c      | 16 +++++++++++-----
> >  2 files changed, 14 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/arch/powerpc/include/asm/eeh.h b/arch/powerpc/include/asm/=
eeh.h
> > index fe4cf7208890..e217ccda55d0 100644
> > --- a/arch/powerpc/include/asm/eeh.h
> > +++ b/arch/powerpc/include/asm/eeh.h
> > @@ -289,6 +289,7 @@ struct pci_bus *eeh_pe_bus_get(struct eeh_pe *pe);
> > =20
> >  struct eeh_dev *eeh_dev_init(struct pci_dn *pdn);
> >  void eeh_dev_phb_init_dynamic(struct pci_controller *phb);
> > +void eeh_show_enabled(void);
> >  void eeh_probe_devices(void);
> >  int __init eeh_ops_register(struct eeh_ops *ops);
> >  int __exit eeh_ops_unregister(const char *name);
> > @@ -338,6 +339,8 @@ static inline bool eeh_enabled(void)
> >          return false;
> >  }
> > =20
> > +static inline void eeh_show_enabled(void) { }
> > +
> >  static inline bool eeh_phb_enabled(void)
> >  {
> >  	return false;
> > diff --git a/arch/powerpc/kernel/eeh.c b/arch/powerpc/kernel/eeh.c
> > index b14d89547895..3dcff29cb9b3 100644
> > --- a/arch/powerpc/kernel/eeh.c
> > +++ b/arch/powerpc/kernel/eeh.c
> > @@ -163,6 +163,16 @@ static int __init eeh_setup(char *str)
> >  }
> >  __setup("eeh=3D", eeh_setup);
> > =20
> > +void eeh_show_enabled(void)
> > +{
> > +	if (eeh_has_flag(EEH_FORCE_DISABLED))
> > +		pr_info("EEH: PCI Enhanced I/O Error Handling DISABLED (by eeh=3Doff=
)\n");
>=20
> The allcaps looks kind of stupid.

Argh, true!

> > +	else if (eeh_enabled())
> > +		pr_info("EEH: PCI Enhanced I/O Error Handling ENABLED (capable adapt=
er found)\n");
> > +	else
> > +		pr_info("EEH: PCI Enhanced I/O Error Handling DISABLED (no capable a=
dapter found)\n");
>=20
> If we really have to keep these messages then make it say "no EEH
> capable buses found" or something. EEH support has absolutely nothing

I don't think it's critical, but I'd like something that lets you
determine if EEH_ENABLED is set or not and why, since it's helpful for
debugging.

And I know what you mean about EEH support and adapters, but (before
these patches anyway) if you don't have an EEH capable adapter in the
machine at boot time, you won't ever get EEH recovery because
EEH_ENABLED won't be set. (I think we want to clean that up, so this
probably only matters until we do that.)

> to do with the adapters and I'm not even sure we can get the "DISABLED"
> message on PowerNV since the root port will always be there.

Yes, you'd have to force it off via the command line.

Anyway, I'll try to improve the messages (and no more caps) :-)

> > +}
> > +
> >  /*
> >   * This routine captures assorted PCI configuration space data
> >   * for the indicated PCI device, and puts them into a buffer
> > @@ -1166,11 +1176,7 @@ void eeh_probe_devices(void)
> >  		pdn =3D hose->pci_data;
> >  		traverse_pci_dn(pdn, eeh_ops->probe, NULL);
> >  	}
> > -	if (eeh_enabled())
> > -		pr_info("EEH: PCI Enhanced I/O Error Handling Enabled\n");
> > -	else
> > -		pr_info("EEH: No capable adapters found\n");
> > -
> > +	eeh_show_enabled();
> >  }
> > =20
> >  /**
>=20

--R3G7APHDIzY6R/pk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEELWWF8pdtWK5YQRohMX8w6AQl/iIFAlzH4MUACgkQMX8w6AQl
/iJc4Qf/RFzBIpcyYobhdsTq2S7HkTKRlc5dud3ZmnVgOXRVYotpkyUU/Grf0+s+
wiaLiMs//mtc8otRcX7/48auq1MAFq/BFiYZYKfeWYo4NDZY4NGBga09m/eG5qTK
/5FMZnhAHISQ8r9OShQRVG20ZYuOcbfUp24lFe6hbTJ1R7QJcL65tcTQAwkFiXzh
+2MojEhoo3WD8yr+CYVul7z1D7eoT2WxxakB06nDSR5Rr5oS6RQLiicVfHZkrrc0
IgTj6QcVPKz68RKxGVvFloPWHhkZLaBPXBVu/wYp3BOS4X0ykgoVmKhz/GA/qZyG
qtMrRlxqRN3WPgUbKYQTR/Nca0fCdQ==
=viSq
-----END PGP SIGNATURE-----

--R3G7APHDIzY6R/pk--

