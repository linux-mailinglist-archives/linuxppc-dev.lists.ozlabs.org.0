Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8375A4EB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 16:00:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGXC966Rgz3bjX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:00:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=FrnFxnO/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com; envelope-from=prvs=0240a890bf=elliott@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=FrnFxnO/;
	dkim-atps=neutral
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGXBL3zglz2x9G
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 23:59:49 +1000 (AEST)
Received: from pps.filterd (m0150244.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27TD1DBB001883;
	Mon, 29 Aug 2022 13:59:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=0cHkn1kYuYPeSn1rqrK1y8Nd/UxrX9hSiN3nyzF3a8w=;
 b=FrnFxnO/YZChNWEGj9p0RElmHFcW0nBvkAZTZgd+64WG3Ufq+TaUmU/9xlMYvembjk3M
 yjwOp4KW3RPqEkAM3QadzrtuK3jxaVEkZC2LINJ9HSh3InYn3Ifm2/io6HLFPlYsaFhs
 L/Atwls34FdQN1wx0zPoaRja0gNe4Wdqny6YvhepLHMxLCX4gwYkvkVZG9fVttA4nf53
 bK5yH9w1GJ0S5UzktPCUafZI0KPJtqSb1JOiiRmvilWDzEQOrP1JbLHAj8zJePNUX1vh
 6prThlcTndKMTAOgN2fhhlqkiVHpYwButCZmr8DuXgeZ6qASEAjWcxVrF4hSl7Od/uDm mg== 
Received: from p1lg14879.it.hpe.com (p1lg14879.it.hpe.com [16.230.97.200])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3j8wym0kkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 13:59:39 +0000
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14879.it.hpe.com (Postfix) with ESMTPS id 1CB35D293;
	Mon, 29 Aug 2022 13:59:38 +0000 (UTC)
Received: from p1wg14925.americas.hpqcorp.net (10.119.18.114) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 29 Aug 2022 01:59:37 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15
 via Frontend Transport; Mon, 29 Aug 2022 01:59:37 -1200
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 29 Aug 2022 13:59:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g1Zt+ZuCPuns8pp+g2OSDlGLmQhOfzKGLYXNgSzcmdR1hfoF5A+orJdyTHGVH018ZMs9QQMihC13yTmtrni30g6prpODNRKR7Uywk1tzJlMdnmaZ05xcY/7cFgGAqTIJ36QZKNsNVNlHNB2Ze0L0X/40G97j4Y6eYR9iljCVcKsIXsuwzjwTQUFdMZJ5ukkHzuqOURn/W1DAbirhMraX232uBZyPcC2rZ5CT0uq7sboLsKUuwNB1aWc1UXulls55cHO/W+LCWvsoPkzvKK8+28gTjZBYIhnLtYwYk2JjBPx85EadhzvEcCRgro0QZfUAxLFaxecRfjn/w/Mc99uJLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0cHkn1kYuYPeSn1rqrK1y8Nd/UxrX9hSiN3nyzF3a8w=;
 b=jhSpdg4LRN1G2EtDrYeiRYS1z5R73VQ500XqkFjrx6A+yq0HZUsWfc1c84O91XtHB1P9e9M6dTWm33VSbvIjxAFPJu+j0gCMKKXnEUSuE9cYxOFOnfZfDWs+5eK/wYGX1ISzR0pu5NRAHP0tijZ+Y6pqodiq3mZqkdmVCDh/lBJm6yfEu5YFLYA/fVkYgvdO/PhVKlKJ9/T7YQ83xj8lS4aB7/oEd9YGML6c6onO22B9CaBOBntJXsNgfKZyQUvEtE4uhuQweet71P0nQAH1P0vgJvypq4yFHM7uljSfwq/SuValgs4gk3FKu1L2eq3LSyrM2PIxl9/4DhlKv0awQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c4::18)
 by SJ0PR84MB1848.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:a03:436::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 13:59:36 +0000
Received: from MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::1cc2:4b7b:f4c5:fbb4]) by MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::1cc2:4b7b:f4c5:fbb4%6]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 13:59:36 +0000
From: "Elliott, Robert (Servers)" <elliott@hpe.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nayna
	<nayna@linux.vnet.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>
Subject: RE: [PATCH v2 00/10] crypto: Kconfig - simplify menus and help text
Thread-Topic: [PATCH v2 00/10] crypto: Kconfig - simplify menus and help text
Thread-Index: AQHYspAVhdnwrvKxPUuXHJ8Go7Hopq2z0aMAgAAZ/PCADAxdAIAAF/qggAFxSoCAAAd/sIAABvOAgAAHS4CAAH+M8IABDWTAgADXx4CAARE3QIAAl3+AgABSPiA=
Date: Mon, 29 Aug 2022 13:59:36 +0000
Message-ID: <MW5PR84MB184250EA1CAE04497C1E7CE9AB769@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
References: <20220815190608.47182-9-elliott@hpe.com>
 <20220817232057.73643-1-elliott@hpe.com>
 <e6e99e33-4279-690d-88b8-9e732551c17c@linux.vnet.ibm.com>
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
In-Reply-To: <a5cb3cec-6c99-16de-eee1-c3c5a58a5e11@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2005ecda-c61b-4089-00bd-08da89c6b51d
x-ms-traffictypediagnostic: SJ0PR84MB1848:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 0CzjL6Co2D8daJStsIfhP9HwhuFpcFf1qTIL3lrwb/25onxgLEIPod9Gk4g3U9kBfYa2rfsv6wAjXWkbyweGa/H4vUpOX0+Uf9DNshr1xF/sEfWZ0x04wbi9N/GDc2ix3mGgGQA2SJNccB8NtH0hNOUdWGRybwH1S1g2go4o3S3OUDPm/sNG9N7C5Q4ejZwAo8Qm0nsyUr48qvjqwMMEhN+zpu2aMODHfD40tZy5xLk3hZYvOrdFNKoB8bnFgFBM2qYthupGT4064OOWUT3RAFiqr/fuJTz0P6WMDHaeluie+v1GMmzlBtOKBsFNtFQHpAWC94i6XCEZBW9hejLjlvpmlnYxstZfpUfXiCZ6CvYYu5cu8gh/fyZpMoFi56Bt6D8CgZByH3TNHsIQ6aM4qRh/570SWzFkmNiC2kctRG94MgcyYGq9aLmRQhjKr17pAJqZ2yvTSaUEQe63yAbLdzrvSH5HzNa6Yn3/q4eZOBOtpSUdmPaXQn7aHP6Bs+ohBgElE2emAqqrP0lNn4plUf8gfRPy/ODdtdT6wUaGYlsnLrJsNxzVVER1o2XejN6Ukv6TslE0Mrg24rzFOOz74JTo/o0KvGVVCbo0+VQYlgWimqS2z6Y4UAf0Da4ZN/pCVcblHg4yOmrDzkaLXQ4tqtHSh+i6+g2auqnz8NLHdX08PNBLW1Hwy6Pby/CVAyyy8tSrsfAgjvtGhxETcODz/jCwYukXdAI/C9JvJuNM1eyt4JVIe9oaGW+tC7iImirmdbFYlhkLdA75vobev8QGqA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(39860400002)(376002)(396003)(366004)(7696005)(6506007)(122000001)(53546011)(2906002)(66574015)(33656002)(186003)(26005)(83380400001)(9686003)(38100700002)(55016003)(8676002)(4326008)(86362001)(64756008)(66476007)(66556008)(71200400001)(76116006)(66946007)(66446008)(316002)(38070700005)(82960400001)(52536014)(41300700001)(8936002)(478600001)(110136005)(5660300002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eUZMNlYyVEl3d2R5M05GamJ0elVKQTRZWGxFVWxVd2ttcWt3b016SzhpV1pR?=
 =?utf-8?B?RGpESVFBaVdvZzZLT3pLWTZUcDhvVWs4WDhBNUFMb010UWlZVnNXenZBak1X?=
 =?utf-8?B?V3c5UGM5Rk8reENhUVBDcWtpV24rQituUjlFQklMUE02aUNLRVBKa0twM20w?=
 =?utf-8?B?ZXNEWHEyK1poWks2OTBQQTJiMG9UL2lNbCtWRnB6c2RIbmFKZzFwcHpjUXBQ?=
 =?utf-8?B?OFVlbk5iNm5rUUllV1hOSkQ4QUtIeGFId0txNExmNFRoaURyakl4bDA0UWRF?=
 =?utf-8?B?OGx1OEtmeUNNcmRzNDhGWGhqdHN3Z3U5OSs1R0xUcUE3Z1g5UmwydEVzblNv?=
 =?utf-8?B?VEhRSDhWcjhZRElTUW1MancwWk1xRWgvV3QrcHBTYXdCL0JCTVNxVjhLTGZs?=
 =?utf-8?B?U1FLcTNBTzVBdTdWU1RDVk1udHp2UGpFTTlYeU54VEkrK2VIUDl0UWFLdW53?=
 =?utf-8?B?ZEdMTU1vZmF4dTJDbkVUdHFwaktCV1RjeGpHME42bVBaTFRwVU9IRGhGUkI2?=
 =?utf-8?B?dnQwS2lQancvdWdicE5rWHNoeUE1NGIwMWhVOUE1eDF6UDJIdytYaHk0djZK?=
 =?utf-8?B?MllsdWF3blJySUZ4S2MvWk5pMXk1Wm54bDAyOW40SmZFVTlvamJra0tzQzVy?=
 =?utf-8?B?eVZIY1ZpYzF5MHRqdkx0cEtSb3NzSGZoU29SMUpoWXRoeGdKWnlBUDBqZTF6?=
 =?utf-8?B?TGcxN3JBM3VteTZvUDFMbjdlbjZOWXluVlFIb3RQSnJPalpRdWl1NEZZSFlj?=
 =?utf-8?B?T01MZFFGS2cwd0pQanRNMnJHU0JPL2FNS2ZTekJXT1hLYjY0ZlVtMGJuY1l4?=
 =?utf-8?B?djMyRVpESU5FZ01YMVFBMG82N2tneng1VVV3akV5WXBMaEZCS1hJWUp3Tkpw?=
 =?utf-8?B?Nms0SjdJa1BXZjMxMTBsOFhYRUhFRWN1eUEyYWNaUTNWVTBJclBvc1B2dGky?=
 =?utf-8?B?VURIUDN6c2Rjc0tTcCsvaERyUXd3ekF6YUhLQU1JZ0pZSVNpUkI0WEhBMm8r?=
 =?utf-8?B?ZFZtRExRUzBPSVJ5WGhGMnJMQ3Q1cDdxUnJDZlBMMnY5eHY4V1htMExkeEsv?=
 =?utf-8?B?RWpTME0ycUROT1VJdW1yRU5MTnljZ2NKdXRFSStGYXBJL1V3M3NUaUR2cHh4?=
 =?utf-8?B?aEFra1RqdW9XOTVIcFg1SmtxOVJudng3TVdYS2t5RlJXMkdrc0NNTXh1Y1pa?=
 =?utf-8?B?dk9pZUwrOStCb0FqSHIzQU9GWWNMQ2ZpOTFaaG1RL0NCcEx0b0trbGg4dFZX?=
 =?utf-8?B?eGVDUWFhcjFMZ2JtbTkvU21RQ1lYNlRISmh1djNMU2o3S2RWTkpMZ1NFOHgz?=
 =?utf-8?B?UHgyOHUvNUhONkxQVFpGNnNEWllUQ3kxaXhPa1IzZElwc1V4TzNadkpaeDFU?=
 =?utf-8?B?N2RzbzhMa2lmZHNZbDRTaFNCUk9YQ2JLNmQwQlVpQXlTTXpzajFlK2lOZUZx?=
 =?utf-8?B?MkVFdjQyelFzUGFIWUk5QkQ2bzNTME9DZ1NZVHBkc0J5eHhuZ25PTGpPckJx?=
 =?utf-8?B?STZiTTEvTkxxWWZ1VXJqV09HeTE4djhKM1hQZG14aVhJTFNicjVFRTI1eERs?=
 =?utf-8?B?RFZ4dTFtTHhOVFpLbWU1YTVFOWl5VWlyTVF0aDJwc1dVUktrNjhGNVZjZkE2?=
 =?utf-8?B?Nzd2TmlQYmZEL2tlWkw1bWRaN2JDdTd5NnpBNGFWQ2w4dTUzMXE1M0hhY3lF?=
 =?utf-8?B?YW15SjBWWisyM1JObzl3aWRJdlI2YzltZ0swaDJSYWJHL3k4a2xoZTkzaWYr?=
 =?utf-8?B?eklIQmhLV1p3UUd0ckZHKzFkNUtmM2pnMmNZZVVVMS9vZE9lbXlmWVgrdjBo?=
 =?utf-8?B?ay9hc0pwb3lkdVFKeENiMnplKzkySGVCWHlLSmtiSFZHRnFQTEZSV2o0NXRQ?=
 =?utf-8?B?ZndrQ1JnTWtURG9IUG1IaXo0NW8vQTBqY216cm9SempMWC93ajNzTkFDU0Y0?=
 =?utf-8?B?MzNocHNyZ3Q5OXZoYWJuZ2ZmNkZLQ0FKRWFMMzYwY3laVmtYS09uU3JtVlBF?=
 =?utf-8?B?SEY3Tm51aHFHWGkzbWlCZm11TWZCYkRpQmJPQ2tleUVFeUZKemtHZVQ2b0Jz?=
 =?utf-8?B?dXZQVzJjeDJ1Uy90eFViQkVmZlhsNnhqNnRzQzQ2QVRYelJEUUhKam03enNp?=
 =?utf-8?Q?v7lw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 2005ecda-c61b-4089-00bd-08da89c6b51d
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 13:59:36.1140
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GYRwX44JMN9Uq8xgq1lLohIv/KkSFYZSe9E4VaEl1P4Fj10F4kbvvlohwlCt8W3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR84MB1848
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: TvTARmaatCiII6vDVdcfREP4NE38HfdO
X-Proofpoint-ORIG-GUID: TvTARmaatCiII6vDVdcfREP4NE38HfdO
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-29_07,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 lowpriorityscore=0 malwarescore=0 impostorscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=999 spamscore=0 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208290064
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQ2hyaXN0b3BoZSBMZXJv
eSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiBTZW50OiBNb25kYXksIEF1Z3VzdCAy
OSwgMjAyMiAzOjUzIEFNDQo+IFRvOiBFbGxpb3R0LCBSb2JlcnQgKFNlcnZlcnMpIDxlbGxpb3R0
QGhwZS5jb20+OyBOYXluYQ0KPiA8bmF5bmFAbGludXgudm5ldC5pYm0uY29tPjsgQW5kcmV3IERv
bm5lbGxhbiA8YWpkQGxpbnV4LmlibS5jb20+DQo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3ps
YWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAwLzEwXSBjcnlwdG86IEtjb25maWcg
LSBzaW1wbGlmeSBtZW51cyBhbmQgaGVscA0KPiB0ZXh0DQo+IA0KPiBMZSAyOS8wOC8yMDIyIMOg
IDAyOjA1LCBFbGxpb3R0LCBSb2JlcnQgKFNlcnZlcnMpIGEgw6ljcml0wqA6DQo+ID4NCj4gPj4g
LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPj4gRnJvbTogQ2hyaXN0b3BoZSBMZXJveSA8
Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiA+PiBTZW50OiBTdW5kYXksIEF1Z3VzdCAy
OCwgMjAyMiAyOjMzIEFNDQo+ID4+IFRvOiBFbGxpb3R0LCBSb2JlcnQgKFNlcnZlcnMpIDxlbGxp
b3R0QGhwZS5jb20+OyBOYXluYQ0KPiA+PiA8bmF5bmFAbGludXgudm5ldC5pYm0uY29tPjsgQW5k
cmV3IERvbm5lbGxhbiA8YWpkQGxpbnV4LmlibS5jb20+DQo+ID4+IENjOiBsaW51eHBwYy1kZXZA
bGlzdHMub3psYWJzLm9yZw0KPiA+PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAwLzEwXSBjcnlw
dG86IEtjb25maWcgLSBzaW1wbGlmeSBtZW51cyBhbmQgaGVscA0KPiA+PiB0ZXh0DQo+ID4+DQo+
ID4+IExlIDI3LzA4LzIwMjIgw6AgMjI6MDYsIEVsbGlvdHQsIFJvYmVydCAoU2VydmVycykgYSDD
qWNyaXTCoDoNCj4gPj4+IChhZGRpbmcgQ2hyaXN0b3BoZSwgcGVyDQo+ID4+PiBiYmE0OTY2NTZh
NzNmYzEgKCJwb3dlcnBjLzMyOiBGaXggYm9vdCBmYWlsdXJlIHdpdGggR0NDIGxhdGVudCBlbnRy
b3B5DQo+ID4+IHBsdWdpbiIpDQo+ID4+Pg0KPiA+Pj4gQWRkaW5nIGxpYm1wYy1kZXZlbCBnZXRz
IGFsbCB0aGUgYXJjaGl0ZWN0dXJlcyBidWlsZGluZyBleGNlcHQgcG93ZXJwYy4NCj4gPj4+DQo+
ID4+PiAoSSBhbHNvIGluc3RhbGxlZCBnY2MtcGx1Z2lucy1kZXZlbCB0byBnZXQgdGhlIG5hdGl2
ZSB4ODYNCj4gPj4+IGJ1aWxkIHRvIGRldGVjdCBwbHVnaW5zLikNCj4gPj4+DQo+ID4+PiBIb3dl
dmVyLCBwb3dlcnBjIHN0aWxsIGZhaWxzIHRvIGJ1aWxkLiBTZXZlcmFsIG9mIHRoZSBMaW51eCBz
dGFuZGFyZA0KPiA+Pj4gaW5jbHVkZSBmaWxlcyBlbmQgdXAgaW5jbHVkaW5nIG5vZGVtYXNrLmgs
IHdoaWNoIGluY2x1ZGVzIHJhbmRvbS5oLA0KPiA+Pj4gd2hpY2ggaGFzIGEgcHJvYmxlbSBmaW5k
aW5nIGEgZ2xvYmFsIGNhbGxlZCBsYXRlbnRfZW50cm9weSB3aGlsZQ0KPiA+Pj4gYnVpbGRpbmcg
aW5pdC9tYWluLm86DQo+ID4+DQo+ID4+IElzbid0IGl0IGZpeGVkIGluIG1haW5saW5lIGJ5IGNv
bW1pdCAwMTJlOGQyMDM0ZjEgKCJnY2MtcGx1Z2luczoNCj4gPj4gVW5kZWZpbmUgTEFURU5UX0VO
VFJPUFlfUExVR0lOIHdoZW4gcGx1Z2luIGRpc2FibGVkIGZvciBhIGZpbGUiKSA/DQo+ID4NCj4g
PiBZZXMsIGFkZGluZyB0aGF0IHBhdGNoIGZpeGVzIHRoaXMgcGFydGljdWxhciBwcm9ibGVtLiBU
aGFua3MhDQo+ID4NCj4gPiBOZXh0IHVwIGlzOg0KPiA+IENhbm5vdCBmaW5kIHN5bWJvbCBmb3Ig
c2VjdGlvbiA5NDogLnRleHQuZnJlZV9pbml0bWVtLg0KPiA+IGluaXQvbWFpbi5vOiBmYWlsZWQN
Cj4gPiBtYWtlWzJdOiAqKiogWy4uL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjQ5OiBpbml0L21h
aW4ub10gRXJyb3IgMQ0KPiA+DQo+IA0KPiBDYW4geW91IHBsZWFzZSBwcm92aWRlIHNvbWUgY29u
dGV4dCwgd2hpY2ggLmNvbmZpZywgd2hpY2ggdmVyc2lvbiBvZg0KPiBnY2MvYmludXRpbHMgZXRj
IC4uLi4NCj4gDQo+IEZXSVcsIGZyZWVfaW5pdG1lbSgpIGlzIHN1cHBvc2VkIHRvIGJlIGluIGFy
Y2gvcG93ZXJwYy9tbS9tZW0ubw0KDQpJJ20gcnVubmluZyB0aGUgc2FtZSBjb21tYW5kcyBmb3Ig
ZWFjaCBhcmNoaXRlY3R1cmU6DQptYWtlIEFSQ0g9cG93ZXJwYyBPPWJ1aWxkLXBvd2VycGMgQ1JP
U1NfQ09NUElMRT1wb3dlcnBjNjQtbGludXgtZ251LSBjbGVhbg0KbWFrZSBBUkNIPXBvd2VycGMg
Tz1idWlsZC1wb3dlcnBjIENST1NTX0NPTVBJTEU9cG93ZXJwYzY0LWxpbnV4LWdudS0gbXJwcm9w
ZXINCm1ha2UgQVJDSD1wb3dlcnBjIE89YnVpbGQtcG93ZXJwYyBDUk9TU19DT01QSUxFPXBvd2Vy
cGM2NC1saW51eC1nbnUtIGFsbG1vZGNvbmZpZw0KbWFrZSBBUkNIPXBvd2VycGMgTz1idWlsZC1w
b3dlcnBjIENST1NTX0NPTVBJTEU9cG93ZXJwYzY0LWxpbnV4LWdudS0gb2xkZGVmY29uZmlnDQpt
YWtlIEFSQ0g9cG93ZXJwYyBPPWJ1aWxkLXBvd2VycGMgQ1JPU1NfQ09NUElMRT1wb3dlcnBjNjQt
bGludXgtZ251LSAtaiA1NQ0KDQpGb3IgNi4wLXJjMyAod2hpY2ggaW5jbHVkZXMgMDEyZThkMjAz
NGYxKSwgdGhhdCB3b3JrcyBmb3INCiAgICBhcm0sIGFybTY0LCBzcGFyYywgYW5kIHMzOTANCmJ1
dCBmYWlscyBmb3INCiAgICBtaXBzLCBwb3dlcnBjLCBhbmQgeDg2Lg0KDQptaXBzIGNvbXBsYWlu
cyBhYm91dDoNCi4uL2luY2x1ZGUvbGludXgvZm9ydGlmeS1zdHJpbmcuaDo0NDozMzogZXJyb3I6
IOKAmF9fYnVpbHRpbl9tZW1jbXDigJkgc3BlY2lmaWVkIGJvdW5kIDYgZXhjZWVkcyBzb3VyY2Ug
c2l6ZSAwIFstVw0KZXJyb3I9c3RyaW5nb3Atb3ZlcnJlYWRdDQogICA0NCB8ICNkZWZpbmUgX191
bmRlcmx5aW5nX21lbWNtcCAgICAgX19idWlsdGluX21lbWNtcA0KICAgICAgfCAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4NCg0KeDg2IGNvbXBsYWlucyBhYm91dDoNCllvdSBhcmUg
YnVpbGRpbmcga2VybmVsIHdpdGggbm9uLXJldHBvbGluZSBjb21waWxlci4NClBsZWFzZSB1cGRh
dGUgeW91ciBjb21waWxlci4NCg0KKEknbSB1c2luZyBnY2MgMTIuMi4xLCBmcm9tIEZlZG9yYSAz
NikNCg0KRm9yIHBvd2VycGMsIHRoZXNlIGFyZSB0aGUgZXJyb3IvZmFpbGVkL0Nhbm5vdCBsaW5l
czoNCg0KQ2Fubm90IGZpbmQgc3ltYm9sIGZvciBzZWN0aW9uIDE5OiAudGV4dC5jcmVhdGVfc2Vj
dGlvbl9tYXBwaW5nLg0KQ2Fubm90IGZpbmQgc3ltYm9sIGZvciBzZWN0aW9uIDk0OiAudGV4dC5m
cmVlX2luaXRtZW0uDQpDYW5ub3QgZmluZCBzeW1ib2wgZm9yIHNlY3Rpb24gMjc6IC50ZXh0LmNv
cHlfZnJvbV9rZXJuZWxfbm9mYXVsdF9hbGxvd2VkLg0KQ2Fubm90IGZpbmQgc3ltYm9sIGZvciBz
ZWN0aW9uIDMxOiAudGV4dC5hcmNoX3N1c3BlbmRfZGlzYWJsZV9pcnFzLg0KQ2Fubm90IGZpbmQg
c3ltYm9sIGZvciBzZWN0aW9uIDUzOiAudGV4dC5hcmNoX3Jlc3VtZV9ub3NtdC4NCkNhbm5vdCBm
aW5kIHN5bWJvbCBmb3Igc2VjdGlvbiAyMjM6IC50ZXh0LmFyY2hfY3B1X2lkbGVfcHJlcGFyZS4N
CkNhbm5vdCBmaW5kIHN5bWJvbCBmb3Igc2VjdGlvbiA0NDogLnRleHQuYXJjaF9zaG93X2ludGVy
cnVwdHMuDQpDYW5ub3QgZmluZCBzeW1ib2wgZm9yIHNlY3Rpb24gMTgzOiAudGV4dC5hcmNoX2Fz
eW1fY3B1X3ByaW9yaXR5Lg0KQ2Fubm90IGZpbmQgc3ltYm9sIGZvciBzZWN0aW9uIDE1NzogLnRl
eHQubW9kdWxlX2FyY2hfY2xlYW51cC4NCkNhbm5vdCBmaW5kIHN5bWJvbCBmb3Igc2VjdGlvbiAx
MzogLnRleHQuc2NoZWRfY2xvY2suDQpDYW5ub3QgZmluZCBzeW1ib2wgZm9yIHNlY3Rpb24gMTA6
IC50ZXh0LmFyY2hfcmVwb3J0X21lbWluZm8uDQpDYW5ub3QgZmluZCBzeW1ib2wgZm9yIHNlY3Rp
b24gMTg6IC50ZXh0LmRlcmVmZXJlbmNlX21vZHVsZV9mdW5jdGlvbl9kZXNjcmlwdG9yLg0KDQou
Li9hcmNoL3Bvd2VycGMvYm9vdC9kdHMvYmx1ZXN0b25lLmR0czoyNzIuMTMtMjc3Ljc6IFdhcm5p
bmcgKGkyY19idXNfcmVnKTogL3BsYi9vcGIvaTJjQGVmNjAwNzAwL3N0dG1ANEM6IEkyQyBidXMg
dW5pdCBhZGRyZXNzIGZvcm1hdCBlcnJvciwgZXhwZWN0ZWQgIjRjIg0KLi4vYXJjaC9wb3dlcnBj
L2Jvb3QvZHRzL2ZzbC9tcGM4NTQxY2RzLmR0czozNDEuMTUtMzUwLjU6IFdhcm5pbmcgKHBjaV9k
ZXZpY2VfcmVnKTogL3BjaUBlMDAwODAwMC9pODI1OUAxOTAwMDogUENJIHVuaXQgYWRkcmVzcyBm
b3JtYXQgZXJyb3IsIGV4cGVjdGVkICIxMiwwIg0KLi4vYXJjaC9wb3dlcnBjL2Jvb3QvZHRzL2Zz
bC9tcGM4NTU1Y2RzLmR0czozNDEuMTUtMzUwLjU6IFdhcm5pbmcgKHBjaV9kZXZpY2VfcmVnKTog
L3BjaUBlMDAwODAwMC9pODI1OUAxOTAwMDogUENJIHVuaXQgYWRkcmVzcyBmb3JtYXQgZXJyb3Is
IGV4cGVjdGVkICIxMiwwIg0KLi4vYXJjaC9wb3dlcnBjL2Jvb3QvZHRzL21nY29nZS5kdHM6MjMw
LjE0LTIzNC43OiBXYXJuaW5nIChzcGlfYnVzX3JlZyk6IC9zb2NAZjAwMDAwMDAvY3BtQDExOWMw
L3NwaUAxMWFhMC9kczMxMDZAMTogU1BJIGJ1cyB1bml0IGFkZHJlc3MgZm9ybWF0IGVycm9yLCBl
eHBlY3RlZCAiMCINCi4uL2FyY2gvcG93ZXJwYy9ib290L2R0cy9mc2wvcDEwMjByZGItcGQuZHRz
OjE4OS4xMS0xOTMuNjogV2FybmluZyAoc3BpX2J1c19yZWcpOiAvc29jQGZmZTAwMDAwL3NwaUA3
MDAwL3NsaWNAMDogU1BJIGJ1cyB1bml0IGFkZHJlc3MgZm9ybWF0IGVycm9yLCBleHBlY3RlZCAi
MSINCi4uL2FyY2gvcG93ZXJwYy9ib290L2R0cy9mc2wvcDEwMjByZGItcGQuZHRzOjE5NS4xMS0x
OTkuNjogV2FybmluZyAoc3BpX2J1c19yZWcpOiAvc29jQGZmZTAwMDAwL3NwaUA3MDAwL3NsaWNA
MTogU1BJIGJ1cyB1bml0IGFkZHJlc3MgZm9ybWF0IGVycm9yLCBleHBlY3RlZCAiMiINCi4uL2Fy
Y2gvcG93ZXJwYy9ib290L2R0cy9zdHhzc2E4NTU1LmR0czozNDAuMTUtMzQ5LjU6IFdhcm5pbmcg
KHBjaV9kZXZpY2VfcmVnKTogL3BjaUBlMDAwODAwMC9pODI1OUAxOTAwMDogUENJIHVuaXQgYWRk
cmVzcyBmb3JtYXQgZXJyb3IsIGV4cGVjdGVkICIxMiwwIg0KDQphcmNoL3Bvd2VycGMvbW0vbWVt
Lm86IGZhaWxlZA0KaW5pdC9tYWluLm86IGZhaWxlZA0KbW0vbWFjY2Vzcy5vOiBmYWlsZWQNCmtl
cm5lbC9wb3dlci9zdXNwZW5kLm86IGZhaWxlZA0Ka2VybmVsL3Bvd2VyL2hpYmVybmF0ZS5vOiBm
YWlsZWQNCmtlcm5lbC9zY2hlZC9idWlsZF9wb2xpY3kubzogZmFpbGVkDQprZXJuZWwvaXJxL3By
b2MubzogZmFpbGVkDQprZXJuZWwvc2NoZWQvZmFpci5vOiBmYWlsZWQNCmtlcm5lbC9tb2R1bGUv
bWFpbi5vOiBmYWlsZWQNCmtlcm5lbC9zY2hlZC9idWlsZF91dGlsaXR5Lm86IGZhaWxlZA0KZnMv
cHJvYy9tZW1pbmZvLm86IGZhaWxlZA0Ka2VybmVsL21vZHVsZS9rYWxsc3ltcy5vOiBmYWlsZWQN
Cg0KbWFrZVszXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI0OTogYXJjaC9wb3dl
cnBjL21tL21lbS5vXSBFcnJvciAxDQptYWtlWzJdOiAqKiogWy4uL3NjcmlwdHMvTWFrZWZpbGUu
YnVpbGQ6MjQ5OiBpbml0L21haW4ub10gRXJyb3IgMQ0KbWFrZVsxXTogKioqIFsvaG9tZS9vcmFu
Z2UvbGludXgvTWFrZWZpbGU6MTg1MzogaW5pdF0gRXJyb3IgMg0KbWFrZVsyXTogKioqIFsuLi9z
Y3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI0OTogbW0vbWFjY2Vzcy5vXSBFcnJvciAxDQptYWtlWzNd
OiAqKiogWy4uL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjQ5OiBrZXJuZWwvcG93ZXIvc3VzcGVu
ZC5vXSBFcnJvciAxDQptYWtlWzFdOiAqKiogWy9ob21lL29yYW5nZS9saW51eC9NYWtlZmlsZTox
ODUzOiBtbV0gRXJyb3IgMg0KbWFrZVszXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxk
OjI0OToga2VybmVsL3Bvd2VyL2hpYmVybmF0ZS5vXSBFcnJvciAxDQptYWtlWzJdOiAqKiogWy4u
L3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDY1OiBrZXJuZWwvcG93ZXJdIEVycm9yIDINCm1ha2Vb
M106ICoqKiBbLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNDk6IGtlcm5lbC9zY2hlZC9idWls
ZF9wb2xpY3kub10gRXJyb3IgMQ0KbWFrZVszXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1
aWxkOjI0OToga2VybmVsL2lycS9wcm9jLm9dIEVycm9yIDENCm1ha2VbMl06ICoqKiBbLi4vc2Ny
aXB0cy9NYWtlZmlsZS5idWlsZDo0NjU6IGFyY2gvcG93ZXJwYy9tbV0gRXJyb3IgMg0KbWFrZVsz
XTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI0OToga2VybmVsL3NjaGVkL2ZhaXIu
b10gRXJyb3IgMQ0KbWFrZVsyXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ2NTog
a2VybmVsL2lycV0gRXJyb3IgMg0KbWFrZVszXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1
aWxkOjI0OToga2VybmVsL21vZHVsZS9tYWluLm9dIEVycm9yIDENCm1ha2VbM106ICoqKiBbLi4v
c2NyaXB0cy9NYWtlZmlsZS5idWlsZDoyNDk6IGtlcm5lbC9zY2hlZC9idWlsZF91dGlsaXR5Lm9d
IEVycm9yIDENCm1ha2VbMl06ICoqKiBbLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0NjU6IGtl
cm5lbC9zY2hlZF0gRXJyb3IgMg0KbWFrZVszXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1
aWxkOjI0OTogZnMvcHJvYy9tZW1pbmZvLm9dIEVycm9yIDENCm1ha2VbM106ICoqKiBbLi4vc2Ny
aXB0cy9NYWtlZmlsZS5idWlsZDoyNDk6IGtlcm5lbC9tb2R1bGUva2FsbHN5bXMub10gRXJyb3Ig
MQ0KbWFrZVsyXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ2NToga2VybmVsL21v
ZHVsZV0gRXJyb3IgMg0KbWFrZVsyXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ2
NTogZnMvcHJvY10gRXJyb3IgMg0KbWFrZVsxXTogKioqIFsvaG9tZS9vcmFuZ2UvbGludXgvTWFr
ZWZpbGU6MTg1Mzoga2VybmVsXSBFcnJvciAyDQptYWtlWzFdOiAqKiogWy9ob21lL29yYW5nZS9s
aW51eC9NYWtlZmlsZToxODUzOiBhcmNoL3Bvd2VycGNdIEVycm9yIDINCm1ha2VbMV06ICoqKiBb
L2hvbWUvb3JhbmdlL2xpbnV4L01ha2VmaWxlOjE4NTM6IGZzXSBFcnJvciAyDQptYWtlOiAqKiog
W01ha2VmaWxlOjIyMjogX19zdWItbWFrZV0gRXJyb3IgMg0KDQoNCg==
