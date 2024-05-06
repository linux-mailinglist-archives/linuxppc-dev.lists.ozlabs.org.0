Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B8C8BD0AC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2024 16:48:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=hcDCYPbE;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VY45g2gkFz3cSN
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 00:48:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=hcDCYPbE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::4; helo=pr0p264cu014.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazlp170120004.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VY44t4Wrlz2ykt
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 00:47:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PLRtfmtpz8qmFa5s7xdqsGeWeasLVISfSijwA1aHpECRnplUhbrDe+0dbQirhPRNPh/Wr6eFQ/KnJg1FqbzNEbbRg9H5s0jQQSwwd++Q6sdNcEzfOMO7bXzvZnJsgEIdeQGp53jweBcycQ4I/h2MePul4GcwPelMv8uxZzVtB772xKDH80CDKIh/G2100AyAMa+ZvCs2a7YmTNiT4EGoj8E6R/+E9qzwSUiJZRnBdpl+/pLB6/aD2USvsvM8/bZ9TtJv69R1QBkj3wZzdslhprqy/wNbNuVfVcCaXLbNL6PJtS0vzTT4iZjprD6294MTEBATX4jmqMXm8wRRaSRiCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CfAKzuLvIl5BCvPFiZdtQ+jb4hyYJZ+n4L8O9aMwSmE=;
 b=ao48BKm90ngEGMac46VGGk/Qu8WHap2/pHT1mxigGxF8Q998eKuDU+ay/MvTXYy7pPi9c+RpRxnt23px6dnN+e18fMJfF3FI7H+CCUo2oxgNiEWiwPRUH8t2WMhx1anIlheEffeMnxPV/Q3JzBy7boX85xxcxuiZ533v6UR7W5J33zaVhCb4sei80hRMiA1VKSv48g5A07DZYgPiUU/0JG5HRMKDOLY00rB6cHWdo5u5gLRWDXGCuruW+k2/3XL0ncfgbJVjmX+ctRJ0O/6JA/gKDG5scTsBF8JNrmuE3Aj/+7ii7aN/55v02qnf7+xccQM17daaNKTv0MAfDSn4tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CfAKzuLvIl5BCvPFiZdtQ+jb4hyYJZ+n4L8O9aMwSmE=;
 b=hcDCYPbE9pgwAbGvPB/CET2y4N7M65OO0mBZyshHHPQBUn1WvW0COubvV5BbkTNQn7nV/ZhSnnKXAB/ZvJA7ze/ZzjTHMhubTyZqi6okAeOqoFQFqx0Yx8GyE1o4kSw5HujrrqmofuVIKXE73ZKJ58aII3+AWgUbzIwX3DO6II9b9nHgMm+MCp8VhlMX9e56vQyVaTt1GuybxqY+bH633YbdhkgJOoE9supRtT1p08enlhL1JXmpaC5Q9k0dvE7tY6LRhMR0APz2D+5HpshXm+jjHhPyj2PscTimet9t9NjeSbPHs3kB8QQPnU90T0bIpcbheVOfmH9EWxe+sJuEEw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PAZP264MB3416.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:128::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.41; Mon, 6 May
 2024 14:46:57 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7544.041; Mon, 6 May 2024
 14:46:57 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Stephen Brennan <stephen.s.brennan@oracle.com>, Steven Rostedt
	<rostedt@goodmis.org>, Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>
Subject: Re: [PATCH v3] kprobe/ftrace: bail out if ftrace was killed
Thread-Topic: [PATCH v3] kprobe/ftrace: bail out if ftrace was killed
Thread-Index: AQHam+TaexcjirP8s0KhE9PhouyahbGKULEA
Date: Mon, 6 May 2024 14:46:57 +0000
Message-ID: <fd8283ac-232e-49e8-a5be-60e54d87b9eb@csgroup.eu>
References: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
In-Reply-To: <20240501162956.229427-1-stephen.s.brennan@oracle.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PAZP264MB3416:EE_
x-ms-office365-filtering-correlation-id: 623ea92e-a954-4c9e-c45d-08dc6ddb611c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230031|7416005|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?S1NTRzhyMVBGclJnL29TZFJFd3RoWHZDWHdLVSt4RnJhUUNMaGxLbFk3Ujg2?=
 =?utf-8?B?SzNrY00xdGtSY2ZDQWhTeGErWUk4SnhPNUVibFlheTBTTkZXWDJ0eXlpazVy?=
 =?utf-8?B?aEVTSzdwZG00aHBXTTVvem9RbUZmYnVONmJ4djhONFlOOXdVOEd5RWRSTlpH?=
 =?utf-8?B?OENRUlltcWpGUlNUZTRCMUJMdDNiRWN6S1dadWp1VDU3R2JGVzliUmF2eG5D?=
 =?utf-8?B?U2Zha1hLTHQya01YVitJYVgvdXFYQUI0TmZGK2t2T1NuSUlWdk42dW5SMWxC?=
 =?utf-8?B?bGYrT1lNNUxwOVBBbVVJbFl4WW40eWh5MXFtcy8yMXpLMXMrK0ovUE1PUlRn?=
 =?utf-8?B?N1N0ZXNPK1V4WUVFL2NZLytId1pQYXdyN3hOV0VJNDI4YkU1Z1pzbHVYdllT?=
 =?utf-8?B?OUJqZkVhcHJ5dE1kdWpVYnRVTVcwWHBRaFlqb3Z0aGh1dkRTMlhvWXBxdFJ5?=
 =?utf-8?B?K1UrRXZtZlRkb2VVVFEzdVdBZHRNcG5rS3VUYTkrREdDRzNxMTZ3dXo5RW5O?=
 =?utf-8?B?QnBUUVlxbG0yNUpaTkJrcWhUTlByTWlnU0l5T1ZsQjVEMHBUcDNjdHRCNkww?=
 =?utf-8?B?RHNCL2E3MzVBa1orbEZzOWdnaUs2WlhHOXA1UFVtdjAzaEdNVjFWK2tOYUto?=
 =?utf-8?B?VVVQc0VsUVA1OHZzNCtZV0xpMlljRlhqNzlIMmZVenFZb0lQS1FoZHhYWVpk?=
 =?utf-8?B?Vk9SSEg0ZUtDVmtzNjV3eUtqNDNTc205MWxaWmNVRU1JSjl5dXVpUzRLemVv?=
 =?utf-8?B?SEN1OGkva1luNkZRdXY4bUs0aUtCSWsvS0VnUnh2S1Y1blB0K0tlYzZ1MUVO?=
 =?utf-8?B?S0JPdEVTT29kTHU2VGhVTVJieWI1R3cwSkd5Tm10UUQveUxDSlAxcHBvTXlp?=
 =?utf-8?B?SmJUNG40SW1VVVNxUTFmejd1bHVuaVlCVXU5a1ZUdUFTSlY5Sk9CWDNtN09K?=
 =?utf-8?B?ZXBiZjJlNlZTcXBheHUwQzc5VXMyMk5zOWkrTU1TWFFOcHJqTVpZMStwTE9q?=
 =?utf-8?B?ZkV3eGQwQm9mSFhqeDdUZDd0NWZXTjVreGVqbHlUUUMrSkdGZHQ2NGFjckk3?=
 =?utf-8?B?VWlweHB3Mzl3S2RrUktCTXJaTTZxVHhXMEpOalVCNzd5SW1vWXh0UnFmcHdM?=
 =?utf-8?B?c3BLQnBOcmRUWE1wL3dSbE5ENTRDNExtV2kxZllycGsvbTJnbnFEMVFtakls?=
 =?utf-8?B?c3FEQXlhUDFyK0c0cjNxRDZ1VW9WeEpaeis0SkxaNkRoc3FUcDI2ckVYRFMx?=
 =?utf-8?B?ODc3RDBZTTVHNkF4MDdXbTZtdkdDUlZkVE8vY0YwdHZaN0owZXBsRG9JVU12?=
 =?utf-8?B?ZVV4UEpMdmphMFd4REgxaEoxYW1QZVVtWDZ2a1JiQVJjWmdPR0diUW5zSHJM?=
 =?utf-8?B?bGZLWWJld25LTzhPNEx1cS90Z1VNZmtKSktJaUIweGJhSjdBM3hRa2o5OFdS?=
 =?utf-8?B?T1Z5b2x4RmRWVEZXSjFJbVp1RGZqaFJDYlgvRThLN1pSamp2NFNtTnFqVWQ1?=
 =?utf-8?B?ZzZwUmpveWFJMVgvYUEvUTk0QnpzOVcwVXFSM3g3UUxXZFVDYWd3L1ZNbnoz?=
 =?utf-8?B?ajRheUpsSjJEQXpaWFFXUHBWWXdtc1FTZEVUWFFkc29hd0U2Yno5K05CSUln?=
 =?utf-8?B?dmdTWWd5dklmUndXa2VTdFlvNk9wTDFXU0NaVUNoWk42SjRGbkNYK2JsdjVr?=
 =?utf-8?B?UXRKRFhMNHE3UFBPWkJRWXAyNDVzYjk1dHl1RkRpamk1U2lVcjNMaVFRPT0=?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(7416005)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?a3NoL0Njdmk0ZnM0MUsreFk2WmduZHZqTjd4NHhRNmlqcDNpSW1EQU9wY0lm?=
 =?utf-8?B?T0pQUWdiVHRmR3l5Sk82ZmVwclVWeTJyOFRad2hCT1pDN3JsMzNaN2RoRWRB?=
 =?utf-8?B?Q0E3cTVITjhHa1B4d1czc21meVFZcXR5TjJHdEt0a1lIWDdvdE9Bb3lxNXdy?=
 =?utf-8?B?TlVyUmVReHp4SzhTZXZiR3lxZGUvaVl1RnFvUUhwK0Jybm9rV2RDL0pUdHht?=
 =?utf-8?B?bXMyejg2eGdlQzBUUzZlWWV2SnlTK0w0WmdxSWtpTzVlNGVhVWFJZU80cXNP?=
 =?utf-8?B?Rk9OWnNpR2lXVURIZm8ybnpoc2RwYXJXSHJNdXR3M1JlQ1FLT3F3bGh1R1Rn?=
 =?utf-8?B?YTNoNHRMdWRqN2FSeFMwa0FZUXB5K3JqODNMdE5EUU1lSGVjZG1SVE5Ec29q?=
 =?utf-8?B?TTExcDdRRS8vc0ZRbGx5UVpyaGVvTFVwelM5NVhYUHJKU2lETER2RXQzRG05?=
 =?utf-8?B?TTcyMTlMbHVLcHcvaEVaQWZOSG9GRkNVS1Y5Y205VzExQy9qLzd2NG4zTXNt?=
 =?utf-8?B?WVdacHBkc0c3cTkzLzVLVVZ0OVhRd0NUb3JqSllGWDZLUW5HYjhRanY2dEJH?=
 =?utf-8?B?Q2w5ZUlxb3pCTDk3VzlmTjRnNUV2QkRMdmFnN0djd3RPcjdVU3NFanI5WTZK?=
 =?utf-8?B?Y243Uloyb2hXRTZiWE1yVmJnelZIam01aGNXV0xURFdLZnU2YTVFLzJCNkNu?=
 =?utf-8?B?TXdCWks2TUVpcnppZE1yYzFON21XZFRmV01vVWJiSWxLNzV6TjNBN1kxYjVL?=
 =?utf-8?B?bzhhYUZxRUIvdEpIVzVxTkYwdVpGbStySUlHaFJTMGQwcVp6Z2lLNk9iekpY?=
 =?utf-8?B?WXphTi95WW5BRHF3a0VhSnR2Qmxjbm50ejBXd2lGWHliYk1OeUhENC8vSzZO?=
 =?utf-8?B?eTFMT0dGc0xPZHYxUVNWSTAxSHNHTERYN2JlTmlKeTFGVm0rMlhXd3FOT2Ni?=
 =?utf-8?B?RjFPOTRmRlVIYjhMVm4rVE1YTHlPYWJjanBSeVZlOGtwNjFVU3lDUVg2Wml1?=
 =?utf-8?B?YTZCWm9lZGVLM0w2SmluakpOQTRTek5CcGM1THNPSGI2Yk5iYyszU0tXRVFy?=
 =?utf-8?B?aFRMRFpUUWJUN2w0TzVMcFIzZGVmcFlzMENFOG9mWE5qdzZPOC9SNXFYeFNu?=
 =?utf-8?B?RzBzS0R2Um9nclM1S3hLVi95TGsxUDFHL3hMaGdldkFjUkFVMkFwOFRYMXdp?=
 =?utf-8?B?dFJLeEFTc1JPTHRGVzFlN015K212Y2JSN1NocG5UZ1JGNDFuRng5MHFveXND?=
 =?utf-8?B?SG1rbHMwWUR0Y2tPRWxWY2pnMHNTcWNGOUtLc1NjZmRlRUVIU0l2aVZkWCtl?=
 =?utf-8?B?MWNzdFlkOVBSTUdPRFl4Z1FmSWNTTGppNDhmS0dtRkUrUmNnQzNudlFua0VX?=
 =?utf-8?B?VWpUMC93cml3TkNHd25NTFdSTk5tc3dUNzNEZWJ5ZDNxU0cvQmtSYkFpYldu?=
 =?utf-8?B?dng5U2xVdDFvL0tIMDdKd0Q0U1BWZlo5eENxTzY3VmVZMVB2elNjeE1XRm81?=
 =?utf-8?B?Y2dwRzVjbFRkc3VkcTZkM2RlZ3FGYmZFTjd0bGE0ZUl5Y3RXa1hvdk1LREVO?=
 =?utf-8?B?WDhEQjR3ODFIZ2VwbE5aVHJveVlPVkRTcXRXSDlHcVdnOTNXYWtWZjROcVl3?=
 =?utf-8?B?MzgyTmZkUHhiK21oUUVKSUFwR1JLZGsrWEt0dkNOTmdIU1A0NUlRdER2MVIz?=
 =?utf-8?B?WTFrTWxjSTN0ZXc2TlpwYkZtN1F4ajB3VUlybkJVSis1Y2l4dUYyMk5FcVF5?=
 =?utf-8?B?OWx0M3VLSkpINy9Sd0FmOHppM3l6NXg1a1UyczVvWFVDNzlHdzdSQy9kNTdo?=
 =?utf-8?B?VzV2TUFRdWVtNmJZMFBLRHZpem16RDZXdExwK2t3ZW5uMFVIVmduSGNESmpq?=
 =?utf-8?B?ZVpSTWtpZ2RxQjR3TTFNZDd2R0kxMmxHUHc1bFQ5WWFEVVdHeVNaMlRiMHRU?=
 =?utf-8?B?b3VlWGFnbTZvSzVIMS9ubkVtSXVxb00xbGlGbWJIay9vLzdDQnVGekY3N3Ra?=
 =?utf-8?B?Z0J2eElFbDNYWUo4dEZEenoyalZsWmVvSGJYK3VDUzNBWldMZGxWdm83UlVK?=
 =?utf-8?B?MjY0TEt4Y0REREo3bkxkL3hmN1JKUURSdEZlZVZVYndUbnpnZkp2YnJ5K1JM?=
 =?utf-8?Q?JemwIH0Q//R9UGfzcAJyFZjQT?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E09DAED119D914DAA153FB9E4B1CB6E@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 623ea92e-a954-4c9e-c45d-08dc6ddb611c
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 May 2024 14:46:57.3954
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TswLtT18gjQKyCJQwxzu0eL/kIFea8A3+rZql/oDNlSxdNJwXecB9o2P1i0YX9JYBwDN5lDDAkO1SwJxEA0kqk5UEF/LT+JBbTNkpCnNODU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB3416
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
Cc: "x86@kernel.org" <x86@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Guo Ren <guoren@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Paul Walmsley <paul.walmsley@sifive.com>, Tho
 mas Gleixner <tglx@linutronix.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAxLzA1LzIwMjQgw6AgMTg6MjksIFN0ZXBoZW4gQnJlbm5hbiBhIMOpY3JpdMKgOg0K
PiBJZiBhbiBlcnJvciBoYXBwZW5zIGluIGZ0cmFjZSwgZnRyYWNlX2tpbGwoKSB3aWxsIHByZXZl
bnQgZGlzYXJtaW5nDQo+IGtwcm9iZXMuIEV2ZW50dWFsbHksIHRoZSBmdHJhY2Vfb3BzIGFzc29j
aWF0ZWQgd2l0aCB0aGUga3Byb2JlcyB3aWxsIGJlDQo+IGZyZWVkLCB5ZXQgdGhlIGtwcm9iZXMg
d2lsbCBzdGlsbCBiZSBhY3RpdmUsIGFuZCB3aGVuIHRyaWdnZXJlZCwgdGhleQ0KPiB3aWxsIHVz
ZSB0aGUgZnJlZWQgbWVtb3J5LCBsaWtlbHkgcmVzdWx0aW5nIGluIGEgcGFnZSBmYXVsdCBhbmQg
cGFuaWMuDQo+IA0KPiBUaGlzIGJlaGF2aW9yIGNhbiBiZSByZXByb2R1Y2VkIHF1aXRlIGVhc2ls
eSwgYnkgY3JlYXRpbmcgYSBrcHJvYmUgYW5kDQo+IHRoZW4gdHJpZ2dlcmluZyBhIGZ0cmFjZV9r
aWxsKCkuIEZvciBzaW1wbGljaXR5LCB3ZSBjYW4gc2ltdWxhdGUgYW4NCj4gZnRyYWNlIGVycm9y
IHdpdGggYSBrZXJuZWwgbW9kdWxlIGxpa2UgWzFdOg0KPiANCj4gWzFdOiBodHRwczovL2dpdGh1
Yi5jb20vYnJlbm5zMTAva2VybmVsX3N0dWZmL3RyZWUvbWFzdGVyL2Z0cmFjZV9raWxsZXINCj4g
DQo+ICAgIHN1ZG8gcGVyZiBwcm9iZSAtLWFkZCBjb21taXRfY3JlZHMNCj4gICAgc3VkbyBwZXJm
IHRyYWNlIC1lIHByb2JlOmNvbW1pdF9jcmVkcw0KPiAgICAjIEluIGFub3RoZXIgdGVybWluYWwN
Cj4gICAgbWFrZQ0KPiAgICBzdWRvIGluc21vZCBmdHJhY2Vfa2lsbGVyLmtvICAjIGNhbGxzIGZ0
cmFjZV9raWxsKCksIHNpbXVsYXRpbmcgYnVnDQo+ICAgICMgQmFjayB0byBwZXJmIHRlcm1pbmFs
DQo+ICAgICMgY3RybC1jDQo+ICAgIHN1ZG8gcGVyZiBwcm9iZSAtLWRlbCBjb21taXRfY3JlZHMN
Cj4gDQo+IEFmdGVyIGEgc2hvcnQgcGVyaW9kLCBhIHBhZ2UgZmF1bHQgYW5kIHBhbmljIHdvdWxk
IG9jY3VyIGFzIHRoZSBrcHJvYmUNCj4gY29udGludWVzIHRvIGV4ZWN1dGUgYW5kIHVzZXMgdGhl
IGZyZWVkIGZ0cmFjZV9vcHMuIFdoaWxlIGZ0cmFjZV9raWxsKCkNCj4gaXMgc3VwcG9zZWQgdG8g
YmUgdXNlZCBvbmx5IGluIGV4dHJlbWUgY2lyY3Vtc3RhbmNlcywgaXQgaXMgaW52b2tlZCBpbg0K
PiBGVFJBQ0VfV0FSTl9PTigpIGFuZCBzbyB0aGVyZSBhcmUgbWFueSBwbGFjZXMgd2hlcmUgYW4g
dW5leHBlY3RlZCBidWcNCj4gY291bGQgYmUgdHJpZ2dlcmVkLCB5ZXQgdGhlIHN5c3RlbSBtYXkg
Y29udGludWUgb3BlcmF0aW5nLCBwb3NzaWJseQ0KPiB3aXRob3V0IHRoZSBhZG1pbmlzdHJhdG9y
IG5vdGljaW5nLiBJZiBmdHJhY2Vfa2lsbCgpIGRvZXMgbm90IHBhbmljIHRoZQ0KPiBzeXN0ZW0s
IHRoZW4gd2Ugc2hvdWxkIGRvIGV2ZXJ5dGhpbmcgd2UgY2FuIHRvIGNvbnRpbnVlIG9wZXJhdGlu
ZywNCj4gcmF0aGVyIHRoYW4gbGVhdmUgYSB0aWNraW5nIHRpbWUgYm9tYi4NCj4gDQo+IFNpZ25l
ZC1vZmYtYnk6IFN0ZXBoZW4gQnJlbm5hbiA8c3RlcGhlbi5zLmJyZW5uYW5Ab3JhY2xlLmNvbT4N
Cj4gLS0tDQo+IENoYW5nZXMgaW4gdjM6DQo+ICAgIERvbid0IGV4cG9zZSBmdHJhY2VfaXNfZGVh
ZCgpLiBDcmVhdGUgYSAia3Byb2JlX2Z0cmFjZV9kaXNhYmxlZCINCj4gICAgdmFyaWFibGUgYW5k
IGNoZWNrIGl0IGRpcmVjdGx5IGluIHRoZSBrcHJvYmUgaGFuZGxlcnMuDQoNCklzbid0IGl0IHNh
ZmVyIHRvIHByb3ZpZGUgYSBmb25jdGlvbiByYXRoZXIgdGhhbiBhIGRpcmVjdCBhY2Nlc3MgdG8g
YSANCnZhcmlhYmxlID8NCg0KQnkgdGhlIHdheSwgd291bGRuJ3QgaXQgYmUgbW9yZSBwZXJmb3Jt
YW50IHRvIHVzZSBhIHN0YXRpYyBicmFuY2ggKGp1bXAgDQpsYWJlbCkgPw0KDQpDaHJpc3RvcGhl
DQo=
