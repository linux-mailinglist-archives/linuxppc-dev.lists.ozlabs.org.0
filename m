Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF95569536
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 00:21:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LdYtH4SPVz3dpK
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Jul 2022 08:21:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=PcXqSsfz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fb.com (client-ip=67.231.153.30; helo=mx0a-00082601.pphosted.com; envelope-from=prvs=81867f175b=noodles@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=PcXqSsfz;
	dkim-atps=neutral
X-Greylist: delayed 3211 seconds by postgrey-1.36 at boromir; Thu, 07 Jul 2022 00:54:51 AEST
Received: from mx0a-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LdMyg2WV7z3bdk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Jul 2022 00:54:50 +1000 (AEST)
Received: from pps.filterd (m0089730.ppops.net [127.0.0.1])
	by m0089730.ppops.net (8.17.1.5/8.17.1.5) with ESMTP id 266AMhMW021477;
	Wed, 6 Jul 2022 07:00:47 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=z1x45iQd+SZqL4x6pqAuXViwc0hx/t4lmefz+z2TmBM=;
 b=PcXqSsfzQQHk1WsfQFQw2Z0lhWzCiqN7hpFOsfBxwfrs/u2o+E3pjbHLs09AHFpElX44
 pSnKqFDHZNzvYaexTsBfdyJC+5WWa0sZ5Fsly08SvMMV2ghxKkVpxneWXvOr/b581ah9
 p9bDW8NNMK9HfGfKKb+gBrL2KEcy00JdntU= 
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2177.outbound.protection.outlook.com [104.47.59.177])
	by m0089730.ppops.net (PPS) with ESMTPS id 3h4ucjncrv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 06 Jul 2022 07:00:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TRI4PMJzscQxya/t9mxGkGT4vy8n3e2yTXZhyfynjJPXz6TPT6cWDfuv+TG8w3mg/lhTG8Z7C+XHUjLqzNFrCPlzbRvPxuSEX6RzEIwCsvs0dY4mGYvNHfxzF+gc5sQhcSoiw+wJErHb6VMXVDCUUtQF7YYmUqnqCVrktrBQXz7H1shaGYsOWAoJBAuZH5skm312rOnWHTE1wWns39lY0VOgCgqYJ32ejUx0geu2Kuxc9QILQduDLyPNyvC7V3+fe42Vtuszv8VyDtScG71+D8IuHYw+17fKGmnddsBfM7+g4aA7mgep42z7UFden/+yTyPkRi/PiQ++WA1OfaLKCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ARXk1Y1Vuqu64i9LHwb+SL/jsef6JXVXaFOQStyCtHM=;
 b=GfpwrvsMBt5ECkhflvVL7Wdxl3ZnzXALKniiG1hQ8p35TlfRN3BUrJO0IqXF8baXchRi28hMQO3aOoMmycj8IHWcgUmRUEk3Tu4AfMUFHO53fYYyUv2qnfMANbAlVjv2kQDzkmTulAJ3SYX1yJG/ry/FpyFlie2DslfiO/nMUvqWPpv/+uGSxO6VCtoFxvM9DNXg1W3H01mOTy9UCuUfl9HLA0JBDD2vG5nbztN+3xCaQT9iVNFLrGJFwF5DaBEADd5C9+w3yX1VTKwpTQprzb54iBh7x1qA0+NCFbZ4QdTh2xUr90OjHi2UvPGs5G7L4gPz5qgLbTihd1i6riOKaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from SJ0PR15MB4552.namprd15.prod.outlook.com (2603:10b6:a03:379::12)
 by PH0PR15MB5071.namprd15.prod.outlook.com (2603:10b6:510:c7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Wed, 6 Jul
 2022 14:00:45 +0000
Received: from SJ0PR15MB4552.namprd15.prod.outlook.com
 ([fe80::81f9:c21c:c5bf:e174]) by SJ0PR15MB4552.namprd15.prod.outlook.com
 ([fe80::81f9:c21c:c5bf:e174%8]) with mapi id 15.20.5417.016; Wed, 6 Jul 2022
 14:00:44 +0000
From: Jonathan McDowell <noodles@fb.com>
To: Stefan Berger <stefanb@linux.ibm.com>
Subject: Re: [PATCH v4 4/5] of: kexec: Refactor IMA buffer related functions
 to make them reusable
Thread-Topic: [PATCH v4 4/5] of: kexec: Refactor IMA buffer related functions
 to make them reusable
Thread-Index: AQHYkMErYgOTAJp330m4YH5UOsaqI61xX/2A
Date: Wed, 6 Jul 2022 14:00:44 +0000
Message-ID: <YsWVfbMu85Cmwdgm@noodles-fedora.dhcp.thefacebook.com>
References: <20220701022603.31076-1-stefanb@linux.ibm.com>
 <20220701022603.31076-5-stefanb@linux.ibm.com>
 <47256afac54d68c23f0bdec257ffa26ddf1eb25d.camel@linux.ibm.com>
In-Reply-To: <47256afac54d68c23f0bdec257ffa26ddf1eb25d.camel@linux.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2eeb2b21-33ec-4b47-df1a-08da5f57eb6f
x-ms-traffictypediagnostic: PH0PR15MB5071:EE_
x-fb-source: Internal
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  umWSkseHLQwQ6Ccn8zIWDtn5YDuOsNky3F6H2GfGlCgdinASBDzVRFJoJxvJfDmGmkMH6sTPedTY2Ksq3NFn2MLoVEdlkGe6w/tcOTdMcd4fBi5t/9dHKN8z5eN1ZmY7+C4Zi9vpdn2tc0CiXtAgC4znx8Em3vYJQXhhd7WnibUjOSe4KyZI1bBrQwO6yCrsG9eJllJyRQ0ZzzpZDGt7lq6PhxGMP3Z0qVba1RyXKfGd+8MfrsnFYTZ/2zVBRZFuXla7cpiEfCsmj1wJhNviO0J7gwv4Yo0bcy4or7EAT3os1VDf2DMwU8avQrKVXULtFqh7se6lf6jzr4JQLWEGZwuuJXAiomcpZjScxC4/C+byQjxWtJksU9XW5Jv0dXme3KNDq/Ghvq1l0lvGOUTUZhpGFNwEXl8I3AUNTnh46Uyld1GmI8f8mwx47mfjPAW1IHwT0J5yGdF2dH9rfyFlD9AG+f6F7uGSHz9nDsnr0WVdn3spAo3edccbORilG98cPUt7o+P+CovDUVrUOgkWfqFlRJXCp04V7jGXEdyGlKbbvqXAi/2CVxyV6TPMEP83A+bwg2CkM9dMOeufYyJV3KfAJQ2hzwUpMj2foqr9Jjjv8O9SE7um2FNIF3gOk2+NcYX/C3CMZQ2OdGrC8NI3pVB5mykSF1p5gUnv7Sr3dAIVQM+rQfd3n5oFq5dNZPLKhUEP743TFp6WGDqye+giADdtXgLhbbBLpBw42OUyxrphDOjgs9I+0YF/ti6Dud4Dryd+LBccGk/b9ba/8+BJrA9+q5BJQK2da4HCWyzVifxtinNB5NZ6NzjanPdPSnI3ekp5hvo+o4AXDzvp8xDb2SiJtZdCvZSxy9kWqCpb1z4=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR15MB4552.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(136003)(346002)(376002)(396003)(39860400002)(366004)(8936002)(9686003)(6512007)(26005)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(66946007)(71200400001)(478600001)(76116006)(91956017)(7416002)(86362001)(6916009)(54906003)(5660300002)(316002)(2906002)(41300700001)(6506007)(186003)(6486002)(966005)(83380400001)(122000001)(38070700005)(38100700002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?/UdPMDwGKEYkMNA7yigW0x8DH+47RrCl0eKjmIptLcSjyyv+ez2DhBp1nOam?=
 =?us-ascii?Q?puBbbDGDdlz5lP6BKJMeuwbJa4YDYohwgUCRntkysFLLb55ELexK1Yj/0Rx5?=
 =?us-ascii?Q?7CFu1e9c1fnSrsOkc+5LxPevKcB3fZi8T+R8jOgTa7VYtcA1bpoqCMZQgq4e?=
 =?us-ascii?Q?YXOzd/fvuZE6D/udCG83ppg4WGxyg/kw5BO9TYgo7dLwxAhq9fUQ+9hgqZRH?=
 =?us-ascii?Q?O3sY0cq1Mg7fzGtLexFzt6nYH+U1sJrJX9E23Q/jY2xUZi92S/PLqemnOHW2?=
 =?us-ascii?Q?JD4kZsEVthJgLMDpjK9JqQaqh6MKb3HfhzIpmMv9NvdT43KSRKDXIycHE8q9?=
 =?us-ascii?Q?Wcj6NsAKHW38uNcgbRrTcDms/43HDCStr3o7sesSkRY0a244Kjkp4ZrzUuJZ?=
 =?us-ascii?Q?hpMMwMRpAUGvUOLT5jezUKFFloeIOUJIiQMo2baLYcGL4usubFik/E/cWnzf?=
 =?us-ascii?Q?RmHSlSy8qNYezu1MxGGGMz+CxSidvFFSQ4a7v1br4ksCVHHdYZ50e4sPDBGy?=
 =?us-ascii?Q?DE9eDdmU3/x7VcORQNcdFVGg7ZLwcrDh/ZQHHWx5impZPNRgvaZlK/XaTKii?=
 =?us-ascii?Q?9GO1r4dPkJjkWkSQy9tEmPLc/G6VHXdL5qmaqp5Ckh3XMNrk+gl9+mN9YbYJ?=
 =?us-ascii?Q?pXEquMRGLpy5kjw+THT7SOBBj2IyLTPXavJNodd3R7fCYqtNJdvXSvRqlvKB?=
 =?us-ascii?Q?y/TxNlnw7+pmvP0UoKk3Vb1Q3o1PipMiY+sZ8kGs4FRyJzZUiXVHqL9Kau7Z?=
 =?us-ascii?Q?AJ1YB9cv+4nV82tolaCcAr2KOQSRzFIrifXPsZlqvRcArZwhxwDzuWlnAkha?=
 =?us-ascii?Q?ig4euM0RaBeMt7S2dsd/ju24d8fuupcxVs4zqOPBPFZB/urhMGUDz0Ld2jtm?=
 =?us-ascii?Q?VjAA3ZfuvwwSL3husN5+6/fL4bWF90zVLhxS0fYxfaOodWTB4eYVykM3UxJd?=
 =?us-ascii?Q?R8T0p4dlaLgG6jvzdK7MpqFU3D64JMl2M8FIZ4Vke00y5cuXamcUZAidzrw9?=
 =?us-ascii?Q?ojCDu/VNvelYeqfN492zf3VMTjpGj8lGz3l9nF+Uc2u3MNYR4F98boXKV8KK?=
 =?us-ascii?Q?vNpdXMrebgxqNIxtl8QBsxxBvXrJnQ5YPm/5PVSAXqzYLgc6+wfmLqjtSZhb?=
 =?us-ascii?Q?IX+hLuXBwH5nrkuGQL6nk1/Rph0/4rMlr33vhSHTUhPAHXVXgv8o/mhcE/Y+?=
 =?us-ascii?Q?VCDALnYekvFuaBd51T127AonI2aor18lKBK7bWqx+hiH1nOqJDXKIEp3aJcn?=
 =?us-ascii?Q?BWXL5lMXhKYXFehy6vOvZSRTEyQB59A6vUGGuNhOYgZO2dfHpsFSn020Lk02?=
 =?us-ascii?Q?2Qhj+ZMOMuSzKMf8ERdHmXYmNlgVjO0UVZfGTPj8qix5ga3rzMiuqqbPYAD/?=
 =?us-ascii?Q?BCp0LRAoa6ZuiO6x7F2TMiA7p+j9UTuVGYll+BURkW4tPK9wVeuAQU9GQnBE?=
 =?us-ascii?Q?lGIpPm3Ndd4jIt1JbtmeH1eTzeTd+PTsqv2Gl21H41ziVwDYhzuWoU0nkcq/?=
 =?us-ascii?Q?gfIrvYVzpE2ALAoAxSv0JiJ4tPdmpi+ONpGrEu4BsUPw253HcSgTDO9ivaUd?=
 =?us-ascii?Q?AGlem5+/D54Mm8rzKVogXiC8L/5jR71Vm2yWKfkx?=
Content-Type: text/plain; charset="us-ascii"
Content-ID: <3DCCC94782084E419D9F1409E28AFED5@namprd15.prod.outlook.com>
X-OriginatorOrg: fb.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR15MB4552.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eeb2b21-33ec-4b47-df1a-08da5f57eb6f
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jul 2022 14:00:44.2492
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4DGpyowW2tvBdg578hLVwdqsJLWHVFveRKo1gL4GfKt/PSNelpiFTOAXcQxJaEBT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR15MB5071
X-Proofpoint-GUID: I9DaYvd6LKX_P8-q3vpa3gnJ2EQN8N29
X-Proofpoint-ORIG-GUID: I9DaYvd6LKX_P8-q3vpa3gnJ2EQN8N29
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-06_08,2022-06-28_01,2022-06-22_01
X-Mailman-Approved-At: Thu, 07 Jul 2022 08:18:29 +1000
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Frank Rowand <frowand.list@gmail.com>, "nayna@linux.ibm.com" <nayna@linux.ibm.com>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Mimi Zohar <zohar@linux.ibm.com>, Rob Herring <robh+dt@kernel.org>, "nasastry@in.ibm.com" <nasastry@in.ibm.com>, "linux-integrity@vger.kernel.org" <linux-integrity@vger.kernel.org>, Borislav Petkov <bp@suse.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 05, 2022 at 06:46:54PM -0400, Mimi Zohar wrote:
> [Cc'ing Borislav Petkov <bp@suse.de>, Jonathan McDowell <noodles@fb.com
> >]
>=20
> Hi Stefan,
>=20
> On Thu, 2022-06-30 at 22:26 -0400, Stefan Berger wrote:
> > Refactor IMA buffer related functions to make them reusable for carrying
> > TPM logs across kexec.
> >=20
> > Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Frank Rowand <frowand.list@gmail.com>
> > Cc: Mimi Zohar <zohar@linux.ibm.com>
>=20
> Refactoring the ima_get_kexec_buffer sounds good, but there's a merge
> conflict with Jonathan McDowell's commit "b69a2afd5afc x86/kexec: Carry
> forward IMA measurement log on kexec".
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/=
drivers/of/kexec.c

None of this looks difficult to re-do on top of my changes that are in
-next; the only thing to watch out for is a couple of functions have
moved into the __init section but that looks appropriate for your TPM
log carry-over too.

> > ---
> > v4:
> >  - Move debug output into setup_buffer()
> > ---
> >  drivers/of/kexec.c | 131 ++++++++++++++++++++++++++-------------------
> >  1 file changed, 76 insertions(+), 55 deletions(-)
> >=20
> > diff --git a/drivers/of/kexec.c b/drivers/of/kexec.c
> > index c4f9b6655a2e..0710703acfb0 100644
> > --- a/drivers/of/kexec.c
> > +++ b/drivers/of/kexec.c
> > @@ -115,48 +115,59 @@ static int do_get_kexec_buffer(const void *prop, =
int len, unsigned long *addr,
> >  	return 0;
> >  }
> >=20=20
> > -/**
> > - * ima_get_kexec_buffer - get IMA buffer from the previous kernel
> > - * @addr:	On successful return, set to point to the buffer contents.
> > - * @size:	On successful return, set to the buffer size.
> > - *
> > - * Return: 0 on success, negative errno on error.
> > - */
> > -int ima_get_kexec_buffer(void **addr, size_t *size)
> > +static int get_kexec_buffer(const char *name, unsigned long *addr, siz=
e_t *size)
> >  {
> >  	int ret, len;
> > -	unsigned long tmp_addr;
> >  	unsigned long start_pfn, end_pfn;
> > -	size_t tmp_size;
> >  	const void *prop;
> >=20=20
> > -	if (!IS_ENABLED(CONFIG_HAVE_IMA_KEXEC))
> > -		return -ENOTSUPP;
> > -
> > -	prop =3D of_get_property(of_chosen, "linux,ima-kexec-buffer", &len);
> > +	prop =3D of_get_property(of_chosen, name, &len);
> >  	if (!prop)
> >  		return -ENOENT;
> >=20=20
> > -	ret =3D do_get_kexec_buffer(prop, len, &tmp_addr, &tmp_size);
> > +	ret =3D do_get_kexec_buffer(prop, len, addr, size);
> >  	if (ret)
> >  		return ret;
> >=20=20
> > -	/* Do some sanity on the returned size for the ima-kexec buffer */
> > -	if (!tmp_size)
> > +	/* Do some sanity on the returned size for the kexec buffer */
> > +	if (!*size)
> >  		return -ENOENT;
> >=20=20
> >  	/*
> >  	 * Calculate the PFNs for the buffer and ensure
> >  	 * they are with in addressable memory.
> >  	 */
> > -	start_pfn =3D PHYS_PFN(tmp_addr);
> > -	end_pfn =3D PHYS_PFN(tmp_addr + tmp_size - 1);
> > +	start_pfn =3D PHYS_PFN(*addr);
> > +	end_pfn =3D PHYS_PFN(*addr + *size - 1);
> >  	if (!page_is_ram(start_pfn) || !page_is_ram(end_pfn)) {
> > -		pr_warn("IMA buffer at 0x%lx, size =3D 0x%zx beyond memory\n",
> > -			tmp_addr, tmp_size);
> > +		pr_warn("%s buffer at 0x%lx, size =3D 0x%zx beyond memory\n",
> > +			name, *addr, *size);
> >  		return -EINVAL;
> >  	}
> >=20=20
> > +	return 0;
> > +}
> > +
> > +/**
> > + * ima_get_kexec_buffer - get IMA buffer from the previous kernel
> > + * @addr:	On successful return, set to point to the buffer contents.
> > + * @size:	On successful return, set to the buffer size.
> > + *
> > + * Return: 0 on success, negative errno on error.
> > + */
> > +int ima_get_kexec_buffer(void **addr, size_t *size)
> > +{
> > +	int ret;
> > +	unsigned long tmp_addr;
> > +	size_t tmp_size;
> > +
> > +	if (!IS_ENABLED(CONFIG_HAVE_IMA_KEXEC))
> > +		return -ENOTSUPP;
> > +
> > +	ret =3D get_kexec_buffer("linux,ima-kexec-buffer", &tmp_addr, &tmp_si=
ze);
> > +	if (ret)
> > +		return ret;
> > +
> >  	*addr =3D __va(tmp_addr);
> >  	*size =3D tmp_size;
> >=20=20
> > @@ -191,72 +202,82 @@ int ima_free_kexec_buffer(void)
> >  	return memblock_phys_free(addr, size);
> >  }
> >=20=20
> > -/**
> > - * remove_ima_buffer - remove the IMA buffer property and reservation =
from @fdt
> > - *
> > - * @fdt: Flattened Device Tree to update
> > - * @chosen_node: Offset to the chosen node in the device tree
> > - *
> > - * The IMA measurement buffer is of no use to a subsequent kernel, so =
we always
> > - * remove it from the device tree.
> > - */
> > -static void remove_ima_buffer(void *fdt, int chosen_node)
> > +static int remove_buffer(void *fdt, int chosen_node, const char *name)
> >  {
> >  	int ret, len;
> >  	unsigned long addr;
> >  	size_t size;
> >  	const void *prop;
> >=20=20
> > -	if (!IS_ENABLED(CONFIG_HAVE_IMA_KEXEC))
> > -		return;
> > -
> > -	prop =3D fdt_getprop(fdt, chosen_node, "linux,ima-kexec-buffer", &len=
);
> > +	prop =3D fdt_getprop(fdt, chosen_node, name, &len);
> >  	if (!prop)
> > -		return;
> > +		return -ENOENT;
> >=20=20
> >  	ret =3D do_get_kexec_buffer(prop, len, &addr, &size);
> > -	fdt_delprop(fdt, chosen_node, "linux,ima-kexec-buffer");
> > +	fdt_delprop(fdt, chosen_node, name);
> >  	if (ret)
> > -		return;
> > +		return ret;
> >=20=20
> >  	ret =3D fdt_find_and_del_mem_rsv(fdt, addr, size);
> >  	if (!ret)
> > -		pr_debug("Removed old IMA buffer reservation.\n");
> > +		pr_debug("Remove old %s buffer reserveration", name);
> > +	return ret;
> >  }
> >=20=20
> > -#ifdef CONFIG_IMA_KEXEC
> >  /**
> > - * setup_ima_buffer - add IMA buffer information to the fdt
> > - * @image:		kexec image being loaded.
> > - * @fdt:		Flattened device tree for the next kernel.
> > - * @chosen_node:	Offset to the chosen node.
> > + * remove_ima_buffer - remove the IMA buffer property and reservation =
from @fdt
> >   *
> > - * Return: 0 on success, or negative errno on error.
> > + * @fdt: Flattened Device Tree to update
> > + * @chosen_node: Offset to the chosen node in the device tree
> > + *
> > + * The IMA measurement buffer is of no use to a subsequent kernel, so =
we always
> > + * remove it from the device tree.
> >   */
> > -static int setup_ima_buffer(const struct kimage *image, void *fdt,
> > -			    int chosen_node)
> > +static void remove_ima_buffer(void *fdt, int chosen_node)
> > +{
> > +	if (!IS_ENABLED(CONFIG_HAVE_IMA_KEXEC))
> > +		return;
> > +
> > +	remove_buffer(fdt, chosen_node, "linux,ima-kexec-buffer");
> > +}
> > +
> > +#ifdef CONFIG_IMA_KEXEC
> > +static int setup_buffer(void *fdt, int chosen_node, const char *name,
> > +			phys_addr_t addr, size_t size)
> >  {
> >  	int ret;
> >=20=20
> > -	if (!image->ima_buffer_size)
> > +	if (!size)
> >  		return 0;
> >=20=20
> >  	ret =3D fdt_appendprop_addrrange(fdt, 0, chosen_node,
> > -				       "linux,ima-kexec-buffer",
> > -				       image->ima_buffer_addr,
> > -				       image->ima_buffer_size);
> > +				       name, addr, size);
> >  	if (ret < 0)
> >  		return -EINVAL;
> >=20=20
> > -	ret =3D fdt_add_mem_rsv(fdt, image->ima_buffer_addr,
> > -			      image->ima_buffer_size);
> > +	ret =3D fdt_add_mem_rsv(fdt, addr, size);
> >  	if (ret)
> >  		return -EINVAL;
> >=20=20
> > -	pr_debug("IMA buffer at 0x%pa, size =3D 0x%zx\n",
> > -		 &image->ima_buffer_addr, image->ima_buffer_size);
> > +	pr_debug("%s at 0x%pa, size =3D 0x%zx\n", name, &addr, size);
> >=20=20
> >  	return 0;
> > +
> > +}
> > +
> > +/**
> > + * setup_ima_buffer - add IMA buffer information to the fdt
> > + * @image:		kexec image being loaded.
> > + * @fdt:		Flattened device tree for the next kernel.
> > + * @chosen_node:	Offset to the chosen node.
> > + *
> > + * Return: 0 on success, or negative errno on error.
> > + */
> > +static int setup_ima_buffer(const struct kimage *image, void *fdt,
> > +			    int chosen_node)
> > +{
> > +	return setup_buffer(fdt, chosen_node, "linux,ima-kexec-buffer",
> > +			    image->ima_buffer_addr, image->ima_buffer_size);
> >  }
> >  #else /* CONFIG_IMA_KEXEC */
> >  static inline int setup_ima_buffer(const struct kimage *image, void *f=
dt,=
