Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A28F069D669
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Feb 2023 23:42:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PLHV542pMz3cB9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Feb 2023 09:42:05 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=YbqHTODe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1f::60b; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=leoyang.li@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=YbqHTODe;
	dkim-atps=neutral
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on060b.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::60b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PLHT52VnTz3bZx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Feb 2023 09:41:10 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EXA83TaH/7apoBn2zQ5sPmFWJPFva9w/ISFIPqBi6+ZyQgd9+q0ePGjwtitmCWdRfS/2hRbPO/NI7crRB6EM9CsOLPHE8KkeHBbPGuLp/WQhX7I4jSvsdeXBI+sZEamlDEhjXuLfjrsrmAdYAq4dlRzxYVlvk9Pcdch6M6gDNUvRG03UW+Wh4jlXN0dhPAFfmCid4kuf0QbuxkmLLG0ymzuv1gG9cnL6PUPhOjjZkkRI/JWc7v4Yg68cpQFPCI88zk8xl2y1aSziScjIcIQdxbbazS/f696/hpyzIaYmHAsPctI1/pDleTtGPeXBm4cga1lPv66pQx2MVnKbyD+ztQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eEreIFfsveqBRW1JLDnqBCDeiBqZJlbaISgID4IWYcc=;
 b=W+Z/soN8CI2v0q4TXOdyx2EXTlY/w7ME3jx6M1xHo3dowXVpzXIiRjgz54qXT/dE7XIR8G6IePwSlXUGJNeyralo6nnJhMp9wRORf/uaI5F2lueEs14f+/nNhRsnZDfnhZzxsgfOeTGZ42JYpScnfxH9tO9cYev0hbNDlONqk//GUIkL41ehCmOaf4oyUHE9zm7mpS1H8JVym3bPvA2z2LRuVmP0dH04pjGL27c3GlY5X6aZZjW90LBoxK/AuxKcmBgI9J3sAiZUJ+UJ7KKGgWnQwuPqAkeEzMtbI/cAFkweuBqNN4w1ceaqGrmGHVlnY6Xj9Wg7sasxlpzOH0ELRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eEreIFfsveqBRW1JLDnqBCDeiBqZJlbaISgID4IWYcc=;
 b=YbqHTODe2gqSvMGItQ/FBRevdq7IDcA5NzF1lrcjL4cpakDac7m8+U/nozZLYcC6X9rk1E/G49jwUt3W+QEvd1e2eN46YwcEnMTe/78u3/gMRfVvcYRv0srnoClAmPyuTMNTqAf8qVWl4hSpsIXEXOdoW+tMMm4fIS5TUtrngU0=
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com (2603:10a6:208:145::23)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Mon, 20 Feb
 2023 22:40:46 +0000
Received: from AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::509:96a2:4382:6b51]) by AM0PR04MB6289.eurprd04.prod.outlook.com
 ([fe80::509:96a2:4382:6b51%4]) with mapi id 15.20.6111.021; Mon, 20 Feb 2023
 22:40:46 +0000
From: Leo Li <leoyang.li@nxp.com>
To: Paul Gortmaker <paul.gortmaker@windriver.com>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: RE: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Thread-Topic: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Thread-Index: AQHZRSLd3/nvLydEnkiHOk+Mz5gE667YbVWA
Date: Mon, 20 Feb 2023 22:40:46 +0000
Message-ID:  <AM0PR04MB628956306C4E5A84ED973FCC8FA49@AM0PR04MB6289.eurprd04.prod.outlook.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
In-Reply-To: <20230220115913.25811-1-paul.gortmaker@windriver.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR04MB6289:EE_|PAXPR04MB8735:EE_
x-ms-office365-filtering-correlation-id: 47c1665c-d6ae-4941-7fe3-08db139381e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  01YfFBq4jQ8bVmgzxcCyZPLk0qTbFwZ7XVNPDIXsQ27wJ0rdTI0CT1wmvaT7nuYXzp3koOE6BYDyOiodzpWxzEaBsXI90j5vvYUCrxy+9N15w7r/KR85/637TlZ7oQfo5AFgV/uQJ26cj7jALzxJvgcqEWghBiEwC07JeJlV1l97lWHMfsZb748BOaYki2jJbgnm7CkypHWLglqbeorq+qfwWulI0jX5jmJEotAJLlX/tfUKr4pIMZ4YTlN1yGG9TpxcAN8JGVFMQOv+Jiwkw5Qk1BvS+92oLjWk7w1PShnhFRI9ugcY/XVBMleOmvAOOZuSRw9PoUnZuHWpgAbMP9owKPvRZYQGUFz14ELAcIyNTojHjMbrzGEq2lsRTqRrKWv17lN4V41uDXbXV+PUFzM+/ItCVhg1EwwlPowScG6DUS9ZI1eJVCe1uWiKyLewFbVugL+xwgyM6GB7aDibNCHBw4vUEVs/NoiOQFLGWENd4N9yUuY2+RhFbzLp5RubOcgvx+cKhVf3IpPr29F+Agc+AyRhLkIUKt/zP8HmEjRrY+EPaLDJEM9gKFt1SDtYxAdhsaa/6+VNv8ZRm28zab0Ekm+jvveMYW878FfQ67pIHfIDb6TqhvYpTpC6LjAN1orviMB7ob/FKD9f1a6aAkm9pvGI4F0jzHWpjUGSG7L1wfrdSUYCMTfg+N/qGXdroKezMyDhn40706ctiZQfPA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR04MB6289.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(396003)(346002)(376002)(39860400002)(366004)(136003)(451199018)(86362001)(38070700005)(33656002)(41300700001)(52536014)(5660300002)(2906002)(8936002)(38100700002)(83380400001)(122000001)(478600001)(45080400002)(64756008)(8676002)(66946007)(66446008)(66476007)(66556008)(7696005)(76116006)(110136005)(54906003)(71200400001)(966005)(26005)(186003)(9686003)(55236004)(53546011)(55016003)(4326008)(316002)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?us-ascii?Q?Z6SPTX58b2+odoemaHAXJeSkpDtY39abBa7PR1hdjhsV2dGpkn5PQAhHy6nT?=
 =?us-ascii?Q?IUy4ALdau41ntzfWtKeWHze9Pq6kAs4jLIq5Sp+qCchnvV/rstiB49plh2KO?=
 =?us-ascii?Q?J3+4T+319q22kse3syau05EELQaZrJhbxogkXAmxlqx5tTj1jJuJUwC1bDB0?=
 =?us-ascii?Q?3oy0cq9yf+lk7ng6417mJu+LnIP+Ksq4zTDhgiUgQpQYK1TghyxgV+KSAD7v?=
 =?us-ascii?Q?iznNGE8TxbEklkSIUf6CRKpJbemwUZj9NRP29/3bMo809W08BnNdehtAtJVA?=
 =?us-ascii?Q?VvXX/BSPG8DUxYv4Uo11XbP06sBkoWunJexmZXa8t1w9/5L6qOQVqM56nXu/?=
 =?us-ascii?Q?/FqG5G0rC6Q2U8JaQ5MooZQsjz4GVsK69BcTAb0gats6GYQ6rXIr50kozUEU?=
 =?us-ascii?Q?SpaEEBRM8U7TwJ+2Z++5fheDvUuhmyFcHhJEC8UE4txFfc+7i9+45VTco/QJ?=
 =?us-ascii?Q?7Q0HDcC8QGNNd/yCNIUORe19GJUItcKl2rwCx9hMgtkOiHbQF6wyP8ICQY2B?=
 =?us-ascii?Q?2/4NVeG23zKod/Vy822ukTzP3Fbn4VMw3YhYL4UZK/yBY80Xy7NUPbMNdNAT?=
 =?us-ascii?Q?ne0vAS+t3kgtHcThneaIMGKweDO7SIZuo8iVZaV37J4fl/CZW6SdXkcLUo3D?=
 =?us-ascii?Q?/NEVio5QLtsJwKMfstWKjsv6s6f5hZQxNF4TEXWTCoDbvVAYKNiCshqrSLAU?=
 =?us-ascii?Q?syrtg47ICxZeptzof+goL3ZJN+WKMD77lNqTk1mHWUBwRANdoQjj6ltfufmd?=
 =?us-ascii?Q?ZbunI5kp3ru8QdKCWe9Bau7nH2FzRP69Xt98R6KQvhxnkDJTkwVAYjVQxfY/?=
 =?us-ascii?Q?KO4993WTIEOsqWBo++xKeZYKTMO6kZ/IIvf7Jwy1VgDzZR7EBnmDvWWs4Wmb?=
 =?us-ascii?Q?k31C4d1V0EvNewlGguwbGCifMPaDg0+oH8hqBQvebs4vUGV5DDK4Q8vTKdf/?=
 =?us-ascii?Q?z1oRPC7nMqGikbWjTXPFcPTqpAujWmEBOBjX2e3/0SgoM45zitCossVWYOlC?=
 =?us-ascii?Q?AJnpgndBt0GGdwimiBMF+rd4xfFiJw7BoPjHfo5+ROu9qhOCF0eMtOqZI8Y5?=
 =?us-ascii?Q?Cv1gM4A9Qbahl/TFWOdaBRLwkNzPHZkJ5obg0C2vjZxjoWghWPzzXLjYnsrw?=
 =?us-ascii?Q?J9X+i4mfGMjFyghbwUiqMQOZUpX4gWYoJ8SEvtFooHbfooQKPaC2Z5rrg0WG?=
 =?us-ascii?Q?YEglxNsmUbPOQ1ANW9zYuZLHwU/YEYSG8COFXu4E7BbKiOn3eKe/JfFbR2Il?=
 =?us-ascii?Q?YhxSsC+fbXyu+WCRbSqaqFK0g+O5R+ZOQ/TcHLVdLzfaElSL4YNUIU+YvJeQ?=
 =?us-ascii?Q?/WwTnIFSmFRHRFatqx6c/eZInZAN5N1P+q0MAhPSOYPI2MjPx4ccmexacj3j?=
 =?us-ascii?Q?6IPkwEp48eLztDsFFiesjUCsgTa38j440337vMREH6MbWky0zeCDbln8cf7g?=
 =?us-ascii?Q?EywnR63cSkoRZpRvgKFHLbgoiUY3csvs6oaza50yChuLo9Ek639+38R0qeYc?=
 =?us-ascii?Q?j18VL5AipPiUtPYS3hWsZUqMp8W6h+kdqBKCq2Ky+/GLz0cYWolY7D6aFubN?=
 =?us-ascii?Q?c4bMYhl1Jirl1yl67wZ6ZA+SwavFRUscBKBrQTkf?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR04MB6289.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47c1665c-d6ae-4941-7fe3-08db139381e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2023 22:40:46.3100
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HLnVV01Tghi9dcprjEGJRH6FB8YmYVYp/NkMyPIpSSQN3A7b/DUdlseRFOZsNzp4PEwOBSygCn1vZ1Hfgl66sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735
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
Cc: Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> -----Original Message-----
> From: Paul Gortmaker <paul.gortmaker@windriver.com>
> Sent: Monday, February 20, 2023 5:59 AM
> To: linuxppc-dev@lists.ozlabs.org
> Cc: Leo Li <leoyang.li@nxp.com>; Claudiu Manoil <claudiu.manoil@nxp.com>;
> Paul Gortmaker <paul.gortmaker@windriver.com>; Scott Wood
> <oss@buserror.net>; Michael Ellerman <mpe@ellerman.id.au>; Benjamin
> Herrenschmidt <benh@kernel.crashing.org>; Paul Mackerras
> <paulus@samba.org>
> Subject: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
>=20
> [This RFC is proposed for v6.4 and hence is based off linux-next.]
>=20
> This series removes support for four e300 (MPC83xx) Freescale processor
> family evaluation boards that were added to the kernel in the 2006 era.

Thanks.  Let me discuss this with our marketing team to see if they have an=
y valid reason to keep them around.

>=20
> These boards were all of a very similar form factor, a largish PCI or PCI=
-X card
> that could also be used standalone with an external power brick, and all
> shared the Modular Development System (MDS) designation.
>=20
> These platforms were made in limited quantity and were generally designed
> to get early silicon into the hands of OEMs who would later develop their
> own boards/platforms.  As such, availability was limited to those who wou=
ld
> be working on boards and/or BSP support.
>=20
> Many early revision MDS platforms used a mechanical clamping system to
> hold the BGA CPU in place to facilitate CPU updates -- something not
> normally possible for a soldered down BGA in a COTS system.
>=20
> The point of these details is to give context that reflects that these fo=
ur
> boards were made in limited quantities, were not in a form factor that is
> really "hobbyist" friendly and hence make sense for removal 17 years late=
r.
>=20
> Here, we remove the MPC8548E-MDS[1], the MPC8360E-MDS[2], the
> MPC837xE-MDS[3], and the MPC832x-MDS[4] board support from the kernel.
>=20
> There will still exist several e300 Freescale Reference Design System (RD=
S)
> boards[5] and mini-ITX boards[6] with support in the kernel.  While these
> were more of a COTS "ready to deploy" design more suited to hobbyists, it
> probably makes sense to consider removing these as well, based on age.
>=20
> But before we get to that, lets see how this goes -- and then we should l=
ook
> at similar early e500 evaluation platforms [MPC8540-ADS, etc] next, as th=
e
> oldest there date back to 2002[7] -- before considering RDB/mITX.
>=20
> I intentionally didn't put any links in the commits, since as we all know=
, they
> tend not to be stable long term, so keep them here in the merge data.
> Credit to NXP for keeping around these old legacy docs this long!
>=20
> Paul.
>=20
> --
>=20
> [1]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .nxp.com%2Fdesign%2Fqoriq-developer-resources%2Fmpc8349e-modular-
> development-
> system%3AMPC8349EMDS&data=3D05%7C01%7Cleoyang.li%40nxp.com%7Ca2
> 820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> 7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300
> 0%7C%7C%7C&sdata=3DQ4COgwpjsE4mHXvl9HdGo3otPCYML3z%2FR6IoCEYRE
> wg%3D&reserved=3D0
> [2]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .nxp.com%2Fdocs%2Fen%2Fuser-
> guide%2FMPC8360EMDSUM.pdf&data=3D05%7C01%7Cleoyang.li%40nxp.com
> %7Ca2820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c30
> 1635%7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8ey
> JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> 7C3000%7C%7C%7C&sdata=3DJyLT0MfGAHQ8a%2FNgpLdVFtyACkwPR%2FOkB
> yN1aW0wySs%3D&reserved=3D0
> [3]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .nxp.com%2Fproducts%2Fprocessors-and-microcontrollers%2Flegacy-mpu-
> mcus%2Fpowerquicc-processors%2Fpowerquicc-iii-mpc85xx%2Fmpc837xe-
> modular-development-
> system%3AMPC837XEMDS&data=3D05%7C01%7Cleoyang.li%40nxp.com%7Ca2
> 820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> 7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300
> 0%7C%7C%7C&sdata=3D052dpEEcGmbuhRLnMDCNoOkTeguF%2BPA0oJGNvV1
> jSjI%3D&reserved=3D0
> [4]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .nxp.com%2Fproducts%2Fprocessors-and-microcontrollers%2Flegacy-mpu-
> mcus%2Fpowerquicc-processors%2Fpowerquicc-ii-pro-mpc83xx%2Flow-
> power-powerquicc-ii-pro-processor-with-ddr2-tdm-pci-security-usb-quicc-
> engine-with-
> utopia%3AMPC8323E&data=3D05%7C01%7Cleoyang.li%40nxp.com%7Ca2820c1
> e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> 7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7
> C%7C%7C&sdata=3DmZQh%2FogNgNUb0wNJV972kYIDvn61gx0TWNd1u1d7PZ
> Q%3D&reserved=3D0
> [5]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .nxp.com%2Fdocs%2Fen%2Ffact-
> sheet%2FMPC8379ERDBFS.pdf&data=3D05%7C01%7Cleoyang.li%40nxp.com%7
> Ca2820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c3016
> 35%7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJ
> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> 7C3000%7C%7C%7C&sdata=3DEJmP6Regr7zpvYvHUmX64h3LZSaBT3Mb1h%2BN
> KQT%2FUls%3D&reserved=3D0
> [6]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .digikey.ca%2Fen%2Fproducts%2Fdetail%2Fnxp-usa-inc%2FMPC8349E-MITX-
> GP%2F1204733&data=3D05%7C01%7Cleoyang.li%40nxp.com%7Ca2820c1e44264
> 0c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7
> C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%
> 7C&sdata=3Dhw6IQDUaXH6huQFCnCkFIbNfj1xMrq%2FanDMUU%2FXZYQg%3
> D&reserved=3D0
> [7]
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fwww
> .nxp.com%2Fdocs%2Fen%2Freference-
> manual%2FMPC8560ADSUG.pdf&data=3D05%7C01%7Cleoyang.li%40nxp.com%
> 7Ca2820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301
> 635%7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJ
> WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> 7C3000%7C%7C%7C&sdata=3DEd%2BZR07y9Sp8xx5H47SAXzk9ET73creygxk%2B
> emmbfuA%3D&reserved=3D0
>=20
> Cc: Scott Wood <oss@buserror.net>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Li Yang <leoyang.li@nxp.com>
> Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
>=20
> ---
>=20
> Paul Gortmaker (4):
>   powerpc: drop MPC834x_MDS platform support
>   powerpc: drop MPC836x_MDS platform support
>   powerpc: drop MPC837x_MDS platform support
>   powerpc: drop MPC832x_MDS platform support
>=20
>  arch/powerpc/boot/Makefile                    |   1 -
>  arch/powerpc/boot/dts/mpc832x_mds.dts         | 436 ---------------
>  arch/powerpc/boot/dts/mpc834x_mds.dts         | 403 --------------
>  arch/powerpc/boot/dts/mpc836x_mds.dts         | 481 -----------------
>  arch/powerpc/boot/dts/mpc8377_mds.dts         | 505 ------------------
>  arch/powerpc/boot/dts/mpc8378_mds.dts         | 489 -----------------
>  arch/powerpc/boot/dts/mpc8379_mds.dts         | 455 ----------------
>  .../configs/83xx/mpc832x_mds_defconfig        |  59 --
>  .../configs/83xx/mpc834x_mds_defconfig        |  58 --
>  .../configs/83xx/mpc836x_mds_defconfig        |  64 ---
>  .../configs/83xx/mpc837x_mds_defconfig        |  58 --
>  arch/powerpc/configs/mpc83xx_defconfig        |   4 -
>  arch/powerpc/configs/ppc6xx_defconfig         |   4 -
>  arch/powerpc/platforms/83xx/Kconfig           |  32 --
>  arch/powerpc/platforms/83xx/Makefile          |   4 -
>  arch/powerpc/platforms/83xx/mpc832x_mds.c     | 110 ----
>  arch/powerpc/platforms/83xx/mpc834x_mds.c     | 101 ----
>  arch/powerpc/platforms/83xx/mpc836x_mds.c     | 210 --------
>  arch/powerpc/platforms/83xx/mpc837x_mds.c     | 103 ----
>  19 files changed, 3577 deletions(-)
>  delete mode 100644 arch/powerpc/boot/dts/mpc832x_mds.dts
>  delete mode 100644 arch/powerpc/boot/dts/mpc834x_mds.dts
>  delete mode 100644 arch/powerpc/boot/dts/mpc836x_mds.dts
>  delete mode 100644 arch/powerpc/boot/dts/mpc8377_mds.dts
>  delete mode 100644 arch/powerpc/boot/dts/mpc8378_mds.dts
>  delete mode 100644 arch/powerpc/boot/dts/mpc8379_mds.dts
>  delete mode 100644 arch/powerpc/configs/83xx/mpc832x_mds_defconfig
>  delete mode 100644 arch/powerpc/configs/83xx/mpc834x_mds_defconfig
>  delete mode 100644 arch/powerpc/configs/83xx/mpc836x_mds_defconfig
>  delete mode 100644 arch/powerpc/configs/83xx/mpc837x_mds_defconfig
>  delete mode 100644 arch/powerpc/platforms/83xx/mpc832x_mds.c
>  delete mode 100644 arch/powerpc/platforms/83xx/mpc834x_mds.c
>  delete mode 100644 arch/powerpc/platforms/83xx/mpc836x_mds.c
>  delete mode 100644 arch/powerpc/platforms/83xx/mpc837x_mds.c
>=20
> --
> 2.17.1

