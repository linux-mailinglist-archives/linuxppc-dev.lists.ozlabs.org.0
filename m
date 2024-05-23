Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B588D5550
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 00:22:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ry+8KLad;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr13C1sgWz3dH4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 08:22:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=ry+8KLad;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f403:2415::600; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=vignesh.balasubrmanian@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2415::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlJBR3C1xz3gHB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2024 16:27:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=njuugtQ5ytqAwBY3aAOZ4s8hyksl9TtUwxGVhsvW0TllTsecOYV1YpyCTEC547Y0BtSFX/0wgRgcLu+wZeSxZ/VPcxmKA+TYzuXBXYcMFYGkWbpv1SuJhkExeEBZ8WWNJLOB1NGSu158HxZs7TDCx76R6zG1EIl6dNsCqaHgDSgQKqz4mJg2MDCUA6L/lCqFrowGdA33tNn19uib8wUxqcw3zcyjMbpgUkVjbNzMWuXd5vPtuWfK7O0dWqRzyIKWC/Ohr/SG+TPveRiWU+6PalUIF8Z30qFvaLinVJaeY50AN9Ks3wng9S1eQ7lmP3p40D+eK+ZLl73F+eE7f6K46Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=imK7f3e9LVmaUiM+zZ3WgCNCVa5bO4MslWTfXJVpOcE=;
 b=NxhGF49Zp8d2VNtV2k9rYYLcrjs6uwbSj9u+IE7zn7xPjqhFgXzuUsfBFpRNB0Hs6BYsXCtjEL5/qeIMe5qpQILA9tXgjMGJNlzc9Lu5/p2fuBxaZVpcDB6XkVdOY3gBiE3i+nBc/aK91uSweR5xJLMuSud5pD7aKT9irSiN8rxICg42HdZR00P4FhkKMErXnBVaxXGRgaJmAHFueqdvwJ3lnfRy7o0hSs4dY5pvPFpQaqPzyEDxqxF7kkxvW7SCgJKzRMkOsbRkfQez8XLw4Q25aPl1Nq4Zip/hPlcbbvSy3g4wGwqB7S13frKfiV8eLllwv+9P6vp3+HB/3xX6cQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=imK7f3e9LVmaUiM+zZ3WgCNCVa5bO4MslWTfXJVpOcE=;
 b=ry+8KLad/9rsF4Q6bvLP5CNl2woWsGnJL47ZDKh78ag8JV8bIIt57nbpHkTN+ALyPWREnhbJhfkhL6SgP6G6A4oq9xR/6vjKoqllXNzyqqxmrb4iN1Dw+1P0N/cgwjw3LBgEgDqwo4Lq4rJThYMdZSyCwO110AR3r9Az/wjHaGQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com (2603:10b6:a03:459::15)
 by SJ1PR12MB6338.namprd12.prod.outlook.com (2603:10b6:a03:455::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.37; Thu, 23 May
 2024 06:27:11 +0000
Received: from SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c15b:b99d:8d9e:fb25]) by SJ1PR12MB6124.namprd12.prod.outlook.com
 ([fe80::c15b:b99d:8d9e:fb25%6]) with mapi id 15.20.7587.035; Thu, 23 May 2024
 06:27:10 +0000
Message-ID: <902b1bf0-15e6-42df-8f86-21387deef437@amd.com>
Date: Thu, 23 May 2024 11:57:00 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] x86/elf: Add a new .note section containing
 Xfeatures information to x86 core files
Content-Language: en-US
References: <87wmo4o3r4.ffs@tglx>
 <4a090901-9705-40aa-ac3d-d67c52660f22@amd.com>
 <20240522153433.GCZk4QiX4Hf0OuI48E@fat_crate.local>
From: "Balasubrmanian, Vignesh" <vigbalas@amd.com>
To: Borislav Petkov <bp@alien8.de>,
 "Balasubrmanian, Vignesh" <Vignesh.Balasubrmanian@amd.com>
In-Reply-To: <20240522153433.GCZk4QiX4Hf0OuI48E@fat_crate.local>
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0035.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::6) To SJ1PR12MB6124.namprd12.prod.outlook.com
 (2603:10b6:a03:459::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR12MB6124:EE_|SJ1PR12MB6338:EE_
X-MS-Office365-Filtering-Correlation-Id: d3e095d5-3892-4eac-7468-08dc7af1608e
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|1800799015|7416005|366007;
X-Microsoft-Antispam-Message-Info: 	=?utf-8?B?Mi9UcG9uSC9QMGUzejA3UHZrTHRIVHVCVDc4anNyaWozQmRPTlI2Qk5qdXEx?=
 =?utf-8?B?NmJIQzJBK21BVS8wWXRTRXg0VndxSWZQbUpyMVF3MzE4ZHQ5djYxZ3QyVHVn?=
 =?utf-8?B?MnBnRmxYb2R6a2E5UXA0ZGpiQkQzQmR5SGNpcUs2SGxZNEdoOXNlaTNESVho?=
 =?utf-8?B?YVpySWxXVlJ2UDJqU0lXdjcwaGZ4T1JFaElSYTh3emhUYnhiZjE5eUlGM1BG?=
 =?utf-8?B?bHFGVi9KM29XTlpmbEsxR05tVyt3bFNLTldSdFBSMVhLMWNiUDM0WXU2b1Yw?=
 =?utf-8?B?MFZKSzB4N29LdWhTaW1DUW9CUVFFM1A5dnRzOUorOC9QSzlMaUlJWFAxbUl0?=
 =?utf-8?B?WW0yTWNIVXNVNWpmd0REOXFOcnFjbEFMZEV5YkdSbEJHd3BnZkgwN2RBWXp5?=
 =?utf-8?B?cXNKVGdqek9oSzdhQzZhcjdUdTdCTVpKT2VkSDhZVldjNm9DRU5jNDB0QldN?=
 =?utf-8?B?dHkrUWNUbkxPZ0dQVHN2K3BnMDgwQ2VwdGRiVmFLdm9kdWZiS1FCaWFxT2ZB?=
 =?utf-8?B?MEorY0tpREIzSWhTSUpYdzlyb2J3dFJyU0NnaXdTcUxtQUU5bFNvaDFXdUtl?=
 =?utf-8?B?OGdUK3RrMUNBMzZyYkR4L0VhT0NBYzhrSHluRitOR0hTbGVQczU2Zk9lUVo4?=
 =?utf-8?B?MThHTE16U0FhbVhnVHdmbDlCTCtvdEY3MGJCREJqRjdxR2hrWTdxM3c3L0k5?=
 =?utf-8?B?dktDQ2dudDZ1MkVOVDNPdmZkbkpaK1g0a0VicEVoeVZFbExncXp4cDQ2cnAv?=
 =?utf-8?B?NkhqZ1VzVVB6RFQ2QnNHRVEyTEZRemFTdlRXT011MWxnb2psSnpzWStyb05U?=
 =?utf-8?B?UGFJcTU5Q3pIOTNhVVRINjhySzJ6NjBTNW5vbGhicWxlc1pvMDkzdFlXOTlY?=
 =?utf-8?B?UHVDdGFJVlRzNWU0WE5vQmdiSmhCa1dVZVdMTkRNZjZ5eGdwU2JybmRhR24r?=
 =?utf-8?B?dzIrYm94dlNOZUlrR29SWTRHQ1pTbkJLd2xzem9BUDZxR01GcG5jemxUa0tY?=
 =?utf-8?B?ZlVrMnA1MFd0RkRHaWYxYmNKNmIwekhRMVMydWQvS3BESDVzaDJlTXN4WVdO?=
 =?utf-8?B?cWlxd0JIRHprTjVaL21SWHV5a281M2Ixd2JrVWVpUCtYc1BRRnE4UWNsR1lB?=
 =?utf-8?B?VXA4RGJuSitjdUVZSm11dThIdzRLRmY1U1VQa3EybktVekVGWGxzdC9uU2pC?=
 =?utf-8?B?SjhwdVR1Ujd6ejV3ZFNlQmFnbHdLanhuRzB0bU9mV085bmdWcGowbWRoejZn?=
 =?utf-8?B?eERqS0ZpSThtTzVNSElMVWxVVEE4cmdwL2pub0g4bURFS2lzVFVNdVRUcGJD?=
 =?utf-8?B?MVJ0YlFFZElEYklzOHN5eDdLeU1GUGxHeUZFNWhKdzFicS9xY3hlZGVGS1lH?=
 =?utf-8?B?dlpUT0VxQUxRRG1vb1RhUEtScS9qQVJrVkFwQm5sV2p5R2VLYzFGRm5PZWky?=
 =?utf-8?B?aVJack44UmkwbzFJem5xMXVQRDg0eDhJU3BKdm1yVEk5dy9FTnFRMXlCNFlO?=
 =?utf-8?B?R3B5djJRSmFLUWR6NkQ5bjRGZ040SytRUzRUa0Rzbk10TTVqakpZZmxRQXVr?=
 =?utf-8?B?SnBobUV1RFNVcXdzYnc5QnJ2RVdDR1BEKzNRcGpsRUZ6RjRicjA0Y21MdE90?=
 =?utf-8?Q?EDlXNNm47h2+259s+WqBIUkNnJqC7rXODXvBSW+V/V7s=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR12MB6124.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(1800799015)(7416005)(366007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?ZE9VTjZFREVSUXZsWFlnTUttUHpnZEYrN3prYmhCT1Myc3I1K1FxWmRsNEZ4?=
 =?utf-8?B?WlprRzdzUTRaY095RW5FL2FLcVYyemlablFsZUxwOEFRTHl0eHdlc3hKN0lX?=
 =?utf-8?B?dnQxZG4rUzdhTGlkZjlNWnAwcW5CbWVwQnJpTGhiWExHbEZ2cUNYVVF0MlNm?=
 =?utf-8?B?ZGUwMHVXdXA0cDIxcDdZS3pqMWQ1S0UwRmR2cllLMzJHTEJlaTAzRm8rV1BP?=
 =?utf-8?B?NHFYN293Y1RiT0R0SmNzS0NEMUxNVWJZL2J3ekhGVFozMGVubk9GWHlPTlVt?=
 =?utf-8?B?S1hIZ0xNRnoxNmhCeFQ4ZldvTUJ5eE5sbXN2cE43N2xUNDNBVmtCaHVwS29T?=
 =?utf-8?B?c05BN1dkRVNLekRHcTgrS204Z1JXdHE5OVRPSjFMeDFpRTNwTThybDNhakN4?=
 =?utf-8?B?dkR5NzJzKzNyc2ZTZ0ovUmd2ZkdxZ01KVWllcTEza0N4K2lRVStGcHU1dTUr?=
 =?utf-8?B?NFNMNzJKY2RSSzQwSEdnRC83cy90UWsxL3B5ZmhsdFVaem44MHFzNmtPUzdV?=
 =?utf-8?B?L3J4Rk94cjhQNXgzVGd0czZjWTJqODZXSmtWQ0ZPcnR5SEVPdnN0L3FxTGRF?=
 =?utf-8?B?Mi9JNHRLVDloTUE3ZjMvb1FGUS9hU1dTQWFURWo1Sm45QUV1bG1NR3A1Qk9k?=
 =?utf-8?B?N2pnWTA2dUw4OExMeVk1aGhjZTkxT1N0dU8yYzU4YitxaU9wK3lqNWZMcTdl?=
 =?utf-8?B?SkpZZWQxMjBJbjJYUHJHenZtSHJZaUlqU05ISzI1UWZjdzlFSWx4ck5abjUr?=
 =?utf-8?B?WU5qVTMzK2xreEN1c2k3VGh6Z1JBeXkwWmpUOTNQQkc0T0N3S3NjRjNldVov?=
 =?utf-8?B?ejg4Z1N2dTdDN3RreXZCckhvdWpJb2EwQzVPY1pKMFAzemdSczlpT0gxbFMr?=
 =?utf-8?B?VzVIWEFxcEJLaUZkNUtpdm5PaHRjTmV1RkZRUjVvMXVRU1BQZk1CbnE0TEpE?=
 =?utf-8?B?S3ZxRGhEcHFlcWpzdExFYStEQm9vTE9mY0ZqMTNRV0liTXFKY3dnL282d2N1?=
 =?utf-8?B?VW1kVlE3QjNGQTk2Zm9CbG5QMjN4VnFsQityNldSZGx2cWRMQjdTNzJhZWpZ?=
 =?utf-8?B?UzlXaDFGVVZZREZGbEJ0eXlJMHBOdnRZdkQwRVFpZ1hhRnp5d0x2cXV6eFow?=
 =?utf-8?B?WEVIRkhKYnl4OG0vT1htb0VvekVmTGJBbWQzcW1PQ0ZrTFByNmx6TWNoeTFB?=
 =?utf-8?B?dFZqcWVVcUtTVXNCOXoyZHJKMjJ0aVNsTzBKWlRvOFBjVVUrcGFJeHJuU01n?=
 =?utf-8?B?ZHRoTHoxZjI2S2NhYjFMcFFWdXZMZVVhQzJOOXh0TEd5dldFcE9GbU5uOW5K?=
 =?utf-8?B?V1d5NE04N3hpdkxXMVRnZEJvN1Zaa1pYMklxdXI2UU53dGpQaDJXOUhtT29q?=
 =?utf-8?B?M0NKYkRPVzRvaVlHd1htbkZMRnFZbUI3NXd5NHhYMzRzVkVLQjVpczg2dmdE?=
 =?utf-8?B?VitxOUhBbEE1ZTd3bDdIQ3JKNXlBMktUNk1TcUdvYzAyQkFJMXRLRjRVK2RQ?=
 =?utf-8?B?OGsyOTN6QzFXQUhtV1FYMXFGZmdpSDQwRVRRc3pkcXZpdUp6TTFXbTF6STBq?=
 =?utf-8?B?bzZ2YnljRUpnUkFkdnM2QmdMdDltYTAxSytJajljVS9hSmdXRGZsbDJqYk1p?=
 =?utf-8?B?WmNjWmZtdkVHNTkwMzVUOTNaTGlvd1ZzNlJtUndtSzNIUlhUbzVjSVV4YTlq?=
 =?utf-8?B?MkwwYnVyOWN5YU5vMzJTY0YyOGh1Tk5qTWk0eE9USVBkT0ZQWC9pZUVRYi80?=
 =?utf-8?B?TWRjQm1IcFcrUThrK0F3TnJPa0ZZMGMwVXVrSlNGcFM5eDEzc0lNN3IrVVFr?=
 =?utf-8?B?b1J1ZjFhbE03TEtxOWgwanRNdVYrN1BZVWVkOTNuNzk2ZUVjb3Zzb3BCSVhX?=
 =?utf-8?B?WFkzdGo4SDB0VHJyMHJsTjRwbzFhTmFXWkFuVmZVQ0dEQkhnS3JaRkVwQjc4?=
 =?utf-8?B?WnQ5eStPMGRwaHpaOVVsSDc0Z2UzNDF5OSt3M2cyQnlsUmg3Qk9OZTFKUG5y?=
 =?utf-8?B?RTJpaTZESFJMUUtyRzBuTVhkT3BiazFya1pCaURhc3dDM1cxcFZZNDcwWkNN?=
 =?utf-8?B?Q1U3VjYva1F4azNOTVArZGlKbXhZUHRvbituMUlOOCsyektRR3ZKVTZjb2pV?=
 =?utf-8?Q?lL785KQFZ1dKyNjiDgAitMvUK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3e095d5-3892-4eac-7468-08dc7af1608e
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6124.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2024 06:27:10.8460
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J/nqHHIYQkvgUgeLbTI5WVrfudkweP4SMMw2rvyoZnwsY0JLPNxKm0MFHA0M9nbimaFniP7PIiv8oqwyJ70/jQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6338
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
Cc: "felix.willgerodt@intel.com" <felix.willgerodt@intel.com>, "matz@suse.de" <matz@suse.de>, "keescook@chromium.org" <keescook@chromium.org>, "jhb@FreeBSD.org" <jhb@freebsd.org>, "binutils@sourceware.org" <binutils@sourceware.org>, "x86@kernel.org" <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "npiggin@gmail.com" <npiggin@gmail.com>, "linux-toolchains@vger.kernel.org" <linux-toolchains@vger.kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "George, Jini Susan" <JiniSusan.George@amd.com>, "ebiederm@xmission.com" <ebiederm@xmission.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 5/22/2024 9:04 PM, Borislav Petkov
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20240522153433.GCZk4QiX4Hf0OuI48E@fat_crate.local">
      <pre class="moz-quote-pre" wrap="">Caution: This message originated from an External Source. Use proper caution when opening attachments, clicking links, or responding.


On Wed, May 22, 2024 at 06:42:55PM +0530, Balasubrmanian, Vignesh wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
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
          <pre class="moz-quote-pre" wrap="">Why can't this use the existing 'enum xfeature' which is providing
exactly the same information already?
</pre>
        </blockquote>
        <pre class="moz-quote-pre" wrap="">First version of patch was similar to what you mentioned here and other
review comments to use existing kernel definitions.
<a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-mm/20240314112359.50713-1-vigbalas@amd.com/T/">https://lore.kernel.org/linux-mm/20240314112359.50713-1-vigbalas@amd.com/T/</a>

As per the review comment <a class="moz-txt-link-freetext" href="https://lore.kernel.org/linux-mm/20240314162954.GAZfMmAnYQoRjRbRzc@fat_crate.local/">https://lore.kernel.org/linux-mm/20240314162954.GAZfMmAnYQoRjRbRzc@fat_crate.local/</a>
, modified the patch to be a independent of kernel internal definitions.
Though this enum and below function  &quot;get_sub_leaf&quot; are not useful now,  it
will be required when we extend for a new/different features.
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
No, Thomas' sugggestion is to use the existing xfeature enum - not
define the same thing again.

Why do you need that enum custom_feature thing if you can use

/*
 * List of XSAVE features Linux knows about:
 */
enum xfeature {

from arch/x86/include/asm/fpu/types.h

?
</pre>
    </blockquote>
    <span><span class="ui-provider a b c d e f g h i j k l m n o p q r s t u v w x y z ab ac ae af ag ah ai aj ak" dir="ltr">As discussed here :<a aria-label="Link https://lore.kernel.org/linux-mm/24f71d52-0891-4cfc-8dec-9f13ed618eee@intel.com/" href="https://lore.kernel.org/linux-mm/24f71d52-0891-4cfc-8dec-9f13ed618eee@intel.com/" rel="noreferrer noopener" target="_blank" class="fui-Link ___1rxvrpe f2hkw1w f3rmtva f1ewtqcl fyind8e f1k6fduh f1w7gpdv fk6fouc fjoy568 figsok6 f1hu3pq6 f11qmguv f19f4twv f1tyq0we f1g0x7ka fhxju0i f1qch9an f1cnd47f fqv5qza f1vmzxwi f1o700av f13mvf36 f1cmlufx f9n3di6 f1ids18y f1tx3yz7 f1deo86v f1eh06m1 f1iescvh fhgqx19 f1olyrje f1p93eir f1nev41a f1h8hb77 f1lqvz6u f10aw75t fsle3fq f17ae5zn moz-txt-link-freetext" title="https://lore.kernel.org/linux-mm/24f71d52-0891-4cfc-8dec-9f13ed618eee@intel.com/">https://lore.kernel.org/linux-mm/24f71d52-0891-4cfc-8dec-9f13ed618eee@intel.com/</a><br>
        My understanding is that, if/when we extend this for other/new
        featured outside of XSAVE we might end up modifying the enum
        that is very specific to XSAVE.<br>
        Currently, this enum is the same as XSAVE, but when we add other
        features, this enum might have a different value of the XSAVE
        features and can be modified without disturbing the existing
        kernel code.<br>
        Please correct me if my understanding is wrong.</span></span>
    <blockquote type="cite" cite="mid:20240522153433.GCZk4QiX4Hf0OuI48E@fat_crate.local">
      <pre class="moz-quote-pre" wrap="">
--
Regards/Gruss,
    Boris.

<a class="moz-txt-link-freetext" href="https://people.kernel.org/tglx/notes-about-netiquette">https://people.kernel.org/tglx/notes-about-netiquette</a>
</pre>
    </blockquote>
  </body>
</html>
