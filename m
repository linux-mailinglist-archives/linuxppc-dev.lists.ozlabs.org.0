Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F403E8BDF7E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 12:13:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=YD0C3a+6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYYyl3j4cz3fSm
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 20:13:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=csgroup.eu header.i=@csgroup.eu header.a=rsa-sha256 header.s=selector2 header.b=YD0C3a+6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=2a01:111:f403:c20a::1; helo=pa5p264cu001.outbound.protection.outlook.com; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazlp170100001.outbound.protection.outlook.com [IPv6:2a01:111:f403:c20a::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYYy001fxz3cX4
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 20:13:10 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GzRNiaywvAekZ+WZOyikgLUvB8PtTMt8pqYFGeqbdpuuoUiJ05VKmty6e14NcEPVmh7PfB3lc0ftSiWOc/3C9TOItTEdInE5ccO70G+LYh24okPZlIW1U8aK0BJo1/0F0jmY0CvgllCUxjXXGozLugkwLeEwEf0l2Fb4grs7VTlFtT9p//rU3vVj7U+BzFQhGMohLb4i9kw4Ui+mSaoQANy7Dz0B7keyrOMxNv7vn0gZykd9Ld0wiBGYYIzhDsQE4t0kWTMR/7klKMYHaLYgIAjud1X9UE3x+9peJ7GPe69MWd+SoDu9yhda3IhfU/pPNudbJA5MWmz7k6QQbKNKSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NSpsoYJjXx+Ku28CcmW5Bz7lURjcLDFbbf5c9PbbEjQ=;
 b=Tn4O4xMpJU7nZKPoevn7k/HujhVd3Phha/QhN/l2nkqOqCGlqEhuM4zL1KiYHt5B+8WRdFT/VMQhjW+Af1jSTDHm/q6OZU88JvAGJ/o+GzG+wcasAxRr5G1rmjzE8POBJ3yP0UuLD4mRsiOzVxgBfc31f/ZeDEW/Uv61Y/TuS3/n27WhwT6nG2+HOm7LCB9UhF8emkFwDbPfOD3jfl/AYd303mYFrwZjRfsZuO2EvhYlsK+taQE00OMfOHuUo9aORG+zJWm8mrgJMahgiPb7/ser7dVjN4VFOqDwyf1I7yuow0NHJsN6uXHZO2WoBLmJvFJPMM320n13PKm1kuK2Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=csgroup.eu; dmarc=pass action=none header.from=csgroup.eu;
 dkim=pass header.d=csgroup.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=csgroup.eu;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NSpsoYJjXx+Ku28CcmW5Bz7lURjcLDFbbf5c9PbbEjQ=;
 b=YD0C3a+6yzaaUb2PmvQcZdS6HwOo4k1qNcpmO+SueMiDFhDlNlUufdQ+S/bjO/0C7f8dpp0xGXA9TVtjNrN2Lym80rJ5WKEd1oPTwiif+RQfOpsehU11moTS+tXQFdmjyohU+coRNgv8ZFNAWxigbqvFG8OkB1KEU2SbDo3/wR9QfhAIEkWuM5nY8PfmWdoj6kF80LtW7KJUQG3NjYX09d2oFcIVhcYyzxKP7K9eNEKTojeZ3N0Kewnp3RQDFJfDrByaS0yaxMYn7s8wBq2FLK8APDFDB/0tfB8qJA90VnHi8Y6+ewaoDwKN7HrgMJ4BahjFrfa+G/5qkHcbnG8U0w==
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:31::15)
 by PR0P264MB2710.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1d1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.42; Tue, 7 May
 2024 10:12:47 +0000
Received: from MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb]) by MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
 ([fe80::1f75:cb9f:416:4dbb%7]) with mapi id 15.20.7544.041; Tue, 7 May 2024
 10:12:47 +0000
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>, "linuxppc-dev@lists.ozlabs.org"
	<linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH 6/7] powerpc: Replace CONFIG_4xx with CONFIG_44x
Thread-Topic: [PATCH 6/7] powerpc: Replace CONFIG_4xx with CONFIG_44x
Thread-Index: AQHan7RDvjMzMJ8dtku3ITmQf4F9vbGLjs+A
Date: Tue, 7 May 2024 10:12:47 +0000
Message-ID: <c7f93273-7cf1-4581-993e-f90c50db9352@csgroup.eu>
References: <20240506125152.78174-1-mpe@ellerman.id.au>
 <20240506125152.78174-7-mpe@ellerman.id.au>
In-Reply-To: <20240506125152.78174-7-mpe@ellerman.id.au>
Accept-Language: fr-FR, en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=csgroup.eu;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MRZP264MB2988:EE_|PR0P264MB2710:EE_
x-ms-office365-filtering-correlation-id: b78ef0f1-1b87-4941-304c-08dc6e7e3eac
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230031|366007|1800799015|376005|38070700009;
x-microsoft-antispam-message-info:  =?utf-8?B?U0xZUjYyenByV3VkZUFFcnl2N0FoZHZlUERPcGV6a3ZVcXFjT1doVkRUdDJj?=
 =?utf-8?B?a1pJckcvWGU1QVI0bDVxV2VnR05tQWdkbVRDcE94aWlvclphbi9tVUpHSFla?=
 =?utf-8?B?eWw3T3kzV3htalNEa0s0MEpCbW9iK2xveEcyT0NyTWNWdnJ5VmFlZmw1andU?=
 =?utf-8?B?SElzV3VLZThieCtFWGRZcEZia2M5ZnBIV3QxaGxad2pwenhUSmZqMzQzaWtK?=
 =?utf-8?B?MEg2K09wSkRmN2xuYUNxcnFQSlkva0RsSGV1cEw0c1FDNHZzSmx5U0xYVnFn?=
 =?utf-8?B?VTlDMUJNSDJ0TjhYY1NLb053bS9Hc1JKMUFaeGRiekpBRHVTWVV5VnFxb2pS?=
 =?utf-8?B?b3NlTC83ZTU1aXkwbmNVNGFsOXBxMWo1SmZWcDBUMm4zSkMxQnoxYmxUWWJ3?=
 =?utf-8?B?ckJMeDdOQXVNTFBKeC9rTWNDNU1Qa3J1a0pIaXQyWEtmZC8vYVU5ZEUzRUd6?=
 =?utf-8?B?b3Zic2s4TGdFSjhhYUhyV1REUC8xMmQxZkdacUZGcC9aSHBaSkZNTmpzdFA2?=
 =?utf-8?B?V1NIRVRyWmk0akw4TGZRNGFCSTg4T2dBcU9md3Q5cnpXSkRneDRpUWttTW1x?=
 =?utf-8?B?MmNZb1hIMUUvNjdZS0d2d0M3SDNqeWlJREZSUGZLWnZqblI2d05MbEFCMFhC?=
 =?utf-8?B?S3B6SnNFR1FMVWNPZHdSNkdkTG5qNEVEMFpLQ1VCZS9OY1Z3WjkvV0JWTkhl?=
 =?utf-8?B?aS84clptTFN4eG54d0VYSS9BK3dxSFpvcWdQRlFFaVF5ZzVVb0JuYmZVK0ow?=
 =?utf-8?B?VzYwaEIyeEYwZU43eWo4WmRXQ25rTEVUZFE1UW9aNFkzZStNVzR3bUFRRHV4?=
 =?utf-8?B?OEFpcnlXVi9aTzRBQ1YyaVVJTmkzdzBTekNrTWdLNTZFZlEwVGMxNS9aNStj?=
 =?utf-8?B?WmxvYXg5V3ZlNkRPTmhBUSs0MlF1dVQwMThMRUg5Y3hQd2t1RHlxZGk4VlQx?=
 =?utf-8?B?WnB1TER0Y1ozWEZnTm4wVUFJNmRDT3hOL29CU1hBN2VEb3prZDdnNlFTUkV6?=
 =?utf-8?B?c3ZUbXJXSEVCVDd3Y0RMN2txVXArSmNnYVhJS2VyUEsrQVRUSmplazNXQ0hn?=
 =?utf-8?B?N0xLdGFYa3VWVGlkNWVNZUlzdmZ0WE92MHZzcTFwQWZoM0RERFlUaHVvNUhO?=
 =?utf-8?B?N2l3RW9DMkQ0ckpCem9pWEMvVDhBWFVjcjZwRG02SVp0NG1ybGhTMWtQVDV6?=
 =?utf-8?B?Yzd3L0ZxRlR5TUtVdHlRa0NsMDdVUWxybkJwSFNCK0hMaytYaE11TE4rU2RS?=
 =?utf-8?B?ZEd3OWtibXI5dHZoRlJoYkxUMGplK2I3ODRxWnl6bG1JREk1VEpzMGRtdDJE?=
 =?utf-8?B?NFN4R2E5Q2oxV2JDVWYrOUxCczE0cC9kL1pkWktOWjZYcmFOMG9DVHdPdG5i?=
 =?utf-8?B?VHNKK3pzOTlhY2V3UHBmRjJzR3ArVDVobDZST055c3J3ZDJNbjNETlhsQU9t?=
 =?utf-8?B?SXpVdk02dTZEdkR2eDAwZUppMGlLOHl3OVNtSVBVWGZaaWs2NXNpQlhkMUY3?=
 =?utf-8?B?bk9RQWdXaWQ5amVlU1dTRXVKQWhhYllhUWRrd1d3cVhIdS9Wb0RXR3NNNHlw?=
 =?utf-8?B?aTliOEU4SGVKUGhuVGRIVHBQTmNJSER1K1FmM0NHRys3SXJzdDNFZGtFbVFj?=
 =?utf-8?B?QzR6UWdiYnQ2MWFWTVpRc1hEcnRRcm9aTW14SGZXWEhtdjRaKzlHd2FyQjdR?=
 =?utf-8?B?TU10WlRyRGUzVFZNMWxaRmY0WWdvZXpzbWdLT0tZRHFNVGt3TTZTTUdyNFJq?=
 =?utf-8?B?M2R1eXVHQktoQzNDUlpoc2tBajRNZUE1dEJGRjhzbTBlajdURGsyUm9jbmJD?=
 =?utf-8?B?OXAwN241TFhjenZjWkJIUT09?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031)(366007)(1800799015)(376005)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?Ui85cUV3QlU0bUFRMmNydlNBZUhyaEZnenJSMUxkYlA2YjgrV1cxKzlkd1ho?=
 =?utf-8?B?SkVkN0Fab2t5VlptNStkblg2aTZpT0V5Zi94bTFBV2Y2aVU2NWlrd2dJMzV0?=
 =?utf-8?B?VnRJa2NuaE9LUk1ydXVwZGFTemR6TUNnTnUramlEaFNBRkg5anVNWE1TS2tp?=
 =?utf-8?B?Kys1enlmUnl2NEdYbnpkM1JFY2hCUkZoaVppbnJXL2lFRnZPN3lySXpKWWlv?=
 =?utf-8?B?MG43RlV1dGdNYWRhdnRSRGZYUW1SNElJZmQ5ZU5NRUhiaHFuc29zczJzUGl5?=
 =?utf-8?B?NHNvMU8xejRHQ21mWEp0YVVtK1lKOVlpRnFhaG42b3VpVEVIRzBYbWt4NUZZ?=
 =?utf-8?B?MTdCRHVrN3FaOWZCZE5IaDBvZkNFZ3VadzZyOTBDVVMzcEV2RXYzd1RLVHo5?=
 =?utf-8?B?OUZtclVFbUx1QXpvVTY3Y0luZU5pNFJET09odFJROGptQ0s4ZDlLR0hyYTFi?=
 =?utf-8?B?cmpHN1VRWUJOcmd2UzdnSjQ2dWdTQk1VS0ZlejZMZ1JyZ29KdFZVdkxrVzlO?=
 =?utf-8?B?cG1NRnhLWjI0akJHQmUwM1JwQnVoK3p5RXlKUnVqcmN4SCtvQmFXZk1OS2p0?=
 =?utf-8?B?RERndGpwRmlNTVU0ZnhiRHZGd21GaUVUaWR2d2ZyN2c2K2dVd3EzRzJmbDVt?=
 =?utf-8?B?NnRlN203UEVCMnZMZDhaaHVDSDQyVkwrUjRhNkwrRjI4eXZTNkovd2VKR2VT?=
 =?utf-8?B?ZzM2QmlTb01sWDhubHF3bFpxWHVDNmVHWW0rZlVpOTRnUWtpbE5FcHI3MytG?=
 =?utf-8?B?L0tlZmthdHpsMVNQOUpsVDJhQy84VHVvNFRKWFpRSE5RNzkwR3IxSWl1MVpE?=
 =?utf-8?B?aDc0Y0kvcFpBYzhoZzkrTjZ2QWh3T2RWTG9vQzFBRWxOYjdRMVJBTHJnMlQ3?=
 =?utf-8?B?UTVFYlVqdWM3N1RZTDN1QnZ1TXI0YTF4T2RUVU04K1NRcm9hWlAycDVMbzRD?=
 =?utf-8?B?L2E5Q0VzOG0zamlBYm5xdGZOWDVhSUZCWTFDZE43b1RaNlZUMmVrcTJaUlVV?=
 =?utf-8?B?VXoxSTk0dXdmRFNEd2VqSEtPNEY3RitaMWo1RGYyNklmd1BzaTkyZWRCOE9R?=
 =?utf-8?B?TzFKWERaazJOM1JKQ01NT0ZvZmpOSmxxbXo0eWY2RTE0ZmsrSkRCcjZWcC9p?=
 =?utf-8?B?YU9TeDNlSWpjVm1yVEpJL3diQ1Fxb2p3U3huNStTR000bDNkWkZUc2czcUEx?=
 =?utf-8?B?YkdjVWd2dVVMQmZmUGY0aThSYmR1Ymxzb2lndUxTcVoySEVoMkc3L2Rjaloz?=
 =?utf-8?B?bUZPWnNUazZ2UmliYnBLbFFpUzk0YVBmeG8rSDNER0FEZXA5eGVPc3VpYUYr?=
 =?utf-8?B?Y1E4WmZVbFlUeDd5SUhWdmN6dk1GdmFLQ3ZRMFdKNFR5UEJmMkR3cFpPb29T?=
 =?utf-8?B?eTRESG5yMlEwdXl1L0FrdGlpR0NEOTcxTkQ2Z2dXVDZsUTlQTFBPRlU3SzIw?=
 =?utf-8?B?SkhoUTRzeDJJVWF4Uk9mN2h6VUZuNGFiNC81T1hUMkhFQjBRYnU1c0U0Z1Rw?=
 =?utf-8?B?ZXdXZ2tnNW5nVW9VaXgzdkdoWkJud1hVYXZvNWxRejVFSStqaEhndGpJcy9C?=
 =?utf-8?B?QXB6VFhidmJUYmViUENPZ0gvemxPNGQxblJEN1BxTzZ1VWtlTHprL0E4TjFV?=
 =?utf-8?B?aGMxdmZoOVE0Y013MTVJbjM5czFyUDRROG44TC9sMW5GNStnWG92N013dWNY?=
 =?utf-8?B?V3NCNklvN1FydUcyTjQxSFlCamk3bzdCNHRJSVBCaTBaN0k0cDRtNmFnVHEw?=
 =?utf-8?B?OWJWbDZHWllxbXIxTVBVdW1pdTVFWFYrQktyeStQQjlYanhrVUo1SCthRndJ?=
 =?utf-8?B?cVBPUzF1MDBJdElWN2Rrc3U1dXFEL3kwaHNLWE5FR084L1dOWU5VSHBpc201?=
 =?utf-8?B?VW1CZXc3MDhicHNSbTQrRTcyMS9KaS9BYldPbjQzNjNKOWZlb0VZVUJvVTNp?=
 =?utf-8?B?aXJmekJoWFNmYTZyeDlxbTBSR1FoMEl4NTk3d3YrdXJzZWcxYnhUUjlqUHVp?=
 =?utf-8?B?MUxXTFNUQ1ZWbGhlWnZydnJCYTIvaExkRGd0UUVHMlViRVRwaGZhQnJyUSs4?=
 =?utf-8?B?akxCeDlQZElyWnlYd256VWlSY2lvOEdXZ1ZhWEdkdzMwcENuSytoN1VtRjFM?=
 =?utf-8?B?ZnJLakZHNWZIcTJXeDJ3aWpWdTVUWVhuNjNENHl2NTFqczlkdlpzZGZNNjVi?=
 =?utf-8?B?eEx0K2xpdzFsYzc3a2hhSkNnVWFRRVV5aVNKY3liOTNOdnEwZjBBc2lrUmF6?=
 =?utf-8?B?RUN4WXd0endkeXV5SndWVk00NDB3PT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4E1B5A63679C044B8BA4C718A2ADB5BE@FRAP264.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: csgroup.eu
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MRZP264MB2988.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b78ef0f1-1b87-4941-304c-08dc6e7e3eac
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 May 2024 10:12:47.5945
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9914def7-b676-4fda-8815-5d49fb3b45c8
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+lVGq0+WNuuErdw+adL2+WMuuY8/5w7uzHSVdgTKMUkU3L/K/Qzug964YGNxpri0QAJ08IU26cGjHcIt86ZCGt+qQ+WVfZLSHZ4+MV4p7c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR0P264MB2710
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

DQoNCkxlIDA2LzA1LzIwMjQgw6AgMTQ6NTEsIE1pY2hhZWwgRWxsZXJtYW4gYSDDqWNyaXTCoDoN
Cj4gUmVwbGFjZSA0eHggdXNhZ2Ugd2l0aCA0NHgsIGFuZCByZXBsYWNlIDR4eF9TT0Mgd2l0aCA0
NHguDQoNCllvdSBjYW4gZ28gb25lIHN0ZXAgZnVydGhlciBiZWNhdXNlIENPTkZJR180NHggaW1w
bGllcyBDT05GSUdfQk9PS0UsIHNlZSANCmh0dHBzOi8vcGF0Y2h3b3JrLm96bGFicy5vcmcvcHJv
amVjdC9saW51eHBwYy1kZXYvcGF0Y2gvZDQwNGQxMjU3Y2QxZDM2YWE2YjI1MjM3ZjU0ZWIyYzIy
MjNjZTQ0Ny4xNjA3NTE5NTE3LmdpdC5jaHJpc3RvcGhlLmxlcm95QGNzZ3JvdXAuZXUvDQoNCj4g
DQo+IFNpZ25lZC1vZmYtYnk6IE1pY2hhZWwgRWxsZXJtYW4gPG1wZUBlbGxlcm1hbi5pZC5hdT4N
Cj4gLS0tDQo+ICAgYXJjaC9wb3dlcnBjL0tjb25maWcgICAgICAgICAgICAgICAgICAgfCA1ICst
LS0tDQo+ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NhY2hlZmx1c2guaCAgfCAyICstDQo+
ICAgYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwY19hc20uaCAgICAgfCAyICstDQo+ICAgYXJj
aC9wb3dlcnBjL2tlcm5lbC9lbnRyeV8zMi5TICAgICAgICAgfCA2ICsrKy0tLQ0KPiAgIGFyY2gv
cG93ZXJwYy9rZXJuZWwvcHJvY2Vzcy5jICAgICAgICAgIHwgMiArLQ0KPiAgIGFyY2gvcG93ZXJw
Yy9tbS9mYXVsdC5jICAgICAgICAgICAgICAgIHwgNCArKy0tDQo+ICAgYXJjaC9wb3dlcnBjL21t
L3B0ZHVtcC9NYWtlZmlsZSAgICAgICAgfCAyICstDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jt
cy80eHgvTWFrZWZpbGUgICAgfCAyICstDQo+ICAgYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9LY29u
ZmlnLmNwdXR5cGUgfCA4ICstLS0tLS0tDQo+ICAgYXJjaC9wb3dlcnBjL3N5c2Rldi9LY29uZmln
ICAgICAgICAgICAgfCA0ICsrLS0NCj4gICAxMCBmaWxlcyBjaGFuZ2VkLCAxNCBpbnNlcnRpb25z
KCspLCAyMyBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMvS2Nv
bmZpZyBiL2FyY2gvcG93ZXJwYy9LY29uZmlnDQo+IGluZGV4IDlhN2QyYjIxODUxNi4uMmI2ZmE4
NzQ2NGE1IDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvS2NvbmZpZw0KPiArKysgYi9hcmNo
L3Bvd2VycGMvS2NvbmZpZw0KPiBAQCAtNDg4LDcgKzQ4OCw3IEBAIHNvdXJjZSAia2VybmVsL0tj
b25maWcuaHoiDQo+ICAgDQo+ICAgY29uZmlnIE1BVEhfRU1VTEFUSU9ODQo+ICAgCWJvb2wgIk1h
dGggZW11bGF0aW9uIg0KPiAtCWRlcGVuZHMgb24gNHh4IHx8IFBQQ184eHggfHwgUFBDX01QQzgz
MnggfHwgQk9PS0UgfHwgUFBDX01JQ1JPV0FUVA0KPiArCWRlcGVuZHMgb24gNDR4IHx8IFBQQ184
eHggfHwgUFBDX01QQzgzMnggfHwgQk9PS0UgfHwgUFBDX01JQ1JPV0FUVA0KPiAgIAlzZWxlY3Qg
UFBDX0ZQVV9SRUdTDQo+ICAgCWhlbHANCj4gICAJICBTb21lIFBvd2VyUEMgY2hpcHMgZGVzaWdu
ZWQgZm9yIGVtYmVkZGVkIGFwcGxpY2F0aW9ucyBkbyBub3QgaGF2ZQ0KPiBAQCAtMTEwMiw5ICsx
MTAyLDYgQEAgY29uZmlnIFBQQzR4eF9DUE0NCj4gICAJICBJdCBhbHNvIGVuYWJsZXMgc3VwcG9y
dCBmb3IgdHdvIGRpZmZlcmVudCBpZGxlIHN0YXRlcyAoaWRsZS13YWl0DQo+ICAgCSAgYW5kIGlk
bGUtZG96ZSkuDQo+ICAgDQo+IC1jb25maWcgNHh4X1NPQw0KPiAtCWJvb2wNCj4gLQ0KPiAgIGNv
bmZpZyBGU0xfTEJDDQo+ICAgCWJvb2wgIkZyZWVzY2FsZSBMb2NhbCBCdXMgc3VwcG9ydCINCj4g
ICAJaGVscA0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2NhY2hlZmx1
c2guaCBiL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9jYWNoZWZsdXNoLmgNCj4gaW5kZXggZWY3
ZDJkZTMzYjg5Li5mMjY1Njc3NGFhYTkgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9jYWNoZWZsdXNoLmgNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL2Nh
Y2hlZmx1c2guaA0KPiBAQCAtMTIxLDcgKzEyMSw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBpbnZh
bGlkYXRlX2RjYWNoZV9yYW5nZSh1bnNpZ25lZCBsb25nIHN0YXJ0LA0KPiAgIAltYigpOwkvKiBz
eW5jICovDQo+ICAgfQ0KPiAgIA0KPiAtI2lmZGVmIENPTkZJR180eHgNCj4gKyNpZmRlZiBDT05G
SUdfNDR4DQo+ICAgc3RhdGljIGlubGluZSB2b2lkIGZsdXNoX2luc3RydWN0aW9uX2NhY2hlKHZv
aWQpDQo+ICAgew0KPiAgIAlpY2NjaSgodm9pZCAqKUtFUk5FTEJBU0UpOw0KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwY19hc20uaCBiL2FyY2gvcG93ZXJwYy9pbmNs
dWRlL2FzbS9wcGNfYXNtLmgNCj4gaW5kZXggMWQxMDE4YzFlNDgyLi4wMjg5N2Y0YjBkYmYgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9pbmNsdWRlL2FzbS9wcGNfYXNtLmgNCj4gKysrIGIv
YXJjaC9wb3dlcnBjL2luY2x1ZGUvYXNtL3BwY19hc20uaA0KPiBAQCAtNDgyLDcgKzQ4Miw3IEBA
IEVORF9GVFJfU0VDVElPTl9ORVNURUQoQ1BVX0ZUUl9DRUxMX1RCX0JVRywgQ1BVX0ZUUl9DRUxM
X1RCX0JVRywgOTYpDQo+ICAgICogYW5kIHRoZXkgbXVzdCBiZSB1c2VkLg0KPiAgICAqLw0KPiAg
IA0KPiAtI2lmICFkZWZpbmVkKENPTkZJR180eHgpICYmICFkZWZpbmVkKENPTkZJR19QUENfOHh4
KQ0KPiArI2lmICFkZWZpbmVkKENPTkZJR180NHgpICYmICFkZWZpbmVkKENPTkZJR19QUENfOHh4
KQ0KPiAgICNkZWZpbmUgdGxiaWEJCQkJCVwNCj4gICAJbGkJcjQsMTAyNDsJCQlcDQo+ICAgCW10
Y3RyCXI0OwkJCQlcDQo+IGRpZmYgLS1naXQgYS9hcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzMy
LlMgYi9hcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzMyLlMNCj4gaW5kZXggMTUyMjE2NGIxMGU0
Li45OGFkOTI2YzA1NmYgMTAwNjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9rZXJuZWwvZW50cnlf
MzIuUw0KPiArKysgYi9hcmNoL3Bvd2VycGMva2VybmVsL2VudHJ5XzMyLlMNCj4gQEAgLTIxMSw3
ICsyMTEsNyBAQCBzdGFydF9rZXJuZWxfdGhyZWFkOg0KPiAgIA0KPiAgIAkuZ2xvYmwJZmFzdF9l
eGNlcHRpb25fcmV0dXJuDQo+ICAgZmFzdF9leGNlcHRpb25fcmV0dXJuOg0KPiAtI2lmICEoZGVm
aW5lZChDT05GSUdfNHh4KSB8fCBkZWZpbmVkKENPTkZJR19CT09LRSkpDQo+ICsjaWYgIShkZWZp
bmVkKENPTkZJR180NHgpIHx8IGRlZmluZWQoQ09ORklHX0JPT0tFKSkNCj4gICAJYW5kaS4JcjEw
LHI5LE1TUl9SSQkJLyogY2hlY2sgZm9yIHJlY292ZXJhYmxlIGludGVycnVwdCAqLw0KPiAgIAli
ZXEJM2YJCQkvKiBpZiBub3QsIHdlJ3ZlIGdvdCBwcm9ibGVtcyAqLw0KPiAgICNlbmRpZg0KPiBA
QCAtMzY1LDcgKzM2NSw3IEBAIEFMVF9GVFJfU0VDVElPTl9FTkRfSUZDTFIoQ1BVX0ZUUl9TVENY
X0NIRUNLU19BRERSRVNTKQ0KPiAgIAlyZmkNCj4gICBfQVNNX05PS1BST0JFX1NZTUJPTChpbnRl
cnJ1cHRfcmV0dXJuKQ0KPiAgIA0KPiAtI2lmIGRlZmluZWQoQ09ORklHXzR4eCkgfHwgZGVmaW5l
ZChDT05GSUdfQk9PS0UpDQo+ICsjaWYgZGVmaW5lZChDT05GSUdfNDR4KSB8fCBkZWZpbmVkKENP
TkZJR19CT09LRSkNCj4gICANCj4gICAvKg0KPiAgICAqIFJldHVybmluZyBmcm9tIGEgY3JpdGlj
YWwgaW50ZXJydXB0IGluIHVzZXIgbW9kZSBkb2Vzbid0IG5lZWQNCj4gQEAgLTQ2OSw0ICs0Njks
NCBAQCByZXRfZnJvbV9tY2hlY2tfZXhjOg0KPiAgIAlSRVRfRlJPTV9FWENfTEVWRUwoU1BSTl9N
Q1NSUjAsIFNQUk5fTUNTUlIxLCBQUENfUkZNQ0kpDQo+ICAgX0FTTV9OT0tQUk9CRV9TWU1CT0wo
cmV0X2Zyb21fbWNoZWNrX2V4YykNCj4gICAjZW5kaWYgLyogQ09ORklHX0JPT0tFICovDQo+IC0j
ZW5kaWYgLyogIShDT05GSUdfNHh4IHx8IENPTkZJR19CT09LRSkgKi8NCj4gKyNlbmRpZiAvKiAh
KENPTkZJR180NHggfHwgQ09ORklHX0JPT0tFKSAqLw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dl
cnBjL2tlcm5lbC9wcm9jZXNzLmMgYi9hcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYw0KPiBp
bmRleCAxOTZjZmE0MWFkNmUuLmNkZGI0YzA5OWJiZCAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dl
cnBjL2tlcm5lbC9wcm9jZXNzLmMNCj4gKysrIGIvYXJjaC9wb3dlcnBjL2tlcm5lbC9wcm9jZXNz
LmMNCj4gQEAgLTE1NjYsNyArMTU2Niw3IEBAIHN0YXRpYyB2b2lkIF9fc2hvd19yZWdzKHN0cnVj
dCBwdF9yZWdzICpyZWdzKQ0KPiAgIAlpZiAodHJhcCA9PSBJTlRFUlJVUFRfTUFDSElORV9DSEVD
SyB8fA0KPiAgIAkgICAgdHJhcCA9PSBJTlRFUlJVUFRfREFUQV9TVE9SQUdFIHx8DQo+ICAgCSAg
ICB0cmFwID09IElOVEVSUlVQVF9BTElHTk1FTlQpIHsNCj4gLQkJaWYgKElTX0VOQUJMRUQoQ09O
RklHXzR4eCkgfHwgSVNfRU5BQkxFRChDT05GSUdfQk9PS0UpKQ0KPiArCQlpZiAoSVNfRU5BQkxF
RChDT05GSUdfNDR4KSB8fCBJU19FTkFCTEVEKENPTkZJR19CT09LRSkpDQo+ICAgCQkJcHJfY29u
dCgiREVBUjogIlJFRyIgRVNSOiAiUkVHIiAiLCByZWdzLT5kZWFyLCByZWdzLT5lc3IpOw0KPiAg
IAkJZWxzZQ0KPiAgIAkJCXByX2NvbnQoIkRBUjogIlJFRyIgRFNJU1I6ICUwOGx4ICIsIHJlZ3Mt
PmRhciwgcmVncy0+ZHNpc3IpOw0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL2ZhdWx0
LmMgYi9hcmNoL3Bvd2VycGMvbW0vZmF1bHQuYw0KPiBpbmRleCA1MzMzNWFlMjFhNDAuLjlhZjQ0
ZGRmNGI1MyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL21tL2ZhdWx0LmMNCj4gKysrIGIv
YXJjaC9wb3dlcnBjL21tL2ZhdWx0LmMNCj4gQEAgLTM2MSwxMyArMzYxLDEzIEBAIHN0YXRpYyB2
b2lkIHNhbml0eV9jaGVja19mYXVsdChib29sIGlzX3dyaXRlLCBib29sIGlzX3VzZXIsDQo+ICAg
ICogRGVmaW5lIHRoZSBjb3JyZWN0ICJpc193cml0ZSIgYml0IGluIGVycm9yX2NvZGUgYmFzZWQN
Cj4gICAgKiBvbiB0aGUgcHJvY2Vzc29yIGZhbWlseQ0KPiAgICAqLw0KPiAtI2lmIChkZWZpbmVk
KENPTkZJR180eHgpIHx8IGRlZmluZWQoQ09ORklHX0JPT0tFKSkNCj4gKyNpZiAoZGVmaW5lZChD
T05GSUdfNDR4KSB8fCBkZWZpbmVkKENPTkZJR19CT09LRSkpDQo+ICAgI2RlZmluZSBwYWdlX2Zh
dWx0X2lzX3dyaXRlKF9fZXJyKQkoKF9fZXJyKSAmIEVTUl9EU1QpDQo+ICAgI2Vsc2UNCj4gICAj
ZGVmaW5lIHBhZ2VfZmF1bHRfaXNfd3JpdGUoX19lcnIpCSgoX19lcnIpICYgRFNJU1JfSVNTVE9S
RSkNCj4gICAjZW5kaWYNCj4gICANCj4gLSNpZiBkZWZpbmVkKENPTkZJR180eHgpIHx8IGRlZmlu
ZWQoQ09ORklHX0JPT0tFKQ0KPiArI2lmIGRlZmluZWQoQ09ORklHXzQ0eCkgfHwgZGVmaW5lZChD
T05GSUdfQk9PS0UpDQo+ICAgI2RlZmluZSBwYWdlX2ZhdWx0X2lzX2JhZChfX2VycikJKDApDQo+
ICAgI2VsaWYgZGVmaW5lZChDT05GSUdfUFBDXzh4eCkNCj4gICAjZGVmaW5lIHBhZ2VfZmF1bHRf
aXNfYmFkKF9fZXJyKQkoKF9fZXJyKSAmIERTSVNSX05PRVhFQ19PUl9HKQ0KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL21tL3B0ZHVtcC9NYWtlZmlsZSBiL2FyY2gvcG93ZXJwYy9tbS9wdGR1
bXAvTWFrZWZpbGUNCj4gaW5kZXggZGM4OTZkMjg3NGYzLi4wZjdhMDUwZjMyN2UgMTAwNjQ0DQo+
IC0tLSBhL2FyY2gvcG93ZXJwYy9tbS9wdGR1bXAvTWFrZWZpbGUNCj4gKysrIGIvYXJjaC9wb3dl
cnBjL21tL3B0ZHVtcC9NYWtlZmlsZQ0KPiBAQCAtMiw3ICsyLDcgQEANCj4gICANCj4gICBvYmot
eQkrPSBwdGR1bXAubw0KPiAgIA0KPiAtb2JqLSQoQ09ORklHXzR4eCkJCSs9IHNoYXJlZC5vDQo+
ICtvYmotJChDT05GSUdfNDR4KQkJKz0gc2hhcmVkLm8NCj4gICBvYmotJChDT05GSUdfUFBDXzh4
eCkJCSs9IDh4eC5vDQo+ICAgb2JqLSQoQ09ORklHX1BQQ19FNTAwKQkJKz0gc2hhcmVkLm8NCj4g
ICBvYmotJChDT05GSUdfUFBDX0JPT0szU18zMikJKz0gc2hhcmVkLm8NCj4gZGlmZiAtLWdpdCBh
L2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvNHh4L01ha2VmaWxlIGIvYXJjaC9wb3dlcnBjL3BsYXRm
b3Jtcy80eHgvTWFrZWZpbGUNCj4gaW5kZXggMjA3MWEwYWJlMDliLi43ZjU3YzM1ZjhkZWMgMTAw
NjQ0DQo+IC0tLSBhL2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvNHh4L01ha2VmaWxlDQo+ICsrKyBi
L2FyY2gvcG93ZXJwYy9wbGF0Zm9ybXMvNHh4L01ha2VmaWxlDQo+IEBAIC0xLDYgKzEsNiBAQA0K
PiAgICMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAtb25seQ0KPiAgIG9iai15CQkJ
CSs9IHVpYy5vIG1hY2hpbmVfY2hlY2subw0KPiAtb2JqLSQoQ09ORklHXzR4eF9TT0MpCQkrPSBz
b2Mubw0KPiArb2JqLSQoQ09ORklHXzQ0eCkJCSs9IHNvYy5vDQo+ICAgb2JqLSQoQ09ORklHX1BD
SSkJCSs9IHBjaS5vDQo+ICAgb2JqLSQoQ09ORklHX1BQQzR4eF9IU1RBX01TSSkJKz0gaHN0YV9t
c2kubw0KPiAgIG9iai0kKENPTkZJR19QUEM0eHhfQ1BNKQkrPSBjcG0ubw0KPiBkaWZmIC0tZ2l0
IGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9LY29uZmlnLmNwdXR5cGUgYi9hcmNoL3Bvd2VycGMv
cGxhdGZvcm1zL0tjb25maWcuY3B1dHlwZQ0KPiBpbmRleCA1NTMzNzYyOGJmOTIuLmNlMWZmNzJk
YzUzNyAxMDA2NDQNCj4gLS0tIGEvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9LY29uZmlnLmNwdXR5
cGUNCj4gKysrIGIvYXJjaC9wb3dlcnBjL3BsYXRmb3Jtcy9LY29uZmlnLmNwdXR5cGUNCj4gQEAg
LTQ3LDcgKzQ3LDYgQEAgY29uZmlnIDQ0eA0KPiAgIAlib29sICJBTUNDIDQ0eCwgNDZ4IG9yIDQ3
eCINCj4gICAJc2VsZWN0IFBQQ19EQ1JfTkFUSVZFDQo+ICAgCXNlbGVjdCBQUENfVURCR18xNjU1
MA0KPiAtCXNlbGVjdCA0eHhfU09DDQo+ICAgCXNlbGVjdCBIQVZFX1BDSQ0KPiAgIAlzZWxlY3Qg
UEhZU182NEJJVA0KPiAgIAlzZWxlY3QgUFBDX0tVRVANCj4gQEAgLTMyNSwxMSArMzI0LDYgQEAg
Y29uZmlnIEZTTF9FTUJfUEVSRl9FVkVOVF9FNTAwDQo+ICAgCWRlcGVuZHMgb24gRlNMX0VNQl9Q
RVJGX0VWRU5UICYmIFBQQ19FNTAwDQo+ICAgCWRlZmF1bHQgeQ0KPiAgIA0KPiAtY29uZmlnIDR4
eA0KPiAtCWJvb2wNCj4gLQlkZXBlbmRzIG9uIDQ0eA0KPiAtCWRlZmF1bHQgeQ0KPiAtDQo+ICAg
Y29uZmlnIEJPT0tFDQo+ICAgCWJvb2wNCj4gICAJZGVwZW5kcyBvbiBQUENfRTUwMCB8fCA0NHgN
Cj4gQEAgLTU2NCw3ICs1NTgsNyBAQCBjb25maWcgTlJfQ1BVUw0KPiAgIA0KPiAgIGNvbmZpZyBO
T1RfQ09IRVJFTlRfQ0FDSEUNCj4gICAJYm9vbA0KPiAtCWRlcGVuZHMgb24gNHh4IHx8IFBQQ184
eHggfHwgUFBDX01QQzUxMnggfHwgXA0KPiArCWRlcGVuZHMgb24gNDR4IHx8IFBQQ184eHggfHwg
UFBDX01QQzUxMnggfHwgXA0KPiAgIAkJR0FNRUNVQkVfQ09NTU9OIHx8IEFNSUdBT05FDQo+ICAg
CXNlbGVjdCBBUkNIX0hBU19ETUFfUFJFUF9DT0hFUkVOVA0KPiAgIAlzZWxlY3QgQVJDSF9IQVNf
U1lOQ19ETUFfRk9SX0RFVklDRQ0KPiBkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL3N5c2Rldi9L
Y29uZmlnIGIvYXJjaC9wb3dlcnBjL3N5c2Rldi9LY29uZmlnDQo+IGluZGV4IDVhYTkyZmYzNjIy
ZC4uMThmZjJjNGE4MTRhIDEwMDY0NA0KPiAtLS0gYS9hcmNoL3Bvd2VycGMvc3lzZGV2L0tjb25m
aWcNCj4gKysrIGIvYXJjaC9wb3dlcnBjL3N5c2Rldi9LY29uZmlnDQo+IEBAIC01LDEyICs1LDEy
IEBADQo+ICAgDQo+ICAgY29uZmlnIFBQQzR4eF9QQ0lfRVhQUkVTUw0KPiAgIAlib29sDQo+IC0J
ZGVwZW5kcyBvbiBQQ0kgJiYgNHh4DQo+ICsJZGVwZW5kcyBvbiBQQ0kgJiYgNDR4DQo+ICAgDQo+
ICAgY29uZmlnIFBQQzR4eF9IU1RBX01TSQ0KPiAgIAlib29sDQo+ICAgCWRlcGVuZHMgb24gUENJ
X01TSQ0KPiAtCWRlcGVuZHMgb24gUENJICYmIDR4eA0KPiArCWRlcGVuZHMgb24gUENJICYmIDQ0
eA0KPiAgIA0KPiAgIGNvbmZpZyBQUENfTVNJX0JJVE1BUA0KPiAgIAlib29sDQo=
