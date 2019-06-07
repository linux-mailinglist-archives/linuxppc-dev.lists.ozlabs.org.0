Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6E33969A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jun 2019 22:16:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LDLY2SwNzDqJ3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 06:16:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45LDHC2Qx4zDr0y
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 06:13:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45LDHB3c92z8tFS
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 06:13:10 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45LDHB2WyMz9sCJ; Sat,  8 Jun 2019 06:13:10 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=leonardo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45LDH96CnQz9sBp;
 Sat,  8 Jun 2019 06:13:09 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x57KCPhd124296; Fri, 7 Jun 2019 16:13:05 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sywfqu5w3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jun 2019 16:13:05 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x57K1Uqi017260;
 Fri, 7 Jun 2019 20:10:38 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 2syxdfr2un-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jun 2019 20:10:38 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x57KBnJc31130042
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jun 2019 20:11:49 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E64A9AC05E;
 Fri,  7 Jun 2019 20:11:48 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4521EAC05B;
 Fri,  7 Jun 2019 20:11:47 +0000 (GMT)
Received: from leobras.br.ibm.com (unknown [9.18.235.153])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jun 2019 20:11:47 +0000 (GMT)
Message-ID: <0f6d278e78b2784a77ce2cd07a84377da6f5262e.camel@linux.ibm.com>
Subject: Re: [PATCH v3 1/9] KVM: PPC: Ultravisor: Add PPC_UV config option
From: Leonardo Bras <leonardo@linux.ibm.com>
To: Claudio Carvalho <cclaudio@linux.ibm.com>, linuxppc-dev@ozlabs.org
Date: Fri, 07 Jun 2019 17:11:42 -0300
In-Reply-To: <20190606173614.32090-2-cclaudio@linux.ibm.com>
References: <20190606173614.32090-1-cclaudio@linux.ibm.com>
 <20190606173614.32090-2-cclaudio@linux.ibm.com>
Content-Type: multipart/signed; micalg="pgp-sha256";
 protocol="application/pgp-signature"; boundary="=-ulrQwuweQ3GGKql+lSZh"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-07_11:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906070135
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Michael Anderson <andmike@linux.ibm.com>, Ram Pai <linuxram@us.ibm.com>,
 kvm-ppc@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 Sukadev Bhattiprolu <sukadev@linux.vnet.ibm.com>,
 Anshuman Khandual <khandual@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--=-ulrQwuweQ3GGKql+lSZh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable



On Thu, 2019-06-06 at 14:36 -0300, Claudio Carvalho wrote:
> From: Anshuman Khandual <khandual@linux.vnet.ibm.com>
>=20
> CONFIG_PPC_UV adds support for ultravisor.
>=20
> Signed-off-by: Anshuman Khandual <khandual@linux.vnet.ibm.com>
> Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
> Signed-off-by: Ram Pai <linuxram@us.ibm.com>
> [Update config help and commit message]
> Signed-off-by: Claudio Carvalho <cclaudio@linux.ibm.com>
> ---
>  arch/powerpc/Kconfig | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 8c1c636308c8..276c1857c335 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -439,6 +439,26 @@ config PPC_TRANSACTIONAL_MEM
>         ---help---
>           Support user-mode Transactional Memory on POWERPC.
>=20
> +config PPC_UV
> +	bool "Ultravisor support"
> +	depends on KVM_BOOK3S_HV_POSSIBLE
> +	select HMM_MIRROR
> +	select HMM
> +	select ZONE_DEVICE
> +	select MIGRATE_VMA_HELPER
> +	select DEV_PAGEMAP_OPS
> +	select DEVICE_PRIVATE
> +	select MEMORY_HOTPLUG
> +	select MEMORY_HOTREMOVE
> +	default n
> +	help
> +	  This option paravirtualizes the kernel to run in POWER platforms that
> +	  supports the Protected Execution Facility (PEF). In such platforms,
> +	  the ultravisor firmware runs at a privilege level above the
> +	  hypervisor.
> +
> +	  If unsure, say "N".
> +
>  config LD_HEAD_STUB_CATCH
>  	bool "Reserve 256 bytes to cope with linker stubs in HEAD text" if EXPE=
RT
>  	depends on PPC64

Maybe this patch should be the last of the series, as it may cause some
bisect trouble to have this option enabled while missing some of the
patches.



--=-ulrQwuweQ3GGKql+lSZh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEMdeUgIzgjf6YmUyOlQYWtz9SttQFAlz6xP4ACgkQlQYWtz9S
ttQCfQ/9EITv/NW9EfhotrqtIUvzBsquQmS84AYxUYEghiTj5uQIFPn3VBVTxT7e
ZbKWEMeOVQWHQ87Hrl6Y90IinkIeacnfdOWD1jk8HG81HAvluF5PmPHoEBMJPH0N
WLSLdvf6+LQKiRR4du5ffta39bVok/CXOIOBdhrH+vC33xAuFZEBRNXfYi3XBGEj
+DAmiv/ZXF+QBXYqmx9R/q8Po+5lO3OHN2Zm+D7Kh6+yl4xBBlLjaDNaez8YbNpx
rol3Hw0fhGpL5CasQI7+sxIZU23mm7v5z32THsks+WCaMgXVq+ejT6jeEC3i+Yw+
bcDpPGkBg5Gczzo8ItpSGCC9MMu/k9ojFsuBjeNL5A5XEw8Je9/GAKXGhn/t468O
XwAy+dPxFRZdeUo3a0VmJFscQXlMRjVYC9GP2lwHteghfSLZ/xuQDlCk8Jw2r3j6
240GxjIKnOCKYD/shTdpOCy7h6ZeqzF5EZPMeQgeLJo/ysZdMAIMTOBvf2s4DHFn
MqzvQkqNwWIOjxH5mn1lsmrzrQGn8dxgtJ/L8Xxsr2qMEqyuBpnqIlDhO0NOXuoq
dlDilmPtD88qCbNEnGvb2ov/jRQ4SeM5KavckmXuEH3TOvKmrSnF3Z7cQ1+P3PKq
5NInu8jm3ltKM5704HOS7iXzLEA0jwF1nlnB+e/wbyErqYSf7jc=
=tU5v
-----END PGP SIGNATURE-----

--=-ulrQwuweQ3GGKql+lSZh--

