Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B44C442FE89
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 01:09:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWMRf2486z3cSW
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 10:09:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=ZtbVsc1o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=windriver.com (client-ip=205.220.178.238;
 helo=mx0b-0064b401.pphosted.com;
 envelope-from=prvs=59223cdcd7=meng.li@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=windriver.com header.i=@windriver.com
 header.a=rsa-sha256 header.s=PPS06212021 header.b=ZtbVsc1o; 
 dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com
 [205.220.178.238])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWBlp5b9Jz2xY1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 03:38:13 +1100 (AEDT)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
 by mx0a-0064b401.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19FGbZEs006363; 
 Fri, 15 Oct 2021 16:38:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=PPS06212021;
 bh=lxXgKhg1whE4Xfv7UD8qy9L41H/sgpVdOIMLBbOexSg=;
 b=ZtbVsc1o6XL3m8+yRLOgkgjUsqfUSkvEaQM0Yki+OU0vPnHNnLB2aIm65vAzzdIQ71Fi
 TpnC27KiXnyAf0dOPiSzaoGJjQ08DJmol2Y98Q8rRYzS/2PEkA4ZSr35T1tksam2CwPx
 SKTT1T1lT75ByPNExpyMl2L36LxGGDS+UIfzL5D6gAgLBaRfZmVyG2XW3mLz//PQIQOm
 pBYlLkwpiSM8vDwvnQu6A0z44worDvbyehozW6tpRPgeKeIRkXGdmuMghUj/nZAbFszp
 yiy0VW19K3AXRjAaDt/NI2h+AC2R3tfQ93fkj9NWJFE6cEdv1f8gu7Wsy5dPw2r+E16c fg== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
 by mx0a-0064b401.pphosted.com with ESMTP id 3bq7yj0at2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 15 Oct 2021 16:38:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Thd0smk18z2JRDJXc3fYY5ld1PaJXa1Td84SIIixCJKcE1EWOni9hiUtMH23tH1emKLZ4Nj6/3P/ww6ep5Izs5fRob3C0IGBjXOimb9OsrJX3ZGxrdxxH20iEHfHxOFQu1L1zp/BZeDHHNgDbrJiv0rLlVLhu/UZGrs1p9tYK336khhQO1KRq6NQtdyLoyUtwDxH6VyoH2Ba1rrfaTcSEvSNyID7BjSTuPmnGec8kYfOnXVDRDDKxWCBBl1CMaQHJVuJl/nECEPaq+UoXYnfM38wZotkoKRS+ITxyCmX4KbfKKCkHfPg9DPnH/JF+kuyMrvowbqS7vSxLp/wscK45Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxXgKhg1whE4Xfv7UD8qy9L41H/sgpVdOIMLBbOexSg=;
 b=eX+WIPgs4EkVTlF6tCurcpfQXh3ey7SUu/Jw/EcXmvxwqQPWbDml/v/7mUvNBJzUfCZSCiZVm/Zqa62wXUXHLseh0K51F6PbtgKEwSAwNcpWnnNAU/QhuwDsAf72D7cK49apAa9PlsOudM/7LmtYRVu/jbmDZ98M+JhWVWcJt1kunHgzsjXAVe0u/tsAzJpVMAAScIpoUfENi41BCa5wEogeJtpQCdy75AegUXRGZKKWl5fRJuH2DragYkEwTf/LfrRoyxv79jxUsTozl6khFAdgD4vpAIljDyH55y0vRbQrNO1T05GXSk7Bu6H2nMbPsKKBNwxVQ2q9MTKK+b2hYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from PH0PR11MB5191.namprd11.prod.outlook.com (2603:10b6:510:3e::24)
 by PH0PR11MB4790.namprd11.prod.outlook.com (2603:10b6:510:40::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Fri, 15 Oct
 2021 16:37:59 +0000
Received: from PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::c11a:b99e:67ce:4a14]) by PH0PR11MB5191.namprd11.prod.outlook.com
 ([fe80::c11a:b99e:67ce:4a14%8]) with mapi id 15.20.4608.017; Fri, 15 Oct 2021
 16:37:59 +0000
From: "Li, Meng" <Meng.Li@windriver.com>
To: Robin Murphy <robin.murphy@arm.com>, "Roy.Pledge@nxp.com"
 <Roy.Pledge@nxp.com>, "leoyang.li@nxp.com" <leoyang.li@nxp.com>,
 "ruxandra.radulescu@nxp.com" <ruxandra.radulescu@nxp.com>,
 "horia.geanta@nxp.com" <horia.geanta@nxp.com>
Subject: RE: [PATCH] soc: fsl: dpio: protect smp_processor_id when get
 processor id
Thread-Topic: [PATCH] soc: fsl: dpio: protect smp_processor_id when get
 processor id
Thread-Index: AQHXwY73N8LVoX+fqEKyyBYEYT7C5KvUESIAgAAxLcA=
Date: Fri, 15 Oct 2021 16:37:58 +0000
Message-ID: <PH0PR11MB51910D813AD10B93CFADFB67F1B99@PH0PR11MB5191.namprd11.prod.outlook.com>
References: <20211015063601.23303-1-Meng.Li@windriver.com>
 <ba116805-8e41-1502-6cd4-acc1d5e5fa41@arm.com>
In-Reply-To: <ba116805-8e41-1502-6cd4-acc1d5e5fa41@arm.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: arm.com; dkim=none (message not signed)
 header.d=none;arm.com; dmarc=none action=none header.from=windriver.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: af4fc33d-b1e1-460f-95d1-08d98ffa2603
x-ms-traffictypediagnostic: PH0PR11MB4790:
x-microsoft-antispam-prvs: <PH0PR11MB479081D1CF4E1C99D4ED603BF1B99@PH0PR11MB4790.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: QJYKd/M6FPD2MtuQFUAcsIPpv74fHuATnjaOjCuusQz1fRsJqKwMjd1G1cJCpH4Cw/c7YvWUAoNukz5QnE61NDlFYeSkuSZXmynri7MMCGfyhfAS6mwk4sC6QJqHPTblkOCAKaMEWSmn6c/X2OjZhFbiHxEzTvNhSD27iE3ln4/XVgVGzZfQQHxzUSumVC06ppU2nfJd3w2tNVmm/3eTq9PwAS03MGxRblkqGgRqU9X9/ZNKNqa+RgYXKJMCTgvjJOH+bqCntBBaswv6r/Kbklbr4mVjg5x4UlbKClYSQOBDPBlh4TR1A4S81GvL7DN6f8A2cUN0tlIoUYL0dt3c9rpP5+LWqhZmxGCRgvgM9+c8CGuxte3xs6hm4rwTuJXtHDJgcUHp70AG2NfcgfVNdt/Pd/1r/LfFwZFBVtm8vOfEe70odhgPEfvamOw+0aItliEneqUdHmsw1Bv/htO0fuEsY8o6gZH5RSGcnN8sY5h8FVtiCNKjNYUQNZZfCH0T6aLgWjD3NZYxeK5oK8dg+KsiMmIm2OmLS/ejzqBoRQaAAN9Xy+jkzxDBV9XisN9W9w49SH0ukjdQ6juKiLOUbPf8a4hIlHqzvJXtCJrSMuy3sIjgTPYtkhR0J2NkHkyC5lYum+iCLexqTn0lO/rVLD2nM+g3RRT2uSo5aDmV1h20ee+B1zoLz3u+AHj+FWdEjzVWrnqEr5l1qI3L2/UgqQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5191.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(7696005)(66556008)(66476007)(86362001)(38100700002)(55016002)(76116006)(53546011)(66946007)(26005)(9686003)(186003)(8676002)(2906002)(6506007)(33656002)(4326008)(71200400001)(64756008)(66446008)(122000001)(110136005)(54906003)(316002)(8936002)(83380400001)(4001150100001)(508600001)(52536014)(38070700005)(5660300002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cDVPVDcrWlE0OWgxZzlWdGo2cEJGL2dCdkhkMms5V3IrVDF5YkJtcHppMVNi?=
 =?utf-8?B?a0JlQUJBb3VIb2psSEl1NXJIK0RIRk96cDl1eXJaY040RjNrcDA3TlpibzI3?=
 =?utf-8?B?cDJ6aGQvYVhMUERjazViUHZMK2tKekkxUVZCZ2ZsN2dqM3VlZ3BiUWxMWTF5?=
 =?utf-8?B?b1ZITkN1MXFZMTNxTXJZcWZ5NlhFNCtJaEEvdHFhbVVEUzQxNEhoMC9CM1dW?=
 =?utf-8?B?a1krY2EweGRZMWRMZ2czNjd6WEphdEdGbkhhQ0t6czZCWEFyaDE4Q0JlNnhk?=
 =?utf-8?B?MC9LWkR4Nys1WEU2Ylg3R3p6cm1hdzJndW5teVVOZHRrQk4zNzJWazZodERQ?=
 =?utf-8?B?ZDE4cTk1YXMwamxZd0lUdGtTQ0tXMGErK2lWVDRKUkxXVDBPZDRkbjdDT3Jr?=
 =?utf-8?B?Z2VHTkkva3dzckoyZlUyZkZ1ek83OEpKZnVjaklvUjh1U3p5bWpWSDdOSlVI?=
 =?utf-8?B?azc0c3FuWWlqMEpJV2RyZGJ5eFBCeDFxZ1BnamtNSGR1VURWRkcrMzh1RkJQ?=
 =?utf-8?B?RW5ubkZ2NU45Yi80Q1lUTHR0Vy81WHFQeWNxdVFYRWhCMWJLNTREK0QzK1Az?=
 =?utf-8?B?L0NQc0JTblZkRUFiYUV5MG4vYTNKYU4ySUlLTDd1NitXS2M0MS9nbGUwZlZs?=
 =?utf-8?B?QXZidVNIc3ZzYmg4TllxVUxyMnIyRDkwZmpxd3Y2SmhYZTl3VVR3aVAzSjVJ?=
 =?utf-8?B?NmxuQkRmekZMb2taa0Z2bG51TnZ0YVR5Snp6SWVHSFg5dWFiT1NVbmR6R0Z0?=
 =?utf-8?B?YTVUZTQzS1JRdlpIb0tlL2VxdUVMUVJocWZZQWZhdkJBdTlhcVhNUXpmS2FI?=
 =?utf-8?B?WmpnWGZuM3FrbWhvVTlraDExbUo3a3pmSVpUakNvVjUrcjFxV08xVDU2RjVC?=
 =?utf-8?B?dFRnTENSSjYvZ05MbmY1bExmUzJDN2pPR3ZhQ2xNZXFTMDJaVHJ2ZTczR2RP?=
 =?utf-8?B?SVVkSmJXL1JBZjZMQk1qaElaUEJ3NDZ1NjBNRUZFd2pNQy8zZXpnNVR6V0No?=
 =?utf-8?B?cGMyYlVNZlA0MVYrZ2k0UUN5NE00ZHdtamFEcVJsVVJFT3FZTURhMHE0alJY?=
 =?utf-8?B?LzJjUDlhNzhmSXdVMk5YSHh3Vm05REh4b3k3d3NlUDA2bnNwSHpOdjM1V2wy?=
 =?utf-8?B?N1d2OTIyNnI0NFJBUXo5SkNoZUtwRVpVSmZzTjUwMmtwWEhmVE1JTDY4QU9z?=
 =?utf-8?B?KzVWaGFpNDVXYzhvU2h6UHROV0cvR3VIUjZTTWFNZDM5MkVFWE83Tk5IK3Zt?=
 =?utf-8?B?UkJlMjlSV2tUcXBsWEc0MklqNnF5Qjk3RUFRWFJGemtCT2pSbDNWNDduczI5?=
 =?utf-8?B?UFc5bVBoQ1Zyc0o2WlAwZEc2OXlRNGozZlRtTjJzOWI3RXhwekhoZnI2OXc4?=
 =?utf-8?B?T1NPYWhtQmVINUY3Z0l1NXp2T1p2QTJXYXUvdi9MRWUxdTZPbS94T0ZMVnNE?=
 =?utf-8?B?S29PMDg3UThHTzhIRWpZTS9LbmsveE1qSlFyVEFIbnIwZCtxL1FHemZwTmdp?=
 =?utf-8?B?RGdvK1NKLzdNOEkrdW1qYkV2VTM5dXcvUnhEL0JTRHB5R3hHVmt6Z3BaK2FB?=
 =?utf-8?B?aXpyZVY2NGQ2U1hjSWtuQVZsTFMvSWhJV2VxVGVNSWxLUFlQUElzZDlVajNn?=
 =?utf-8?B?QkI2WEh4N3BUTC9EdDlaL3lQTnBBT3hpZExBUEtKeWJxc0ZqM1ZvUjV1dE1T?=
 =?utf-8?B?NkRHdTZBaS9hd0Framg1b2lva25aY29zMW5qSWQvQThHY3ZoeW9pZGRpNThH?=
 =?utf-8?Q?GBWtZJCKbgPNpuj/dA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5191.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af4fc33d-b1e1-460f-95d1-08d98ffa2603
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2021 16:37:59.0328 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: B7q+XfFlKXR3PU8bnGr1Y7pBh5KYZIfErciH0H1z6DVStcXg4c07SGxkXO2l6cLGJMl4zsdbuFr9hI+KBVx1eQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4790
X-Proofpoint-GUID: cPtSOe1p8S0EHm7O4DGgofLNNZrnG6hW
X-Proofpoint-ORIG-GUID: cPtSOe1p8S0EHm7O4DGgofLNNZrnG6hW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-15_05,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 phishscore=0 clxscore=1011 adultscore=0 mlxlogscore=920
 spamscore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110150102
X-Mailman-Approved-At: Sat, 16 Oct 2021 10:07:44 +1100
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUm9iaW4gTXVycGh5IDxy
b2Jpbi5tdXJwaHlAYXJtLmNvbT4NCj4gU2VudDogRnJpZGF5LCBPY3RvYmVyIDE1LCAyMDIxIDk6
NDAgUE0NCj4gVG86IExpLCBNZW5nIDxNZW5nLkxpQHdpbmRyaXZlci5jb20+OyBSb3kuUGxlZGdl
QG54cC5jb207DQo+IGxlb3lhbmcubGlAbnhwLmNvbTsgcnV4YW5kcmEucmFkdWxlc2N1QG54cC5j
b207IGhvcmlhLmdlYW50YUBueHAuY29tDQo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwu
b3JnOyBsaW51eHBwYy1kZXZAbGlzdHMub3psYWJzLm9yZzsgbGludXgtYXJtLQ0KPiBrZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIXSBzb2M6IGZzbDogZHBp
bzogcHJvdGVjdCBzbXBfcHJvY2Vzc29yX2lkIHdoZW4gZ2V0DQo+IHByb2Nlc3NvciBpZA0KPiAN
Cj4gW1BsZWFzZSBub3RlOiBUaGlzIGUtbWFpbCBpcyBmcm9tIGFuIEVYVEVSTkFMIGUtbWFpbCBh
ZGRyZXNzXQ0KPiANCj4gT24gMjAyMS0xMC0xNSAwNzozNiwgTWVuZy5MaUB3aW5kcml2ZXIuY29t
IHdyb3RlOg0KPiA+IEZyb206IE1lbmcgTGkgPG1lbmcubGlAd2luZHJpdmVyLmNvbT4NCj4gPg0K
PiA+IFdoZW4gZW5hYmxlIGRlYnVnIGtlcm5lbCBjb25maWdzLHRoZXJlIHdpbGwgYmUgY2FsbHRy
YWNlIGFzIGJlbG93Og0KPiA+DQo+ID4gQlVHOiB1c2luZyBzbXBfcHJvY2Vzc29yX2lkKCkgaW4g
cHJlZW1wdGlibGUgWzAwMDAwMDAwXSBjb2RlOg0KPiA+IHN3YXBwZXIvMC8xIGNhbGxlciBpcyBk
ZWJ1Z19zbXBfcHJvY2Vzc29yX2lkKzB4MjAvMHgzMA0KPiA+IENQVTogNiBQSUQ6IDEgQ29tbTog
c3dhcHBlci8wIE5vdCB0YWludGVkIDUuMTAuNjMteW9jdG8tc3RhbmRhcmQgIzENCj4gPiBIYXJk
d2FyZSBuYW1lOiBOWFAgTGF5ZXJzY2FwZSBMWDIxNjBBUkRCIChEVCkgQ2FsbCB0cmFjZToNCj4g
PiAgIGR1bXBfYmFja3RyYWNlKzB4MC8weDFhMA0KPiA+ICAgc2hvd19zdGFjaysweDI0LzB4MzAN
Cj4gPiAgIGR1bXBfc3RhY2srMHhmMC8weDEzYw0KPiA+ICAgY2hlY2tfcHJlZW1wdGlvbl9kaXNh
YmxlZCsweDEwMC8weDExMA0KPiA+ICAgZGVidWdfc21wX3Byb2Nlc3Nvcl9pZCsweDIwLzB4MzAN
Cj4gPiAgIGRwYWEyX2lvX3F1ZXJ5X2ZxX2NvdW50KzB4ZGMvMHgxNTQNCj4gPiAgIGRwYWEyX2V0
aF9zdG9wKzB4MTQ0LzB4MzE0DQo+ID4gICBfX2Rldl9jbG9zZV9tYW55KzB4ZGMvMHgxNjANCj4g
PiAgIF9fZGV2X2NoYW5nZV9mbGFncysweGU4LzB4MjIwDQo+ID4gICBkZXZfY2hhbmdlX2ZsYWdz
KzB4MzAvMHg3MA0KPiA+ICAgaWNfY2xvc2VfZGV2cysweDUwLzB4NzgNCj4gPiAgIGlwX2F1dG9f
Y29uZmlnKzB4ZWQwLzB4ZjEwDQo+ID4gICBkb19vbmVfaW5pdGNhbGwrMHhhYy8weDQ2MA0KPiA+
ICAga2VybmVsX2luaXRfZnJlZWFibGUrMHgzMGMvMHgzNzgNCj4gPiAgIGtlcm5lbF9pbml0KzB4
MjAvMHgxMjgNCj4gPiAgIHJldF9mcm9tX2ZvcmsrMHgxMC8weDM4DQo+ID4NCj4gPiBCZWNhdXNl
IHNtcF9wcm9jZXNzb3JfaWQoKSBzaG91bGQgYmUgaW52b2tlZCBpbiBwcmVlbXB0IGRpc2FibGUg
c3RhdHVzLg0KPiA+IFNvLCBhZGQgcHJlZW1wdF9kaXNhYmxlL2VuYWJsZSgpIHRvIHByb3RlY3Qg
c21wX3Byb2Nlc3Nvcl9pZCgpLg0KPiANCj4gSWYgcHJlZW1wdGlvbiBkb2Vzbid0IG1hdHRlciBh
bnl3YXksIGFzIHRoZSBjb21tZW50IGluIHRoZSBjb250ZXh0IGltcGxpZXMsDQo+IHRoZW4gaXQg
cHJvYmFibHkgbWFrZXMgbW9yZSBzZW5zZSBqdXN0IHRvIHVzZQ0KPiByYXdfc21wX3Byb2Nlc3Nv
cl9pZCgpIGluc3RlYWQuDQo+IA0KDQpUaGFua3MgZm9yIHlvdXIgcHJvZmVzc2lvbmFsIHN1Z2dl
c3QsIEkgd2lsbCByYXdfc21wX3Byb2Nlc3Nvcl9pZCgpIGFuZCB0ZXN0Lg0KSWYgd29ya3MgZmlu
ZSwgSSB3aWxsIHNlbmQgdjIgcGF0Y2guDQoNClRoYW5rcywNCkxpbWVuZw0KDQo+IFJvYmluLg0K
PiANCj4gPiBGaXhlczogYzg5MTA1YzliMzkwICgic3RhZ2luZzogZnNsLW1jOiBNb3ZlIERQSU8g
ZnJvbSBzdGFnaW5nIHRvDQo+ID4gZHJpdmVycy9zb2MvZnNsIikNCj4gPiBDYzogc3RhYmxlQHZn
ZXIua2VybmVsLm9yZw0KPiA+IFNpZ25lZC1vZmYtYnk6IE1lbmcgTGkgPE1lbmcuTGlAd2luZHJp
dmVyLmNvbT4NCj4gPiAtLS0NCj4gPiAgIGRyaXZlcnMvc29jL2ZzbC9kcGlvL2RwaW8tc2Vydmlj
ZS5jIHwgNyArKysrKy0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAy
IGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvc29jL2ZzbC9kcGlv
L2RwaW8tc2VydmljZS5jDQo+ID4gYi9kcml2ZXJzL3NvYy9mc2wvZHBpby9kcGlvLXNlcnZpY2Uu
Yw0KPiA+IGluZGV4IDE5ZjQ3ZWE5ZGFiMC4uYWZjM2I4OWIwZmM1IDEwMDY0NA0KPiA+IC0tLSBh
L2RyaXZlcnMvc29jL2ZzbC9kcGlvL2RwaW8tc2VydmljZS5jDQo+ID4gKysrIGIvZHJpdmVycy9z
b2MvZnNsL2RwaW8vZHBpby1zZXJ2aWNlLmMNCj4gPiBAQCAtNTgsOCArNTgsMTEgQEAgc3RhdGlj
IGlubGluZSBzdHJ1Y3QgZHBhYTJfaW8NCj4gKnNlcnZpY2Vfc2VsZWN0X2J5X2NwdShzdHJ1Y3Qg
ZHBhYTJfaW8gKmQsDQo+ID4gICAgICAgICogSWYgY3B1ID09IC0xLCBjaG9vc2UgdGhlIGN1cnJl
bnQgY3B1LCB3aXRoIG5vIGd1YXJhbnRlZXMgYWJvdXQNCj4gPiAgICAgICAgKiBwb3RlbnRpYWxs
eSBiZWluZyBtaWdyYXRlZCBhd2F5Lg0KPiA+ICAgICAgICAqLw0KPiA+IC0gICAgIGlmIChjcHUg
PCAwKQ0KPiA+IC0gICAgICAgICAgICAgY3B1ID0gc21wX3Byb2Nlc3Nvcl9pZCgpOw0KPiA+ICsg
ICAgICAgIGlmIChjcHUgPCAwKSB7DQo+ID4gKyAgICAgICAgICAgICAgICBwcmVlbXB0X2Rpc2Fi
bGUoKTsNCj4gPiArICAgICAgICAgICAgICAgIGNwdSA9IHNtcF9wcm9jZXNzb3JfaWQoKTsNCj4g
PiArICAgICAgICAgICAgICAgIHByZWVtcHRfZW5hYmxlKCk7DQo+ID4gKyAgICAgICAgfQ0KPiA+
DQo+ID4gICAgICAgLyogSWYgYSBzcGVjaWZpYyBjcHUgd2FzIHJlcXVlc3RlZCwgcGljayBpdCB1
cCBpbW1lZGlhdGVseSAqLw0KPiA+ICAgICAgIHJldHVybiBkcGlvX2J5X2NwdVtjcHVdOw0KPiA+
DQo=
