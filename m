Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 767A957B7A5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 15:42:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LnxjB2QmYz3chT
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 23:42:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SXAOlAbJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nasastry@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SXAOlAbJ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnxhL4sTxz2xt3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 23:42:10 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KDTooT003951;
	Wed, 20 Jul 2022 13:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ceae2RFmF5KznbMBiZv8OUYGP49kcO0YzT3TQXSYO+w=;
 b=SXAOlAbJKmWdKEYRPLAuQfFyVkUMdm3VBIO4vNEHzzZjCfTCgNHYpR4EsvCSnhDL4xAT
 G8mMqkYJEsShTTSDJJMo+gOuYyXJ6vpFSBAiSv3WPw0WXARpbGSMoXDl14iedNxEMP3L
 1+Cgp+Ne6bbYbgXPDSU6d3+mEozlt6hdwLj6yhB6UzlGMfQMjNsqLVZCXSaYaBIBFdGK
 GsMPlwUISnaTRXiO9BVJeBNNpT7AMq0LqZuRdl38nLeDsUHqzgTAuh0nFs/wI4QZOCQI
 GQbYHJ1VgMs+b+N7g0l+unYTaazv8C3QPFFZidfZ3LreRIQt8kygJigbL97lBl6F8qsj 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hejn2ghc3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 13:41:50 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26KDTq7d004207;
	Wed, 20 Jul 2022 13:41:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hejn2ghbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 13:41:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bngAT2SIJIaUowCLsXtOzjvU00nsYHtYnzJfNIEkI7mDfoi2pYDIAeNlTPOw1YQpi6CSxUJfOzg7TGZudF/zGt0wD6Enb7ZAfNMu0WhGXD+RyyYdP1L5SVrqlclxHCK3fjmyxh/UNPA4jCuWCiQnKouPK7LXgxSGfpx9H1MBVQNk456MVpfLlD7iQo3JFV98tOI6Nru6TVOiiLZ9H85qaLxwprLcaYADnRFW1bsbNsd41tD1vVEUwuO6y8+td/xAaoNF6DJEz2o/R+Y9DJ0LcoT25UbINld0sqoFpHSxIxT+jAGeifYsTwJx2bbdCn9KM4mE2fyvmna+iieNF3bTgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t6IIZehMPnx+JOAb1VuZZg7T4R2iW1WxUrEYhTFuTjI=;
 b=hWEn5ZFkKFjcAXIyNTff9ZcRVT6OAY6gVJwBYbAPRMicM/AFbbEKxby6H0UG4Q2Fu2o70IljKWjTxvn5VtUsYapESEjzzHkNqWn9Drq/Tx+TUQqmHbiEeWS5vkp79AA1D7gtCPXmpUCNZqN7lZXmDShhCA0QK3dUHBRLUDy/TtIPjtunx2EDEjHOSY1T0wY2CRRiWIe5g9NhydMgOWT5ssG8r58+hsp1vld/zv8IY6evhFsDH66LoZ2VT6DNInh60CI2yVgpCnqSaHCrhLpUHxQWw3ykLrCN1RLKt9sClirtslcSgsCXXnZQ+5OnR7T8gf3KSbekyB8oo0znM5iuGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from MWHPR15MB1150.namprd15.prod.outlook.com (2603:10b6:320:2f::8)
 by BYAPR15MB3175.namprd15.prod.outlook.com (2603:10b6:a03:105::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.18; Wed, 20 Jul
 2022 13:41:47 +0000
Received: from MWHPR15MB1150.namprd15.prod.outlook.com
 ([fe80::1024:8a31:a334:d02f]) by MWHPR15MB1150.namprd15.prod.outlook.com
 ([fe80::1024:8a31:a334:d02f%5]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 13:41:47 +0000
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
Subject: Re: [PATCH v6 1/6] of: check previous kernel's ima-kexec-buffer
 against memory bounds
Thread-Topic: [PATCH v6 1/6] of: check previous kernel's ima-kexec-buffer
 against memory bounds
Thread-Index: AQHYkiXjWJEZuDUJsU+IRCFzgEiaGq2HWCz2
Date: Wed, 20 Jul 2022 13:41:47 +0000
Message-ID:  <MWHPR15MB11506BA4D2AE5E3F5B4D608CEB8E9@MWHPR15MB1150.namprd15.prod.outlook.com>
References: <20220707172026.831614-1-stefanb@linux.ibm.com>
 <20220707172026.831614-2-stefanb@linux.ibm.com>
In-Reply-To: <20220707172026.831614-2-stefanb@linux.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 577a60fb-84ae-4274-1e13-08da6a5597a8
x-ms-traffictypediagnostic: BYAPR15MB3175:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Bg6nhpXXB+W1CU8fTiMG+M8wwwCjxmmeuKMNy1dKO4WV4hCoa+jMK6V+vay7A6BfbHvrK0QWG8MiNcIjaCBTgEuD0RAfs1UjiXkEAVW4+BKpE7ng3nb6OHhFOD4UeR7GVJqVcewPdAhZdT4Mb5ivVJgQ2kmVRSugYbQzwxPFy4AjkyZb6r3yAabQO7pOcITCBLc5a+3araIaHFzpU8+sxDSL2PLF2n1JqV7Vm91kCEbrpd6pyHVonCzMwly0zoD4mFy6Lcb8cHZmPtjN5xkSaAUKGkfpCvqOaVlcgBPme4c3vQggvTZmv/OaScFST+3g4MIn5/FuDnWv8jXoheLNbaqw+58cw35MmumB4boSXuwX2TI9QkBPM0ryAk/r0/CAOblgSEZu2c1c5q0msO1mzSamB6TgBWeV/YIojC1kIq5ddvznJjKzkOTE80VxL3ClaOOvrIAHxn+izAkZq9eehIXWL5CpGURXc0VnW58VvYN1ApqdCgQ+BtKNjh2LWQWpv10kN39h6+DoNpc3kPJp0vCLKe0YJ086vo4eR+Nbjw4CBfEUEPIjcLTrH0rbTxN6exQ5zyCIWgzOVMhjyFBjqebEHMXTVs1shEExOdylA9sJNFVx6AD82A7dFo2gEqw8Je/Z5yYA2pb14a0QDzaRYn4I6zgbBH2jkYsNJYwbq9MNJjdp9Oj1vfDvUZddwUu3TzXKEeutCaEwN5CVwf/7a+grBMVZKRRAsjFAUb0jXwRyOLXYqIjlzaztQIG38GE1UEQwO6QiKDPlEmx9yvC3DryINh15FUo+kFQV/cb406IqObCyo0XKVDqi8Kkx6sq3MU7N1oSfPSp3aJ/j9uSKXg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR15MB1150.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(396003)(366004)(346002)(376002)(136003)(39860400002)(41300700001)(71200400001)(2906002)(4744005)(86362001)(52536014)(38070700005)(478600001)(7416002)(8936002)(5660300002)(122000001)(38100700002)(966005)(186003)(33656002)(110136005)(91956017)(316002)(54906003)(26005)(53546011)(55236004)(66946007)(6506007)(8676002)(66446008)(64756008)(4326008)(66556008)(66476007)(76116006)(83380400001)(9686003)(55016003)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?BKBfC6HDGP6mstRdWJVNA0Bvz6ml2WIY/craY4Od6k2x1dPg4cyTLi+uXT?=
 =?iso-8859-1?Q?iK/F7e6t8GsA3chyOP6CRjWuIv5gBkP8moSrby82ODa4bjL5hhAWX39Mv4?=
 =?iso-8859-1?Q?UBqGltrohR9hwqkWCtU8V7rnWhhR0yFrwkJUVC2jhYIWmNDATea+Q9DcYK?=
 =?iso-8859-1?Q?jL8PNL1fwWS0T+udfwyxXl2PC1kc/VT32HG3LN1IHFE91S4CN+e6tec954?=
 =?iso-8859-1?Q?SbF5MawSA65417wPvjYpMiZZyWHATHAR/bsdGkMApowZ3fZWhg8Eg5aKiV?=
 =?iso-8859-1?Q?Pu2zRi5mwfBwq2cJa0wiSy1iFOeTO8O+HJbcCSnf9F/09vPWuecHpddpZO?=
 =?iso-8859-1?Q?KUayiOZPqWDvW7jg8HfxRllGIGbQuN8Z0XQ2YQksYJCNNhsQ1iXOhspVYs?=
 =?iso-8859-1?Q?qtOozvdoqxyPdIe9/Lq7hwmlDu0sb00j4HSGlKv+UAWObcF1CziEvfoZ65?=
 =?iso-8859-1?Q?QqAhR1gv2G2v4lvT3RHIUyLIEaoBJHnYEN4EddttYoXBrl3vBvzzmHIVsU?=
 =?iso-8859-1?Q?CefETNnN+NHGFBOp1KCnXnWIn+WlcU+qgQrplKfzx8+7oFy7E0eqoB9lzv?=
 =?iso-8859-1?Q?C6iK/QZjTbeUfO1UkrctYCU+tQzohpWBerq1N2o7UlOyMipcIiMXGhDqG0?=
 =?iso-8859-1?Q?FtVbsk1km6wDZooFqTCETSgLfudHYCOH4mvuq67+oEuOz7luJ337y28OBZ?=
 =?iso-8859-1?Q?PRdxsQS49JeR2D4QTULxiwmB/2cyk2dadc578+GxPK+O/v6fWd2K0bdhmS?=
 =?iso-8859-1?Q?cWg4GjMwl7gAb5v/OEc6QtDriscenCkvgGf3WYUP+o8F6RwTnSEAFwNG1H?=
 =?iso-8859-1?Q?/+Cw/v2bQScvdvEsF7gdiEJt56fss14ZhayQnk2GHG6b+a2q89aoPqkvdy?=
 =?iso-8859-1?Q?J4kVONkwYzzvkDuwEbidjcIFK501PxpEJcw1/gSBlybkz1rtc7Dn8OIB4x?=
 =?iso-8859-1?Q?O3QUb3rwqt1wMoB8gcQOfPROGNtJzdkGxUTyXDNLPcKCNlwOwnydMCEb++?=
 =?iso-8859-1?Q?AbKUkB8KtJe//PhiOZGmYGe/+ehYm2o3tx4nxILG8iGuIRFloocEYYUlDW?=
 =?iso-8859-1?Q?GktcISjizdKoS5kpqP+MpftIBSowqQxfPsUOaH1ZAk8XdC7fS5w7JRbmpH?=
 =?iso-8859-1?Q?so8q2v+uI1a6covtMptujki9hRZlLQJraLYLQ4zRV1xN7lUEcB/letUuHz?=
 =?iso-8859-1?Q?iHCI/SE8NvruMTvJ6VxehTatDAuYDU5Q3lQRK0VA6HD30HsyDpZKFukBJg?=
 =?iso-8859-1?Q?YL0FnLBAIH3imB1ZyW6Omi9xkKUCxbJ4lUSjTwghjuAjGiGmkxyfH/30cv?=
 =?iso-8859-1?Q?N5Ka7tKD1pCKgwqcx3pCHz1Zaoue1LnpKgAfdeLD1QOHZfn3AsJNhL+gjB?=
 =?iso-8859-1?Q?f0LoMesFV2NED2w+6Ukh8l4bweIscjD+I8IPdhH1Ze6YAm3ehCCIo6iUNu?=
 =?iso-8859-1?Q?SNmDg+2AAXv3Wurm9qs3yH/EF932EXVkKUUA1VD5pDDu8fzFDmcoLJaWuP?=
 =?iso-8859-1?Q?lgcjCkjLoB7PQK4ezNTRUicG7QG6xoGa3R3pJftJZI536FV1LLuJwTRXTy?=
 =?iso-8859-1?Q?BxnQfWlJpNMTEodGxS0/A7IhXWbHDvkL8sfyZlBdmS5c4e2OKzcZmIIyI2?=
 =?iso-8859-1?Q?JcPaOJy2AHLNTMTJOXnS3ELGDdBQPxXSlr?=
Content-Type: text/plain; charset="iso-8859-1"
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR15MB1150.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 577a60fb-84ae-4274-1e13-08da6a5597a8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 13:41:47.5332
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dUf+FJ0km9khTXK6BmuVe1GijAC1ACQjQw6bZxIjaAp+UFb2PQ5S3QFsEJyty0Qk8M+PqC+UzgGst2niAKzo6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR15MB3175
X-Proofpoint-GUID: H5xuyK7f5NT5RTWAoT7E-BZUMi5-Nt44
X-Proofpoint-ORIG-GUID: xkkELs9ZHme4F-PHSqiZfyZJboTOXc7B
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_07,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=932 spamscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 adultscore=0 clxscore=1011 phishscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207200056
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
Cc: Rob Herring <robh@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>, "nayna@linux.ibm.com" <nayna@linux.ibm.com>, Robin Murphy <robin.murphy@arm.com>, Prakhar Srivastava <prsriva@linux.microsoft.com>, Lakshmi Ramasubramanian <nramas@linux.microsoft.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, Frank Rowand <frowand.list@gmail.com>, Thiago Jung Bauermann <bauerman@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



________________________________________
> From: Stefan Berger <stefanb@linux.ibm.com>
> Sent: 07 July 2022 10:50 PM
> To: kexec@lists.infradead.org; devicetree@vger.kernel.org; linux-integrit=
y@vger.kernel.org; linux-kernel@vger.kernel.org; linuxppc-dev@lists.ozlabs.=
org
> Cc: nayna@linux.ibm.com; Nageswara R Sastry; mpe@ellerman.id.au; Vaibhav =
Jain; Frank Rowand; Prakhar Srivastava; Lakshmi Ramasubramanian; Thiago Jun=
g Bauermann; Rob Herring; Ritesh Harjani; Robin Murphy
> Subject: [PATCH v6 1/6] of: check previous kernel's ima-kexec-buffer agai=
nst memory bounds

> From: Vaibhav Jain <vaibhav@linux.ibm.com>

...

> Fixes: 467d27824920 ("powerpc: ima: get the kexec buffer passed by the pr=
evious kernel")
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Prakhar Srivastava <prsriva@linux.microsoft.com>
> Cc: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Ritesh Harjani <ritesh.list@gmail.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
> Link: https://lore.kernel.org/r/20220531041446.3334259-1-vaibhav@linux.ib=
m.com
> ---

Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>=
