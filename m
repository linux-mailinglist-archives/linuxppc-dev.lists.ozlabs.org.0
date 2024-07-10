Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 20ED292DA89
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jul 2024 23:03:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=ucISsbeO;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WK9Lf6Dt2z3fSR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jul 2024 07:03:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=ucISsbeO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:260d::600; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:260d::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WK9Ky5dh5z3bSx
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jul 2024 07:02:45 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ufjGm4ulKV0g60tu1S19P0hJQG99aLqbBIBlj1PAOu9jY5yO/vM6UPmMUL7357FpknhX96vzkqbKIdAkXM6mZJY5MWBcojNAuINBnjzfxMKMsXQAvzf0rLq15uooLwruu84ZvK4Bn3/o6aK4wQnfJGfhx5wYxOy8BQUq6TvE1CXL4BHw9KrJU4ODPQqm3sdr8TE3G5irEU8XTbROT2QmNN+PJN7iJhniOBXKibSxSy1xXoS2tF7kCcobstBVYBdUUN8bzcvQk9T/Wx0VOdSB4eNy6x3x33KGUY057aO6oBcC8QNIGjnu6tyzXoRylUmDd8QFp3QTKRA/NJzNE3Iy+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LX/wAHNql/wKIjZrxDlstpUkD8MTwqxW6FAL67G3bX8=;
 b=kAXSWlkru601aMFPvtgQ0AfHK481/l/3gQo8IhjUF5UQCO56JHcSF+JXJwYGIExZICOeq0k9Z9hvGvUKRn8AAI96bn1XwjPOsE4MD73m5DdUXfDfun9F1hGRpxTsXcrST5rnpojcEVc7bhTdjqGZl81TChReJnQkSL5amG2IhcFJC3Z+so3BOcsdiSG0cvmFbzEtW+POHRhFyF2KBWV/viP3sZgj9G/YvRQtyu1ReW+MuOnfUxRmYLx9YlYOgXmSfw4a0SGfzG1TP00/4l6lL8C6N8iJ0MbFRPDhqSnYltmrnnSSj6eWVX1ICl9NkxcJMKTnwxy+XPCr41V5L6p+Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LX/wAHNql/wKIjZrxDlstpUkD8MTwqxW6FAL67G3bX8=;
 b=ucISsbeOh3WWj0TGRwfZVMzZzwgdP7KwVJbmb7duTpK30HO3evykqP6e1f4ZoM9kzPSbt4477lkxrLnYniEPaHRES2JdI6ZRdFre6q70q9D/bgu9ZRTVmlzXm0sGQq29JtpFwoOwUCw493nhtRz5kSY5AyIp1KaaD4fYAFn61RaYPw4+3KzOoe/Hau9BwSiteNapv7HI/0z8fQzBSXEIA2ULDhbzkdGO8eRyv9EwIfZwEdy2WQEyLcmWm2auSVceq4mEiDeu5QEbGM6y0mH7sfYv+yHRs3IdQEaQqtU/e5jhdscGuA7cNqQwpW6eByblrrM4z/vKtFwnBvW7S3Z4jA==
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com (2603:10a6:208:f3::19)
 by PAXPR07MB8517.eurprd07.prod.outlook.com (2603:10a6:102:2b5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.19; Wed, 10 Jul
 2024 21:02:20 +0000
Received: from AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2]) by AM0PR07MB4962.eurprd07.prod.outlook.com
 ([fe80::6724:2919:9cbb:2bb2%6]) with mapi id 15.20.7762.016; Wed, 10 Jul 2024
 21:02:19 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, "linux-mm@kvack.org"
	<linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v4 17/21] mm/mmap: Drop arch_unmap() call from all archs
Thread-Topic: [PATCH v4 17/21] mm/mmap: Drop arch_unmap() call from all archs
Thread-Index: AQHa0v6x9tK7ARqshUC4xDWzrUrlcLHwcueA
Date: Wed, 10 Jul 2024 21:02:19 +0000
Message-ID: <3843b797-8e31-498c-adff-153f9568505e@cs-soprasteria.com>
References: <20240710192250.4114783-1-Liam.Howlett@oracle.com>
 <20240710192250.4114783-18-Liam.Howlett@oracle.com>
In-Reply-To: <20240710192250.4114783-18-Liam.Howlett@oracle.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB4962:EE_|PAXPR07MB8517:EE_
x-ms-office365-filtering-correlation-id: 1919cb55-787b-465c-e23e-08dca123963e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230040|376014|1800799024|7416014|366016|38070700018;
x-microsoft-antispam-message-info:  =?utf-8?B?VWc5eWQvL3hHTk1EZUZCY3hOSENidXNSMk9OTFEzTVJ2eHFkQlhUSnZDWjBL?=
 =?utf-8?B?ZzBZNDM5Y3FZUXg0djczME9QaVFQUU8zR1N0aUJuZk5xYXVuQTZkODJXS284?=
 =?utf-8?B?dFJFZlhIQWZJakcvSXF3eVNCMmRXL1RXQm15U2RhWWV6aWMzTTZHQ25TL2ow?=
 =?utf-8?B?Q0lFeGFaQ2NseDAwT3A0aUZmZjlobG82cGFZdWRIUHRURXZSY2pqcklLQWJL?=
 =?utf-8?B?UDdibU9BY0lEYkFQckNZSlJkenhENGFVYTM5V3VtN0xYQ2ozOFRvMS9IOTdQ?=
 =?utf-8?B?eVJQbFZwczc3OW9XYXlhcEtFY3NTUWJSZ0cveXZhMDRyU2FmdkRqTXVhZklu?=
 =?utf-8?B?VVRLUVZVWlJwUFJLTFdyQlBVS0dyZTAxcllxdTZRdFAyMGIrbndDTUZnU2gr?=
 =?utf-8?B?bVJaakx3Sng5M2tBUHZRTUtrazdzaTNJVmFKd0xWdCtPcnhVY0tDc2VINTRi?=
 =?utf-8?B?dlUvYVBZaTRHZXpSRWZUTkdHRVF5OHpBRXA3TmgrRDZXUFREQS93ZThEVjlN?=
 =?utf-8?B?ZFJJbS9JVmtjUUM1bHFkMUpzWWZMa2U0WkYwTkZ0cUIzQ0lEcU40cWNrLzF2?=
 =?utf-8?B?Tm9oRkNwUVJINlBDVUZmZ3lSSTk0UDZ4RzdiWjRIQy9ZQTN3b1owVk94VkVQ?=
 =?utf-8?B?bllISnVvV1gxQmFKYndRSmhCV3dEUmZtUUNjZXhEc0o4MXVNcVNVa3h3OENy?=
 =?utf-8?B?bFNLbXdTRUE2bGhXbmpzWjd0ZHlZWmdsT1FpWUNCVjVHRWpsZDc4aWhFU3dh?=
 =?utf-8?B?TlFobTRaS1RjWkhITytIaWJUUTJjOHRackJhWldHMjNzMGFZanpKQnZpNlJy?=
 =?utf-8?B?ZjVsTTBwV0F3OHJ4T0xUOTNFSHBPTnE1VmNnb3RQKzhaQWZ4NWlSVzRYSTVK?=
 =?utf-8?B?L0VIK1dIaU1tMkNwYXo0YkNmSVFxTzZJU25zb2xKVFdacnhoQkV6VmJyQzNm?=
 =?utf-8?B?SUdSVG9zaXRpRkpOeURjQnJPeHBRRExsdFFzMkkxT2M2WE9sVlFDTkRVOXlw?=
 =?utf-8?B?VnNSUFJqSW9jRlphSnNXdGZ5MXZ6NHVqWFM1WkpOVngwc2JvRGtITzV0ZlJZ?=
 =?utf-8?B?T0RSa2IrY3E5NkhEUDJ1dzdEUk5tODJ3RmhCamVQdHgxTXh5V0pUNXRqdjE2?=
 =?utf-8?B?OXJmKzdnUXN1ajdXTlJYb29MMzFLNjMvYk5DaVNHbk1QSU5wRWxQdXRsUTVK?=
 =?utf-8?B?SmtqdlluTERoZVhtZXBjRDRhNEpEWVo5R2JhMmRZd2JiVWVwT0hDejBxOU9T?=
 =?utf-8?B?cm1JWlpoUlRTUWVPaDRJM3NwR1VVbWx4U1VKc3FFcVlvTXZQNTNCSFdkdy93?=
 =?utf-8?B?YzZxcEVIS3lNejEvdTJjUmRkbkNhR0RDeGkreW1pZDNyd2FFazR1dzNlZmNB?=
 =?utf-8?B?SGxYYXZyU3JxNGpnUkJBY3p4Z0tuWXRBaWxoL2s2Z2h5TmNyVjVSbU9qNEp4?=
 =?utf-8?B?QkxYS0RNYjdqcU1HL2VDS0hObTVpQWNWcGhuTVB0VmRrNzJPNkhJMWp6R3Bj?=
 =?utf-8?B?OUxzWEVacDNJNUxoYmw5UjVVNGZNcTQ2YVVEVWc4emkwL2Nva0ZzaGJkM1B0?=
 =?utf-8?B?QW9RU2Y0TWZWL0xmTEJROXMxN1JDTFk5Y0JGYXBoekFYRE5QRDhLZVRjN0FL?=
 =?utf-8?B?akxsSUVHZWpFTVdtbUJ0QmRPWVE3RU8rOTYzNVFYbjFQdXJ0Rmx5V2ZRV1hi?=
 =?utf-8?B?YUZSd0tzMlVIcGlKTVRqS3FWMGo5cWFsb0dNTVhSNDJEb1ZtVWl5SERtdDUx?=
 =?utf-8?B?bk5hQXB6NUJvY2NuTE1ERXAvVE9td214Q2NOWkM2SW44VlErVlE5QjRwZEUx?=
 =?utf-8?Q?UaNLxLl+KDkLYPjRtwmvMUfI59aIOEJo1w4hQ=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB4962.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?aHNNQmlHcG5wdC9Ya0dQdWliZUhiT1NrNnlmaCtEZktGNWdZVUJpL3BQakhh?=
 =?utf-8?B?Yk5lR1lrZDROZHlLM1puVVJCME5wNHlpNzFXM2J4akZjMHZ0dEpkMWY2T0o4?=
 =?utf-8?B?Z3pVMzJjdVVXd0RqUHUzZzlrVHhlRjRBVUFmeUx2aTFCcWUzOW54bnRWcU8z?=
 =?utf-8?B?eHByN3RjOVZYZy9qSTQ1M1Erb2J5NGVnVTB0ZEc3bXhIVFVKOGNSYm93RDBi?=
 =?utf-8?B?c3lQWUN2VUF1RWtLc0drV2IxZXBERTJuSWpuSXVHR0hleXRRbzFUMC9vaHpE?=
 =?utf-8?B?VnBRRkFIYm9QRTdpVW9JVTFsS0htWlc3TUhEdCtNbGVXVEs5aXUvK3p1STRh?=
 =?utf-8?B?ZHBpNkdlTlJKVE93dkhkbXVsV2IzelFPZnd4OWxYeTIxaG54dndiamdPRkJP?=
 =?utf-8?B?cjZsRTI0NDV2YzdQcGwyQVZPUkZUcnVJWjhiTm9RN25uWDcvOWx4cHd1RzYz?=
 =?utf-8?B?NzVYTE8ycXpwMmJIOTFqb1hMYnhrdC9WL3RITThvK2F6dDFYYW5md0JET25H?=
 =?utf-8?B?Y2NIaHdsaG44VFFoS0ZjREFrZVE0OVprNTJrTCtaVzhkakM1WHVYeFZHblpJ?=
 =?utf-8?B?cEJ4clhxaGtZY0plVXIwWXcwRVBIaU1HUDJRQ1N4MnY1clJjdTFYdmQ2MkFB?=
 =?utf-8?B?ZmsxYi8rSVJ3TUdpdk1tVEhXblRrN3R4SktXcUhlY2tBaUY5L04zYVRpd2Yr?=
 =?utf-8?B?RlhORGdGbk1pQy9oVlZNZ0RMYWlKOWR5NEJ3WEZydDVsSEdiSENERlIxZFdK?=
 =?utf-8?B?TVRiZ3JYV0wyWHB5bFJpZ0RuaVdBRmVlZlo2cDZ0azRIRVNqWTVkYjRFb2tY?=
 =?utf-8?B?V0ROckVsUEc5MEpHNjY0dGJlK2hGV3JsV3g3ODBFTVdEQnFOZm5vT1ZuNERQ?=
 =?utf-8?B?UzI3SW5RcVFTMnB1a0ZPZG9LVGhIeWFEKzF2MS9xR00rL2pNMnNUYzVFRjBI?=
 =?utf-8?B?amwrRUJUVXRDYTBHWk1wMHJQUW14ZHNwWW5nVStFajhWeHlqamNLd20wWmpZ?=
 =?utf-8?B?WmZGVXdhN3hwbXZ3bGwydHFIQTV1VVk0Mm9QTzVHbnYybTBNMUxkR2NvVUlC?=
 =?utf-8?B?QXNnYzZPMi94elVqY2E3OS9ZRTN5SGk4MGJUdStqT1VkYmxXdzNHYnNZdVdH?=
 =?utf-8?B?UEFTSjc5aEFQdEZvZTIyVGw3OUV1MlUxZFcvdW1FbzdMWUhKbko5K3A2TzBZ?=
 =?utf-8?B?SVNjd2w3V3FjWVlaaExadFd4a2pXaU91UTYrbUdYRVVTNXd4M3krVGtwTnJP?=
 =?utf-8?B?TUZzY0owOGtBZzJ5OTFLbUozT0xYNWk1NEJtTjdoRzRrTGdJQndtci93RVRW?=
 =?utf-8?B?QlZ5SzVWN0draVRrbXBvbXhDUHNReURzQmRZa00xd2dCL3VSVTFyS2xKT1Zk?=
 =?utf-8?B?Z2pVMXFna1lLL3Ftd1MwSHc4bzZrakRXc1ZhbCtadTVjdEt2WmRabXl1K25t?=
 =?utf-8?B?Z1BrZU5kSmZQQjRLUmlvWUVHeVNvYlNEVjEyRml4QUx1QjJpWW5jOTlRMVlE?=
 =?utf-8?B?U0V3QTJka2RZYnBnWVBBQUpFclFpc3BwUlkzVmdwUlU5TWNNbWhjNjljTnd1?=
 =?utf-8?B?bWhtSFNxajR6Ym9jakdjZW9wbGplN1FXSDhqOVk3K1BTNWdWdEpxTFMyVVFN?=
 =?utf-8?B?V3d0dGhsVHJVZWhROXA1c3dSL1I2SWtIUmc1bjMzWEFuUWQ0NmZmN2JWWGpm?=
 =?utf-8?B?WW02Wm0yTmRTVWNvQ2tyRzViOFdKNjFkRmQ0djlQVFJsVW1pUVhWbmw5emQv?=
 =?utf-8?B?b0tPQUZWOXEwNVNFWjlrMGduQkxyNlliWmlHYUJMVFRZTnA1Zld1YnNoNkJ5?=
 =?utf-8?B?dnZvcHdGZnZCUUFHQmQvVmVtNzNIRTA2ejhOWGdQb2VKU1lGN0h2Zm1MNUJF?=
 =?utf-8?B?RFc4clJRTVNyM2JHUlpHOFVxNUQ2UXJLL0lkNmNtc3pQampwb3FnSjZrYXFF?=
 =?utf-8?B?RkVRSG9mSFR4UnBVeGxNQjhzMFAvVjJqZzBNRnJZbmVLSUo4bkJFRDJIT1kr?=
 =?utf-8?B?WEZhV0w2ZEFlMEZkZXh0U2crcTFxUUh4cUFUbS9NbWZ2NmZXU3lHdjE3aDRW?=
 =?utf-8?B?NEJIa3pYYkhqSEY3L3dmVUVaS1JZQUEzMy9MMmhvMmJUbUQ0N1JVQ2hLSWlW?=
 =?utf-8?B?NHNySk9uNzBDeGRwR2REYTNkSWo1VzVRdjBjYllhVFIxZWM2VEhmVk9VRklL?=
 =?utf-8?Q?AF5CJ8LiNO6Y2JK+SlUJkeo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <432501764D2AAB419B32456B9D533A8D@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1919cb55-787b-465c-e23e-08dca123963e
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2024 21:02:19.5998
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: J5TnzgtYFeOgsSrD8Z42+HCphP+kCvm068oWobCgFbCzw/xvCsddtqpKwsPeglb4niqBc5nNNTjqL3YYp4xMzqC3KuWDm7nc3buGawwgUzuiMgelp9NNMv661JevW5wS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR07MB8517
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB4962.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC: 
X-MS-Exchange-CrossPremises-originalclientipaddress: 188.92.135.53
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: PAXPR07MB8517.eurprd07.prod.outlook.com
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
Cc: Lorenzo Stoakes <lstoakes@gmail.com>, "Paul E .
 McKenney" <paulmck@kernel.org>, Dmitry Safonov <dima@arista.com>, Kees Cook <kees@kernel.org>, Jiri Olsa <olsajiri@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matthew Wilcox <willy@infradead.org>, Dave Hansen <dave.hansen@intel.com>, Bert Karwatzki <spasswolf@web.de>, Suren Baghdasaryan <surenb@google.com>, "sidhartha.kumar@oracle.com" <sidhartha.kumar@oracle.com>, Vlastimil Babka <vbabka@suse.cz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDEwLzA3LzIwMjQgw6AgMjE6MjIsIExpYW0gUi4gSG93bGV0dCBhIMOpY3JpdMKgOg0K
PiBGcm9tOiAiTGlhbSBSLiBIb3dsZXR0IiA8TGlhbS5Ib3dsZXR0QE9yYWNsZS5jb20+DQo+IA0K
PiBUaGUgYXJjaF91bm1hcCBjYWxsIHdhcyBwcmV2aW91c2x5IG1vdmVkIGFib3ZlIHRoZSByYnRy
ZWUgbW9kaWZpY2F0aW9ucw0KPiBpbiBjb21taXQgNWEyOGZjOTRjOTE0ICgieDg2L21weCwgbW0v
Y29yZTogRml4IHJlY3Vyc2l2ZSBtdW5tYXAoKQ0KPiBjb3JydXB0aW9uIikuICBUaGUgbW92ZSB3
YXMgbW90aXZhdGVkIGJ5IGFuIGlzc3VlIHdpdGggY2FsbGluZw0KPiBhcmNoX3VubWFwKCkgYWZ0
ZXIgdGhlIHJidHJlZSB3YXMgbW9kaWZpZWQuDQo+IA0KPiBTaW5jZSB0aGUgYWJvdmUgY29tbWl0
LCBtcHggd2FzIGRyb3BwZWQgZnJvbSB0aGUga2VybmVsIGluIDQ1ZmMyNGU4OWI3Yw0KPiAoIng4
Ni9tcHg6IHJlbW92ZSBNUFggZnJvbSBhcmNoL3g4NiIpLCBzbyB0aGUgbW90aXZhdGlvbiBmb3Ig
Y2FsbGluZw0KPiBhcmNoX3VubWFwKCkgcHJpb3IgdG8gbW9kaWZ5aW5nIHRoZSB2bWEgdHJlZSBu
byBsb25nZXIgZXhpc3RzDQo+IChyZWdhcmRsZXNzIG9mIHJidHJlZSBvciBtYXBsZSB0cmVlIGlt
cGxlbWVudGF0aW9ucykuDQo+IA0KPiBGdXJ0aGVybW9yZSwgdGhlIHBvd2VycGMgaW1wbGVtZW50
YXRpb24gaXMgYWxzbyBubyBsb25nZXIgbmVlZGVkIGFzIHBlcg0KPiBbMV0gYW5kIFsyXS4gIFNv
IHRoZSBhcmNoX3VubWFwKCkgZnVuY3Rpb24gY2FuIGJlIGNvbXBsZXRlbHkgcmVtb3ZlZC4NCg0K
SSdtIG5vdCBzdXJlIHRvIHVuZGVyc3RhbmQuIElzIGl0IHJlcGxhY2VkIGJ5IHNvbWV0aGluZyBl
bHNlID8NCldlIHdhbnRlZCB0byBnZXQgcmlkIG9mIGFyY2hfdW5tYXAoKSBidXQgaXQgd2FzIHN1
cHBvc2VkIHRvIGJlIHJlcGxhY2VkIA0KYnkgc29tZSBjb3JlIGZ1bmN0aW9uIGJlY2F1c2UgdGhl
IGZ1bmN0aW9ubmFsaXR5IGl0c2VsZiBpcyBzdGlsbCANCnJlcXVpcmVkIGFuZCBpbmRlZWQgYWxs
IHRoZSBkaXNjdXNzaW9uIGFyb3VuZCBbMl0gZGVtb25zdHJhdGVkIHRoYXQgbm90IA0Kb25seSBw
b3dlcnBjIGJ1dCBhdCBsZWFzdCBhcm0gYW5kIHByb2JhYmx5IG90aGVycyBuZWVkZWQgdG8gcHJv
cGVybHkgDQpjbGVhbi11cCByZWZlcmVuY2UgdG8gVkRTTyBtYXBwaW5ncyBvbiB1bm1hcHBpbmcu
DQoNClNvIGFzIG1lbnRpb25lZCBieSBNaWNoYWVsIHlvdSBjYW4ndCBqdXN0IGRyb3AgdGhhdCB3
aXRob3V0IHJlcGxhY2luZyBpdCANCmJ5IHNvbWV0aGluZyBlbHNlLiBXZSBuZWVkIHRoZSBWRFNP
IHNpZ25hbCBoYW5kbGluZyB0byBwcm9wZXJseSBmYWxsYmFjayANCm9uIHN0YWNrLWJhc2VkIHRy
YW1wb2xpbmUgd2hlbiB0aGUgVkRTTyB0cmFtcG9saW5lIGdldHMgbWFwcGVkIG91dC4NCg0KT3Ig
ZGlkIEkgbWlzcyBzb21ldGhpbmcgPw0KDQpDaHJpc3RvcGhlDQoNCj4gDQo+IExpbms6IGh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMTA2MTExODAyNDIuNzExMzk5LTEtZGltYUBhcmlz
dGEuY29tLw0KPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vbGludXhwcGMvaXNzdWVzL2lzc3Vl
cy8yNDENCg==
