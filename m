Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86914943980
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 01:49:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=qEbkwi1w;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WZ82l2GDpz3dK3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2024 09:49:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=qEbkwi1w;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:2607::600; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2607::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WYx680Pr4z3c56
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2024 01:36:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvzooQhYRme+yQoILLBYfhoJrMSoX/1UCUhIh31T8UR+2LYuz2LFirlu05wpkAlWQxjJmBEh0q++G6DutvMlI78DRy9VKDefjWbyrBJb8+48rYUtMOV0iaPGN+84cOjLzU6t+I3JHXQMQSVlwkvn2EP5qRspHaLrbBo9cgHYMT50bJ7+7sHgWa37I02UXGjsIjBREYdvfEU3uEtItmJ1VYFiAWKeEQdrQYGwL2mZnxVnoaNXvdYlRlxZJe8ZXS/0LkDZMTHGp7K0EeeoN3r8+tr8huJ8Vz1/c+7Yg/20eJmg33J6U3JcuMkr9J7z2Mgg4igzd3/KTpzD+P+MJMsfHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AwD4Ikcqr5C9Nx8uiMQg5TE0PrJEyzaQcZ4EK0LQGaI=;
 b=WO+3jTtR4GsErZymRioYUW8HWNH4Do7Ww4irG/7v0U2Sa2sH7r1lySZYsDxDqH9rmt2D6hflSW+eC3Yq9KroYZqEopJnkXW+SOlwefsWaR0mT7QTuR2x37oZ/Gqg5yqFdAoq6sM0/uwjC7ufN6gkaeK/tCb2zQdD2TjVSNncHGtdMjYZ0biiDPEyD0ClsOjD40zJT8Oy2PxoWa5eTtJdZf0C4IBvRyWlwdoZ0vbBDyAFrBV4OOp3dgSaeuGlaW9rFomQdDQk1A7XVB5wP5socpSrvMdcglHZ1dyfPjxMdMnAT8aW0nx2tBPXt9ynhlxyDj3FclVvpSd3P+EL0JcSDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AwD4Ikcqr5C9Nx8uiMQg5TE0PrJEyzaQcZ4EK0LQGaI=;
 b=qEbkwi1w6a0TpXxlAeXAT7nh0G3JmiN5FxNAZasxkfXUM9VQjZs+eP09HwnYPGHuOmrLrXqoDXhBFSZvI2n8NCJAtT8shv/3jGdlgLtP6iYwr0B5EuIPJbNC58MxoycoetLQTsK8Rom/E0lu55e1UpNeecZ103HCQsByFM0RwCHS8usTx8RoVqG4+Eeo+kPksaomO1Qi8zymHaxpNuNe3mns6o/PqR4SETowGhWiUBbPBnKGUixMjCw39K0jF3PpFS7r0htqzLZ3ZCoqBxf4/VE7ceJM176I8bMp59fJ6UllU6c9sYvV2mwUysHS7CvCR8FgHRdGQ9FH7nTekf+zXw==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by PR3PR07MB6953.eurprd07.prod.outlook.com (2603:10a6:102:72::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.19; Wed, 31 Jul
 2024 15:36:26 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%3]) with mapi id 15.20.7828.016; Wed, 31 Jul 2024
 15:36:26 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Guenter Roeck <linux@roeck-us.net>, LEROY Christophe
	<christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v7 16/23] powerpc/e500: Switch to 64 bits PGD on 85xx (32
 bits)
Thread-Topic: [PATCH v7 16/23] powerpc/e500: Switch to 64 bits PGD on 85xx (32
 bits)
Thread-Index: AQHazIb6T1LtZ1pq6Ei826U8Zbu0E7IOb0qAgAK0Bz0=
Date: Wed, 31 Jul 2024 15:36:26 +0000
Message-ID:  <AM0PR07MB496234BE973D5458C53517F29BB12@AM0PR07MB4962.eurprd07.prod.outlook.com>
References: <cover.1719928057.git.christophe.leroy@csgroup.eu>
 <ca85397df02564e5edc3a3c27b55cf43af3e4ef3.1719928057.git.christophe.leroy@csgroup.eu>
 <2c7adbc9-609d-41a9-8a3b-a63d59e21a1f@roeck-us.net>
In-Reply-To: <2c7adbc9-609d-41a9-8a3b-a63d59e21a1f@roeck-us.net>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels:  MSIP_Label_7bd1f144-26ac-4410-8fdb-05c7de218e82_Enabled=True;MSIP_Label_7bd1f144-26ac-4410-8fdb-05c7de218e82_SiteId=8b87af7d-8647-4dc7-8df4-5f69a2011bb5;MSIP_Label_7bd1f144-26ac-4410-8fdb-05c7de218e82_SetDate=2024-07-31T15:27:42.2098854Z;MSIP_Label_7bd1f144-26ac-4410-8fdb-05c7de218e82_ContentBits=0;MSIP_Label_7bd1f144-26ac-4410-8fdb-05c7de218e82_Method=Standard
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|PR3PR07MB6953:EE_
x-ms-office365-filtering-correlation-id: dfb74945-6cac-42e2-2e4a-08dcb1768a4f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:  =?iso-8859-1?Q?yzevN7j7DQ4u40RGu8wgCsO2GI7QRxNh9OJ/zRiKfQ/OWRgOgqTGomhLPW?=
 =?iso-8859-1?Q?Hblmrp3baKsbZ1KixD0gJntWjdrP49f+jNaUJle+lmzF15YUT4dGXGw7hY?=
 =?iso-8859-1?Q?3vc+AQyJ+WeEJ2vfUxWPN6HGn6UxQMD7EjZ2wtpT2rn0r2M2eZXaSXOM5y?=
 =?iso-8859-1?Q?Lp5PQyLPJ4ywWuNrrQKOHXpigkX+KGuEa0reZuZzxue04A3QmqoD/pcK+d?=
 =?iso-8859-1?Q?5b9pIAvfj6wkTXnuOQTKOakcQ+TXjM8rRBE5V1FyQFOgRpLco5rOaf7kow?=
 =?iso-8859-1?Q?ibKgDwhKByz1SaKEnUpTrBry3kv/X89GYuWgonTdNt7jNpk/87LUoX5K8a?=
 =?iso-8859-1?Q?xDz51skLcOcEdpurBLk+Ol59/4m+O8dQTunpDzhSjVUSekIUZxarneUxn0?=
 =?iso-8859-1?Q?aAm6kS5kuyMO+qJ0oJhd6yspNG6aL960FEwW2vIJ+gL4AynGQRqyqwiXDK?=
 =?iso-8859-1?Q?zfOw5qSdezfegkRgMeEi3IyiSEEz4SkAluotzZRWykV/Qy3tnsUGvUlZIn?=
 =?iso-8859-1?Q?Tx16j4d2s0IjccTLaoLAoNI0zGpPXvXSpM3ES5QXYaMpLyMiszmheKtrsS?=
 =?iso-8859-1?Q?CvUEQBzK00eGJzNyXDAGNT2ofwP8VYyQUA+Cw6GMaHQa9CaFJHx0QSR3Cc?=
 =?iso-8859-1?Q?Fc/UIOcTbaKnPCBBNWu8+GYXtrw1VqZ4RSqUmOceSYyN+KYcHSqzsLFlPJ?=
 =?iso-8859-1?Q?hDDzkWxPEZTZKi5rkB36TIKQpBG+MV7CvPye+hU0sI0O6FCbGA9p8y9yiF?=
 =?iso-8859-1?Q?jd+YVFKZsyhWpKPg+24CV+fX22dsSo4Gb1/IDjW15R22hZ7vm7XOQhOWIc?=
 =?iso-8859-1?Q?8pFmTLHYPLRky2BwEOUrPpNFS1vfqWc0I+6yHssOmoTeMa4fSEApopKd6o?=
 =?iso-8859-1?Q?ttme1CpUm8v9X3x2NINx5Va+WvKxzQtB1Mgcdm2D7I5c4emGCdH9FeS+3x?=
 =?iso-8859-1?Q?fYlMbxP0ydr7nkUdIZGD1DlONQgUEUtCAaAeiQbdxnwC788RiQE5g97vqk?=
 =?iso-8859-1?Q?1snnp3y518J2tQh5q3deoRSxp74HkK4PMW1g6PCnJLHnX3Dqp4uAhuTCne?=
 =?iso-8859-1?Q?6bxUbjIKZJ+SIM79X7p0YBJswQLbJUAO6rojiZ4cl7WqiNLB5Pgg/lni9I?=
 =?iso-8859-1?Q?q6AQWeDaq9bLg6sSlLosK3JFnLakDILbf8Qgl7StwxMXW8D6chBxbLQVEM?=
 =?iso-8859-1?Q?TLZWEKjXYuHWStzwqTK9uGBhFx+Lw4mK/m0Qf7lgeIfGU/GyUZjIEcbJXL?=
 =?iso-8859-1?Q?3ZvEmEldRvDArt1beolg7vt4H+NJjkj09oP/gB2PioO5f+jC/CIUjyscNH?=
 =?iso-8859-1?Q?+iJQv5BCDUWJPaisrAU/O7ZCfXzepQS0iLqwG87IWHRl9/+Na3lasqv58+?=
 =?iso-8859-1?Q?F+yRw6MEyS6UWmL/NS/1wh801eSzdWvT71jyxxI0aYqc0IrZuiRTs=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?iso-8859-1?Q?tUA6reDAM9KT48iFgWe8Hqe43orn1fRLzMNHkP9X4HS/UNLzm0ejQiOzLT?=
 =?iso-8859-1?Q?eFASYDk7PoomUBi2nr97D53NTS7HUKyjLDDKHXAKrEz/1aB/KLuP173ZmC?=
 =?iso-8859-1?Q?MpwzCFbnW5+mpFtfmQgaD9p7rKZxo4LPrgX2r8Wv4R59kU6zZfGToP1PJK?=
 =?iso-8859-1?Q?ClDmP84r0Z3KLo98z1HXtPR194s67nrqqugNA1gCehSI2DrpabnxSc+ejp?=
 =?iso-8859-1?Q?oJfGb7MH8+8n/03EDT8E+wVgaDb4nClnciClqDHmrr6tThr5fmdzsD4yiT?=
 =?iso-8859-1?Q?EyO3zf2/8Mzqejj2VA+Cu5B0bONx3PwcuL3YiG4VBeRln5HplLd5dllyN9?=
 =?iso-8859-1?Q?nR5lTdGM1A1Gp8M9dpzV/bWwworN2TMvl66XfoYRgpejNbOcNCjvX7Fufi?=
 =?iso-8859-1?Q?u5P+UgfDakxvl5Zl2iClNJja5wmMdZVnF275tIZIn7MaYhS4tBjhDxZnIX?=
 =?iso-8859-1?Q?6c99jteoFvTkcEiw+nYLAiR2Jty8KTvKgS8zKM8Fd4irOf3WyfNoiLBPw6?=
 =?iso-8859-1?Q?zxxL34/kdCTbVmIJ+HtFsYbugvvVDs2hS8lJWweFDG68kOqLUQG9dppG/O?=
 =?iso-8859-1?Q?mEIWHXN7wOh2eWOJtSufsSucJpr1mQqmAshP/2aJo7ap/zS3i+38M/Cr19?=
 =?iso-8859-1?Q?yEc7BV3Bi3lnOniCddI+2IhocbEd2+nL07oMhWBCwrntoVpZMaGG0iZAjo?=
 =?iso-8859-1?Q?sCmZVbOVBRapkJEgcGsgwEN4cquSkCeI6a8TP18tZGHMW7qorHQqR9Gla0?=
 =?iso-8859-1?Q?rYNG4gcftni33oJXRxFNMLLD7dBO+Amqk579ksLBXCYPYD+/Ke6tuV89MW?=
 =?iso-8859-1?Q?MpLL7XtQ72EZ4/qAZp1A89+DJV33dAh3Kv61rIWeIbfT91jUoiQsauuyKF?=
 =?iso-8859-1?Q?mROGpWJPXN2PTagb1hdEnlEb5N94fdSm9euPO9QECLKzj7dfZ7xC0b7bAW?=
 =?iso-8859-1?Q?mIoOQuMriT97KyRlCmXz3xxMgEJ2Tvw3rtWAD5lJkghuEm1cEh+z98m6G9?=
 =?iso-8859-1?Q?Wth0iMNT8hY084UN5Lr/lNXfVEULP2687y5B2Q5CApTFMe4k4Ev6M0tAYx?=
 =?iso-8859-1?Q?XF1WdveEmGhXzlwVC7y1M22s3+1yz+u9AtkPs21FToEYzOqN6CMNepD2//?=
 =?iso-8859-1?Q?NzWZiF/2bnjvSNy6QRlJ3KDiQieUOLmnf0hrVPCPxCM8wR09kZpBVBeqzK?=
 =?iso-8859-1?Q?xCHuFYXkJ0R8lxtgAnh4F4xqcOn72iJ1meObosESpib48eX+ApHRNhYiWK?=
 =?iso-8859-1?Q?n5RgG4mwFZ15ESK0vhs3LSDr/eO/E89XorRUib+7zHtiSDKz40UyL7N2PT?=
 =?iso-8859-1?Q?acyh3jFq5EcPeZeex9vXgEgGzrEKktZzZbFPTs5sT72yAY5SiHVDWKy5an?=
 =?iso-8859-1?Q?dCQ8GjvPk3RMWI8u5dDeNm9dqpuwvrR0lE0H9nI6mk3YC5u7srDVFj+00P?=
 =?iso-8859-1?Q?YsM9wLsk6qFVxdNxKDKMADjSAFXx9OcuSmnn4Xp29MkKDRz4VNemV3w+JZ?=
 =?iso-8859-1?Q?Q1VSsGBCKN7QGdQpNQd/VPIQxwEvxE+AKJxznN2EnK2B570zMpNc+sqWcY?=
 =?iso-8859-1?Q?qR4FTFnIidy+Ne7g17oTLsw4zB2QoSHkjyIzbqZ0dOgBkTOJsgAPddMDPf?=
 =?iso-8859-1?Q?ckJdZDViwUFzEUF9iNAfC3XsR91AOPXEhPcGlF3H8AnD97YDvsfD09Mc9O?=
 =?iso-8859-1?Q?r810vcs65IQgPphgun+hXjtFs4ky49QdfRYie7JD?=
Content-Type: multipart/alternative;
	boundary="_000_AM0PR07MB496234BE973D5458C53517F29BB12AM0PR07MB4962eurp_"
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfb74945-6cac-42e2-2e4a-08dcb1768a4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 15:36:26.3842
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mMu4aOWcvBSJQt04pbyDHGPbAqrY2hxHKxobR4nWH15EeUlCuPpbV5/0Rr988gxD8DqfnrQrxf/iwaCrVUy/lllyqnEXG+9ZKcGoou8H7MB6VR7BDO6w8KlibjZeuWxT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR07MB6953
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 92.184.104.212
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-disclaimer-hash: 0a291ef45dbeaddd3c2a8ba60f43906764fc4f3e495eff2ecd40117e05115c44
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: PR3PR07MB6953.eurprd07.prod.outlook.com
X-Mailman-Approved-At: Thu, 01 Aug 2024 09:49:00 +1000
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Peter Xu <peterx@redhat.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Nicholas Piggin <npiggin@gmail.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_AM0PR07MB496234BE973D5458C53517F29BB12AM0PR07MB4962eurp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable


Hi Guenter,
Thanks for this report. I'm afk this week, i"ll have a look at it in more d=
=E9tails next week.
But to be s=FBre, does that Oops match the bisected commit ? Because pmd_le=
af()  for e500 doesn't exist yet so pmd_write() shouldnt be called.
I did validate all my changes with mpc8544 on qemu when i implemented this =
s=E9ries, using map_hugetlb mm selftest. What test tool are you using ?
Thanks
Christophe

Envoy=E9 =E0 partir de Outlook pour Android<https://aka.ms/AAb9ysg>
________________________________
From: Linuxppc-dev <linuxppc-dev-bounces+christophe.leroy2=3Dcs-soprasteria=
.com@lists.ozlabs.org> on behalf of Guenter Roeck <linux@roeck-us.net>
Sent: Tuesday, July 30, 2024 12:10:51 AM
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-kernel@vger.kernel.org <linux-kernel@vger.kernel.org>; Nicholas P=
iggin <npiggin@gmail.com>; linux-mm@kvack.org <linux-mm@kvack.org>; Peter X=
u <peterx@redhat.com>; Jason Gunthorpe <jgg@nvidia.com>; Andrew Morton <akp=
m@linux-foundation.org>; linuxppc-dev@lists.ozlabs.org <linuxppc-dev@lists.=
ozlabs.org>; Oscar Salvador <osalvador@suse.de>
Subject: Re: [PATCH v7 16/23] powerpc/e500: Switch to 64 bits PGD on 85xx (=
32 bits)

Hi,

On Tue, Jul 02, 2024 at 03:51:28PM +0200, Christophe Leroy wrote:
> At the time being when CONFIG_PTE_64BIT is selected, PTE entries are
> 64 bits but PGD entries are still 32 bits.
>
> In order to allow leaf PMD entries, switch the PGD to 64 bits entries.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>

With this patch in the mainline kernel, all my boot tests based on the
mpc8544ds qemu emulation start crashing. Example crash log:

kernel BUG at include/linux/pgtable.h:1599!
Oops: Exception in kernel mode, sig: 5 [#1]
BE PAGE_SIZE=3D4K MPC8544 DS
Modules linked in:
CPU: 0 UID: 0 PID: 1 Comm: swapper Tainted: G                 N 6.11.0-rc1 =
#1
Tainted: [N]=3DTEST
Hardware name: MPC8544DS e500v2 0x80210030 MPC8544 DS
NIP:  c01f51b8 LR: c01f6fec CTR: 00000000
REGS: c4135c40 TRAP: 0700   Tainted: G                 N  (6.11.0-rc1)
MSR:  00029000 <CE,EE,ME>  CR: 24228288  XER: 20000000
GPR00: c01f6fc0 c4135d30 c415bf20 c762e3f0 c29c9318 c7624ff8 0000026b b5fc2=
ea1
GPR08: 00000000 00000000 5a5a5000 b7f4dd55 44228282 00000000 c0005014 00000=
000
GPR16: 00000000 00000000 00000001 00050003 24228282 24228282 00000000 00000=
095
GPR24: c1375b30 c4135de8 c4135e48 00050003 c762e3a0 c762e3f0 bffffff1 c7676=
a08
NIP [c01f51b8] pmd_write.constprop.0.isra.0+0x4/0x8
LR [c01f6fec] follow_page_mask+0x150/0x17c
Call Trace:
[c4135d30] [c4135de8] 0xc4135de8 (unreliable)
[c4135d40] [c01f6fc0] follow_page_mask+0x124/0x17c
[c4135d70] [c01f7170] __get_user_pages+0x158/0x5d8
[c4135dd0] [c01f7750] get_user_pages_remote+0x160/0x560
[c4135e30] [c026838c] get_arg_page+0xb0/0x25c
[c4135e70] [c0268dd4] copy_string_kernel+0xf0/0x200
[c4135eb0] [c026a0e4] kernel_execve+0xbc/0x190
[c4135ee0] [c0005108] kernel_init+0xf4/0x1d4
[c4135f00] [c0016224] ret_from_kernel_user_thread+0x10/0x18

This is with v6.11-rc1; the actually observed crash differs from test
to test while running bisect.

I can't just revert the patch because subsequent patches depend on it.
Is this confirmed to work on real hardware ? If so, do you have a
suggestion how I could continue to use the mpc8544ds emulation for
testing, or is it just dead ?

For reference, the configuration file is mpc85xx_defconfig.
Bisect log is attached.

Thanks,
Guenter

---
# bad: [8400291e289ee6b2bf9779ff1c83a291501f017b] Linux 6.11-rc1
# good: [2c9b3512402ed192d1f43f4531fb5da947e72bd0] Merge tag 'for-linus' of=
 git://git.kernel.org/pub/scm/virt/kvm/kvm
git bisect start 'v6.11-rc1' '2c9b3512402e'
# bad: [6dc2e98d5f1de162d1777aee97e59d75d70d07c5] s390: Remove protvirt and=
 kvm config guards for uv code
git bisect bad 6dc2e98d5f1de162d1777aee97e59d75d70d07c5
# bad: [30d77b7eef019fa4422980806e8b7cdc8674493e] mm/mglru: fix ineffective=
 protection calculation
git bisect bad 30d77b7eef019fa4422980806e8b7cdc8674493e
# good: [c02525a33969000fa7b595b743deb4d79804916b] ftrace: unpoison ftrace_=
regs in ftrace_ops_list_func()
git bisect good c02525a33969000fa7b595b743deb4d79804916b
# good: [8ef6fd0e9ea83a792ba53882ddc6e0d38ce0d636] Merge branch 'mm-hotfixe=
s-stable' into mm-stable to pick up "mm: fix crashes from deferred split ra=
cing folio migration", needed by "mm: migrate: split folio_migrate_mapping(=
)".
git bisect good 8ef6fd0e9ea83a792ba53882ddc6e0d38ce0d636
# good: [a898530eea3d0ba08c17a60865995a3bb468d1bc] powerpc/64e: split out n=
ohash Book3E 64-bit code
git bisect good a898530eea3d0ba08c17a60865995a3bb468d1bc
# bad: [00f58104202c472e487f0866fbd38832523fd4f9] mm: fix khugepaged activa=
tion policy
git bisect bad 00f58104202c472e487f0866fbd38832523fd4f9
# good: [e081c14744f4a93514069e1af1a7273d5451b909] powerpc/e500: remove enc=
 and ind fields from struct mmu_psize_def
git bisect good e081c14744f4a93514069e1af1a7273d5451b909
# bad: [57fb15c32f4f6a4f1a58f1fbc58a799c3f975ed8] powerpc/64s: use contiguo=
us PMD/PUD instead of HUGEPD
git bisect bad 57fb15c32f4f6a4f1a58f1fbc58a799c3f975ed8
# bad: [276d5affbbaea4d369d1e5b9711cb2951037f6ee] powerpc/e500: don't pre-c=
heck write access on data TLB error
git bisect bad 276d5affbbaea4d369d1e5b9711cb2951037f6ee
# bad: [84319905ca5f3759c42082e20ed978c81f4dead0] powerpc/e500: encode huge=
page size in PTE bits
git bisect bad 84319905ca5f3759c42082e20ed978c81f4dead0
# bad: [6b0e82791bd03b2326c7f7d8c1124c825742f2a4] powerpc/e500: switch to 6=
4 bits PGD on 85xx (32 bits)
git bisect bad 6b0e82791bd03b2326c7f7d8c1124c825742f2a4
# first bad commit: [6b0e82791bd03b2326c7f7d8c1124c825742f2a4] powerpc/e500=
: switch to 64 bits PGD on 85xx (32 bits)


C2 - Usage restreint

--_000_AM0PR07MB496234BE973D5458C53517F29BB12AM0PR07MB4962eurp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
</head>
<body>
<p style=3D"font-family:Tahoma;font-size:8pt;color:#CF022B;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
</p>
<br>
<div>
<div dir=3D"auto">Hi Guenter,</div>
<div dir=3D"auto">Thanks for this report. I'm afk this week, i&quot;ll have=
 a look at it in more d=E9tails next week.</div>
<div dir=3D"auto">But to be s=FBre, does that Oops match the bisected commi=
t ? Because pmd_leaf()&nbsp; for e500 doesn't exist yet so pmd_write() shou=
ldnt be called.</div>
<div dir=3D"auto">I did validate all my changes with mpc8544 on qemu when i=
 implemented this s=E9ries, using map_hugetlb mm selftest. What test tool a=
re you using ?</div>
<div dir=3D"auto">Thanks&nbsp;</div>
<div dir=3D"auto">Christophe&nbsp;</div>
<div><br>
</div>
<div id=3D"ms-outlook-mobile-signature" dir=3D"auto">Envoy=E9 =E0 partir de=
 <a href=3D"https://aka.ms/AAb9ysg">
Outlook pour Android</a></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Linuxppc-dev &lt;linu=
xppc-dev-bounces+christophe.leroy2=3Dcs-soprasteria.com@lists.ozlabs.org&gt=
; on behalf of Guenter Roeck &lt;linux@roeck-us.net&gt;<br>
<b>Sent:</b> Tuesday, July 30, 2024 12:10:51 AM<br>
<b>To:</b> Christophe Leroy &lt;christophe.leroy@csgroup.eu&gt;<br>
<b>Cc:</b> linux-kernel@vger.kernel.org &lt;linux-kernel@vger.kernel.org&gt=
;; Nicholas Piggin &lt;npiggin@gmail.com&gt;; linux-mm@kvack.org &lt;linux-=
mm@kvack.org&gt;; Peter Xu &lt;peterx@redhat.com&gt;; Jason Gunthorpe &lt;j=
gg@nvidia.com&gt;; Andrew Morton &lt;akpm@linux-foundation.org&gt;;
 linuxppc-dev@lists.ozlabs.org &lt;linuxppc-dev@lists.ozlabs.org&gt;; Oscar=
 Salvador &lt;osalvador@suse.de&gt;<br>
<b>Subject:</b> Re: [PATCH v7 16/23] powerpc/e500: Switch to 64 bits PGD on=
 85xx (32 bits)</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Hi,<br>
<br>
On Tue, Jul 02, 2024 at 03:51:28PM +0200, Christophe Leroy wrote:<br>
&gt; At the time being when CONFIG_PTE_64BIT is selected, PTE entries are<b=
r>
&gt; 64 bits but PGD entries are still 32 bits.<br>
&gt; <br>
&gt; In order to allow leaf PMD entries, switch the PGD to 64 bits entries.=
<br>
&gt; <br>
&gt; Signed-off-by: Christophe Leroy &lt;christophe.leroy@csgroup.eu&gt;<br=
>
<br>
With this patch in the mainline kernel, all my boot tests based on the<br>
mpc8544ds qemu emulation start crashing. Example crash log:<br>
<br>
kernel BUG at include/linux/pgtable.h:1599!<br>
Oops: Exception in kernel mode, sig: 5 [#1]<br>
BE PAGE_SIZE=3D4K MPC8544 DS<br>
Modules linked in:<br>
CPU: 0 UID: 0 PID: 1 Comm: swapper Tainted: G&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; N 6.11.0=
-rc1 #1<br>
Tainted: [N]=3DTEST<br>
Hardware name: MPC8544DS e500v2 0x80210030 MPC8544 DS<br>
NIP:&nbsp; c01f51b8 LR: c01f6fec CTR: 00000000<br>
REGS: c4135c40 TRAP: 0700&nbsp;&nbsp; Tainted: G&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; N&nbs=
p; (6.11.0-rc1)<br>
MSR:&nbsp; 00029000 &lt;CE,EE,ME&gt;&nbsp; CR: 24228288&nbsp; XER: 20000000=
<br>
GPR00: c01f6fc0 c4135d30 c415bf20 c762e3f0 c29c9318 c7624ff8 0000026b b5fc2=
ea1<br>
GPR08: 00000000 00000000 5a5a5000 b7f4dd55 44228282 00000000 c0005014 00000=
000<br>
GPR16: 00000000 00000000 00000001 00050003 24228282 24228282 00000000 00000=
095<br>
GPR24: c1375b30 c4135de8 c4135e48 00050003 c762e3a0 c762e3f0 bffffff1 c7676=
a08<br>
NIP [c01f51b8] pmd_write.constprop.0.isra.0+0x4/0x8<br>
LR [c01f6fec] follow_page_mask+0x150/0x17c<br>
Call Trace:<br>
[c4135d30] [c4135de8] 0xc4135de8 (unreliable)<br>
[c4135d40] [c01f6fc0] follow_page_mask+0x124/0x17c<br>
[c4135d70] [c01f7170] __get_user_pages+0x158/0x5d8<br>
[c4135dd0] [c01f7750] get_user_pages_remote+0x160/0x560<br>
[c4135e30] [c026838c] get_arg_page+0xb0/0x25c<br>
[c4135e70] [c0268dd4] copy_string_kernel+0xf0/0x200<br>
[c4135eb0] [c026a0e4] kernel_execve+0xbc/0x190<br>
[c4135ee0] [c0005108] kernel_init+0xf4/0x1d4<br>
[c4135f00] [c0016224] ret_from_kernel_user_thread+0x10/0x18<br>
<br>
This is with v6.11-rc1; the actually observed crash differs from test<br>
to test while running bisect.<br>
<br>
I can't just revert the patch because subsequent patches depend on it.<br>
Is this confirmed to work on real hardware ? If so, do you have a<br>
suggestion how I could continue to use the mpc8544ds emulation for<br>
testing, or is it just dead ?<br>
<br>
For reference, the configuration file is mpc85xx_defconfig.<br>
Bisect log is attached.<br>
<br>
Thanks,<br>
Guenter<br>
<br>
---<br>
# bad: [8400291e289ee6b2bf9779ff1c83a291501f017b] Linux 6.11-rc1<br>
# good: [2c9b3512402ed192d1f43f4531fb5da947e72bd0] Merge tag 'for-linus' of=
 git://git.kernel.org/pub/scm/virt/kvm/kvm<br>
git bisect start 'v6.11-rc1' '2c9b3512402e'<br>
# bad: [6dc2e98d5f1de162d1777aee97e59d75d70d07c5] s390: Remove protvirt and=
 kvm config guards for uv code<br>
git bisect bad 6dc2e98d5f1de162d1777aee97e59d75d70d07c5<br>
# bad: [30d77b7eef019fa4422980806e8b7cdc8674493e] mm/mglru: fix ineffective=
 protection calculation<br>
git bisect bad 30d77b7eef019fa4422980806e8b7cdc8674493e<br>
# good: [c02525a33969000fa7b595b743deb4d79804916b] ftrace: unpoison ftrace_=
regs in ftrace_ops_list_func()<br>
git bisect good c02525a33969000fa7b595b743deb4d79804916b<br>
# good: [8ef6fd0e9ea83a792ba53882ddc6e0d38ce0d636] Merge branch 'mm-hotfixe=
s-stable' into mm-stable to pick up &quot;mm: fix crashes from deferred spl=
it racing folio migration&quot;, needed by &quot;mm: migrate: split folio_m=
igrate_mapping()&quot;.<br>
git bisect good 8ef6fd0e9ea83a792ba53882ddc6e0d38ce0d636<br>
# good: [a898530eea3d0ba08c17a60865995a3bb468d1bc] powerpc/64e: split out n=
ohash Book3E 64-bit code<br>
git bisect good a898530eea3d0ba08c17a60865995a3bb468d1bc<br>
# bad: [00f58104202c472e487f0866fbd38832523fd4f9] mm: fix khugepaged activa=
tion policy<br>
git bisect bad 00f58104202c472e487f0866fbd38832523fd4f9<br>
# good: [e081c14744f4a93514069e1af1a7273d5451b909] powerpc/e500: remove enc=
 and ind fields from struct mmu_psize_def<br>
git bisect good e081c14744f4a93514069e1af1a7273d5451b909<br>
# bad: [57fb15c32f4f6a4f1a58f1fbc58a799c3f975ed8] powerpc/64s: use contiguo=
us PMD/PUD instead of HUGEPD<br>
git bisect bad 57fb15c32f4f6a4f1a58f1fbc58a799c3f975ed8<br>
# bad: [276d5affbbaea4d369d1e5b9711cb2951037f6ee] powerpc/e500: don't pre-c=
heck write access on data TLB error<br>
git bisect bad 276d5affbbaea4d369d1e5b9711cb2951037f6ee<br>
# bad: [84319905ca5f3759c42082e20ed978c81f4dead0] powerpc/e500: encode huge=
page size in PTE bits<br>
git bisect bad 84319905ca5f3759c42082e20ed978c81f4dead0<br>
# bad: [6b0e82791bd03b2326c7f7d8c1124c825742f2a4] powerpc/e500: switch to 6=
4 bits PGD on 85xx (32 bits)<br>
git bisect bad 6b0e82791bd03b2326c7f7d8c1124c825742f2a4<br>
# first bad commit: [6b0e82791bd03b2326c7f7d8c1124c825742f2a4] powerpc/e500=
: switch to 64 bits PGD on 85xx (32 bits)<br>
</div>
</span></font></div>
</div>
<br>
<p style=3D"font-family:Tahoma;font-size:9pt;color:#CF022B;margin:5pt;font-=
style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
C2 &#8211; Usage restreint<br>
</p>
</body>
</html>

--_000_AM0PR07MB496234BE973D5458C53517F29BB12AM0PR07MB4962eurp_--
