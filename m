Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 896393BDBCC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 18:59:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK8193Xt8z3022
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 02:59:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=qWOtIZWj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=amd.com
 (client-ip=40.107.220.84; helo=nam11-co1-obe.outbound.protection.outlook.com;
 envelope-from=nirmoy.das@amd.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=qWOtIZWj; 
 dkim-atps=neutral
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2084.outbound.protection.outlook.com [40.107.220.84])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GK80b36rwz2yx4
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 02:59:07 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UHoSnc8pAlMguMKyhgULwSPdiNVpkBg/hOoGluc1DsHBSDGFzHVFdwtWr+XbkLNj9O4qokVcTUyHuuT6r5QkN+An4Fx+GwTe90mjqYC8bNV0sDzFn9c+aWxSsySlb0zZ4qZrFMACnU2ZX74tUwoOlfPkAiOa1gW9hqYUgsIqEGR1opLfV+19NeHdIJsnqRnTYTFIoj/ht13vPcpU3cpAvWmpEK4vQepqM+MBjKobKNEadK5JFEzfMSM2t40P8hoTmRYzpcED2gJi2U5RYsm6zXGdD8QFAAiyCZPbracoc7dIMExDUCSnNHEC1cxpvNCchwolIGFQh1cAHtzZ5zo2qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9R3UgE8v3l7QMaXKHpDKEteoddzxqmzWmqjEupcYSY=;
 b=cQF6xeiXyWjeFZmFtwUtZ+frW9qEX1W8tsCz62+4TURRYXi5tro4Y+9y5Hvjt7Pwazg+/k3rKpg00AvP3VGf0NkQJ0XnPeOPEkDA18g1e4OEEj8os4pj2mJ+3nXXQ7dcIWVlrOrXm+mn1tyOyKopQ21Bx98QhxSHNMvkb5g64wo7qKp6qbP3YneI+uzOWI4dXxmLhI6HU+afUMFtsng4PbRMgJCHI3hMJcqzGhem6h+B4kg4rsdlP0TBeQYtsIfXM3ffhKHD3iPrsx/SoPpEKAoErRVCAjSqd7jf84GNDuDYy6D3gwnRyiAr5CXvMoQn/jpkh1R4KE7WYUXB1L6OIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E9R3UgE8v3l7QMaXKHpDKEteoddzxqmzWmqjEupcYSY=;
 b=qWOtIZWjzoHgf+Re4Jp4sCcMxpeMf44ccDHGJDgMwe6acxQdoy/FF8AVU+7Bl46QU3UZShNXQaRgApqD73sh3lQfhdehb+hrf7WoWo7dJH7DFL9MDNoI6YE1LEpIJm48cjWVVYWb9Yue2wdaatmZMfFbmkiJH7m11YBHdjoFuFY=
Authentication-Results: xenosoft.de; dkim=none (message not signed)
 header.d=none;xenosoft.de; dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB5136.namprd12.prod.outlook.com (2603:10b6:5:393::23)
 by DM4PR12MB5230.namprd12.prod.outlook.com (2603:10b6:5:399::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.20; Tue, 6 Jul
 2021 16:58:49 +0000
Received: from DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::fde0:6f07:7dfc:8097]) by DM4PR12MB5136.namprd12.prod.outlook.com
 ([fe80::fde0:6f07:7dfc:8097%5]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 16:58:49 +0000
Subject: Re: Xorg doesn't work anymore after the latest DRM updates
To: Christian Zigotzky <chzigotzky@xenosoft.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
References: <20210509224926.GA31035@embeddedor>
 <CADnq5_OWk+rXK5xrwu0YOMVC45WyQgFQBTUNkcF8oO3ucp+=XQ@mail.gmail.com>
 <ba5f2a73-58e8-6b3e-4048-bb19f238be51@embeddedor.com>
 <4e0a3130-4c20-aa8a-f32a-6c3f0d9cd6f8@xenosoft.de>
 <345042b3-7b96-63d9-d4a5-f31c4441ddaf@amd.com>
 <d22b9f68-3692-2819-33a4-123b7182daf3@xenosoft.de>
 <1a269f97-7260-4860-dfe7-c723b73fd909@xenosoft.de>
From: "Das, Nirmoy" <nirmoy.das@amd.com>
Message-ID: <354b5f95-b530-7e83-7cb1-b3ef098dc412@amd.com>
Date: Tue, 6 Jul 2021 18:58:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
In-Reply-To: <1a269f97-7260-4860-dfe7-c723b73fd909@xenosoft.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM0PR05CA0089.eurprd05.prod.outlook.com
 (2603:10a6:208:136::29) To DM4PR12MB5136.namprd12.prod.outlook.com
 (2603:10b6:5:393::23)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.31.54.68] (165.204.72.6) by
 AM0PR05CA0089.eurprd05.prod.outlook.com (2603:10a6:208:136::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4287.23 via Frontend
 Transport; Tue, 6 Jul 2021 16:58:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c1f0cf49-40d8-4d60-d10f-08d9409f5356
X-MS-TrafficTypeDiagnostic: DM4PR12MB5230:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM4PR12MB5230FD2ACE3E5CBB76F40FCD8B1B9@DM4PR12MB5230.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:64;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mbFo3dBHraVVTB2IG1Sne1Cc2A7sLrqqZvAkeLX0K5Cc5xRiLxJq5NI0F7PXKubFmJS7rYxRtpI+UxKGzZB2fbRiXtDtYxu06IWhTbYYGSUBGqCsm5KaW8dYDEw3AOUGaORlEa626pa3Tv36JrHOc3yjxeL2TXdHRlLWrdyhn4H+PZ90f4qen+dUC688ih5u6jnvQM0ZI4hjMZv0wzB4NCoiG1wTdJSd04g3y2wdfokfoLCshaaonNBBTXDMd7FEhMCPm+w/qi4p0g5krzqgdpHvoaca0PpIh++MFmXlwzVzwalYBVYGU/K6CZuCPVm3LO1wwBpFxhHXexQzFKzJilI1B8SxymFPw53MT7uG/mvLLqFORl3BP3hQHBOPWrJfFiM+Rgotw7kDzijABWGSIcStqwcQbWWZKhyD+Q4aHi46g+LgEmziDpW2bEQgDccvufJ40DZ2BbyF5+MObsPqnV+cKwUpwk8H8S2cyX0WOLZLVA8BZOv72kCwqC1ltFsKroCXhlZSmyfrgRbZekXvbu27odN2xMPHmeZFIYM877B+brPbSpmt2BFmL2PxsouljswbhMhWmQmaSq485WpEKeMe5X9SjadNUwcV4ZPHuk6G4YA+l+omMEg/u69pW170SBDDwzmsDzd7PDQRBB8XEZeAv+4Wt/YjGXMIojegBL+cysPzqQj8bEcF0/NLJux4IcgfEvBwsaJ9/UPVRk+4zweysP5v5PM74RxymTqAQN2M5UFK4vHosVLDt+ox39L4BB5sKkmPU9V7qiRDPyVB8Dw28e+AGhvOQwXb3AhrjF+AHUzgDpM6GIa9pKK9aGK25cxgsy3iVNOlQ/zcwzguS55xUEMO8MSfnXVLK7s4/RQtfFK1OBLz9/xNpbvkTNYP
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB5136.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(396003)(366004)(376002)(136003)(478600001)(6666004)(15650500001)(45080400002)(38100700002)(966005)(38350700002)(6636002)(6486002)(186003)(8936002)(2906002)(26005)(8676002)(52116002)(53546011)(31686004)(66556008)(4326008)(66476007)(66946007)(16799955002)(5660300002)(2616005)(16576012)(66574015)(956004)(36756003)(110136005)(31696002)(83380400001)(86362001)(316002)(54906003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y1kvVW92SjNmeEZxQ01yYXVkaXJHTGZBbUlBenVrL2dzdE1GU3RGaTZRYmVK?=
 =?utf-8?B?ZHAzZUdFU3g4elUxNklqUW1pOWdWWmhIeFgweVErazlEWkg3Q2hRUUNyMVVY?=
 =?utf-8?B?TW0vbldHeG05YlRENmJ0K3g4MUwzSVBQS0pJWlNVNmp5eWE3enhxOUllTmxw?=
 =?utf-8?B?Y0JGRlBsZjNkS3RUNEo2UTB6ZEVhd2ZrUmtQZkhXMXArUEhVdUx1a1A3eXVx?=
 =?utf-8?B?TStkTnFEVW1BTzArYWE0MFBrT0RlbjlTVkx6dEt2STg3UmF2YnRMVmU2bkNI?=
 =?utf-8?B?WmhoMmI3UDN0L2dMc0dSZ0Y0TTg2NFlHODA0enRkNk9UbXpGK0ZLa1VPYjcw?=
 =?utf-8?B?VWFmc2EycDcwN0lmMHcveDZZTTIzZ2RaY1JmV1locnZGdVhmNmRFeGZ5VkE4?=
 =?utf-8?B?TVhXV2o5R1lkWWE1UXFkVktsbEpMOFJTanUxczcvOURyeW0wbVdkNGpaT2dY?=
 =?utf-8?B?V0pRdmhRZzQ4YXFPaGZ3S3I1aFQvMkxsd3RRbTB5OVIwMGdEUGZmUHhZOG1G?=
 =?utf-8?B?R3ZZWGJ5dEIyUzg5VzZFYXd3WURrcXN1WkQ1TlM1cXJCUERua2ZubjhXNVRa?=
 =?utf-8?B?blVvS1B5M1FEaVpmY2pBZlRweVVkNEJrMG1TZjdCUGo4TUpnMFVMODBReHZQ?=
 =?utf-8?B?YUFnZ21TTTF2QVZHZGVmMitZamx1QVRyQmpzVFVCMGlaSGNqRzZIaHlnUE9a?=
 =?utf-8?B?ZWd3Z0FYSjZyWDlITUNNbmlubm1ZdmJLUmM4VHBjQXVQTkNaeW1GcTZaTUhD?=
 =?utf-8?B?R3lsN3pia05pbWcwWW9rSmRYZ3lKa2RGQk44OU40MEFjeTFoZlFIV0N2cVN0?=
 =?utf-8?B?bm9FQnVOZGFhV2RoTzE1QmRZcmdFRDBKdnRMdjkvNy83QXJOaXQvVGhkQkNK?=
 =?utf-8?B?WnN4V3J4KzlOSUJ3MGJIdEdpQmJQUlNWTWxML2FncVBSZHNoeEFraVROZFM5?=
 =?utf-8?B?RFBuZG9WZjY2b0RkbFUrbE1uYVEwUW1NT1owVXcxNU8zVWxReHgzQlRzNU5S?=
 =?utf-8?B?KzJTVXBtcDFrSWhoN2tSbjBPTjJWNDBuUmoxQzE4d3F1QXJsV3JuQlI2TWE3?=
 =?utf-8?B?bTU5Sit2cjM5NkdWNXBwYnJWQkZQYWVZN0I0dm9GK1J3RnBwSzFDZVI3cVlT?=
 =?utf-8?B?STBDTWNQSmRRNi9DNDJnVWpFV0o2R0M0NUlGekY3bFEzRjVvVnptOEJDcThu?=
 =?utf-8?B?end6ZFlyQ1FIYjdyU3R1d21LV3kxUVY4c3RhS0g3UzdFRzh6UmV0TTFXVWg0?=
 =?utf-8?B?WmE1dFZveWVleWNNNVUxUkxZalUyTFBNY0ZsOTI2NVBLd3E1QVFUQTk1MURO?=
 =?utf-8?B?dE5CMkw2bUEyTlVhVXNXVURKdGlEdGZKWGkybURjZDh6c1dXWTlwMXdpQzUr?=
 =?utf-8?B?eTNqa2dmTXo5MDVRS0FNUDAxYkFNWEE2WDRlNHBWaUdscmhoMkZRQXB3c0Y2?=
 =?utf-8?B?QkwzTXFxNXp0dm1HSisrRXlDRU1NeXZ1ZDRqQTVmVFpwZ1lwNUp4TU5Pb002?=
 =?utf-8?B?dlo5Uk94dXYrcTFxclZONlRBdnZ3Q3BpWWdZMTdsTUY1ZzNuVldkY0FBUS9p?=
 =?utf-8?B?MnhKNkdRZ1lFdVhsa1pnMHVFYktLdzZJQnZuY3RvS1lLT0FLTk1XRU8zMnRh?=
 =?utf-8?B?cDhiR0wvU055OXdYRGs5VE5pMU9lKzhpQnZnOVk0V3Z0NWNFYytYVnU4OHBi?=
 =?utf-8?B?OG1UbFlaV290VDdvTjhtblNwekRUSHJhdXBTRWJ3WUl6K202bW9PQnJ5SlpM?=
 =?utf-8?Q?dPp4CQ3Jf4usGhv4olLrEteGN8c7HrVSRdbE0w2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c1f0cf49-40d8-4d60-d10f-08d9409f5356
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB5136.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 16:58:49.3703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4OjFPYhk4InYFoR+2c3pqOQyGKuc+ANKzo+P3Zzxq4xC4zNA8DYs4UmOBlYNIflXdLIjLiEWZReTWhW9KOoApQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5230
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
Cc: Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 mad skateman <madskateman@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Happy to help, Christian :)


Nirmoy

On 7/6/2021 5:33 PM, Christian Zigotzky wrote:
> Hi Nirmoy,
>
> This patch works! Thanks a lot! We tested it on an A-EON AmigaOne 
> X5000/20 today.
>
> Screenshot: 
> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwww.skateman.nl%2Fwp-content%2Fuploads%2F2021%2F07%2FScreenshot-at-2021-07-06-113237.png&amp;data=04%7C01%7Cnirmoy.das%40amd.com%7C1879913cfa594f104bb508d94093713e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611824271179607%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=JehEsOxoinPX%2BSC8YzjBwKNOFcAquiVwHUS35pf%2FGu4%3D&amp;reserved=0
>
> Cheers,
> Christian
>
> On 05 July 2021 at 06:48 pm, Christian Zigotzky wrote:
>> Hi Nirmoy,
>>
>> Many thanks for this information. We will test this patch asap.
>>
>> Have a nice day,
>> Christian
>>
>> On 05 July 2021 at 10:26pm, Nirmoy wrote:
>> > Hi Christian,
>> >
>> >
>> > This issue looks similar to the one Mikel Rychliski fixed recently  
>> : 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fpatchwork.freedesktop.org%2Fpatch%2F440791&amp;data=04%7C01%7Cnirmoy.das%40amd.com%7C1879913cfa594f104bb508d94093713e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611824271179607%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=QaPHA%2FlS%2Bt1wI1Awce6%2FMG2rdUv2Zk1DZMRiR47mcGA%3D&amp;reserved=0. 
>> Let us know if this helps.
>> >
>> >
>> > Regards,
>> >
>> > Nirmoy
>> >
>> > On 7/3/2021 9:30 AM, Christian Zigotzky wrote:
>> >> Hi All,
>> >>
>> >> Xorg doesn't work anymore after the latest DRM updates. [1]
>> >>
>> >> Error messages:
>> >>
>> >> Jul 03 08:54:51 Fienix systemd[1]: Starting Light Display Manager...
>> >> Jul 03 08:54:51 Fienix systemd[1]: Started Light Display Manager.
>> >> Jul 03 08:54:51 Fienix kernel: BUG: Kernel NULL pointer 
>> dereference on read at 0x00000010
>> >> Jul 03 08:54:51 Fienix kernel: Faulting instruction address: 
>> 0xc000000000630750
>> >> Jul 03 08:54:51 Fienix kernel: Oops: Kernel access of bad area, 
>> sig: 11 [#1]
>> >> Jul 03 08:54:51 Fienix kernel: BE PAGE_SIZE=4K PREEMPT SMP 
>> NR_CPUS=4 CoreNet Generic
>> >> Jul 03 08:54:51 Fienix kernel: Modules linked in: algif_skcipher 
>> bnep tuner_simple tuner_types tea5767 tuner tda7432 tvaudio msp3400 
>> bttv tea575x tveeprom videobuf_dma_sg videobuf_core rc_core videodev 
>> mc btusb btrtl btbcm btintel bluetooth ecdh_generic ecc 
>> uio_pdrv_genirq uio
>> >> Jul 03 08:54:51 Fienix kernel: CPU: 3 PID: 4300 Comm: Xorg.wrap 
>> Not tainted 5.14.0-a3_A-EON_X5000-07637-g3dbdb38e2869-dirty #1
>> >> Jul 03 08:54:51 Fienix kernel: NIP:  c000000000630750 LR: 
>> c00000000060fedc CTR: c000000000630728
>> >> Jul 03 08:54:51 Fienix kernel: REGS: c00000008d903470 TRAP: 0300 
>> Not tainted (5.14.0-a3_A-EON_X5000-07637-g3dbdb38e2869-dirty)
>> >> Jul 03 08:54:51 Fienix kernel: MSR:  0000000080029002 <CE,EE,ME>  
>> CR: 20000222  XER: 20000000
>> >> Jul 03 08:54:51 Fienix kernel: DEAR: 0000000000000010 ESR: 
>> 0000000000000000 IRQMASK: 0
>> >>                                GPR00: c00000000060fedc 
>> c00000008d903710 c00000000190c400 c000000085d59c00
>> >>                                GPR04: c00000008d9035b8 
>> ffffffffffffffff c0000000870a4900 c000000085b62d00
>> >>                                GPR08: 000000000000000f 
>> 0000000000000000 c000000000630728 0000000000000003
>> >>                                GPR12: 0000000020000222 
>> c00000003fffeac0 00000000ffe51070 000000000086007c
>> >>                                GPR16: 0000000000862820 
>> 00000000ffb7ec68 0000000000000000 00000000ffffffff
>> >>                                GPR20: 00000000c04064a0 
>> 0000000000450088 00000000ffca79e4 5deadbeef0000122
>> >>                                GPR24: 5deadbeef0000100 
>> 0000000000000000 c0000000876028f0 c000000080bd4000
>> >>                                GPR28: c000000087603c48 
>> c000000085d59d78 c000000085d59c00 c000000085d59c78
>> >> Jul 03 08:54:51 Fienix kernel: NIP [c000000000630750] 
>> .radeon_ttm_bo_destroy+0x28/0xc0
>> >> Jul 03 08:54:51 Fienix kernel: LR [c00000000060fedc] 
>> .ttm_bo_put+0x2ec/0x344
>> >> Jul 03 08:54:51 Fienix kernel: Call Trace:
>> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903710] 
>> [c00000000060fbe4] .ttm_bo_cleanup_memtype_use+0x54/0x60 (unreliable)
>> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903790] 
>> [c00000000060fedc] .ttm_bo_put+0x2ec/0x344
>> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903820] 
>> [c000000000630b50] .radeon_bo_unref+0x28/0x3c
>> >> Jul 03 08:54:51 Fienix kernel: [c00000008d9038a0] 
>> [c0000000006d1f6c] .radeon_vm_fini+0x1b0/0x1b8
>> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903940] 
>> [c000000000618e38] .radeon_driver_postclose_kms+0x128/0x178
>> >> Jul 03 08:54:51 Fienix kernel: [c00000008d9039e0] 
>> [c0000000005deb14] .drm_file_free+0x1d8/0x278
>> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903aa0] 
>> [c0000000005def00] .drm_release+0x64/0xc8
>> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903b30] 
>> [c00000000017636c] .__fput+0x11c/0x25c
>> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903bd0] 
>> [c00000000008b1e8] .task_work_run+0xa4/0xbc
>> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903c70] 
>> [c000000000004bf4] .do_notify_resume+0x144/0x2f0
>> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903d70] 
>> [c00000000000b380] .syscall_exit_prepare+0x110/0x130
>> >> Jul 03 08:54:51 Fienix kernel: [c00000008d903e10] 
>> [c000000000000688] system_call_common+0x100/0x1fc
>> >> Jul 03 08:54:51 Fienix kernel: --- interrupt: c00 at 0x3f4f58
>> >> Jul 03 08:54:51 Fienix kernel: NIP:  00000000003f4f58 LR: 
>> 00000000003f4f2c CTR: 0000000000000000
>> >> Jul 03 08:54:51 Fienix kernel: REGS: c00000008d903e80 TRAP: 0c00 
>> Not tainted (5.14.0-a3_A-EON_X5000-07637-g3dbdb38e2869-dirty)
>> >> Jul 03 08:54:51 Fienix kernel: MSR:  000000000002d002 
>> <CE,EE,PR,ME>  CR: 20000420  XER: 00000000
>> >> Jul 03 08:54:51 Fienix kernel: IRQMASK: 0
>> >>                                GPR00: 0000000000000006 
>> 00000000ffca66a0 00000000f798a310 0000000000000000
>> >>                                GPR04: 0000000000000000 
>> 0000000000000000 0000000000000000 0000000000000000
>> >>                                GPR08: 0000000000000000 
>> 0000000000000000 0000000000000000 0000000000000000
>> >>                                GPR12: 0000000000000000 
>> 000000000044fff4 00000000ffe51070 000000000086007c
>> >>                                GPR16: 0000000000862820 
>> 00000000ffb7ec68 0000000000000000 00000000ffffffff
>> >>                                GPR20: 00000000c04064a0 
>> 0000000000450088 00000000ffca79e4 00000000004317ac
>> >>                                GPR24: 00000000004317b8 
>> 00000000ffca66d0 0000000000000001 00000000ffca673c
>> >>                                GPR28: 0000000000000001 
>> 0000000000000000 000000000041cff4 0000000000000003
>> >> Jul 03 08:54:51 Fienix kernel: NIP [00000000003f4f58] 0x3f4f58
>> >> Jul 03 08:54:51 Fienix kernel: LR [00000000003f4f2c] 0x3f4f2c
>> >> Jul 03 08:54:51 Fienix kernel: --- interrupt: c00
>> >> Jul 03 08:54:51 Fienix kernel: Instruction dump:
>> >> Jul 03 08:54:51 Fienix kernel: 40c2fff4 4e800020 7c0802a6 fbc1fff0 
>> f8010010 3bc3ff88 fbe1fff8 38a0ffff
>> >> Jul 03 08:54:51 Fienix kernel: f821ff81 7c7f1b78 e9230168 7fc3f378 
>> <80890010> 4bffff51 e87f0208 38631df8
>> >> Jul 03 08:54:51 Fienix kernel: ---[ end trace ddf73d2d70058380 ]---
>> >> Jul 03 08:54:51 Fienix kernel:
>> >> Jul 03 08:54:51 Fienix systemd[1]: lightdm.service: Main process 
>> exited, code=exited, status=1/FAILURE
>> >> Jul 03 08:54:51 Fienix systemd[1]: lightdm.service: Failed with 
>> result 'exit-code'.
>> >> Jul 03 08:54:51 Fienix avahi-daemon[3857]: Registering new address 
>> record for 2a02:8109:89c0:ebfc:d372:f06c:9247:7d54 on enP4096p4s4.*.
>> >> Jul 03 08:54:51 Fienix systemd[1]: lightdm.service: Scheduled 
>> restart job, restart counter is at 1.
>> >> Jul 03 08:54:51 Fienix systemd[1]: Stopped Light Display Manager.
>> >>
>> >> ----
>> >> Systems: A-EON AmigaOne X1000 and X5000 with Radeon HD6970 
>> graphics cards. [2] [3] [4]
>> >>
>> >> The biggest problem is, that I don't have time for bisecting and 
>> fixing this issue.
>> >>
>> >> Cheers,
>> >> Christian
>> >>
>> >> [1] 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Ftorvalds%2Flinux.git%2Fcommit%2F%3Fid%3De058a84bfddc42ba356a2316f2cf1141974625c9&amp;data=04%7C01%7Cnirmoy.das%40amd.com%7C1879913cfa594f104bb508d94093713e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611824271179607%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=G2y8f5f7DV708uZg6VLjyg1T%2F2dHjT8i4TtM2uBUA4U%3D&amp;reserved=0
>> >> [2] 
>> https://nam11.safelinks.protection.outlook.com/?url=http%3A%2F%2Fwiki.amiga.org%2Findex.php%3Ftitle%3DX5000&amp;data=04%7C01%7Cnirmoy.das%40amd.com%7C1879913cfa594f104bb508d94093713e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611824271179607%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=9HTYhxjWHOZ00NeA9MKwB7tv0Dool2wT%2FfrxZ7kcNLs%3D&amp;reserved=0
>> >> [3] 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fen.wikipedia.org%2Fwiki%2FAmigaOne_X1000&amp;data=04%7C01%7Cnirmoy.das%40amd.com%7C1879913cfa594f104bb508d94093713e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611824271179607%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=rKh5xH7kKS1wLz64CIT39d9sBnAXGTMobIZTGbFcC78%3D&amp;reserved=0
>> >> [4] 
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fforum.hyperion-entertainment.com%2Fviewtopic.php%3Ff%3D58%26t%3D4378&amp;data=04%7C01%7Cnirmoy.das%40amd.com%7C1879913cfa594f104bb508d94093713e%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637611824271179607%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Yr1WzsrzEhWC5Z7zUVHcWPn9eesHq9XggMtXFYn7seA%3D&amp;reserved=0
>>
>>
>
