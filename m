Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 033767F7492
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 14:09:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=IWkNsTj6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ScFgt4xqGz3vcn
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Nov 2023 00:09:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=IWkNsTj6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::614; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
X-Greylist: delayed 21913 seconds by postgrey-1.37 at boromir; Sat, 25 Nov 2023 00:08:56 AEDT
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (unknown [IPv6:2a01:111:f400:7e18::614])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ScFfw3Sq4z3cVV
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 25 Nov 2023 00:08:53 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RIlNXbJlvy10MrNED020YAuGPCD53LRFnktAElpqJdWXaN633aJiiz8yQMp/5HoLD0H2S4A9PHW9F+ce+jxada9rRG8Xs23C34iaEqh8/nOizSLhj57HRDiaNVZsIhCtrLO3Ovu/BwOau43YQwbzjS+w+3xQ9PLgsJEOuyyoe8pJiIPW6MvD5H5hYnrJnz2uridVdqweUyylPGNAUMlbk5fgroH+i7ldhvkjEfinQUDWtK6l+Zti27JEChIOllMsya3HwDEL8Ev4JpmtIciRJmtaHuY5sxtJ6xY0ntb39q8FGwwK2NVtTj8JGH3B7yejaKixER/rISMcJoZsoY9IsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d/R1nVPi/uci5HeJYII/QAqu/E1jkX+86IUub5YaFHY=;
 b=Lm+PftaHyLgNBaf0HAw8zEHIfc3Us1z1UqSgydloKh+5J+Er41tyECOi7rn6La9rfhQ12cwvuXaNtkZ2QieqyT4nFgKFPYBFQvjQajASiSihknyME8EGWWEMnTT6ZBlyKTVcZHPs/5swsg6CIRqTUS1iIpADMf3XQNMtE17lKax0S7dsHdXZVIk67hfl3HO1Jj+oscNfKDmp5l9INa6xsRoZuUX61D10ifQYxjoYRLZtdJNZ/rbACX3dN4utbM3sz9n48QL16cFIOLtMrVaIk/WFIBFQ+MeLbUKgMmWS9PAtiz/pwLEn9gBEWs8JA6DAELEFaTLAJ4d8dIHf0uWLPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d/R1nVPi/uci5HeJYII/QAqu/E1jkX+86IUub5YaFHY=;
 b=IWkNsTj6nE6QsiQ4s+7vjdpxOEvBOWvkvZNK11jEnrpugSEg6uiYEXcbHKBQQ4VgmUH2PS9WO8o1rlJLyFG1HgbrAg6OgKnO8SEXbazh6UM4fCLggTKTUVgRT6U0mWFmJ+dXuZAqXMhhrOmswOnp10dz7XAbMO9Mc/8EpqsCv+v6QN0obscG0yDgQenyGq+WwEOWC7htmcfUU9HDBgBQQR010f+7yOqKTv0TO+mUTqJOyK//aDRDmTeUJc17YHmmA2bdCRfr/jkdyluvcRrHBpP0fjvGoOtaAItH0/9IKgDgnTnmhiJaiM4DOfxsaX8PxXtQiIgYk370NdAofHUmYA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3123.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.14; Fri, 24 Nov
 2023 13:08:25 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7046.012; Fri, 24 Nov 2023
 13:08:25 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] powerpc/85xx: Fix typo in code comment
Thread-Topic: [PATCH] powerpc/85xx: Fix typo in code comment
Thread-Index: AQHaHr1gf5s+ByX4I0igjKocFILewbCJcSEA
Date: Fri, 24 Nov 2023 13:08:25 +0000
Message-ID: <4ce802db-b6d0-4eec-9ae2-5383a6f01843@csgroup.eu>
References: <20231124100241.660374-1-dario.binacchi@amarulasolutions.com>
In-Reply-To: <20231124100241.660374-1-dario.binacchi@amarulasolutions.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MR1P264MB3123:EE_
x-ms-office365-filtering-correlation-id: 953db6ee-bdef-412a-daca-08dbecee714f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  VBrJozo+qPBddfZpCRLeDQ45/QxwvyDcFEU54gObBWTfdkOovnq3iWgguBhmsvUfTRUamFaZTrUX0BP/z8QbbCYqP2QBj+H2iar9Kxyw0W1r4jAGbOOC98qT20JqhxIQ1lyD69CzNt90u9Q0/NK3oVbqsnjIlkiD38qK7uBpFbz4/cHBM/jry3Y+9PUL5+83JlAPQ8+2yQq4dex82k5ps52OQQ6YURsGOaR3V6kjBXulmEi8RedRT+7N0cGKflVTz5t4qG9nTwhRj5B5ctAEGuy/i3sRloGr0QWQeJJVA9MEb2AUJRE3kYbTvPjerO46QqH1G1ZOyW34o9pchkcrXwmNFbRmwxBHs8Ig4ANKfqZSnz+4mm8vYuShtr6co48qPyD5E/GhS26CztiLWFgeojGqex3Hb8ir9biVGE5h6YkJbX8G8QVrFkqa+XkvtM5XR6L12schqz87e2VOgg0Xof7cGRorvyTS69CMNv5rau8LrJjEN0oNu87A0UZ+YRvng2EIvyoImbUQneNFJ42QkJ9Q4FJoRXhM9zdZizMzg2boQS2DSt2V7Puikh3oPPSH9pyF6A9GmUd+8PDw+f9Ar8M/BltmCCisW9tY5g+QUixfuULKJYpBl0e4HRkJ4lSrhOZnJ3Wdnr5HwxvXMTBx+I7Yj1jDts6xJu/SUaBycRVN6/h97aaPjCiDNS2inQH1
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(396003)(39850400004)(136003)(346002)(366004)(376002)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(478600001)(6486002)(66476007)(6506007)(38070700009)(71200400001)(122000001)(44832011)(5660300002)(7416002)(66946007)(2906002)(86362001)(31696002)(66556008)(76116006)(91956017)(54906003)(316002)(110136005)(66446008)(64756008)(8676002)(4326008)(38100700002)(8936002)(36756003)(41300700001)(83380400001)(31686004)(26005)(2616005)(66574015)(6512007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?T1hlZUQ3dDluNDFUWU94ZkRFazl6S3BRS29FUnhMckxGQUl1QVhpR3BOcjVV?=
 =?utf-8?B?NC9rSDRHVEZWNmJUZG9zZUpKMU5zYzJLY1E3TndDK3ErbEFFdlpsWjVCTlhL?=
 =?utf-8?B?ejc3cm9IM3ZweUdDLzBTNDFVaWZ0YmQyNmZiaWQ0cVZmbUNlakgzd1lpcGo2?=
 =?utf-8?B?YVBTMC9Ma0lzY3hzZnVVRTFGNU5aNUtOYzNTUTQ4bmJxeGdWNis0Zzg3Qzlp?=
 =?utf-8?B?UHVmMmFua3IzZkhOT1hxcVdFS3Z2QmdreXBNcXZJL2U1N1FvdnYwbkZzNVlV?=
 =?utf-8?B?c2Y0OVhPYUdCL3RDRlhhYmR6NWNPWmdGQnQ4UCtTRXhITzdLWnY1UXFsT0RY?=
 =?utf-8?B?TzhDNmVlM3FZMXpSU3F4bkl1NWFCR01lQTZHcGd2VkVjeTA2WW53TW9NOXFG?=
 =?utf-8?B?LzUyQXM2ODEycHMwcGROVEh0QmdETm1hVEpmNTN2TkRWRjdjOG1QZ0hRckd5?=
 =?utf-8?B?SVdvcFZKRFgvNUFIb01DRXFSUXdoaEkrdEQrVDM0VHkxNllkY2lWV2xyUFhw?=
 =?utf-8?B?TmhVR0poT1J3Q1pvNjQzbmc2dk1Xd2EzaEUyT2o4OXljRjNNWEE4WE9YMCtQ?=
 =?utf-8?B?aU1uaUUrdHNlNlM1TDZwcVJxV2VqREFZdFJKTjBRait1aGNFdS92V25iT2I4?=
 =?utf-8?B?a25NYnFtVmpBZHFrK05HQzU2TDJKY0RNWDFnWWlTQzFoNnBvK2tYb0YrNWR4?=
 =?utf-8?B?SHhQeEszNURQWXIwSDczMWJYelVQdjNFVmV6UUFORWJmVW9TLy9IeDh0dFAy?=
 =?utf-8?B?NUp3aktqem5nTituWHJsV3dyNnNyQ0lmdFBGRmJQRzRvZEFkS0FaZDBrMmNh?=
 =?utf-8?B?RTdxMm01TGx5VUJ1cVFVR01xakdaN2RFVmp2UXdza0JYbWtkWjdpQkZkV0Fu?=
 =?utf-8?B?cndRSncxTk5ITm9wSmNrdUMyMnIyVnJHTFBTZFpZTTlFTnZJc2M1alpOd2hn?=
 =?utf-8?B?QlVxcU5vUmViWnlkbXFPQkJONDhxTHBKR2xVU2RJdmJtdExvdzNlQmtnRkxa?=
 =?utf-8?B?RlBoeXB5Z0ZIck82a1k2VHo4Z3d0MkVpODV3elFHQzIveFZsNmtEVlNwTm5V?=
 =?utf-8?B?QndVNGFDWElJZk5xZVJhRTNKRjd6QkFza2tsVzN6RWVTZnNCdFQ3Tk5iUWtT?=
 =?utf-8?B?V0dqNDA5cHJoUXl4N1pNdGZudFBpcmlQeW5uUnpGejlvYUJZTndpamNaVjlx?=
 =?utf-8?B?cWMza0g1TGhJc1o3Z1g2RVc4L0V6azZxeWJtc3IyZkZpTjl3NGgwcHR3MmZn?=
 =?utf-8?B?emhBcDFPM2dlYlE0cDFMZnN4MEg3WGhUMUlaZUlSaTdTQUFpemtpZFZpNFhR?=
 =?utf-8?B?VlQ1OEkzb2V5bDdvYk5jTzhKNVZCV3FTZGY2RkNxcmVnQ3I0OTU3U01yZnJa?=
 =?utf-8?B?S2V6MjEwejNxNzlGNTNVUkRpRFA3TkhubXlmYnp2SGtBSjEwYmxjR1gyTGEz?=
 =?utf-8?B?RHFOSXQvdFJBT0dMZ3NCaUx2aEVmMGgvZjhoYWI3WGp6bUI2U1dkQlpRMmN1?=
 =?utf-8?B?cXQrRmZFZklIanlVVVBQZERYQUpCUldZT2I5cm1oMFByUHBJSC9sNkliTjFP?=
 =?utf-8?B?cG9jNklHZ3FRanFXVGYvcHdQK1k0SFY5b29rV2JIaEhzNVdGd3pTNURuRU1P?=
 =?utf-8?B?ZDJkQ2dwOXlNVFZqK3Q3S0xGdk1ycXlSVlcvVXJ4bjc0SUxDcEM4STNpV3JQ?=
 =?utf-8?B?ZTNQYWpVM3FySnZTQyszaTFCbVZJZ1Myd2VVN0pmMENSelNPYTRLNTh3YUtM?=
 =?utf-8?B?d1lQcnMxR2grRHY0c0hXdk42WFdnL1hWaU9CeU9FUHQ3QVpCRytBRGFZSTVS?=
 =?utf-8?B?bUdwL2twUDA4VU1Ycmcxc0ZZbWQvTDFlMmQ5Ti9pbURLSUhuT2pVeGhyYjU4?=
 =?utf-8?B?OXlubEJWRTN3NGtmTkNDQmFyRUFMeXFMRTdIUWpRMmhZWTJ3cHBSNW1ITGFH?=
 =?utf-8?B?cjB2WUp1TUU3TS9RTTlGTjFVNkNzc0lNWU1pOEVtNHlvd2VrZ3dpbnZlUW1h?=
 =?utf-8?B?ZHB2dEUrNFlhbloyVENyc3hQTlZSR2p3VDh0Vy83Vm8yQ0szNWVPWTQwMnlq?=
 =?utf-8?B?Wk5JbEpOVHNLUGZHNUFKYU15R3c3ZmlGMjEvODBQbDcvMlJ2eENTcmRPNm5z?=
 =?utf-8?Q?YpWZIP0uyMBFllOev8VGc5tDZ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <995254D3E143A94DBFD1088555E8043C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 953db6ee-bdef-412a-daca-08dbecee714f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2023 13:08:25.0145
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: k843DS6LapuiOYJrRtPomFU1xwFKiU5VyLlhmoK+phCUiW4YILk1mwJ/xpIull5ur3/xZ3YxNO4BOAXr+zwhbMm7IodtfeKNx5AANUWZjME=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3123
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
Cc: Rob Herring <robh@kernel.org>, Zhicheng Fan <b32736@freescale.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Kumar Gala <galak@kernel.crashing.org>, Nicholas Piggin <npiggin@gmail.com>, Scott Wood <oss@buserror.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?utf-8?B?UGFsaSBSb2jDoXI=?= <pali@kernel.org>, Timur Tabi <timur@freescale.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI0LzExLzIwMjMgw6AgMTE6MDIsIERhcmlvIEJpbmFjY2hpIGEgw6ljcml0wqA6DQo+
IHMvc2luZ2Fscy9zaWduYWxzLw0KDQpJcyB0aGF0IHJlYWxseSB3b3J0aCBpdCB0byBzcGVuZCB0
aW1lIG9uIHN1Y2ggYSBjaGFuZ2UgPw0KDQpCeSBzZW5kaW5nIHN1Y2ggYSBwYXRjaCwgeW91IHJl
cXVpcmUgcGVvcGxlIHRvIHNwZW5kIHRpbWUgcmV2aWV3aW5nIHlvdXIgDQpwYXRjaCwgdGhlbiBt
YWludGFpbmVyIGhhcyB0byBzcGVuZCB0aW1lIGhhbmRsaW5nIHlvdXIgcGF0Y2guDQpGdXJ0aGVy
bW9yZSwgYXMgeW91IGFkZGVkIGEgRml4ZXM6IHRhZywgTFRTIG1haW50YWluZXJzIHdpbGwgaGF2
ZSB0byANCnNwZW5kIHRpbWUgaGFuZGxpbmcgdGhhdCB0b28uDQoNCkRvIHlvdSByZWFsbHkgdGhp
bmsgdGhhdCB0aGlzIHR5cG8gaXMgd29ydGggYSBwYXRjaCA/DQoNClRoaXMga2luZCBvZiB0aW55
IGVycm9yIHNob3VsZCBiZSBmaXhlZCB0aHJvdWdoIGEgbW9yZSBzaWduaWZpY2FudCBwYXRjaCAN
CmFkcmVzc2luZyB0aGlzIGZpbGUuIEJ1dCBpdCBpcyBub3Qgd29ydGggYSBwYXRjaCBvbiBpdHMg
b3duLg0KDQpDaHJpc3RvcGhlDQoNCg0KPiANCj4gRml4ZXM6IDA0ZTM1OGQ4OTZhNyAoInBvd2Vy
cGMvODV4eDogQWRkIFF1aWNjIEVuZ2luZSBzdXBwb3J0IGZvciBwMTAyNXJkYiIpDQo+IFNpZ25l
ZC1vZmYtYnk6IERhcmlvIEJpbmFjY2hpIDxkYXJpby5iaW5hY2NoaUBhbWFydWxhc29sdXRpb25z
LmNvbT4NCj4gLS0tDQo+IA0KPiAgIGFyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9tcGM4NXh4
X3JkYi5jIHwgMiArLQ0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9t
cGM4NXh4X3JkYi5jIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy84NXh4L21wYzg1eHhfcmRiLmMN
Cj4gaW5kZXggZWM5ZjYwZmJlYmM3Li5lMGNlYzY3MGQ4ZGIgMTAwNjQ0DQo+IC0tLSBhL2FyY2gv
cG93ZXJwYy9wbGF0Zm9ybXMvODV4eC9tcGM4NXh4X3JkYi5jDQo+ICsrKyBiL2FyY2gvcG93ZXJw
Yy9wbGF0Zm9ybXMvODV4eC9tcGM4NXh4X3JkYi5jDQo+IEBAIC03Niw3ICs3Niw3IEBAIHN0YXRp
YyB2b2lkIF9faW5pdCBtcGM4NXh4X3JkYl9zZXR1cF9hcmNoKHZvaWQpDQo+ICAgCQkJLyogUDEw
MjUgaGFzIHBpbnMgbXV4ZWQgZm9yIFFFIGFuZCBvdGhlciBmdW5jdGlvbnMuIFRvDQo+ICAgCQkJ
KiBlbmFibGUgUUUgVUVDIG1vZGUsIHdlIG5lZWQgdG8gc2V0IGJpdCBRRTAgZm9yIFVDQzENCj4g
ICAJCQkqIGluIEV0aCBtb2RlLCBRRTAgYW5kIFFFMyBmb3IgVUNDNSBpbiBFdGggbW9kZSwgUUU5
DQo+IC0JCQkqIGFuZCBRRTEyIGZvciBRRSBNSUkgbWFuYWdlbWVudCBzaW5nYWxzIGluIFBNVVhD
Ug0KPiArCQkJKiBhbmQgUUUxMiBmb3IgUUUgTUlJIG1hbmFnZW1lbnQgc2lnbmFscyBpbiBQTVVY
Q1INCj4gICAJCQkqIHJlZ2lzdGVyLg0KPiAgIAkJCSovDQo+ICAgCQkJCXNldGJpdHMzMigmZ3V0
cy0+cG11eGNyLCBNUEM4NXh4X1BNVVhDUl9RRSgwKSB8DQo=
