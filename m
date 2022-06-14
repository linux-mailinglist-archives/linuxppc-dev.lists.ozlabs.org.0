Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CA3954AA54
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 09:19:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMfvq45mDz3bqS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jun 2022 17:19:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=EP07bP1d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f400:7e19::617; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=EP07bP1d;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-mr2fra01on0617.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e19::617])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LMfv11X7lz306d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jun 2022 17:19:08 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WE31B9IDbvDGIp++BRh5teKkhHmf9GKVoiiJ5dQTZalCq2ympQjeC9Cc168fE1JRpORJ93l0tM6+Qnz/zyuDPir+kfgJbcFwrVxt8fKINrXIN4QB+IsV51cj44+At5vCWl2w0OVp6z0GK+S7RIT23eGIXsLh3Jyhy6USz6htyJhFFXkxTFe+vl1uhP2mpuSAzaQuAghz6ioGSVF7oRUxqLA2FuacGq1+3I+I3o97K439GZamEZOHVnQZeh4OPDbiaZMif19LEE8Sy8NRVr6ssd+ZT1G2k5bmhe8o5iCle8WVQB94BYtv/M6TMJLGPVcC1TCyfnF5qLSG1VBd5USWdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=taIU5STaP7gEf/i2WBwPVfOTdhulfaM3sk6lQ1BzxvI=;
 b=WSVjpbGhiYwXCGgacznEWx5CtovIOfD6blQfvl8sR5tHew59DFqZvsVI69GQmOHB4LHpdmIg/mYugyeeziMZyxZGLML0A1VR7x9qH+1XPM/UmGGGOe0I13xOLZFAm0KB5w/0efRtYOkPMFqhU/EwG2cNsr9evJNXrqi11PMBppZ2c1Qni5NQ5oO0HZFNW0p/jIhzkb9bXZ7XPkS8jgA7tU8zzKDqhsQVBB12IAkMS59j9kK6hyc2yeJ2QryoIX6FQDqlaPFRB8ZV99kY3hNv5O+dSG9rPfiWfKeBAVCVFSTWHuT5zvOFXfBP7H5s10mUkFaluxbAyG1B7l8zD0/8yw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=taIU5STaP7gEf/i2WBwPVfOTdhulfaM3sk6lQ1BzxvI=;
 b=EP07bP1dgW7GrFjO/EOF6bPGhOvTTJeeUSf/u4GkY1fhviBXPIWaBY6B8DsUsngAwDEbr2506NVrnn+6ize5pfO59cZ9tKxJJ4uYXoBMxsbgQmra9Q1OHV1ugDgqnDALYPpe2fGRhAR+iP+AOP7Nwff8GmFHCmTVXqOyjgNCS3hkIaQu+uYzBCzu2IEBbZpidVxgm18jb2uoncGLhwfx3BgAwETB213KyvMHkCwwa+Ba+V1swrrjieJM1/F2EUgrSmDpVWoukdkdDHdwy1CQzG2ritB3RLOciFYA/9ovGRiju9qGsJRhaLouzhzq2wNoiTzOQqfteuOpoF1H8nMFtQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR1P264MB1581.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5332.13; Tue, 14 Jun
 2022 07:18:48 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::b15e:862f:adf7:5356%6]) with mapi id 15.20.5332.022; Tue, 14 Jun 2022
 07:18:48 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Wenhu Wang <wenhu.wang@hotmail.com>, Greg KH <gregkh@linuxfoundation.org>
Subject:  =?utf-8?B?UmU6IOWbnuWkjTogW1BBVENIIDIvMl0gdWlvOnBvd2VycGM6bXBjODV4eDog?=
 =?utf-8?Q?l2-cache-sram_uio_driver_implementation?=
Thread-Topic:  =?utf-8?B?5Zue5aSNOiBbUEFUQ0ggMi8yXSB1aW86cG93ZXJwYzptcGM4NXh4OiBsMi1j?=
 =?utf-8?Q?ache-sram_uio_driver_implementation?=
Thread-Index: AQHYe+v2lxuFI4e/SkKc+NMp8W40uq1HDpsAgAdkMYCAABNVgA==
Date: Tue, 14 Jun 2022 07:18:48 +0000
Message-ID: <efebcb50-0481-622a-894c-7000999aacc6@csgroup.eu>
References: <20220609102855.272270-1-wenhu.wang@hotmail.com>
 <SG2PR01MB295139AA7360917B2C4846E19FA79@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
 <YqHy1uXwCLlJmftr@kroah.com>
 <SG2PR01MB2951EA9ED70E5F766DD26A069FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
In-Reply-To:  <SG2PR01MB2951EA9ED70E5F766DD26A069FAA9@SG2PR01MB2951.apcprd01.prod.exchangelabs.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 143c43a0-ca82-477b-b7b1-08da4dd62071
x-ms-traffictypediagnostic: PR1P264MB1581:EE_
x-microsoft-antispam-prvs:  <PR1P264MB1581154B4BEAD31B43FAA4A3EDAA9@PR1P264MB1581.FRAP264.PROD.OUTLOOK.COM>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  JQldVN8d2v/i8cqMN0p/NXnPATizQwdsVWMpDMBljCNVVntYZz3bz65hMRdJ0MXBNeml/1MqQny8QNoCQNI4QCeIlyAajWrSIjVFfhCGZGI4CS52PnxvFZl8VwwmNo0es7rpW0KPLly4nQkQfKyxWAvDS12ls4JSyb76q22+Tbb52UZnS4S0QzZD1s9vuXX525omO+3Mu+1vK8mWLCS8dUi6npsRci9Q2a/jQjLjpaOKIJCzwkgyVKOCtNiYa0GjabrNDLGVne1P7omBObEZL8kMsTnM1OvWPt4nyQ/CqtBK4+Izx6kU0sQBTAvsSjlLjAJZ7xsgBPFe1GT4lP7m9zHL1R3He/PY6djG4McJ2YGr2/7bI1OQdz6PDDJu/R1bzQ8gPehlQlRxbl3h6gXHKrJTIJy0IhLdKzvuwZ4KcmTfViqfO7LwmohdGo34qQlIStynukQ/eLwN5QiQDmKoCpoxYWBu4RlF+F1dA4cQ/CdXQYIeTKrIesKG3+zaYW67w0RDtP2fY6eP1/wE7tMJIzFoR+YxFe9EuXYQNZfMA8D3+3jbo0o/VOqky3l2j8gGU+69dDFkNrEFfayAieaEjgRgy//U3wG/HMwEfqzy1S1HzQJvXzFDlxflO8l9kquf0lH8rqT0IKCP5EmhyNKby4p6RpaFvzvhHjdF0z8Vdj3X8fu/vXLAWk60674sdRfpNt6z8FU3LZ3lpvpbNe1lrAuF8sbHf7Hm/f57CofsYBBE0YP8uU+nVrlaO7SPnvBOEs0LwehrfxBOuqml7DghrXOZRavFO9CrToQhCjatv/zEO0u64+H9GZcXc01+R6dKNyFiSDJhoUSnyc9uGye1TEuARlNiv3CF6te1Jpf0JWM=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(6506007)(966005)(44832011)(2616005)(186003)(26005)(71200400001)(6512007)(6486002)(508600001)(36756003)(31686004)(54906003)(110136005)(83380400001)(316002)(66574015)(8936002)(66946007)(224303003)(76116006)(66476007)(91956017)(122000001)(38070700005)(2906002)(4326008)(64756008)(38100700002)(66556008)(66446008)(4744005)(31696002)(86362001)(5660300002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?bnJtd2xNZHZrSW9QUkNBOUMzTlBrbTlRNUFNQklCQnFDR09EMHgvN0NTdFlk?=
 =?utf-8?B?T0IyM3dGbGc5Wm8xY0xJQkdyV2drUVE4c05GS1pEcDBUQ2JqYlJjeWQvbjdB?=
 =?utf-8?B?TTJSZGcwbm5NVGlwWFkzMStTTEtWUllPYmVIR1NTMzI2MC9QZ3d2WnlEZlMw?=
 =?utf-8?B?RzR6aDc4UmJobDFHTUZ2V1Q0UUZtUmd5c1dJd09XSzhYWGVtbS9PejIzaThU?=
 =?utf-8?B?eERYYWVoOWtvcE5mR3RPek9DQTFOUFgxZGRiZSsxSHFBWUV5TlpzbGRoQ3Vr?=
 =?utf-8?B?WDY3Vm5UaXBCMmN2cWcydlRoc0creVdLRUJNbzMyZm81dlJNS0lNdEJ5UlpV?=
 =?utf-8?B?c0xKU0RvdHN2ZVN6dko5R2tmVUhwd00xdVRtTkkyVTRCSkhZejJka0JGQ0xG?=
 =?utf-8?B?My91cDJTSjVxWkQyTGJjRi9XTTJkSjBDTmxSUHRna2QyMGo2aTN5UUl3cUlr?=
 =?utf-8?B?emduZWpXTzBieGQwT1ZHWDRKditZUTFmajI4Ym5YbnUxcVpIZlFoZzJ0YW9t?=
 =?utf-8?B?T1Z0TXA0N0wzRlBFbUw4bVE0VHI2dHhTdWFhbE5YRnFaVXVDR1FtZkFFeEV3?=
 =?utf-8?B?dW53TzZIUGJJNkRlK0NmVzVuWS9vSGhLNW1SVU9WQXdHcnh2RTFNMnBOTlRX?=
 =?utf-8?B?dXNHamtERDJPbmNEVlhJREdpUkdSUnZ2NWxZSG1aZ01hb1lZWXNLYm00anBx?=
 =?utf-8?B?Z0FMWC9CeWN3WUZWVUw1ZHJHT21TZVdYb1BaaW51Wk40WkFvSEZXTFhxTm94?=
 =?utf-8?B?ZnVSejV0Y2w3dXFzWS9qbFFRNDN2RjJRb0RidlRRbWVlcVRLNFFsYkp1em9r?=
 =?utf-8?B?ZXpkQ2F4blBwcmhsOE9rUUtKVTJmOHJWWGdlYUwzYkphcVA1dUE5cmhGdUhH?=
 =?utf-8?B?M1dhS0FWeUo1TFJ4RkZrR25nNExEL2poTWk3RmVUaHpSbzQwNFQ2RjFTQ2xq?=
 =?utf-8?B?cVZhRjlGNWFuMUNhU1g4QjNCSG93b0hteTFRQnZZNCtIanU2dzJTdnY1Y3k5?=
 =?utf-8?B?WlpQSEdQVUFiUUFGZlVuNjkvWnZKNTlkMkppcDlhR0Rzc3hjTVhDQkpEeWRp?=
 =?utf-8?B?WXVCa055ZnpmNmRoZzBURFNRME93Z1JuZnNtUVc3azVYVWszTVYwQUtBcTFM?=
 =?utf-8?B?MUxIQWJvVEovYTlCcFpya3o2amFKaU01SlBENHM5bU56cUZUd29XTTd3aW5P?=
 =?utf-8?B?NFVyMGovTzVLM3NZR1FqWTREUE1mTlRLR0VUbUVQSCtXYkp1d1RPN2huKzIx?=
 =?utf-8?B?cXVGRHVPM0dDbCtrZzVUR25BWWRQWVFxdkZQT05hVEdVN1RjL1R0UWs0YjN6?=
 =?utf-8?B?UFRqa3FZWi9KOGRJTkRQdEwxUmx1Z3JjSFliWnd3emYvTkl4TWZ1VnlKR0Rm?=
 =?utf-8?B?enZJQXBWRDZFcmxLc01PcTlVYlN2dkhTUkNGTk56ai9LV0tMRnN1QVNpUVEv?=
 =?utf-8?B?RnJjQkJVcW9QN29UZHliY2M4UmdSUUhpbWQ4bExnR1ZQWFVnUXZaQWVVOU54?=
 =?utf-8?B?Ym1Jc0VLTDljaVRuZXJOMVk2STVHRDlkSlVvMmppQWd5bjdMUjJ0UkNyQkth?=
 =?utf-8?B?QTNRNlU2WDZVNktiMnlFcWxLb1Q0TU9OVHNpS3NFdUthS2xuSDRYTkVPZ3FM?=
 =?utf-8?B?UE5oZHVGMUpQZTRBZWlmZnN4VFdlenZFZjNFSGpieUJ2RHFET3U2Ujl5aHN1?=
 =?utf-8?B?ZUM4K3Z6VldSMHUzbXA1U0o1dDJSNk41K0tKRGR0ZjV0WG92ZythOUVuMUl4?=
 =?utf-8?B?MlBKN2phcDJQOUVITWlyMHp5MTk1U2NUd3BQOS9kUXlza2dPTm1XUUgrdjhO?=
 =?utf-8?B?UzdzMWRsM2FXeUt2dzZmay9hMHV1ckgzcXk1eWZMVlBOSVoyNG5WN3p6MlBP?=
 =?utf-8?B?dkJpenNvVVA2WG9ZWjhnQWRFMkVPUzg4OG4rWEdKWHB3M2RJeVR0SlJNYVV1?=
 =?utf-8?B?T3BhUE12eWxUcCt0SEVlamZjaHRyQnJpeklabGVBcG1tbUN5L0NmbFhEVytl?=
 =?utf-8?B?eDZBT1ZOdmJka3RUYXJKTGk3STdGWHBUYXJVdUVURXR3SnZPNEwydklOMTFr?=
 =?utf-8?B?cWxkU2tnOXgwU1hTZDlrWXBDWmdvNnRQZFkxSjR5TzBiRmpGcUVNd2E5TVRM?=
 =?utf-8?B?eU5yTDl4eEQycWtIMUcvSDNwTUZBWG9QbEZGa2huUEk2WUlrM1haZFd3QkUx?=
 =?utf-8?B?ZFJvd0oybzZWZ2ZwTXdmTmxobXRCcHczTjBVMjdXblhrSndkdllmSjlXMXdh?=
 =?utf-8?B?eG5XVjBoSmJ2czdJb3R4dHcxTTVUb0hESWtCc3B2R2FKb2hJVDZXTDlYcEpk?=
 =?utf-8?B?QXhIeVFNbnp2VVlEazNlbFp0SUtLYys4dFovc2hUbDNYVi9IandKNFFTMmFG?=
 =?utf-8?Q?wXryh+eRXbpQpyUQjaitVHJ5LT0ILfJMKhPG6?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <38753428CA19A04A91AF925514D77A33@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 143c43a0-ca82-477b-b7b1-08da4dd62071
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Jun 2022 07:18:48.8853
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: F+sas+R74YJe69VNZ2h7Vt6jCAXYq6Nm3bs/xwWgBXIxGL3oJ9QegzCH4NcXVFsk7Q+GF+h6+cTGXRelAUJmz+lKFM12XAXiVhSDGqhhujw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR1P264MB1581
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDE0LzA2LzIwMjIgw6AgMDg6MDksIFdlbmh1IFdhbmcgYSDDqWNyaXTCoDoNCj4+PiAr
c3RhdGljIGNvbnN0IHN0cnVjdCB2bV9vcGVyYXRpb25zX3N0cnVjdCB1aW9fY2FjaGVfc3JhbV92
bV9vcHMgPSB7DQo+Pj4gKyNpZmRlZiBDT05GSUdfSEFWRV9JT1JFTUFQX1BST1QNCj4+DQo+PiBT
YW1lIGhlcmUuDQo+Pg0KPiANCj4gSSB0cmllZCB0byBlbGltaW5hdGUgaXQgaW4gbWFpbmxpbmUN
Cj4gU2VlOiBbUEFUQ0ggdjJdIG1tOiBlbGltaW5hdGUgaWZkZWYgb2YgSEFWRV9JT1JFTUFQX1BS
T1QgaW4gLmMgZmlsZXMNCj4gaHR0cHM6Ly9sa21sLm9yZy9sa21sLzIwMjIvNi8xMC82OTUNCj4g
DQoNCkkgbG9va2VkIGF0IHRoYXQgcGF0Y2guDQoNCkkgZG9uJ3QgdGhpbmsgeW91IGNhbiBqdXN0
IGRyb3AgdGhlICNpZmRlZiBpbiBmdW5jdGlvbiANCl9fYWNjZXNzX3JlbW90ZV92bSgpIGluIG1t
L21lbW9yeS5jDQoNCllvdSBoYXZlIHRvIHJlcGxhY2UgaXQgd2l0aCBzb21ldGhpbmcgbGlrZToN
Cg0KCWlmICghSVNfRU5BQkxFRChDT05GSUdfSEFWRV9JT1JFTUFQX1BST1QpKQ0KCQlicmVhazsN
Cg0KQ2hyaXN0b3BoZQ==
