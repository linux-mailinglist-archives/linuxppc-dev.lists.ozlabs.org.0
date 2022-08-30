Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E95A5CC7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 09:20:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGzGy25Z0z3c6f
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 17:20:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JAqZJi25;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.12.81; helo=fra01-pr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=JAqZJi25;
	dkim-atps=neutral
Received: from FRA01-PR2-obe.outbound.protection.outlook.com (mail-eopbgr120081.outbound.protection.outlook.com [40.107.12.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGzG86frxz308b
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 17:19:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnJpYJq/0kNP6/fmqnWFWJprCz4v8W4JyTs56nNvC5+GIiwd3CEyaso37Wiv1kCmxCqi+ajpKtMKsaj2CYzDImXU3tUH4emnXUgTy4Amefp+2o/awAyTHV5Vz+buwquKxZeQa2EwocsAmYNeu/o9B1V5ThOr+AG0WWmeNYx97pKFvaEYtULH/uIDgz2Dz/wVvTmnaCIAQM//6CTSPZmRchKIeufr4Ts0XZfn2QpnCWPP0lr0fkyuvBJC5vLpF5E1qqzIMLo+SL8iJ5JGxWxiWnKmSnDzU9hC22gF9vH4ZRRlg0Wgmimkp6rZnkGycEq80emEssvJEw5GFPnWYmj1pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fLWQWHJddmkx2FhVF9Xb6Up/Kg7zGEE/oylU5Kh/Lmw=;
 b=D+DeJ251hTRXmdcRZwKM3y/j/sSuuY9lCEy2sZfhDmv41uybtrp+HpJIGySGQKQPWjYhPUmCkvCtJUWbQ1mVkh+T+IDnLqPjrClXVWIS4tKONMy0aOwhRN3kxjC2UCfOgUfngzZKVz5OHq/QMPXvOEWkg3cznKbmdsb3jUuNUFDmcH/RvV6cf5HsYSuIGUZlnNSq4O7IbPMLvVIF3oovyKJWLbR4SxR/WSwaW2k9yR2bqG5MCsP7UDkg/ltvm/Us/8ZUVtbxCq319LcAwigtu+6t+OzdiqFfXPLngB4iap2d4kngnSJMxxBzwx1KsoO1Gbq87lHG4LB1+BRkrIDXvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fLWQWHJddmkx2FhVF9Xb6Up/Kg7zGEE/oylU5Kh/Lmw=;
 b=JAqZJi25yBOvzFDDMYCzu9wWdnWCNOC+DMaUm36DNImIlaKqya4wvYclAorAAvvZhVSeqz5bJCrVCrQLS1IJUGWX/fZ+SqshQ0+spRGe6ubvOK8jODfXIK17zXLpBC2TMbzVa2xva87aaRgwmyiF+7AaYGfHJJPZilN2Ndr2NiScUQL/pZ3+2ql9uG0SX9IDWip0gqwfF34gpOrk1UpaFJYr4iNFlMRN0RkueeMKkFCUB+ovdzQi2Pxd7U6J31dUUUEkqVAbs9YyhPeD9bCwfZvMe00kSQBY5pZ/Ch/Oaga8TPLgoncDsx3/In+TjoTpbV1oLIPeHGpjY2nC6IUsuA==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB2323.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:34::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Tue, 30 Aug
 2022 07:19:23 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5566.021; Tue, 30 Aug 2022
 07:19:23 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: "Elliott, Robert (Servers)" <elliott@hpe.com>, Nayna
	<nayna@linux.vnet.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>
Subject: Re: [PATCH v2 00/10] crypto: Kconfig - simplify menus and help text
Thread-Topic: [PATCH v2 00/10] crypto: Kconfig - simplify menus and help text
Thread-Index:  AQHYspAas1zqUQZbRU+OYz0CGvi/xa2z0aMAgAAZ/PCADAxdAIAAF/qggAFxSoCAAAd/sIAABvOAgAAHS4CAAH+M8IABDWTAgADXxgCAARVXAIAAk18AgABVmwCAASKCAA==
Date: Tue, 30 Aug 2022 07:19:23 +0000
Message-ID: <bba3af0e-8438-911d-a886-517ab067be19@csgroup.eu>
References: <20220815190608.47182-9-elliott@hpe.com>
 <MW5PR84MB1842E554A4677FA177D73E23AB6D9@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <1eb670ab-b238-8406-510d-c8dad46a2fb5@linux.vnet.ibm.com>
 <MW5PR84MB18421D567F8CA4E5AC99B7C3AB729@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <018a65de-60ce-1906-c461-44dc95353ab9@linux.vnet.ibm.com>
 <MW5PR84MB1842FE1C4B5218959C2608F4AB759@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <c45efdf7-a677-acb7-84c1-b64284d414a4@linux.vnet.ibm.com>
 <MW5PR84MB184208ECF216DD025CE9D35BAB759@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <MW5PR84MB1842263C39734FD662F991E2AB749@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <MW5PR84MB184220E67A8141565A8D04CCAB749@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <1e9a46d4-5511-5b89-28ef-582231a94562@csgroup.eu>
 <MW5PR84MB18429921D0AD9D1BDAB9CD8AAB769@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
 <a5cb3cec-6c99-16de-eee1-c3c5a58a5e11@csgroup.eu>
 <MW5PR84MB184250EA1CAE04497C1E7CE9AB769@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
In-Reply-To:  <MW5PR84MB184250EA1CAE04497C1E7CE9AB769@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba7a1f24-9e12-44b2-e0a5-08da8a57f705
x-ms-traffictypediagnostic: MR1P264MB2323:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  o0WCIkB2ltjWesRCAQ4M85Cdw1jf/LO3SPdHkd8aIRvffLMhob9/7+SwvZ0Yhd/reQz00lJ6Qcm6JCqY1RSGzbJsQeBzQunc0wTcFdT8wZLlpbg6xaqBsZP0qyhutXVQL+lZ+T/a6Xfx0wJRqdhm/DuInXRnmqpVWWOBicXDDezXRMdD0q619ZoFeEOtQdbfPztGbNQY6SQVZ2mhPSahj8M8wmOeiFvQ3lJfQW7YGtYjxJWv8lqWLD8xiBeA/y24aoPdUDpq653nwBXIEQSzxiu0E62GNZJuXYjL0+gfPGD2ZvAEFgi9Dv0ZCwyhoR/rUKDqr1r48IShridOskD4r29ebgGFONaURaFoVwEtZFPgWeMKcuQSZx+1P0bV82nnwwDd3Jh7QskB8Af4yncCOEx/burCIbv0bvvVgGbzNEkc+YWMOzijse2IYP8CgaiQIvUsoGoeHEa+S3Dnyq0D4W5HjxX8Sx0x+JxW48J+huI7H2KAcmWSKLcofxth5Q00jrKzjmv9gF536ur8zYXm4ldDSy2wEdSLemPNCenTvOqiWdVOF+/tjMiyHnQYy14pyeJdZsIVHVB84j02M8RcLxiQTaPe8hlEGsqEvTa95CTvffBP5IQzSBy9gJ1SSQNgBWNXAhCbJ53esIG7uCcle+c5WOqoczVkbjfnnmmDfFz4gJhcRIm609Fr4cF/OvuzjGSV7YhUWXlovxx9yOVI6DhfcVxGlUxGUV5c210eF5Y3py7qDkBQE8y7z8mlh9fUTqDlWSN91177BF+jyOOrgewV3cOtb0jOOG2NKB2lWmB0ekJxrCyuweiIUzdd2yJ1LU1q5TBMVGOiAq3i43rmobw7dpmmecfUYm8CcMdxr9o=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(346002)(136003)(366004)(39850400004)(376002)(396003)(38100700002)(26005)(6512007)(122000001)(316002)(86362001)(41300700001)(8936002)(44832011)(5660300002)(31696002)(478600001)(38070700005)(31686004)(4326008)(8676002)(2906002)(53546011)(66446008)(66556008)(66946007)(6486002)(6506007)(54906003)(76116006)(66476007)(110136005)(64756008)(91956017)(2616005)(66574015)(83380400001)(186003)(296002)(71200400001)(36756003)(966005)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?YVpBQSsyY0RBZWZOanlIdzZSTkU3SUpwNUFZS1FuYW9lOFUxNnpYODZ1OVV2?=
 =?utf-8?B?aUwvaTUzc1pJK3FUa1dsb0JDQ0ExUTlOL1F3WGRiVXd4VkZyR2xma1U5WlFP?=
 =?utf-8?B?THZ3WExSLzZJT2xNaHM1ekZRNjRMeExUWHJHQTk1bUlidVNyY2tjVXF0clV6?=
 =?utf-8?B?L0VxbkZvMVpvajJpMm5lZTU1djBFNjN2eVBLQURWdFFqeFVWbzFiYU5mNmpo?=
 =?utf-8?B?ZXdBcjBJY1BjdzdEdEcyT1o0RFpvR0M0d0tJcWt6NFkwV3dkQm0xMFNIeVU3?=
 =?utf-8?B?RitxUktSK3lKZm1POFRNOUJnaGUwL3U5Y01iWnRvMTJBMTlqRlZYbHFMZ291?=
 =?utf-8?B?eVdENTlHZ25BNmRkM3dxWHQwSlgzU3NTRmVUcWtFVFlmWENHclhsYjBHMWd0?=
 =?utf-8?B?N2U1RndabllJRWJuSEtoWUFXNGQ5MFpWaHhnOVp2SVBYQzZpR2ZwRUhWMkQ1?=
 =?utf-8?B?ZVc4WTlGZzZ0aEh6b083blNxK0lzYm9MQ21pTHEzSkJoKzlYWXNRUnB5c2Nz?=
 =?utf-8?B?RDVoc08vVHRELzNoTUxGSlZiRWxZcjk2eUpVbXIzM0RwN2tJdXlsbERvMFB2?=
 =?utf-8?B?aHpmSTkydk1HdDJSeFRxcG81b2tQOTgvZE8xcExJbk5CWWtZYm9PTytUdkFT?=
 =?utf-8?B?WTF0M08vTmhtbTNOMTNBeHZCMlpwZ3hsdUd3TUNjbjJoSmpWVFA5ZjRrc0RV?=
 =?utf-8?B?YVl1cnh2TEIzWHhUc2NhamNZVVJjWnp0RzM4OERBMmlpdHFJZU5kMWhSQ3Ro?=
 =?utf-8?B?emlDdzFRQXZ4OE8vMDI4YjFZZTlhcm5BeW9tTmpOZVdDZzhjRHYwd04ybFYw?=
 =?utf-8?B?ZzAxb0JJT3ZIU1BRWjFiT0htd2UvVk8xczVERVN1MWRKTnQ2MnZWQWphN0dj?=
 =?utf-8?B?a0hkbnd4K2gvUFBmM1JhVjJmZ2xFb3FQdUZVTW5ac1FseWNUNmNXeUJiWC9q?=
 =?utf-8?B?eis2cm9tSEJ4NjRndGN2SnJxdExicnRveHpyUHk5YndEc25pa29QditCTlRU?=
 =?utf-8?B?L0Q0SXVVWlp0dDhFUWNPOFNXZFRPdTJNdy9WWmxjZzE3eUlxUFQ1TmIvVWJY?=
 =?utf-8?B?eEd6OTZkVFZvL3p0Qk9nZTcybGRoSHJWdEZpclZiL3RNMzJXS2pjSHdLUlMx?=
 =?utf-8?B?dUFWNys1Ulg5ODRVRnEyMEpUYjdDNlJnem9TSzR5NG81SXJYdU1Ma2ZhbDB6?=
 =?utf-8?B?N05YSEtyTDJwbmZMQ1F3NnJ6TW8zVmtua0t5OFdwVDZYTWJmODhhWUdTREV1?=
 =?utf-8?B?OGxMVHpIeEtxMDYxeWV3UnJ3SlNTMW9ldDM2OTRBRGQyTmZPeXFPZXpHYWI2?=
 =?utf-8?B?dVdETTd4Tnk4UUJWOUtDdmxMVVFGUXFCb0VBZXMvSlpIc25MVjYveGlCbzl6?=
 =?utf-8?B?S2RWQ01vL2tUWVBKMWIwTXIyeTREZGwxNE03T2k0UnRpUjVKWHFiQm5Manpv?=
 =?utf-8?B?bEh1ek5RMFBvSk1wT0lFbFYvemFFMTBZOVFxU0w5cEVMdkM5WHdCS2JRdnI4?=
 =?utf-8?B?Q3ozeDdLNXV2eXhOM3kwQ3FkaVV5N25QdHE3MUYyUTZFbFhJeFFMTnVVWjgr?=
 =?utf-8?B?M1FWbzlEbW5oUnEvMlN3MjBMVUx3T2huVXViYnh0NEwzbzRwY2Y1N0lJMC9k?=
 =?utf-8?B?OTYxS0k4dGpzUm84RkVrMTFITkc4NkY1QTVMSnkvenBxZnVoV3JOYlorei9K?=
 =?utf-8?B?YXBOcTFmQ3BwdmZLeUdIY0lQbStYY2Vvc3FiSkFqU2xBTWxJWFBvOWZyTHBC?=
 =?utf-8?B?MWx5QVRZWnMrNnJZUlRSQTM5M3gzRGhpNU1hd1pWbmVZSncvdFNIRExYNTdY?=
 =?utf-8?B?bnBsazdXdnZ6RWJrdG5TR3JRKzVqa2p3VXRQQWVCMHJxclpvVG9xSkc1WHZB?=
 =?utf-8?B?OEFhanJmb0pYakdlK04xRmFoVlpPZWs5Y1NzZWNIS1R4d2hSYzc4UTlrYlhu?=
 =?utf-8?B?VlYxWmpIdlY1SkkvR1ZKMzF3SGdtdFdtUUkvaWZXdFc1NVgvTVBrM2czY1Bo?=
 =?utf-8?B?dVhYV2tBUkhyNWRkbXEzbGZFYlZuMFJGTVk1Rm9rL0ZsZnVWQlVaWGpwMnR5?=
 =?utf-8?B?NlJaNjJMMktVQmVhWFMzZmNoMitSLzBBMVV0SkV3YTNWTVdHZUIreHhDTGg2?=
 =?utf-8?B?emYwM0NEV2FLK1YwZnYxdU5TVUs2V0FlQWtXcEFiVGRKc2Z2aWtGNjcwV1px?=
 =?utf-8?B?T3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <752218B2D40B8F4D80DE8414C3477BED@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba7a1f24-9e12-44b2-e0a5-08da8a57f705
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Aug 2022 07:19:23.6866
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Q6Wi1jWPTjfltq7Gnn5ehjG7VFIBCMaDKFxM9/RAp3embwcyPL8lMBtGG1PLNQ1VXRWSVcwNaJB41yXvwaPN5PxCt/nWVQo8DwhemW18f5Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB2323
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
Cc: Sathvika Vasireddy <sv@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDI5LzA4LzIwMjIgw6AgMTU6NTksIEVsbGlvdHQsIFJvYmVydCAoU2VydmVycykgYSDD
qWNyaXTCoDoNCj4gDQo+IA0KPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+IEZyb206
IENocmlzdG9waGUgTGVyb3kgPGNocmlzdG9waGUubGVyb3lAY3Nncm91cC5ldT4NCj4+IFNlbnQ6
IE1vbmRheSwgQXVndXN0IDI5LCAyMDIyIDM6NTMgQU0NCj4+IFRvOiBFbGxpb3R0LCBSb2JlcnQg
KFNlcnZlcnMpIDxlbGxpb3R0QGhwZS5jb20+OyBOYXluYQ0KPj4gPG5heW5hQGxpbnV4LnZuZXQu
aWJtLmNvbT47IEFuZHJldyBEb25uZWxsYW4gPGFqZEBsaW51eC5pYm0uY29tPg0KPj4gQ2M6IGxp
bnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAw
LzEwXSBjcnlwdG86IEtjb25maWcgLSBzaW1wbGlmeSBtZW51cyBhbmQgaGVscA0KPj4gdGV4dA0K
Pj4NCj4+IExlIDI5LzA4LzIwMjIgw6AgMDI6MDUsIEVsbGlvdHQsIFJvYmVydCAoU2VydmVycykg
YSDDqWNyaXTCoDoNCj4+Pg0KPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPj4+PiBG
cm9tOiBDaHJpc3RvcGhlIExlcm95IDxjaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXU+DQo+Pj4+
IFNlbnQ6IFN1bmRheSwgQXVndXN0IDI4LCAyMDIyIDI6MzMgQU0NCj4+Pj4gVG86IEVsbGlvdHQs
IFJvYmVydCAoU2VydmVycykgPGVsbGlvdHRAaHBlLmNvbT47IE5heW5hDQo+Pj4+IDxuYXluYUBs
aW51eC52bmV0LmlibS5jb20+OyBBbmRyZXcgRG9ubmVsbGFuIDxhamRAbGludXguaWJtLmNvbT4N
Cj4+Pj4gQ2M6IGxpbnV4cHBjLWRldkBsaXN0cy5vemxhYnMub3JnDQo+Pj4+IFN1YmplY3Q6IFJl
OiBbUEFUQ0ggdjIgMDAvMTBdIGNyeXB0bzogS2NvbmZpZyAtIHNpbXBsaWZ5IG1lbnVzIGFuZCBo
ZWxwDQo+Pj4+IHRleHQNCj4+Pj4NCj4+Pj4gTGUgMjcvMDgvMjAyMiDDoCAyMjowNiwgRWxsaW90
dCwgUm9iZXJ0IChTZXJ2ZXJzKSBhIMOpY3JpdMKgOg0KPj4+Pj4gKGFkZGluZyBDaHJpc3RvcGhl
LCBwZXINCj4+Pj4+IGJiYTQ5NjY1NmE3M2ZjMSAoInBvd2VycGMvMzI6IEZpeCBib290IGZhaWx1
cmUgd2l0aCBHQ0MgbGF0ZW50IGVudHJvcHkNCj4+Pj4gcGx1Z2luIikNCj4+Pj4+DQo+Pj4+PiBB
ZGRpbmcgbGlibXBjLWRldmVsIGdldHMgYWxsIHRoZSBhcmNoaXRlY3R1cmVzIGJ1aWxkaW5nIGV4
Y2VwdCBwb3dlcnBjLg0KPj4+Pj4NCj4+Pj4+IChJIGFsc28gaW5zdGFsbGVkIGdjYy1wbHVnaW5z
LWRldmVsIHRvIGdldCB0aGUgbmF0aXZlIHg4Ng0KPj4+Pj4gYnVpbGQgdG8gZGV0ZWN0IHBsdWdp
bnMuKQ0KPj4+Pj4NCj4+Pj4+IEhvd2V2ZXIsIHBvd2VycGMgc3RpbGwgZmFpbHMgdG8gYnVpbGQu
IFNldmVyYWwgb2YgdGhlIExpbnV4IHN0YW5kYXJkDQo+Pj4+PiBpbmNsdWRlIGZpbGVzIGVuZCB1
cCBpbmNsdWRpbmcgbm9kZW1hc2suaCwgd2hpY2ggaW5jbHVkZXMgcmFuZG9tLmgsDQo+Pj4+PiB3
aGljaCBoYXMgYSBwcm9ibGVtIGZpbmRpbmcgYSBnbG9iYWwgY2FsbGVkIGxhdGVudF9lbnRyb3B5
IHdoaWxlDQo+Pj4+PiBidWlsZGluZyBpbml0L21haW4ubzoNCj4+Pj4NCj4+Pj4gSXNuJ3QgaXQg
Zml4ZWQgaW4gbWFpbmxpbmUgYnkgY29tbWl0IDAxMmU4ZDIwMzRmMSAoImdjYy1wbHVnaW5zOg0K
Pj4+PiBVbmRlZmluZSBMQVRFTlRfRU5UUk9QWV9QTFVHSU4gd2hlbiBwbHVnaW4gZGlzYWJsZWQg
Zm9yIGEgZmlsZSIpID8NCj4+Pg0KPj4+IFllcywgYWRkaW5nIHRoYXQgcGF0Y2ggZml4ZXMgdGhp
cyBwYXJ0aWN1bGFyIHByb2JsZW0uIFRoYW5rcyENCj4+Pg0KPj4+IE5leHQgdXAgaXM6DQo+Pj4g
Q2Fubm90IGZpbmQgc3ltYm9sIGZvciBzZWN0aW9uIDk0OiAudGV4dC5mcmVlX2luaXRtZW0uDQo+
Pj4gaW5pdC9tYWluLm86IGZhaWxlZA0KPj4+IG1ha2VbMl06ICoqKiBbLi4vc2NyaXB0cy9NYWtl
ZmlsZS5idWlsZDoyNDk6IGluaXQvbWFpbi5vXSBFcnJvciAxDQo+Pj4NCj4+DQo+PiBDYW4geW91
IHBsZWFzZSBwcm92aWRlIHNvbWUgY29udGV4dCwgd2hpY2ggLmNvbmZpZywgd2hpY2ggdmVyc2lv
biBvZg0KPj4gZ2NjL2JpbnV0aWxzIGV0YyAuLi4uDQo+Pg0KPj4gRldJVywgZnJlZV9pbml0bWVt
KCkgaXMgc3VwcG9zZWQgdG8gYmUgaW4gYXJjaC9wb3dlcnBjL21tL21lbS5vDQo+IA0KPiBJJ20g
cnVubmluZyB0aGUgc2FtZSBjb21tYW5kcyBmb3IgZWFjaCBhcmNoaXRlY3R1cmU6DQo+IG1ha2Ug
QVJDSD1wb3dlcnBjIE89YnVpbGQtcG93ZXJwYyBDUk9TU19DT01QSUxFPXBvd2VycGM2NC1saW51
eC1nbnUtIGNsZWFuDQo+IG1ha2UgQVJDSD1wb3dlcnBjIE89YnVpbGQtcG93ZXJwYyBDUk9TU19D
T01QSUxFPXBvd2VycGM2NC1saW51eC1nbnUtIG1ycHJvcGVyDQo+IG1ha2UgQVJDSD1wb3dlcnBj
IE89YnVpbGQtcG93ZXJwYyBDUk9TU19DT01QSUxFPXBvd2VycGM2NC1saW51eC1nbnUtIGFsbG1v
ZGNvbmZpZw0KPiBtYWtlIEFSQ0g9cG93ZXJwYyBPPWJ1aWxkLXBvd2VycGMgQ1JPU1NfQ09NUElM
RT1wb3dlcnBjNjQtbGludXgtZ251LSBvbGRkZWZjb25maWcNCj4gbWFrZSBBUkNIPXBvd2VycGMg
Tz1idWlsZC1wb3dlcnBjIENST1NTX0NPTVBJTEU9cG93ZXJwYzY0LWxpbnV4LWdudS0gLWogNTUN
Cj4gDQo+IEZvciA2LjAtcmMzICh3aGljaCBpbmNsdWRlcyAwMTJlOGQyMDM0ZjEpLCB0aGF0IHdv
cmtzIGZvcg0KPiAgICAgIGFybSwgYXJtNjQsIHNwYXJjLCBhbmQgczM5MA0KPiBidXQgZmFpbHMg
Zm9yDQo+ICAgICAgbWlwcywgcG93ZXJwYywgYW5kIHg4Ni4NCj4gDQo+IG1pcHMgY29tcGxhaW5z
IGFib3V0Og0KPiAuLi9pbmNsdWRlL2xpbnV4L2ZvcnRpZnktc3RyaW5nLmg6NDQ6MzM6IGVycm9y
OiDigJhfX2J1aWx0aW5fbWVtY21w4oCZIHNwZWNpZmllZCBib3VuZCA2IGV4Y2VlZHMgc291cmNl
IHNpemUgMCBbLVcNCj4gZXJyb3I9c3RyaW5nb3Atb3ZlcnJlYWRdDQo+ICAgICA0NCB8ICNkZWZp
bmUgX191bmRlcmx5aW5nX21lbWNtcCAgICAgX19idWlsdGluX21lbWNtcA0KPiAgICAgICAgfCAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCj4gDQo+IHg4NiBjb21wbGFpbnMgYWJv
dXQ6DQo+IFlvdSBhcmUgYnVpbGRpbmcga2VybmVsIHdpdGggbm9uLXJldHBvbGluZSBjb21waWxl
ci4NCj4gUGxlYXNlIHVwZGF0ZSB5b3VyIGNvbXBpbGVyLg0KPiANCj4gKEknbSB1c2luZyBnY2Mg
MTIuMi4xLCBmcm9tIEZlZG9yYSAzNikNCj4gDQo+IEZvciBwb3dlcnBjLCB0aGVzZSBhcmUgdGhl
IGVycm9yL2ZhaWxlZC9DYW5ub3QgbGluZXM6DQo+IA0KPiBDYW5ub3QgZmluZCBzeW1ib2wgZm9y
IHNlY3Rpb24gMTk6IC50ZXh0LmNyZWF0ZV9zZWN0aW9uX21hcHBpbmcuDQo+IENhbm5vdCBmaW5k
IHN5bWJvbCBmb3Igc2VjdGlvbiA5NDogLnRleHQuZnJlZV9pbml0bWVtLg0KPiBDYW5ub3QgZmlu
ZCBzeW1ib2wgZm9yIHNlY3Rpb24gMjc6IC50ZXh0LmNvcHlfZnJvbV9rZXJuZWxfbm9mYXVsdF9h
bGxvd2VkLg0KPiBDYW5ub3QgZmluZCBzeW1ib2wgZm9yIHNlY3Rpb24gMzE6IC50ZXh0LmFyY2hf
c3VzcGVuZF9kaXNhYmxlX2lycXMuDQo+IENhbm5vdCBmaW5kIHN5bWJvbCBmb3Igc2VjdGlvbiA1
MzogLnRleHQuYXJjaF9yZXN1bWVfbm9zbXQuDQo+IENhbm5vdCBmaW5kIHN5bWJvbCBmb3Igc2Vj
dGlvbiAyMjM6IC50ZXh0LmFyY2hfY3B1X2lkbGVfcHJlcGFyZS4NCj4gQ2Fubm90IGZpbmQgc3lt
Ym9sIGZvciBzZWN0aW9uIDQ0OiAudGV4dC5hcmNoX3Nob3dfaW50ZXJydXB0cy4NCj4gQ2Fubm90
IGZpbmQgc3ltYm9sIGZvciBzZWN0aW9uIDE4MzogLnRleHQuYXJjaF9hc3ltX2NwdV9wcmlvcml0
eS4NCj4gQ2Fubm90IGZpbmQgc3ltYm9sIGZvciBzZWN0aW9uIDE1NzogLnRleHQubW9kdWxlX2Fy
Y2hfY2xlYW51cC4NCj4gQ2Fubm90IGZpbmQgc3ltYm9sIGZvciBzZWN0aW9uIDEzOiAudGV4dC5z
Y2hlZF9jbG9jay4NCj4gQ2Fubm90IGZpbmQgc3ltYm9sIGZvciBzZWN0aW9uIDEwOiAudGV4dC5h
cmNoX3JlcG9ydF9tZW1pbmZvLg0KPiBDYW5ub3QgZmluZCBzeW1ib2wgZm9yIHNlY3Rpb24gMTg6
IC50ZXh0LmRlcmVmZXJlbmNlX21vZHVsZV9mdW5jdGlvbl9kZXNjcmlwdG9yLg0KDQpUaGlzIGlz
IGFuIGlzc3VlIGluIHJlY29yZG1jb3VudCB0b2dldGhlciB3aXRoIGJpbnV0aWxzIDM3IHdoZW4g
DQpDT05GSUdfTERfREVBRF9DT0RFX0RBVEFfRUxJTUlOQVRJT04gaXMgc2VsZWN0ZWQuIFRoZXJl
IGlzIHNvbWUgd29yayBpbiANCnByb2dyZXNzIHRvIHJlcGxhY2UgcmVjb3JkbWNvdW50IGJ5IG9i
anRvb2wgb24gcG93ZXJwYywgYnV0IGl0IGlzIG5vdCANCnlldCBhdmFpbGFibGUsIGFuZCBldmVu
IHdpdGggb2JqdG9vbCB0aGVyZSBtYXkgc3RpbGwgYmUgYW4gaXNzdWUgd2l0aCANCmJpbnV0aWxz
IDM3IGFsbHRob3VnaCBpdCBkb2Vzbid0IHRocm93IGFuIGVycm9yIGF0IGJ1aWxkLg0KDQpVbmZv
cnR1bmF0ZWx5LCBGZWRvcmEgMzYgaXMgc2hpcHBlZCB3aXRoIA0KYmludXRpbHMtcG93ZXJwYzY0
LWxpbnV4LWdudS0yLjM3LTcuZmMzNi54ODZfNjQNCg0KDQpJZiB5b3UgdGFrZSB0aGUgY3Jvc3N0
b29scyBmcm9tIGtlcm5lbC5vcmcsIGl0IHdvcmtzIGJlY2F1c2UgdGhleSBkb24ndCANCnVzZSBi
aW51dGlscyAzNy4gU2VlIGh0dHBzOi8vbWlycm9ycy5lZGdlLmtlcm5lbC5vcmcvcHViL3Rvb2xz
L2Nyb3NzdG9vbC8uDQpBbGwgb2xkZXIgb25lcyBhcmUgYXZhaWxhYmxlIGF0IA0KaHR0cHM6Ly9t
aXJyb3JzLmVkZ2Uua2VybmVsLm9yZy9wdWIvdG9vbHMvY3Jvc3N0b29sL2ZpbGVzL2Jpbi94ODZf
NjQvDQoNCmdjYyAxMS4xIHVzZXMgYmludXRpbHMgMzYuMQ0KZ2NjIDExLjMgdXNlcyBiaW51dGls
cyAzOA0KZ2NjIDEyLjEgdXNlcyBiaW51dGlscyAzOA0KZ2NjIDEyLjIgdXNlcyBiaW51dGlscyAz
OQ0KDQpDaHJpc3RvcGhl
