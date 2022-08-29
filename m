Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7D205A4083
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 02:57:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGBqq28zNz3bsy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 10:57:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=eCIJFYBt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hpe.com (client-ip=148.163.143.35; helo=mx0b-002e3701.pphosted.com; envelope-from=prvs=0240a890bf=elliott@hpe.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=hpe.com header.i=@hpe.com header.a=rsa-sha256 header.s=pps0720 header.b=eCIJFYBt;
	dkim-atps=neutral
X-Greylist: delayed 3050 seconds by postgrey-1.36 at boromir; Mon, 29 Aug 2022 10:56:58 AEST
Received: from mx0b-002e3701.pphosted.com (mx0b-002e3701.pphosted.com [148.163.143.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGBpy5jgTz2xH9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 10:56:56 +1000 (AEST)
Received: from pps.filterd (m0134424.ppops.net [127.0.0.1])
	by mx0b-002e3701.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27SLCIQS020351;
	Mon, 29 Aug 2022 00:05:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pps0720;
 bh=PAi3zapfbrHf/LJDfRczK37OD+gUW5TJEbKLnZmN2ZE=;
 b=eCIJFYBt+QillZ48MD36uL0+VVfkiC9w3OUgvRltJMd85NEDkIqrKz927ZjFQZngI4KD
 4uAaRfr/bX62Ml765Wtm9OaoUJ2+uXOVo/2gLnzSErOpRxpsjwohggDWnTHQCb/U/MEO
 rMkVjjLPiAaxmtV+L31ZSYtdPmBgqG/Iz9mFTgj8/ckM7Dne0J63CUI/yvNNGVTFLFyj
 a1qE/Ad3wd/FH8HICfyNBHin8KHa48F98Oy7z3kqkP6lMlDzqx8sRe/8LzsAK1FbH7kY
 M+f5E/y7D1VimZQJABMIR3AF19GIS4Z22dU1hM4AhTQS0/jgWfidlSsLO0wY8lvSuD8S 7g== 
Received: from p1lg14878.it.hpe.com (p1lg14878.it.hpe.com [16.230.97.204])
	by mx0b-002e3701.pphosted.com (PPS) with ESMTPS id 3j8dgxhbsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Aug 2022 00:05:54 +0000
Received: from p1wg14925.americas.hpqcorp.net (unknown [10.119.18.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by p1lg14878.it.hpe.com (Postfix) with ESMTPS id C2F2AD2EC;
	Mon, 29 Aug 2022 00:05:52 +0000 (UTC)
Received: from p1wg14924.americas.hpqcorp.net (10.119.18.113) by
 p1wg14925.americas.hpqcorp.net (10.119.18.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Sun, 28 Aug 2022 12:05:52 -1200
Received: from P1WG14918.americas.hpqcorp.net (16.230.19.121) by
 p1wg14924.americas.hpqcorp.net (10.119.18.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.15
 via Frontend Transport; Sun, 28 Aug 2022 12:05:52 -1200
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (192.58.206.38)
 by edge.it.hpe.com (16.230.19.121) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.15; Mon, 29 Aug 2022 00:05:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HCSEZGJXq+cbVJHqDBtWGkOMNeWjJK1IqpmsyOGNCODj6VJbjy5WbL6WBy9Jk5mtqt5T7yfCQr+ThcBM2AIIbjRFUrI51/Blyk62P6IJDEDPtbUhIbIRMXmDcrSLQpKl/hbKdDjQ+b33U/BT5UW4J/V5wZMEE6CxeR/EdbJRIG9eoJZn2IqrZLyUX+mhIBjMxuy1EL5QABGZ+kqfhFkMBBzQSvCL1508wFHs12DUzPwQ7iET2RPf3yvflaTduQrZApYVcrBNwKB23PF6DPbtJZs4x/eSfqCY6G3KhtNTV/F3+8FsCy9T7RKgdEoSVGG+bl7y99F9LUUWhmvqMOIV9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PAi3zapfbrHf/LJDfRczK37OD+gUW5TJEbKLnZmN2ZE=;
 b=CoEQ3jvnKvEMcOk2nEzFvt+CGnlFJ9J8WqqON5KqOxKXP9pJso9oj7R+QxhqqS0REgYLxXUR+ia5NLfHhVqgRlB0L/vz3MQ7hnc375TimANda9J8/iOyYCb3WI4VFDBqdAuP2PmKzlEiVM/44EsP2ZLXi71Oqj1oz9etvU29Sjzzah60qDMrhY0fai/zfB+FoMaGIP3NLvXd6JfT8j+ufcXdZ2epozPdtEs3IFd5ECXU7pvIQ40Ea3bgj96q62gnxf4kb5z2kTqbzLvKlfWeE2ukU1TlYDEu8tiVEDRScoI+wQdsREBtY+jIx7GtRGunZ2pM+GdaVTZVrP+w/tuiKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=hpe.com; dmarc=pass action=none header.from=hpe.com; dkim=pass
 header.d=hpe.com; arc=none
Received: from MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:303:1c4::18)
 by PH0PR84MB1407.NAMPRD84.PROD.OUTLOOK.COM (2603:10b6:510:172::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 00:05:45 +0000
Received: from MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::1cc2:4b7b:f4c5:fbb4]) by MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
 ([fe80::1cc2:4b7b:f4c5:fbb4%5]) with mapi id 15.20.5525.011; Mon, 29 Aug 2022
 00:05:45 +0000
From: "Elliott, Robert (Servers)" <elliott@hpe.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nayna
	<nayna@linux.vnet.ibm.com>,
        Andrew Donnellan <ajd@linux.ibm.com>
Subject: RE: [PATCH v2 00/10] crypto: Kconfig - simplify menus and help text
Thread-Topic: [PATCH v2 00/10] crypto: Kconfig - simplify menus and help text
Thread-Index: AQHYspAVhdnwrvKxPUuXHJ8Go7Hopq2z0aMAgAAZ/PCADAxdAIAAF/qggAFxSoCAAAd/sIAABvOAgAAHS4CAAH+M8IABDWTAgADXx4CAARE3QA==
Date: Mon, 29 Aug 2022 00:05:44 +0000
Message-ID: <MW5PR84MB18429921D0AD9D1BDAB9CD8AAB769@MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM>
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
In-Reply-To: <1e9a46d4-5511-5b89-28ef-582231a94562@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8727971b-126d-4f83-fd68-08da89523847
x-ms-traffictypediagnostic: PH0PR84MB1407:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: PttXwLLldTXVW0qzoswc6eR55lXhQyGmsFwYxUnipBkBsSUwdaf8C5rULnK0TJHlK21aXzbiwWCcINr9lMvjPDx9zJaNBnZHH2pfVyRR00PyTfnE1AS9/YvDscKLlxGdHf6b+1t9zK7PizwEfZFiLzisr1JJNMwwAJ/ADAaPHVgR7/ZY20fpOgGyaTn4kuUbfTc5ds9dUqBde7mGkt6/g2HFZZysMkS13zVfqS7dL10/If5xhHp/gkcnPBhFJQQskT4RtlmOEyxYMDXRWRkVCw3WmsJPk1dCkLYHW6GOBLDVZoTJmUqtBzvim/PuHzliSdqJLOC2UMelETVMAaZldIOSmco2aSW5RjUHfrNO+wKhB9p5n7BvTIa1j8D0MKkTAVNzSY7St3cAorJGZP/OsnS4cXYJv47dHXzoSbMcaBJje5/HqkNIXGvtFvHswV8BzVYj/Wu6nUw2XEtVf8ay60Puq2y+fGxmXYR+oy3If9hZAy0IAcnoX+SlgpLxfu3Tm3VJWilUXaH15xwFcTaJuiw/y4ovwUURoO3jjpq1IQDekJYEcLgax1GO90EUEJP3uV/I7uF9pQ90WEnmQXTeEjEuKTASx/ff9+gNvf6+dhbpoGFQoYfXiaqQMqNw7LywKGzNj3hKvQOkel3+okIL/Sh1VOuZyScpOS14S9+6YEKHmCfhuOGImFkcWY5jtwfU5cDeufT4x4ZzjP+TxpTwm/QoLjVgtFxCyq/QyacA+B1a0Kgx4W/lB4JT9JJZf2qSzx3Vbd+eBFb3912RTXqAnw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(346002)(366004)(396003)(136003)(376002)(39860400002)(6506007)(7696005)(53546011)(26005)(478600001)(41300700001)(83380400001)(66574015)(186003)(52536014)(5660300002)(33656002)(8936002)(4326008)(8676002)(64756008)(66446008)(66476007)(66556008)(2906002)(66946007)(55016003)(110136005)(76116006)(71200400001)(316002)(9686003)(86362001)(38100700002)(122000001)(82960400001)(38070700005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RDZ5VVhSUG9iOXdnR1c3TnN5ZU9ZUStsVGdsYlpQSzNJUHVscnZ1RmlwL2N6?=
 =?utf-8?B?QWhObnFPTG9TYmN0UG1FWDRQTTVXZEsrbVZOb0sxaDVNTjc2Ni83UFhkZ3hG?=
 =?utf-8?B?QlhTS1Y0YWJFNmF1dHo0SHdYb2ZqeTVZRGljMkZvNWNGTXE4NCtmWjU5c1JC?=
 =?utf-8?B?QTM4UXJsWE10aW15RXI4SHluY2NvR0RTb1hBYjVuOGR1MjVUc1docVROOXZp?=
 =?utf-8?B?QXAzcW5CVFkzY1o3ZGx5K20zVVBjNmlxVXoycGRuRnYyUktpRm5ONk5ScWYw?=
 =?utf-8?B?ZDFSWXloVHI2QTR3Um1kUWJzZTZ6eUJxeFl0K2k1R1hJN3YwSk1sMlo3REpZ?=
 =?utf-8?B?NThxdEREOHFSdnovbndOYUtWbWppNkptSjJzMCt4NE5KQlhnV3NWWEIxYlZ1?=
 =?utf-8?B?UitTanpZZ3FpNmRjUzdIbUNTdFZnQmlTek9GV1ROSHNxSTNRZFlmdnoxaU5k?=
 =?utf-8?B?QXdLTHRmaWxxbTlpamFXYWNSMFdYbG81dXh0ektaTVQ4ZC91MEEwUlNDTzYw?=
 =?utf-8?B?WmhDUVlNaElwd3ppTXNYTGZIZ3dncW1wR0RpejYyMnEybHJlN0dhcTlxUTFm?=
 =?utf-8?B?TDlIcjllanFNT3VVOUtSbmh6Wmo5bXJFY2hpNEF0SWZUTHFrVVdpVU54MEM5?=
 =?utf-8?B?SnhnQ0dLZm51UG5INUZRVEtLcE5XaDVqZ2IxMnczUG10Z3FoajFob3JuRnRV?=
 =?utf-8?B?OC9Udm1uZFl5Qm1DRlZzRjNoeVVucVFOK1RTREhuZ3VjbHJDaDh0TFR5a3RN?=
 =?utf-8?B?NVZOVnNGQThPM0l0RlNyMWxqWS9od1M3Y1pFM0pBbXQxbkR4bWFONjQrUUhw?=
 =?utf-8?B?d0JxRm1UVVQxVEVwSkp5d1g1Z293RERSYjA5QnNhQ2RwMCtjZE05d1drQkhk?=
 =?utf-8?B?N0oxSHZLSHg2eUl4UmNpWlpmZ29EeEJZRzNyYkZncWhybjBndGVCOEdTdS9V?=
 =?utf-8?B?c24xVmF0RVRYaTRMSEpyMlpJMWFjdGYvUUVnWkhVUk9kdnkxRlhaTEJBQTlk?=
 =?utf-8?B?YXZYS2M4Tm5SVkVENDgvUlJ4QTdaQjMwd1dSMFRpcHZUcDlqOXA3VlNoaWVF?=
 =?utf-8?B?ZFBMaG53Snl1Z2k0MklGZEd2Um94VDNQOGtQbXJtUThUcm53Ri8rd0VydVla?=
 =?utf-8?B?ejNOMXdBRSttQzNFckMrdG1GbXZveTdvQlk5ZDhLQy8vYVRXei9veEZ5U3FR?=
 =?utf-8?B?MHMrQzc0c3NmWkxJSzhmbGxSclE4bzBUY29WMURDbjdzQUtVeWRZSHZvbmha?=
 =?utf-8?B?ZmdHTzZlY0tkQmwxRFpkZFhmU2tPYmx3TnZYQlVDSDRxVzluZ0l4NDFUN01r?=
 =?utf-8?B?R0RtZHRNRU1QTmo2SDU5MmxucjdUWEowRU1oTFBHK3dsMUxPS1AyejVUR3pq?=
 =?utf-8?B?cUFGbjg4Z09uSFFUSGhqMHJIaVhQZ2tWK0x2YWx0VUgwSkdTTElHWDZDdlNm?=
 =?utf-8?B?MEQzWHM0c3RKb3g1ZklrUGJ5L1RvZldDUUtKWkN2N3dvNW9iU0FYVzFYQXhC?=
 =?utf-8?B?aWVXbExVTzJSTUFYK1hValpDTUNzRVpMNzI4b0JhNW8za1F2ajJQT3Q0d0Vy?=
 =?utf-8?B?S0ZNcGZTcWprSVRpdHc1dSsweUJ3MEx0K05ocUZDVHlaczFhZTROZTNEalBC?=
 =?utf-8?B?a3VENXZsZGMvbUFQSHBZYStTQWJmS1NFMEU2ZlJSKy9oWG82MVh0WHJlVlNR?=
 =?utf-8?B?MCtYblhtUm1VUmdNL0pQQzJlMlhObFFHakZEbWNlT2Eza1NTZ2V3SzkycDd3?=
 =?utf-8?B?bVFnbUJ3MnBpUit2OEFTMkpsQTNpaVY5UlR5NEdOd3hFMU9HVklNQkdCbUQx?=
 =?utf-8?B?VU9oMWlnVklURHNoL2ZLc25WaFEyV2lINHFxUDJDM1plQW9JVU1tQkpwVXU5?=
 =?utf-8?B?OHBGU3lwYnZucDRZQ2hHZ3gvZ1plYWJYRzFra05UNVE4VGRMaWtKTkhkTkJm?=
 =?utf-8?B?VE9LSkErNVFOZGp5Y1lFKzY3eDFscGVVWGFiY1AycTN0RGthcmk2ZDVhZSs4?=
 =?utf-8?B?UFV0OEVFdm1JQnptZWRNZHFLUlVEcUg3NjcvZXlRTnJubWZWZi94VnR2cm5J?=
 =?utf-8?B?LzVRdFptV2czaFlpNGNhR21CcmVObFFoakdrOEJmYXlxQ3FjcXhhMHlEYXNW?=
 =?utf-8?Q?G7P0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW5PR84MB1842.NAMPRD84.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8727971b-126d-4f83-fd68-08da89523847
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2022 00:05:45.0287
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 105b2061-b669-4b31-92ac-24d304d195dc
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Lpo0mafuwh/NvnVIKTT0o1mwZqzrj1BmmAwaTgl9gIv+0p440pRE0xjb8LTLptnW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR84MB1407
X-OriginatorOrg: hpe.com
X-Proofpoint-GUID: zRh8kzzQpREHV0sHEjz2_ESvGe0tVbfZ
X-Proofpoint-ORIG-GUID: zRh8kzzQpREHV0sHEjz2_ESvGe0tVbfZ
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-28_16,2022-08-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 phishscore=0 impostorscore=0 mlxscore=0 bulkscore=0
 clxscore=1011 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208280103
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
eSA8Y2hyaXN0b3BoZS5sZXJveUBjc2dyb3VwLmV1Pg0KPiBTZW50OiBTdW5kYXksIEF1Z3VzdCAy
OCwgMjAyMiAyOjMzIEFNDQo+IFRvOiBFbGxpb3R0LCBSb2JlcnQgKFNlcnZlcnMpIDxlbGxpb3R0
QGhwZS5jb20+OyBOYXluYQ0KPiA8bmF5bmFAbGludXgudm5ldC5pYm0uY29tPjsgQW5kcmV3IERv
bm5lbGxhbiA8YWpkQGxpbnV4LmlibS5jb20+DQo+IENjOiBsaW51eHBwYy1kZXZAbGlzdHMub3ps
YWJzLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHYyIDAwLzEwXSBjcnlwdG86IEtjb25maWcg
LSBzaW1wbGlmeSBtZW51cyBhbmQgaGVscA0KPiB0ZXh0DQo+IA0KPiBIaSwNCj4gDQo+IExlIDI3
LzA4LzIwMjIgw6AgMjI6MDYsIEVsbGlvdHQsIFJvYmVydCAoU2VydmVycykgYSDDqWNyaXTCoDoN
Cj4gPiAoYWRkaW5nIENocmlzdG9waGUsIHBlcg0KPiA+IGJiYTQ5NjY1NmE3M2ZjMSAoInBvd2Vy
cGMvMzI6IEZpeCBib290IGZhaWx1cmUgd2l0aCBHQ0MgbGF0ZW50IGVudHJvcHkNCj4gcGx1Z2lu
IikNCj4gPg0KPiA+DQo+ID4gQWRkaW5nIGxpYm1wYy1kZXZlbCBnZXRzIGFsbCB0aGUgYXJjaGl0
ZWN0dXJlcyBidWlsZGluZyBleGNlcHQgcG93ZXJwYy4NCj4gPg0KPiA+IChJIGFsc28gaW5zdGFs
bGVkIGdjYy1wbHVnaW5zLWRldmVsIHRvIGdldCB0aGUgbmF0aXZlIHg4Ng0KPiA+IGJ1aWxkIHRv
IGRldGVjdCBwbHVnaW5zLikNCj4gPg0KPiA+IEhvd2V2ZXIsIHBvd2VycGMgc3RpbGwgZmFpbHMg
dG8gYnVpbGQuIFNldmVyYWwgb2YgdGhlIExpbnV4IHN0YW5kYXJkDQo+ID4gaW5jbHVkZSBmaWxl
cyBlbmQgdXAgaW5jbHVkaW5nIG5vZGVtYXNrLmgsIHdoaWNoIGluY2x1ZGVzIHJhbmRvbS5oLA0K
PiA+IHdoaWNoIGhhcyBhIHByb2JsZW0gZmluZGluZyBhIGdsb2JhbCBjYWxsZWQgbGF0ZW50X2Vu
dHJvcHkgd2hpbGUNCj4gPiBidWlsZGluZyBpbml0L21haW4ubzoNCj4gDQo+IElzbid0IGl0IGZp
eGVkIGluIG1haW5saW5lIGJ5IGNvbW1pdCAwMTJlOGQyMDM0ZjEgKCJnY2MtcGx1Z2luczoNCj4g
VW5kZWZpbmUgTEFURU5UX0VOVFJPUFlfUExVR0lOIHdoZW4gcGx1Z2luIGRpc2FibGVkIGZvciBh
IGZpbGUiKSA/DQoNClllcywgYWRkaW5nIHRoYXQgcGF0Y2ggZml4ZXMgdGhpcyBwYXJ0aWN1bGFy
IHByb2JsZW0uIFRoYW5rcyENCg0KTmV4dCB1cCBpczoNCkNhbm5vdCBmaW5kIHN5bWJvbCBmb3Ig
c2VjdGlvbiA5NDogLnRleHQuZnJlZV9pbml0bWVtLg0KaW5pdC9tYWluLm86IGZhaWxlZA0KbWFr
ZVsyXTogKioqIFsuLi9zY3JpcHRzL01ha2VmaWxlLmJ1aWxkOjI0OTogaW5pdC9tYWluLm9dIEVy
cm9yIDENCg0K
