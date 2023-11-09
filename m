Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 849AE7E7070
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Nov 2023 18:39:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WvJJD1pZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SR8Mn3M6Rz3cfR
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Nov 2023 04:39:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=WvJJD1pZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e18::618; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-pr2fra01on20618.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e18::618])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SR8Ls1sWjz3c1C
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Nov 2023 04:38:28 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5d+9OEeiJQQUNJIwvFxLpLpRcGRaYxeH03p/XZbWeXb3eIZ+bx77DA5sEUbl2vHV0XS/V4g3oclo3iDBcpV8TiQZmF+VZq/3/0TI17UKSpLz8VUPoMOplPNOI8ADw3tHi9MCK2sTcKExaYLUhuUKUtzzqvGA0PuwZUL6NV7KJcC67nQau8in9a2uCHwv3TtCOFQbPPHI/yMu7PWM5NpCB1GrrMbwcD6+29VlBzZoIxv/vWztiZ0azqKGTf2UfddsIyjXOtubu9CSiKUuaSf/kvWKKLCbAK8DWyRjOxhn350f0h23e20cvieaCI65UQHBIA+V9Tt+Op3xq/HQ7+3Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O23jR1/FN84dAMHyX6cb+eqMI8iY89bNjqAs7/O5qBI=;
 b=jM19m8x5tPf4u8GgjRxfh2HaBQqriEP/xvsVn7rW1eOQatUlqy0msnDzdfB810dNN4gpznss3OxJv3VruVtiunzfQXYxRDJhB2oEDQZ8J4A4pK1H+7zA1swK+pnFhShiR8DwObFTILvg22CZ4ZZ1oiKPu00QP4cRdzQ1J91thVK1yB4q8fTOSN/dqr54CJ2CGsDu9EUpuvj9y6P/uev46dC2IIYfvuU65hVTymqBjKl7ShiHPnJhuHkocMjLksWXi0CNoWlcMInmj2r4i77ol7zXhSMZxPIBcHkvpyG3pXYEt9ZHUxT5maUiU1uGtIKW9TfJ2qN0OGn3Jl1vJ+Fl/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O23jR1/FN84dAMHyX6cb+eqMI8iY89bNjqAs7/O5qBI=;
 b=WvJJD1pZWFqtisrNuCgCHuyB7NFM9uD6o8QSRC6A3INmihvZovTYLb38NTU5FZQJscYPBlkO2bo3ae5PoM2iIF6w9wN+lOuXxe+rlRlybBReA90Ae9jXutbUwjKdWxPr99DyKB3k2aAkl+SPBpHWmrqOhWZ+0VyPO+COEuYTw+p5dEw09btoasNkESkr6LB3PbB0LCm3DW0+XTAGiH+mOgq+K1IJrq5Ib7w5qYg1bO2cn/Qd9K+R+i9Au5xc3SNmdnbzciObxfVdUWgC2+kZC/ST1XrOFyl0ksd8+fYTRfUxOh0ZU8E6QYXUG3zjrgek+pMSVFOEvlC8fWj5C4H3DA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB3210.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:1b::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.7; Thu, 9 Nov
 2023 17:38:03 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::5bfe:e2f2:6d89:8d97%3]) with mapi id 15.20.7002.007; Thu, 9 Nov 2023
 17:38:03 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>, Michael Ellerman
	<mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 37/37] powerpc: Support execute-only on all powerpc
Thread-Topic: [PATCH v2 37/37] powerpc: Support execute-only on all powerpc
Thread-Index: AQHZ796dDkzQ9RA0FEmhJpkipCuR2LBmvjGAgAbK0YCAARr5gIAD40CA
Date: Thu, 9 Nov 2023 17:38:02 +0000
Message-ID: <44a45e85-5c16-1a3a-ea09-37925ff61552@csgroup.eu>
References: <cover.1695659959.git.christophe.leroy@csgroup.eu>
 <4283ea9cbef9ff2fbee468904800e1962bc8fc18.1695659959.git.christophe.leroy@csgroup.eu>
 <874ji4af3a.fsf@linux.ibm.com>
 <efcfb376-5b43-4f35-e1d2-8cfce782ae3d@csgroup.eu>
 <eb3decba-f76c-476b-97fe-7fdc8c228514@linux.ibm.com>
In-Reply-To: <eb3decba-f76c-476b-97fe-7fdc8c228514@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB3210:EE_
x-ms-office365-filtering-correlation-id: b5d82509-8d0d-49e8-727b-08dbe14a9fe5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  tUidUoJs8/TUgRfOH0pFeuhO8mT6M/C6o15K76jG/Q5M4m5QulrmEIdNKZVm0uxzADLZ9bwGYtr/9NSuX2TI36Rt2qvRpRta79hXMS8IFKV/5+lMFi3RnjtUbf4LQaD8zCIcIXPdT5XrvBS/14+lsIUIjBWdWF7kQnfeeh5EsBZ/u8/+C/Bbe1lKT9rvSV6nwNnMT05wFcAc8WJguztTP4gON0Bty+shnjyi9wAILsXVAHsRgJQTUgenAt9tTjxilio7Du6pwtz4HjXVjwKpWqBKP1auUKaZ/Yjm/+Moezl08OaXKZoFDlo2ssck0sTbTDm3Ne3LHTjrPnsdh3SogeW2PGCDc8k0L105bNR5yugNtqU4qUnWrdNqgpZblRJuy5uACYNslK98NzDCoF9ASPEMCUBBjQ/Jmn0lfh24o6zCCzWD3vWOboLe8S3WE9IRSLRrU7nJhFELWq07tW7CTB8BNaJxce8zFMZSUwrwKVRwuYgX4tZpx2syIGh49rryPcnEthoWo9XQ8JkJ0iAeQiyrAbkOZvF5viEZFT9By0K1w7wIujUPSp4tqntRyLPPP6fyWWo+6EvVQ7n9PwTS80SydGaW9EmVDrWdhEQ0IItP0oeM9dC4MxMq+PjakosKQR/fzWL+hbofBiIk8O0in3ojhYb7ThsH6eErAYw7swk=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(136003)(39860400002)(346002)(376002)(366004)(396003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(31686004)(478600001)(966005)(6486002)(2616005)(71200400001)(53546011)(6506007)(6512007)(36756003)(38100700002)(122000001)(31696002)(86362001)(54906003)(66556008)(5660300002)(41300700001)(91956017)(66446008)(76116006)(66476007)(316002)(44832011)(64756008)(110136005)(83380400001)(26005)(66574015)(2906002)(38070700009)(66946007)(4326008)(8676002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YitBTzlpWXRpTE5zb3E3VkdrR3pRM2hKUVBFMGdocHJwUTUvaisrYkhvQ2Q0?=
 =?utf-8?B?L0h1M1prSzF0RFM5RUUraVczcGpwU1liN2hyeXU4UTFqZFhOT0pmN0tHUFEv?=
 =?utf-8?B?TUQ4b0ZFY3FGcjlYOWdURUdQZDB2ZUUwdUZFa3FrdE12VlQvemdtTTNTRWhP?=
 =?utf-8?B?NC9iYlk4TzdiamdHZytHTXdNc0FXSDdqRkhuTDZwT0h5Ty9hZ2F5UG44NVU2?=
 =?utf-8?B?ejZFRjlEcm1yVTFraVcyWWdBMWxRaE9RSVYvWkkzeXpKeWxJbWxxSXVhSDNV?=
 =?utf-8?B?U3NaR1FiRG5qdUprdXdVQXpSNDUzSHVvUFVoNEpBa0E4RHNwRE05TmNmaEZF?=
 =?utf-8?B?THJmcHZlSlpPeE9vYXhXb1hjcTVRSGdZYytlbW5WQmhzQnBWVDlLaWpnVUJG?=
 =?utf-8?B?enZ2Y3NLRmNDdUxQdW03WjJFcTlobnB0T0NlVUpPbFpVNDRrZllOVE9Cd05Q?=
 =?utf-8?B?N2xXak9zaVltTXJYaE9XZ0cxaU1iVm5yZlUxbUFqQmMzVTJJa0FtVytVSjJ0?=
 =?utf-8?B?UXR0dDFmOEpyTXRDT00yOFJySVpLMmE0RklhT1NUOWhEdzFuNkYySTF0Y01v?=
 =?utf-8?B?MGQvbFV1WXF0NTc1L0tCS3pNeEJreGFUMnk2ZUE2aFFBeEZBRFFsR0g0dm5D?=
 =?utf-8?B?bW9LSjh3b24yZEhiVGFEblBLY1NwY09ubUNYUmpNbnN4UXdLcytNMmRzMjZh?=
 =?utf-8?B?SUNzajIxOURGdHlGalhZMkFFZU1wRVNpeTFad0ZEbFl5TWlvOHBrTDltQ3ND?=
 =?utf-8?B?YVRlQlFmWCtHb2ZyOUtHKzNtU0lLcXZIWTFValJ1NWNhT0pjRXVnU2hGSmd6?=
 =?utf-8?B?bEhNWlBmV0RUZEFyODJmSlJ1dUdVVzVqNlBlRXByZmZhUWpvbjJYdmN6MlZI?=
 =?utf-8?B?b0IyS0tMMTA5K1VLN05OenAzajB2QmFCZFRNWGFOdUxWNkx4SFZqS3U4VDJu?=
 =?utf-8?B?dks2c2VRc3dKUXBIODdEMWN3RGs1Sk83cmF5VWFFTTM5bzVFalhKTzlMOG0r?=
 =?utf-8?B?T1ZqYlNqZXlQcVkrSit4Q1VUS1dqWXVhNnRQckUxalM5QldaNkFvMUtXOGph?=
 =?utf-8?B?MHk5eGVETW1ucEkvVkxad3lGTjVmRmZCNDBsSGxwNHd2ZVkzelNTeS9ic3JG?=
 =?utf-8?B?d1JsK1lVSE1BNVk5RVk5K0pKcGhPQmdFcE8yRC9VVmhHdDkreG9DSTFYWGJU?=
 =?utf-8?B?U1dwQUxBbVR4a1BwM2lGeFFSSk9xMXplUGVoQ25HWk9qaGZpS1BXdm83a0xR?=
 =?utf-8?B?Qml1UDdaeDR0UkZSd3dTbmJLdm1iaGNFTUtPYjlKNjkxYVFDUkJoTkxEY0lV?=
 =?utf-8?B?a3l0bzl3eEQxaHlaQ1puQnhYRkpOOHI1Qm5jTjZMbTgreEQyR3hrNktBUWtY?=
 =?utf-8?B?QjE5eFR3aFJGOGJFZE1OYUJoQkdOaU1CTGQrMUNzNWFMTFNER2RxR1VYV0xY?=
 =?utf-8?B?RlNNaUtrM3FISVlMNXpUZUlrTVdNckxqaWQ4YU5DNWdzZytUVkw3TWpvaHFq?=
 =?utf-8?B?NE5NY2dUWHlGUG1RMDFzeEdIcUJlMUNqRE95SVg4U1BheE9Md3BhNE1ncHMr?=
 =?utf-8?B?ZjBqQWRCUTVBMkpOMVRXT2VBQnRFK0NHWE00aDRYcXZscWZ6SmJEdlQySmZi?=
 =?utf-8?B?OGo1czlFSHRGNlMwbEtTQTdVVk5aYmZ5Q1BuS3FiMUNtV1dGbXMzKzV2VnVG?=
 =?utf-8?B?YXVzUFFzMVMxL0tCakZoZEFpTnNUZ0NIL3FnS3pPWTBRR3RGRjA5cGVCL2N0?=
 =?utf-8?B?US8rbEt4SC9PMVBrQy96eERjTWUxeWxFM2RlZzRBN0xKNXRMSzg1bkpKelB5?=
 =?utf-8?B?YitWZWdraXJsNzIvMUNJT0pzbWJMcnJjVUl0SU5yNENydXJ4eVNwMnduVnlT?=
 =?utf-8?B?YkdsdUsrVmo1VFcxcElmUTZ2L2FhWGJoaytiRDE5ZjhMN05vV0ZMUkVXNFpL?=
 =?utf-8?B?a2RYWWc2U2dMUURGaWtZdnVpNUZTUUhSaHNwS2VlUnE3Sk5DZmJOMmFWMXFS?=
 =?utf-8?B?bXk5ajNVMXZVZndLUjZFZzY4eFRIU3gwb3pRWm5EVGJnZXU2ZmxSTFpOdHY5?=
 =?utf-8?B?M3VsUEx1bXZ2Tkl4cmUrV0h3d2tGcU85NHNHT2xGc3h3aTVtbkZUdjdsb0dx?=
 =?utf-8?B?YStqR3lYalpGQ3NCVUdGOTFNNEZkV1p3aElSYWJMbDBDNHoyZnl4K2F5V3VX?=
 =?utf-8?B?Qnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F0ACA15EE795774CBC7AFF760653896C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b5d82509-8d0d-49e8-727b-08dbe14a9fe5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Nov 2023 17:38:02.8921
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UED05HmmJ3Fpt679VKCCHEaWEzrLPr3s625pC9Ljntf4+LRSvTEoLNyUxnQvfE4O7tdsXz/i1R4etasbm0q9ULbO6Cs+i81AuOtHcr2jN7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB3210
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
Cc: Kees Cook <keescook@chromium.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, Russell Currey <ruscur@russell.cc>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA3LzExLzIwMjMgw6AgMDc6MTUsIEFuZWVzaCBLdW1hciBLIFYgYSDDqWNyaXTCoDoN
Cj4gT24gMTEvNi8yMyA2OjUzIFBNLCBDaHJpc3RvcGhlIExlcm95IHdyb3RlOg0KPj4NCj4+DQo+
PiBMZSAwMi8xMS8yMDIzIMOgIDA2OjM5LCBBbmVlc2ggS3VtYXIgSy5WIGEgw6ljcml0wqA6DQo+
Pj4gQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cml0ZXM6
DQo+Pj4NCj4+Pj4gSW50cm9kdWNlIFBBR0VfRVhFQ09OTFlfWCBtYWNybyB3aGljaCBwcm92aWRl
cyBleGVjLW9ubHkgcmlnaHRzLg0KPj4+PiBUaGUgX1ggbWF5IGJlIHNlZW4gYXMgcmVkdW5kYW50
IHdpdGggdGhlIEVYRUNPTkxZIGJ1dCBpdCBoZWxwcw0KPj4+PiBrZWVwIGNvbnNpc3RhbmN5LCBh
bGwgbWFjcm9zIGhhdmluZyB0aGUgRVhFQyByaWdodCBoYXZlIF9YLg0KPj4+Pg0KPj4+PiBBbmQg
cHV0IGl0IG5leHQgdG8gUEFHRV9OT05FIGFzIFBBR0VfRVhFQ09OTFlfWCBpcw0KPj4+PiBzb21l
aG93IFBBR0VfTk9ORSArIEVYRUMganVzdCBsaWtlIGFsbCBvdGhlciBTT01FVEhJTkdfWCBhcmUN
Cj4+Pj4ganVzdCBTT01FVEhJTkcgKyBFWEVDLg0KPj4+Pg0KPj4+PiBPbiBib29rM3MvNjQgUEFH
RV9FWEVDT05MWSBiZWNvbWVzIFBBR0VfUkVBRE9OTFlfWC4NCj4+Pj4NCj4+Pj4gT24gYm9vazNz
LzY0LCBhcyBQQUdFX0VYRUNPTkxZIGlzIG9ubHkgdmFsaWQgZm9yIFJhZGl4IGFkZA0KPj4+PiBW
TV9SRUFEIGZsYWcgaW4gdm1fZ2V0X3BhZ2VfcHJvdCgpIGZvciBub24tUmFkaXguDQo+Pj4+DQo+
Pj4+IEFuZCB1cGRhdGUgYWNjZXNzX2Vycm9yKCkgc28gdGhhdCBhIG5vbiBleGVjIGZhdWx0IG9u
IGEgVk1fRVhFQyBvbmx5DQo+Pj4+IG1hcHBpbmcgaXMgYWx3YXlzIGludmFsaWQsIGV2ZW4gd2hl
biB0aGUgdW5kZXJseWluZyBsYXllciBkb24ndA0KPj4+PiBhbHdheXMgZ2VuZXJhdGUgYSBmYXVs
dCBmb3IgdGhhdC4NCj4+Pj4NCj4+Pj4gRm9yIDh4eCwgc2V0IFBBR0VfRVhFQ09OTFlfWCBhcyBf
UEFHRV9OQSB8IF9QQUdFX0VYRUMuDQo+Pj4+IEZvciBvdGhlcnMsIG9ubHkgc2V0IGl0IGFzIGp1
c3QgX1BBR0VfRVhFQw0KPj4+Pg0KPj4+PiBXaXRoIHRoYXQgY2hhbmdlLCA4eHgsIGU1MDAgYW5k
IDQ0eCBmdWxseSBob25vciBleGVjdXRlLW9ubHkNCj4+Pj4gcHJvdGVjdGlvbi4NCj4+Pj4NCj4+
Pj4gT24gNDB4IHRoYXQgaXMgYSBwYXJ0aWFsIGltcGxlbWVudGF0aW9uIG9mIGV4ZWN1dGUtb25s
eS4gVGhlDQo+Pj4+IGltcGxlbWVudGF0aW9uIHdvbid0IGJlIGNvbXBsZXRlIGJlY2F1c2Ugb25j
ZSBhIFRMQiBoYXMgYmVlbiBsb2FkZWQNCj4+Pj4gdmlhIHRoZSBJbnN0cnVjdGlvbiBUTEIgbWlz
cyBoYW5kbGVyLCBpdCB3aWxsIGJlIHBvc3NpYmxlIHRvIHJlYWQNCj4+Pj4gdGhlIHBhZ2UuIEJ1
dCBhdCBsZWFzdCBpdCBjYW4ndCBiZSByZWFkIHVubGVzcyBpdCBpcyBleGVjdXRlZCBmaXJzdC4N
Cj4+Pj4NCj4+Pj4gT24gNjAzIE1NVSwgVExCIG1pc3NlZCBhcmUgaGFuZGxlZCBieSBTVyBhbmQg
dGhlcmUgYXJlIHNlcGFyYXRlDQo+Pj4+IERUTEIgYW5kIElUTEIuIEV4ZWN1dGUtb25seSBpcyB0
aGVyZWZvcmUgbm93IHN1cHBvcnRlZCBieSBub3QgbG9hZGluZw0KPj4+PiBEVExCIHdoZW4gcmVh
ZCBhY2Nlc3MgaXMgbm90IHBlcm1pdHRlZC4NCj4+Pj4NCj4+Pj4gT24gaGFzaCAoNjA0KSBNTVUg
aXQgaXMgbW9yZSB0cmlja3kgYmVjYXVzZSBoYXNoIHRhYmxlIGlzIGNvbW1vbiB0bw0KPj4+PiBs
b2FkL3N0b3JlIGFuZCBleGVjdXRlLiBOZXZlcnRoZWxlc3MgaXQgaXMgc3RpbGwgcG9zc2libGUg
dG8gY2hlY2sNCj4+Pj4gd2hldGhlciBfUEFHRV9SRUFEIGlzIHNldCBiZWZvcmUgbG9hZGluZyBo
YXNoIHRhYmxlIGZvciBhIGxvYWQvc3RvcmUNCj4+Pj4gYWNjZXNzLiBBdCBsZWFzdCBpdCBjYW4n
dCBiZSByZWFkIHVubGVzcyBpdCBpcyBleGVjdXRlZCBmaXJzdC4NCj4+Pj4NCj4+Pj4gU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0K
Pj4+PiBDYzogUnVzc2VsbCBDdXJyZXkgPHJ1c2N1ckBydXNzZWxsLmNjPg0KPj4+PiBDYzogS2Vl
cyBDb29rIDxrZWVzY29va0BjaHJvbWl1bS5vcmc+DQo+Pj4+IC0tLQ0KPj4+PiAgICBhcmNoL3Bv
d2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaCB8ICAyICstDQo+Pj4+ICAgIGFy
Y2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvNjQvcGd0YWJsZS5oIHwgIDQgKy0tLQ0KPj4+
PiAgICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoLzMyL3B0ZS04eHguaCB8ICAxICsN
Cj4+Pj4gICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL25vaGFzaC9wZ3RhYmxlLmggICAgfCAg
MiArLQ0KPj4+PiAgICBhcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vbm9oYXNoL3B0ZS1lNTAwLmgg
ICB8ICAxICsNCj4+Pj4gICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BndGFibGUtbWFza3Mu
aCAgICAgfCAgMiArKw0KPj4+PiAgICBhcmNoL3Bvd2VycGMvbW0vYm9vazNzNjQvcGd0YWJsZS5j
ICAgICAgICAgICB8IDEwICsrKystLS0tLS0NCj4+Pj4gICAgYXJjaC9wb3dlcnBjL21tL2ZhdWx0
LmMgICAgICAgICAgICAgICAgICAgICAgfCAgOSArKysrKy0tLS0NCj4+Pj4gICAgYXJjaC9wb3dl
cnBjL21tL3BndGFibGUuYyAgICAgICAgICAgICAgICAgICAgfCAgNCArKy0tDQo+Pj4+ICAgIDkg
ZmlsZXMgY2hhbmdlZCwgMTggaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pDQo+Pj4+DQo+
Pj4+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFi
bGUuaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9ib29rM3MvMzIvcGd0YWJsZS5oDQo+Pj4+
IGluZGV4IDI0NDYyMWM4ODUxMC4uNTI5NzFlZTMwNzE3IDEwMDY0NA0KPj4+PiAtLS0gYS9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaA0KPj4+PiArKysgYi9hcmNo
L3Bvd2VycGMvaW5jbHVkZS9hc20vYm9vazNzLzMyL3BndGFibGUuaA0KPj4+PiBAQCAtNDI1LDcg
KzQyNSw3IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBwdGVfYWNjZXNzX3Blcm1pdHRlZChwdGVfdCBw
dGUsIGJvb2wgd3JpdGUpDQo+Pj4+ICAgIHsNCj4+Pj4gICAgCS8qDQo+Pj4+ICAgIAkgKiBBIHJl
YWQtb25seSBhY2Nlc3MgaXMgY29udHJvbGxlZCBieSBfUEFHRV9SRUFEIGJpdC4NCj4+Pj4gLQkg
KiBXZSBoYXZlIF9QQUdFX1JFQUQgc2V0IGZvciBXUklURSBhbmQgRVhFQ1VURQ0KPj4+PiArCSAq
IFdlIGhhdmUgX1BBR0VfUkVBRCBzZXQgZm9yIFdSSVRFDQo+Pj4+ICAgIAkgKi8NCj4+Pj4gICAg
CWlmICghcHRlX3ByZXNlbnQocHRlKSB8fCAhcHRlX3JlYWQocHRlKSkNCj4+Pj4gICAgCQlyZXR1
cm4gZmFsc2U7DQo+Pj4+DQo+Pj4NCj4+PiBTaG91bGQgdGhpcyBub3cgYmUgdXBkYXRlZCB0byBj
aGVjayBmb3IgRVhFQyBiaXQgPw0KPj4NCj4+IEkgZG9uJ3QgdGhpbmsgc28gYmFzZWQgb24gd2hh
dCBJIHNlZSBpbiBhcm02NDoNCj4+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2
LjYvc291cmNlL2FyY2gvYXJtNjQvaW5jbHVkZS9hc20vcGd0YWJsZS5oI0wxNDYNCj4+DQo+IA0K
PiBCdXQgdGhlbiB0aGVyZSBjYW4gYmUgYSBnZXRfdXNlcl9wYWdlcygpIChGT0xMX0dFVCkgb24g
YW4gZXhlYyBvbmx5IHB0ZSByaWdodD8NCj4gaWYgd2UgYXJlIGdvaW5nIHRvIGFjY2VzcyB0aGUg
cGFnZSBkYXRhKEZPTExfUElOKSwgdGhlbiB5ZXMgZXhlYyBvbmx5IG1hcHBpbmcgc2hvdWxkDQo+
IGZhaWwgZm9yIHRoYXQuIEJ1dCBpZiB3ZSB1c2luZyBpdCB0byBkbyBzdHJ1Y3QgcGFnZSBtYW5p
cHVsYXRpb24gd2UgbmVlZCBwdGVfYWNjZXNzX3Blcm1pdHRlZA0KPiB0byByZXR1cm4gdHJ1ZSBm
b3IgZXhlYyBvbmx5IG1hcHBpbmc/DQo+IA0KDQpJIGRvbid0IGtub3cgZW5vdWdoIHRoZSBkZXRh
aWxzIG9mIEdVUCB0byB1bmRlcnN0YW5kIHdoYXQgeW91IG1lYW4uIEkgDQp1bmRlcnN0YW5kIHlv
dSB0aGluayB0aGVyZSBpcyBhIHByb2JsZW0sIGRvIHlvdSBtZWFuIEFSTTY0IGRpZCBpdCB3cm9u
ZyA/DQoNClRoZSBjb3JlIG1tIG9ubHkgaGFzIHR3byBjYWxsIHNpdGVzIGZvciBwdGVfYWNjZXNz
X3Blcm1pdHRlZCgpIHdoaWNoIGFyZSANCmd1cF9wdGVfcmFuZ2UoKSBhbmQgZ3VwX2h1Z2VwdGUo
KS4gcHRlX2FjY2Vzc19wZXJtaXR0ZWQoKSBpcyBub3QgDQpkb2N1bWVudGVkIGluIERvY3VtZW50
YXRpb24vbW0vYXJjaF9wZ3RhYmxlX2hlbHBlcnMucnN0DQoNClNvLCB3aGF0IGRvIHRob3NlIHR3
byBjYWxsZXJzIGV4cGVjdCA/DQoNCkNocmlzdG9waGUNCg==
