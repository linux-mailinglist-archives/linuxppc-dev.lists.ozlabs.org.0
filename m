Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B7059004C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Aug 2022 17:41:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M3WHJ6tstz30Ly
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Aug 2022 01:41:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=N208xVEN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.84; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=N208xVEN;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90084.outbound.protection.outlook.com [40.107.9.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M3WGY034yz2xJT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Aug 2022 01:40:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gyGOcvFLy3CNSSl7Dfo5QyTrJRRQpy86o+2ymTIp3O1BXRwGkFhJIBf0HEqVnwRT5SmGDZyHJ1UTo+qx40bjO6GSa06MaEExTWk1fw7jCUMjhgaWSuhukmAqsby9nH0H5cVjTcKsVxxDKhQgMRoe8oseA6AXZgxO7ghhOFRFo9iPSvif4aTowoTPZoiMiT+Ftqi+XLubSi8gVaT5b1krYMRrjNQYWQQnSAUZUnVPkxOhsq4CengmmvygmjDpwf3C2ksmrr51ozLs4iLJXM226gYUtaoRboR5EvdXhVHs1/Q3cGaDs8JflIFuf/JzRLBkJ6ZtIBcgv895I3N2NTggAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1mquY11ArBE5Kboq23RBEPU6GkNFsc/ZKxnfAbEXBZY=;
 b=jdscHeNsUOj5yThCEXKIB+OD0/FulAhOO6dJBjgQryk5BBMhhIB7Cn/725jwvCChUL22Uw2Np20ckO8wz3Qp6jk+X3xmfulifa/W8MXEJ04P3yl1pKoFmEF9odVLlocu3wNNcZI6MH8ixz0uiLm0YP61DPFpxxbkDtM91jSHQUdm2Do2qDgaN/OrQAB1UXF3BpWLZKTeG/ZgAbN4uPzlU1nv3mNQRrPsw0wBnYIs9RCTcK8UwPDdz6Vq+AUBDFefDcMwYXZDdMn50kGHlYNnHMbg5eKGq8sgoS+ypA5L6WY4X0Q+M/BTALfqqLsTh1CWxnAVz5pbuDdacav5FbfTXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1mquY11ArBE5Kboq23RBEPU6GkNFsc/ZKxnfAbEXBZY=;
 b=N208xVEN2PR5KQUat8w+aj75D72rHrkcqG1h3JoClPrCanvl6kt9dekBL1QmNzZ9MSaEEqL3Z0zLvo/Fmd8S4aLseqqpbszHgBGuO0IwL0vYxnxl2d/R3mh6pB7doXzI0og+mXqHYmr/JjE0D9WkPugLIonSt9lt9sLDb6BPao8Jy7UKMyrV4cX0hcdENPNbGj7qvQIMcVxhFDYK2ofkcmbSlclIWcAz8td/cTHeY+btm9bDX75qg2ZXrXdnucj7J+CwR9NVeZPNkAS+C35u002KEx7KwCpHYbs7aCjXESYnUONMtXEt+HZpcXRYCKOhMxTDa5al7UWJeiSRRLLZIQ==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2757.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d0::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Thu, 11 Aug
 2022 15:39:59 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::888e:a92e:a4ee:ce9e%5]) with mapi id 15.20.5504.022; Thu, 11 Aug 2022
 15:39:58 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Segher Boessenkool <segher@kernel.crashing.org>, Rohan McLure
	<rmclure@linux.ibm.com>
Subject: Re: [PATCH v2 11/14] powerpc/64s: Clear/restore caller gprs in
 syscall interrupt/return
Thread-Topic: [PATCH v2 11/14] powerpc/64s: Clear/restore caller gprs in
 syscall interrupt/return
Thread-Index: AQHYn/BJNn0ehsxpLkmDJS03mwTPka2p6dIAgAAHhYA=
Date: Thu, 11 Aug 2022 15:39:58 +0000
Message-ID: <cd3f5a35-dfda-ef2e-dd13-93d5c4011f16@csgroup.eu>
References: <20220725063111.120926-1-rmclure@linux.ibm.com>
 <20220811151302.GF25951@gate.crashing.org>
In-Reply-To: <20220811151302.GF25951@gate.crashing.org>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f3a77482-b373-4055-0535-08da7bafbf80
x-ms-traffictypediagnostic: PR0P264MB2757:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  d1jzswTr0L2KZZ+d68NS+TdiGaoC4nxUZ00yFFSL2UsVF6wnJfprsffgfsX3dkxPJ8TLuTvuz6GxeDGbf2vxkULgf8cQwfYAhhIe4ZXoSwJoGw1JisSZM67WFs29VU+37t9n/ZHGc8r/AH53Y7/p8iWlxsx92jXvvwJPIK0D2uf1Ag2wFPLOoSfScEwtF0bVZMLb3ST+sQ6lkHXlEBX60GLzgEUy3uTlSENXVi5If3ihmNmsPlA9q9r6BJS8J0QCaYaW9XY5nQPExm7Ly0x3hcGx+qiUKcFlQY0hR8QtOXhatJlyLZoI/01ybAsFFDaB/eOqqcEkx4JHvA/vjLbyNPwuxTcGmaGJI8zAw/ggT8FQrjm1r1eOQbt9wj7dijfOSLvHuUGJ+8JsYPAi5wPslcYZPNkT03eaWy4jGEyng2X4ak3ODlgkj2G/35UAOsjS3j3Pt1sFE7P/3kEbF/GsT77MNZjHMeReEbKd7Wa8YiREgGVILYbb1SKQMGlH/H+LLL1hbcxJ+O7l64tyCa0ITxYXjZgSG8mRbKkZdHJ8G49EA6MDSk/fL7qvHTO3URzoLlgTaq6btDlvWIfL7CmvbyfmFflAsGCgJiC4Gty8xTm6TeB/YiQmetzg9ah8JR/qni1FjRajPY7USrGsiNKTikU39kgsuSWZutfmJYAE+6f7fz6wxK0b7E52ufipvJ3Gsy41rvIMtgRTwf5cXPyCi4tEXvZd4cr/eoxR3ENZzuJ+DX5sD/s3Z9mqi9dDlBl27HO9aPi584pXPF+ueRSNOpH4cBrtwibMlADiisDh9Pw/TAtXGSa6XwEAoq8d8T+G2eC6B6FLcJN+pCQxYy9zJK4cwxaOd0fwlikhxXJ1dWH9VQ496VEoTx32DG9xUWd1
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(39850400004)(136003)(396003)(376002)(346002)(38070700005)(186003)(54906003)(2616005)(316002)(41300700001)(6486002)(478600001)(86362001)(26005)(122000001)(71200400001)(110136005)(31696002)(38100700002)(83380400001)(6512007)(6506007)(8676002)(44832011)(4326008)(2906002)(8936002)(66476007)(91956017)(66556008)(66446008)(76116006)(64756008)(66946007)(36756003)(5660300002)(4744005)(31686004)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?dzRKYWUvaU5YUk9FWHdFalB3UnVva01MTVVkTm0vclNabGkyZ28rQStmRjZS?=
 =?utf-8?B?QVA5V3Y1SXdWMlEzTlE2TUR3elF2aG1JZjFmMTIyQk5mSWlaV3htZTZuWWNy?=
 =?utf-8?B?SjAyWFZSUWZVVzQyald2d05POGRMRGI1QzhFa3dVWXZwemtpaHZ5NzEzZzRQ?=
 =?utf-8?B?cXlyN0VBR3VmUkpSaVEwYjFUU3VXd3hqUkx6UHZqMkhkUUdnRUtzS1dFWnAr?=
 =?utf-8?B?VE0wcWV5RDd2dFdPd3RoRG5rZkVqSS91clZzZWdHdWhUbW1acVp2TzNKVmJt?=
 =?utf-8?B?dzZiOUFyNzI0a0xNZENpSytoL3FvREo4ZWNZWG1PVTAwVU5HaEppMTY4NmdP?=
 =?utf-8?B?Qnlab3FVT1J0ei93T0pWaHloSWkxQ1ZWWExTbUZWZ1YzM2pyZW9zcTBYUmRG?=
 =?utf-8?B?WU5hZDNQaDFzNkUwQnhHR0FidUJJclo3Y1FJLzgwZHl0L3NuY25SMTRobDcr?=
 =?utf-8?B?b0VKNmo1Um5xUTV6TFhJZEc4eEpJT01mV2hxa0FJdkgyQWFhTUptWU4wUEZa?=
 =?utf-8?B?WDBvYXpZTy9JazdHTG9IUk5HMzY3WWl5cDhEN0JQWnFocU13dUdTNlZENGRk?=
 =?utf-8?B?aWZROEZucXByQXk4NllZL0JPL3ZiWFBpVCtwV2lrOThSUHhjS25qcjc2VXpO?=
 =?utf-8?B?cndFZEtSaTI3RENmMmdFcUxwcEc4RjNiK1Q4cU9OSkE2amF6bWVLbCs5d2p5?=
 =?utf-8?B?MDc5Y3c0emttQy9pUzVRZUh4SmR4QXJBWi9CdHVmWkdGNncrMFpHYUlWTms3?=
 =?utf-8?B?S3Z3UHcvcERvclJlY3JwdEVkeFVqWTdYVEk5K3ovVHJiWlVGZnN2eDZnZ2pr?=
 =?utf-8?B?VVdSM2NER2JRMG9vbDNuQmdYbW96TzNiOUpBbFd3bkQrai9rWlpRR3FVcEdp?=
 =?utf-8?B?T1FpM0pIdHp4eGFUTjNidGZlekZUL2lacEZRSXZ1UGYvZUFvU24xSjFNVmxw?=
 =?utf-8?B?NjF2MDBmWXZNNWhtUTYzdFJoTjJQUWZXMWpLVHZ4eVdSZTRYbUVPOXhQbWtn?=
 =?utf-8?B?SnVGQm1DOGt3T0VVRUlLYVFKT2hncWErem56b0pXUEZuSzRid3ZndTVjL3BC?=
 =?utf-8?B?NlJVU3h0UGpKY0VsbE9BbVo4eEdHdkF1R1NFVzV4S1RjTmRoYnYrYlU5K1lJ?=
 =?utf-8?B?YWlEbko0SEFYcko4eFZjYlE5Wmd3SXNzZlovTy83R1NvRUFMM2x5M285Z3JX?=
 =?utf-8?B?dHhxV2RrRjZpZ21VanA4eXJMUTdkMlhNazl3K1pqYWxCU0pWakNBWU56ajhN?=
 =?utf-8?B?SkpHQUVoRGtRNEZVZkY2ZGpiRnFmcXM5RHdrTkVXMDZsSTJjd2E1UEdYdW14?=
 =?utf-8?B?MFB2cS9lRXdqNU1rREFyRzZtTUpFQllFNVUvaGJaTm9INXVGb0s2Z05SWVIr?=
 =?utf-8?B?SVVrUzdMdlN3SEk4cmtBRUhxTHhMUnBQOVQ2c3ptYjROaTA4b3R4YStXZEUz?=
 =?utf-8?B?Q0c5YzJGczY1K2JjTUJkdnllVkREMHYzNW5aVTR5WGJzaDdKblJQZ3FVZm1k?=
 =?utf-8?B?ZTdIU24rc1VsNllVWXFhVFV0MVc2Szg5bExPQ0ZtOFpiMGgvL2krNkNtdm1T?=
 =?utf-8?B?VWg3RzJ4ZjdLUUFEOFZhd3NtRHR1YXFMb0UveHBWcGtpdUV1SmVXR0ZGWmQ2?=
 =?utf-8?B?NXdTU2xlNG5uR1ZxSnpkSnpjek5KV1ZqR3ZGNnhpQ2lZU3FkY1NQV1lsZ3d4?=
 =?utf-8?B?M0ovYkdieUVLNWQ3YmxVSXlNRG1JWXdIOFZqQUFlNlFYeEdGTVFvN21zQ3hj?=
 =?utf-8?B?SmxhRHNjTGpydFdNdjF5RE5UQ2R2M3RzaHl3SEg0L2tTQ1BIMC83eUJ0ZDJ2?=
 =?utf-8?B?bVhibjByKzQrZTN2YmNIYlR3NHZxaWhUc3BYODRRRXQ1S3QydTA0bk5STFVo?=
 =?utf-8?B?T3g4OWVoWEp5QTExMEVneThnVldMT1d4MmFPSTNBZ1hQN0luU2NycjlqUzRn?=
 =?utf-8?B?bUM1UjQwbVBvOXhJS080YXdRd1B6T2x4bDkvem1XZmsxNjQvOGRJeHRBSUdY?=
 =?utf-8?B?Nndnb2s3WDNsci9UK3BrZ1grQkNRZWpzRzdsZ2ltRVBISHYyaVF0eEo1WXMy?=
 =?utf-8?B?d2tYWGVIVjRibG03Vmo3bXYxMkhnY2RJS2RpL3p0NCsrR3lLYlhib0hQM3Jv?=
 =?utf-8?B?NUs2TVcvcUpxS0dpMmJsT0ZGYWY2QU5mMnMvZU1pYkc3R29nQWtaRUtSbnU4?=
 =?utf-8?Q?uC0u5Zg2RKrGbUrTWlIwNa8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <36E332881FA5FF4E95FE03A6D7631C56@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a77482-b373-4055-0535-08da7bafbf80
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2022 15:39:58.8365
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9IJw4KUa+DK03obJO1fNizm7LbV9tjfiPoUy7vr8PhEoXs+fG+Jh3QX2Z3PzfhkPJG0fwICRRGthZPt/FeJdLyhw19vb2JXgC9xOSZXlApI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2757
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDExLzA4LzIwMjIgw6AgMTc6MTMsIFNlZ2hlciBCb2Vzc2Vua29vbCBhIMOpY3JpdMKg
Og0KPiBIaSENCj4gDQo+IE9uIE1vbiwgSnVsIDI1LCAyMDIyIGF0IDA0OjMxOjExUE0gKzEwMDAs
IFJvaGFuIE1jTHVyZSB3cm90ZToNCj4+ICsJLyoNCj4+ICsJICogWmVybyB1c2VyIHJlZ2lzdGVy
cyB0byBwcmV2ZW50IGluZmx1ZW5jaW5nIHNwZWN1bGF0aXZlIGV4ZWN1dGlvbg0KPj4gKwkgKiBz
dGF0ZSBvZiBrZXJuZWwgY29kZS4NCj4+ICsJICovDQo+PiArCU5VTExJRllfR1BSUyg1LCAxMikN
Cj4+ICsJTlVMTElGWV9OVkdQUlMoKQ0KPiANCj4gIk51bGxpZnkiIG1lYW5zICJpbnZhbGlkYXRl
Iiwgd2hpY2ggaXMgbm90IHdoYXQgdGhpcyBkb2VzIG9yIGlzIGZvciA6LSgNCj4gDQoNCldvdWxk
ICJaZXJvaXNlIiBiZSBtb3JlIGFwcHJvcHJpYXRlID8NCg0KQ2hyaXN0b3BoZQ==
