Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 525EE393122
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 May 2021 16:41:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FrVrT2Zg5z309P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 May 2021 00:41:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=WMnXzm73;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.212.84; helo=nam02-bn1-obe.outbound.protection.outlook.com;
 envelope-from=thomas.lendacky@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=WMnXzm73; 
 dkim-atps=neutral
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam07on2084.outbound.protection.outlook.com [40.107.212.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FrVqx4QMqz2ykP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 May 2021 00:41:15 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a5Qkid7FttMYKKHYpUGdBU+35V4v+SsRNsnuT4KRcIxWmjURLSiJhV9KUNRs240BnwURE1lRi47gpOsPbOsoebE3T56cqXAdgiCT+fx2KymwxFZ1LE8I2UAxnkpKa9HX28sax9Jrcm0xSx+cTkLWlhp+Ey3Jpz307gLGa8bcZWe5URxMT9w/bjuRk4FESXGP7OD/2wkbRrr2moxKTcs3m65CU22s6uqLDe5Y/qZmePTDvPIDjkxBK827NFqAr6IxyM4UA4OLyIjfrit49TrRfTuj+JdDzNcOM54wWoxH6j3PRg7/nWJjOe6bXRUuQBqQHWFOaVV7VMjaK2oTNg5KpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xov16ex2LLNz59XcqP8ZntDrIieWMcGionlMx8pusEY=;
 b=NVhmAjt1LefX6M7BHKuU+NBv/+rPRp7mehKbMgD7Vo8QiapJo1wU7pzItmAroymAmuWmZbLIoGo1v9v/yID6cJLuLRuE66bRyBLGcxVOMj0ICLwQNArdnn+tIuzXTEtrUJna5q5b40Gg1hilSowkndsei0MOMkPuAGswBCooBY9ehcs0iv+OJlFr3pYyoKhAwMd02EqgWiboCbwzwQgPWLYD4xWTKYGERouAwJJTVuKyE974PJpyBZVK5EPYcUTFUkwkEeFamtw9SswgAzezsWe1vCD9I6Uu8+IqHGaZLn8Qa/w0dfGR3MunzK5Zi6z5vbhKmN+k+3Yawg5ugCB4ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xov16ex2LLNz59XcqP8ZntDrIieWMcGionlMx8pusEY=;
 b=WMnXzm73hbEdQkv9+AAe+P/IpiJ2/2NFybvRfzC8WnYGVfU2s+kuP5a6/0LfGLvH7MnrUc3CO+ODX3GNtyrpvclzfwJALOnWGHsg31xfygktZ4wxstidddi+ggkxlgzKI/MsdTkzJZGdOIn6AisWXY3LVl4ToaYPSvjcMELD0mw=
Authentication-Results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7) by
 DM6PR12MB4218.namprd12.prod.outlook.com (2603:10b6:5:21b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.24; Thu, 27 May 2021 14:41:08 +0000
Received: from DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9]) by DM5PR12MB1355.namprd12.prod.outlook.com
 ([fe80::b914:4704:ad6f:aba9%12]) with mapi id 15.20.4173.022; Thu, 27 May
 2021 14:41:08 +0000
Subject: Re: [PATCH v7 01/15] swiotlb: Refactor swiotlb init functions
To: Christoph Hellwig <hch@lst.de>, Florian Fainelli <f.fainelli@gmail.com>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-2-tientzu@chromium.org>
 <170a54f2-be20-ec29-1d7f-3388e5f928c6@gmail.com>
 <20210527130211.GA24344@lst.de>
From: Tom Lendacky <thomas.lendacky@amd.com>
Message-ID: <bab261b4-f801-05af-8fd9-c440ed219591@amd.com>
Date: Thu, 27 May 2021 09:41:02 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
In-Reply-To: <20210527130211.GA24344@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [67.79.209.213]
X-ClientProxiedBy: SN2PR01CA0050.prod.exchangelabs.com (2603:10b6:800::18) To
 DM5PR12MB1355.namprd12.prod.outlook.com (2603:10b6:3:6e::7)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from office-linux.texastahm.com (67.79.209.213) by
 SN2PR01CA0050.prod.exchangelabs.com (2603:10b6:800::18) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4173.22 via Frontend Transport; Thu, 27 May 2021 14:41:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 59e14bbc-1eea-4b9f-e0b6-08d9211d768f
X-MS-TrafficTypeDiagnostic: DM6PR12MB4218:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4218889520CE03D8A0062CAAEC239@DM6PR12MB4218.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nZNB84YC4kztOdLzWwMIlAuRl+h2KTNM+1A6fbzJA0nn9U3XrzLsdsg5fPGYLYXKx6BpkcxDV/PnT5Ym8OKRkAC0PkUfImgHMBoqNsExvyly+UmVkcW5UhrZRh4m7mC4TM/H784Uu41+EJZBAymgGY0SOBhF2a5m7wjXykLewN7O5UhL5Eokq6HcCehl9IOXO2rn8wkquQmMPSfJgFdghwToh8urF5O/q1hLoIeEzsPLt7qPDr4QG+mzBrMlQ5Faf15YqTi0Ajn1URT4xnVabof/ysvP4a73X2R5RsAJXocyU2CyWZOT2IO02O0KIiQ8bOKNl5OmHjK9PQZCucn4x4Y83ibfder6hoJx3+C6s4L8KJZk5gErfn1bslS9AgrJ+uiMLoLqgcyTGqfBhIc0I6jsmlYifXpA46e+mOWbtMEhNRIw9wJRjOxtH7lF+7fncpH/EjenpZKDSdyqdJjUtZmdOAX9q7ImvJWx6n7KzNtn+CaObMHxcwUdXOBgp+HfTVKk2SbGKKA2I6tMZQGqOaakYmNfT3HSAE0CNVGJ0Nxaav1m7zoG6+P7X40RPeQ2rhCnYWb7HBy+mbEMFp6PPKg+iCoJ5PRwz+8ZQYOEtSvHCypshtkyhG97zbLj+68F/InSYrrqudvTKYNYYNvpubjb0kmyV/Say81zdfegQYU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1355.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(346002)(376002)(366004)(39860400002)(38100700002)(4744005)(7406005)(7366002)(7416002)(6512007)(2906002)(53546011)(86362001)(8936002)(478600001)(2616005)(16526019)(956004)(316002)(5660300002)(36756003)(83380400001)(31686004)(186003)(6506007)(6486002)(54906003)(66476007)(110136005)(26005)(31696002)(4326008)(66556008)(66946007)(8676002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OGgyZW1PNU5qT3ZSeisxckZFc0tldW91cTExWEx4RVFXbjBLS2JVTitudGd5?=
 =?utf-8?B?ZXB0bDY0SVM3cTZrd1JGeFo0SDRjMTlEVkJmcnZ0MzI0UnZSWVZRQlZEY0dV?=
 =?utf-8?B?VjRaSlkyNm1KMEsxcFg4VGZEWVA2T25tYW4wajdHR0YxNGJBRjV4eXZYRUpT?=
 =?utf-8?B?QWkybUc3UVlnNTBHS3M0NUlhU0MvWDRsRldpck1iSmh2aHFNalM2MXBqcmpa?=
 =?utf-8?B?QUU1YnZvWjJlR0lYRVpvbjhlSmVTS1RqVERibnl4M1Y4eDR5QUlJWlpLMUor?=
 =?utf-8?B?ak5NYldoR0dxczZZNmFwSEtOMHFKcHlmZTVmTEl0TVNmQkl4ZjRncXFRN0tB?=
 =?utf-8?B?TWltUFlTcjVRYUU4d1pUMXBSakkzc2IrMkR2eHBEL2J1N1NtMzFJTytsWTMw?=
 =?utf-8?B?NVVOdFp4TitQVlhDZit2ZEIvM294SHZjeVZCOVZqbTk2SmNYeXV5bCtKa2pD?=
 =?utf-8?B?UEFqSW50ck5BdDRuQUNwUFF3aGVZUDRFUUxEeFlET1FYaC9GU2dSNVUyZzVW?=
 =?utf-8?B?a3NmY3duR2tRYko0NGd4Rzc2NzVGSkJMSWJGMnFFSk41Y1NYb2llSUszdUMv?=
 =?utf-8?B?anZZZjJWSGNoeXJXajZjQlJNcXQ5VzBPVmZ4clc4eEJBT0dGblRZLytia0NP?=
 =?utf-8?B?MURQUEZwVDJSalBsRlFuYUJabC9MakVubG9tVjVJOVdkMnl5ZWtNSU5TOGdM?=
 =?utf-8?B?Z0ducUxiM1daNStlM0tFZzU0emh2YnQxSjkxZmd1cy9LV1R4WmxGUlA0NlhO?=
 =?utf-8?B?SnoyOElpaDhzUHFZdDE4UVpMSmtmdkFpY2pvTksrTUxWejJqV0Vob2NjMUVq?=
 =?utf-8?B?ZUxxdlQraGd0YTZPekNOQ3N4UTNwV0huUG9Mam9rM1hnajc4VE5qT2xnWUNn?=
 =?utf-8?B?VWNBTkxULzlJN3BHNWVnTUc5cDV4S3dmdU9YR3VveWZURnQ1TmJxZjE1aDhy?=
 =?utf-8?B?UXFtNnRPOFladWZab1JwWmloN2plYTdUc2NqaWlFTFZMTEdKTERkZnZSTy8z?=
 =?utf-8?B?blcrbWU1RTVsWFlHNXhFRlUwZFFpdDduWTJNcDRPMGVtVTJ6dVdHQjFYNFVP?=
 =?utf-8?B?djc4NjdKeVc3czFvanFROFFqdU9VOWE5Wmc0d01QTE9GeHAvVFY3SnMvdW5z?=
 =?utf-8?B?Qi9VN2lVUnNsb2pxOWliOXlmcDh6eG9iZUtRZzNXZmFXRFlvUlpNM1FHaGVx?=
 =?utf-8?B?V2hCbUhpWkQwRmdyelozSzFyMDlRNnJveXBCU1c3MlgxYTlTMWIybzc2UjAy?=
 =?utf-8?B?dW9RSnlOakVsblZDN0F6dzdMOW9lNDQxbngrMGpvT3NVTDZpTDVEeXV0T01L?=
 =?utf-8?B?ODM3azY4TU93UE1CMHZ3V3pnUTZycmF6YmliVTZORXBiZ3hJeXJLcnpiTmtM?=
 =?utf-8?B?RHEwalZtaU8rTTY3ajlaaHpmSjJTZEREdGFPcHlBMzJrS2tQZWtDajY0WmVB?=
 =?utf-8?B?K2EzbFZtQUtJWk9rRytLVG12Z2x3WVowRk8vRUdjYzZKUjJIK0tEVWNhcXJG?=
 =?utf-8?B?MndLQlk0cVljRW9NTkU5SWlScTFld3Fld3MrR1VmQXkvTmI2ZTNvZzhqYlhj?=
 =?utf-8?B?ZjNFZzdOV093akNmUlcvcklnYURkQUdWbHZBeXhibnpRSWhGVHJ0TTJmbk42?=
 =?utf-8?B?WTRTUWhzc3YvMFJmbnhTS3RIZDgwajhiVkk5OEx5V3hGRXpySmNCZDdVcGJU?=
 =?utf-8?B?WU9HbGRQN3E5dkFET0kzUUtEZVZDazdIaVl5TkVDMGlzSkZpZEdjb2NEQ2hz?=
 =?utf-8?Q?FkiPGixk4soS+HSivd/GXKKe6qNXTD5QcRXLY01?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e14bbc-1eea-4b9f-e0b6-08d9211d768f
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1355.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2021 14:41:08.0642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5CsF8+AyOlbzvidWQoLfPambEK4AEjMpHIQTAAL4vJ0v4GhJJhQZeJ2+YilHLtstBzE3OoZMtjG1uZ8CgLZkHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4218
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 sstabellini@kernel.org, Saravana Kannan <saravanak@google.com>,
 xypron.glpk@gmx.de, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 jxgao@google.com, daniel@ffwll.ch, Will Deacon <will@kernel.org>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, bhelgaas@google.com,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 tfiga@chromium.org,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/27/21 8:02 AM, Christoph Hellwig wrote:
> On Wed, May 19, 2021 at 11:50:07AM -0700, Florian Fainelli wrote:
>> You convert this call site with swiotlb_init_io_tlb_mem() which did not
>> do the set_memory_decrypted()+memset(). Is this okay or should
>> swiotlb_init_io_tlb_mem() add an additional argument to do this
>> conditionally?
> 
> The zeroing is useful and was missing before.  I think having a clean
> state here is the right thing.
> 
> Not sure about the set_memory_decrypted, swiotlb_update_mem_attributes
> kinda suggests it is too early to set the memory decrupted.
> 
> Adding Tom who should now about all this.

The reason for adding swiotlb_update_mem_attributes() was because having
the call to set_memory_decrypted() in swiotlb_init_with_tbl() triggered a
BUG_ON() related to interrupts not being enabled yet during boot. So that
call had to be delayed until interrupts were enabled.

Thanks,
Tom

> 
