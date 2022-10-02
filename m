Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DF55F2458
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Oct 2022 19:43:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MgWXM2t7kz3dqs
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Oct 2022 04:43:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PJ4oklKT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.72; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=PJ4oklKT;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120072.outbound.protection.outlook.com [40.107.12.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MgWW86K8wz3cFT
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Oct 2022 04:42:12 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDVoluwzH/zzSd67Pqp5zgWDlhHJW/VexhzacBt+KUztHiVj15ukiPrEa2CAuZWo+isphaEaxVjf/WMjzUZ0jWlhjRBkiH+q6IUag4L8B3BQ1zWVHGiIKluV1R3WDqS91pHhaSopq6iaM2f1BG5B0g5N5WkeXO8su3UVLCUM7IEpa98LdgmKAtJazSQs3MuOERlEBhHRYERSgIfkCewbRGYotPISqmp9hUDUGU+MdUlFjHJKifE2TUhl5sdOgs2p5gaXQXQ4ZD+aKMks/AEXN2zmN77GDFeX0hjocA2reLiycpiTVqHqr+ZvV3A2/LjzeowLg7VGsMZzg8Bs1F5ZtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ShfdPo25HhAuduhAwkpqQlfIf916R/YlCDv3DawAlto=;
 b=Ht1VBg6+MoNkKAV8CfKhNcP2DMBg2bVtcoM+cWSefLKicP7p7r8nO/TPpx4NTXpTbAycF6BHw+/36I84PtdirTyL0SOTaZLMnpAZ9rFB2Q0DO21myyRUpxiLyGXnCRTZQW6gP22gkG8KEcCt9D3Zlphg4IsWpEeyZP0hmWZNxRAaXRokztlJa/tK0E7TdqJFvoli8lu9CARHx/kFACIztnIN9PkfnB1bcCdrS6hNw2EUk75fw9aGHkJi9WMg/vkorefC9QR3Y0nPFIiUVvZXh4DuZiKdSKzWD6pH9ftu1pD3DJIlA2PxZruc8QP4r14ryhyIWly1orPL16/VW2VV6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ShfdPo25HhAuduhAwkpqQlfIf916R/YlCDv3DawAlto=;
 b=PJ4oklKTJAID30cau1MHeoxrnIP8o+DXrkvxuwF3reJxlVJi//K9VwitDhSP/D6Yg2dcFzmNq/tivZqdDFvi3uj/D1x3/V8CNqmrIJje4yBh1gwCfvryGsZEz3MLZBxOmndAENrsTCuBMQDWdry5B2X86X4DR5qEv4XsO3UhoKU1y+h2bepiqe+Q5SSSEM6y/jIplOlv0TyrGGpOexXEpabewG/1bhr8j1alSMW59iUGc6dpH2sUwko4X77m3TsO2mOCKUFkhUphx6zLJaqRO+UAC+pLKgKocdgDF+cACmEZ450DqmZytxSmY+1uEhry2o8Uv513E4hbEBS/cqCQbw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MRZP264MB1526.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.28; Sun, 2 Oct
 2022 17:42:09 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::c854:380d:c901:45af%5]) with mapi id 15.20.5676.028; Sun, 2 Oct 2022
 17:42:09 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH v4 12/16] objtool: Read special sections with alts only
 when specific options are selected
Thread-Topic: [PATCH v4 12/16] objtool: Read special sections with alts only
 when specific options are selected
Thread-Index: AQHY1kv2FRXG1sOPFUiLYutVecUPEq37X/4A
Date: Sun, 2 Oct 2022 17:42:08 +0000
Message-ID: <751c0242-731f-6264-c63f-a7be3affe163@csgroup.eu>
References: <20221002104240.1316480-1-sv@linux.ibm.com>
 <20221002104240.1316480-13-sv@linux.ibm.com>
In-Reply-To: <20221002104240.1316480-13-sv@linux.ibm.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|MRZP264MB1526:EE_
x-ms-office365-filtering-correlation-id: ea07508e-17fe-4d57-be67-08daa49d6e15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  4XSmGVMtrVNeZBONkGmQVOTzSe5CFDsYkKdiyMkmGbVnOHpS/fqSi0Gy+NxvbasCKBUx7Zx8dCy8A2sbABsSm1hc2jqtSeEzsELEVEIKDmThopUV/uCK122zyaceRDVQWAmdjq9p90rz9olUfDIabRbaeNwG+4CVpF6nCzfSJtu6t1zdydifKOJo3bXRviNMgzTQPwkEXMSb2xz8RQCnlVokRBA8h4kQGomMDO9EFn5kWB8fsSASlDZpDPj/OFY+yDHEJLZtVfzTr0KNE2TSTHH4SsJmEx5L93Jl7lrtSv5Ht1Nkfw6eFGiTOE43HsHghZzKa77LTAH6Rv+xhN17mHOEOSX7Ro9v9x8kh+FXTkg0jJ378ntIVFze7Izu3aqEhFeuCCo5uehr731psUNnVVfWtdu43HhHYGSPpquGpGLc6t6XTaY1FR+v1qwkwNIqxNhqR/z2v1eV07+Yk/fTDvntPmwpodfvu3QCoBRuqrm7HS7fILgc1fluUMshamQ9/f5oGY5ar3lxSa0C+xvR464udhj0pYWUEfNfCSBzT8I6eBuOifmnoEaXeDCCDxp443AW7vD2L4J6lCQmbxcUR0M1lD0/Kk5cSvuKRI8Pnnj6YEOYplOgt7ECWoH+q4aWqQtMbGc/Jjgc0D5pXQENx8KadQpOGffvRhW3Nk3EhxtdN8WELJIDQmYJd8IgAl7AcafvEsAIoaD4sqp5T8xNw3mAp52TCwXQgbT6WcMnH6b1XC9WpqU16Oh/vkvhTjv35rYyHo7O90aRL/72WezqzqH61F1X7z4WJx6pL+1Cyj05YVzy8wf3gQeACpmUeI9ed99OgTUaXvCRzwhScmGPWA==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39850400004)(396003)(346002)(376002)(136003)(366004)(451199015)(6506007)(64756008)(66556008)(66446008)(6512007)(26005)(8676002)(66476007)(4326008)(2616005)(54906003)(110136005)(478600001)(76116006)(316002)(6486002)(36756003)(71200400001)(91956017)(122000001)(38100700002)(31696002)(86362001)(38070700005)(66946007)(83380400001)(186003)(31686004)(7416002)(5660300002)(8936002)(41300700001)(2906002)(4744005)(44832011)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TWRHNFZVNndobTdhaG0wT21uTzF5ajVYMDJmOHd5T0NaYzhlMjloUCt6cEhx?=
 =?utf-8?B?eHZJWkhhRXFOay9qazFvVjBNOFpTVlFHeDRRRmQ3RlJrL1pvRnJ0cGJvTHpO?=
 =?utf-8?B?VmtMODJ4Y1R3NnFpRW80a1grNkp5Y0RmdHdYdjF5UTdQOUFYcGJsQzd1TE8v?=
 =?utf-8?B?OEhYaGpFSHJCQm8rWlBvcVdYTnBlNm9lNjFwNnh6USttZjgveCtLQVNxaHZH?=
 =?utf-8?B?UUlGU1NVaTR3L1BSdmp2N0NPWUt5UEVUMmpETU9Jc3crMGJ6ZTBBaDhQdzIw?=
 =?utf-8?B?SDl0dWl1QTZIelNiQmptM3RQeE52NThzci9Cd1BuMVNMMVVWckVLclcxVU1K?=
 =?utf-8?B?Z3RPUExzeGw0YWhxZzUwWUNUemQ2OXVIT2QzcTI0alZkaWlhbGJlYTFiMUZC?=
 =?utf-8?B?MmN2S243WjgvcW1iYUVJb1JuVWhOWTJGOUZnWUk5WmZkMERoQVVwYk1mMW5V?=
 =?utf-8?B?Si9VRTNSZ2dFK2RHMDlnR2w4cHpuVTZ4Q21wcGxYdEc0VlY5MGo1VmVad1FH?=
 =?utf-8?B?SHg4QjBsbzVkWGFYVll6Zmg2WUJsQzBmcUdKVlNNTFpCRTBLZlZtZGRyU29l?=
 =?utf-8?B?NXBwVlU2S1NVeGI4blY1ME55Z29zejRTZFJkbktCZmtncWdSZ1J4RU00YXhN?=
 =?utf-8?B?cDBCa29OelhQVnZyZHJGRUhBQ3FoRmpSVC9aRnZxN1lUN21Ca3J3dkR4aTdH?=
 =?utf-8?B?cVRaWnY4Z0VaL1BVN2o0RHh3L3ViSWVEc2JVUnJ2Q0pzeFBmWFE2VnRXZ3NG?=
 =?utf-8?B?d2dIL0tQY1Y3YlJrcnFxeElRanVpaVB1bVV2Rm5UdWlRcDhYbFByTlJaL29K?=
 =?utf-8?B?aENqWGxkZE1zZm1DWTd3NUREOHVuRkdBM2t3alFYUWJmOXB6M3EwQUVQM1pD?=
 =?utf-8?B?aGZwN3BQdG9CMnpwUmdVN2x6TmVhMERPNXRldld0RTJDNFFxNTMwN2ZHQndn?=
 =?utf-8?B?Q2VFQ2Zxck1CUk1tdVpHR0twM0tXZ3gwQjdCeklmQWhCZTNCa3BFYWt0NC8z?=
 =?utf-8?B?dG9PbFlZS2tRVDQ0aGFDYkNUUnV0cUEwVDJXbzlkT3ZFNXJRNWE4Zk5yVkkr?=
 =?utf-8?B?VExXZG91SEJEZU8vajNqMGx5Sng0UzlFbWQ0RUxBeitRTWlxNXFLVXZML2Rv?=
 =?utf-8?B?OUM5dDBFL2l0UFhCTVE0YkZ6MDFUNXN4MG1Xa3RlSXBjUE53QmpEc0VjM1o4?=
 =?utf-8?B?b0ZpRU9iUnkzMTJEcDBFQUt3UkhSbmRrZWppTHhPV3VuN3dwWHF2L2U4VXov?=
 =?utf-8?B?azRxVGlna0FxR0FZdkJUUzFDQ1kyNDZScXIwUmxDVXJsb2hnaExiSGtuQXVs?=
 =?utf-8?B?SU9CSklqdWZNS2s1MENGQmJqV0gvVVdXSlVGUE5rM0tId0svcTQrUjIzc0h3?=
 =?utf-8?B?bkJwREQ4bTRWNUg3YTJBTWxwRlNkbk00QlJMdmh5Nlh6NjZnanBPQmp1N20v?=
 =?utf-8?B?ajRMNFM2ZEJvM3A5ZVdScjNHVTZJMit2aUV0M3RLRXhieXEwQmxTdExYdjJ1?=
 =?utf-8?B?cG9JMXVBUk1USHNOelU2TVdHY21kTmRiQVpaMjYwSEtKcmJCakdjdHorQWFV?=
 =?utf-8?B?M1NXUlJVK0lJWTZNb0IrQlh4VEhNS2l4TlJxcm9oNjFMMmNRa0NsVkN5UTdl?=
 =?utf-8?B?KzhwN1pwaFF0d09ScVJqb0w2UUdRdERqL3VsY1dJT1VVRmVIUGJ3NDVOVzJt?=
 =?utf-8?B?V0VHZjJ1VTMxWmVOSkh0WHBnOUVmV29NQXdMd29BdlUwUDQxbmpVU3h6T0hj?=
 =?utf-8?B?UkhNemIyTFNUTVppMURKVzhteEJEbjJ1cnFyZzFDYWdwcDV5R2YvWTUyTVpj?=
 =?utf-8?B?cEM4R1VxWlU4dENRU2ZPUTEvMnd1bmRKcmtoRGJQS1hjUGlabkoxQi9hN0Vn?=
 =?utf-8?B?QjhDZjBibC9JTjA2dC91czdGZU5HanMwZVVyNkdyNkhTby8xbjFuNGc4M0w5?=
 =?utf-8?B?MHVSSGJOU0tDMHFhRTlLQ05MMFNHeW1HaEhRQk1lRmk2V2czM21kSTZDUmdB?=
 =?utf-8?B?VUtXNGlneUpIRnNLN2RmNitUYVBEenh4bHg1aVMvWnFlblZyWlZTTkhDVWFC?=
 =?utf-8?B?S3R1SlYvZFlxNG8zMnYvbEx6SDNqajJiTjk3RFRqREU1aVlubUtNTDR5cDRs?=
 =?utf-8?B?K3JWa0xYNkhEU0NXaDA5ZkdQUmVPQkNLdkExRjNJVTl4R1Q1SVRrN2dGNUlh?=
 =?utf-8?Q?ErsZjvK0do9bNQ1csb4VM5w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92355D5FE6D4C447A8228F2C3555BA98@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ea07508e-17fe-4d57-be67-08daa49d6e15
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2022 17:42:08.9461
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Os9zuWZ32rzIO34vUY6mll9dIIPdX3q+E9gbrKnuGzxMIi4PW9vN0mtrOUkfHs5kcBdRy90vTQ3ex81RHvDG517dTY2jyQjsE7CZmunFcVo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRZP264MB1526
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
Cc: "peterz@infradead.org" <peterz@infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>, "mingo@redhat.com" <mingo@redhat.com>, "npiggin@gmail.com" <npiggin@gmail.com>, "jpoimboe@redhat.com" <jpoimboe@redhat.com>, "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>, "mbenes@suse.cz" <mbenes@suse.cz>, "chenzhongjin@huawei.com" <chenzhongjin@huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzEwLzIwMjIgw6AgMTI6NDIsIFNhdGh2aWthIFZhc2lyZWRkeSBhIMOpY3JpdMKg
Og0KPiBDYWxsIGFkZF9zcGVjaWFsX3NlY3Rpb25fYWx0cygpIG9ubHkgd2hlbiBzdGFja3ZhbCBv
ciBvcmMgb3IgdWFjY2VzcyBvcg0KPiBub2luc3RyIG9wdGlvbnMgYXJlIHBhc3NlZCB0byBvYmp0
b29sLg0KPiANCj4gU2lnbmVkLW9mZi1ieTogU2F0aHZpa2EgVmFzaXJlZGR5IDxzdkBsaW51eC5p
Ym0uY29tPg0KDQpSZXZpZXdlZC1ieTogQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0b3BoZS5sZXJv
eUBjc2dyb3VwLmV1Pg0KDQo+IC0tLQ0KPiAgIHRvb2xzL29ianRvb2wvY2hlY2suYyB8IDggKysr
KystLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQ0KPiANCj4gZGlmZiAtLWdpdCBhL3Rvb2xzL29ianRvb2wvY2hlY2suYyBiL3Rvb2xzL29ianRv
b2wvY2hlY2suYw0KPiBpbmRleCAzNTgyN2U2YzZkZjkuLmM2NDU3ZGFjNmQ1OCAxMDA2NDQNCj4g
LS0tIGEvdG9vbHMvb2JqdG9vbC9jaGVjay5jDQo+ICsrKyBiL3Rvb2xzL29ianRvb2wvY2hlY2su
Yw0KPiBAQCAtMjM3Miw5ICsyMzcyLDExIEBAIHN0YXRpYyBpbnQgZGVjb2RlX3NlY3Rpb25zKHN0
cnVjdCBvYmp0b29sX2ZpbGUgKmZpbGUpDQo+ICAgCSAqIE11c3QgYmUgYmVmb3JlIGFkZF9qdW1w
X2Rlc3RpbmF0aW9ucygpLCB3aGljaCBkZXBlbmRzIG9uICdmdW5jJw0KPiAgIAkgKiBiZWluZyBz
ZXQgZm9yIGFsdGVybmF0aXZlcywgdG8gZW5hYmxlIHByb3BlciBzaWJsaW5nIGNhbGwgZGV0ZWN0
aW9uLg0KPiAgIAkgKi8NCj4gLQlyZXQgPSBhZGRfc3BlY2lhbF9zZWN0aW9uX2FsdHMoZmlsZSk7
DQo+IC0JaWYgKHJldCkNCj4gLQkJcmV0dXJuIHJldDsNCj4gKwlpZiAob3B0cy5zdGFja3ZhbCB8
fCBvcHRzLm9yYyB8fCBvcHRzLnVhY2Nlc3MgfHwgb3B0cy5ub2luc3RyKSB7DQo+ICsJCXJldCA9
IGFkZF9zcGVjaWFsX3NlY3Rpb25fYWx0cyhmaWxlKTsNCj4gKwkJaWYgKHJldCkNCj4gKwkJCXJl
dHVybiByZXQ7DQo+ICsJfQ0KPiAgIA0KPiAgIAlyZXQgPSBhZGRfanVtcF9kZXN0aW5hdGlvbnMo
ZmlsZSk7DQo+ICAgCWlmIChyZXQp
