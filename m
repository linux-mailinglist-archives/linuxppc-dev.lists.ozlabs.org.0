Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A82AB8D554D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:20:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aefmlC0G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr10f6ZlSz3cTS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:20:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=aefmlC0G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2417::601; helo=nam12-dm6-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2417::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vks9J07sHz3vbX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 May 2024 23:10:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I6dK389nsbXspgkSBQd5gJ43JfgnSWpq5faEKD3s9TWq9ZV2FrGE6dy0+hUEOCwdWXfyQlRGvCMt1oF9jNHlFQQTtN0SzMSQIp9ZAVeUcrtYoWsGkmYsMuL2QRS6t+HPSIcMr0VFxuxgIE3qFkFe6CXD5JA+E7LnO2vv5Ai2kkm/KNWmpsz2+KZO5Gp0UCLludtXzcMOEHM1vXRL1H8ClByb7lUzoQbsd8UrHw5jBp2491quknQNvIs5ZgNweZSKYWwQshdtSICOI7NrMCE5W85iqlO2IgS5QwFsqSfS5ibCV78eInzgDLYDnxjG2Rf7LngRD5z2qBvvgi1aRZ1wNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t75u9iySWfjIC7vIYO0YJg0zbmgg24aaQRNAostwkLQ=;
 b=H0xtPn0GJazmxwhxyYSUXzlqoe7pEHQUiq2d8zo7hR90AcJSHEwZQNAHWals8w30sQXHIHICy9NGaB3OiV7D2xEuow9lCRje0D/NVhaHjs2lt41FuMBm6YgVrDdy1pn6POOkF866vvi5smnCPWLU/FyMYNVFjROGIqkXcNaOO2Mz8TujrhfAV10mGk1/XaggY33+oEfTV4sB4ZFKvpjhHocKXTh1svwZWvLh/90OEvdmkoqvW5LT2P7K/IZck5sL17VKT1j04iEOZ9M7zNVAxH+oEP4CJaVyy6nbU+BOszy/SVZ4pHGwJVsJhW6B1lEwHOwWx9NYmzlcYjIrLcWLYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t75u9iySWfjIC7vIYO0YJg0zbmgg24aaQRNAostwkLQ=;
 b=aefmlC0GhIq2WZan73ZfX+EfqQaVUw3xG5gfIl2BJu14Y/5io91Yp5D1epWFURoNIbdjxgGm/KF/KcvgbMoD3CdaKBnb+0kQjai0v9WG+RIFdKpTOQFN4e8tZr2jrwGlzepruxWeUdQFOY0x2TBQmAQ2f6CSbjSwUurhbWUvJpU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 by PH8PR12MB8430.namprd12.prod.outlook.com (2603:10b6:510:259::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.35; Wed, 22 May
 2024 13:09:40 +0000
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c15b:b99d:8d9e:fb25]) by SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c15b:b99d:8d9e:fb25%6]) with mapi id 15.20.7587.035; Wed, 22 May 2024
 13:09:40 +0000
Content-Type: multipart/alternative;
 boundary="------------NsJ06VaY560oSpkh0K804aRp"
Message-ID: <c8ae2b07-4528-40d0-bbd8-b1105c219200@amd.com>
Date: Wed, 22 May 2024 18:38:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
References: <87wmo4o3r4.ffs@tglx>
Content-Language: en-US
From: "Balasubrmanian, Vignesh" <vigbalas@amd.com>
To: Thomas Gleixner <tglx@linutronix.de>,
 "Balasubrmanian, Vignesh" <Vignesh.Balasubrmanian@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>
In-Reply-To: <87wmo4o3r4.ffs@tglx>
X-ClientProxiedBy: PN2PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::6) To SJ1PR12MB6124.namprd12.prod.outlook.com
 (2603:10b6:a03:459::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6124:EE_|PH8PR12MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f94bc3-c8d5-4003-498c-08dc7a6070ae
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|1800799015|7416005|376005|366007;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?SEVhbGgzSWl1WUQvK01rakdnd1dhbDRzN3FodVk4amJpclh1cEF5VndRZW1I?=
 =?utf-8?B?SjZSVHhhcEhiVlRObHhYUlJndVE5TDFpcE9OcXRaQWFud0srWmg3SDMxTnAz?=
 =?utf-8?B?Sy9EazdHbHcvbHpmWTRYOTYvbXNNOFRMZXNxdGcweXd3a0p0TXpkemNtajNH?=
 =?utf-8?B?a3YzNHBtMHdPWlhTTGRCc1lOK3IrSjVpR0lkd0l6UC9pZlNpY0lndDYxZEgw?=
 =?utf-8?B?ZWFMSmJUQXNSby9oMm5nQkVXSThFUHZWenc2SDdUamRCV0JzdjZISk9NSzJU?=
 =?utf-8?B?Z21lOUpXTXVDaHdDRzBtMjl3ZTVSa0pHMXlycEhEM25kaU9IWmRnbHplNjhC?=
 =?utf-8?B?N3BnWFI5T3oyS0N3SlBpNWp5VkNYd3pZcUljbklzMHVBenNHMU41bDQ3Wldw?=
 =?utf-8?B?Z0VicUlYR2wxSm9ER3lvUWUrZzdQaWk3ditVNmh5Q2t4ZlBiZjhqRWUwaldr?=
 =?utf-8?B?cHpVQldlUmM4bW15c0x4bHpZSG1HaHNlVDB5QmdHMm93YW16eExJbDRNdGJJ?=
 =?utf-8?B?VlRoc2pOOVA4Q05tQlRSMDNnM004KzRZcDZiZS9xZUZWMjVJbU1YaWxBUEJq?=
 =?utf-8?B?U3hNYVgxR0V2Nm9nQnMrazY5OXFHcWsydHEyaDR6dTNSOXcwOXBSaFBpbDk4?=
 =?utf-8?B?bTdEOGR3Rld4NGs3cnE1VVlMbmlGdzVtVDNHN2o0dzdpNUNPNjI0YmZMNDdn?=
 =?utf-8?B?TlIzSnpNbXg0dGJRUkJsQnZGYUtoRzlDa0tpTHpNZUNsMHVWU3pua0kwdkIv?=
 =?utf-8?B?RWlEdDVwcjZWd1hkWkdjRVBmWGhwMVMzZHpmUkpSQTBZbzlwSVorZ3lHVTNR?=
 =?utf-8?B?cEhaQ29FbGRoQlVaZExjRUZESDJYamxQcHcxUFhnK3JJZTBrQzJLa0R3TGZH?=
 =?utf-8?B?a0dIdmtNc0pqbG5udDJFT3F5VmpmWUhNL1pBUnF5KzYxeXFHaElEVjkrY3lC?=
 =?utf-8?B?NVFQQ2Y2Wlp2ZE5RbkkwUGNtUmVUcnBLNXZWNE1aaUtneTduVDcyOWorbmVq?=
 =?utf-8?B?eERmMVlZMng2ZWk3TU1xL29DUERaMXZJUi9uNEllelhsaFFRZVRYV3R6VXNH?=
 =?utf-8?B?cHdEVW1RbDRxSm5ENzIrM3Q5YXIvaDFTY2hzbGJHbVBHdWlPSnBraUJ4b1hU?=
 =?utf-8?B?RUFWZ0RjZWp3RnRuZmI1Rm5lNk9TWlduY1NIL0Y5c2pCUnBnL0txeGlXeURQ?=
 =?utf-8?B?MmJsMEFKL1NRdGhwc2tadEY5UEVPVXVYUDhJTFZPSGRqVG41TXdzWXVQQWw4?=
 =?utf-8?B?M1UyOFRhakhwUmRoc25BenNYdXltSFhLaWVnWVF1Ni9iSDVFNzlycDZVWTcx?=
 =?utf-8?B?c3FvUTVOd1NRUDd0akhSUjMxTUtObkdhTWFFVW0yOWg0cmErUU9TUXpQL1g5?=
 =?utf-8?B?TDQzc1JsV2VUbUhkeEtGTHROdnIzdmZJTnF5Z0grS3pFQVhjZE53LzM1Z0Zz?=
 =?utf-8?B?a3Vya2tqV3ZGNWpyOHNHbUVPdXJxd2V4TmpHOHl4MmFweCs1NkViSHBqdWRS?=
 =?utf-8?B?U1ZTeTRyZVVPb0ZXcDJPOTBIdGNRdUhZRUVTaGMvT0pkUks3UnBJZldPcStv?=
 =?utf-8?B?K041LytQS05wQnNTSHNyclFERFhsRUVYR2IvREY2bTYyL095SXJFK3BZTmV5?=
 =?utf-8?Q?g2LwxQWfrVJRWm9UCvDum1UM6X/vfLmMG9UDWI9Uh0JQ=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6124.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(376005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?b2tURjh1ZGIrMHIrZnVMNThCYVo3UFNFNkcrYzlPNzBYVTVDUTJZNm9VTG5Y?=
 =?utf-8?B?VGY1L1hwVEpNaGhDNnIyMEZzYkEvNmNoTUFBTUJ6SjVNZERlUWVrMzdLOUxu?=
 =?utf-8?B?OUFoOUphQkhFL3FrdXYvRzlZME9BUDF3WjUyMnR0K2h5YlltclpSY2ljVTVZ?=
 =?utf-8?B?ZEhpdTV5bWY0WXNKMTB1TVYxZ3paSkNrNS9NZmF4Wnh3Qmo0eEIvc0VHeFZa?=
 =?utf-8?B?Vy9GRDlOcjcrUHdrbVZlY2RlNSttTHlQcXl1cjRxR3Nyc1JoNXpqTzBmWE9h?=
 =?utf-8?B?MFJ1eERjaDZ1b2JjZXRJTXhNMDZKUnMrMTAweXpiSGoxbTdwRWlBQlZvZGhZ?=
 =?utf-8?B?SVZuQXhUUlI3REdiSklIbGd2c3RrRklNUWpVa3dRSVR1QWloU3hBUExZclNp?=
 =?utf-8?B?YnZmR3VZdFVWSkk5c2gxZUVDRjJBbjYrdkdYYWdiNVdUSVUvV2FVWEQ1bG1C?=
 =?utf-8?B?YlRYamdsTWtmTG9qMVhrM2pSSFRGMDM1U2dBR0tHa3h3TzcyM1dBUm5SbkM4?=
 =?utf-8?B?OUcyK1JvcGhLdnhYTmk4MmtMcUdtNjZEUEhITDVHR3FLbWFHNXpyVXI5eEJH?=
 =?utf-8?B?eWVJNExNWU9ZZG1JWFg2TSs5b1VFSGJVVmpGeXVsR1BDa2VJUDFhYTJzNkNI?=
 =?utf-8?B?d21CWGwrTmVhN1JFblZXenF5RXc5MVdyYmJ3VlJJTDdCSlR5cjUwVDRGNEJn?=
 =?utf-8?B?alpzNU95NmlwS3p3bFpEeVh5QXg2M2syNFBPMlZRazM3NnJCMzU2RDFUQW8v?=
 =?utf-8?B?NzhXajBrYnBGNEF6cFJ3cnJHMWRFZlUzZ1F2QmVTcUpiVVhUWlhlZVNIQkdx?=
 =?utf-8?B?Um01UklHQ0xhVzNCUmFJZjZ1U2h2eFlab2s2c01lczBwQmNNaHc2Qm1BU1pJ?=
 =?utf-8?B?bFVwWWRpM1FGQWQ4L3BWSzh3Qk9RQWhZVDZLMjQ4TWVuRzlJYzBxdUI3OUdj?=
 =?utf-8?B?clhkQndtU0VadjNXU2FLeFJQUWppVjJXYkZEVTE5bnNMZ3BRSlp2c0NiUC9J?=
 =?utf-8?B?MXptNWRMR2xkVWpJTHUzZHBDWEJ4YmVGdW1tYkhsUElESGtNN1hrc2ZmdEdJ?=
 =?utf-8?B?dlQrNkI2aVRvdXRhTU52ZktvTFVWaElSWjMwci8xQ3UyOVJhWVpDdUxZbnZC?=
 =?utf-8?B?ajYxc2dTcmxQbjZGT2lQVktEV2tDaGZOM1MrMnV2ZVpxNHZHeENrWENDVllw?=
 =?utf-8?B?SFdVR3V4eU9hM3RDeXBMSjdKY2tPb3RXS21mMXYzRTlBWFlHTDRYTXl0NzVw?=
 =?utf-8?B?NmFGZnA5ZGlKUnlxZ0V4YWsxeEVPZFRtVm52dmx2Yy81RFdXWWUwSXE3eUF2?=
 =?utf-8?B?YWFsMXUvZzBDODcwNGRCSlpXZ3dLVktrNFYydzJpRTFlMUJIYkZ5Y3VSVjhJ?=
 =?utf-8?B?SkZiM1NJbGU5TGlnRlRoSjhQVDduNGs2TlZQd2dJbGIwV3dVUnQvREJLWG1a?=
 =?utf-8?B?SkJaUVJINFN0U2dUcWhNZkprcHlDQzJjeUxQeWdadFgxNXRSZDFtZDdLaEtj?=
 =?utf-8?B?YTlIL0k5QTVOZUdkcWdOWUtlMDlramNNREN6TlMvWUp4TGcybDVHMlYydlRh?=
 =?utf-8?B?UTZ0cWdISGNNWXk4Qm13WjJtMk9ydnhTZGNzQ1ZxSGF2Zzh3U3NiZGtabHRT?=
 =?utf-8?B?L0doNUM4RUt1ajNOVHhpMXBBRzJheEduWXZOVXZYSEVhVUg5UWJYenkzaXcw?=
 =?utf-8?B?S0JvOXJDckxSRTBLOEJ5N0piYUFtNk5YZ0hwaEthWGVHZmVVQnpTL3ZvcHpP?=
 =?utf-8?B?a1RSbTBvY04zMVYyOVFJL2k4MExaZzlNUW4xdmVBNGZzRXpiRzFqcXQrd1ll?=
 =?utf-8?B?MHVFcVNVMm9adWovbHF2SXVUY0Q3dXQ0YzRMbFo0OFYvY0tZeEI4cUtzakFQ?=
 =?utf-8?B?V1ZOSDJzUExIYlp4YVlodWxhemtKQ1RTdVNpVWoyeTFyVktYY1I3S0hSV3NU?=
 =?utf-8?B?WlhsQXh0MFc0QUpxTVFrWnh3WEJvdnRkd0ZSSW1YcENnZ2JEUWYyWVdaM0RZ?=
 =?utf-8?B?QVVtNG91aC9sMS92MndVdlc4ckJDYjZMS3VKc2xTRFNEeVhLdzJucU9jYklU?=
 =?utf-8?B?TVBKdXNhZWlvQzE1NVhvbjBRUVh1aHJDbi9RWUU5aFdrU3RrQ0loUHlwdStl?=
 =?utf-8?Q?eNcJHw7lVntD+53KCpH5x1T5b?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f94bc3-c8d5-4003-498c-08dc7a6070ae
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2024 13:09:40.7838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gW5KTNkrLq0Z851TjRIBnOT0/kmqaquKh/scWJfSNzmXafDkZT/1FssbFEPISZ6ejqMZwBImJK+FkmPv5K/qkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8430
X-Mailman-Approved-At: Fri, 31 May 2024 08:19:55 +1000
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
Cc: "felix.willgerodt@intel.com" <felix.willgerodt@intel.com>, "matz@suse.de" <matz@suse.de>, "keescook@chromium.org" <keescook@chromium.org>, "jhb@FreeBSD.org" <jhb@FreeBSD.org>, "x86@kernel.org" <x86@kernel.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "Petkov, Borislav" <Borislav.Petkov@amd.com>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "ebiederm@xmission.com" <ebiederm@xmission.com>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "George, Jini Susan" <JiniSusan.George@amd.com>, "binutils@sourceware.org" <binutils@sourceware.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--------------NsJ06VaY560oSpkh0K804aRp
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 5/8/2024 6:32 PM, Thomas Gleixner wrote:
> Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.
>
>
> On Tue, May 07 2024 at 15:23, Vignesh Balasubramanian wrote:
>> +enum custom_feature {
>> +     FEATURE_XSAVE_FP = 0,
>> +     FEATURE_XSAVE_SSE = 1,
>> +     FEATURE_XSAVE_YMM = 2,
>> +     FEATURE_XSAVE_BNDREGS = 3,
>> +     FEATURE_XSAVE_BNDCSR = 4,
>> +     FEATURE_XSAVE_OPMASK = 5,
>> +     FEATURE_XSAVE_ZMM_Hi256 = 6,
>> +     FEATURE_XSAVE_Hi16_ZMM = 7,
>> +     FEATURE_XSAVE_PT = 8,
>> +     FEATURE_XSAVE_PKRU = 9,
>> +     FEATURE_XSAVE_PASID = 10,
>> +     FEATURE_XSAVE_CET_USER = 11,
>> +     FEATURE_XSAVE_CET_SHADOW_STACK = 12,
>> +     FEATURE_XSAVE_HDC = 13,
>> +     FEATURE_XSAVE_UINTR = 14,
>> +     FEATURE_XSAVE_LBR = 15,
>> +     FEATURE_XSAVE_HWP = 16,
>> +     FEATURE_XSAVE_XTILE_CFG = 17,
>> +     FEATURE_XSAVE_XTILE_DATA = 18,
>> +     FEATURE_MAX,
>> +     FEATURE_XSAVE_EXTENDED_START = FEATURE_XSAVE_YMM,
>> +     FEATURE_XSAVE_EXTENDED_END = FEATURE_XSAVE_XTILE_DATA,
>> +};
> Why can't this use the existing 'enum xfeature' which is providing
> exactly the same information already?
First version of patch was similar to what you mentioned here and other 
review comments to use existing kernel definitions.
https://lore.kernel.org/linux-mm/20240314112359.50713-1-vigbalas@amd.com/T/

As per the review comment 
https://lore.kernel.org/linux-mm/20240314162954.GAZfMmAnYQoRjRbRzc@fat_crate.local/ 
, modified the patch to be a independent of kernel internal definitions.
Though this enum and below function  "get_sub_leaf" are not useful now,  
it will be required when we extend for a new/different features.

Please let  us know your suggestions.

I will fix all other review comments in my next version.

thanks,
vigneshbalu.
>> +#ifdef CONFIG_COREDUMP
>> +static int get_sub_leaf(int custom_xfeat)
>> +{
>> +     switch (custom_xfeat) {
>> +     case FEATURE_XSAVE_YMM:                 return XFEATURE_YMM;
>> +     case FEATURE_XSAVE_BNDREGS:             return XFEATURE_BNDREGS;
>> +     case FEATURE_XSAVE_BNDCSR:              return XFEATURE_BNDCSR;
>> +     case FEATURE_XSAVE_OPMASK:              return XFEATURE_OPMASK;
>> +     case FEATURE_XSAVE_ZMM_Hi256:           return XFEATURE_ZMM_Hi256;
>> +     case FEATURE_XSAVE_Hi16_ZMM:            return XFEATURE_Hi16_ZMM;
>> +     case FEATURE_XSAVE_PT:                  return XFEATURE_PT_UNIMPLEMENTED_SO_FAR;
>> +     case FEATURE_XSAVE_PKRU:                return XFEATURE_PKRU;
>> +     case FEATURE_XSAVE_PASID:               return XFEATURE_PASID;
>> +     case FEATURE_XSAVE_CET_USER:            return XFEATURE_CET_USER;
>> +     case FEATURE_XSAVE_CET_SHADOW_STACK:    return XFEATURE_CET_KERNEL_UNUSED;
>> +     case FEATURE_XSAVE_HDC:                 return XFEATURE_RSRVD_COMP_13;
>> +     case FEATURE_XSAVE_UINTR:               return XFEATURE_RSRVD_COMP_14;
>> +     case FEATURE_XSAVE_LBR:                 return XFEATURE_LBR;
>> +     case FEATURE_XSAVE_HWP:                 return XFEATURE_RSRVD_COMP_16;
>> +     case FEATURE_XSAVE_XTILE_CFG:           return XFEATURE_XTILE_CFG;
>> +     case FEATURE_XSAVE_XTILE_DATA:          return XFEATURE_XTILE_DATA;
>> +     default:
>> +             pr_warn_ratelimited("Not a valid XSAVE Feature.");
>> +             return 0;
>> +     }
>> +}
> This function then maps the identical enums one to one. The only actual
> "functionality" is the default case and that's completely pointless.
>
--------------NsJ06VaY560oSpkh0K804aRp
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 5/8/2024 6:32 PM, Thomas Gleixner
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:87wmo4o3r4.ffs@tglx">
      <pre class="moz-quote-pre" wrap="">Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.


On Tue, May 07 2024 at 15:23, Vignesh Balasubramanian wrote:
</pre>
      <span style="white-space: pre-wrap">
</span>
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+enum custom_feature {
+     FEATURE_XSAVE_FP = 0,
+     FEATURE_XSAVE_SSE = 1,
+     FEATURE_XSAVE_YMM = 2,
+     FEATURE_XSAVE_BNDREGS = 3,
+     FEATURE_XSAVE_BNDCSR = 4,
+     FEATURE_XSAVE_OPMASK = 5,
+     FEATURE_XSAVE_ZMM_Hi256 = 6,
+     FEATURE_XSAVE_Hi16_ZMM = 7,
+     FEATURE_XSAVE_PT = 8,
+     FEATURE_XSAVE_PKRU = 9,
+     FEATURE_XSAVE_PASID = 10,
+     FEATURE_XSAVE_CET_USER = 11,
+     FEATURE_XSAVE_CET_SHADOW_STACK = 12,
+     FEATURE_XSAVE_HDC = 13,
+     FEATURE_XSAVE_UINTR = 14,
+     FEATURE_XSAVE_LBR = 15,
+     FEATURE_XSAVE_HWP = 16,
+     FEATURE_XSAVE_XTILE_CFG = 17,
+     FEATURE_XSAVE_XTILE_DATA = 18,
+     FEATURE_MAX,
+     FEATURE_XSAVE_EXTENDED_START = FEATURE_XSAVE_YMM,
+     FEATURE_XSAVE_EXTENDED_END = FEATURE_XSAVE_XTILE_DATA,
+};
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Why can't this use the existing 'enum xfeature' which is providing
exactly the same information already?
</pre>
    </blockquote>
    First version of patch was similar to what you mentioned here and
    other review comments to use existing kernel definitions.<br>
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-mm/20240314112359.50713-1-vigbalas@amd.com/T/">https://lore.kernel.org/linux-mm/20240314112359.50713-1-vigbalas@amd.com/T/</a>
    <br>
    <p>As per the review comment
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-mm/20240314162954.GAZfMmAnYQoRjRbRzc@fat_crate.local/">https://lore.kernel.org/linux-mm/20240314162954.GAZfMmAnYQoRjRbRzc@fat_crate.local/</a>
      , modified the patch to be a independent of kernel internal
      definitions.<br>
      Though this enum and below function&nbsp; &quot;get_sub_leaf&quot; are not useful
      now,&nbsp; it will be required when we extend for a new/different
      features.<br>
    </p>
    Please let&nbsp; us know your suggestions.<br>
    <br>
    I will fix all other review comments in my next version.<br>
    <br>
    thanks,<br>
    vigneshbalu.<br>
    <blockquote type="cite" cite="mid:87wmo4o3r4.ffs@tglx">
      <pre class="moz-quote-pre" wrap="">
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+#ifdef CONFIG_COREDUMP
+static int get_sub_leaf(int custom_xfeat)
+{
+     switch (custom_xfeat) {
+     case FEATURE_XSAVE_YMM:                 return XFEATURE_YMM;
+     case FEATURE_XSAVE_BNDREGS:             return XFEATURE_BNDREGS;
+     case FEATURE_XSAVE_BNDCSR:              return XFEATURE_BNDCSR;
+     case FEATURE_XSAVE_OPMASK:              return XFEATURE_OPMASK;
+     case FEATURE_XSAVE_ZMM_Hi256:           return XFEATURE_ZMM_Hi256;
+     case FEATURE_XSAVE_Hi16_ZMM:            return XFEATURE_Hi16_ZMM;
+     case FEATURE_XSAVE_PT:                  return XFEATURE_PT_UNIMPLEMENTED_SO_FAR;
+     case FEATURE_XSAVE_PKRU:                return XFEATURE_PKRU;
+     case FEATURE_XSAVE_PASID:               return XFEATURE_PASID;
+     case FEATURE_XSAVE_CET_USER:            return XFEATURE_CET_USER;
+     case FEATURE_XSAVE_CET_SHADOW_STACK:    return XFEATURE_CET_KERNEL_UNUSED;
+     case FEATURE_XSAVE_HDC:                 return XFEATURE_RSRVD_COMP_13;
+     case FEATURE_XSAVE_UINTR:               return XFEATURE_RSRVD_COMP_14;
+     case FEATURE_XSAVE_LBR:                 return XFEATURE_LBR;
+     case FEATURE_XSAVE_HWP:                 return XFEATURE_RSRVD_COMP_16;
+     case FEATURE_XSAVE_XTILE_CFG:           return XFEATURE_XTILE_CFG;
+     case FEATURE_XSAVE_XTILE_DATA:          return XFEATURE_XTILE_DATA;
+     default:
+             pr_warn_ratelimited(&quot;Not a valid XSAVE Feature.&quot;);
+             return 0;
+     }
+}
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
This function then maps the identical enums one to one. The only actual
&quot;functionality&quot; is the default case and that's completely pointless.

</pre>
      <span style="white-space: pre-wrap">
</span></blockquote>
  </body>
</html>

--------------NsJ06VaY560oSpkh0K804aRp--
