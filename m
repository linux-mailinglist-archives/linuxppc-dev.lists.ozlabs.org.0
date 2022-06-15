Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29CD654CDBB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 18:04:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNVVy70DLz3cfB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 02:04:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LNWjWAvO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::618; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=LNWjWAvO;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LNVV80b8Rz305g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jun 2022 02:03:58 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NeSoqtYNpTri2H9eByfsD9KsTHX6tKPCqXLqUxwpifOiakoZIAzSc6/BUIVa/raaaK8VQPQXxCODACfk9AJ6XVRW83mLW3PdB3dwy2fjfKDCKo8XRCM0gqyZPZGZh4Z1vdkKiiwokY7yffLY1SRwuVch3qgsH/0egzwWdYCB4e5OBBy3E5CKY2mHw1+vkf+xdx7orNsFWjDjZe7n4/Mo6mxQvGlE6qzs5mecFHh7uEKUEY8fJtnpMUGRiN3Tr+eM0AxK67+6OeJ4NU4sjWO9po07k+wudjhpdDfGz4hdP6BubGST/yaFnOuB13x9cPRA7qvUIxhCSBgar6MpnIDwSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQkhj8egumJ4zGyGOLokM/qZMEZod5NQ3w7DpTreCrc=;
 b=Oe8GVVI4BduLwrahxDOUiWwQFUM1nfctnl3xEIEKXwouJHI7aI+mnPEuSR26Ded69ptK4AghlGTA/khruP28b9o3LirGaE9Le8Pngkv1dePv1nB5MmNEdDXAhGBoDtIRQYIcr+iabn9XscGwEGc2PJBLR9HgI3U6GXTHNGU4WVBaE0gBpwb0/qyuAu3o+2z7dP6MiTily68Pcz1vx4LZnIyX8Ki0fWAE3F/UvWUaRQFlatCFqJl6F+nc1JnsWoUCmR0PJ1S0H8nsMefmaKVWQsCbw6uk3FK+m6acquv43ERn9AqtCyxSnB9Mnjt/s8WtSvj5zCKoITGIyqh4f0LMiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQkhj8egumJ4zGyGOLokM/qZMEZod5NQ3w7DpTreCrc=;
 b=LNWjWAvOq7lvxUyqzBOGfE9XmMIlWqu2DEjGOMJP7QfKxP63k6PqaBNNGw27OarENvJny54Wyi60ZPksCxczGeNYDJUwil27wmSLkXmU4eoDm4+CynXPV+OH32lWNODhjgYB0AWTI67qUN52yuR3F/jowWRCPfEDlXQKHy80/mi5ex7iM6WHlH/FNRmliv2w2VrXxGyuiNY4+lW0dxA/nhJrGz94DnKf9hVzieRiNeVIs6ulagjK30ut5SgNeYpyMDAaSM16r3PXgTXLeAvwl1bRhPpcEFAmFB8YQFWboVUK8eX0yXn65AmlmkDBMDrjiwHOnzc/3d8zldjgif5FtQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB2462.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Wed, 15 Jun
 2022 16:03:35 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%5]) with mapi id 15.20.5353.014; Wed, 15 Jun 2022
 16:03:35 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
Subject: Re: [RFC PATCH v2 0/7] objtool: Enable and implement --mcount option
 on powerpc
Thread-Topic: [RFC PATCH v2 0/7] objtool: Enable and implement --mcount option
 on powerpc
Thread-Index: AQHYb3C6vgEmcLWl90eZLKe3IHFJVq0vYXAAgAB8bICAAAlXgIAg3NiA
Date: Wed, 15 Jun 2022 16:03:35 +0000
Message-ID: <18d05edc-6669-0308-7e6a-acd1cccd4f20@csgroup.eu>
References: <cover.1653398233.git.christophe.leroy@csgroup.eu>
 <ac4e3ceb-7de8-2c3f-4689-1730d811bf3d@linux.vnet.ibm.com>
 <ea64b232-e002-9317-dca1-c5933fb94e03@csgroup.eu>
 <0d2a6ea3-71cc-a8e1-22eb-7b66f533b3bf@linux.vnet.ibm.com>
In-Reply-To: <0d2a6ea3-71cc-a8e1-22eb-7b66f533b3bf@linux.vnet.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 581822a3-0fd1-4fde-1f74-08da4ee89a2f
x-ms-traffictypediagnostic: PAZP264MB2462:EE_
x-microsoft-antispam-prvs:  <PAZP264MB24625CE865029FCAC4DD83EAEDAD9@PAZP264MB2462.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  2+U6BhmBTIqzt878IQerjKpCBzG/iCM9KL3x68WvwVrqWV/PMvJy3wM6mMadeOFDkKAKU9u/3vyC76iaq1FDPkOAZI8yhtsLWfP2rlFPMaNourphSgjxgSTgkY7KK66XgBSC/80xhJ5n4JEQnd1tTuRVr7Z6+SE2RuU2Vv2K9ydvkXGPvlGi2JG/XS7vWdu1cH2ZAkizB1LH/s4Lv586+6qITPfOxgdubTH2fgXZTKDAU9HsNBj/STFccoffL5iwwjIHo+4BPsr61lOxF/CYnu7vdhsP6yx7+m8sX9pn0sOP2Fyh88LzX+7TcunQY+508W479GWQkSKMDSt7j2iwsG6debCs9/mYogaZ7nljMHQqRA9XASWwbDXnjFUno/ssClN3AfmDoqRA6tTK18l97MgotDRLp8wyLl7N6B/1jTBEquxpVx8xBA8Hr7wS+zFQwZLTwTIc1gI3X1DaFsfyegTplOoAEsf1Mq908sDsL4BC2IPVHyGyHshpY8gFavG5YVVMqcUQTXNmovEAeaZm2fBmRk6H7cQmz/rhOSo53KSmF6dz/iPyNBedhcVV/5Gz3sowj6afrpt/421Aics4GNInKl27LRcJiUTYBRJ8EQTQFdoLcBIiU6fhD9iPg0CdzcHqK45jCOiNamj179LRq7BECH3ZrQFJ3EFemB9TtuB/WJp20kysQbn00PeDW1epW4Oi5gOEFKf3HTNZzKy1aMmOWm/CfCRAVhylKHGjbaP/xxtZAkA/DPOaMzGICqQ3SP68jCVTs0L1a34Sh51Ahg==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(36756003)(4326008)(8676002)(31686004)(44832011)(5660300002)(8936002)(54906003)(7416002)(71200400001)(498600001)(66556008)(91956017)(76116006)(66946007)(38100700002)(2906002)(66446008)(6916009)(64756008)(66476007)(31696002)(86362001)(2616005)(26005)(6506007)(186003)(53546011)(83380400001)(6512007)(122000001)(38070700005)(6486002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?d0hncVBLRHFsZFBGR2RuYmV6ZEo5MUt5cFR6dTFESzZXMVhJU29kREpxWjE0?=
 =?utf-8?B?SUVHSnk1Ykw0MUxMbUFJeUhJeDFBZEhyQTJocDJMYmx2dXFqSklkZEU2NGRP?=
 =?utf-8?B?R0Q5ZFJNbFcrNk40ZG54ZnlWNDZQT29MMDc3cXdzL2xWbzczb2x1c2hmRE5u?=
 =?utf-8?B?T29MT3Zsc3gwcFJnZFdqaUFOdVptaWdhc3UyUEpCS0wyZUlGNm9JcGZPbFN6?=
 =?utf-8?B?b0FML0UzMW81SlExVmVIaitxMUZmN082QXZ0Sk5zNnlVTnVtL1FOYWxFeUp0?=
 =?utf-8?B?WXBqUUp2dFk0OWV4N01tWkR2Q08zVFZ1TFY5LzVIci8wTXBoRUowN21uYTBQ?=
 =?utf-8?B?WGdnWG1PSTkweDAzQURyN2QvVyt3aGtCbmFaZGNlNThiWVhOY3dwOXRsRTl6?=
 =?utf-8?B?S3kzN1RjYVNSVmRPeXlBSWZxRFpLZlVpYUszdHJJdEw2RzFOR1JCMHdDNW5t?=
 =?utf-8?B?VHRBZ0dOWER1Y0hpMGkzZDZVQkV4RExBam15TzJRejB5MVN3RVdDVXp0N1hq?=
 =?utf-8?B?bmhmSXhKWUF6ODUwaUJ5czk2dFV6N1E4c0lsWnFTYWJPQ01mOHlLWlFYaDN4?=
 =?utf-8?B?NU9NSmlFb2JHTDFmeWFBcTZTLzV5eXNOVXA5aUlUZzNqdVhsK1lNWjlIRjFR?=
 =?utf-8?B?ZkJzVUpuM1U5dHRPeXhFSU44c0t3MW5BRFcvditRWWFaODRnZFhwU0lUSE8v?=
 =?utf-8?B?R2JvNGs2ZS9JLys3Y2wzcWZ5NG8rdVJmZFUzNGZ2YjJVTmlKdTlNSjVyRjZO?=
 =?utf-8?B?VXFrNHVHSVBUVjRFVHZUYzlkaHdsRVV0WnFxRjJxYlgxemtTVXc3MVBpbWl6?=
 =?utf-8?B?NjVqeEJrYnBEeW5Xek9vNXBnQ2lGQ2RCL0Z0MGxsblNyQXZqMDZjaituaExN?=
 =?utf-8?B?MnBsU1VMd0Y0NDRxNTNCMUUxNmlvcnM2Y2p5VW1ubkt0WVAySTlhK2E3M1pO?=
 =?utf-8?B?OXRPanRyVFZCNHNOeUU2QTI3WURLNlYrM2IzVGhZbEJ5ejQyN3NwbGs0SGlK?=
 =?utf-8?B?T2hsOHc3ZFhSY0Z2akR1OHM4SW00MXpqRExnSDRHVEFEU3VObW12QWVzMzVx?=
 =?utf-8?B?ci9pdGl4cTVOV3FuOFdoQlhZNkFOREpqNWd6cSt2S0h1V0JSZUVFMlZrRzJO?=
 =?utf-8?B?bjEySmFRdDJOUnZWTElDRTBuZzRFZjNPZStXMEsxSHlLcWQ4NE1uTUhicjE1?=
 =?utf-8?B?clJXcEhCZDJUekxhOXpGa21oL3ZsYWpvZEVSaVZxaVVXeERxQnIvMVVBWExw?=
 =?utf-8?B?TDN2bkVqWnNDM3VQdDJPNDMwWHI0QVdtOUpQM0U2SmR6NnNxaUNBWU80ck9u?=
 =?utf-8?B?bTZtMEF1TTMxOTlqOC9td0FXY2l5dkEvdmE4ZjRlY0lVVEZvWFhKS1M1d2VL?=
 =?utf-8?B?cU5GV1NCYWJFSnhEU1hKTXd3WTNjak9jS28vbDlyeWJWalV6Um9UWTllVVRt?=
 =?utf-8?B?N1ZucG4zU2Vwd3dtVDhRT0hlUEpScHFCTmw2WFcxYVhmVjZOczI1ZnpmZ3ha?=
 =?utf-8?B?RWp3REF6MFFHUE1DbUlaVDNRZUE2U1B5S0FlMkovTVczQ3RpcTYwaVJLYlNL?=
 =?utf-8?B?RkZIN1dsc2EwdDA1dHNBeVdkOEdkdmszaitHeVpmcTY4azBzS0dhL0RVa2JV?=
 =?utf-8?B?anlpRHdpaFIvWEV1R3EzaTkzak5KSGh3RjIwdys3NFg2OWxHVVI4d0pHNEpS?=
 =?utf-8?B?bmJLbWlLdHpNOWRvNG1HNzZXUzFvNzF6R01CalJZRXlVa2FLbnZNYnl6UTdu?=
 =?utf-8?B?L1hzWngzR2I0SXFBUXVEOXZraDQwVHpPTFlZTjdGWTVINU1ycnVUMUJjc3du?=
 =?utf-8?B?R0dNMTNKSDkrVUVIYnVSTm5BcTBuTlkwVzRsdGFuWEVsR3Z0RFNXL1VBc2N1?=
 =?utf-8?B?S2VtVVM1UEttSndOb3Q3ZVdrSmNCU1M2azlyemxldmEwYUM5dWtnZHNkSkNH?=
 =?utf-8?B?dFRxSTA5dzhMeHF3QlBaV3RkQWROK3Fab3loMmV0T0tDYXpaZDdpL2wxdWFN?=
 =?utf-8?B?NTU3bzViUCs4S3pnelUyN2pKVDVjNkQ0allDK0JEWHlmNEZUMVh0dFJjMUhk?=
 =?utf-8?B?cnNzUTJiR0dPNjFYeGFPa1VwSC9xMktIRjZQL0VncW1PZUhzaHRwV2ErUVcr?=
 =?utf-8?B?NWJqeGRCQjVYRjFHMHJPVUx2aTFPSDVoUlhGRHNuUTF4bUNmb3ViRkNWWFE3?=
 =?utf-8?B?bXR2NXJWK1hJTk9KNERkdHliTDRuWndPYzFEVytLNXZZeklJMmoxQVlvek5F?=
 =?utf-8?B?WXVlbTU5UFl3VUpvMmtqY3VOV3QrU2E4T0diMWdKdi9zL3YxNmZWWlNBNzZ3?=
 =?utf-8?B?UTZnL0hYQndDODhrZGV2aTBUSGU4OU9NZlZza1J0M1dZNkpZazQvTFJ6eTZQ?=
 =?utf-8?Q?yH9h2mv454n9ceGjr5vn3wHojP13wbHVLBtLH?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CDFD9AB19E35E446AB8C545D6DC16C7F@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 581822a3-0fd1-4fde-1f74-08da4ee89a2f
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2022 16:03:35.2036
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gjEEMHHzqobuHoifnPCQGc51TMlx6IBxVPkuH0rjODI6r6xQcbId+EKsUco6RSIRvHnmSfH/28NrLYAaXdFp9Y5rtr3b2x6mCx6DtT7uaZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2462
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
Cc: "aik@ozlabs.ru" <aik@ozlabs.ru>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "peterz@infradead.org" <peterz@infradead.org>, Paul Mackerras <paulus@samba.org>, Sathvika Vasireddy <sv@linux.ibm.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI1LzA1LzIwMjIgw6AgMjA6MTIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiANCj4gT24gMjUvMDUvMjIgMjM6MDksIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+PiBI
aSBTYXRodmlrYSwNCj4+DQo+PiBMZSAyNS8wNS8yMDIyIMOgIDEyOjE0LCBTYXRodmlrYSBWYXNp
cmVkZHkgYSDDqWNyaXTCoDoNCj4+PiBIaSBDaHJpc3RvcGhlLA0KPj4+DQo+Pj4gT24gMjQvMDUv
MjIgMTg6NDcsIENocmlzdG9waGUgTGVyb3kgd3JvdGU6DQo+Pj4+IFRoaXMgZHJhZnQgc2VyaWVz
IGFkZHMgUFBDMzIgc3VwcG9ydCB0byBTYXRodmlrYSdzIHNlcmllcy4NCj4+Pj4gVmVyaWZpZWQg
b24gcG1hYzMyIG9uIFFFTVUuDQo+Pj4+DQo+Pj4+IEl0IHNob3VsZCBpbiBwcmluY2lwbGUgYWxz
byB3b3JrIGZvciBQUEM2NCBCRSBidXQgZm9yIHRoZSB0aW1lIGJlaW5nDQo+Pj4+IHNvbWV0aGlu
ZyBnb2VzIHdyb25nLiBJbiB0aGUgYmVnaW5uaW5nIEkgaGFkIGEgc2VnZmF1dCBoZW5jZSB0aGUg
Zmlyc3QNCj4+Pj4gcGF0Y2guIEJ1dCBJIHN0aWxsIGdldCBubyBtY291bnQgc2VjdGlvbiBpbiB0
aGUgZmlsZXMuDQo+Pj4gU2luY2UgUFBDNjQgQkUgdXNlcyBvbGRlciBlbGZ2MSBBQkksIGl0IHBy
ZXBlbmRzIGEgZG90IHRvIHN5bWJvbHMuDQo+Pj4gQW5kIHNvLCB0aGUgcmVsb2NhdGlvbiByZWNv
cmRzIGluIGNhc2Ugb2YgUFBDNjRCRSBwb2ludCB0byAiLl9tY291bnQiLA0KPj4+IHJhdGhlciB0
aGFuIGp1c3QgIl9tY291bnQiLiBXZSBzaG91bGQgYmUgbG9va2luZyBmb3IgIi5fbWNvdW50IiB0
byBiZQ0KPj4+IGFibGUgdG8gZ2VuZXJhdGUgbWNvdW50X2xvYyBzZWN0aW9uIGluIHRoZSBmaWxl
cy4NCj4+Pg0KPj4+IExpa2U6DQo+Pj4NCj4+PiBkaWZmIC0tZ2l0IGEvdG9vbHMvb2JqdG9vbC9j
aGVjay5jIGIvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+Pj4gaW5kZXggNzBiZTVhNzJlODM4Li43
ZGE1YmY4YzcyMzYgMTAwNjQ0DQo+Pj4gLS0tIGEvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+Pj4g
KysrIGIvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+Pj4gQEAgLTIxODUsNyArMjE4NSw3IEBAIHN0
YXRpYyBpbnQgY2xhc3NpZnlfc3ltYm9scyhzdHJ1Y3Qgb2JqdG9vbF9maWxlDQo+Pj4gKmZpbGUp
DQo+Pj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoYXJjaF9pc19yZXRwb2xpbmUoZnVuYykpDQo+Pj4gwqAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZnVuYy0+cmV0cG9saW5l
X3RodW5rID0gdHJ1ZTsNCj4+Pg0KPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBpZiAoKCFzdHJjbXAoZnVuYy0+bmFtZSwgIl9fZmVudHJ5X18iKSkgfHwN
Cj4+PiAoIXN0cmNtcChmdW5jLT5uYW1lLCAiX21jb3VudCIpKSkNCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCghc3RyY21wKGZ1bmMtPm5hbWUs
ICJfX2ZlbnRyeV9fIikpIHx8DQo+Pj4gKCFzdHJjbXAoZnVuYy0+bmFtZSwgIl9tY291bnQiKSkg
fHwgKCFzdHJjbXAoZnVuYy0+bmFtZSwgIi5fbWNvdW50IikpKQ0KPj4+IMKgIMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZ1bmMt
PmZlbnRyeSA9IHRydWU7DQo+Pj4NCj4+PiDCoCDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGlmIChpc19wcm9maWxpbmdfZnVuYyhmdW5jLT5uYW1lKSkNCj4+
Pg0KPj4+DQo+Pj4gV2l0aCB0aGlzIGNoYW5nZSwgSSBjb3VsZCBzZWUgX19tY291bnRfbG9jIHNl
Y3Rpb24gYmVpbmcNCj4+PiBnZW5lcmF0ZWQgaW4gaW5kaXZpZHVhbCBwcGM2NGJlIG9iamVjdCBm
aWxlcy4NCj4+Pg0KPj4gT3Igc2hvdWxkIHdlIGltcGxlbWVudCBhbiBlcXVpdmFsZW50IG9mIGFy
Y2hfZnRyYWNlX21hdGNoX2FkanVzdCgpIGluDQo+PiBvYmp0b29sID8NCj4gDQo+IFllYWgsIEkg
dGhpbmsgaXQgbWFrZXMgbW9yZSBzZW5zZSBpZiB3ZSBtYWtlIGl0IGFyY2ggc3BlY2lmaWMuDQo+
IFRoYW5rcyBmb3IgdGhlIHN1Z2dlc3Rpb24uIEknbGwgbWFrZSB0aGlzIGNoYW5nZSBpbiBuZXh0
IHJldmlzaW9uIDotKQ0KPiANCg0KRG8geW91IGhhdmUgYW55IGlkZWEgd2hlbiB5b3UgcGxhbiB0
byBzZW5kIG5leHQgcmV2aXNpb24gPw0KDQpJJ20gcmVhbGx5IGxvb2tpbmcgZm9yd2FyZCB0byBz
dWJtaXR0aW5nIHRoZSBpbmxpbmUgc3RhdGljIGNhbGxzIG9uIHRvcCANCm9mIHlvdXIgc2VyaWVz
Lg0KDQpUaGFua3MNCkNocmlzdG9waGU=
