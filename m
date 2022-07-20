Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4170257B7D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 15:47:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lnxq02BV3z3c4c
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 23:47:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JZGa6UnI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=in.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=nasastry@in.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=JZGa6UnI;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LnxpF1FdYz2yQj
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 23:47:16 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26KDcoWK031154;
	Wed, 20 Jul 2022 13:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=mu0s/qbPW9Y4E7sTzttXCR/1jF4FWJKL9i33wQGmlt4=;
 b=JZGa6UnIIzTVPvjRN8f6nJb9vzJ2wIUOkFl+WhzplYKby2XqvL5sDnr2jCnUui32zkkb
 EfKSl6UJcF5/u5BdZ03q4eBLM1A9KKaVnvyfF3CEyjN2UhvZjKG+oOKKIAJ+bhy6kdyl
 hoe5s09UGb6dTJVSwqJeHszdmG+KU2px3rQInpv5LZMZKJ5ZmJE8wENR9Fg/o+tD1Q4e
 6SbUfEvcSbSKkIa/fTgZF8v+fh9sBh222lHt5rnHPbuTi0pGmUDPaHTZKryx69Cbei/h
 8d7tRVhw+QzoXFiAnRKqZiMR5pySh29h+sJHqLOqVz1puXem6wAomOlSDhk2ZEnNiEm5 mA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hejs88ftf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 13:47:07 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26KDdumN005167;
	Wed, 20 Jul 2022 13:47:06 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2043.outbound.protection.outlook.com [104.47.56.43])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3hejs88fsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Jul 2022 13:47:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WQzmhkktjQI0lE7cAm5U6QG6BcLHE9IwUb4iAL0OEPpzOoQkqFbdtL3vZIjE0wIcI/83ayfWyx3BlHANZMclRMPtdlRll9QW2ASdVDRi7PJvwdi31/na6SdPIJBt1Xr+9Q2Kp0x3EDxzO9dZIg7bDsdgmU8cpPeVthDEv22aIo8M4ynBU1VErq+/8twU8XKxwxnn1MBSbWhB7E9lYUJY7qpQdVFqmVuOhe3fRHSwJKz2d98ShwMsCOrFDKxz75z80fkOITrYN7BhIKj4Luftop98d9Q6+DjOOibAQd1FIYuB6mvwV9QDMmc+elxtdMOiYeF4vrw3wWhzO6Hu/Mks3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mu0s/qbPW9Y4E7sTzttXCR/1jF4FWJKL9i33wQGmlt4=;
 b=Nt7brXam3JYkynubxr9WyRByhwXYFZJQa+bc7KaDz7yujurw2nnzoS9y5j37fNKyEPy1CE/I0cUOp8FFSb9JMOeknVSWnHX8XufwtZ9QcPiLzuv+jyDIhKppKWet0/pgPSydwPOP/b0OKT7xdfNuoJHZsZvml1I1aDS4Otw7JQllYqHAKzMoWxH716//3p9W9GXCz+lHIO3jM6/HuF67p64TVxeYaqez0Ci2WcqWiT5kkVlIsNPZQU63nT9lBnaH6GqutNbNoloX+148s+yJhG8H+u7vGm/3m6fEOfiqeiMQo2CSepfT1nrgOxRmfDKijT+ZAtSAS5C8Nsn6BwFIYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in.ibm.com; dmarc=pass action=none header.from=in.ibm.com;
 dkim=pass header.d=in.ibm.com; arc=none
Received: from MWHPR15MB1150.namprd15.prod.outlook.com (2603:10b6:320:2f::8)
 by DM6PR15MB2298.namprd15.prod.outlook.com (2603:10b6:5:88::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5438.24; Wed, 20 Jul
 2022 13:47:03 +0000
Received: from MWHPR15MB1150.namprd15.prod.outlook.com
 ([fe80::1024:8a31:a334:d02f]) by MWHPR15MB1150.namprd15.prod.outlook.com
 ([fe80::1024:8a31:a334:d02f%5]) with mapi id 15.20.5458.018; Wed, 20 Jul 2022
 13:47:03 +0000
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
Subject: Re: [PATCH v6 5/6] of: kexec: Refactor IMA buffer related functions
 to make them reusable
Thread-Topic: [PATCH v6 5/6] of: kexec: Refactor IMA buffer related functions
 to make them reusable
Thread-Index: AQHYkiXmWCOr6WKvA0q6Srmq7aT9nK2HWeTP
Date: Wed, 20 Jul 2022 13:47:03 +0000
Message-ID:  <MWHPR15MB11502634A3875AB91BF8C02CEB8E9@MWHPR15MB1150.namprd15.prod.outlook.com>
References: <20220707172026.831614-1-stefanb@linux.ibm.com>
 <20220707172026.831614-6-stefanb@linux.ibm.com>
In-Reply-To: <20220707172026.831614-6-stefanb@linux.ibm.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 83a1671a-f987-408e-eb3c-08da6a5653e8
x-ms-traffictypediagnostic: DM6PR15MB2298:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  Y7wBMbHM2U6jI326m3XMFTAMT5btEnmYBVF4/nI2QRhqhfcGCwXjVwtJ1Aan0vZ2tEoWWPOQgrfPmGPOObNVigRX0OFM4Vgo1PKX1BMJGOwfuCsHSH/+X0CbkZlRlgcYWL2u8fBwZk2046LXe/6Dw/jqIVNA7oVs+2Tmg9cBUpdp1v5ZZtNVaFWk3hZLmdnLD+aMRkvPg6d4fRpaRiyadfHTg449JLC/XwgvrqXcHcniEcbV/6EHpXSmdNkdbzoTcOwmcOMHnat1CldTdGxzJHkDP9yefphIwF8K3YFoLljKuBGcuLwZmG1vj2qSCAUSCf5uLGDoo27IuRxFJo4QoIaDJaMOudhpQ3omUQJw3tS3+YLBTx+MPFY+DYtvTxBKf0CjD9hyg8XCpQF18jKWQzB2MjxCpQjujjK9QlvA6Lrem0u8loQHSQEEvh2TqI6c/Eu/D7PNEuE1YjuxRSC2xJ0YXYdQgQFb0lss2aoIPN51K9ahYvy8kuxDZs+WsUHyVmLe/LQyqLi1o7MjSzy/n89sHcGf4/tygYf5xWdgOYDetTvMsTMWl70ZLdKOe21qU7Sl9QQy58p1mSpNm4AVuH8UAhCJ0JPKcwZvm2HYneUGsQYSUTiRsX3uGWnJ4GmIxuXpU6YYvGLw5wJKKo89tMv6W8EuJ3Xw/dMPLnQFv58E9nFH7kN5Fy9rDT5ZAT5Qh1tZ6UXmok73VXsIvnED8hMIq34DhkmJMlCzDCvi3xcCdu94Bin3oBL7ps4ps22XzlXL+y9GycUSdxcYBDptHHGhxZ/AFm9+dVNF8DhqpAakEo22arAd+qF3Q6K/hhxB
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MWHPR15MB1150.namprd15.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(366004)(346002)(376002)(396003)(39860400002)(8936002)(66556008)(64756008)(186003)(86362001)(76116006)(66446008)(66476007)(83380400001)(7416002)(38100700002)(122000001)(4744005)(38070700005)(2906002)(5660300002)(55016003)(26005)(6506007)(52536014)(53546011)(7696005)(110136005)(316002)(41300700001)(8676002)(55236004)(9686003)(33656002)(4326008)(478600001)(91956017)(66946007)(71200400001)(54906003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?tijq+l6pQO15MxGQYSz32PTbfJOUP04siIJeOyQ7MxcWGgLz4FJg8D3C4s?=
 =?iso-8859-1?Q?5KvQhyaQFv9ITy5D3qKVs7x71xpyHJCie45jHNaizdY8C1/8FRLRzYzKgG?=
 =?iso-8859-1?Q?XXVgFRRUwv9KwduE5h2GBuCggW7s77PEWeQu2NolZPVrTnz/h7GTGoBSn1?=
 =?iso-8859-1?Q?QMLp6Cs7FzWCOML0zSZulVKcOpKN0RRYmMCPh/yZoDb7iNxPtcbB+KYaTW?=
 =?iso-8859-1?Q?tGJrsHQoZhI6VDpGp5UNIzd8Nb4Ll1MgyweUKWaLJXkhP00jKtaCHG6z3d?=
 =?iso-8859-1?Q?lY6Suaof87C71+Gnc30kEb49FS4b71TWTOheskbCkCwAqDLjpyyTis7EJN?=
 =?iso-8859-1?Q?sI+laBmJ+wHPm4DkviiCIFfMny/13Lie/gW+k7/VXOme+X4cMiABKsRnj+?=
 =?iso-8859-1?Q?3TFVEY7x9glUlxS/qGpXTQxG9G8LsuZVDoO4aDD++jjjUKDlGH7IoWwaFY?=
 =?iso-8859-1?Q?SeP5Gtj2XyAfyUppLrZUrrsOmuFVXE0cUGn46uu2UMmYUhhQqbDNKR+e04?=
 =?iso-8859-1?Q?1F6MaQlg48SdILuhhgxraMIk3nT8Jzmhzm1scNbimtfyfVzYK53/1XYoCh?=
 =?iso-8859-1?Q?wtFA1Kp2XcETlvE4HWbCmkMGHhftEPsyZqFcBuqEBc1aRWE4gdKn+bUTdZ?=
 =?iso-8859-1?Q?fNJdqRMiCsOgDEcKo0j5x3NuVTjNsbiYDev97AM88w01xCZll+uUWvoV+m?=
 =?iso-8859-1?Q?jKYZ+N4trrA37PsfhoZkzsu28PwgXaz1NSu14K7gM7iQ7/N2+kywFbKT/J?=
 =?iso-8859-1?Q?gt7XSF7QHD8qyjadACHqY28xTNjPQujfrrclCcFfQEzMBGQE8q1lVNuA59?=
 =?iso-8859-1?Q?+XAR9YmnoKL7DtOetfFQ/G1Y9COpz+GvFAGSmv1/6dmhY77FRHHmgh9ggM?=
 =?iso-8859-1?Q?pncGTZuAOE4bP+MWtNQil0e6Xgre5ZeId0YQexMO0v+AXbn5SQkBs/Vbl2?=
 =?iso-8859-1?Q?7u/e3M/mfVcGYKXxs6OJSaFrveTqrI4NOpqxstY2DboR5Dxi0P76uUYAHJ?=
 =?iso-8859-1?Q?5oQaXCljhQa/y0NeHvk4aKY79g6rO51Gf6yZDLomKjJwc4lTah5UQvJf6z?=
 =?iso-8859-1?Q?05FiGVWSXY5ALSgB21HP2q/AhfHJV4X17VJDdOOSpfn4SozarY3XcA6gNh?=
 =?iso-8859-1?Q?yNCnQ6dJycqUF7b6TxITxZYzb5bP6aHHEz42T05W63+gY2mUJxwtoYcsGF?=
 =?iso-8859-1?Q?82H0hwSt4SAvtk1+GOuXhR/9+ABYRVIpwLFJe50rxj3/oYrlEcZN4FbzLz?=
 =?iso-8859-1?Q?+radQqQlGKT48htoFY3Y1Zuf9Ztgj0wGE7LcuxbXDWud8orOBIG0kLmrpc?=
 =?iso-8859-1?Q?wOluogAphA+FEQCDwvdxa3kPBbIyB9nPd1J0orhRBJb3XsZDi+vTjHOnuG?=
 =?iso-8859-1?Q?UpqA6RSrGHxjKFiOq4ht57at3PaCvdJe0iLU1zOiPeDLQq4+9RhJYGF7o1?=
 =?iso-8859-1?Q?Wt9XVSqsk0knqJzftAuEKmuDHRWFw1/hMMGA2RqVMq9BfGC0Z3kFvJUJT3?=
 =?iso-8859-1?Q?Iu1/KnOxIyVa4lI/WYdXXHxidIH5SG7fSpralDFkXxyIQbuESfsriwPuoP?=
 =?iso-8859-1?Q?QRNo17SbB+6KFx2trXaFJEo30jL3h5Q/LVuMAuel0VxMcPu77+leoKqtvK?=
 =?iso-8859-1?Q?FnTnko47GLMkFiMhEg7uHz2lzHj2qtqH6z?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: in.ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR15MB1150.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 83a1671a-f987-408e-eb3c-08da6a5653e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2022 13:47:03.3382
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5CmMl3NTms2y8RzssuBpFmRVmYi2jvtIOoeqTzSSfKXkD192Hu+TKezKa6mkI6XoCTIZOBqxu17jjc9FyYVwyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR15MB2298
X-Proofpoint-ORIG-GUID: cPEe3rkXv914SNLCysBg3c402M7KJheJ
X-Proofpoint-GUID: 4sGEG-k4GSB8RkQzO8-8e_oq8amYhqpc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-20_07,2022-07-20_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 impostorscore=0 mlxscore=0 adultscore=0 clxscore=1015
 phishscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0
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
Cc: "nayna@linux.ibm.com" <nayna@linux.ibm.com>, Frank Rowand <frowand.list@gmail.com>, Mimi Zohar <zohar@linux.ibm.com>, Rob Herring <robh+dt@kernel.org>
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
> Cc: nayna@linux.ibm.com; Nageswara R Sastry; mpe@ellerman.id.au; Stefan B=
erger; Rob Herring; Frank Rowand; Mimi Zohar=0A=
> Subject: [PATCH v6 5/6] of: kexec: Refactor IMA buffer related functions =
to make them reusable=0A=
=0A=
> Refactor IMA buffer related functions to make them reusable for carrying=
=0A=
TPM logs across kexec.=0A=
=0A=
> Signed-off-by: Stefan Berger <stefanb@linux.ibm.com>=0A=
> Cc: Rob Herring <robh+dt@kernel.org>=0A=
> Cc: Frank Rowand <frowand.list@gmail.com>=0A=
> Cc: Mimi Zohar <zohar@linux.ibm.com>=0A=
=0A=
> ---=0A=
> v6:=0A=
>  - Add __init to get_kexec_buffer as suggested by Jonathan=0A=
=0A=
Tested-by: Nageswara R Sastry <rnsastry@linux.ibm.com>=
