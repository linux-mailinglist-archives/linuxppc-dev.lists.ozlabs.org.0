Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D22493A3813
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 01:46:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1LGs1JSxz2yxj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 09:46:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256 header.s=facebook header.b=opVB72hJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=fb.com
 (client-ip=67.231.153.30; helo=mx0b-00082601.pphosted.com;
 envelope-from=prvs=5795f9dab1=clm@fb.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=fb.com header.i=@fb.com header.a=rsa-sha256
 header.s=facebook header.b=opVB72hJ; dkim-atps=neutral
X-Greylist: delayed 658 seconds by postgrey-1.36 at boromir;
 Fri, 11 Jun 2021 00:05:39 AEST
Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com
 [67.231.153.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G15NM490Sz301F
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 00:05:38 +1000 (AEST)
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
 by mx0a-00082601.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ADm0sB001824; Thu, 10 Jun 2021 06:54:30 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type : content-id
 : content-transfer-encoding : mime-version; s=facebook;
 bh=tKeWZwrbZWPBqmrF8s472Q4a1fYd4dLM6zjPEUlZa8c=;
 b=opVB72hJXdjQRdwvy60NwQTGvVAtzG/KQS/g7lglALJRD3mu4a8G2E0gfZen9zvyq0Ek
 8pv5SjP68oTYlyRR88ETLHuYZ5LB2TnRM4vI57AlW4KSn/yZKBhyRAa2vs4QXKLPa0Ow
 Kg5/QvYv5AUU3t4njQsU7vPcMXk651YW4Oo= 
Received: from mail.thefacebook.com ([163.114.132.120])
 by mx0a-00082601.pphosted.com with ESMTP id 392wj37rc3-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 10 Jun 2021 06:54:30 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (100.104.98.9) by
 o365-in.thefacebook.com (100.104.94.198) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 10 Jun 2021 06:54:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mr3xKT795CmmS+fB00al6AD0cqbvvKuXK2AM1bIHsnUdUPEh0lMjPmzEbRSZCvHCFeUibUwA691Fif5Jmw5Y1eqiGyYRt1WiLRXK7cywoi7LAjb4wkhhFBhcTr7Owli17R+dCeXeIPplq9/FVgAMAebF9S+nuW1Sw2EYg3q7vP5D7qzN4huQjfcchck9HUBJiJ+BdBKiU+4Z8150OddkZrv1eCwTFeGkYUL/iu//a1UH5blO48uSTDQjW6NGIrKyQlHLs+NqocjajBZzwFl7wtWUR6XeYE3H/bkB/aRkO4RFQhQaf42uW3Jbl2x69a0t37qDMM0PTgwgxnyMTaxysA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKeWZwrbZWPBqmrF8s472Q4a1fYd4dLM6zjPEUlZa8c=;
 b=cal5FfeKtDIaUhYSQ0MVPC+AnzgMHcEE8FF6ir6XLEt+t4vu08451DBRTgDVZiqHuRfghpMj5OVRVzgqQtt75n6vaqaCgsDZPEw0o9yBXVURg9443sSyrRcflHpeD+/aLoHf/J9hhCMEkfgK6zZSuSSx7+nI3EVfGw1P6TYeornwIZORgSZghRwZSq7BUwmlxuMXxVSx6NncdUJ7PdX9FEZkdV/DQCRg+LaNjbGudRvrxAMid5XqfZyiYPnWFjnfUwqcppF0NxNwnewydz/UuTuAjgJ30rdbfckKrp6AA1mT2IfRU7qMC0elBaDqbnkG4BszGvR2anpddq6qpteAsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fb.com; dmarc=pass action=none header.from=fb.com; dkim=pass
 header.d=fb.com; arc=none
Received: from CO1PR15MB4924.namprd15.prod.outlook.com (2603:10b6:303:e3::16)
 by MWHPR15MB1375.namprd15.prod.outlook.com (2603:10b6:300:ba::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.25; Thu, 10 Jun
 2021 13:54:29 +0000
Received: from CO1PR15MB4924.namprd15.prod.outlook.com
 ([fe80::2d50:36f7:4bce:9b01]) by CO1PR15MB4924.namprd15.prod.outlook.com
 ([fe80::2d50:36f7:4bce:9b01%6]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 13:54:29 +0000
From: Chris Mason <clm@fb.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] btrfs: Disable BTRFS on platforms having 256K pages
Thread-Topic: [PATCH] btrfs: Disable BTRFS on platforms having 256K pages
Thread-Index: AQHXXgAh61zPzPytEE23ALEqr0QZPA==
Date: Thu, 10 Jun 2021 13:54:28 +0000
Message-ID: <185278AF-1D87-432D-87E9-C86B3223113E@fb.com>
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
In-Reply-To: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3654.100.0.2.22)
authentication-results: csgroup.eu; dkim=none (message not signed)
 header.d=none;csgroup.eu; dmarc=none action=none header.from=fb.com;
x-originating-ip: [2620:10d:c091:480::1:c4b0]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a296f9ab-231d-4709-5602-08d92c174438
x-ms-traffictypediagnostic: MWHPR15MB1375:
x-microsoft-antispam-prvs: <MWHPR15MB13757180DB2249244D35253DD3359@MWHPR15MB1375.namprd15.prod.outlook.com>
x-fb-source: Internal
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ayBFybNUVDIBHa+CJzWoHnHDaCKopP477vmW1w/lJaNgicKm1SUrZkWBAWGskCurZvCJc9o7fe2YnrEGTzMeOJ61wzBLbSiqHJ5hI4KG+zIsB4S3eDpM2/OcE75LQ63sdwCtjeEy4m+EAA2EaqDiRS0b/N8ZK3gXbRTYPXu3K2yT3DI3aD4FUkXy1+gWPqLsIJk9L9lq0RLXtSDRT9IFTYqy24L5WegRQElhLSxlFEskpeLNtaTzy1gV5p9xrx280Pw14kDHXnoGHlLAwFATSo/7elapeNGGKzl+JzR7nYrKcSbu1kqVoca0PAzJcPZa53ELxmr91Jw8l25hTJigg0vSWYTa6z8fr5J6T/9wmrQ6G2ZSoMWbCPREn9Fmq6JvXml2XW6dBdwQTIAgrrMcWzYGpPfHrKh9sUKiN9Uut8cJ7KDiitcI6d2JMIVhjsh7bvktJosTYABMaZuEdtbC4vE65rNxTOr+7gT1waD75MLGp6xnMxpCvC2hUZc/583ZPYIOYLt5SXTCm2KZiAbHFf84fVUDeRfwDDWhyHxdkydiP0llNoiBroQuJ4boN+Z69T1i6bpI5SgEbj2qK6DmDIs+HDPsCFj6Zjt2x+ImBNgcp3eEegqrkbMwgr4Yers4F33Nj4/uDUQEDm68dcN7yA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR15MB4924.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(366004)(396003)(39860400002)(346002)(136003)(76116006)(4326008)(91956017)(6486002)(54906003)(66446008)(66556008)(64756008)(186003)(5660300002)(66476007)(66946007)(2906002)(86362001)(53546011)(6506007)(2616005)(83380400001)(6512007)(478600001)(33656002)(8936002)(36756003)(71200400001)(4744005)(8676002)(38100700002)(122000001)(6916009)(316002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RTF0aGYybHdGVk5wTzVGTm5IZDZoMVB5NWZxeCt6OGYzbFBaek1uYk1MNW5h?=
 =?utf-8?B?MGZxOUJmUGJPZ3ZVa2RTWnVCekZTTytrVC9TTGIwNjkyY3JQeTk3aUlMRkE2?=
 =?utf-8?B?V3lPSHpjZWxuMGV3T3MrSWFrMEVTaTYxUVJMdHNWeDJkeFlhRGZQamNDVWNZ?=
 =?utf-8?B?bjdWenFBcVBnYUF3b2N4YkZOdFJNcHdEdzBDVmt4aFVkOWNWd1M3amsyWjU1?=
 =?utf-8?B?SVNjQmhGODNuQnhiQ0l4dEZCaXdvdXpYTU54Z0dSTXh0NDV0OGFCMytWU3J4?=
 =?utf-8?B?Y1FoMlhIMjJKTTR1U0ZhNnFCbXRqZ0UrRGFTdFN5eEZNVTMxbk1SVndFc0c0?=
 =?utf-8?B?d0N1cmxkamZzU3JFNzZOZm05L0pWeUl4U0VzWXh2Um1ITkZIV1pEUWFzZzF5?=
 =?utf-8?B?aE9xMjJ0d3hZUVIyVWJGd2ZOeUw5OWZITlZUbjdJblhwSHk0VVloV1RWZ1dT?=
 =?utf-8?B?YlFVVEkybDZSRFdYa0c1S2pGd1k4YmNiZHVDUWs1ZHRmMkJCWHQ1Q2VSYVpv?=
 =?utf-8?B?NTFrcE9uSzN6ZnNTb2dVeHM4VDJ2Tkd4Ym5rdDFTOG02T21Uc3FBYm5UbXJ5?=
 =?utf-8?B?ay93R0JLd3J1dWY1YnlrTW05RWVVOEhTdnF6Z1N5UGJ6d2RwOHhRc1o3NHR0?=
 =?utf-8?B?M0lBU1o0dldmc253bWpkNjhxOS9TY01RYzNMT1p6bVRKR1lLdVJsWlVIQm9o?=
 =?utf-8?B?SC9HSHBZVVF4YnpFNEpKVzFZQXFaSGM2d0NTb21EVUtFNDY2dHRqYTVZclBO?=
 =?utf-8?B?ZTlXQjdMT3RZdXRTZTZ2VUViMFhUenFwSWYrcXh5aHBVZEQ2TzVTMGFMVk9N?=
 =?utf-8?B?WXdKNkdRWDJPWFFEUjRNS0pHNkZlaWF1WUpVMjUxSW10MVNlRUFiTXU1aUZx?=
 =?utf-8?B?Y0FlNHRsZmpIcDc5cmp5VXE3VEt4LzJZQitRRVI3TEFhOXBIVldJRnpSOUZ2?=
 =?utf-8?B?TVBxKyszOVQ1K1d3Z014enJOQnE0a0dobkdyZndVbm5Cd2R0UGhWcE0xWnRQ?=
 =?utf-8?B?Mkg3ajJVS2ZTcHZ3ZDl6Q3ExeXQ1M3JIc1l3SVFidDV4dmhpYUxVUzNQZGFQ?=
 =?utf-8?B?QmpydENuR0hlT2J5dGR6cCtrYVVrb2N0ei93aGlmRGZ3Q0FTSzJDa3MrN2JD?=
 =?utf-8?B?UzhDdUxDQ0Y1bzJpdUphaGVqZ0FGTHo3d0J0cGhubk9ZTk1XcFVjK1ZxYjZu?=
 =?utf-8?B?Zmg3RVZoeERXZGEySmZVUEJXWHF0eG9kRFBsUm9GaVFWQW50RERVTzF3WHZ5?=
 =?utf-8?B?VzMvS0dtNnZGMXBTeWlwckJGSlllcCtHeE9yUzV4cThIRktjbzNUY0ZFRWJB?=
 =?utf-8?B?d1BXWENVM3JwbDVPOEZkVmFZOU44ZHlESit3UTd4M3RadXNVYzdlck9KQnFP?=
 =?utf-8?B?YlhIMTBsQmVFdGdscElWV3AxeDVhZG1xamFEMWVRMkUxM3MvSm1HYm9aTnRN?=
 =?utf-8?B?UHYvbzB2RnV3Z0tEZVRybXdoMWtrTHpnL2Fkdm5iWlpULzU2T2taeFlHeUUz?=
 =?utf-8?B?VjE5RXQ4bXJBVlQ3QlB2OW5ISlBSUVVKK2tBdlZrdVRXRjZzZlA2bTl2VWNr?=
 =?utf-8?B?MXV4OVdtemdXcEtwaXVUSmpzRzh6a202NWVOSDhBbGZsUVM0QmhlZlFvQmM3?=
 =?utf-8?B?WmFlODMxWTl6SitaY3hvNGVQQnhMRXJEQ1BUWWN3cWpwazA3VkQ0TjlwaFVI?=
 =?utf-8?B?NzNzNXRGM1pYMmF5bVBET1M2aHFCS3JWUmRZekVjRUJMckRQUXNHa1RhVFU2?=
 =?utf-8?B?YjNzZmw3NGk1UGJ6VFpWR3orYWZ5Mk1KS0MrZzdvdU9keEJPWkZsd29QNXJN?=
 =?utf-8?Q?QZld4SP5mrcqQdAr2WPqD6YfpaWGEDvRJ6WhQ=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <8C74CC486588ED45B87C30682826B4BF@namprd15.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CO1PR15MB4924.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a296f9ab-231d-4709-5602-08d92c174438
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 13:54:28.8425 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ae927fe-1255-47a7-a2af-5f3a069daaa2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5ka7H7RVXvbQhmpBuFBTEDlnzPca77He9v9Tmd7fbTthAAKaOun0vBRwDBbJ9qCP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR15MB1375
X-OriginatorOrg: fb.com
X-Proofpoint-GUID: FYzy0Bnet3FGnI3-X3WMmxlWHTnM3XEO
X-Proofpoint-ORIG-GUID: FYzy0Bnet3FGnI3-X3WMmxlWHTnM3XEO
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-10_07:2021-06-10,
 2021-06-10 signatures=0
X-Proofpoint-Spam-Details: rule=fb_default_notspam policy=fb_default score=0
 impostorscore=0
 malwarescore=0 mlxscore=0 clxscore=1011 phishscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104190000 definitions=main-2106100090
X-FB-Internal: deliver
X-Mailman-Approved-At: Fri, 11 Jun 2021 09:46:17 +1000
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
Cc: "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>,
 Josef Bacik <josef@toxicpanda.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Sterba <dsterba@suse.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 linux-btrfs <linux-btrfs@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQo+IE9uIEp1biAxMCwgMjAyMSwgYXQgMToyMyBBTSwgQ2hyaXN0b3BoZSBMZXJveSA8Y2hyaXN0
b3BoZS5sZXJveUBjc2dyb3VwLmV1PiB3cm90ZToNCj4gDQo+IFdpdGggYSBjb25maWcgaGF2aW5n
IFBBR0VfU0laRSBzZXQgdG8gMjU2SywgQlRSRlMgYnVpbGQgZmFpbHMNCj4gd2l0aCB0aGUgZm9s
bG93aW5nIG1lc3NhZ2UNCj4gDQo+IGluY2x1ZGUvbGludXgvY29tcGlsZXJfdHlwZXMuaDozMjY6
Mzg6IGVycm9yOiBjYWxsIHRvICdfX2NvbXBpbGV0aW1lX2Fzc2VydF83OTEnIGRlY2xhcmVkIHdp
dGggYXR0cmlidXRlIGVycm9yOiBCVUlMRF9CVUdfT04gZmFpbGVkOiAoQlRSRlNfTUFYX0NPTVBS
RVNTRUQgJSBQQUdFX1NJWkUpICE9IDANCj4gDQo+IEJUUkZTX01BWF9DT01QUkVTU0VEIGJlaW5n
IDEyOEssIEJUUkZTIGNhbm5vdCBzdXBwb3J0IHBsYXRmb3JtcyB3aXRoDQo+IDI1NksgcGFnZXMg
YXQgdGhlIHRpbWUgYmVpbmcuDQo+IA0KPiBUaGVyZSBhcmUgdHdvIHBsYXRmb3JtcyB0aGF0IGNh
biBzZWxlY3QgMjU2SyBwYWdlczoNCj4gLSBoZXhhZ29uDQo+IC0gcG93ZXJwYw0KPiANCj4gRGlz
YWJsZSBCVFJGUyB3aGVuIDI1NksgcGFnZSBzaXplIGlzIHNlbGVjdGVkLg0KPiANCg0KV2XigJls
bCBoYXZlIG90aGVyIHN1YnBhZ2UgYmxvY2tzaXplIGNvbmNlcm5zIHdpdGggMjU2SyBwYWdlcywg
YnV0IHRoaXMgQlRSRlNfTUFYX0NPTVBSRVNTRUQgI2RlZmluZSBpcyBhcmJpdHJhcnkuICBJdOKA
mXMganVzdCB0cnlpbmcgdG8gaGF2ZSBhbiB1cHBlciBib3VuZCBvbiB0aGUgYW1vdW50IG9mIG1l
bW9yeSB3ZeKAmWxsIG5lZWQgdG8gdW5jb21wcmVzcyBhIHNpbmdsZSBwYWdl4oCZcyB3b3J0aCBv
ZiByYW5kb20gcmVhZHMuDQoNCldlIGNvdWxkIGNoYW5nZSBpdCB0byBtYXgoUEFHRV9TSVpFLCAx
MjhLKSBvciBqdXN0IGJ1bXAgdG8gMjU2Sy4NCg0KLWNocmlzDQoNCg==
