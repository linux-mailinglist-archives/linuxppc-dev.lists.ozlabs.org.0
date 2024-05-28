Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id E23B58D1928
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 13:11:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=nSkeKr6x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VpV4X4Zjgz79sL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 May 2024 21:03:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=nSkeKr6x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c207::1; helo=mrzp264cu002.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from MRZP264CU002.outbound.protection.outlook.com (mail-francesouthazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c207::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VpV3m75jWz79bN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 May 2024 21:03:00 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KXP2q+lJQgvFwil9EAcYmWLwLldsDaMw4Vl0Q0MP4sUAntYNB77b6NTtLSaLUnizmV8tH3ssTssuBmaQaL1I0G+fBC8R2DnpPKBXPwoP2qjOtYS/TYcAIkw+9EdhHctRHT4f9AZdGdMVWjPHftvyXm75q4LcW42uRufjUCDdQE3RPcWR+uXewwiwxZ/n1Bs4DVuXmCqZ4wIBXDC2Mk/Xbs/S7MOAVQ7R5Qje0Kaq4NQl5zldRkl37neSAMzaOWEY0ABF45qvfFwSB9tU4t9kZD1A7ksjvJ2i41yj827KSOne688K+5C1Tv0jwxa8xYaw6CRDhKakb7ZD2IEMQ8MaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzpMf22gT858BXqU20qJQT06xyXyjcRTSzycTNqkGWQ=;
 b=DNUj1GME2kk6Rs8503+ky/4HsiKQZ3/7tHdpmAnJiLDwuPYbzVGoiAMDR7tMI4bQwiJW03dD0vO0gplPoQIqmXtxywWh2OyKkXtzzvXvitmN65ZX2jP6zkqF4CsycwlCkZMa9QLXGlfNZddQehaBok3SVpHLaW9Gf+bQ9ZggNLj4wq4/FgQ3MslXiF74vYZL5CxUCXpT9w8rvDbEZMQMaCjj5ouJCPUw5GucJUzBms3wFcCtQOT2oDW3511YpqelANGqdGRp4Hxe/FPJaWDOCNL4qEBE0J5JeR5f3VkjK6gIJesBK43SFTByxIGaB8yrtmYlvSl2foKPXUZLyKq2Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzpMf22gT858BXqU20qJQT06xyXyjcRTSzycTNqkGWQ=;
 b=nSkeKr6x+AKH98ct0kebkzJgtyWcWliptTG3/vn3YEOHKQ6COz0KaYz6l6pQzt62n+gAtTxNH2lSfIS4o7p/2Flbk5x1zOVcE0E9PpetYhZA6e9EHNhsRZmCv4oQwaPc/HW0rVZxXxC39cdiEgJhvitaZ+NelieudprRXTidV0Yw6CeUgWQUdj93NoQRZpQWkxFJyLQswOauLDcD5cDHKywks6Eppv9BwQ8Fv37xl27gF4j8upyJJUYfappKteKWjrcx9mrqMqpCEfzKEZM3zHHtGeLf7iLWaPgJJqldYjjz8I5xm+BaPfWkeOwsFc/tijLBfZFt1VvWp9BwRWPhJg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PATP264MB4812.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:429::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 11:02:37 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.030; Tue, 28 May 2024
 11:02:37 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [RFC PATCH v4 03/16] mm: Provide mm_struct and address to
 huge_ptep_get()
Thread-Topic: [RFC PATCH v4 03/16] mm: Provide mm_struct and address to
 huge_ptep_get()
Thread-Index: AQHasDoM1rVBenI81UiOOsc2qzDoP7GsItMAgABZz4A=
Date: Tue, 28 May 2024 11:02:37 +0000
Message-ID: <a2dfa9ac-f83b-4e76-9010-56d64860526c@csgroup.eu>
References: <cover.1716815901.git.christophe.leroy@csgroup.eu>
 <941ae68c7813cafc7aee3f34131f895fb7599636.1716815901.git.christophe.leroy@csgroup.eu>
 <ZlVudE37ENlFhTo4@localhost.localdomain>
In-Reply-To: <ZlVudE37ENlFhTo4@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PATP264MB4812:EE_
x-ms-office365-filtering-correlation-id: a190af6d-7fe2-4124-59f1-08dc7f05af43
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?UXVlS0o2b1VMWm1RaEdoeS9CQXN0V0ZFZlRVWXVHWUdieVh5cStuRnlDZ0Ra?=
 =?utf-8?B?by93b1YwelE5QmlzREk3SmU4aW84NGsvb3l5OXZWOUZRbWRnU0ZHSG1rWDI4?=
 =?utf-8?B?RzhjMW9DbkFGdG9MYndhU21BTTlCNnZROWRDNHgrZS9JaWFsenlydk5ReHh4?=
 =?utf-8?B?UmNiNVhmOWZFS2twNHdJSmN5RHVsQ0luN3RiZ091VzFSb1pZTGdNNWJaeHdy?=
 =?utf-8?B?OGF4Rm5kcWE1R3BJVE5zaEROakl5RjY2UjlRbzFCUVBVNWo0eFN5NkNGTmdi?=
 =?utf-8?B?OHFWVWYrbW1uWTdwMEdsWm9DeDZIY0pzSm9PUk1Ka1Jzd1RJR3lTVTNObmx5?=
 =?utf-8?B?SHp2UFBPN3JSMnN4bG1NZ0UzNUo2TjZZRjVXTWxnVURMTDNFbzJTaGQva1U2?=
 =?utf-8?B?bXYyY2Y2RVZQeG9UR2w4SUFleStMaERQZDEyRE9KMU4yTXRWb1dWYTg4UHJ0?=
 =?utf-8?B?Vmphc0VNaG5BSWp5VHFMbUR2TDVpTU56enpReHlWMGxsenNYRHBUcEtyMXJQ?=
 =?utf-8?B?Y2w2QWZyNTRueGZTaGpSMThOWUFaU2puVWZEbExnSHAvRExTejljM2tQWk43?=
 =?utf-8?B?Vm5BUlkvZFFMR2k3bDhtbWFqZC9OTllkMU1jRm1kUFl1Q2RHNStHN3k3cXBC?=
 =?utf-8?B?NEQwWkFRM2U5cUVhRGcvL1R2Ylk4bUw5b29KUjVUNkJNRmZ2MGY0WVh6U2Nz?=
 =?utf-8?B?bDVNSmRpeE95MDZlaGxCR1Q4dHM3aXNVWTlWNzdKazFmVEloTUt0VVFYOC83?=
 =?utf-8?B?TFRBRDJwMUYrUzVwcEFOSXFiVkpnZmZUOStXQ2Y2Yk51YUdwWmdJRVFjY3hm?=
 =?utf-8?B?UHJEaE9xc252RHlsL2Z5L2xQeEtWLzVjS1I4NDNleTQrMG91YkdSRmt6emli?=
 =?utf-8?B?UkN3TnY5b1MweklrRDdTNVlydWNqY3lmMVE5MVEyaWxrSEFoVFI1U1RyZkZG?=
 =?utf-8?B?bkpSZzZXL3VwdlJRdjlVQmRHMXlNTHV4aEppTGlmaW5iOWhyVTZwTGI2eSsy?=
 =?utf-8?B?NThtTkREbXhkdkJjMzZXOFBTNGNyVFQyTW50Qyt1Q3pQbnFoYWp1Z011eGlR?=
 =?utf-8?B?Z2lOUW54QnBSMm1DLzRoeG5GR2pLNVEyYlVSTnh5Z1hzWHAzN0F6WEM5Q2Y3?=
 =?utf-8?B?ekI4OGFyY2pWdFFVeWJMK3I2NC93ZnVHTjRDRnBuaW5pY0JEaDgxK0hkZk4w?=
 =?utf-8?B?Ym9ReDNzdy9heEVBZjIrdmFaVHdQZ2NzTDlJNFhGV2NpWDF4TXdnYmxxeVlp?=
 =?utf-8?B?TWJFanZqVEMzY09xb3Q3cktGSTRaa3FzaGZxSVdMRlFsRzJPY2FIVnFrcW10?=
 =?utf-8?B?cGZTWUI3TFgzdFhKZ1VFbGlLOWdpdWtEWUxRendHTlBkWVNWUk9tclUxdHA3?=
 =?utf-8?B?L1hjdmcvSEpBYWVoUGc1Rno2TTRPOFlJa1B1OFQvMjRqRURyWTVZdy82YkRw?=
 =?utf-8?B?b3NYTUtrM3hma21ZYythMExuNHJhSWNiNlhJQitzZGhWdEpXTzJsc2EzSWJq?=
 =?utf-8?B?ZFRuNHpZeUdJazRYY09ERDJ5THRlUUdHTnFodUNIOFlrUm1hV3N3QXZDMkdT?=
 =?utf-8?B?bWs2V00zRERUelNjNllGVENUeVhOOTNZbE1mY1QyUXpHa1hTMTRQUzBWVW5E?=
 =?utf-8?B?V1BxaXNHdDg2ZVdOUFAwSGRkOFBhdjY1UEk2aVl0dlUwYnNPdUJpTzFvYzN6?=
 =?utf-8?B?V2p6Y25rRHBoVlRqcUtsSk0wMERzb2c2WmtiQlp6MU5aSHE2T08yNGtwTGdS?=
 =?utf-8?B?eFhJOUN4WDlreVlySitLR0dvZ0dydHVoaGxQQVJmcThiNXdWVzhRMENXVjdl?=
 =?utf-8?B?WEJEZkVOVktLcFJ4V0oxUT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aXFCKy8zcWM3MUhVWkVLMDR2UVBCOEsyRHZRdW5pdlZNbGFkajN6RDNPTDVq?=
 =?utf-8?B?YWlDRFRkaHJ5T0JpbDdDanp1UkJtczgwSTFwVTVRV0JuOE9SS2FKREJuditn?=
 =?utf-8?B?THZmSGd0ZkQ4d1FRK3lwdDlkOXZ1N3RJSHF1a2duT1hPMVdkWlRwTlBPN0E5?=
 =?utf-8?B?YjkvZ3h2aDFsVzFFZnJsbnBOekFvMStNWlYxWEpkLzc0d1ZKUmRjeVhhTHRs?=
 =?utf-8?B?OUJtQ2lWaE1UK0k1Y0krQm1vdGQxa0lQZjVkOTQxMVhTcEg5RUh6a3FOK1hB?=
 =?utf-8?B?cHR5aEw0YUZzUTZqdnJ3dWxoWHdQamtVbnByVUpTY0RuTWlxSGtFTkY3L1cx?=
 =?utf-8?B?NUc4VkVNY3BLNkdaY0VOb0JlMk54QzlJQ2RsUHdDcnVPOUxWSjVVb3dUbFVp?=
 =?utf-8?B?S1IrOVdiR0FWKzFvek5ITnpmZml5eUV4WjhMSkF6dkZZa3VGcTJLUjJ0MTdH?=
 =?utf-8?B?OWs0M2dTWGRNcDRZQW9jS1Q1RmVOdUFnTUFYd3dBZ3Z2M3BPMnRWOU9aUkFp?=
 =?utf-8?B?N2NvdjV3N2JUUXRPNWNmTFN4ejFqRUtzVEhwdyt6QVh4RUcvbFZhWFRlN3M0?=
 =?utf-8?B?VVpRMFN5ZjA1NlB2bEtBLys4TjhUdExDSVVIREZRem41amdqLzRkdDZtWUxy?=
 =?utf-8?B?amRka2J5YWkybXM3NGphM2dQVnpjTkNtUDZMTjZwSm5abXZSalIyZnpZVVM4?=
 =?utf-8?B?VHRhNjIybSt4blNJSlJHS0IzVzk1bFp5K1ZJbjRITGpoSVBEMVhNZlhsUFh2?=
 =?utf-8?B?N250VnoyRWNhbVlyY21MS2tGWTV3M0tvditQeWJjbWVxYUZGY0l5VlpqclFD?=
 =?utf-8?B?ZHBIeUZzZElRb2I0MEp0WlFENmk3aEZVa0VsM2dPV1FIcHYvWSt4TzNGNUl1?=
 =?utf-8?B?bzVlVDNNU2pPM2c1V2Z6UTMvSks4cGQvdjV2Mk5Xc3luV2kwZ21Tbk14SVk5?=
 =?utf-8?B?bndjUW93VzZFTzVhOWx2NG1CL0tvWjRpektvUzhkem9YajRkNmo4RkI3K2pV?=
 =?utf-8?B?cEJTWG9tMkFhaVhXcXYzdEY3SVN2RzhDN3BBaGh4Tzk5cFZXRVJ1Z0JvbUF6?=
 =?utf-8?B?YkRkWndKSlVjMWpkdElOenNkRXVsQmk0QlQ5QXJHcnkrZ0xJdVlHNjBMbC9Q?=
 =?utf-8?B?RnZEMWFTLzNDd0dmcnl1VzBEa2RIY1cxZXNsTEc3N1Y2U0pBVit6eDVCTDRW?=
 =?utf-8?B?OWNkbmV0QmdwNjV6L3JzUHNVY3JlamtNa1B1a1ErU0lFT0d5T1k0SlU4emxX?=
 =?utf-8?B?Y1k4eVkvQ2FBMTNxSTd3Y0lZdURhSEZUL05WVFV2b2E5TE9uYzFqTEloWExx?=
 =?utf-8?B?czdHbDlsMmF1NnJwZ1VvN3FBZ05jRys0N2lXcWQwZTd5VmhSa1AzdzBvM3Bs?=
 =?utf-8?B?dW85N1d5cmY4cFMvdlM5YVZ0Zi9VUHYyaFE1L3hnSlFvQUlJaXpDRkdwYnAx?=
 =?utf-8?B?OUFxc1RYbGFFRWVqelpVTFpha01JcVRvNnlEMFlIRFcrb3dwVTBoN3VtbUhE?=
 =?utf-8?B?YkxFZ0ZBTUZ2NXBpV0M3bnN6cERIck1BVDVJQkVSWDg5SE84a2VZMXlBbGs1?=
 =?utf-8?B?bEFOaFQydUtveHgzTE5obXpHWHVQc3dWWUxWZWdIMHc5aVdtTFVDVVUzSkR3?=
 =?utf-8?B?UDV1YVM2YUNETHVKc3MrWm1HK3ZJSGpGQ3hsbkFKTk1FZFRweTBWeHpiNzU5?=
 =?utf-8?B?MU9Oam9CN25rN3hlNGxPRUhITElkZ1plMTd4aldielhFcHl6UUg1YlJhSk4z?=
 =?utf-8?B?THRzR3RzVXBtTm1ONm9UU0Y2eGhpMTRadDZNSXB6T25mcnA0R202SFZRNkVw?=
 =?utf-8?B?OFdreSt0ZnBqNWJBa1pHNFR0MFp1VmdOZTRFcW1WaUxpSUQyWjk0dzVlMWhM?=
 =?utf-8?B?dUphVzFaZDdMZmhvWW1yakNHeGR5dGtWUmR0cmZMODJReHZOMDFiOGZLOHYv?=
 =?utf-8?B?NEJpbC9OMkJweTRiaXZFelhnQmdlQWdPYmJmZ3JZemo3UE53eHRkaUU0LzJP?=
 =?utf-8?B?MGphM01SK25jVEtQekh0NEhmcm1lTkJBZnFJSWRPblJuSUpDais5SjR5NlVJ?=
 =?utf-8?B?RmNWcXhyUlI5akU5NCs3Mk8xbE9xd2hNMDk3YnVDUE85bENZeGFXa0xzcHF0?=
 =?utf-8?B?TEVLRzhVNnZOM252VDRNY3pnL3pXaVRpV0dvaVNvSHJBMTZtdlFOSFlYYitM?=
 =?utf-8?B?Q3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71FF34FB7977684B82586179BDF735A9@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a190af6d-7fe2-4124-59f1-08dc7f05af43
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 May 2024 11:02:37.1496
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tL16PyUuymMdzfsowan/q/9/8LjOaBME9VhFUS1fryGdhRI0dFiKSHJhZeMY320MnmMCnFMUiXE3bz4CEBrBPDMfCZjoxVaUwkAfFXXY0m8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PATP264MB4812
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

DQoNCkxlIDI4LzA1LzIwMjQgw6AgMDc6NDEsIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgTWF5IDI3LCAyMDI0IGF0IDAzOjMwOjAxUE0gKzAyMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiAtLS0gYS9tbS9ndXAuYw0KPj4gKysrIGIvbW0vZ3VwLmMNCj4+IEBAIC01
NDcsNyArNTQ3LDcgQEAgc3RhdGljIGludCBndXBfaHVnZXB0ZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSwgcHRlX3QgKnB0ZXAsIHVuc2lnbmVkIGxvbmcgc3oNCj4+ICAgCWlmIChwdGVfZW5k
IDwgZW5kKQ0KPj4gICAJCWVuZCA9IHB0ZV9lbmQ7DQo+PiAgIA0KPj4gLQlwdGUgPSBodWdlX3B0
ZXBfZ2V0KHB0ZXApOw0KPj4gKwlwdGUgPSBodWdlX3B0ZXBfZ2V0KHZtYS0+bW0sIGFkZHIsIHB0
ZXApOw0KPiANCj4gSSBsb29rZWQgYWdhaW4gYW5kIEkgc3R1bWJsZWQgdXBvbiB0aGlzLg0KPiBJ
dCBzaG91bGQgaGF2ZSBiZWVuICJ2bWEtPnZtX21tIi4NCg0KT29wcyAuLi4gVGhhbmtzIGZvciBz
ZWVpbmcgdGhhdC4gQXMgaXQgZ29lcyBhd2F5IGF0IHRoZSBlbmQgaXQgd2VudCANCnVubm90aWNl
ZCBieSBidWlsZHMuDQoNCkNocmlzdG9waGUNCg==
