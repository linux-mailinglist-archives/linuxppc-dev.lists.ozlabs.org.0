Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id 232078D3477
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 12:22:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=HAGaplez;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vq4yC26Cvz89Kv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 May 2024 20:15:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=HAGaplez;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vq4xW0zZ8z87mP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 20:14:38 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ezVGfCtC9tXJXodw/skgSerZ6LydbE6XU1xjQ4iCEzt08SsZMLi83L2pur+0PSJjAVp3uKICIS4qZhXJ1B/RxptnFnUZH/xTNTDof6b6ueiLNIhr3TOBpUzxHeEvL48Hbh7sPWhJrRIRmfDXOgTwhhXg+sE8gzfII1cs7v2tF8Fcf2wd6sEtQ9n6VH1W56ZNQA6M3XSr/8EEv2LvK1VatvxdewFSNfE/Qhln4oww14/iwArqhJIdgQKTEYitmYur5Q+0bDcOoY6iH7QECojqxMId92Pp6MIy/nC0p4vKOzfoelOnI0rPVGnzGWkIkZ1wkjuwQWP+MXbD0njRrPw9yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SXdiiBNHvZABJQoyZs2Gq8mK/uLoxqu0kgz7pnapBqE=;
 b=SiESuVr6+fxPA7mJ2ALbNvj/YVOGv9UaLeeeG/kwCwXvUmd2L8RI3dNY0h6G3zblMiBfaDCqeFQf3OxmL2jswlXF+oNzd3SxVnLPCxAOHrzkE8+03FXjQGs6beSBWy5A5P18o52pA5mx0mwJUBpI1FCkb/I+tiQjmoPzXlN41GBV8DcEH5sy7WrSOR6XtnvgmZSYmLjFznSPNmjDldzWXMujZecohz8oeK1ZwotmJNcxCQqAf23dR1njuJp2iczZu3sAcp9wEO6NOte0O5zAMwx5B1uteghn9UJA/lrGQ4C/gK6hZuIrE5kSI0nMvhPGagrm5t/jUo8Du6OHx0EkxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SXdiiBNHvZABJQoyZs2Gq8mK/uLoxqu0kgz7pnapBqE=;
 b=HAGaplez1ixC21/vYD+9aSnB7Au1acdFs2kfWRqKmdlMXLPxnxibLp5WHXByWkPkSUthT8Yqi39Yy0NCpLhcdTtrnt+UhAb1m+GRe85tt8vYIQyKeD4D8C9wNP0iWJdVgVP3g3rP4mcKXZc+0TdMhgs5h8sVQRCIPRTjOhXIqd88G6lsv57Sf6fLl2MIl57PXkeo749T6FdjNc+80PCGigi5jAgfvD/BySwIIOivFqFC0pkeNzzfNwXb7eiNeB2yUPmRjABEEg73AcFxvTao7SL6LZ+vK+h5iPo1GvtdBVrNi4E+Kt3x20ArBP3KV52yNKlEMouzdF66dUrteJmY2w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PASP264MB4707.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:432::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.28; Wed, 29 May
 2024 10:14:16 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7633.018; Wed, 29 May 2024
 10:14:16 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.com>
Subject: Re: [RFC PATCH v4 12/16] powerpc/e500: Encode hugepage size in PTE
 bits
Thread-Topic: [RFC PATCH v4 12/16] powerpc/e500: Encode hugepage size in PTE
 bits
Thread-Index: AQHasDoWurSZr4P1LUWMZLgcwbrJ/LGt3ZwAgAAdBQCAAAWgAIAAAS8A
Date: Wed, 29 May 2024 10:14:15 +0000
Message-ID: <3186e950-fbf8-42c4-9eed-9564c8374019@csgroup.eu>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <10eae3c6815e3aba5f624af92321948e4684c95a.1716815901.git.christophe.leroy@csgroup.eu>
 <Zlbh5Bwsx7WqEEWr@localhost.localdomain>
 <3cf95f5e-cc8b-4417-a3fa-80dc3b24ac63@csgroup.eu>
 <Zlb-9DNmRzIYRdJO@localhost.localdomain>
In-Reply-To: <Zlb-9DNmRzIYRdJO@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PASP264MB4707:EE_
x-ms-office365-filtering-correlation-id: 0d79b8be-3c22-440d-9cf0-08dc7fc81873
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?Z2dTWG9ENmxEY0Y5T1lXSS9XaGI2ajQ4c0VCTFVpd25vazJYaWFsNklKN1Fx?=
 =?utf-8?B?R0pPejVBVThTcFM2cjMxQWMwTGMrbDBVMDdMTzB4ZW9iUUtVQ1dNd0tUUmRS?=
 =?utf-8?B?QUg2VlFCMklvV3JJZFFTWDkvVFFBNG9IbWJ0N214UEdka0pjT1Z4SUpvc3ZD?=
 =?utf-8?B?S1hZaENYczM3c2djWmIySEFtaFBRcTRCbGpJL3dQN0hIems5dXhLTkNjR3FZ?=
 =?utf-8?B?ViswbnpsWkNvSFc5MDd2TUovaDROeC9wZURQVW5CYXlJYzhwMVd1c0VIUXJR?=
 =?utf-8?B?eG5uWTU3bXJ1aEhwOGU2VVVsSUtXUVlEdk5Qd3l6Q0tJalg1R0k0QnlkaUZy?=
 =?utf-8?B?eFBaY0pKZWtCTjZRUHJyUnA3eUxiMTliK0xlOUU4WWVteE5wMXdtYWVJdnpJ?=
 =?utf-8?B?eXVveVFaQ2k0YUpwZU0yQWV3L1RqckduWXdjLy9DeHZZY2QreFN2VU1DUnFS?=
 =?utf-8?B?R1U2ODBmMVF2NFkzWk1LREZOSlU3Rkt6WU50OExRMUoxaTM1bUxzbmtkTWwx?=
 =?utf-8?B?QTZJYWp4d25xUHczVkRoTnhuSXlTYTY1L3pOV0NQUXB1ZWFCUFFGOXI3cWhM?=
 =?utf-8?B?RzUyRFZxVVVuOXJUL2tNTWxGNldkTk1hQjBoMkdtQ0JYUTczTldOL1p6S0JT?=
 =?utf-8?B?bmVzTFB2aUJQeDArTjYxaUVjRVNxYWxYWU5TRzlxTFY2T1hKZTcrMGh2NWZT?=
 =?utf-8?B?ejJvTUFWOGZjR2kvR1EraW95Sy92SXhPZVBoSGtPMkk2eXBtd2pXQlJnUnls?=
 =?utf-8?B?aGJiQk90WXB3Z0p0Y0tTN3JMWDM3MW1MSktWNHFwUmgvaW02Q1RBVWpOaDFB?=
 =?utf-8?B?OU15YWlCRDY1WHlnUE5mZ01uWTcrOTQ4b0cvbWpEUXNUUThXamdaWkdBZDRn?=
 =?utf-8?B?dkEydHJKV3ZMUDR3U2wyOC9jWENFZERqSkYySmxQTHZuL0wyZlhxTm1TT3RR?=
 =?utf-8?B?bk1QN2Q1eWpnalAzKzM0eis1TFBXL0FMeks5RHN0dFhaemFBZ1J2WFlOOFNm?=
 =?utf-8?B?MWp3WUpBdWMwbG01UDFvMXV4SDhmdURVeitnOElQUnAxZEFER2oyMjVjclE0?=
 =?utf-8?B?cy8xYTdkeWhqTE5wdVdFUm94d0srVDlNanVpQmlxc0tjZjhTbnJ3MjdoMmJW?=
 =?utf-8?B?T1hpRnozU0c5bU84Qkp1SEcyTHZQbEhTK1JrakNieUZqM3JXNWJJaFE4ZW9i?=
 =?utf-8?B?U3U5QmlvYXhQZ1ZSdFNMRXZCTy9Na0xTZUR6Mmloc3k3WWttYzQyeVUvWjNa?=
 =?utf-8?B?Y2JudndhQVI1TnJMeUEvSDYzZUN3NEpyZGt2bG5uTFVVaUozdXhOQnRRdjNs?=
 =?utf-8?B?MGlQdmE1cWx2TDlucFBzaDl6RmtQTnZIbzRzQk16STZEUDh3U0lrelBNQlZ5?=
 =?utf-8?B?RldrTnBQS0dNRkc0WFZwZ2wrdlBkWEhUdUd0Sy9wUmZLY1pjQllQWjgxS0dh?=
 =?utf-8?B?ZnpQSCtkM1V4WXJpNW50TU41bzFVU3QrMitubm9qKzB5VHZzZVJGS3lJVGlH?=
 =?utf-8?B?WmNOelBiUGduQ1Y4aEJIWGg2MnJpTE41N2ZJSWhYVm95UnRJUTFESkd5OEt5?=
 =?utf-8?B?cUdPSDgrZlBOS2R4eDhtYWdvemVvSUR5bnc5MlVHQm1XcXlFTXhqaFV0aEN4?=
 =?utf-8?B?RjdvenV3S3hXNU1nREVZN2hHNDlKeStoZThPWVFUdE1KTEJleFg0S2syYnU4?=
 =?utf-8?B?LzdUYWhCNDB5aVM5OEJDd3NPM1JTT2N3QUxMdFR5NmhmKzJGNkVGTlg5ZXNh?=
 =?utf-8?B?VXJmWENXbFhkbEM0ZTZTVUkwcnVZaVBYWUtNK29PUkFtb09MVUVkVHd6T0Vx?=
 =?utf-8?B?SWpMY0IwejB0aDBBV2xxUT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?OHJRL2JGVThSM1lBRUpta0tHSTNoeDhJSW9QN1hKeUhaNWpWODZHcXZDcHlJ?=
 =?utf-8?B?VGdEa2VuNUdWcVNWZVFuam9jU1k0Z2JUL3hFa0M3bkdMdmVpTk5PaW5xM1lP?=
 =?utf-8?B?NkV2cEhQYVlGOW9vcXl5blRtYTZNdU82Y2RsY2krN1dXYlBjUjcxT2k0NjFY?=
 =?utf-8?B?N2NmdFIxSFlxYWQ2RklDR1JORFNBVHhFQWlqZlpCcGlTWUJuKzUyQk5SZDJZ?=
 =?utf-8?B?ek1uM084aGJNdUQ2RXAzUkpyK0R1eElOTVArNFdMWVYwdkNUMlMwc2s1NFY3?=
 =?utf-8?B?MnFjYVJENVlJTEtEQkFTN0tZNGZveFgzMXdRREk2UEFuVFNCOVAvRUZpajdR?=
 =?utf-8?B?WDRGY0NUOEREUm1UV3FwV2phQkxQMjBEWTlVcTlPZSs3L0R0MHgyUm5abXBE?=
 =?utf-8?B?cFA2Q2ZNQVRLR1VwcHZMWTk1Y2QwbktFWkx4ZXd0Y3FYNUhpT25zMWZhQndY?=
 =?utf-8?B?ZXloV3hJZXJxY21zejZPTkU4dCtBb29YKzVBZUFaVklRWnZKTHFFT2F4TUVB?=
 =?utf-8?B?OUNYSjNNSjZUWWtJUmlQTHhUSklZczFWYk0vQXlwTTh2Y2toRnBWdnhXRkg5?=
 =?utf-8?B?MlhYVitrVmRXcXdnaWUzcFN6VTdLVG1nUWkyVC9Xc1pZV1pLbjdWMmpHem5z?=
 =?utf-8?B?K0JQZENla0swRlBEKzJyQnoxcndmdFo3L3ljU2l1eWtVT0J4WktsSldIdEJx?=
 =?utf-8?B?MWw2bFlvWVA3UmJLeFkxSzdKK2p0TTZaU2Qyem1iTkUrQkEzWWlSTk5IRFE3?=
 =?utf-8?B?RTVWOWV5WGRjOG0rZWxpdXl2dFBHNXJHRTU3U2Z1elRCUkhadWVXaEJBaE0z?=
 =?utf-8?B?YXUvVHI2UTRMQ01saHpvQnc3U2QrYUhCTG5QdGpVb0xEOVp6NDlTMG9lVSsz?=
 =?utf-8?B?cjgrYkc3ekF2NFJoQm1BbFEvMjVINFhkQ1dEbGJHa0FXZUU5d01EQjh5bjJF?=
 =?utf-8?B?R3FWd2lDZHY4MWxhb210ZGlUU2U2SkZwM0MwQnpXTmttUE9rNVBON2hUeWk1?=
 =?utf-8?B?WnBmUXJDYldFNmRWSWRLeFBjaFNwS0dHaWNQS2UwN0N3ZWRxcC9mMysxRENm?=
 =?utf-8?B?R3RBTlg0K3ZaYUU1ckFoaWdXK3VCdGhBWjVqNU5pWk5scit4VXVXV2hudloz?=
 =?utf-8?B?RWtWMWl6Slg5c3ZhYnM2RnhkTXQvQlcvcEJ4aHFzMUUwV1VOTzRNOXp0bnpB?=
 =?utf-8?B?RzBacFdyQWJOMVRReFFyQ2d5U2NBUmR1NlBLcmNIL2xwN1pxekdxM29Md2lT?=
 =?utf-8?B?MDlHemJ3bDgxWW9OQk44amZwRForRUN3OWJZM2M2Y1czbzNMR2UxRURjWnBj?=
 =?utf-8?B?Z21oY1FtUFRyK3NJZVgxZUxaTEU3OG9lOXVKQVhXL1J6ZDNXeEdTa29ZVisy?=
 =?utf-8?B?cTZpR1BXaTBkWlp2QkdtdVhCUk04cXlLNzVVMkt5N1IyS3JTeE9ITlVCblFj?=
 =?utf-8?B?NnZJV0xXVUNGUi9LdGxsQm1aNmtoQnRCdk1hekdKTk1rT0VHOWNsQW1nVlBp?=
 =?utf-8?B?T0hEYUhyOVpGaXJXam5LN0ZDYmFuUExWeEhOckhIVHBMQzdrcXAzNTRpWmVi?=
 =?utf-8?B?c0JzTXltTWZlcmowcjBXcGpFOU50Nk1sSWpzTG1MWFp0cm5rdTViVmZxcGIy?=
 =?utf-8?B?T1BmazM1QnpubEJ3Ynh2eUt2NXlMWnlOV0lEWXo2UEpWLzZhWndwVnM2ZmJp?=
 =?utf-8?B?NkdqeE1wRXB1Tksrc1RGVFdiay9RcFFDSXFFckdBZUgxTmRabWRQUWhacUpa?=
 =?utf-8?B?dWR0Ui8zMzVDd3h4aDRqV0hUV0hMSERtenJzSDEzL1lSSWNFbVNucGE4SjFC?=
 =?utf-8?B?YmtrOHhhbVdPSXN6KzJ6akovTS9sbDVmbkxTWFM2RHprSkdRVVByeGVnWTZD?=
 =?utf-8?B?a1U4VENnMms1ODhjcFdIWjE4TU9iVmlhUlpEQXk3RUZkZW1teWFrQnpEd3N4?=
 =?utf-8?B?bE8yaHFrRXlTQ3Q2NmVYU1hYamdtZnoxc3Iva3JhZzY0UVh2ZWJvMCtwRmJa?=
 =?utf-8?B?UXFCclVuV3BIWlQ4WEJOTVB2UHdJaGJoVkZTc0hpT1VBTENWS0N0SWJrd2JU?=
 =?utf-8?B?ZmRBdHdBUkRibDQzS1B1V1U5UU1zUlpjM25vcEd3VGxPSjJLYlY2ZzhyTXR1?=
 =?utf-8?Q?TorBeL/ED4ifLXlRBbTZOeFy4?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3A6E691D87E82543A126788C54E22434@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d79b8be-3c22-440d-9cf0-08dc7fc81873
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 May 2024 10:14:15.9715
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JfmWde+YpHcKsz+OEkFgbaK7u64yGpy53d6LzYNfyr4fEyABjhA/EDY1WcdllvIYIrOsA01oq0j05JWO3KuFfZhgyMoldu+wlYfhSsDe2dw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PASP264MB4707
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Peter Xu <peterx@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA1LzIwMjQgw6AgMTI6MDksIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IE9uIFdlZCwgTWF5IDI5LCAyMDI0IGF0IDA5OjQ5OjQ4QU0gKzAwMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBEb2Vzbid0IHJlYWxseSBtYXR0ZXIgaWYgaXQncyBQVUQgb3IgUE1EIGF0
IHRoaXMgcG9pbnQuIE9uIGEgMzIgYml0cw0KPj4ga2VybmVsIGl0IHdpbGwgYmUgYWxsIFBNRCB3
aGlsZSBvbiBhIDY0IGJpdHMga2VybmVsIGl0IGlzIGJvdGggUE1EIGFuZCBQVUQuDQo+Pg0KPj4g
QXQgdGhlIHRpbWUgYmVpbmcgKGFzIGltcGxlbWVudGVkIHdpdGggaHVnZXBkKSwgTGludXggc3Vw
cG9ydCA0TSwgMTZNLA0KPj4gNjRNLCAyNTZNIGFuZCAxRyAoU2hpZnRzIDIyLCAyNCwgMjYsIDI4
LCAzMCkNCj4+DQo+PiBUaGUgaGFyZHdhcmUgc3VwcG9ydHMgdGhlIGZvbGxvd2luZyBwYWdlIHNp
emVzLCBhbmQgZW5jb2RlcyB0aGVtIG9uIDQNCj4+IGJpdHMgYWxsdGhvdWdoIGl0IGlzIG5vdCBk
aXJlY3RseSBhIHNoaWZ0LiBNYXliZSBpdCB3b3VsZCBiZSBiZXR0ZXIgdG8NCj4+IHVzZSB0aGF0
IGVuY29kaW5nIGFmdGVyIGFsbDoNCj4gDQo+IEkgdGhpbmsgc28uDQo+IA0KPj4NCj4+IDAwMDEg
NCBLYnl0ZXMgKFNoaWZ0IDEyKQ0KPj4gMDAxMCAxNiBLYnl0ZXMgKFNoaWZ0IDE0KQ0KPj4gMDAx
MSA2NCBLYnl0ZXMgKFNoaWZ0IDE2KQ0KPj4gMDEwMCAyNTYgS2J5dGVzIChTaGlmdCAxOCkNCj4+
IDAxMDEgMSBNYnl0ZSAoU2hpZnQgMjApDQo+PiAwMTEwIDQgTWJ5dGVzIChTaGlmdCAyMikNCj4+
IDAxMTEgMTYgTWJ5dGVzIChTaGlmdCAyNCkNCj4+IDEwMDAgNjQgTWJ5dGVzIChTaGlmdCAyNikN
Cj4+IDEwMDEgMjU2IE1ieXRlcyAoU2hpZnQgMjgpDQo+PiAxMDEwIDEgR2J5dGUgKGU1MDB2MiBv
bmx5KSAoU2hpZnQgMzApDQo+PiAxMDExIDQgR2J5dGVzIChlNTAwdjIgb25seSkgKFNoaWZ0IDMy
KQ0KPiANCj4gWW91IHNheSBodWdlaGFnZXMgc3RhcnQgYXQgMk1CIChzaGlmdCAyMSksIGJ1dCB5
b3Ugc2F5IHRoYXQgdGhlIHNtYWxsZXN0IGh1Z2VwYWdlDQo+IExpbnV4IHN1cHBvcnQgaXMgNE1C
IChzaGlmdCAyMikuPw0KPiANCj4gDQoNCk5vIEkgc2F5IFBNRF9TSVpFIGlzIDJNQiBvbiBlNTAw
IHdpdGggNjQgYml0cyBQVEUgYW5kIGF0IHRoZSB0aW1lIGJlaW5nIA0KTGludXggcG93ZXJwYyBp
bXBsZW1lbnRhdGlvbiBmb3IgZTUwMCBzdXBwb3J0cyBzaXplcyA0TSwgMTZNLCA2NE0sIDI1Nk0g
DQphbmQgMUcuDQoNCkJ1dCBmb3IgaW5zdGVhZCBvbiA4eHggd2UgaGF2ZSAxNmsgYW5kIDUxMk0g
aHVnZXBhZ2VzLiBIZXJlIG9uIHRoZSBlNTAwIA0Kd2UgY291bGQgaW4gYSBmb2xsb3ctdXAgcGF0
Y2ggYWRkIHN1cHBvcnQgdG8gbG93ZXIgcGFnZXNpemVzIGZvciANCmluc3RhbmNlIDE2aywgNjRr
LCAyNTZrIGFuZCAxTS4gT2YgY291cnNlIGFsbCB3b3VsZCB0aGVuIGJlIGNvbnQtUFRFIGFuZCAN
Cm5vdCBjb250LVBNRA0K
