Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF256A563C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 11:04:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PQtJL2ZmWz3c8n
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Feb 2023 21:04:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256 header.s=selector1 header.b=i7PsvEb9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=infinera.com (client-ip=2a01:111:f400:7ea9::619; helo=nam02-sn1-obe.outbound.protection.outlook.com; envelope-from=joakim.tjernlund@infinera.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=infinera.com header.i=@infinera.com header.a=rsa-sha256 header.s=selector1 header.b=i7PsvEb9;
	dkim-atps=neutral
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7ea9::619])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PQtHL0ghGz30QD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Feb 2023 21:03:39 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADRChCE/HTGrLKtv9c8CYDvemQpb/Il79ijPuX++Ipm7HE5F86Bf7aGm2vqfk65Yr1odjFn9E2Zz/mqfxZXeFtp8IPLC6z9+1hNcx4uSn2zYaKMIf6TkmG71bdE+MR8wx0QjphIs/e+YKDSBAAkFjU6nZ9ZHYdz8uPjCxKlVgy9vbFicZ7JHrtlpvNXHYW3ICQSRjT0pufiiI+8Nua3b3R5vFR6XchcbpKj8HLc6Tx52SlF6RRuyXf/yIo4qUS92lGYgvdekGu/JEq8xQvUpriX5GomCPyuYVYxOCxYwVuqwi12LrSnyhPAG16hqyKJxtkObpOb2k4VvqC9eUyaDxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8qDbPEL2Asv6y2i7/kHRYG71d/KwS1uyhbx9d7RrCqQ=;
 b=HRPZNjBtrn/XnEXo+MP5DHG89tYbjAvbxVLHOhFCq5aul/mA5Ijf+ztIiZxJB0hqNuUe2aQ5UnZpoXEnfX2ujtIZzPq+7IdMAk2URJp5ftCy5xNS5LDP0NmII7lK0RC3TOf2PxZKcXiJaoBAXAH9m5wdQQWTR48fpycaAKFNMm+hOx6qva6yWX8IArvxos7oE8zYluShAsHFLfmA3AR7rUc1VgxIrKe5xpN2jUyFX2Onrx2CmWZLQx9EKWeK34PXuYh9m5FuZBA53FGetS/OmD2vTeObYx06IrsyqvHsde/JZzlpyoWiDsl722XYB/ePIPEa2HIuZvWhKM1PAP+hfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=infinera.com; dmarc=pass action=none header.from=infinera.com;
 dkim=pass header.d=infinera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=infinera.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8qDbPEL2Asv6y2i7/kHRYG71d/KwS1uyhbx9d7RrCqQ=;
 b=i7PsvEb9pWFLW97UmZrYQ5tj2uUqKl2b0HgUSl8KNROTz74C7sNDtPVd6SQEJaJWoQB1oBeTqExWazmlZMdcS1AemSkBdqAXorSQQjJhD43MtZOjrE5x0XW3kQNUrl07uXsh4dYof9J6s2u5tP0uHcOz0xhA8VD3RAowKj/o3he5MO8G4wspH5n4W2WPuJAkAqmFoYd2hYI40+O/m2PTeEoG7yuprr4ddM8zyCkZ59KBT/+A6UalhdSEVm2TPGFS8e0C5V4IG2nyjAMMWaGfO4Jjjp3uDWQTzZ0MOCYYdIDD78s0uEs8/Wn7HaYuSur8bM7i1oMEih9aUL8I7BVHQg==
Received: from PH0PR10MB4615.namprd10.prod.outlook.com (2603:10b6:510:36::24)
 by BLAPR10MB5203.namprd10.prod.outlook.com (2603:10b6:208:30d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.17; Tue, 28 Feb
 2023 10:03:19 +0000
Received: from PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171]) by PH0PR10MB4615.namprd10.prod.outlook.com
 ([fe80::fffc:c9c8:7e24:7171%5]) with mapi id 15.20.6156.017; Tue, 28 Feb 2023
 10:03:19 +0000
From: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>
To: "leoyang.li@nxp.com" <leoyang.li@nxp.com>, "paul.gortmaker@windriver.com"
	<paul.gortmaker@windriver.com>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Thread-Topic: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Thread-Index: AQHZRSlN17FGWiUWRE2SGAkVM5BEIa7jT3xMgADd9AA=
Date: Tue, 28 Feb 2023 10:03:19 +0000
Message-ID: <1b9d4d586ae7bb5cddbb97fbc9ec7de1c475afee.camel@infinera.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
	 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
	 <Y/o8bQz5CuRhdD8B@windriver.com>
	 <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
In-Reply-To:  <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.46.4 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=infinera.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR10MB4615:EE_|BLAPR10MB5203:EE_
x-ms-office365-filtering-correlation-id: 62871540-b67c-4367-b22a-08db197304bd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:  iLKMBTE/tDQZOvgfC03kBsYskQO5kuWADxaKT3pyHhctkuetkrC5CIR71C8i/Zu3ixxjgRrvoq8DaQuy3OOXPnmAO4X6OCKKQl9IiIDS6zLbydUljjUGRSZZ7COEGF1v3s+Gcng9jy4zyAcSn8Vn3+gZkPRrYv+/SD+3fLcTwfO/pQgGK9E5PEO++iQ1fHQI4MpVRyikR2JJeMlaoeWxy0qAfVtdKnUopmSaoFth40OSIgCkVFLyqqG7lqXCaOfRRB2sPXt0NoWLqWHjf0PRrcGmD+jv9JEPkMChIzrVsUbdScJYNX0mizfDbpveZLceAc4OQw6Me0u/hyeQihWZB+Br7czRKeBVn3+RbWj8oGPGGq6giCOT+3IBn06asRnSX1lb+yJ+xA4fSQ3A90rj0JMGj5KLC1xx2WRoE5+xjTB0qnukv1yjmGmaGMb7VTWYxE97GVhPa7k1DmnZg045jHuSH/hv6b7UXodraloZIBfsT9bxI9HrIseF8WTHo0zLzVBcZ66VuuIXrZzSEvJzlcGrH9G8E2zuTo7dXrM4NytfqURLIIkovjaaIsHiXcNpeo61IZaOjo3LblgcKbEojnMqZ2AWBnc/mSB3zdIP155PtYaYLtsq4G6EyU3TxqsUZ5afOimgKXVLRZHZ0H1RJeUWuYp59GtuKbB3p69aU+zEzxgiD6zuJ5TCOqf1v8GtPCQt8lyGjw9AZnr2tEPoug==
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB4615.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(451199018)(316002)(8936002)(5660300002)(71200400001)(186003)(66556008)(66446008)(66476007)(8676002)(64756008)(66946007)(76116006)(41300700001)(4326008)(91956017)(36756003)(54906003)(83380400001)(6486002)(110136005)(478600001)(86362001)(53546011)(2906002)(6506007)(6512007)(38070700005)(2616005)(38100700002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?QjY4RW9GSXRKRUlGUjVHczMxMlVTSUpvdUVzZVc2UVVKVnFMS2QzSXIwd25J?=
 =?utf-8?B?N21lL2lQY0NiemUzcTN1YThmRm03bm1mWnV4TU9aUlhxc0lmaFJpR1ZsclZU?=
 =?utf-8?B?R2dENlk3ZWs3TlF5ZThCbzlyenlQZHFXNnFLN0EyT2RLNHhzRG80SlQxUXR5?=
 =?utf-8?B?ek5oYWpVRjVQM0hINERZaEpPcnpEU0R0ZzY3MElkRHJ0R1pkVHNheUpJTUJy?=
 =?utf-8?B?ZkIveHBxUHRqTkwrUllWTHNpVnZ1b084dXJzeFAzVFpmVjE5b05yMC9VZ2o4?=
 =?utf-8?B?QjVZTE5tUHRRcGdoRUg5SWVVMTJ5eVVxRUNBaFhXVWdLOW5adjFRczI0SnZr?=
 =?utf-8?B?Y2RQc01LYUpYVkxkQ3drSmlEOWtjTW40U1VmNjB4TTB3MnhhUUpqVFdIa1Qr?=
 =?utf-8?B?eW9OVktiOXVpVTVndVNUS24xS2pRQjVjMTJiOHVOVjhkMGFhSnBKVTNQaG9Q?=
 =?utf-8?B?czcxd2R0OXJYbzJ6ZXZpRGlKdXJPeVpJdGtWZDFsOTNJcENHdkVYYmp6Z2FP?=
 =?utf-8?B?TFhnQWFBK3FHMWs1Y1NkSXJ6ZFlLMUd4ZWsydXlNU2ZzT3k5NXZQWEpNY2ti?=
 =?utf-8?B?c2NPdE05Mi95SGdwWnd2dlgwRm5WK3dqbGQ1dmtmdnZVazNvMklBMlRSc1d6?=
 =?utf-8?B?UlRVSFZaWUhiMkpkMFBKWnltQWpTR2ZraE9abVFmUW9vM1Y0aHVkalYrNlpy?=
 =?utf-8?B?T0dFcnVYWGtpL3hiUTJhbll6TkFoTWdJQ0RxdWoxdEVhdlNUdXh3M3liMVZ5?=
 =?utf-8?B?Rm85YU9oUnkyQXkyd3hLSkk5ZlpqSXlab01KSFNyS1BxY2I4ZUNrNnV5eE51?=
 =?utf-8?B?bFl4WmhFcXY1Nk5INzhmNUVSN25JQUVDNmtMRVQvSXljRFd5RU01Skgya3hp?=
 =?utf-8?B?V2lwMWE3L013a2RwSkUzMjJiaDlvaUYxc01FSjBVSkgycnBPOGVTV3ZibHJB?=
 =?utf-8?B?R2hVZWlqRkZzaGl4SmZGUmMvZVJhcWp6cWVYYjVCbWpmSFR1aFRGSXRCM3N0?=
 =?utf-8?B?dkpiTkZwa3ZhamxkeG11OXhrT20wNHNQQXdZWlk4SGRkbWlzNWpCbzljWjhM?=
 =?utf-8?B?WFVuazB2bGIzMitoV2hTNm03WkVGRUxvd3JkUGg2dlBxNzVSbU1ubk94QUtT?=
 =?utf-8?B?OGZpeUh2amVhRXg2d2IrNVFPR2x0d2tJTmNTY3lxZEFnUlZmSE9uNHZ4VDRx?=
 =?utf-8?B?QzNEZDNXQ3h5Q2JtNFB1NHVUM1Y2Q0JwRnE3RUZuR3h6QkZKZjhsTDl2T1VY?=
 =?utf-8?B?QUdRTkk0QW5qcUhucWNqU2tWUFIyNi92QXhVL21oQmxxOU5CWkc5VWt2SW8w?=
 =?utf-8?B?cjRuZUpGWWt5MEJheHVWdFNENEJUV2lPMmZ5LzB3d3JTYmR2a0NEbWx3M1cv?=
 =?utf-8?B?Mk5kcGtNN251V2s4dm1vcXVKeHFrUEsveWU4M3pFamxtbFZ1aDNNU1NqMHNo?=
 =?utf-8?B?NDUvVFZNMCt4aGpvaE9XVnB6aUVUZi91U253d1gydU9WK1FxditXU3ZRWXZp?=
 =?utf-8?B?djhqSkJNQnlNSHdabU9jUzVLN3M0QzMrbEZTakZtQ0hMeitNRysyQXgyd1Ay?=
 =?utf-8?B?QmdyZHdKL1FFUlRJY2pUdnpYaGNmY2xuSERZbC9sVDFtbTZqcWdhUzc5c29W?=
 =?utf-8?B?Wjh4YlcrRDVhWWdnODQzNitOcXNwQjNqNGlXQS9BelRNakhaY3AwMEpucjFC?=
 =?utf-8?B?T2hVUm5meGh2dEc4ZlVtQzZlMnl6MHhkTHJzZFIvRmpTWmozMG5vRXM3SHRx?=
 =?utf-8?B?cEx2aXUvQWVBeTdEZzlBSTl0K2ZoUTNndnZvbFZocHhYYUl3N2duaVFVWEZi?=
 =?utf-8?B?citRNks0S3JYU0haUWpteWFqakJFWlI1bXkwSktSWnoxWkd0ckRxeDBJSFZM?=
 =?utf-8?B?RmxKUk9uN2hWUEo0aEhlUi8yKzZWcTNxcDYxYnVxMC9qMjM0K1EvOUg1dU5E?=
 =?utf-8?B?L3BaNkZ0b1cwUWdxUkdWcDNJZ3dnNkVTZUkybG40N2pNczRzam5WeGFHTFdp?=
 =?utf-8?B?d3BtdUtmVFljeFRNUnZMREttdVN3d0l2RDFzK0JTS3dueTlqbElnbG44MStz?=
 =?utf-8?B?eXIxZEs1YmZBME52QnpmcW94UGN4L3V4aUFabFRwNWQ5aGwzQ1VkL1FHRndy?=
 =?utf-8?B?WmpBYWNLVkR2NzBUQUFyRzRHVlJEZXcxV012aTFwdmhRdlZBeVNEcVFLSUN6?=
 =?utf-8?Q?+LbNuOGfSXUm0tz43cefWkBZQfcu2UNYmtLz4ITHoe+K?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0E2F1AC34BB80741BF1C6E74E23E5B60@namprd10.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: infinera.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB4615.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62871540-b67c-4367-b22a-08db197304bd
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Feb 2023 10:03:19.4062
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 285643de-5f5b-4b03-a153-0ae2dc8aaf77
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pheuHZvprGAxV/042sj7xLplgpx/o2HB2D93Uw75EOUz1MQ0kdG9kxrHnNw2UCyLTcLCkNXZpsKa+INfzrievA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5203
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
Cc: "oss@buserror.net" <oss@buserror.net>, "paulus@samba.org" <paulus@samba.org>, "claudiu.manoil@nxp.com" <claudiu.manoil@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gTW9uLCAyMDIzLTAyLTI3IGF0IDE0OjQ4IC0wNjAwLCBMaSBZYW5nIHdyb3RlOg0KPiBPbiBT
YXQsIEZlYiAyNSwgMjAyMyBhdCAxMDo1MuKAr0FNIFBhdWwgR29ydG1ha2VyDQo+IDxwYXVsLmdv
cnRtYWtlckB3aW5kcml2ZXIuY29tPiB3cm90ZToNCj4gPiANCj4gPiBbUkU6IFtSRkMgUEFUQ0gg
MC80XSBSZW1vdmUgc29tZSBlMzAwL01QQzgzeHggZXZhbHVhdGlvbiBwbGF0Zm9ybXNdIE9uIDI0
LzAyLzIwMjMgKEZyaSAyMToxNikgTGVvIExpIHdyb3RlOg0KPiA+IA0KPiA+ID4gDQo+ID4gPiAN
Cj4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gPiA+ID4gRnJvbTogUGF1bCBH
b3J0bWFrZXIgPHBhdWwuZ29ydG1ha2VyQHdpbmRyaXZlci5jb20+DQo+ID4gPiA+IFNlbnQ6IE1v
bmRheSwgRmVicnVhcnkgMjAsIDIwMjMgNTo1OSBBTQ0KPiA+ID4gPiBUbzogbGludXhwcGMtZGV2
QGxpc3RzLm96bGFicy5vcmcNCj4gPiA+ID4gQ2M6IExlbyBMaSA8bGVveWFuZy5saUBueHAuY29t
PjsgQ2xhdWRpdSBNYW5vaWwgPGNsYXVkaXUubWFub2lsQG54cC5jb20+Ow0KPiA+ID4gPiBQYXVs
IEdvcnRtYWtlciA8cGF1bC5nb3J0bWFrZXJAd2luZHJpdmVyLmNvbT47IFNjb3R0IFdvb2QNCj4g
PiA+ID4gPG9zc0BidXNlcnJvci5uZXQ+OyBNaWNoYWVsIEVsbGVybWFuIDxtcGVAZWxsZXJtYW4u
aWQuYXU+OyBCZW5qYW1pbg0KPiA+ID4gPiBIZXJyZW5zY2htaWR0IDxiZW5oQGtlcm5lbC5jcmFz
aGluZy5vcmc+OyBQYXVsIE1hY2tlcnJhcw0KPiA+ID4gPiA8cGF1bHVzQHNhbWJhLm9yZz4NCj4g
PiA+ID4gU3ViamVjdDogW1JGQyBQQVRDSCAwLzRdIFJlbW92ZSBzb21lIGUzMDAvTVBDODN4eCBl
dmFsdWF0aW9uIHBsYXRmb3Jtcw0KPiA+ID4gPiANCj4gPiA+ID4gW1RoaXMgUkZDIGlzIHByb3Bv
c2VkIGZvciB2Ni40IGFuZCBoZW5jZSBpcyBiYXNlZCBvZmYgbGludXgtbmV4dC5dDQo+ID4gPiA+
IA0KPiA+ID4gPiBUaGlzIHNlcmllcyByZW1vdmVzIHN1cHBvcnQgZm9yIGZvdXIgZTMwMCAoTVBD
ODN4eCkgRnJlZXNjYWxlIHByb2Nlc3Nvcg0KPiA+ID4gPiBmYW1pbHkgZXZhbHVhdGlvbiBib2Fy
ZHMgdGhhdCB3ZXJlIGFkZGVkIHRvIHRoZSBrZXJuZWwgaW4gdGhlIDIwMDYgZXJhLg0KPiA+ID4g
DQo+ID4gPiBIaSBQYXVsLA0KPiA+ID4gDQo+ID4gPiBJIHRhbGtlZCB3aXRoIG91ciBtYXJrZXRp
bmcgdGVhbSBvbiB0aGlzLiAgQWx0aG91Z2ggd2UgZG8gbm90IHJlY29tbWVuZCBhbnkgbmV3IGRl
c2lnbiB3aXRoIHRoZXNlIFNvQ3MsIHRoZXkgYXJlIHN0aWxsIGJlaW5nIHNoaXBwZWQgaW4gbGFy
Z2UgYW1vdW50IHRvIGN1c3RvbWVycyBub3cuICBQbHVzIGl0IGlzIHBvc3NpYmxlIGZvciB0aGUg
YmlnZ2VyIGFtb3VudCBvZiBleGlzdGluZyBkZXZpY2VzIHRvIGJlIHVwZGF0aW5nIHRoZWlyIHNv
ZnR3YXJlIHRoYXQgaW5jbHVkZXMgYSBuZXcga2VybmVsLiAgU28gd2Ugc2hvdWxkIGRlZmluaXRl
bHkga2VlcCBhbGwgdGhlIGNvbW1vbiBTb0MgY29kZSB0aGF0IG1pZ2h0IGJlIG5lZWRlZCB0byBz
dXBwb3J0IHRoZWlyIG93biBkZXNpZ24uDQo+ID4gDQo+ID4gVGhhbmtzIGZvciBjb25maXJtaW5n
IHdpdGggeW91ciBtYXJrZXRpbmcgdGVhbSB0aGF0IHRoZXkgImRvIG5vdA0KPiA+IHJlY29tbWVu
ZCBhbnkgbmV3IGRlc2lnbiB3aXRoIHRoZXNlIFNvQ3MiIC0tIGl0IGFsc28gY29uZmlybXMgdGhl
DQo+ID4gaW5mb3JtYXRpb24gSSByZWFkIG9uIHRoZSB3ZWIgcGFnZXMgZm9yIHRoZSBwbGF0Zm9y
bXMuDQo+ID4gDQo+ID4gQXMgdGhvc2Ugb2YgdXMgaW1tZXJzZWQgaW4gdGhpcyB3b3JsZCBhbGwg
a25vdyBmcm9tIHRoZSAxMDEgYmFzaWNzIG9mDQo+ID4gUHJvZHVjdCBMaWZlIEN5Y2xlIGxlc3Nv
bnMsIGl0IGRvZXNuJ3QgbWF0dGVyIGlmIGl0IGlzIGEgcGhvbmUgb3IgYQ0KPiA+IHNldC10b3At
Ym94L1BWUiBvciB3aGF0ZXZlciBlbHNlIGtpbmQgb2Ygbm9uLVBDIGNvbnN1bWVyIGRldmljZSAt
LQ0KPiA+IGtlcm5lbCB1cHJldnMgbmV2ZXIgaGFwcGVuIGluIHRoYXQgcHJvZHVjdCBzcGFjZS4N
Cj4gDQo+IE9uZSB0aGluZyBpcyB0aGF0IHRoZSBRb3JJUSBwbGF0Zm9ybXMgYXJlIG5vdCBmb3Ig
dGhlIGNvbnN1bWVyDQo+IGRldmljZXMuICBUaGV5IGFyZSBtb3N0bHkgdXNlZCBpbiBuZXR3b3Jr
aW5nIG9yIGNvbW11bmljYXRpb24NCj4gZXF1aXBtZW50LiAgSSB0aGluayB0aGVpciBwcm9kdWN0
IGxpZmUgY3ljbGUgd291bGQgYmUgbW9yZSBsaWtlIHRoZQ0KPiBzZXJ2ZXIgb3IgZGF0YSBjZW50
ZXIgc2NlbmFyaW8uDQo+IA0KPiBSZWdhcmRzLA0KPiBMZW8NCj4gPiANCj4gPiBTbyB3aXRoIHRo
ZSBiZXN0IGludGVyZXN0cyBvZiB0aGUgbWFpbmxpbmUga2VybmVsIGluIG1pbmQsIEkgdGhpbmsg
d2UNCj4gPiBhcmUgZ29vZCB0byBwcm9jZWVkIHdpdGggdGhpcyBmb3Igc3VtbWVyIDIwMjMuICBB
bmQgb2YgY291cnNlIGFzIEkndmUNCj4gPiBzYWlkIG1hbnkgdGltZXMgYmVmb3JlIC0gdGhlIGtl
cm5lbCBpcyBpbiBnaXQsIHNvIHJlYWxseSB5b3UgY2FuJ3QNCj4gPiBkZWxldGUgYW55dGhpbmcg
YW55d2F5IC0gaXQgcmVtYWlucyBpbiBoaXN0b3J5IGZvcmV2ZXIuDQo+ID4gDQo+ID4gVGhhbmtz
LA0KPiA+IFBhdWwuDQo+ID4gLS0NCj4gPiANCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gVGhl
c2UgYm9hcmRzIHdlcmUgYWxsIG9mIGEgdmVyeSBzaW1pbGFyIGZvcm0gZmFjdG9yLCBhIGxhcmdp
c2ggUENJIG9yIFBDSS1YIGNhcmQNCj4gPiA+ID4gdGhhdCBjb3VsZCBhbHNvIGJlIHVzZWQgc3Rh
bmRhbG9uZSB3aXRoIGFuIGV4dGVybmFsIHBvd2VyIGJyaWNrLCBhbmQgYWxsDQo+ID4gPiA+IHNo
YXJlZCB0aGUgTW9kdWxhciBEZXZlbG9wbWVudCBTeXN0ZW0gKE1EUykgZGVzaWduYXRpb24uDQo+
ID4gPiA+IA0KPiA+ID4gPiBUaGVzZSBwbGF0Zm9ybXMgd2VyZSBtYWRlIGluIGxpbWl0ZWQgcXVh
bnRpdHkgYW5kIHdlcmUgZ2VuZXJhbGx5IGRlc2lnbmVkDQo+ID4gPiA+IHRvIGdldCBlYXJseSBz
aWxpY29uIGludG8gdGhlIGhhbmRzIG9mIE9FTXMgd2hvIHdvdWxkIGxhdGVyIGRldmVsb3AgdGhl
aXINCj4gPiA+ID4gb3duIGJvYXJkcy9wbGF0Zm9ybXMuICBBcyBzdWNoLCBhdmFpbGFiaWxpdHkg
d2FzIGxpbWl0ZWQgdG8gdGhvc2Ugd2hvIHdvdWxkDQo+ID4gPiA+IGJlIHdvcmtpbmcgb24gYm9h
cmRzIGFuZC9vciBCU1Agc3VwcG9ydC4NCj4gPiA+ID4gDQo+ID4gPiA+IE1hbnkgZWFybHkgcmV2
aXNpb24gTURTIHBsYXRmb3JtcyB1c2VkIGEgbWVjaGFuaWNhbCBjbGFtcGluZyBzeXN0ZW0gdG8N
Cj4gPiA+ID4gaG9sZCB0aGUgQkdBIENQVSBpbiBwbGFjZSB0byBmYWNpbGl0YXRlIENQVSB1cGRh
dGVzIC0tIHNvbWV0aGluZyBub3QNCj4gPiA+ID4gbm9ybWFsbHkgcG9zc2libGUgZm9yIGEgc29s
ZGVyZWQgZG93biBCR0EgaW4gYSBDT1RTIHN5c3RlbS4NCj4gPiA+ID4gDQo+ID4gPiA+IFRoZSBw
b2ludCBvZiB0aGVzZSBkZXRhaWxzIGlzIHRvIGdpdmUgY29udGV4dCB0aGF0IHJlZmxlY3RzIHRo
YXQgdGhlc2UgZm91cg0KPiA+ID4gPiBib2FyZHMgd2VyZSBtYWRlIGluIGxpbWl0ZWQgcXVhbnRp
dGllcywgd2VyZSBub3QgaW4gYSBmb3JtIGZhY3RvciB0aGF0IGlzDQo+ID4gPiA+IHJlYWxseSAi
aG9iYnlpc3QiIGZyaWVuZGx5IGFuZCBoZW5jZSBtYWtlIHNlbnNlIGZvciByZW1vdmFsIDE3IHll
YXJzIGxhdGVyLg0KPiA+ID4gDQo+ID4gPiBXZSB3b3VsZCBhZ3JlZSB3aXRoIHlvdSB0aGF0IHRo
ZSBNRFMgcGxhdGZvcm1zIGFyZSBvbmx5IHVzZWQgYnkgYSBsaW1pdGVkIG51bWJlciBvZiBjdXN0
b21lcnMgZm9yIGV2YWx1YXRpb24gcHVycG9zZSwgc28gaXQgc2hvdWxkIGJlIGZpbmUgdG8gYmUg
cmVtb3ZlZC4gIFNvIGZvciB0aGlzIHNlcmllczoNCj4gPiA+IA0KPiA+ID4gQWNrZWQtYnk6IExp
IFlhbmcgPGxlb3lhbmcubGlAbnhwLmNvbT4NCj4gPiA+IA0KPiA+ID4gPiANCj4gPiA+ID4gSGVy
ZSwgd2UgcmVtb3ZlIHRoZSBNUEM4NTQ4RS1NRFNbMV0sIHRoZSBNUEM4MzYwRS1NRFNbMl0sIHRo
ZQ0KPiA+ID4gPiBNUEM4Mzd4RS1NRFNbM10sIGFuZCB0aGUgTVBDODMyeC1NRFNbNF0gYm9hcmQg
c3VwcG9ydCBmcm9tIHRoZSBrZXJuZWwuDQo+ID4gPiA+IA0KPiA+ID4gPiBUaGVyZSB3aWxsIHN0
aWxsIGV4aXN0IHNldmVyYWwgZTMwMCBGcmVlc2NhbGUgUmVmZXJlbmNlIERlc2lnbiBTeXN0ZW0g
KFJEUykNCj4gPiA+ID4gYm9hcmRzWzVdIGFuZCBtaW5pLUlUWCBib2FyZHNbNl0gd2l0aCBzdXBw
b3J0IGluIHRoZSBrZXJuZWwuICBXaGlsZSB0aGVzZQ0KPiA+ID4gPiB3ZXJlIG1vcmUgb2YgYSBD
T1RTICJyZWFkeSB0byBkZXBsb3kiIGRlc2lnbiBtb3JlIHN1aXRlZCB0byBob2JieWlzdHMsIGl0
DQo+ID4gPiA+IHByb2JhYmx5IG1ha2VzIHNlbnNlIHRvIGNvbnNpZGVyIHJlbW92aW5nIHRoZXNl
IGFzIHdlbGwsIGJhc2VkIG9uIGFnZS4NCj4gPiA+IA0KPiA+ID4gVGhlc2UgYm9hcmRzIGFyZSBt
YXNzIG1hcmtldCBib2FyZHMgdGhhdCBzb2xkIGluIGxhcmdlciBhbW91bnQgYW5kIGFyZSBtdWNo
IG1vcmUgbGlrZWx5IHRvIHN0aWxsIGJlIHVzZWQuICBXZSB3b3VsZCBzdWdnZXN0IHdlIGtlZXAg
dGhlbSBmb3Igbm93Lg0KDQpBZ3JlZWQsIHRoZSBSRFMgZGVzaWduIGlzIHN0aWxsIHVzZWQgaGVy
ZS4NCg0KPiA+IA0K
