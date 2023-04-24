Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 475216ED644
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 22:44:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4xvX1Zqqz3cLX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 06:44:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=JtTSZ5Tm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.147.86; helo=mx0a-002e3701.pphosted.com; envelope-from=prvs=0478e94324=elliott@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=JtTSZ5Tm;
	dkim-atps=neutral
X-Greylist: delayed 148 seconds by postgrey-1.36 at boromir; Tue, 25 Apr 2023 06:43:51 AEST
Received: from mx0a-002e3701.pphosted.com (mx0a-002e3701.pphosted.com [148.163.147.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4xtb6N9Tz3bgn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 06:43:50 +1000 (AEST)
Received: from pps.filterd (m0148663.ppops.net [127.0.0.1])
	by mx0a-002e3701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33OHgBGa023037;
	Mon, 24 Apr 2023 20:40:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=u0w/CiaJLlzh1WLzE+33OY2G0U7eSEYHe0gkezNPBIA=;
 b=JtTSZ5TmljhHxv9giu5jB1g0vMFw4hJFaAxPUcrhl9S6FHakoG9sKd3Q4kBbQcHo1nYK
 2OAYNiaEUA0fmioCemvV7luuw7dG8J2MMBUwKqvA58W4mf5Thxkvn4Ng9QlMtQINMtNO
 41GTQPhtwGC8ovXCKklk8k1OCmA4vS+e74lyY8ME7ugCmiJmUSry6BWEW7kfM7XvaS9r
 jzfNIz3BI985Uw+21h773GY9AaH2nloCI3GfU0C1Yr0UULaHHI8f1TDLUSeQUpE79A75
 pf8Ux+SpbLRd7B6ivuZVJtAzieXLCHvfjJGpYm05IR2I3Uhf+2+1v46yYOYs7WU7F3Ku Dg== 
Received: from p1lg14880.it.hpe.com (p1lg14880.it.hpe.com [16.230.97.201])
	by mx0a-002e3701.pphosted.com (PPS) with ESMTPS id 3q5st9kp5f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 20:40:56 +0000
Received: from p1wg14923.americas.hpqcorp.net (unknown [10.119.18.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14880.it.hpe.com (Postfix) with ESMTPS id 6EB2580025B;
	Mon, 24 Apr 2023 20:40:55 +0000 (UTC)
Received: from p1wg14927.americas.hpqcorp.net (10.119.18.117) by
 p1wg14923.americas.hpqcorp.net (10.119.18.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 24 Apr 2023 08:40:55 -1200
Received: from p1wg14920.americas.hpqcorp.net (16.230.19.123) by
 p1wg14927.americas.hpqcorp.net (10.119.18.117) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42
 via Frontend Transport; Mon, 24 Apr 2023 08:40:55 -1200
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.123) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Mon, 24 Apr 2023 08:40:54 -1200
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C4oo2WB6hby2HU9X8ETOmF6tToE38Tz/ztTKhULkPcu4+3Z2xL+pg79rs6TxnWZmdovhJju6bTu4dU5DxOBonc0lmaIJw5aUDUYFGUZePTrLMG5iIg3p+7WUy2zWz/MjzCEnKCj1PoFO8RO06VauiktWBgPJs7ARQ50dX5ZW9VxMw7U75pzCOCwLS4CLiVDkExfR8RQ12sltbgIaFpniKI7pnfKXlMaKsek9GQNaYGHEnX8k8QXweyeYDuL2oK33JhW3BaCriYflT14NDJSIQuQ2a0BV0N5GlhRrJYXLu1m+qPA+LUt7+sAfCaIsMVQMsA1uOioO07BYSL7ApPFFKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u0w/CiaJLlzh1WLzE+33OY2G0U7eSEYHe0gkezNPBIA=;
 b=QmZINnOPkhC+U4uSVlkUxMbYjq+HUJ9hQ/TCAiRvlaeU8Tqljjv7VJExhKJAOSJeiIwyfUTRbxTQ3MW0L/0nXWvCteN2urVAx+Z3y/SCrssEmKjijrYV0FsJ2CanS0mTR7MsX6utnuWmmboteH8J+rd4q9WFE2/Ttvg8gp5kX1vf/jfP7zmhzXvEKlbrrf7kQSo+fx7ZZqUdiyiSqbmjU+v5gGCWJ3uf6lC8KqwE5jw0KUbgYi+q0VdR8ZHqORy/o0MRhvdcDj8gJZXFhjRloCAevAokpIqTIlJVP61xhPJdldXDJWBpEuo9tGse0GXIZRV26D8lIOgLhrvT4N/vAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c4::18)
 by DM4PR84MB1783.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:8:4e::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6319.22; Mon, 24 Apr 2023 20:40:53 +0000
Received: from MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::71d7:118b:6b9:c794]) by MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::71d7:118b:6b9:c794%6]) with mapi id 15.20.6319.029; Mon, 24 Apr 2023
 20:40:53 +0000
From: "Elliott, Robert (Servers)" <elliott@hpe.com>
To: Danny Tsen <dtsen@linux.ibm.com>,
        "linux-crypto@vger.kernel.org"
	<linux-crypto@vger.kernel.org>
Subject: RE: [PATCH 1/5] An optimized Chacha20 implementation with 8-way
 unrolling for ppc64le.
Thread-Topic: [PATCH 1/5] An optimized Chacha20 implementation with 8-way
 unrolling for ppc64le.
Thread-Index: AQHZdt1sJ94WCLbkHU2RjqVi2vFQYq866lPA
Date: Mon, 24 Apr 2023 20:40:53 +0000
Message-ID: <MW5PR84MB1842E9D9F596D3928B415DBAAB679@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
References: <20230424184726.2091-1-dtsen@linux.ibm.com>
 <20230424184726.2091-2-dtsen@linux.ibm.com>
In-Reply-To: <20230424184726.2091-2-dtsen@linux.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW5PR84MB1842:EE_|DM4PR84MB1783:EE_
x-ms-office365-filtering-correlation-id: 9107a1da-40d9-4d1b-1526-08db45043288
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uHrz+ZopPeyuu8XYS/tMzGSr9rOwOq7Dt1/kmNZPSvAv2Q0C7AzOTgKUw9dadjWUbsYtiR8GaaXUpWBsPxaNkNIoaCYyIAtaQLnhoT4MUxX5CS7/gziSPLd9A8yLtXrvvzEE3v5I89498XQXHsE1qx7fph63pYRmi+pGIQK0abeUsRS9llJ4bUg7kxwdvlXjRA/89nrYrTS0EN3D5gDDmJeSOm5L6uzeNAao0YEhb9yku8sgLLv6NrRWrk+P9UOgc4OjA7Dc3eXyK/u3YHzPpDQ05aBws9EsqiihBBVNETELpokZQZghsJwrAuklOtEZDhzXgG00RkrW+m8wvsDug8ylPYntE/o/8pzbFMGykXt0wODasH7ermZ4D8pb8rxfGHIaCDjGO/rMk0N1LuCSAgiRCSYnTee7Brbpm9gwawJ0uuBTxqhHdJy/J8KhwbNxDc+dJzyB1tS3rxjcH0JvpwXnrbQ2G/5CftZ6oLyqudEI6vuDMdr0JRGIp8MUVSpcob3fCU4fHXIrZ4ruMiVX2ogs/Yu4W9yAkiOJdfy521WdLAw6sniczlZ818ZDJEp8hnFYTLxAGg8kIF/vahw8sI0AkiK8jW62/sPYsuCmxOpCPmUCBxe5n7sp5EqT2gkr
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230028)(346002)(366004)(136003)(396003)(39860400002)(376002)(451199021)(66476007)(2906002)(82960400001)(38070700005)(41300700001)(5660300002)(52536014)(38100700002)(122000001)(7416002)(8676002)(8936002)(33656002)(558084003)(86362001)(55016003)(7696005)(71200400001)(6506007)(9686003)(26005)(54906003)(478600001)(186003)(4326008)(316002)(66556008)(76116006)(110136005)(64756008)(66946007)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v8z0OTD1FhUoSzolCMzJ9q0Zn51Hf+sH1li5W4nfunSrmHQNWXzQi/B97ZN7?=
 =?us-ascii?Q?o7Bzo3pN2J9v6b+HQI+MHloggCjJ0T02prC/Lf2+JKAKayVGA0BBiB6aJ+qO?=
 =?us-ascii?Q?KnUn5QDYlpx93URzffi8CRnd8snxAdsBenUZVAMmJI8HVL2IOMxWlBOoa2TK?=
 =?us-ascii?Q?ObG0jP2sthQ2GsotOos0TqQP6weVRFRJT1VewguQXNEJN4Cfg/GUd9x1YPda?=
 =?us-ascii?Q?i7UOBkqjR34qHWNGno4FOKB8XjHd91FMnz0C3kr9NSix2C9LEqsE3DuXR+bE?=
 =?us-ascii?Q?NBI3+HdmDCkquUsTQwL4JFSfuxeAELGWeG0ZWa7OI+4XBTf+RRh+eEJV84q3?=
 =?us-ascii?Q?EzlnUnRifW4G571s1Okm2CA+19Wzc6FPb0BlcBLavbbFA6sODkgOYMbBGB+W?=
 =?us-ascii?Q?u1fzp2lB2zd2iArHTifXvRcXcGc76bkXJ6Txh3wFBkrwOdQM9eN7n4FnApZx?=
 =?us-ascii?Q?5K0iRptyv4uxXh69WlMgGQa2nvHsFFVDtPl5QqRCDkTR/zzITwz+1L7jJReX?=
 =?us-ascii?Q?H/5FUE0dhR9gGxbaft9jUnGnQyVZIDuB95WGJAMmun/ZVPSGHINwRUIAB437?=
 =?us-ascii?Q?5rzvXjAC3nf9cBMLDZVO/qsBvQfo63AZU7+MaFWU4q1Bf2cxc8q39NF5qKwc?=
 =?us-ascii?Q?J60BxVzQd2bzWZHsx7ojS1me39jSrmKiMBJpaMepxyGpnCjuego5HWnQKUQ8?=
 =?us-ascii?Q?OJBIJC+jJoZxQowc9CSXg+4ASOC9G0DIM+NA353kaiByE8g0jcid4BzGzNk7?=
 =?us-ascii?Q?FsOe/iVRDf1qxKdb6wD9HQtWQq47RFM3RZ2dzeSZis/q603SFJUoE0+Sy1to?=
 =?us-ascii?Q?72WleN58LoF0vJe5ohuscdDFG0zmvl/f0Z8nUPpUMKvqgxIhmzPrz4Uyi58P?=
 =?us-ascii?Q?EK6he59zItaWTHW6OZlmMo5RALIFdpDTpM0tKQnlljkTjtJU+RhdlRoP47Eu?=
 =?us-ascii?Q?wHL819MzQEM5FUxGOkmm2bizC21hm2vyWyFHmAsA52VwFL+zHKr4aubAtRwM?=
 =?us-ascii?Q?PanVTrJ0GTp7XvWntEVxa16uMDskmMRf2UrHK+UPd+2FzruFf/BF9bvSK0c8?=
 =?us-ascii?Q?xNfQ0igrw4IaMyj5LD0DvCLMiUCUfb5vjjY6SuOcXmqqVbtJR7cpnD4PDd2p?=
 =?us-ascii?Q?UikNOxm/a0qMITAhL/+OFsQW2eDABxGr3d5c6xSenqytQRfAegCtCmndivyI?=
 =?us-ascii?Q?4AVPIxtWeY7AXX6zbrdTkZogXkDgWZtC+JLN8DobZAajpoyjyk7g7OSX93kW?=
 =?us-ascii?Q?jDXuiVLujM46e4EOLupxE2ggt3UBoOUiIVVxQMao0SzsXE+EXIxbSJ+upwAy?=
 =?us-ascii?Q?fzHaMjAUm6BPm8QlZxxFaSoCwn2taT1JyIEGuMjirOYWLPTlRpAJwPdtFfW+?=
 =?us-ascii?Q?K/rL1XYAWZwUPKAff62/AIMW2z5QxUe8myE2FOp27sj/KW1JJt7kSCjcQ5Zt?=
 =?us-ascii?Q?N/sgdC9V79wu90Wz/cCMeiTnI2mfG6RXr07CnLtgdmcN2xI4A33eVgOou2nX?=
 =?us-ascii?Q?KweHwBwas7QS8+vu8qZppTpGUZyw0TrluIG1I2OSjkjscU3q+8kL0V6nm11X?=
 =?us-ascii?Q?mcQ/JeE8wP072o3ze1M=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 9107a1da-40d9-4d1b-1526-08db45043288
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 20:40:53.2610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 17injCzu3dadGSiILymUSiVUZdAYc9nTVS6qH2pat0iQYQgfc0SOuiM0N+BM/B+1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR84MB1783
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: wblqEc6S08rAExDwGmuHdeZZtcdyJooR
X-Proofpoint-ORIG-GUID: wblqEc6S08rAExDwGmuHdeZZtcdyJooR
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_11,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 mlxlogscore=671
 mlxscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240186
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
Cc: "herbert@gondor.apana.org.au" <herbert@gondor.apana.org.au>, "dtsen@us.ibm.com" <dtsen@us.ibm.com>, "nayna@linux.ibm.com" <nayna@linux.ibm.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "appro@cryptogams.org" <appro@cryptogams.org>, "ltcgcw@linux.vnet.ibm.com" <ltcgcw@linux.vnet.ibm.com>, "leitao@debian.org" <leitao@debian.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> +# Copyright 2023- IBM Inc. All rights reserved

I don't think any such entity exists - you probably mean IBM Corporation.
