Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DB190C16D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 03:40:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PksuVYKK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W38Zt1SHZz3gMj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jun 2024 11:40:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=PksuVYKK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=2a01:111:f403:2418::606; helo=nam12-bn8-obe.outbound.protection.outlook.com; envelope-from=chaitanyak@nvidia.com; receiver=lists.ozlabs.org)
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on20606.outbound.protection.outlook.com [IPv6:2a01:111:f403:2418::606])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W38Z837CHz3g8B
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jun 2024 11:39:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8N5UmuOg3DbfZZqqNuAOnKUX0leBKNlMh92PnYnQzHWaHcYH5oY7Jf2nPO+Qk4etgTefBsRz3xTvg77Jx9BrsBmWHm8RbnrjS1ufhMTqRs6dylRjdOdMD97ygb4ytvK5Qjkj8Kz8MRxBP/WuwMiGA7SkMEKFodhVM+YB51bGW0JnZJaLNz6kEFsTzGWYOWMLq8wxf/4xoHKCIuZe4fyI2wUhojLUyDe9Bg+W3oPTBeMr6cKyvdP6bSsbGAnOgK21LrcnL97kmtwVPq8iUbashUt8ve2tudcNvSNT6STdsrALGg1xZkdhApbYZ7FLnmIE0Sh2xWcxVXR2MNK5gpu6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ypMPtz/9WIFSGNNpA6pjZRdqPMAO+pisYx7f9K2KVd0=;
 b=AlS7cUUNT2GENU/FMqDmwPtmxqJQKiKaf2yIXUIstnYMTzQ3k2Y/23Bo1upLZOBV3BLvSRWMF/Kci2GeXrW1SpXtQ0sT1IVSz89wVNEBq5XvOcWz1VWVvcePfY8KTvORUzzSr6The+VwqqF2mVbiSMJRt+ka0cLV+511gQazCUjgS5rkPBXN3QNBRfj7EEEGj26igCXm9R/iCCNmNupkQe/dG1th7uXWejVlmwRgzPDwTysMdAGax42SVqoAbn1BIRlFk8j2N1wRuFDwqYVYunagRDvfyEA6V0TlucrgQUTEgU+8DSMMgVHdMqKIVkR8rZKG0w2DlY+BPUGJYiXKqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ypMPtz/9WIFSGNNpA6pjZRdqPMAO+pisYx7f9K2KVd0=;
 b=PksuVYKKhrvecgqS+9aiMNGQiWVwXuX+AwaD8YHjxwFIv+B2j9hQnJxGTDMA9+6af35W2T6/HIZ9BIpvU1s9HcU+dpkEiSZbco9YTjpiheB5yRm4kIGenaJGdtu+iBxymX/YH0YmGlpQfKVBrmcBCZwn3fvBy1PCfYKL183BvjT92sH86WLNJcTCxH0FCxnyKIpIFTntL5yIlJEtLXlk40OlJ4GLfPs5eEiy6O03syOjPIrgnseZ7QiJVtAERoc8Mxsn676RnPqKsLde+LvUUXNjs6uG1bOFg0RuBo5U9ho2LPCJ2A6SALLoV4Li9Pk7lLLRVJzw2oV4gcazeMdBVg==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by SJ2PR12MB8884.namprd12.prod.outlook.com (2603:10b6:a03:547::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.30; Tue, 18 Jun
 2024 01:39:16 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.7677.030; Tue, 18 Jun 2024
 01:39:16 +0000
From: Chaitanya Kulkarni <chaitanyak@nvidia.com>
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Subject: Re: [PATCH 02/26] sd: remove sd_is_zoned
Thread-Topic: [PATCH 02/26] sd: remove sd_is_zoned
Thread-Index: AQHawHyGRqOeyk9mTUyH0jN7gvO2LrHMv68A
Date: Tue, 18 Jun 2024 01:39:16 +0000
Message-ID: <117628c1-7378-4195-89d1-d5df7d3d22b2@nvidia.com>
References: <20240617060532.127975-1-hch@lst.de>
 <20240617060532.127975-3-hch@lst.de>
In-Reply-To: <20240617060532.127975-3-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|SJ2PR12MB8884:EE_
x-ms-office365-filtering-correlation-id: a24f19e2-a3bb-447b-5f5e-08dc8f377743
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:  BCL:0;ARA:13230037|7416011|376011|1800799021|366013|38070700015;
x-microsoft-antispam-message-info:  =?utf-8?B?YldBZjhNY09zL1licEhjV2FjeENsMXIxMVFxckxEcC8zSGdhUEh1K2dtNUdK?=
 =?utf-8?B?cnh4S3BHN3dQM0djVnZIV202MjYrQ1g3MWNCai9OMTk1OUZvUUZOY0k1NTNk?=
 =?utf-8?B?YUVLZmdyUFluQ0VsMDBtakFIMjFxNmsxR2tyMElDN1hXRktLU0cvWnBsKzR3?=
 =?utf-8?B?SkdpSDVpYTVIMHllNkI0UGxMZkVNN1dtRnBqNld5bmdpRzExSWZnTWw5L2kx?=
 =?utf-8?B?NUx5WisvdDJXZnp6VmNhSkl4dzZYNUd2VnkvWlpkVlR6UzluYmVFc1BNOSt6?=
 =?utf-8?B?MUUzaDVjelFzdnpRa1VmaldOb3Q1NC9YVCtUTXFKMm05dGIvZkd2OEtqSHhu?=
 =?utf-8?B?VlZZNFNOK0hhVkhpWHd3ekcxc2VYdnk3a2MvUkRzRDNkUVdFRk1JT2tnaTd2?=
 =?utf-8?B?My9CRmtEL3VWU2ZiRDdSNkxJdFRPK1hISXU5ZC9Qa1owL204cXFnZU9HQnE1?=
 =?utf-8?B?aURmUSs5SDRqZVg3YzVTVFBIRmUzWTQrc2RnWURhZ21zVnA3blNnUzVKTXZh?=
 =?utf-8?B?OUJzZnhUaVdJZWxBcVZmTkhLSXVaYW5kRTBmTGpmQk12dHppMXFTK0tWNWN2?=
 =?utf-8?B?VHFsbEx3MTdLbmVpemYzaFVXODJpMVR5ekdCMDVKL2UrSCs3d3MrMU9OdTRS?=
 =?utf-8?B?dU9raGhmaXlMcEZuaExQdWdiMlNHY3BjZ0RqZE4xcnlzSzVMMkxCYVVHMWw3?=
 =?utf-8?B?c0QzUGpES2xndWhZN0c1ZzdFOHp0di9LaDFCVTFZc0hOcU9hTnptMi90STVW?=
 =?utf-8?B?Y25GMnlhOGppcGJidGsxL3ByMCtPU1U2aE9YNHVEa3loeFQ1OEZaVGw4NmFy?=
 =?utf-8?B?KytMdmVSOVR6YzNROS8ySHBJeTlWS3Fsc3FBWGVPemo3ODJlNDlqYjJsbWtM?=
 =?utf-8?B?cnNjcHB2T3IrNGxhdEZnYi9pSXp1U25qR25odEUveE5IeXhRcFUxcktsRGRl?=
 =?utf-8?B?VUtqWkFHZ3g1KzhhdXNqUEhLL0htTVdiRVRMNzNZMGY5M2sxeFBncWFBdkp4?=
 =?utf-8?B?ZDRWTkNuaFZXRlk2Nk1QMWhzNENSQ2VOZ0dDaFdpUXkzTksrNnhZMGp6aTlT?=
 =?utf-8?B?cEFnTHh6K0szQ2xGeVJSSG1yTWp0RWk4Sm55a3ZhSCtlelZUUGdDTW55ckNw?=
 =?utf-8?B?cFducnNTRC9od2M1QVJZbVZhWERUZUFkVTExZ1ozaHNOUk8zNWs0NE1rQkpi?=
 =?utf-8?B?VThiRW9ZaURzZTJscXRKT2d1SVYwcGFQQW56akkvbW5NN1VsQlp4YzB3QXpR?=
 =?utf-8?B?cEgxQy9KMzVkTGk4NWFEZGtmZml4VUFWRFdZdHhmSmlnSW5EVkVsdGRpdW00?=
 =?utf-8?B?U25LSzc4b0NON08zSDBjQXQxRlNrQVRMbnloSlNHK014c3lKRXJ0NytoRXpK?=
 =?utf-8?B?djB1TG1ObDhzQkY5WVh3MzZRbkpkYVhnMFozTkpaTUx5NWRHVHV3QWtmdjNp?=
 =?utf-8?B?Q1RNcVJPbHJXTXBLcDdhMUhjZVhiNGRhZGhSOFhzL1F0WWI0cEVoSjJOVGNL?=
 =?utf-8?B?QmFOS1NEbkxaYWdkY0hUakRIOEpmZDlkR3JDUlp6eUFQQ09YNEdiM0pHeUo0?=
 =?utf-8?B?WldaWkFGZ0Q0OWNkM1plbzBUR0dHQkVGa0JqTjA5aFdGVThtZk5XRVZmQjNN?=
 =?utf-8?B?YjZPWS96djA3bTFiaUZqbUl3OE9yNm1adWtoYThHOFJQOVdEYkV2OFpIRVFy?=
 =?utf-8?B?VlJRMnJuQkhmbms1eWRHVGRGZk5ZUEg3bmNwN1hDcnI5L2VOcGYrV1BYaStY?=
 =?utf-8?B?ZVhkeXp0SlliTEhjaDhiYkpHdk44NFpORkJFZDhwTHJFaDJ4ei8xUENjdHFX?=
 =?utf-8?Q?OtQ9mQztXhiEHIpXzLQe6Ig8+4Tr36Xi3M7ao=3D?=
x-forefront-antispam-report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9404.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230037)(7416011)(376011)(1800799021)(366013)(38070700015);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:  =?utf-8?B?TXV4d3VjdmNaY3IzUHF3aU5NaitSNjBjWWNVZnpxSnFaUGd2WVIwZjNNTlFq?=
 =?utf-8?B?Rk9oSXNrcHN1NTFhbUhXa0NPWkJJSVpCMSt6VGVFaXVPQXlYTUdsMTNoczJs?=
 =?utf-8?B?K042RmpvS3JyajV2UklUWmpUeW5EUm4rd3lDM2Q4bm1YRUQrSjZFdHFEZnVD?=
 =?utf-8?B?NDJ2T2dqUXRTYWhtV1NVMVQzWW5qdk9nUjZaOExPMmxRaVc1UWlQVGVWL3RO?=
 =?utf-8?B?YjhEei9jV0hxSE9JbllpOExWbVErbDREQkFPUEJVR0pBSTBPMHZQN000Sk9X?=
 =?utf-8?B?VVY0Ly9PUUh6UHgzaCtZWis1blBxUFZoeDBIQkZhWGpTN2F1bTlKbFNNUTYr?=
 =?utf-8?B?SGVHM2FaOTFKaHpaclZBNUUxVml4eGlZanh5T3hSWFFEUFdQTnpta1FZMG9l?=
 =?utf-8?B?Sy9ZVGhqQTJQNUZ4d1dQYStleTlEKzc5MEYvQkQyQzNQckFKZlUzTW1NbTli?=
 =?utf-8?B?clk3OFlWUThPek4zbWlFQWMvSm9BTzVVU1lPYnNPbjJGSlg2bm0wL092Y1Nu?=
 =?utf-8?B?YlZQWGpzNGNabWF2bE5vYmxVZ3d2am9zNVV2OHMvb2paQmUrZUYxLzlENU53?=
 =?utf-8?B?U21KZG5qRUZNb1RFS3Jjdk10NGFmSHVXYnNNR1dIMk5PN0VjOGdabWdvTi9p?=
 =?utf-8?B?UmZ2VHMvYjRIUEcwQjd2Uy82THFwMkxWZTA3cnRnd3VGVjBhRHVlbjNrNlZn?=
 =?utf-8?B?NUc2WE84VGhxdGVZRkRCUkd5d2FYWXk3OCtSREF3WGZWQlZENDRiUDdiSGYz?=
 =?utf-8?B?OEZkQ0F0QzFjajN2VkQwdllPUEtiSUk0T0VPVk5XQ24zSXVqazY2YWFVMEhZ?=
 =?utf-8?B?TmhkSkRWZlJrVEczck16S0tEMUUvWlcvWktPWlFQZ1JnWmwxbzdITFdIaVJI?=
 =?utf-8?B?TzEwMEN4WUNxakQ2VFVOcWJjRmJ4SFlxcWZsSkYyeVI0M1V6aEszdE85SXMw?=
 =?utf-8?B?bm9sekxTVG5xTkx5TXJMK2VpS2xJZnFXYjhQVmpURXJJeEtBdE1SdXJnQzh5?=
 =?utf-8?B?cDlPNFVMY05pN2pHWFc5cWllNjlFY0EzTlNweXdqQlphVXg4cndiU1R6TlJ6?=
 =?utf-8?B?NkJIMUxOcE5pMzJreWorbFlBYXdWdGpoZVNaZE9oYTNTVlVHQVBhT1pPQ1p4?=
 =?utf-8?B?K2FCUE5McFlJVFQ1cjc4UkFKOTdzVE14dGxydzFNWVRWd09seERkQTROVVdE?=
 =?utf-8?B?M2tCZS9WbzhlbmRkOTJ0QktuSDFZOEoydVUxdVludGRBbkRUdmN5S1lOWE5q?=
 =?utf-8?B?NmpLYk0zcXRrb3d1ZkwwNnpuNnNpZlY1MXhKblAzU01BM2NTSlBaTE1UaFZ0?=
 =?utf-8?B?RDgzdC9INjFkM09NMFI2RE5PZUNiT1ErdnhnS0lESGJ5cFJLL1ExaWlJS3lU?=
 =?utf-8?B?QzkyUXR1dEgyNnZiVjVVMWpZYlJveEt5am90cURXZjNqV29LWHIzcGUvUGNZ?=
 =?utf-8?B?bG1FYU1Rb2J2d0hId1ZJcWFqWGd6TUpJSzRJK1EzVjFFZDlSdmRhQXhpWGRG?=
 =?utf-8?B?eUpxeGJNRmRCOXVrUmNQWWMvdUYrUzFHaFM1VHpITWNKS1lTUC84YWtpcm8r?=
 =?utf-8?B?dHptUjMvSERweFZ6Uy8vMWhtMVBaK09VUDFvaTl1TWtqNHNldmRaQ01OUEZL?=
 =?utf-8?B?d2RQelJtVkFBZzF1b2ErZmNvc1RFL1JQTnJKTnVLMUVTVWNaNm5KaU91M0RM?=
 =?utf-8?B?OURMTGtacW5XQ1IzQUtCUk1CTWR1cUlYVUxVOEZtN2V1T212S3JUc3F5S21N?=
 =?utf-8?B?dVZ3TzVUb2QyYlFON1BhVDhTdHJucXprekZjLzg4OTNTcis2WnVVMDc1SnFM?=
 =?utf-8?B?aVNhMlpuYnh0TjF6S1Jxa1dkRG9tSEpYOW5IeWVoRXMybUczTk52MlRwbSsw?=
 =?utf-8?B?WDdGWDFjRStGR0ZQV2Uvd3Q5dUVqNXpGSVltQWlxSzVhbW1VdFNTZGhWeUlp?=
 =?utf-8?B?c0plbDlUdzRVSDN0WFJVVU8yLzVGcWhscFFrcUU3N0VaMHZZbjlwaG1QV0FX?=
 =?utf-8?B?bnRUUm40QlYwcDlzUlM5T0MxNU00V2IzUkhtNnlkcTJDUDAzRmRGYUNqaWpo?=
 =?utf-8?B?L2sva1hYbFdYMHh6cDJNYUxnc0s4dzI0WkMvS0ZRUGNZak9oU2FJWEtJamRz?=
 =?utf-8?B?TDVhRWd2QjkzV1R5Z1Z2Ung2YkUxNGlXWldCdkRnVzQ2SXhYQ01Mc012NlQ5?=
 =?utf-8?Q?w8GYB5pM2Mk2Gf/Dm1gQ9pu+ddAC6O1L+90dogtUght1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA6754379EC35C49B5EFA1BCA5963450@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a24f19e2-a3bb-447b-5f5e-08dc8f377743
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jun 2024 01:39:16.6435
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 70ANE6Zvl450ORuJDVNcemcJUkoaM3ff48ZcnrnAVEtgTHWVtCloarSJ3+wrSx5yarVIxAT7WJVryThOXcYA5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8884
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
Cc: "nvdimm@lists.linux.dev" <nvdimm@lists.linux.dev>, "Michael
 S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>, Song Liu <song@kernel.org>, "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Vineeth Vijayan <vneethv@linux.ibm.com>, Alasdair Kergon <agk@redhat.com>, "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Bart Van Assche <bvanassche@acm.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, Richard Weinberger <richard@nod.at>, Geert Uytterhoeven <geert@linux-m68k.org>, Yu Kuai <yukuai3@huawei.com>, "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>, "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>, Mike Snitzer <snitzer@kernel.org>, Josef Bacik <josef@toxicpanda.com>, "nbd@other.debian.org" <nbd@other.debian.org>, "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Damien Le Moal <dlemoal@kernel.org>, Mikulas Patocka <mpatocka@redhat.com>, Hannes Reinecke <hare@suse.de>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>, Ming Lei <ming.lei@redhat.com>, "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>, "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>, "Martin K.
 Petersen" <martin.petersen@oracle.com>, Johannes Thumshirn <johannes.thumshirn@wdc.com>, "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>, Philipp Reisner <philipp.reisner@linbit.com>, =?utf-8?B?Q2hyaXN0b3BoIELDtmhtd2FsZGVy?= <christoph.boehmwalder@linbit.com>, "virtualization@lists.linux.dev" <virtualization@lists.linux.dev>, Lars Ellenberg <lars.ellenberg@linbit.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, =?utf-8?B?Um9nZXIgUGF1IE1vbm7DqQ==?= <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

T24gNi8xNi8yNCAyMzowNCwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IFNpbmNlIGNvbW1p
dCA3NDM3YmI3M2YwODcgKCJibG9jazogcmVtb3ZlIHN1cHBvcnQgZm9yIHRoZSBob3N0IGF3YXJl
IHpvbmUNCj4gbW9kZWwiKSwgb25seSBaQkMgZGV2aWNlcyBleHBvc2UgYSB6b25lZCBhY2Nlc3Mg
bW9kZWwuICBzZF9pc196b25lZCBpcw0KPiB1c2VkIHRvIGNoZWNrIGZvciB0aGF0IGFuZCB0aHVz
IHJldHVybiBmYWxzZSBmb3IgaG9zdCBhd2FyZSBkZXZpY2VzLg0KPg0KPiBSZXBsYWNlIHRoZSBo
ZWxwZXIgd2l0aCB0aGUgc2ltcGxlIG9wZW4gY29kZWQgVFlQRV9aQkMgY2hlY2sgdG8gZml4IHRo
aXMuDQo+DQo+IEZpeGVzOiA3NDM3YmI3M2YwODcgKCJibG9jazogcmVtb3ZlIHN1cHBvcnQgZm9y
IHRoZSBob3N0IGF3YXJlIHpvbmUgbW9kZWwiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGgg
SGVsbHdpZzxoY2hAbHN0LmRlPg0KPiBSZXZpZXdlZC1ieTogQmFydCBWYW4gQXNzY2hlPGJ2YW5h
c3NjaGVAYWNtLm9yZz4NCj4gUmV2aWV3ZWQtYnk6IERhbWllbiBMZSBNb2FsPGRsZW1vYWxAa2Vy
bmVsLm9yZz4NCj4gUmV2aWV3ZWQtYnk6IEhhbm5lcyBSZWluZWNrZTxoYXJlQHN1c2UuZGU+DQo+
IFJldmlld2VkLWJ5OiBKb2hhbm5lcyBUaHVtc2hpcm48am9oYW5uZXMudGh1bXNoaXJuQHdkYy5j
b20+DQoNCg0KTG9va3MgZ29vZC4NCg0KUmV2aWV3ZWQtYnk6IENoYWl0YW55YSBLdWxrYXJuaSA8
a2NoQG52aWRpYS5jb20+DQoNCi1jaw0KDQoNCg==
