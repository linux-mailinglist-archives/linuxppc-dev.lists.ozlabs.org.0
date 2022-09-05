Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BA465ACB10
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 08:36:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLf0y0Phjz30B1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 16:36:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kqv6qBk/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=40.107.9.58; helo=fra01-mr2-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector1 header.b=kqv6qBk/;
	dkim-atps=neutral
Received: from FRA01-MR2-obe.outbound.protection.outlook.com (mail-eopbgr90058.outbound.protection.outlook.com [40.107.9.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLf0774mJz2xHP
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 16:35:18 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bggeVvylTi4TZl2EeUSebXdtNPc1g7ckPP39k7do89e+v/+hU7TFttv1kbjJjoqJ1LPdm+ce7eA6LR4id5rR3ZlleIQyIa28aTZtFlmGnQTTFvYi5cN/kxFZobVITd7SRfNqNlaNnNOJRcjwsiij8hlT0A78ripf8q/aDpMysiIOZ+41lFGnTG/MK/XHB9Te/9t5akBwRx6bY85r/ka+R8dHOc2A8NXCOnh0yzNIkvfAYXB/eWnyHKvHaHVZgcMGbeMPnvzfoIzgJzLCAW+Bcw8Dl0i5Wk6U6fXPqNkP1Nmxbnw8HlBBfEDGOi7CIap/X/PWrFwxr5LY4fN3eNSEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uB163Gl5xR3MqRjH9Ij4vmvkb2E84Ydi+pfHvcMP8wg=;
 b=boWmWhIQudMROhhI22G8UeWEcnXYqRH3jI8VpsimTputnw4nTINVPi/mnwi3Njq6ukFSYmN7R4GfpEBWkSFvPdZQny5cav4EYDS735jzP+cYoCCT59CyFWkei5pmkx6E5LWRbjnGg6bRhjf/inyROs/R2+FIEWmQSjS4FTWxl4w8Rijj/3q2oj07hRLeloLmryCZOhit8qNaMxlgsznEqKccCpKU0/Zu3xKpzgVg/JbYBp3MiYmVKoLw8L5/tw6ephr9WC6vhTR1SR70/6VRUl5WxQu6tm9ACQfZ17iU/sOkROm3K2xcBgx73jZZid+3mAww5aMqRW4VlJfT7nCCAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uB163Gl5xR3MqRjH9Ij4vmvkb2E84Ydi+pfHvcMP8wg=;
 b=kqv6qBk/QRZSIo/ykXQkq6r0yNudLFtG22ZT472s/fQEsTbcyR7Z5FnSArjk3UIyDv/H+yCafq3iUSDJreUX6Q+8iYOxC1couwqiKT3Jtq5cKlONb3B1modiNPMuAKIefHia3I5AYr7DngqiqDIcSXc6OpYKFWPAHpxAW7giFp0SYCT4LtSv7tD7Op+WSSPAiSpsym1edowAUCoOo/sMiM0v1wpBFz7TJpYSNw2xAZqiXYdeSmOFClyGRS9ZjusFpES3RgPeMn6OruI4yGEjkpaBZe3gsKeP2u6PL7gjqOp8UTm/g3vtdguSXC8/rPvthI8eGvrxKs+GGnjvQeFRzw==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Mon, 5 Sep
 2022 06:34:58 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::382a:ed3b:83d6:e5d8%4]) with mapi id 15.20.5588.018; Mon, 5 Sep 2022
 06:34:58 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Mike Kravetz <mike.kravetz@oracle.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>, "linux-ia64@vger.kernel.org"
	<linux-ia64@vger.kernel.org>
Subject: Re: [PATCH v2] hugetlb: simplify hugetlb handling in follow_page_mask
Thread-Topic: [PATCH v2] hugetlb: simplify hugetlb handling in
 follow_page_mask
Thread-Index: AQHYvv7VVIJRm5KfR0+izK3SxzvQga3QZT2A
Date: Mon, 5 Sep 2022 06:34:57 +0000
Message-ID: <3a65e455-ce68-30e2-6e1b-fb8a1917b40d@csgroup.eu>
References: <20220902190357.469512-1-mike.kravetz@oracle.com>
In-Reply-To: <20220902190357.469512-1-mike.kravetz@oracle.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ba719aa8-1c28-42ba-17cc-08da8f08c093
x-ms-traffictypediagnostic: MR1P264MB3140:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  rr6164mDeOnZW7vT13DBHXzUfX8wMgeo9OlSx9w8ruIlDYcf7q3+f6lLZl7Y2YPmhkswRO6/9PeectrZXje0eEg3kEwVqr29sNyCAue3RGBstrPaiZAhGWsYkC50yT56lphkmypN8h9lby3wsJ3PR2V1xO2qRW354Wt9v0fAZDTorK9TVJT7sQN+7hKAMYNeY5/sFnh3xpy3V4QmXKn+PvTSmQq8vHl+tRwMJD3FxFdfX+/MJ1u5cGhPcrRJfrLaRSlTyHvDT8V7NEexI5U0TJSi9rgk/gjL0whj+wpfHxqzyd9KY7UQCJDWGfLs5q5dmZ6vR0bmFPBy0le/NQVmBmhWxlk87SdwMOWofudvYKQkmV+eURfK9zRZc7MBs3WvAjxRW4IhgLdFt+WfgF1rvkMrGxSPEQdqx7E54NhgIoIHp6OphlvsXt18iXTgn6YiUuBLasuT0PkELBjGiYHFQJ8KJ1Oio895/ZQ7EjRZywThtPxSXW3vinVCFcC1BecVxO7DGaSS1fxV/Sut3hl7CzjdRi5NufQNgzBPuuEj29yLttexSI9MT4NiGcCcxAcnyOZ4IQgrungX0lFUd/7fOUVaUcAY3R1PPRPAMX9OTNXl4yiWnhzfTqqKsLHQlB55FQwsNJcs1T+XVKem2uYeLGnD1oNbIM7tEsF3RTGujEWjumdDdiMdChmuqENi4dDyOnzpB1OlkPibaoTPuKGkBa1WqKuOVlR5m7z5wFweA0rsil3uB2UpSU07HxDBMzmVdN54Zxh/3Jm1yW8pyLwWKOrHQ3t9nJcrqLPi6ABYIc0IazQ972BvzVvl+MK4gb4XrFOj7T9qdsAB8HU6uvQ5hKPBD6jTlyrX6Q51Y5bgxRo=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(376002)(396003)(346002)(136003)(39850400004)(54906003)(76116006)(66476007)(66446008)(66556008)(4326008)(66946007)(8676002)(316002)(110136005)(91956017)(64756008)(83380400001)(31696002)(36756003)(86362001)(31686004)(6512007)(26005)(2616005)(186003)(44832011)(2906002)(38070700005)(7416002)(8936002)(5660300002)(38100700002)(478600001)(71200400001)(6506007)(41300700001)(966005)(6486002)(122000001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QXhMNEJnQ3ZmakNnQ0lKRitmRUlUbjV5QldrZVZSYSs2Um9xb0p5NC9MZ2NP?=
 =?utf-8?B?TDA5RGV1YXMzalJSa3kydlZHRWx6N1MzM3ZQOTA5bVdCR0FJa3VhV3ovaE43?=
 =?utf-8?B?THp1MDRQT2c5bkFCbkFBdDAweE5YSjVUa0JhTjd2b2lqM2ZMWHArUVg2aCsy?=
 =?utf-8?B?cWtIQkRyUlRLNXFucGRoem1UdjlxbE9uMERQOXFIN1ZMZ3dORzZaUjBvajQw?=
 =?utf-8?B?dGFzcUdCVS9zd01OMVhOcTUrODhwZnVaVWxHcTI0RlRnOWlHcFdJN1VRZUNF?=
 =?utf-8?B?MVdXTjcvbkxLOC9oSXhrRzNZa2hub0ZETUozMEtxeE5HNExLdlN0V3hrQ0ZJ?=
 =?utf-8?B?NSszUjBNWXRDd1NqdExIWnkrVjh5a1JwdHNUelRlRGtZejRlMkQwVXI1K3Zh?=
 =?utf-8?B?VjFLaXBnWFA0SXF1QTBxUnloMDNCdFNMQUVkRzlXYXduYkRhRmtBYitBd0sw?=
 =?utf-8?B?WGVOaDZkVXZuU0VSeUQrMnNtWHdTeDZHTngrOHhSaE5rbnBmSnMvK1lUcFBB?=
 =?utf-8?B?RXZTV0o3QmNlZTJoVjl1OW5sbnlNM3k0RXVJbTFHc2U3VUJLdnl3dXVxZ2Iw?=
 =?utf-8?B?VGNaYkJxbVFYNFlNSUROeWpONUpaam9iZkxvY0pHNXFJSHlsaTZEZjRaOUhH?=
 =?utf-8?B?eUZNMzJZYzAxWFdnT3dhRm5XS0V0VVhGN2ZMaWc5Y1VHWUZTWDgvN2VhT2sw?=
 =?utf-8?B?NTkvb3BqZlJCV0oyU0hIWTNsSFlTV0hpL05MbUNtODdNQkVWU1RVMGh5S1dT?=
 =?utf-8?B?TXNmUXY4LytyTk5CMytESzQ2UDdqL2VuUjg2eUpvY1F5M0VrV3RBU0ZLSkQx?=
 =?utf-8?B?R25GcUNneW04QThBRHp1c09VcTEyMWQrdFBYWHBJcmlRQVlVWE9hd3RORVlv?=
 =?utf-8?B?QjhidUJoNytkQ1BDSEE4blZYcUNKekhxZDhpZTlSWkRSZTRuQzI5VEQxeitp?=
 =?utf-8?B?RTV1REtvVFJ0UWZNSXQwV1BJSHpEbGcyNzJGZGtISXB4cytSK0czUU5neEQr?=
 =?utf-8?B?VS9jTXlLMWV3S1dMRGdLMzB2b0tsRVV0THd6dDJRNG01WXNhcjR3U2tTRVNj?=
 =?utf-8?B?VlJ1VlBwU3dFSGpHNnJ1ajVDWFlRbHE0SFJTeGdJL3NmV21oWnpmeUFYQnRn?=
 =?utf-8?B?SWxzQjIraTdBbDRlZlFCWjhVZExGYjUvVmQzOU1lWVc2TkZ6Y0pOZGN6NWVF?=
 =?utf-8?B?TFBLblBIZkkwWlpWZ0diUk40K0JQc1BGbHladnBtRjNVdmRLOE83OGZ1UzhF?=
 =?utf-8?B?YStNNU5DSS9MU3dYdzhtbXBnOG1wVWE4aFNvVmR2TXFlaXdFWThDYUNZNU4x?=
 =?utf-8?B?Si9VcW9PZ3Q0N1JFSHlPTTd3NHRHeC9oQURmNHNORDNVWXpaczBkR3VWUDZO?=
 =?utf-8?B?dU5wK05PbjB4MFdSRlhqQllZWE9KK3dRaS9VOUJ5d0lTSEYzUU9kdG12eUpm?=
 =?utf-8?B?TVF1Q3hGU1pRVGczamtka2R1aVMrMi9YVUpDc3JVR0tKRTdBQ0hST01RSWdz?=
 =?utf-8?B?SXFQeEFXY3VmUW9YdXBjMEszeVk1OU5GdzgzMzY2UVVjWXFvbGhyUXBpaUhC?=
 =?utf-8?B?dHgyWEExYVJXamF1amlINnRuTE5sejhvOFN3eE1kTzI0V1BnMWlOdVVibGZB?=
 =?utf-8?B?YXRDek9xaCtzeDJIVm1hSmR4dXhhQTlEcXgrRVc5NjhtaUlNMU1aQURTR2c3?=
 =?utf-8?B?M05pdkM4RC9hS3luakk5RW1KREZKbkRLSERoa29nb1BoNEN5ZHRydVNCOHQ4?=
 =?utf-8?B?ekxkR29qQzRvQWdkMEs3UjhkZEV0MHZkVHh2TkdiWDYvdVJidkVFcC9rdzVn?=
 =?utf-8?B?MTJMeEZjNFBvbU1QUUxmY2l0MmJRRzhLdytJTUNheExFa0JBcUR1VVR0RzRY?=
 =?utf-8?B?cFlCRzJHVmNRWFVrQzBTb2tuaHZIS25TZ1B4dmdBdGpRM3ZmKzNpalRRYXhF?=
 =?utf-8?B?WUlQSEpTd1lrdndKRUZXVzMyekJQbTVuMXg1aXIxY1pMd3I5d2JLQXduSVFW?=
 =?utf-8?B?L05WckhzOFVnc2VoZENaNlNCT2luWHdVMFUxbUNtenlOQ0kvM2dHOFVxc2RK?=
 =?utf-8?B?azdGcUg5VzVWb0JZbkduM0xyYTFKbkNZOEt6VXVCWDdjdkJvT3JaNVVnRVN4?=
 =?utf-8?B?emEyWTNDMFJLMmlidEo0YlJBRi8xa2ljNVREV2FSSFpzYVdlaUU5aUZsNjJ0?=
 =?utf-8?B?dnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9BBB78F39C2ED3409C01876ED88A7F9C@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: ba719aa8-1c28-42ba-17cc-08da8f08c093
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2022 06:34:57.9097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oMwN5C7fa3yzlUt6GIpMg/RoqM/+44pxYZ+3+o96i/lTESQCdiC1BMlIAK6NGpkGQdMjgD+n5sjFAlGhSys/Da4Vw/OLXfz+j2AYZ8NfeRE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB3140
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
Cc: David Hildenbrand <david@redhat.com>, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, Muchun Song <songmuchun@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, Naoya Horiguchi <naoya.horiguchi@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDAyLzA5LzIwMjIgw6AgMjE6MDMsIE1pa2UgS3JhdmV0eiBhIMOpY3JpdMKgOg0KPiBE
dXJpbmcgZGlzY3Vzc2lvbnMgb2YgdGhpcyBzZXJpZXMgWzFdLCBpdCB3YXMgc3VnZ2VzdGVkIHRo
YXQgaHVnZXRsYg0KPiBoYW5kbGluZyBjb2RlIGluIGZvbGxvd19wYWdlX21hc2sgY291bGQgYmUg
c2ltcGxpZmllZC4gIEF0IHRoZSBiZWdpbm5pbmcNCj4gb2YgZm9sbG93X3BhZ2VfbWFzaywgdGhl
cmUgY3VycmVudGx5IGlzIGEgY2FsbCB0byBmb2xsb3dfaHVnZV9hZGRyIHdoaWNoDQo+ICdtYXkn
IGhhbmRsZSBodWdldGxiIHBhZ2VzLiAgaWE2NCBpcyB0aGUgb25seSBhcmNoaXRlY3R1cmUgd2hp
Y2ggcHJvdmlkZXMNCj4gYSBmb2xsb3dfaHVnZV9hZGRyIHJvdXRpbmUgdGhhdCBkb2VzIG5vdCBy
ZXR1cm4gZXJyb3IuICBJbnN0ZWFkLCBhdCBlYWNoDQo+IGxldmVsIG9mIHRoZSBwYWdlIHRhYmxl
IGEgY2hlY2sgaXMgbWFkZSBmb3IgYSBodWdldGxiIGVudHJ5LiAgSWYgYSBodWdldGxiDQo+IGVu
dHJ5IGlzIGZvdW5kLCBhIGNhbGwgdG8gYSByb3V0aW5lIGFzc29jaWF0ZWQgd2l0aCB0aGF0IGVu
dHJ5IGlzIG1hZGUuDQo+IA0KPiBDdXJyZW50bHksIHRoZXJlIGFyZSB0d28gY2hlY2tzIGZvciBo
dWdldGxiIGVudHJpZXMgYXQgZWFjaCBwYWdlIHRhYmxlDQo+IGxldmVsLiAgVGhlIGZpcnN0IGNo
ZWNrIGlzIG9mIHRoZSBmb3JtOg0KPiAgICAgICAgICBpZiAocD9kX2h1Z2UoKSkNCj4gICAgICAg
ICAgICAgICAgICBwYWdlID0gZm9sbG93X2h1Z2VfcD9kKCk7DQo+IHRoZSBzZWNvbmQgY2hlY2sg
aXMgb2YgdGhlIGZvcm06DQo+ICAgICAgICAgIGlmIChpc19odWdlcGQoKSkNCj4gICAgICAgICAg
ICAgICAgICBwYWdlID0gZm9sbG93X2h1Z2VfcGQoKS4NCj4gDQo+IFdlIGNhbiByZXBsYWNlIHRo
ZXNlIGNoZWNrcywgYXMgd2VsbCBhcyB0aGUgc3BlY2lhbCBoYW5kbGluZyByb3V0aW5lcw0KPiBz
dWNoIGFzIGZvbGxvd19odWdlX3A/ZCgpIGFuZCBmb2xsb3dfaHVnZV9wZCgpIHdpdGggYSBzaW5n
bGUgcm91dGluZSB0bw0KPiBoYW5kbGUgaHVnZXRsYiB2bWFzLg0KPiANCj4gQSBuZXcgcm91dGlu
ZSBodWdldGxiX2ZvbGxvd19wYWdlX21hc2sgaXMgY2FsbGVkIGZvciBodWdldGxiIHZtYXMgYXQg
dGhlDQo+IGJlZ2lubmluZyBvZiBmb2xsb3dfcGFnZV9tYXNrLiAgaHVnZXRsYl9mb2xsb3dfcGFn
ZV9tYXNrIHdpbGwgdXNlIHRoZQ0KPiBleGlzdGluZyByb3V0aW5lIGh1Z2VfcHRlX29mZnNldCB0
byB3YWxrIHBhZ2UgdGFibGVzIGxvb2tpbmcgZm9yIGh1Z2V0bGINCj4gZW50cmllcy4gIGh1Z2Vf
cHRlX29mZnNldCBjYW4gYmUgb3ZlcndyaXR0ZW4gYnkgYXJjaGl0ZWN0dXJlcywgYW5kIGFscmVh
ZHkNCj4gaGFuZGxlcyBzcGVjaWFsIGNhc2VzIHN1Y2ggYXMgaHVnZXBkIGVudHJpZXMuDQo+IA0K
PiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtbW0vY292ZXIuMTY2MTI0MDE3MC5n
aXQuYmFvbGluLndhbmdAbGludXguYWxpYmFiYS5jb20vDQo+IA0KPiBTdWdnZXN0ZWQtYnk6IERh
dmlkIEhpbGRlbmJyYW5kIDxkYXZpZEByZWRoYXQuY29tPg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWtl
IEtyYXZldHogPG1pa2Uua3JhdmV0ekBvcmFjbGUuY29tPg0KPiAtLS0NCj4gdjIgLQlBZGRlZCBX
QVJOX09OX09OQ0UoKSBhbmQgdXBkYXRlZCBjb21tZW50IGFzIHN1Z2dlc3RlZCBieSBEYXZpZA0K
PiAJRml4ZWQgYnVpbGQgaXNzdWUgZm91bmQgYnkga2VybmVsIHRlc3Qgcm9ib3QNCj4gCUFkZGVk
IHZtYSAocG1kIHNoYXJpbmcpIGxvY2tpbmcgdG8gaHVnZXRsYl9mb2xsb3dfcGFnZV9tYXNrDQo+
IAlSZUJhc2VkIG9uIEJhb2xpbidzIHBhdGNoIHRvIGZpeCBpc3N1ZXMgd2l0aCBDT05UXyogZW50
cmllcw0KPiANCj4gICBhcmNoL2lhNjQvbW0vaHVnZXRsYnBhZ2UuYyAgICB8ICAxNSAtLS0NCj4g
ICBhcmNoL3Bvd2VycGMvbW0vaHVnZXRsYnBhZ2UuYyB8ICAzNyAtLS0tLS0tDQo+ICAgaW5jbHVk
ZS9saW51eC9odWdldGxiLmggICAgICAgfCAgNTEgKystLS0tLS0tLQ0KPiAgIG1tL2d1cC5jICAg
ICAgICAgICAgICAgICAgICAgIHwgIDgwICsrKy0tLS0tLS0tLS0tLQ0KPiAgIG1tL2h1Z2V0bGIu
YyAgICAgICAgICAgICAgICAgIHwgMTgyICsrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0NCj4gICA1IGZpbGVzIGNoYW5nZWQsIDg3IGluc2VydGlvbnMoKyksIDI3OCBkZWxldGlvbnMo
LSkNCj4gDQoNCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaHVnZXRsYi5oIGIvaW5jbHVk
ZS9saW51eC9odWdldGxiLmgNCj4gaW5kZXggZmU0OTQ0Zjg5ZDM0Li4yNzVlNTU0ZGQzNjUgMTAw
NjQ0DQo+IC0tLSBhL2luY2x1ZGUvbGludXgvaHVnZXRsYi5oDQo+ICsrKyBiL2luY2x1ZGUvbGlu
dXgvaHVnZXRsYi5oDQo+IEBAIC0yNjQsNiArMjU1LDEzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBh
ZGp1c3RfcmFuZ2VfaWZfcG1kX3NoYXJpbmdfcG9zc2libGUoDQo+ICAgew0KPiAgIH0NCj4gICAN
Cj4gK3N0YXRpYyBpbmxpbmUgc3RydWN0IHBhZ2UgKmh1Z2V0bGJfZm9sbG93X3BhZ2VfbWFzayhz
dHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gKwkJCQl1bnNpZ25lZCBsb25nIGFkZHJlc3Ms
IHVuc2lnbmVkIGludCBmbGFncykNCj4gK3sNCj4gKwlXQVJOX09OX09OQ0UoMSk7IC8qIHNob3Vs
ZCBuZXZlciBiZSBjYWxsZWQgaWYgIUNPTkZJR19IVUdFVExCX1BBR0UqLw0KPiArCXJldHVybiBF
UlJfUFRSKC1FSU5WQUwpOw0KDQpUaGlzIGZ1bmN0aW9uIGlzIGNhbGxlZCBvbmx5IHdoZW4gaXNf
dm1faHVnZXRsYl9wYWdlKCkgaXMgdHJ1ZS4NCg0KV2hlbiAhQ09ORklHX0hVR0VUTEJfUEFHRSBp
c192bV9odWdldGxiX3BhZ2UoKSBhbHdheXMgcmV0dXJucyBmYWxzZSwgc28gDQp0aGUgY2FsbCB0
byBodWdldGxiX2ZvbGxvd19wYWdlX21hc2soKSBzaG91bGQgbmV2ZXIgYmUgY29tcGlsZWQgaW4u
DQoNClVzZSBCVUlMRF9CVUcoKSB0byBjYXRjaCBpdCBhdCBidWlsZHRpbWUuDQoNCj4gK30NCj4g
Kw0KPiAgIHN0YXRpYyBpbmxpbmUgbG9uZyBmb2xsb3dfaHVnZXRsYl9wYWdlKHN0cnVjdCBtbV9z
dHJ1Y3QgKm1tLA0KPiAgIAkJCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCBzdHJ1Y3QgcGFn
ZSAqKnBhZ2VzLA0KPiAgIAkJCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqKnZtYXMsIHVuc2lnbmVk
IGxvbmcgKnBvc2l0aW9uLA0KDQo+IGRpZmYgLS1naXQgYS9tbS9ndXAuYyBiL21tL2d1cC5jDQo+
IGluZGV4IDc2OTFjNjUyMzNjMy4uMTUxNTg5MmE5ZDk4IDEwMDY0NA0KPiAtLS0gYS9tbS9ndXAu
Yw0KPiArKysgYi9tbS9ndXAuYw0KPiBAQCAtNTMwLDE4ICs1MzAsNiBAQCBzdGF0aWMgc3RydWN0
IHBhZ2UgKmZvbGxvd19wYWdlX3B0ZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwNCj4gICAJ
aWYgKFdBUk5fT05fT05DRSgoZmxhZ3MgJiAoRk9MTF9QSU4gfCBGT0xMX0dFVCkpID09DQo+ICAg
CQkJIChGT0xMX1BJTiB8IEZPTExfR0VUKSkpDQo+ICAgCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFM
KTsNCj4gLQ0KPiAtCS8qDQo+IC0JICogQ29uc2lkZXJpbmcgUFRFIGxldmVsIGh1Z2V0bGIsIGxp
a2UgY29udGludW91cy1QVEUgaHVnZXRsYiBvbg0KPiAtCSAqIEFSTTY0IGFyY2hpdGVjdHVyZS4N
Cj4gLQkgKi8NCj4gLQlpZiAoaXNfdm1faHVnZXRsYl9wYWdlKHZtYSkpIHsNCj4gLQkJcGFnZSA9
IGZvbGxvd19odWdlX3BtZF9wdGUodm1hLCBhZGRyZXNzLCBmbGFncyk7DQo+IC0JCWlmIChwYWdl
KQ0KPiAtCQkJcmV0dXJuIHBhZ2U7DQo+IC0JCXJldHVybiBub19wYWdlX3RhYmxlKHZtYSwgZmxh
Z3MpOw0KPiAtCX0NCj4gLQ0KPiAgIHJldHJ5Og0KPiAgIAlpZiAodW5saWtlbHkocG1kX2JhZCgq
cG1kKSkpDQo+ICAgCQlyZXR1cm4gbm9fcGFnZV90YWJsZSh2bWEsIGZsYWdzKTs=
