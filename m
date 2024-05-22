Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id F2D458CBD31
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 10:46:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=bCrHpgck;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vkl7M0nz8z3vd2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 May 2024 18:38:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=bCrHpgck;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::3; helo=paup264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PAUP264CU001.outbound.protection.outlook.com (mail-francecentralazlp170110003.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vkl6b1qCNz3bs0
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 18:37:26 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WD127UgT8uEssbL4ttm3TUki3x3guyA2CksvhTO0ZGejYH1xZVPdLriy1orI7O+EBxXzpwgzPsmyJuZIVwL4L0bo2vEU/Q8wLSsLZ4XJQ1XkOOSFybNzvGpCeFf63ZxCt5cwaJ58QIB+guDIahA6eTFyACMH5x+Y5lksZkV6E96M3ZK5rGCCDxKEsnUAKZa6W6s99PRbON8h32wgozdaXlLn66f0jUYsvgVHBY41lBexQvDh9Nf7MkVPvHuieHGZkyCPzxcJO9pSlBHSd3QyHU0Yy54L4zAuusqA/aVXnFIZJEkNo7T9DJTOnodOHJQJeIr/ZpUg2fLiYDIBVBfAbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RfhKyMAgj3OAGqTfrgjNJYap8HH8JjpNUlxdJeSL120=;
 b=SKSdFpGkbRCrT0797Zv/vU4JQsEb7gHOR2zPCQ1MzeoRpC5a1gRJ7siwbpVzL62pZ7XRq34pZSs1uqQvZuiKiPeiahdWZfZsEBBVnu/XfHP3xdDGawC14smWx8UbG9GPMlYAZaRBheUZOz2CQZ1G58lxJaGTJt0Eh8IFPN50cROkqLQ5ReTgKHekrf33WrGK3CsD30VX+6RfHTMKWB2Fj55DT/fdp66Wgr5yZIfNMGp+YnJ2J3ZcQSNi3vo/dxiYLlkxjFZFk78nb0oZVdzKTpYYh39HDHuu1/PDzNFmTxnmKv2TJkHuh4SUupTCJePf0BGGCw+qBLiZyrA0/dvUVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RfhKyMAgj3OAGqTfrgjNJYap8HH8JjpNUlxdJeSL120=;
 b=bCrHpgcktIxKv1K5vQ3F0iSQFp+03se+fq4qeM7p3PiDC7I/bmfgT6Pv978uy+Y17i+d1ilLxjNX1QQIvjALnRu9hyFDAyv3R4PuoEJcWSM+rqUGTH3sIjadQF9OQjbxWUT22HEpXVq6SrEk9jj7g4loR1DtfowpNwipSzqUdCchWs4WIwIz2poDkOTXqCZtt/UrE0eO87DDss1Zeav/qZCvE7UwaHV9nrBG68YgFOphKV6EBDxRZ4QxR6ggEZHoyMUMXtTG/tJFKbz6bZinZHmlEwxxkHCi4uZnMa02f28fx3C1YGWBp9cgKXNYdMmDRFxal7NWDdiHGPB/wxmvEg==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PATP264MB4552.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:42b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Wed, 22 May
 2024 08:37:01 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::96ff:7284:1fa1:b02a%4]) with mapi id 15.20.7611.016; Wed, 22 May 2024
 08:37:01 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Oscar Salvador <osalvador@suse.de>
Subject: Re: [RFC PATCH v2 01/20] mm: Provide pagesize to pmd_populate()
Thread-Topic: [RFC PATCH v2 01/20] mm: Provide pagesize to pmd_populate()
Thread-Index: AQHaqIxu+WRFYbtgw0e4nmB0ey6T7rGf15gAgAB7x4CAAUeZAIABWl2A
Date: Wed, 22 May 2024 08:37:01 +0000
Message-ID: <47bf8631-a214-4653-b098-5773a7d6ee83@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <91159d49bcbee0526ca6235ff7ef1ee7d378d013.1715971869.git.christophe.leroy@csgroup.eu>
 <ZksRfAXja0fhNePD@localhost.localdomain>
 <dc66eff8-4371-4685-9dd8-3dacd3744e73@csgroup.eu>
 <ZkyMIOs76sZI5GsV@localhost.localdomain>
In-Reply-To: <ZkyMIOs76sZI5GsV@localhost.localdomain>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PATP264MB4552:EE_
x-ms-office365-filtering-correlation-id: 0af090c6-2e97-4a27-4d8e-08dc7a3a5a0c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?YWhXZnZYbVBjTTRscXMzUXZjZktRb0JReGRlTVg5Qlc2elJmUnI3NWFsbHR0?=
 =?utf-8?B?RUJsQlVTVk95Q2pzcnl6T0pkVG94VmpSamUvVkxFNWQxMW1pUk1vVGoyV0Ix?=
 =?utf-8?B?T2xyMHRQSVVPVFo5KzFGMm1UaW9sMjN3SWtSdURudFdRQk5ySTVEaTB3WkZX?=
 =?utf-8?B?eXU4TWpuTHNFNFcwdlE1ODFvZWpUeGVIZHJrakZKa29xNlJEL3lqL2c1L0N4?=
 =?utf-8?B?OFRVMUd2RlJPNS9MRE9HdGozTWN3ekhpdkxyUCt5bnNNWDdtZTNheGI4SSth?=
 =?utf-8?B?QWZPdWI4ZGdJZE5WenRnN1RLZkdUNUtCelRreCtmSHdjWFJYUERTeERPdGdl?=
 =?utf-8?B?bVIzNlVIbWd0clVzRUpnOXlPMXpidWZteWU1RUZVaW9pemxBUVBUZU16MVhF?=
 =?utf-8?B?WG9CKy9MWjljQkNRZ0pjYnh0Y1p6ZGpKMmI0Wmx6ZWdFb3JxWTdEUUd6Sk9J?=
 =?utf-8?B?RHQrUzdpMjhhbHVQSUttZG1pMW9WbVI1bXB5WHMrcTVwZnNRdXJlVjR4bnBY?=
 =?utf-8?B?SDRscmdaTndKSGFpYWlybENuNlBOcU1iL0pMOUJqM3FIRDFVZFh5OGVmWHkv?=
 =?utf-8?B?VHU4ZG5UODZOdDNaVVE2NG5LNHhiQ1hXdHZrM3BBVWZxTXZFQi9SOGhGc2RX?=
 =?utf-8?B?SFBSSEhIU1FoMmhWV1J4d1dsWHZiY0xnc3NRZ3RHdlRCQnluSG5xZXBISHMx?=
 =?utf-8?B?ZWs5MVRNUHpUYmhvRk5qVDF2c1Nvb2RRRFFUSGRTdXhGVnRzU0tmT2VNbkdJ?=
 =?utf-8?B?eEU4MDg4VTlpWE9aVmlKNnJSYmpjaXFmWTV5ODdpWWdWVW1wc25RS1BCbnFi?=
 =?utf-8?B?VkZNTDJQbGlRTHE1SW83ZTJmTlNDYmh2Wm41N0VkdC8wT0dNSGI3UkthclR0?=
 =?utf-8?B?c3VwL2pSdXU3NXRiOGpyYzhyTWdkUVhSSEFoZ3pjRUtXc0JRRjRRekZ3b1VR?=
 =?utf-8?B?QkRzc1Z2cXg0S09jWEo4UTJldEZmZHpIOUI0RlRPdHVSdDVucm9lTVhnd2cw?=
 =?utf-8?B?SFVPWUg5SVFJZE1iT1RHREVJMUk0VU15WkJCU0Y1eHVyVUtvUlU4SjBZdDBJ?=
 =?utf-8?B?OHpCNnQwcVh1ZFpVTVNXYVVTOXJFcGtUQVM1eEZzV2VzclhLTkprWXNhbFFI?=
 =?utf-8?B?dFRSUDF3ZldPT3VvUHJEcWdEMUNvOGdvM3dFOUI4dzdPRmR2TlpPQlFzdXJu?=
 =?utf-8?B?S2U1c1piUXZTUm1zRmliMFBEclVNNm9xVkt4QlN0N083RDlaZXlCVHZrUkRY?=
 =?utf-8?B?YXp5UmtFR1M3cU5aRStLTVI5Y0phOXZuZVlvaW9DblhZdHlpenNkWXdUSUVv?=
 =?utf-8?B?WlhFV1QvbGJ0OTZPMGZsMktkdWgwUitVWUhzSFUvSXFRQ0tubE5SVkM5Zys5?=
 =?utf-8?B?V2s0SzJRT1VpTUFWRjdzMnROL2lpbkJTOExQZHNaWjNQWTRZK2dzOERQUzY4?=
 =?utf-8?B?NGoyN0cwOGs5QnpRaFRsUjE2eEZ3YmdvM1BDeE9WQ0FnQlM0N1ZOWnREUVYy?=
 =?utf-8?B?b2ovWExrNWFkLytQOTJkcHdYb2hUY1hGTFhzeXRJSHMzN3JVYkJDOUxGcXFJ?=
 =?utf-8?B?dXJTRnFuY24zSURObGVtZDVXRm1JdEZNeDhTSkJnb1hMWStGQWZ5QVgxcjJ1?=
 =?utf-8?B?M093d2Q5bEV6QlNzN3prUDFIMGw4WVJjT1BFQlA2UTRJSU13KzU3ZTc3bVVY?=
 =?utf-8?B?MDdseUpGeXl5cXlPTS8yTkRFWUJRRVkvVmVSVVZwdVNiblJyK2ZBTDEzM3Z0?=
 =?utf-8?B?K2JDNTcvaWZJaVZsSyt2N1NJZ0JKR3JqSCtqT1FDNGsvMmwzcU9GSy9JaHhR?=
 =?utf-8?B?bWdsc0hSSGxrOGc1dENIUT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(376005)(366007)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dXZMT3krL2N4SGpuVnkvZHp3RlpJRVJvSjF4aUlrVWgrWGVqWThGc29IMzZx?=
 =?utf-8?B?TXpEVk4wd2JYalhxMW5KSHUvYlBFNFNZd3FwZTZPUHBmU29hWW9GM1Bha2FR?=
 =?utf-8?B?TkFNNjZGU1h5dnVmVUpaSnFvVld3eVBkZmVDMmJmaDYxeHI1L002SExBdkRH?=
 =?utf-8?B?Z3NhdXZWekZKSjhRcUk0M0FYc2ZkODM2MjhSM3pQcUtEVVlMdWpCQjBGN25Z?=
 =?utf-8?B?WEhFTTNxVWNzenA4d1NZVTN0b01JME5rOGE1Q1U1WVFtb29MY1VEVmxqdWUx?=
 =?utf-8?B?WnZDekVMTjhUbG91Z1FobGdsMlFJS1YxTXJZZWkvYXRPM1dEV2hid2duZmtx?=
 =?utf-8?B?UEs1UWtaQTZaaE9YekFURm5yZ0dkYVhoTzZCRzdJTlBTTEhLemh2SW9PSkQz?=
 =?utf-8?B?VmhNVkg2aWEreDZjQ1Z1cDd6eW1DTmZSdWF2a3RKekJ3WDNhVDJhMENaTlBB?=
 =?utf-8?B?cXhTT3ltZVB0eGNPS3B4QllYY3g5aGYzR0dEb1VsUkVCaWJGTm5MZkZCQmJU?=
 =?utf-8?B?dzZCV1VyL0tONXM2aVp2U0FNSFl4Q01jU2NXbkNqZWhqd0NhUjk2c00vK2FO?=
 =?utf-8?B?cVIwZWdZMVl0RjQ3bGVVbGYvSTRKNndoMGJsRlFPZ1plaUhuOTBqQ2lrN29p?=
 =?utf-8?B?dEFMNXNBdnVoRUVBL1dBcGJDLzZIbHJvOFRJZWY5TC9NR1kxWU5wc1ExQ1J4?=
 =?utf-8?B?dkZyVDk2RGNUeVhETEFPemVFeWRvK2ZUblUrdE9ZMjVwNEovY3YzZFErcXJK?=
 =?utf-8?B?UHMwbnY0RzlyRTAvajU0ZDl6TkJCeEpmUWhZaDZFMFlYTFZkQ0NHT0tKbDlv?=
 =?utf-8?B?Z05Jc2JSbndwS1ZTdU1ZOGtxNXk3VjBoODZ0WVI4bzBXNW9hTktDQitJb055?=
 =?utf-8?B?RTlkb3QwVFh4ODBza1RsSVpGcklxWmFxZ3d5MWFPb08zMHBkdmlqWFdudEU1?=
 =?utf-8?B?QmI5bUVCWEMxMFZOU0JqNW90TDlOb0xlOERNdnNFS1RFUFBwM0ZiYlIrNW94?=
 =?utf-8?B?Nlp2Y1FQaGlGQUZEOG5IZzgrNDNqVkVQeFFoYWM1ZWJocm0wbld0d0wveDh0?=
 =?utf-8?B?VFBISTgwaGFURkN0VXhpNi9GdVhDaDcyVHl3dHFFVnFnVEZ1TndTc3NiY2pX?=
 =?utf-8?B?aU8zOFJxOGFPWjVPRVFDcTVZZ2dsUjRpdDRXUlRUR0NNNXFJaHg1czF4MEg3?=
 =?utf-8?B?aFFlVkpTdzl4SnU5TWpmUnowYnVLWHRsMjkvWTh0YWdxTGNTLzlmZkRxNEpT?=
 =?utf-8?B?WlNBTFE3cTJmRTNwRmxyMksxdWpXTjdlcy91ZUozbzArWmpGTnZqdWVBUk5Y?=
 =?utf-8?B?Um84WmNQQ3FudEw2Mkh6OWFoby92VmJ6MjZ0TDgxK0tqVlVjdjI3Z3VhaUJu?=
 =?utf-8?B?UjdPb3RoU3VjTVRIYVhZSjFNWmtqb1RyN05vR3loRjhhSldCUnV2YUg5cmlk?=
 =?utf-8?B?WDFRdmFTdFFoenVqeDZTN3p3OU0xZDU3RlJ2OXhCVFJRRmFxbkZ1cXUxQ3lB?=
 =?utf-8?B?Mk0xdzJsa1hGYkRaNXZPN3IwVkF5NkpCc3RYV0E2OG5NYjBMeTRuYlkvSyt3?=
 =?utf-8?B?L1JBVlo4SkhOcGd0UnF2TW5RNVNtWkY2elFka3plV0t3VldvUk54SThqUlRL?=
 =?utf-8?B?S1hGb0NMUFhxY2NrOWRlQjVkeWtKeHFOOURoN1ovcHQzTXRIaVpwZnJZOFZX?=
 =?utf-8?B?QnNjRkJBaGxTOE9FUXpDK1lLOHhWa21rVjVCb0FnR2U2R2U2eFZKTU5nMDlP?=
 =?utf-8?B?V1dkZC9EVDEyeXZGcGt0SmNRMXBFZUEvdUpMTUM0cFNPUFdwbHNSZG1wclpT?=
 =?utf-8?B?NE1GQUg4Q05IWk9xbnR4d1ZyTWY1aVRaOUw5eXdFR1Vyaml1cFBXUk10K3l6?=
 =?utf-8?B?M1lsSDZ3TDFQbE1VQWJPam5aNEVrN0tlbDV0Z1lQQW95YTNGMW5zbDRwbjl3?=
 =?utf-8?B?UGhYMmNLMlJHMG1Ic212YlRzR005YmRpWmVwbHNhMnFYZlI2eEdsOUZGd1Va?=
 =?utf-8?B?czFRL0d5ZG1UNi8yZkYyVk5vckgxWjcwYXRBVDBOUUc1SEc5YjJscXBDS3Rn?=
 =?utf-8?B?NlhETXpjVU9yUU5XaXlLUFlkb3p1dXJ6QXlFWGI1ZURJbk04Y0JoazBtZzdw?=
 =?utf-8?Q?w+pEukdhrZTFxuxm/aNJNNTor?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <6EAE2003C039A645B09F122FEBF6B238@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af090c6-2e97-4a27-4d8e-08dc7a3a5a0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 May 2024 08:37:01.6796
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sLz84xPNQ4PEW/Q1zU5aNOAMyn3BFD8aujlvOs2K2nhms17qwEfuExRG/5UCWsSkN5lyMboRoQ+8aS23WnpsF0J9QSiaT5YuGHFPtNp/80g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PATP264MB4552
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

DQoNCkxlIDIxLzA1LzIwMjQgw6AgMTM6NTcsIE9zY2FyIFNhbHZhZG9yIGEgw6ljcml0wqA6DQo+
IE9uIE1vbiwgTWF5IDIwLCAyMDI0IGF0IDA0OjI0OjUxUE0gKzAwMDAsIENocmlzdG9waGUgTGVy
b3kgd3JvdGU6DQo+PiBJIGhhZCBhIHF1aWNrIGxvb2sgYXQgdGhhdCBkb2N1bWVudCBhbmQgaXQg
c2VlbXMgdG8gcHJvdmlkZSBhIGdvb2QNCj4+IHN1bW1hcnkgb2YgTU1VIGZlYXR1cmVzIGFuZCBw
cmluY2lwbGVzLiBIb3dldmVyIHRoZXJlIGFyZSBzb21lDQo+PiB0aGVvcml0aWNhbCBpbmZvcm1h
dGlvbiB3aGljaCBpcyBub3QgZnVsbHkgcmlnaHQgaW4gcHJhY3RpY2UuIEZvcg0KPj4gaW5zdGFu
Y2Ugd2hlbiB0aGV5IHNheSAiU2VnbWVudCBhdHRyaWJ1dGVzLiBUaGVzZSBmaWVsZHMgZGVmaW5l
DQo+PiBhdHRyaWJ1dGVzIGNvbW1vbiB0byBhbGwgcGFnZXMgaW4gdGhpcyBzZWdtZW50LiIuIFRo
aXMgaXMgcmlnaHQgaW4NCj4+IHRoZW9yeSBpZiB5b3UgY29uc2lkZXIgaXQgZnJvbSBMaW51eCBw
YWdlIHRhYmxlIHRvcG9sb2d5IHBvaW50IG9mIHZpZXcsDQo+PiBoZW5jZSB3aGF0IHRoZXkgY2Fs
bCBhIHNlZ21lbnQgaXMgYSBQTUQgZW50cnkgZm9yIExpbnV4LiBIb3dldmVyLCBpbg0KPj4gcHJh
Y3RpY2UgZWFjaCBwYWdlIGhhcyBpdHMgb3duIEwxIGFuZCBMMiBhdHRyaWJ1dGVzIGFuZCB0aGVy
ZSBpcyBub3QNCj4+IHJlcXVpcmVtZW50IGF0IEhXIGxldmVsIHRvIGhhdmUgYWxsIEwxIGF0dHJp
YnV0ZXMgb2YgYWxsIHBhZ2VzIG9mIGENCj4+IHNlZ21lbnQgdGhlIHNhbWUuDQo+IA0KPiBUaGFu
a3MgZm9yIHRha2luZyB0aGUgdGltZSBDaHJpc3RvcGhlLCBoaWdobHkgYXBwcmVjaWF0ZWQuDQo+
IA0KPiAgIA0KPj4gcmx3aW1pID0gUm90YXRlIExlZnQgV29yZCBJbW1lZGlhdGUgdGhlbiBNYXNr
IEluc2VydC4gSGVyZSBpdCByb3RhdGVzDQo+PiByMTAgYnkgMjMgYml0cyB0byB0aGUgbGVmdCAo
b3IgOSB0byB0aGUgcmlnaHQpIHRoZW4gbWFza3Mgd2l0aA0KPj4gX1BNRF9QQUdFXzUxMksgYW5k
IGluc2VydHMgaXQgaW50byByMTEuDQo+Pg0KPj4gSXQgbWVhbnMgX1BBR0VfSFVHRSBiaXQgaXMg
Y29waWVkIGludG8gbG93ZXIgYml0IG9mIFBTIGF0dHJpYnV0ZS4NCj4+DQo+PiBQUyB0YWtlcyB0
aGUgZm9sbG93aW5nIHZhbHVlczoNCj4+DQo+PiBQUyA9IDAwID09PiBTbWFsbCBwYWdlICg0ayBv
ciAxNmspDQo+PiBQUyA9IDAxID09PiA1MTJrIHBhZ2UNCj4+IFBTID0gMTAgPT0+IFVuZGVmaW5l
ZA0KPj4gUFMgPSAxMSA9PT4gOE0gcGFnZQ0KPiANCj4gSSBzZWUsIHRoYW5rcyBmb3IgdGhlIGV4
cGxhbmF0aW9uLg0KPiANCj4+IFRoYXQncyBhIFJGQywgYWxsIGlkZWFzIGFyZSB3ZWxjb21lLCBJ
IG5lZWRlZCBzb21ldGhpbmcgdG8gcmVwbGFjZQ0KPj4gaHVnZXBkX3BvcHVsYXRlKCkNCj4gDQo+
IFRoZSBvbmx5IHVzZXIgaW50ZXJlc3RlZCBpbiBwbWRfcG9wdWxhdGUoKSBoYXZpbmcgYSBzeiBw
YXJhbWV0ZXINCj4gaXMgOHh4IGJlY2F1c2UgaXQgd2lsbCB0b2dnbGUgX1BNRF9QQUdFXzhNIGlu
IGNhc2Ugb2YgYSA4TUIgbWFwcGluZy4NCj4gDQo+IFdvdWxkIGl0IGJlIHBvc3NpYmxlIGZvciA4
eHggdG8gZW5jb2RlIHRoZSAnc3onIGluIHRoZSAqcG1kIHBvaW50ZXINCj4gcHJpb3IgdG8gY2Fs
bGluZyBkb3duIHRoZSBjaGFpbj8gKHNvbWV0aGluZyBsaWtlIGFzIHdlIGRvIGZvciBQVFJfRVJS
KCkpLg0KPiBUaGVuIHBtZF9wb3B1bGF0ZV97a2VybmVsX31zaXplKCkgZnJvbSA4eHgsIHdvdWxk
IGV4dHJhY3QgaXQgbGlrZToNCj4gDQo+ICAgdW5zaWduZWQgbG9uZyBzeiA9IFBUUl9TSVpFKHBt
ZCkNCj4gDQo+IFRoZW4gd2Ugd291bGQgbm90IG5lZWQgYWxsIHRoZXNlICdzeicgcGFyYW1ldGVy
cyBzY2F0dGVyZWQuDQo+IA0KPiBDYW4gdGhhdCB3b3JrPw0KDQpJbmRlZWQgX1BNRF9QQUdFXzhN
IGNhbiBiZSBzZXQgaW4gc2V0X2h1Z2VfcHRlX2F0KCksIG5vIG5lZWQgdG8gZG8gaXQgDQphdG9t
aWNhbGx5IGFzIHBhcnQgb2YgcG1kX3BvcHVsYXRlLCBzbyBJJ2xsIGRyb3AgcGF0Y2hlcyAxIGFu
ZCAyLg0KDQo+IA0KPiANCj4gUEQ6IERvIHlvdSBrbm93IGEgd2F5IHRvIGVtdWxhdGUgYSA4eHgg
Vk0/IHFlbXUgc2VlbXMgdG8gbm90IGhhdmUNCj4gc3VwcG9ydCBzdXBwb3J0Lg0KPiANCg0KSSBk
b24ndCBrbm93IGFueSB3YXkuIFlvdSBhcmUgcmlnaHQgdGhhdCA4eHggaXMgbm90IHN1cHBvcnRl
ZCBieSBRRU1VIA0KdW5mb3J0dW5hdGVseS4gSSBkb24ndCBrbm93IGhvdyBkaWZmaWN1bHQgaXQg
d291bGQgYmUgdG8gYWRkIGl0IHRvIFFFTVUuDQoNCkNocmlzdG9waGUNCg==
