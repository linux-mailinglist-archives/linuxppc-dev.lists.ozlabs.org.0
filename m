Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E2F24BB7EF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 12:19:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K0TjQ0jNhz3cYT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Feb 2022 22:19:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256 header.s=selector2 header.b=GKIvwLTx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=infinera.com (client-ip=2a01:111:f400:7e88::615;
 helo=nam10-dm6-obe.outbound.protection.outlook.com;
 envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256
 header.s=selector2 header.b=GKIvwLTx; 
 dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on20615.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e88::615])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K0Thb1j5vz3bbW
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Feb 2022 22:18:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPdUvsKbTeKAPcP7pg7nQYIAYqGxF3//Yl2VRLOscIesNW5qKG+Dae+f1mYT9sIo3Viqh56zwRgo0gTtZhz7+da59iNtY9yyDl3i0ltSGmOT7k8yMv88NQoel21caSDvi7TiNTIFlDkdcD/kcf5ilyGGSIwBycqZXbDdM/dz3ueaeSBc+Jprtz7G6eYIFZCxA1Xltmg2lmTogsgnSjv5/FVvB1zWfR8/kPIKGy1Iy54pH7NgVdJz+x3IkK6+7grNoM5f+UGOTJEtHOHQDExzPAWYtluClLb0eMrfOdMn/dtWOkc2NNai0RSEKqWoP8Li4hqtQ70h7H0mClaq1+TX2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qelq0+kc6OAO12IfUQ6LA1Co8xHJZ/hrSUPjVulMz5w=;
 b=cJfrgeGwfW8XqJT/lGlsAdQ6eC+ROR0wP9KGBI8zdduojIS+fU94FffgpYkIFuoWkyKg8xGT7FiBJX/6vKHzxPCPpY9q/byVO6JjTdaIvjmG8cbm+OuvT+9n8RX80GngoVKbWsrZ3QKWOa2bs3KElXLiISltFt6pVBzIs3UPJuJWso0mW2WlGrZSoKWFx2cjklUsarjTCPKmq63Vz2fd/lSCjpgU5xc/g4mF55iGErWdycoOlxWwgkOkXW2gYZ8ZvMjfz+QOexFks7mNBiBvE1yUOJHLyM2uFOsOPwND5MyECvGuLSH2OmWzuc7OWCjTCV91G9YOIb6mhUjyCvWfOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qelq0+kc6OAO12IfUQ6LA1Co8xHJZ/hrSUPjVulMz5w=;
 b=GKIvwLTxuETEHjtkYk1rEkn9RmZMca8jY+FxLYv/I9tGIDkXOACozSWJeWaLU3u7ni4H4nUCbw9M5pMmva/RKomsp7I9BmbiLhMnv7dK60zgSM+fSJi4w7yHcyMuUfqHmpoE7YydiTX3g8YxrYZWhC/3ElDvpAirCapo4h+i2BQ=
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by DS7PR10MB4928.namprd10.prod.outlook.com (2603:10b6:5:3a1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Fri, 18 Feb
 2022 11:17:59 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::b4c9:b890:c6c2:1d48]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::b4c9:b890:c6c2:1d48%8]) with mapi id 15.20.4975.021; Fri, 18 Feb 2022
 11:17:59 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Topic: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
Thread-Index: AdfM5PT/NvfAW0+iTcC+AdIF01azggAtEqGAAKVd5oACc0lYgABIbVXQAbnCUAAA0DL90AAM8XwQAABPhqAAGbtsgAA3RpcAAD9HUaAABKxzgAA1v9lwCVXoO4AFpnkjgAAGlK90AACpdwAAAVOsCg==
Date: Fri, 18 Feb 2022 11:17:59 +0000
Message-ID: <PH0PR10MB46157BFF656AC1E17E83A302F4379@PH0PR10MB4615.namprd10.prod.outlook.com>
References: <AS8PR04MB89461BF7A3272E5A18ECD0948F669@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <MWHPR2201MB15205A333F1F610D332038AC91669@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <d0c52d26742b082f5a953a05630a9d70e0eb1356.camel@infinera.com>
 <527ebc333daa2a1d513ea217e5beb61a5acea3fb.camel@infinera.com>
 <AS8PR04MB894614C61E57A80EB4FF7C758F699@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <f31008a0f4e71ff029aa611b0ebcfd83f10ec67f.camel@infinera.com>
 <AS8PR04MB89464D90D2E92A5D401474BD8F6B9@AS8PR04MB8946.eurprd04.prod.outlook.com>
 <ce653a10-c004-75b1-5f70-e23c0c2aee68@leemhuis.info>
 <b6aa24cc-6ddc-7dda-b098-0033e4f6aa03@leemhuis.info>
 <PH0PR10MB4615990F8589556B65005387F4379@PH0PR10MB4615.namprd10.prod.outlook.com>
 <Yg93SMnfNlDK7MIM@kroah.com>
In-Reply-To: <Yg93SMnfNlDK7MIM@kroah.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
suggested_attachment_session_id: 61fbd608-39ba-158d-a707-ecc4baa5df5f
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c3a5b5e2-a2b9-48c0-a498-08d9f2d05261
x-ms-traffictypediagnostic: DS7PR10MB4928:EE_
x-microsoft-antispam-prvs: <DS7PR10MB4928EDC460BA6ABF1BBA6D5DF4379@DS7PR10MB4928.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:972;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rItz+3ikbX2Nz/NzVYQuYjm7KmaORFP/4EJzJ6WwtywZ8Pjnfa0XiTtnsMFFUJRQFdtSxDXRX+t7zOR846VOoIXGrw2JAstOAr61oiUmUlQfL+Qgon8yTxPS1mFmCTUMvjlHplTo+syc8GKQy3QDnWi27rNRrsWaSbngiFX6sjVGcChJrp42V58MEqBaWuVeJSse5wWJRRRoVdFoV0QFFfMS0o5Gg+PaL1Fvp7c3kiKDJsxsskxT2vVrXm+Z6p5rS8DHrVFbxpSjgZG+dFTXBoNHQjZluzm4hGixkxz8eaL2rTjWCa/yDBI3WcMr8NTST3fypuNnr11o4OgT1pCz9pLcydEhNSMhP54mrPjImLPaai13N7+LkT8eoDhQlQ7wnmjihc6RJlMlVUOqqK8Kb2/rBs8AAem5bGasOpTEyHb+YDCITbueYNrMpPIh55d4jV7NzrrrJ9ZC0wCCQfSoeqOMml/Yx29f7HcMHbILJ69GAaLgTOPpCVkStcAQuoiCIM77hth3foTxk8O0kI+seXdmnRuFSwulhdUdCPq2eu4yxVQdvQ8fqg/O8PbpJs1HYqt9X/2P1B/wlMxHy9W1u9hzBc7Yj49Uzh+UU3rykvfJNsv2bxHT9qNV035AgmOwEWbZczFIHs4cAWkA5NreWvjYiNxhTQInY6kkZZg5X9GAyVbFPH+lpSDlaGbUQ9PAK3rZvacq+80NUMtZNw/5uw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR10MB4615.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(33656002)(55016003)(6506007)(7696005)(86362001)(38100700002)(38070700005)(52536014)(8936002)(5660300002)(71200400001)(53546011)(4744005)(2906002)(122000001)(6916009)(54906003)(316002)(4326008)(508600001)(8676002)(64756008)(66476007)(66556008)(66446008)(66946007)(91956017)(76116006)(83380400001)(26005)(186003)(9686003);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?gmskh8iymhel9PM8hrPOoY0EjtaZUeqbcrjJqVJ7KMPbbEZ/IeGs/T0Iy3?=
 =?iso-8859-1?Q?e2Gh8a8AnBaczk8OculQ+TIRn75lDdBlY67Q+R69uaKLhezR/MOXMFUgmK?=
 =?iso-8859-1?Q?P+KC/uO6k66C52MMquk1SsIrY4HoqFH26PmU9qgLDlRE0d2m7C4AVCoWBt?=
 =?iso-8859-1?Q?ELCkDmA834b292E9djUdqQuk+OcQD42mXuUcM8mlkgqwXK3hqjO1L/UpvU?=
 =?iso-8859-1?Q?clFsdWE78nNjsZhQfBJqza/MW2LQlvoZeJ74OxRsWYxSFog8HS9goQQO/n?=
 =?iso-8859-1?Q?blF1eHOZpk+plQGEBXbfCKKqws2DzDI8fz3lSpPq87wIXY7bN6gujhczRQ?=
 =?iso-8859-1?Q?9f2vzeVZPv2HwjDovlzQ4G2PYg69LCvIOg6szdj0ugbEysdKM8hgsRDH0Y?=
 =?iso-8859-1?Q?iSlqpJaMELGvRWupd16Ipz4Z4z/5LseIr1jBBPNGQjh5YxI1SIdCNL0TDu?=
 =?iso-8859-1?Q?P2tAttn6WvU5IskcNTO9Cci5E2ZQVG/q0y++L2oclGW6V9Do+U4zrk4EKd?=
 =?iso-8859-1?Q?P3f6mQ57G5eSeoYkj60Ts2kaN9eUMR7v39+2eo4xuOhkkqVrSAD1YtTxyg?=
 =?iso-8859-1?Q?h+lHN1m+uZ3XqlVYKlqtwF+ueEpIScYLixnPUtzfm9+kvmuZFFNtBbqCyg?=
 =?iso-8859-1?Q?v7+Ne8IkWlIuUY5FUmK5Rzbl4p2WdPLv6qZf49Fsj3RtES9irmWrFfPGqv?=
 =?iso-8859-1?Q?29s7W71RxVI4ZhXKGn3Wk3hmoFYKDWNlMN7pW6HTWOj/MzdcXzJyHbzmnS?=
 =?iso-8859-1?Q?l9mDCIa1Uw6mgf2V+C9zynPn+/zhpsmJxGX8ZCRMUHO5yDT9sPgzPjtgr9?=
 =?iso-8859-1?Q?c3H/kyfp++sTlpGTSTLBQBRGV7GIiviRMwL6R5zGfg5DxRzTnUTHnrum3y?=
 =?iso-8859-1?Q?2D+g0h8b3utl/Cz3WF/Ny+dHMw6affEJvNX1Vjk7nA/ZUajRf5cBLz2ZoK?=
 =?iso-8859-1?Q?kwr7sFH5XXtW7rRQaAdbq1i8bXTrkjU9pVQVL+G5rMUPueo5N+S9aMR4Qb?=
 =?iso-8859-1?Q?We5hPI/DbWhVoQQ13vH+nntu+kDex94vqrfndYLMmwYAgEVFwWi+zwg58i?=
 =?iso-8859-1?Q?fDklIjO5tUIj61pmOIRk/2ZrrTLb0VEl++SqK5j12SvN+GZ4VoSbW0Rv9C?=
 =?iso-8859-1?Q?jkwsX+u6N2HZ3DbZ70SShP2Siyxa2Pc1ZVKV8vLbyycC6YPTKRBIGHEhgF?=
 =?iso-8859-1?Q?bRbiauXSgu5+U1ME0h+9Oi7n1eMO5za+dVourgndky7HRE1bQW7YY+5P8j?=
 =?iso-8859-1?Q?+hmzrnnuJXzmyUOx2TEQu0q9J5My/3BzYvLvtPrej0D5eeN+q1vEh3QaTk?=
 =?iso-8859-1?Q?Gtb+o+LPymgNexACJvJSoV68x+MZD0X57npDfi/jBX7SRyMrBjPugP6HDe?=
 =?iso-8859-1?Q?6AFS5sWXZ7e9ogBci/Z7Rv9zJFcgzCWuZxAM+leqI8ZumZL4cVBwf8DYSn?=
 =?iso-8859-1?Q?mYTLXg9BNutwIcu8a1pzLhIwrD/4usm/Mw0Do4+dq7/RIWfYc/bXudbq/J?=
 =?iso-8859-1?Q?gEqrSYMIWQWlRqpu0cFv7aRUQAJVqhjtpqEcQhs8+JLNpylUOLP98ttLy9?=
 =?iso-8859-1?Q?g0IYg+X73YfrQOQw0ghLKGqu9RhGCXCszHK1+aEmLkYbGw2VEpCXGTjwU+?=
 =?iso-8859-1?Q?bamkJxDbxC2121sqn3rJ6X5acofFNwKKrUAe7ALyUkag8mjlr6U0Zby6IO?=
 =?iso-8859-1?Q?u46q79CGLW1etprtoMQ=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3a5b5e2-a2b9-48c0-a498-08d9f2d05261
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2022 11:17:59.8104 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wDjimzwMvAF4l5t1vEVnyiBXG15ZpxflMYWtc92WrdYeONmdveZLbwdzHOtHShfONv06mLyQ9A382atBhsyT3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB4928
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
Cc: "balbi@kernel.org" <balbi@kernel.org>,
 "Eugene_Bordenkircher@selinc.com" <Eugene_Bordenkircher@selinc.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Leo Li <leoyang.li@nxp.com>, Thorsten Leemhuis <regressions@leemhuis.info>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I was happy with commit msgs and I don't know what the criticism was.=0A=
=0A=
________________________________________=0A=
From: gregkh@linuxfoundation.org <gregkh@linuxfoundation.org>=0A=
Sent: 18 February 2022 11:39=0A=
To: Joakim Tjernlund=0A=
Cc: Thorsten Leemhuis; Leo Li; Eugene_Bordenkircher@selinc.com; linux-usb@v=
ger.kernel.org; linuxppc-dev@lists.ozlabs.org; balbi@kernel.org=0A=
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to=
 unrecoverable loop.=0A=
=0A=
On Fri, Feb 18, 2022 at 10:21:12AM +0000, Joakim Tjernlund wrote:=0A=
> I think you could apply them as is, only criticism was the commit msgs.=
=0A=
=0A=
That is always a good reason to reject a change.  Please resubmit them=0A=
with the commit message cleaned up and I will be glad to review it=0A=
again.=0A=
=0A=
thanks,=0A=
=0A=
greg k-h=0A=
