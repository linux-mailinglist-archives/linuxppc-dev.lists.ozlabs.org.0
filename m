Return-Path: <linuxppc-dev+bounces-10430-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F939B14948
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Jul 2025 09:42:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4brnNt1z6Hz30P3;
	Tue, 29 Jul 2025 17:42:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a01:111:f403:c20a::7" arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753774926;
	cv=pass; b=N9srFXJdEYOcYFsNQgzccvhc3ukPs7lk/P0nHWGbTCd9/UKHRtwQtOGA3KM/p7aCONwh1giefyu36d4SkA2VDXqJF9jjg2b4ILWohc+IcaBqvssK6fOMVFY60anYKQtIOnbixWC4YAeEvx/kikEPZBIUqVwScIUjZr7Jy8ip0A6Ecm12mGZGj9p1YAX8KM4nn/yskxY4Cd4YYqnWIN+Bx8QZGrKntBPQMGS645Tpay0eRR5Wx9qYNRQjR2g8qoKDMVFzKQLPAr5tE3RLRVYPmuJzpJZNRBgU47m9TsFLSaNPqYmWO/+iRd8p/RLU+JzOBXLdXkkolOI9TggpnaKdiA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753774926; c=relaxed/relaxed;
	bh=iAhclRdCOcP6SPOVgwH8uLvMM3AvLAKK8ozsECxGwl8=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=cgiWrl2ZjtzSNcV/mQRc8W7WVLzXaiaMpG3YG/uSXxYhDHxsNXItaeNZqHV4SnSEp7rPOZo5nlcm0Up7jxjn+5EV0c46OUL6RD+JCT+5RhsEjXOCjncHAYGQs1o40KuVnmaT9hZDSQjNu6TmASYtBGN4E1HaAPDCIGy2Ku3Nz0GcViVPK+ErNiIAwSAumiXxdkxswsFQ+GVl+pj09mZkTbJPwDuOCxaL02Q7lcvAHmznqnCQrraI1X3P4szMoU+H0DHRb/LC/qwz1GvWdoAAPonoMsTIO5wPaJPEf2eMCQee9qqmrFwgFDSTZk+jU+TyTC/uvNEpjALCHFc+w40PKw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com; dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=voy8ONeY; dkim-atps=neutral; spf=pass (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org) smtp.mailfrom=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=cs-soprasteria.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cs-soprasteria.com header.i=@cs-soprasteria.com header.a=rsa-sha256 header.s=selector1 header.b=voy8ONeY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=cs-soprasteria.com (client-ip=2a01:111:f403:c20a::7; helo=pa4pr04cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy2@cs-soprasteria.com; receiver=lists.ozlabs.org)
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazlp170130007.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4brnNr6hgWz2xRq
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Jul 2025 17:42:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bLeBIOslmZ0uxt2Id8vNi47smvqcjBFkj2arUPghby43pCL467jjStPC6ithBjf7vFNV25McMYEENqXNfDc8WYnrfQbc6ZKZ4T1C7JHaW5JOKU1MrSeWQ7WpxgTUab/Xpul7xMiSAfiMP3JpK/7FiRia0WmC4fyCWJWBks9Qb2sdA+rG8aXbH4MEtE4eT3XPErFWV4KkBau2ox4hvF9uQtUv3w1BWNu7FOce/0JYpZYXhRTHHgFTsUQk78mnroOYW1gVQT5qFQgm1D2OsZkm/aYpgfIDkpbQDqw6BdxRJw2E2L4japjNEdytNtbylXXhjop5XV9ReHxc5KfZ+7toYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iAhclRdCOcP6SPOVgwH8uLvMM3AvLAKK8ozsECxGwl8=;
 b=nE8Xl5MtryS0LucVuY9/X1E9xSyxl7qHK6XHrWm8ZgfBuLWYz32Rn/EoL5YI3gsTD9ortbvj8IhvQajv97zpsmCoj73JJu2GFNJlkCz5KlRJqAjNct7OQLGIc4Q2bgOvr9s/3tkPGTdbf+ruE3tyB4Qfl5LqrWfIDkitUCS7OKE6Dt6fKUukD4TwlJ5mKliC5X/sczVyTBwSniIX4WOhpkbzzB0WKpSm/+/6CB5Xg0N4SqUalFCn+Qwy4IP7ViQbfUCq9RG6AJ0O2OrTT3leyYpJzLBUv/41VW+suJOEczrOQLhjlG52JvpuCjCp+ZX0gIGOMARkP1GqG+NJjax/AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cs-soprasteria.com; dmarc=pass action=none
 header.from=cs-soprasteria.com; dkim=pass header.d=cs-soprasteria.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cs-soprasteria.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iAhclRdCOcP6SPOVgwH8uLvMM3AvLAKK8ozsECxGwl8=;
 b=voy8ONeYI5gbAxEMT7ojHATLc77SySOi/VT3BWWPmEDYrHyrxA4SSWiBy+ff38zUl7TBpUYBq40Tzhh8KLh5p1+xelBDC7uI7i41JneEVjs2IyLj5EEVhZM+ML9D61Ay8nJDvMmLiKvikue/0iguBGxHxKWZrhi2Gx3wQfnpAncd6iOjFwUT16MUAiB+raAdEeI2GoWQ3Sz550zZooVUXWtWNAEYfPaAej6o3Psz07tXXH3DapjgJl96yzPyqqi6gevATNHpj6/zkMM7d/zPUXzqrChLh/VsRfYJLaNfvqkf/RxqBlZIUypSjswzjBw8fsumLFbWQFX2lf5Wk0SeFA==
Received: from AM0PR07MB6196.eurprd07.prod.outlook.com (2603:10a6:208:ed::33)
 by AS2PR07MB9326.eurprd07.prod.outlook.com (2603:10a6:20b:60a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.27; Tue, 29 Jul
 2025 07:41:40 +0000
Received: from AM0PR07MB6196.eurprd07.prod.outlook.com
 ([fe80::7cb7:ff63:d358:1a]) by AM0PR07MB6196.eurprd07.prod.outlook.com
 ([fe80::7cb7:ff63:d358:1a%4]) with mapi id 15.20.8943.029; Tue, 29 Jul 2025
 07:41:40 +0000
From: LEROY Christophe <christophe.leroy2@cs-soprasteria.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
CC: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
	"maddy@linux.ibm.com" <maddy@linux.ibm.com>
Subject: Ozlabs patchwork notification not working anymore
Thread-Topic: Ozlabs patchwork notification not working anymore
Thread-Index: AQHcAFw4rN5DoytN2E+Tfhrwbl3uIw==
Date: Tue, 29 Jul 2025 07:41:40 +0000
Message-ID: <8f6e5825-9468-4499-9bbd-4588a1eccc94@cs-soprasteria.com>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cs-soprasteria.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM0PR07MB6196:EE_|AS2PR07MB9326:EE_
x-ms-office365-filtering-correlation-id: ccb2d74e-bf5c-48fb-97a0-08ddce735b6a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?L210TmtjaGxERjhwSTAyT1QrUVlqcEh3ZzVDSWwwMHVWRUtUN0NiYU1VaWJx?=
 =?utf-8?B?SytuanJBckh4c21ZcGhIZTlLaFY5WXVoNHVaSFZ2ZFNyZEJtdzYxOWVPSHJh?=
 =?utf-8?B?T25acEJaZ2Rnb0xJdHppRy9GdlFoZzFOQXNRZXdaWTZnUmxicDllclVYL3dl?=
 =?utf-8?B?dU1mUEpkd1dvZmthajVDZlJwbW9SRWovWFdaWDdSOWFwOEpYOFFQS0dIdGdP?=
 =?utf-8?B?NGZoYjFaL3NVcllNZ1Mvb1BsNTA0RDlWU1hXeWlHSEdlSk9KRU4xakRhcStC?=
 =?utf-8?B?S1dUM1RLTlJhcFpqSUxydHROaUV2RFdoSXFMWFEva2pFMHovQ3R0WFVyNzVK?=
 =?utf-8?B?M0xWUVovQ00xNnZvZUw0c1hnQmU3VUFBL0tpTjh6TUxjQytlMkhYYnNQU3pu?=
 =?utf-8?B?RE5OWDNSemdBRXMvRUtMOURzN2dVOTNOUzkya3lQRXB4UGtIQVVUN0hCbFps?=
 =?utf-8?B?WWIwZFQzMWQrZXI2RGozQ3ZGUXpyZk9Gclc1MkNydmNqVWNPZmx6UVZucjBw?=
 =?utf-8?B?MDhvV2c4OTNmbGhKVXpKSjhkY2N3TVAwSzFFS2xCMmhFY1ljTzNFaVBjTmRE?=
 =?utf-8?B?TW9pdmNCcitMV25HRGlMQ2lUVE5rOTlNd282ME0zM1JUbVkwZllzTXNsTWpJ?=
 =?utf-8?B?MDBzTzVwZFhKOFBkNWZuKzdjb2V3Nys3QzRRSldQcjNmMmhtYzlZejNFODMw?=
 =?utf-8?B?TVBYS3BOL0N5c0tRQUplU3RPd0ZTMGptVHJIVXFBWEIxYkdSNkRocEdtb2dm?=
 =?utf-8?B?V1hNNWFVTXNvVElSaWVjV1Eva3BSVUlLbnRnQWYreHZFbXJEdUNjN0JiQUVi?=
 =?utf-8?B?cEYxM0lwVklSOG5lMjVlempaaWJMNDBEZEpnQitCcWhLL21vb1RCSnc1RTha?=
 =?utf-8?B?dU52NDlYdDJJYzZ4LzhZazUzTjBGNUdvNlZmWFF1dEhvbURTV0ZGLzZ3eHpY?=
 =?utf-8?B?QysvYTBoeE1SbjBYL204MWY2OEVBZ0x0SjVNcFhlS0dIci9CcmJBbzNqbE00?=
 =?utf-8?B?UDk2UGZSWVFRSWRHMllOc1NBclg1bHRvcnk0dURoLzhRbXdQY2NmdnBuQW1U?=
 =?utf-8?B?SEZDSXVXMG1zQVk1a0Z0M0M1MUtLLytrZkxvd2F0RWtpelk0Wnh5U0tsem05?=
 =?utf-8?B?VkdSQ3BidHVyVStzbHlsVHZPSmo0ZURHNElpSjRacmNXNWlsNFAzTkRMVStI?=
 =?utf-8?B?S05wSFpQVk1IQkpHTCtTVFBENCt5eVF3WmRIMzIwNFBwdEV5dW5CRHBmSkU0?=
 =?utf-8?B?VWRFTlBmSkFyRjZzblhMa0M5ZVFHQitML1RZUFZpVGh5Nk1XTnEzOVdjWjht?=
 =?utf-8?B?bndqaUJaaHRkVXUwaVh2d01OcU42OUxTZlZnSnJLTWlhYXZiaThXL3B1cmxE?=
 =?utf-8?B?K0xLaWsrVHFmT1Y4UndKdHhjVDZWRWhQSHIxRzRGZHBvWk9JemFMeDd2Vm51?=
 =?utf-8?B?a253SzZxZ2wyNDc4N3VPdlZSZEJmdWsvVzNBUzFCdXNwVGVJWTlseUlqaVl2?=
 =?utf-8?B?V3RVZGYyVWV3N29QL3kwNWxCR1pXUysxa2UvU0tqV2VuSVlZbkpkOGtQWGVL?=
 =?utf-8?B?RnZkM1RYWjc0VUpFWkR4UzlDY0o0d3JvUHVoUGQrNDRGeGxBQlRNVEI2Ritw?=
 =?utf-8?B?R1pwNVk2V3pzUDhGdnVwcXBXSVd6RndkbnI2dzgxMTlqR0V5dks3WWxIbi9J?=
 =?utf-8?B?ZVU3WHFmQnZmaVZvOUNYVXFTY1FmaUs5T1VVcTRSSzNYNnFwa0VWWnhaRG5V?=
 =?utf-8?B?MG54MEpyZUdzZW9STjFFc1FicXV2VjRvSm1XdEdQd0FCNU9tYVpKcDZVS3RW?=
 =?utf-8?B?WmtHaDNvOHo0ZUpTdmptUVB5Y05vMHd2TGJiV09idVVXYmcrL0pGTXBBVllE?=
 =?utf-8?B?b1ZYOEZVbW0rdWNKcytTdFQ4WTdOemEraHF0TEs2THBITUhFYTRQNjZFUlVr?=
 =?utf-8?B?TVpNVjlkR0RtNE9nUER5aWpsMGlIQlIzaXNGcGxabWFaVFFZN1ZVYnlNRVpE?=
 =?utf-8?B?UDhMdmYwdWRnPT0=?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM0PR07MB6196.eurprd07.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UVoyVHV1dTBVUDZhV3VUbnNZZk85MlVRbjBKVEdKMmlMVE5NcVlZUDhVZHVQ?=
 =?utf-8?B?b3UyRzgwbGpPMUk3UzdvZlFmRDhYRjRtS1Y4MEtrV3A1cUQwYW1YbjJKcTFn?=
 =?utf-8?B?TnVFTnkxMVFZS25NMEsrYWpkcjVOVnZobFozdGdGZ0NNbmV0NG9hU1RxSllU?=
 =?utf-8?B?SEhWcmpaMjdpZ1FhRHVLa2p4WWU3SDNMNFFCUTg2NUtIYTBBMmluelNqdDJ6?=
 =?utf-8?B?TEt3azVtOTI5ZUVVNm9mMmdDdXFGVU13Q1NpTjhsT3M1QkV4akRmL0V2d3JR?=
 =?utf-8?B?blg3ZDh4L0FleTNCNzhFK3k5UmpqeitPWkx0UXhJaG1yOFVoaEFIZG5OU0c4?=
 =?utf-8?B?WW9ZNnd2OUwwaGtYVFd3WEJWZlB4S3ZyTXE0eTVWNVRSdnZJdExPSFRWbVpS?=
 =?utf-8?B?MVQ1dmphWDJXeWptT3dwcXFIVEhWZFY4SXQ3L1RidGpmVFg4dmNyOWV4WTNI?=
 =?utf-8?B?dDFNWHN1NEJRNHA2T3ducXovYVpwTElEZWZMeFhyeGFvYUJxSTlHWTdxZlRr?=
 =?utf-8?B?UkZZbTh0QnVmd0UxZ2FQNG9Db3lEdTQxb3F6U1U3emxDQW9zNEFRZGJNWE5w?=
 =?utf-8?B?Skc2SGowc3ZLcElDVm5mYkJlZDhibHdMWi9ZbEhZbzQwS0kxYk9FdU9HZWlJ?=
 =?utf-8?B?dTF0UndPMWI0dExIYTBoS2xOTlBqc004S1VadEhUeDhxb05ZS2kyN1h5aTgw?=
 =?utf-8?B?bytKcU5uV0JQSlFFWGo1MHdyWjhDTUswR3kxMXJsQ0YrWFNaNmdNK2UzVXJr?=
 =?utf-8?B?SUQwTEZ2SHBzRkVab0dmS2s2MmFDUnhPOEVYeVNESHRHSmpjVTRBODNnK21C?=
 =?utf-8?B?TUNtODBjU05wRDN4dWpWQXJnczF2Um9MNkh4dlNnUGo0cSt1b2tuNmpVQVRm?=
 =?utf-8?B?Q2tpMVhCU21seG0rODNVNk1IcWZ3K2lrNGVTZGVWVU5wQndMaFJ2b21wbmVt?=
 =?utf-8?B?bmVseU1SNHFHTnkzaksrdWlHZWtKMWtjRUw0QURLQjMzUjg2R2xNUDNqWk1K?=
 =?utf-8?B?K0ViakxjZ01JSDlZVXVROXU2WlRiNGh0MXNjK2dBOWlEak1oVndOVjh6Tmo3?=
 =?utf-8?B?amtKdmRJSjlzNVNDMkRodzMzTi9LR1RHazRXakxTOFg2VmVKSWwweTZlcHlj?=
 =?utf-8?B?bjB3aGxuOXB0cEh0bW1ObUYwZFdvRFh0WTlMTS9pcGZMTFg5RWxkWXRKdUtE?=
 =?utf-8?B?V2dIbU1yYUYxVUQxQ1VuNlMxTlIycVFyU0YzaVhpL0QvZEVidlRPOTh1eWNu?=
 =?utf-8?B?RWFRS1hNWWc0ampPS1pkRFVvRGZlN3R0enVET3Rmb21tWEFZTnhlbFlHQ2dC?=
 =?utf-8?B?TWZCczFTZUZFWUtReG8wRWVpQ0pmSDV1N0VRdno5VWdEU3dzTW5xTEVEd3RK?=
 =?utf-8?B?eWZxUk1WS2RVSC85M0svZnJQZ0QxRnVhZ09hNGkzZFM1dk13UmJNRmUweCtu?=
 =?utf-8?B?RjUyZUg4eFVQNTNac09QanpLdzhueDNJRUZlTm9HeklTL0lpNmxYdnBxdXRv?=
 =?utf-8?B?b0RKQmxBVThLMW16NCtYbzF4NStPUGtUN1AwL0czNzR4aGJVK1RMSis5RTZx?=
 =?utf-8?B?eXdWNmxHaHdHbjViczdZdk5WSmtXbTBnMDBQSmRMc05mNWxCcnd2YWtyZU5T?=
 =?utf-8?B?TzBna1kxZ2FneFVtOG1tMHRUTENDL2FkUjlxR1FINlE4d3pLbjFQS2R4amcz?=
 =?utf-8?B?SGhiT0pKa2dUQlV3N0MrdkxUNWJqU3o2dWwybkw1S1NJK0lpaURvUXZ3T3lL?=
 =?utf-8?B?blhYa01FSkNHbjYwaTRQRXU4MFBLZ3NrNVF1VHROR1NMYkZiMW42RDFOOVZO?=
 =?utf-8?B?ZzkyRmtzbVdGMVVZUDJCM2VZSFZRR2x5WnArclZtZ1VscnRrNiswbVdOMHZp?=
 =?utf-8?B?ZVBpN1g5N01tS1Q5ZW1QRzZoTjduYVJ4VUZ1RTNYcHVwaUZPZHhHblQzUEdZ?=
 =?utf-8?B?eDZhaWpOazZJOWN6SUFrc0NFYWxsdkFyR3ppblJVZzU3d0tWZ3Erc3MvbzJK?=
 =?utf-8?B?OXVFOXdqTDMyM1F0T2NqTVdSblFSYnlvSkNnUFhldUJDM1o4Vnl4cEdTRzN2?=
 =?utf-8?B?VWRTS0VTbXg4OFRBOTBMbFJXU1oyZ1piVXlWaFAxeUVuZlBUOEN2UXE1UFJH?=
 =?utf-8?B?SCtZT2xld3lwa0l6OEZOQzBuZXFrR2JaVkowdXBJeGVtc0dhVVRNWVZQUzYr?=
 =?utf-8?B?QU9aT01JRGhJTnpKc0N1cURJT1R3NjBuNjQ1VDB4Rkx2QmdhdmhUVmMvNGps?=
 =?utf-8?B?UlFwdnhqc1RocTcxWVNQTUlrZVVnPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <2AA21336F8749C41B88BA284733644AC@eurprd07.prod.outlook.com>
Content-Transfer-Encoding: base64
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: cs-soprasteria.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM0PR07MB6196.eurprd07.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccb2d74e-bf5c-48fb-97a0-08ddce735b6a
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2025 07:41:40.6630
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8b87af7d-8647-4dc7-8df4-5f69a2011bb5
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QbgL4ASiT6n+cNE2viGTAtdSSkUX9/UDU0eByhEF932sI8Ghtji+lGSuFqsTOqdqFXegfm5d+WbDVDFXQunoBhK3Wa0HJvVxJnslThbcEknsInfUVECzuHr5FOTafA3J
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR07MB9326
X-MS-Exchange-CrossPremises-AuthAs: Internal
X-MS-Exchange-CrossPremises-AuthMechanism: 04
X-MS-Exchange-CrossPremises-AuthSource: AM0PR07MB6196.eurprd07.prod.outlook.com
X-MS-Exchange-CrossPremises-TransportTrafficType: Email
X-MS-Exchange-CrossPremises-SCL: 1
X-MS-Exchange-CrossPremises-messagesource: StoreDriver
X-MS-Exchange-CrossPremises-BCC:
X-MS-Exchange-CrossPremises-originalclientipaddress: 2a01:e0a:511:aad0:9f10:86ad:5cd0:9703
X-MS-Exchange-CrossPremises-transporttraffictype: Email
X-MS-Exchange-CrossPremises-antispam-scancontext: DIR:Originating;SFV:NSPM;SKIP:0;
X-MS-Exchange-CrossPremises-processed-by-journaling: Journal Agent
X-OrganizationHeadersPreserved: AS2PR07MB9326.eurprd07.prod.outlook.com
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

SGkgU3RlcGhlbiwNCg0KSWYgSSByZW1lbWJlciBjb3JyZWN0bHkgeW91IG1haW50YWluIHRoZSBP
emxhYnMgcGF0Y2h3b3JrIGFyZW4ndCB5b3UgPw0KDQpGb3IgbW9yZSB0aGFuIG9uZSB5ZWFyIG5v
dywgcGF0Y2h3b3JrIGZvciBsaW51eHBwYy1kZXYgaGFzbid0IHNlbnQgDQpub3RpZmljYXRpb25z
IGFib3V0IHBhdGNoZXMgc3RhdHVzIGNoYW5nZXMuIExhc3Qgbm90aWZpY2F0aW9uIEkgcmVjZWl2
ZWQgDQp3YXMgMTEgSnVuZSAyMDI0Lg0KDQpJcyB0aGVyZSBhIHJlYXNvbiBmb3IgdGhhdCBjaGFu
Z2UgPyBJIHJlY2VudGx5IGdvdCBxdWVzdGlvbnMgZnJvbSBwZW9wbGUgDQphc2tpbmcgbWUgd2h5
IHRoZXkgZGlkbid0IGdldCBub3RpZmllZCB3aGVuIEkgc3RhcnRlZCBsb29raW5nIGF0IHRoZWly
IA0KcGF0Y2hlcy4NCg0KSXMgaXQgcG9zc2libGUgdG8gcmVzdG9yZSBwcmV2aW91cyBiZWhhdmlv
dXIgPw0KDQpUaGFua3MNCkNocmlzdG9waGUNCg==

