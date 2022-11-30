Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2FD63D299
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:56:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZNw2913z3fWn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:56:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=selector1 header.b=Uhyq2ix1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2a01:111:f400:fe13::612; helo=eur02-am0-obe.outbound.protection.outlook.com; envelope-from=jbeulich@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=selector1 header.b=Uhyq2ix1;
	dkim-atps=neutral
Received: from EUR02-AM0-obe.outbound.protection.outlook.com (mail-am0eur02on20612.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe13::612])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYvt0JFRz3fBD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:35:04 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QEBAIyzbkqJUNUb/Yh1urlHZcevN+g0usnzuRZ+YU1pKFoDfIR+uFGCsSblw9mmqhiZmTvlZd9jLFf/bSI8FiSfVwIp8MIvxpyF5qLwcfRWkRiN8Z1pxQNDMJtYL2FVCWLo+4xbsPkcxpLVL2JF5H28jFZALi8v+U6PYY6co7S7eiLyS78nwVM/rSpz7XKeuBXaz5+NxqTEYImVSJPIw7D+B0299uioDVqOufIABXmgvxqhqmudro0N+fui2jWKBjcSx6AWkFvUTatnWy/AZO/MRLCpATPJR1GLy7Relomzxd3D9RMKih2f7bjTD64PLZsVXe5VprRePfW9Fh+pddQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P7OasLtRjEnTQ4HsfFqZktftoC39064067NPmSIxSYY=;
 b=F+efMSguwg6LtYDyeX0LPNpHwzbluiWaTYRJuaxrLpGDB1KRTpNJKBtyVTX89EcZBby+uG7E40FHmD2tbnO9rHWL3HUHMLmXCcCR0Z2LV7VJn5zPqsoS/TFJRNhbI9lEMKYc5ndeBkFADfc8Sa3IwXZpqB9iprNzVqTz2vhPyx3DxTKu+mYGFBZsXTB8TItYwEXKzUiEjJAwaXua58nMWovSRGRLvEdkrUZFXOobGCYZeT8vGh31PDEbVjX54+zXcLCC/JKG4TXFGWbxqVjS5TsRFIszgGh4CGkzBQkLnxMU7ZmV9lpw4dhyon4C9fxVy2ptVjaOb4UEQGziTRy9wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=suse.com; dmarc=pass action=none header.from=suse.com;
 dkim=pass header.d=suse.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P7OasLtRjEnTQ4HsfFqZktftoC39064067NPmSIxSYY=;
 b=Uhyq2ix1uznqp9c3leUJoJAYS0vF3rjm4+W2RTe0LrZl08Is/FooWE/+B95GhLlmadXwoLi8a5NjzfXP1Mfmx7tT2qy9nXpefcTjUs6kE0OzD4t5Cqn6SCkwTGLTzELaGTlq5VgZQ+pEbQCb04mMvQlhD5p43b1syRKBM+kus/aWO2DDv0xF9EOVBHohSguXN5aEXw9TCgjagkqt0Z2OMgU2t/kRHnGWFr/GonmHe7g4gtl91SPRGK6nHgMwJ4kFtWWy0H2B0g/Nw3Yzra9c5YSv27ZBmR8sq6rdBPYzAW/q7ZJdQGJINyVU1jq/fCtfmWXQQgXHMKM4d0nV4mHOIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=suse.com;
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com (2603:10a6:803:122::25)
 by DU2PR04MB8535.eurprd04.prod.outlook.com (2603:10a6:10:2d6::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.19; Wed, 30 Nov
 2022 09:34:43 +0000
Received: from VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8]) by VE1PR04MB6560.eurprd04.prod.outlook.com
 ([fe80::4da2:ea8b:e71e:b8d8%4]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 09:34:43 +0000
Message-ID: <8d8f8c11-6ca5-5770-989c-704f76436cc4@suse.com>
Date: Wed, 30 Nov 2022 10:34:41 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] hvc/xen: prevent concurrent accesses to the shared ring
Content-Language: en-US
To: =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
References: <20221129120107.2942-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2211291351160.4039@ubuntu-linux-20-04-desktop>
 <Y4chryL2YvfhgQmk@Air-de-Roger>
From: Jan Beulich <jbeulich@suse.com>
In-Reply-To: <Y4chryL2YvfhgQmk@Air-de-Roger>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0121.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::8) To VE1PR04MB6560.eurprd04.prod.outlook.com
 (2603:10a6:803:122::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1PR04MB6560:EE_|DU2PR04MB8535:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c3cc18-2753-4f49-67d2-08dad2b61c9c
X-LD-Processed: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba,ExtFwd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	H3JLn9U9+sNh3gFuknwzvx2PhlFNSPTBCeu05NyMAPvLjax1hsbevh9KZQu8VFG8EqzgZti0wXNGJLEcjrDESdWvQnXT+Z0ZNmqFbsM/1XaA1gRXEjjcyA5aijMgHJxgZ3gkEonJjnR2MEpR9e+3AToAd2c0W8A/z92nEEusCwcBchikYdimJF7YnoPUmwOA86MPCm0/yNIZuMFSk26cOupOCQIYrbJ17syTBzcI9C/sCbGbzmZwskn3alD4qeomq6ybfi6qv5InheyOpy0v7lMqp9c0cVSmGrYXpRyCV9+uL0JiEoTd4OEgcabTAK2lkRH0oJVmh9yeKU6VD5kBaq7mh1GY23NzcNAifo5j4pvwAU/GeHVHMXVLa1ezNHHbWwGqrkG8Igd4gc926pIQVYtDEWDNAxUenB263goVXKH7jPyF6Xq7Gcz36yHYGHA79kDQf12k1esQtEq8/UC55atK0efCCmQix499c0qY4LPJGemMOWvQUg7hbDChN17voaDG4qAKL/pKSHusIznmddrIQmrC0Ly1cW74UkrLw2Kozoj6RqXT/6XX4YamLaFiJIiF+Fc6jgxGa4VgQRgSOPKO8aSW64A8VGJ3ahh03JQA+MKME+UGMsg3vZ1rRz+PY2946mfLfy1JyvEHTE6P8VopjfX6Fd+xVTAu9K4OgXcPo4YZy01lOXUt1pZzcQBiZF1YDho7glZtqidb26xRMzVtoB897pIH7zD98YViYAo=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VE1PR04MB6560.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(39860400002)(346002)(376002)(136003)(451199015)(31696002)(6512007)(26005)(316002)(6506007)(54906003)(8936002)(86362001)(66946007)(2616005)(36756003)(5660300002)(8676002)(6916009)(7416002)(4326008)(66556008)(66476007)(41300700001)(38100700002)(53546011)(6486002)(478600001)(186003)(31686004)(2906002)(83380400001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?UEtqby9vZDZSK3hCQ3RSendydkZLcGdPUDVOZk1lbUNVc09Na1hMOXB3TjJS?=
 =?utf-8?B?YmYyL2pMN1ZtYkFsdkwxVG1ERDFFa1pLVFQrWERrMmVFQ3QrMFBYaEpCcFM4?=
 =?utf-8?B?cjlXNVRudmg4YW9YTXk1WDRpdmgwZ3pCSUZBQ2g0NkZkcnBPWFVmbStaMWRt?=
 =?utf-8?B?U05mK2RHc216V0ZjZlJsaGkvL2NXSjRzVHE4NG9vZURwemtITGRUa2t4UmdX?=
 =?utf-8?B?OGQzRXJLVHRKWk9zRmNCdkZ0bkw0M0E0S3JSRnkwSk54OHo3bEs5Z3lBZnlz?=
 =?utf-8?B?ZjByNkEwbmN0WWRhT2RBUUNGejZDaWdVU3IwQUczZUhsZUtIdFRocWdiUUN1?=
 =?utf-8?B?dGk2eUI3MWx6c0FmandVblY1Q0ZieXA0S25JejdGamRVS2czVk9Ud1NFaEJi?=
 =?utf-8?B?YVl5c1U2TCtOakVEZW4yNVM3bmdpQVlpV1Z6QnBNRUFsRmFyOEJnOUZVYTQ1?=
 =?utf-8?B?T0FLRngydzlKUlJkVGlQcFpnV2JMQURJVUhBWnNOWWM1ekNEaU1vckFwTkVF?=
 =?utf-8?B?SmU3SHdEaU1vL1NWUG83Ykc3WHYxYWtXVDJLU0c5SkJGdWFKL3FZcmZGNG01?=
 =?utf-8?B?UkZzaWRqR1dERW5yZWhDUk10M3hFVk44T2tEWENtZmRQa29qZ1l1alI4cUlw?=
 =?utf-8?B?aWxaMFNCYUNDam1WaVh5bFhJK1JwYzZMQ1ZRcHptalQ5cmRLeEEvYXVxbTJ4?=
 =?utf-8?B?ZGVRRnNvemE4SEFXZ1ZMUzRvakxiTWtMWE1GY29yK1VJKzQ5RklNUytKdWRF?=
 =?utf-8?B?R2RVMHY4WWc4R3plQ1NnYXBOT0YyWW9KN2lUT2FESXRJOWE5cWxOTlNpUGts?=
 =?utf-8?B?TW9TQythcDVsZGE3b05qU0pxY0k0YzRoNCt6VkRTZTYrSUE2NmhYSEV3SW1W?=
 =?utf-8?B?cGt3K2F3L3N0UUlzbE82R2Z4ZzBiWXdueHZyMllITTkyeW91SkFnbTFETE1U?=
 =?utf-8?B?b0ZjL2NBY1diV1RMTi9xUDYzdCtHVmVmNWlRRmppZDlJbERtbzdrMXFPNzVR?=
 =?utf-8?B?eUFGWHZMVi8rRUF5S0xYbzZ0djEzUjhTbVhvZ1IwRzAySGpBeXhiMVgyd0hq?=
 =?utf-8?B?bjhqZVEvR2lYMGE1aXV6akVNNW9CWGN1WUViTVFrRGtpOE9odlZ5MWtwTko2?=
 =?utf-8?B?dktqWVk5QURPQkkvdlJoMGpmU1lZSy9kdzgwMHpBZTdyQ1ovbFpYNm1zMWpo?=
 =?utf-8?B?cDZOZzZvdmFaWlBGVHUxbHRIRGNZUktVdmh3b1lCeFBIMnFTZ1BtY3pXaWd6?=
 =?utf-8?B?QTFZb2xZM054NHpmYTdpanNCZXNVakhSYmllaUhTQ1V2STkvcTFvYjN5dnNX?=
 =?utf-8?B?SjZhQmRSR29Tb2VRVXM5UVA4VFIxeU9SYXkrWEVpell3em9DeUpSVDd1QURL?=
 =?utf-8?B?dnJxZDBuVWwvcWYxaGxZMm1WOWplM1Jjd2NnQW0zdlp1cE5CcnhIVTV3RG85?=
 =?utf-8?B?M25VQVRzWnNqeGQvNnhpVmNwanBXejF2SThXUGJsaTU1QUVFMy9xdmt1UHFz?=
 =?utf-8?B?WlpwT1Z1RVdPd0kyNURCaGVHR1EyVy8yUHVWanZvQ1pwdFNWUlJCK2NtVlVr?=
 =?utf-8?B?U3g5M1dyczdrWFliTi9NUlFRRnUrVmpZUEdsTldQaXVTcmg1azM5WlBYd0J3?=
 =?utf-8?B?VTZCem93My9xMGthMTBjeTJtN1FBanNtVUZrN1ArMzFaanRaeGp0ejJhL2NV?=
 =?utf-8?B?VDc5T0wwMVd6aGxBN2NyanlkbFdNcmtKTFBuQTFIaER4dUFodTROQ0pQUGEy?=
 =?utf-8?B?SzlId1IyTjVMZ21sdmhxblcreU1Xbjd5MUtJNU02UWtObURUaU85d3JLNjVE?=
 =?utf-8?B?S3pHeGZFUENPeTN5Wm1MSDBIRDJWYVVNWjl2LzV0WFQ1T0NibU4wV01zYTdF?=
 =?utf-8?B?dVFIMkprU3FJa2VEeHptUWl6bTYrN3Y1ZU1TbmpCb1haS3g3RDJDTXBLbFZw?=
 =?utf-8?B?bmVLK2FyckxxbmZqUnNXTzNxVFh3NFprcHpZZHJBbk9vdklGK3F5N0I5ZDVG?=
 =?utf-8?B?OC9XeEFrOEZWamV3dHdKeFp3bGF2SVYxSGlWaEhYYmZHY0JTYitFTE5EZmRp?=
 =?utf-8?B?ZXRnVjdGdWc1KzRSanBBK1E1QlJwY3hFN0ZPMnRwdTJta3dRZHNzQTcvRmtF?=
 =?utf-8?Q?z/IdkW6c5+RN5ZytWV4IF+HjQ?=
X-OriginatorOrg: suse.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c3cc18-2753-4f49-67d2-08dad2b61c9c
X-MS-Exchange-CrossTenant-AuthSource: VE1PR04MB6560.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:34:43.3801
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f7a17af6-1c5c-4a36-aa8b-f5be247aa4ba
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4LVrTgK2wnni4jBSNaCsK7u25Wt84dlMzymOvuL1FRnZyBfDknM05VZqulWqpqZu/MSgmweHQ7HePkM0XxZ37A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8535
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Chris Wright <chrisw@sous-sol.org>, Olof Johansson <olof@lixom.net>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@elte.hu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30.11.2022 10:26, Roger Pau Monné wrote:
> On Tue, Nov 29, 2022 at 02:12:10PM -0800, Stefano Stabellini wrote:
>> On Tue, 29 Nov 2022, Roger Pau Monne wrote:
>>> The hvc machinery registers both a console and a tty device based on
>>> the hv ops provided by the specific implementation.  Those two
>>> interfaces however have different locks, and there's no single locks
>>> that's shared between the tty and the console implementations, hence
>>> the driver needs to protect itself against concurrent accesses.
>>> Otherwise concurrent calls using the split interfaces are likely to
>>> corrupt the ring indexes, leaving the console unusable.
>>>
>>> Introduce a lock to xencons_info to serialize accesses to the shared
>>> ring.  This is only required when using the shared memory console,
>>> concurrent accesses to the hypercall based console implementation are
>>> not an issue.
>>>
>>> Note the conditional logic in domU_read_console() is slightly modified
>>> so the notify_daemon() call can be done outside of the locked region:
>>> it's an hypercall and there's no need for it to be done with the lock
>>> held.
>>>
>>> Fixes: b536b4b96230 ('xen: use the hvc console infrastructure for Xen console')
>>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
>>> ---
>>> While the write handler (domU_write_console()) is used by both the
>>> console and the tty ops, that's not the case for the read side
>>> (domU_read_console()).  It's not obvious to me whether we could get
>>> concurrent poll calls from the poll_get_char tty hook, hence stay on
>>> the safe side also serialize read accesses in domU_read_console().
>>
>> I think domU_read_console doesn't need it. struct hv_ops and struct
>> console are both already locked although independently locked.
>>
>> I think we shouldn't add an unrequired lock there.
> 
> Not all accesses are done using the tty lock.  There's a path using
> tty_find_polling_driver() in kgdboc.c that directly calls into the
> ->poll_get_char() hook without any locks apparently taken.

Simply by the name of the file I'm inclined to say that debugger code
not respecting locks may be kind of intentional (but would then need
to be accompanied by certain other precautions there).

Jan
