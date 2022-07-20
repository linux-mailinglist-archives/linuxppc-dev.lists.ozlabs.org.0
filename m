Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F2657B7A9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 15:43:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lnxk96NW3z3dY6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 23:43:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TtMaag3o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nasastry@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TtMaag3o;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnxjR2PDdz2xt3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 23:43:07 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KDWCFF023218;
	Wed, 20 Jul 2022 13:43:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=0Z3PgzzNKO+ECJ6LxRKdBn5sBDda1/Bdh67Az7ggE0M=;
 b=TtMaag3oKfhP77pKfpHytxQE5qlqLTge+FQXbHR/LgKacgL0ixA8CLWTY2ZlQbHbeAtB
 DM/Ssd7biLZMunddlbOdaurPyOCHjG9gpLRlxXHmaRhwUROifEeqtHNn4XL614xJqXj9
 /eTX0VRJEMRXNoCBXzC4gsZaLTry2EYwZt2DKNURm7BxqVtdLQh1JCWHB/ZIEgpDVlNK
 erS3R6nhmTQjluQIr3j09a8sZvmF6g8J0tVkaHwRssIn85hsOGu+kttu47J4poGc7zTn
 hWQbAXJuELgsA6ADxdZaFiJTmyF7PvVOTyEI4BfJdZ5UP5iNBhxJmljBkDwESy3oOj7s 6g== 
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2109.outbound.protection.outlook.com [104.47.55.109])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hejp30h6k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 13:42:59 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oVaaZc6vHY2iOQIGAG0Kl1Sfq84z/UFLD33xWH2oKSjd9uBWISJwA56EysIg8B8hX9UIC38AMkMzilSj6VSnq7A0N1KY43GxFWAm15Sto/ZN+0qYHar7/hZK/Dl3sijMNe2Y+qqLTiZfrEXKAE8p0e3U3NCx+XBy7Twg5/XLQ5PW2TiTd7+ayN6AvoWZ8tmj4R8kBV/+EdtO9MZlM8vRzmEqzZ2ENsLMUB5vai9dNdXbECH2ClqzwB8UBxo8f35R7zX2xsHZ5o1RBnHEsaChXuDpvB6oWePol9GS7LzmGWzcgQRVRkUt4R/CXXxluceKiPhzBdBUa1viWOnFROK8/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0Z3PgzzNKO+ECJ6LxRKdBn5sBDda1/Bdh67Az7ggE0M=;
 b=cNuYLrQ7N8Ng/X3OrcgJFWq/soQwHn86c1FRtGIusADwcjavCrJ77omaXDNHi3DeBw8fGseBphlom+3TpuM1Z596r6l/ODjU7aSTEAdyhj4qHN1gelP97N9+Q6m8zH4PyJy6O10zBKxL1ORAHit47rDzuGKoqNg0fPFxuEe8YYqWqavPcQePePH90AZxB/OW7DiU8ZCMkton9T4Tv3zf5ZCqxbi0eHTevFJxiBmDh+PIgCqbiPZd3DqXSspk2MHTUMKDlj8tjSlDAd1e6fAtWt97eY38ieS9VaJtHybTjRbxLKVJ503nTGHdJaefDW1EJcFyRbAlb7mem2lp4TEl0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from MWHPR15MB1150.namprd15.prod.outlook.com (2603:10b6:320:2f::8)
 by BYAPR15MB3175.namprd15.prod.outlook.com (2603:10b6:a03:105::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 13:42:56 +0000
Received: from MWHPR15MB1150.namprd15.prod.outlook.com
 ([fe80::1024:8a31:a334:d02f]) by MWHPR15MB1150.namprd15.prod.outlook.com
 ([fe80::1024:8a31:a334:d02f%5]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 13:42:56 +0000
From: Nageswara R Sastry <nasastry@in.ibm.com>
To: Stefan Berger <stefanb@linux.ibm.com>,
        "kexec@lists.infradead.org"
	<kexec@lists.infradead.org>,
        "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>,
        "linux-integrity@vger.kernel.org"
	<linux-integrity@vger.kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v6 2/6] drivers: of: kexec ima: Support 32-bit platforms
Thread-Topic: [PATCH v6 2/6] drivers: of: kexec ima: Support 32-bit platforms
Thread-Index: AQHYkiXj22Dwly2W0U6QW94fZDqKFK2HWMHw
Date: Wed, 20 Jul 2022 13:42:55 +0000
Message-ID:  <MWHPR15MB1150F33F8C0E17420E0B18C1EB8E9@MWHPR15MB1150.namprd15.prod.outlook.com>
References: <20220707172026.831614-1-stefanb@linux.ibm.com>
 <20220707172026.831614-3-stefanb@linux.ibm.com>
In-Reply-To: <20220707172026.831614-3-stefanb@linux.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: fa9bfcca-5f69-4a5d-a3dc-08da6a55c07b
x-ms-traffictypediagnostic: BYAPR15MB3175:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  at65ZWWy0P1nUGGNgN/SS+OElgClNrc7jWa2AIY6h0TZCAYVqzO0GKANLbtRWn1YX2TEpgReBfmgZZ1N8Uq5YYN0UNxWh+lEMF5HiKBU2KS7lX8OfFQnPYMAXRxbOgV/4JLxIsTniD9N1T8k9H2Xr5lJ0j31+M0AEnzdcMuXI+wMd5Sn9+XfRV9w4voEfS7xIWK5RsBk5pcFp/DXwbTUawBIRCZJXsu44GcZ38iy4owJ1kgMc/z7HxGRWKmbTL25UwnsMkbCq3Qu8dMdk+Ky+t+aVppgI3/clz5o81JRbgn2zzH3jxG53r0p+1HiFCLS68Nw3M+PI7KvPYjWqarHmhj1+KuaKyAeXYKB9n6RdygXwqSbKNOJOHQHHXk8sjlDl/jvpcNeObbjLOHkHViqfOnWwbl6XRtAS+VG6YNhrqeQSXyl0xXAKhxVt/hVlqoeQtE5aTDTmEUiyI+c5r2NNBFDKnvLyf6Dc0b4S7nbkXocP6KKhAShPkxUbuIVazbSoieU+7a/ZU7aCoJW0salZASnAvclc/yX63/WsasQPm2U5tiEZbcbJVWCEwNU4ShS+cgpHvP6dozb/q/Y6g/2VLN1qtyJWSMa2CBvzi+z/QY5mfQP7dNZX251qA6RZ18H/Sp77wlN4gxSNQ/OvbhKGP01cI2+YPo8SZO4xCZgv/N9hIrSXb0wXUDgFFoNTGzDbhmsCfz0nGE4eCdDrCw/PszJKeTWiT95anWNC0BuQXYKrRYwk/Kevjnql9j1PGEDu3F5j/+zi1BQa5L3CynfysH/RNS2T/YmyUM8fAZ5a201Yq6WEhlJwIoM71UFKXx+
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR15MB1150.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(376002)(136003)(39860400002)(41300700001)(71200400001)(2906002)(4744005)(86362001)(52536014)(38070700005)(478600001)(7416002)(8936002)(5660300002)(122000001)(38100700002)(186003)(33656002)(110136005)(91956017)(316002)(54906003)(26005)(53546011)(55236004)(66946007)(6506007)(8676002)(66446008)(64756008)(4326008)(66556008)(66476007)(76116006)(83380400001)(9686003)(55016003)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?j9KRlAal3UPruzg56UaraeAYSf5tSKYJ7crG0grMp0+lY1pBt/xOsoIR6S?=
 =?iso-8859-1?Q?YTE3KmQf+TOrVMwEjVGO1F4SiJ04vawy6VwRIowPCXDDsejgFzCwmZ1eyq?=
 =?iso-8859-1?Q?qgbp+qhp2anrDUmJp/KpaAZJV5txYY1o0J7DOO1IPW8RRmIsomIP0HxFQw?=
 =?iso-8859-1?Q?v1vQ6iJ7YONV+LYNRv5rAJ6/4rC+cqmlVzdSZ1bJ2jky0LlHK3f9fR5fia?=
 =?iso-8859-1?Q?tdv7NPXTIq7p81sA5QItItlurD+ZVN6ydx8yZbeywxw2Jcntf+whTcvZ2W?=
 =?iso-8859-1?Q?SHTxY/MulQbsaJTtDV1HzJizgqxf2bjn65oqOm1cML/WTjbhPeZktKBURA?=
 =?iso-8859-1?Q?qvpagtXe87Jpp54nt+O2pOV5ESclLYWbSFyCOxV534B+1/iQA9LVgKFiTE?=
 =?iso-8859-1?Q?X8TOdDYl1WdmSm5hNxgOsHYDNHkZqDghrGAamhtIcMy7y8A51KQ83Pu3no?=
 =?iso-8859-1?Q?8pgUzEYiPWkD2LVVRj157Ah+c4M4QkSnC/yjmdtGLdjlghKZ4TggnS8PR4?=
 =?iso-8859-1?Q?0Bwhy8hGf+xflzXoU7Uq7C2k+zSAaqTe8prhH7IcgPzTx/BMDzId90qrrD?=
 =?iso-8859-1?Q?PwR2WPOOEpySkrPc3kbuNFZw5Dg7gD3SQVaNUNFWv+zhfGUJxP8FIkCoHc?=
 =?iso-8859-1?Q?1ZvHlcE6qqIbkCYLDPqc3lptjMiTbrzzJ9h2Rw9TOmAJnuJq/tj1aM609Q?=
 =?iso-8859-1?Q?D887rfn/T2zPWdHPFnl7+PdjZlQHgTTRbrlejhwRUANqrF/8iKH4yXC7e+?=
 =?iso-8859-1?Q?Yfez6+YgF0u0DFAoVoLm+knQVQi6BkSjB2gjZ5p9UbSlqGMtf8kkN1ADPT?=
 =?iso-8859-1?Q?ebbvO0F2XOAMyjqxOErYW+Z5/LpWUWhrrTZzCnLcbExlMP0dLdNr5Dyklx?=
 =?iso-8859-1?Q?LQHYGgtTbjgBDkEUUikIhh+gs8GXPWHJ9b1t44UAm2YbdnzoMkLAJ6nPs3?=
 =?iso-8859-1?Q?99HFxITpsHfl5iS5NMoFS+26QVLFGn1qtm/UVchWNYDOuvVvKdpKk+m5J5?=
 =?iso-8859-1?Q?XLX75GIiULnIQeitRDw7Vhf5bMdv9VrXPGXPJxsIr3LWR1SBOykvfI/3yT?=
 =?iso-8859-1?Q?GnRtO853dctwyFs/CgIXQoLN/hWw7JuFEWt+2KHxlro0R/z6DB2bFDHxht?=
 =?iso-8859-1?Q?JX9hhI+wp/bljyOn7pk8djW22FfG3QQiBcqjRPYk+5duDQy2b/Jynx0Baw?=
 =?iso-8859-1?Q?7BIGa8m6d+mVmPJ1AKA9wEz+9Dlu3glq18qStCb24K25l5ZTg+mKDvv0/9?=
 =?iso-8859-1?Q?+/udJ6vwjRbKqX7ZP4F3XKNRQu2DqHRGbgxNqBn5+EJqEWzPqR7vKYKnJG?=
 =?iso-8859-1?Q?8R71KqQs/qwbmcZ5V4yjfylBdqGDhj4Z+Nu1WbvYts1Jqyb66aZM8o7R7I?=
 =?iso-8859-1?Q?EKWIoFxBszIFJh18caCKCFB7wzX54O6LtKFdExSkX09XBqDb0M8NzPVlK1?=
 =?iso-8859-1?Q?HOlMCJuCtwaU9ajD0pZbnnMVlpFl6SDJsGgzQMHY27z0CDwkn2M8xASSJo?=
 =?iso-8859-1?Q?p00aj64fp6O7drscp/BOEqclC+u9Vc/diM/7uFeUQMDLlTt33YGoXBxGEf?=
 =?iso-8859-1?Q?64dDy2GMpxYOSIXnfanaWmXtV1rxFACJF7y+IhwuFxboBbOcN/5c031YWK?=
 =?iso-8859-1?Q?4gaB+X3vlvA6FQ4paFZ8/nHKOZ7Qtm5Nwk?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR15MB1150.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa9bfcca-5f69-4a5d-a3dc-08da6a55c07b
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 13:42:55.9970
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IzILBG2zOHPJpjj/vxJoBtx7IOiMEc2Ok8ZK/jcRDLMKMIR9ER9sMZhoihIwQGAU1WWUxlJOgY03XJDx2B5wTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3175
X-Proofpoint-GUID: k92eigvukG86VXH9sPMspgT6CuFwZApl
X-Proofpoint-ORIG-GUID: k92eigvukG86VXH9sPMspgT6CuFwZApl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_07,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxscore=0 malwarescore=0
 clxscore=1011 priorityscore=1501 mlxlogscore=999 bulkscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207200056
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
Cc: "nayna@linux.ibm.com" <nayna@linux.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>, Palmer Dabbelt <palmer@rivosinc.com>, Rob Herring <robh@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

=0A=
=0A=
________________________________________=0A=
> From: Stefan Berger <stefanb@linux.ibm.com>=0A=
> Sent: 07 July 2022 10:50 PM=0A=
> To: kexec@lists.infradead.org; devicetree@vger.kernel.org; linux-integrit=
y@vger.kernel.org; linux-kernel@vger.kernel.org; linuxppc-dev@lists.ozlabs.=
org=0A=
> Cc: nayna@linux.ibm.com; Nageswara R Sastry; mpe@ellerman.id.au; Palmer D=
abbelt; Rob Herring; Mimi Zohar=0A=
> Subject: [PATCH v6 2/6] drivers: of: kexec ima: Support 32-bit platforms=
=0A=
=0A=
> From: Palmer Dabbelt <palmer@rivosinc.com>=0A=
=0A=
> RISC-V recently added kexec_file() support, which uses enables kexec=0A=
> IMA.  We're the first 32-bit platform to support this, so we found a=0A=
> build bug.=0A=
=0A=
> Acked-by: Rob Herring <robh@kernel.org>=0A=
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>=0A=
> Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>=0A=
> ---=0A=
=0A=
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>=
