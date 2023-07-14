Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96490754595
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 02:08:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NqN5L3qO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2pZr3VT5z3cQp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 10:08:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NqN5L3qO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=us.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=dtsen@us.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2btG2bvCz3bqw
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 02:05:41 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36EFlq4w016143;
	Fri, 14 Jul 2023 16:04:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : date :
 message-id : references : in-reply-to : content-type : mime-version :
 subject; s=pp1; bh=JWQy0DOWz3+EB9dKd4KlreA8Mnr+npLUEjIDwWqizDA=;
 b=NqN5L3qOArPnPkwf+aeO3PgpL6aaZp8N3rO0PnKDzrJgvDwlVVv7zlxReiN+he9va3IA
 3hVyYJKICX+QYLHgoMnp+9sz5mP2rjb1UxFTP9vDYxRdZ428E2hpqPUGlrpe+oCow4xY
 z/z0ndkf2UTAFrHugKwNBaz/QtnDJOgpTeoVtZsxCyn0jSSwtNu52Xa7huXCgxIGRCrp
 XEN63aibUtbiXnM8QlSjCQ/wdZqNquRxJj8uAbmOUSm6gRWLsEucxJsudgjkZuHcV/dJ
 9t1TmYNqe+sKg7/fdlm7Ezt8PCpwtqGyiCjlyBE+q9k+FKGh8+dKsN924lnNRBfKkdun NQ== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ru9ae8jp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Jul 2023 16:04:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SLDI7tj1grNZ3FWZuKu2w7iKcvIX2Y4zz3xD4nb8l1sscCilZdbvIKlachAK7W5k/AW/hP+wjn3VUETygwZssB+tnHgLjNVQDzG4FFomBKhpHrPwo1OCcTZ1oyGYpZCW2ruT1R3j+6iLY7soH+5jOZ6NBBMLieNVSgQYTZ4ONvuXOrXuxnK2z02AUWS7Da+S8tpO75c5Ni+IcysiHDUaUIrzjvIdDysaKUbNEv54+CFGkzjfqa78/myHtJqWJplSI2XdGbbgs7sK4Vm3/tL9g0AkGc+Z6W7WVjvZvTDRNU/N+i/PTYUQZZEZZ1y74GzGPxDC/puRS3tu2fgThegicA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qe7cbtqU8WY2SgpZ4b41VkZLl/v2ACfeWPGRp1d1aII=;
 b=iryY5x0kJi4qHN4F84gvTCN37J5RhRaR0kA8tB0UZUIwd6B1j2SjgoE0nKepX3YN2LifCmTuPbVR+hkEbq1GMllEzEoc+wIsBoNQwdH4cqJt3RX5K4XkLheX3W4YpYawo1amqw2JyFloZhp8fc/kJ94kgsROkGFGMw5i47r4Y9GqThNRKDEF/2PVWvnpw6EjUvG3eVD8/l2L8E/2y8AjKZb3hv95Xn4Xacaso42epDZN7+Upbn0S0Ik6Yq6UAFGl7i2zaQHyGm5xFjPJIttmFC9sr4ztwrHFN3RHqI464ivNi0fTnYzHVoPCdZXnPjN8TZ8/YUsITA25ReRJ67q0mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=us.ibm.com; dmarc=pass action=none header.from=us.ibm.com;
 dkim=pass header.d=us.ibm.com; arc=none
Received: from MN6PR15MB6265.namprd15.prod.outlook.com (2603:10b6:208:471::18)
 by PH7PR15MB5938.namprd15.prod.outlook.com (2603:10b6:510:245::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.32; Fri, 14 Jul
 2023 16:04:26 +0000
Received: from MN6PR15MB6265.namprd15.prod.outlook.com
 ([fe80::c93d:5387:7cf9:9511]) by MN6PR15MB6265.namprd15.prod.outlook.com
 ([fe80::c93d:5387:7cf9:9511%3]) with mapi id 15.20.6588.027; Fri, 14 Jul 2023
 16:04:26 +0000
From: Danny Tsen <dtsen@us.ibm.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, Danny Tsen <dtsen@linux.ibm.com>
Thread-Topic: [EXTERNAL] Re: [PATCH v2 0/5] crypto: Accelerated
 Chacha20/Poly1305 implementation
Thread-Index: AQHZeHL9hGFdvZKz0EWPUQj5tzLz4q+5b28AgAB5H58=
Date: Fri, 14 Jul 2023 16:04:26 +0000
Message-ID:  <MN6PR15MB6265B6B033B7A3FDA48BB6F79334A@MN6PR15MB6265.namprd15.prod.outlook.com>
References: <20230426191147.60610-1-dtsen@linux.ibm.com>
 <ZLEMNpZ4M4U/4t6j@gondor.apana.org.au>
In-Reply-To: <ZLEMNpZ4M4U/4t6j@gondor.apana.org.au>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN6PR15MB6265:EE_|PH7PR15MB5938:EE_
x-ms-office365-filtering-correlation-id: a493eb9e-9bf4-4e32-3da0-08db8483ff9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  jea161Fno8tinpM00g1YgDiLJm4lxqKqkQ0hIg1pIfzBX/YrAjUsUej39r38dvaHCk19t4LRs0tsU+l4s3WxcLjK+ptNdgJhcvwFhPnHA4iFcco8rGS3mk5laxKEs2ZoRVKuF3LsGb5Hf64bDr+Q8HmNtjoUwrhhSKEMXq+E+J/cHD2fXxDbC5kAtThwJIr0B6TSdoDGL3quc9/gcFPtOsCQWn/SYpQO/xH3tDnm/dr61slvYGM6nM0znPyJD+aKBpT5pqYl/uxAsWXFOnm5iD8bK7at4lAmI4Crl8PbxuHu5lQNrHVhMQdhcwpz44cdtDqgHPubS4ei9B5RvL90lYzsgfsb2CpoVTBCmEEFRpFF8ZMIcn+iG7jo8mKnxdfxJAWNOxYY7YZbv/oLjenwxE/UMlVNd5VWaNMgALnm7ThOlCxsfirNKzo39W4PAwPd4cl4KffCTWOa1W7ryvtp63jrpkz8lHD7rRGFAyycgX10cKJp/1XQOh6xO3t0H1ucqBXbEeXRIWPLdBcBx9LRYr8Ti7eeWX1CZltSunbuVAh5l4q/KXnJT3ohyDg8c3zmwz/jkd7qhJ+YZPdWc+uMlrPtiQiITcmFH4hSc4tnL1o=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN6PR15MB6265.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(136003)(396003)(376002)(39860400002)(366004)(451199021)(66476007)(7696005)(4326008)(110136005)(76116006)(66946007)(64756008)(66446008)(66556008)(91956017)(71200400001)(478600001)(55016003)(6506007)(53546011)(122000001)(54906003)(38100700002)(316002)(966005)(41300700001)(166002)(19627405001)(38070700005)(9686003)(8676002)(8936002)(86362001)(83380400001)(7416002)(5660300002)(52536014)(33656002)(186003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?qPJuFQZV0AE/IZ3h09wfTs9TmgD4wMdYvDxhHbggF/It4UkOmUPQrxlyFuJB?=
 =?us-ascii?Q?J3iKRsgJ54lLw+e2RRxjIenJz5vkZ/w3+hxrElzvTVdvLxnFusGfLxTDdjNh?=
 =?us-ascii?Q?D5cPLLlndYGBBHVE7pPoDAY7iDMf/RNQtOgzvMQUiwx+kfEOrcgOB+Zq6zj5?=
 =?us-ascii?Q?3mTTWLS04CEp9UZFShcdlGViVDqVM8WKM5f8N+aZJtVAZPN0qEUCsg095bxA?=
 =?us-ascii?Q?6h6wOHnYnML0YHh+e9WR1YNTCplVpmu0jHcltiXR2Aal6bAmJdQb+xOJo2DK?=
 =?us-ascii?Q?BnXTADVBCKA/ESVZfzbTerL9Oyl3MGyFc0vnlIjy8vGbybN3/VJyWj88Vu/a?=
 =?us-ascii?Q?ot98dJDO3+2YeulCPv4TZrOFpCZL+Gn1h9983ROlU35T1O1+4tuinVzZP38r?=
 =?us-ascii?Q?TW4MfViQjwPXb9l5mzTVHUZOL1tRigcAmUQDAIOgR/BNPdbGNRlfd4fVcNbi?=
 =?us-ascii?Q?tgfOA91iodU1WL26m280BldR02+fdWcc0cgGJDFCEdzWUUyPgrGy8uCxyDJC?=
 =?us-ascii?Q?zwqthNMaq8HgEX2t1Fmq+CsgBPCZXhImXRm8QsFDzwMgsvecDk1CSTvEaPBW?=
 =?us-ascii?Q?nKa5ScDg+F/iDn6+MzCFJMrn1aMUNYgV0QSlA9YaS0SlqyPdVlP0NUZdQxyo?=
 =?us-ascii?Q?2XnQHTQ2naXwYgkOMM94+z1VxWV+HOqoQy1m3yqhQIh3Doh7+/d/c/cLynI1?=
 =?us-ascii?Q?ohe+xIL3qmCyKy5IN0/j3a2ji593DWc7qj5HiQsOokdHGSzSaY3FDnDBxAmh?=
 =?us-ascii?Q?GVHXLkRbhRqjFfxnxwOwJjwoSkYQWxM4rFVwWrs3wI7juxw/NtifYiIOkK5j?=
 =?us-ascii?Q?IMLSSxAqWUEKuh9d/5CEEi1RHNyciSBURVCpbWCvomJunQMm1Ok574s/R+Pe?=
 =?us-ascii?Q?Po/a2JQCwK0rn1nR38pc9IopRmqy2ldYotKMyu0LA6NR/BuSLeoKezwbMftU?=
 =?us-ascii?Q?xLw99oW3FVoaJtL18+uzcmwCwIA/CTHdP/jxSCSTmjxx7rTFjb9mkLGlqt0o?=
 =?us-ascii?Q?KqPwTAwvo0RPD1w/IUYvAr65TtQcl1pXvUeXcDBk7PViOpK6r7H+hzy373xo?=
 =?us-ascii?Q?hdZZp9P5EwL/EjaKXKyK17A/z3efeqcVb2iSvvdJ4qM1nM8MGhUiRMyted14?=
 =?us-ascii?Q?zNOrL5s7YO1jutgNdoS73iaYWC2rqJyWlEJVm08FwlwTIxJB7Q6sK22NMFhl?=
 =?us-ascii?Q?Y+RizvcLhFIVQWzGP4hf3xP8Lww8It/VkFjjXmiFW8MJ7rgkuRl7d+0OHrpR?=
 =?us-ascii?Q?aLO9LhNji+tn61MTV/os8EVVJxIdw1gB7D1yQtdDi4BbdwaGQIdHu/6auz4n?=
 =?us-ascii?Q?I6P8rMJL+KHCne5Jtd/JTDR6fpyH6AgwaO5m618AF98bFNjKNcLb2YGvuud2?=
 =?us-ascii?Q?6mG65G0DvAypBn0sny7bQo+/B9bDeneW3u+L/qlKX7AWDwipKYeXIUqlDC86?=
 =?us-ascii?Q?lIJ+44zs+lR17D58qd6YG1FmYcPdLMMytxCmbD/Y+NiQGEVoOEvywNDka2lI?=
 =?us-ascii?Q?+FufQUNVOGZ9PHglLRBhtesgcP/MA42VP3B7sV3B1LpWCYWgJZA13HbAJsGz?=
 =?us-ascii?Q?Kf4Fx91RINLQPKu9SyJN+qBV/PnVNQfZq5V6dmGfxCDFf8Zgl+McWQ+266U8?=
 =?us-ascii?Q?6W2QdLiModxPjW5M4LhcNYg=3D?=
Content-Type: multipart/alternative;
	boundary="_000_MN6PR15MB6265B6B033B7A3FDA48BB6F79334AMN6PR15MB6265namp_"
X-OriginatorOrg: us.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN6PR15MB6265.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a493eb9e-9bf4-4e32-3da0-08db8483ff9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jul 2023 16:04:26.6644
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SXcJhRbtDh2oPbGYNClUDoHUrV29A7dH4F3P/SILznqNNTKyeuipM17/fPM+TIkQAa+fbJuLvJg8W1FX+gnRmg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR15MB5938
X-Proofpoint-GUID: UmAcgJcBXd7zho0a4tZGlL45yR2CO3fu
X-Proofpoint-ORIG-GUID: UmAcgJcBXd7zho0a4tZGlL45yR2CO3fu
X-Proofpoint-UnRewURL: 8 URL's were un-rewritten
MIME-Version: 1.0
Subject: RE: [PATCH v2 0/5] crypto: Accelerated Chacha20/Poly1305 implementation
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-14_07,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=892 clxscore=1011 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307140146
X-Mailman-Approved-At: Sat, 15 Jul 2023 10:04:45 +1000
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
Cc: "nayna@linux.ibm.com" <nayna@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "appro@cryptogams.org" <appro@cryptogams.org>, "linux-crypto@vger.kernel.org" <linux-crypto@vger.kernel.org>, "ltcgcw@linux.vnet.ibm.com" <ltcgcw@linux.vnet.ibm.com>, "leitao@debian.org" <leitao@debian.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_MN6PR15MB6265B6B033B7A3FDA48BB6F79334AMN6PR15MB6265namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks.
-Danny
________________________________
From: Herbert Xu <herbert@gondor.apana.org.au>
Sent: Friday, July 14, 2023 4:49 PM
To: Danny Tsen <dtsen@linux.ibm.com>
Cc: linux-crypto@vger.kernel.org <linux-crypto@vger.kernel.org>; leitao@deb=
ian.org <leitao@debian.org>; nayna@linux.ibm.com <nayna@linux.ibm.com>; app=
ro@cryptogams.org <appro@cryptogams.org>; linux-kernel@vger.kernel.org <lin=
ux-kernel@vger.kernel.org>; linuxppc-dev@lists.ozlabs.org <linuxppc-dev@lis=
ts.ozlabs.org>; mpe@ellerman.id.au <mpe@ellerman.id.au>; ltcgcw@linux.vnet.=
ibm.com <ltcgcw@linux.vnet.ibm.com>; Danny Tsen <dtsen@us.ibm.com>
Subject: [EXTERNAL] Re: [PATCH v2 0/5] crypto: Accelerated Chacha20/Poly130=
5 implementation

On Wed, Apr 26, 2023 at 03:11:42PM -0400, Danny Tsen wrote:
> This patch series provide an accelerated/optimized Chacha20 and Poly1305
> implementation for Power10 or later CPU (ppc64le).  This module
> implements algorithm specified in RFC7539.  The implementation
> provides 3.5X better performance than the baseline for Chacha20 and
> Poly1305 individually and 1.5X improvement for Chacha20/Poly1305
> operation.
>
> This patch has been tested with the kernel crypto module tcrypt.ko and
> has passed the selftest.  The patch is also tested with
> CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.
>
>
> Danny Tsen (5):
>   An optimized Chacha20 implementation with 8-way unrolling for ppc64le.
>   Glue code for optmized Chacha20 implementation for ppc64le.
>   An optimized Poly1305 implementation with 4-way unrolling for ppc64le.
>   Glue code for optmized Poly1305 implementation for ppc64le.
>   Update Kconfig and Makefile.
>
>  arch/powerpc/crypto/Kconfig             |   26 +
>  arch/powerpc/crypto/Makefile            |    4 +
>  arch/powerpc/crypto/chacha-p10-glue.c   |  221 +++++
>  arch/powerpc/crypto/chacha-p10le-8x.S   |  842 ++++++++++++++++++
>  arch/powerpc/crypto/poly1305-p10-glue.c |  186 ++++
>  arch/powerpc/crypto/poly1305-p10le_64.S | 1075 +++++++++++++++++++++++
>  6 files changed, 2354 insertions(+)
>  create mode 100644 arch/powerpc/crypto/chacha-p10-glue.c
>  create mode 100644 arch/powerpc/crypto/chacha-p10le-8x.S
>  create mode 100644 arch/powerpc/crypto/poly1305-p10-glue.c
>  create mode 100644 arch/powerpc/crypto/poly1305-p10le_64.S
>
> --
> 2.31.1

All applied.  Thanks.
--
Email: Herbert Xu <herbert@gondor.apana.org.au>
Home Page: http://gondor.apana.org.au/~herbert/
PGP Key: http://gondor.apana.org.au/~herbert/pubkey.txt

--_000_MN6PR15MB6265B6B033B7A3FDA48BB6F79334AMN6PR15MB6265namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);" class=3D"elementToProof">
-Danny<br>
</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Herbert Xu &lt;herber=
t@gondor.apana.org.au&gt;<br>
<b>Sent:</b> Friday, July 14, 2023 4:49 PM<br>
<b>To:</b> Danny Tsen &lt;dtsen@linux.ibm.com&gt;<br>
<b>Cc:</b> linux-crypto@vger.kernel.org &lt;linux-crypto@vger.kernel.org&gt=
;; leitao@debian.org &lt;leitao@debian.org&gt;; nayna@linux.ibm.com &lt;nay=
na@linux.ibm.com&gt;; appro@cryptogams.org &lt;appro@cryptogams.org&gt;; li=
nux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt;;
 linuxppc-dev@lists.ozlabs.org &lt;linuxppc-dev@lists.ozlabs.org&gt;; mpe@e=
llerman.id.au &lt;mpe@ellerman.id.au&gt;; ltcgcw@linux.vnet.ibm.com &lt;ltc=
gcw@linux.vnet.ibm.com&gt;; Danny Tsen &lt;dtsen@us.ibm.com&gt;<br>
<b>Subject:</b> [EXTERNAL] Re: [PATCH v2 0/5] crypto: Accelerated Chacha20/=
Poly1305 implementation</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Wed, Apr 26, 2023 at 03:11:42PM -0400, Danny Ts=
en wrote:<br>
&gt; This patch series provide an accelerated/optimized Chacha20 and Poly13=
05<br>
&gt; implementation for Power10 or later CPU (ppc64le).&nbsp; This module<b=
r>
&gt; implements algorithm specified in RFC7539.&nbsp; The implementation<br>
&gt; provides 3.5X better performance than the baseline for Chacha20 and<br>
&gt; Poly1305 individually and 1.5X improvement for Chacha20/Poly1305<br>
&gt; operation.<br>
&gt; <br>
&gt; This patch has been tested with the kernel crypto module tcrypt.ko and=
<br>
&gt; has passed the selftest.&nbsp; The patch is also tested with<br>
&gt; CONFIG_CRYPTO_MANAGER_EXTRA_TESTS enabled.<br>
&gt; <br>
&gt; <br>
&gt; Danny Tsen (5):<br>
&gt;&nbsp;&nbsp; An optimized Chacha20 implementation with 8-way unrolling =
for ppc64le.<br>
&gt;&nbsp;&nbsp; Glue code for optmized Chacha20 implementation for ppc64le=
.<br>
&gt;&nbsp;&nbsp; An optimized Poly1305 implementation with 4-way unrolling =
for ppc64le.<br>
&gt;&nbsp;&nbsp; Glue code for optmized Poly1305 implementation for ppc64le=
.<br>
&gt;&nbsp;&nbsp; Update Kconfig and Makefile.<br>
&gt; <br>
&gt;&nbsp; arch/powerpc/crypto/Kconfig&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; 26 +<br>
&gt;&nbsp; arch/powerpc/crypto/Makefile&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp; 4 +<br>
&gt;&nbsp; arch/powerpc/crypto/chacha-p10-glue.c&nbsp;&nbsp; |&nbsp; 221 ++=
+++<br>
&gt;&nbsp; arch/powerpc/crypto/chacha-p10le-8x.S&nbsp;&nbsp; |&nbsp; 842 ++=
++++++++++++++++<br>
&gt;&nbsp; arch/powerpc/crypto/poly1305-p10-glue.c |&nbsp; 186 ++++<br>
&gt;&nbsp; arch/powerpc/crypto/poly1305-p10le_64.S | 1075 +++++++++++++++++=
++++++<br>
&gt;&nbsp; 6 files changed, 2354 insertions(+)<br>
&gt;&nbsp; create mode 100644 arch/powerpc/crypto/chacha-p10-glue.c<br>
&gt;&nbsp; create mode 100644 arch/powerpc/crypto/chacha-p10le-8x.S<br>
&gt;&nbsp; create mode 100644 arch/powerpc/crypto/poly1305-p10-glue.c<br>
&gt;&nbsp; create mode 100644 arch/powerpc/crypto/poly1305-p10le_64.S<br>
&gt; <br>
&gt; -- <br>
&gt; 2.31.1<br>
<br>
All applied.&nbsp; Thanks.<br>
-- <br>
Email: Herbert Xu &lt;herbert@gondor.apana.org.au&gt;<br>
Home Page: <a href=3D"http://gondor.apana.org.au/~herbert/">http://gondor.a=
pana.org.au/~herbert/</a>
<br>
PGP Key: <a href=3D"http://gondor.apana.org.au/~herbert/pubkey.txt">http://=
gondor.apana.org.au/~herbert/pubkey.txt</a>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_MN6PR15MB6265B6B033B7A3FDA48BB6F79334AMN6PR15MB6265namp_--
