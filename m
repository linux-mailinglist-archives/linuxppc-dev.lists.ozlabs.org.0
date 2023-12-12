Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4921380FA9C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Dec 2023 23:57:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=DfGOXyrX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SqYsw5S2Zz2yk7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Dec 2023 09:57:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256 header.s=selector1 header.b=DfGOXyrX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=amd.com (client-ip=2a01:111:f400:7eaa::608; helo=nam11-dm6-obe.outbound.protection.outlook.com; envelope-from=terry.bowman@amd.com; receiver=lists.ozlabs.org)
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on20608.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaa::608])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SqYXT3SsJz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Dec 2023 09:42:29 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZJ2yXxWv9LubUDu0qPPZUqYw3WId8T8IbvCvYVCgO1KJSAEGCKLowx6v+yG/qJx7DqGPMiVXnKhELUDRB6g0xv2146CrM25w7s5AGzPwHR0/1zzxyL4X3IUsYzq9e7crUFOfWyxnf0R/fx7Ufd91WFJsGQy7dJEmPzj/Brwm8AaxqFM76fDTwTK1CWWGE3RuzfRiQwsMEqgMng6zS8tiZUAtiNbLcpCixloouw+HS3v29A31UOaqAoed5ydWDdNBa7gyrL84xrO4RyJPYC60XHkLtiHXbA72bzQGKzEFK+d9SpeiDqzEy2uPKAtRMoVxM/jj0uUaR5d7styhtqPqOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=epjgL+pqT/e5AhuysABX24/Jxf/QySFJ4/8YyrcHrUY=;
 b=X5BjjS4SF38mba0N+ENEJdmM1J9A+fKQ2unimMM+5A4xgpw8rDEqYL1FZhUcmU99tb8OQbZuexacgU2SUq+ATw690N6K9QTRc3JP1pWhPyXOVceIJ3Q/I92sdQZ1uGQUe2ao/u7v6JZvCvTn752f/z2ZCn+kFEGWXuOG0c4SfjreVzVZXgU1K8U9x8HfHOcfdBmAPEUi6yEfAI6YCg+8KI08s16noSloUmjWvrWyGdW5njHRmWRRKOF305JvWX+/1G0ChODcRbdzIRbpn7QMCW+7yjCItlbMOyX3pjFe3L29mFJM3SL+oggLmIDeogqzBxr/xrtCmtAOb97svGjYvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=epjgL+pqT/e5AhuysABX24/Jxf/QySFJ4/8YyrcHrUY=;
 b=DfGOXyrXyN6sHLgs0NGk6/4JF71m+832OZcRAmWbPJ3hb+pp5M6x5VYoNwCf69IV1rOUvfBWNZUJW4y/Tgp1RUSDtszvWU6IK2WG8uC4Dvg1l+miKwK/OiRI1xY7PrBxRw6tqXhGS3PNN5Q3nksMpQbl27bT1PTzld3BEeWL1U4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DS0PR12MB6390.namprd12.prod.outlook.com (2603:10b6:8:ce::7) by
 SJ2PR12MB7918.namprd12.prod.outlook.com (2603:10b6:a03:4cc::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.26; Tue, 12 Dec
 2023 22:42:10 +0000
Received: from DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::eb9d:982c:4c9d:8522]) by DS0PR12MB6390.namprd12.prod.outlook.com
 ([fe80::eb9d:982c:4c9d:8522%4]) with mapi id 15.20.7091.022; Tue, 12 Dec 2023
 22:42:10 +0000
Content-Type: multipart/alternative;
 boundary="------------jjf8tczdmm0Z3kcMscEsoTDK"
Message-ID: <30b407cb-5c7e-4871-a44d-50c97d325bd6@amd.com>
Date: Tue, 12 Dec 2023 16:42:07 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] PCI/AER: Use 'Correctable' and 'Uncorrectable' spec
 terms for errors
To: Bjorn Helgaas <helgaas@kernel.org>, Terry Bowman <Terry.Bowman@amd.com>
References: <20231212212323.GA1021034@bhelgaas>
Content-Language: en-US
From: "Bowman, Terry" <kibowman@amd.com>
In-Reply-To: <20231212212323.GA1021034@bhelgaas>
X-ClientProxiedBy: SN1PR12CA0100.namprd12.prod.outlook.com
 (2603:10b6:802:21::35) To DS0PR12MB6390.namprd12.prod.outlook.com
 (2603:10b6:8:ce::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6390:EE_|SJ2PR12MB7918:EE_
X-MS-Office365-Filtering-Correlation-Id: ae2432a6-eca8-42c6-999a-08dbfb63937c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RjPUNKDe6UHTuZaHutVoWSK7xDc30P286HEzxvuNqQTTbPlSC6D/INUiJjeTXmRn0LGA0TV7ybRhyTd6crfucco3BE+G525a8+5BNs/CYFk1/JuXYA1cjstoyFGiAJO12AdJB2Gwbl14HcJddiW9J0HZ8brSpcia0m6CZxYhkli6Y20dfYd/6aJ90HRINLgzo3ln2xqetMXp2+7IiDbI1wgk+ZWR843B64Yx1rmGmu/fFQUyNWpPTb6sG+0PwNAkXx8ltw6APScNg1313Nq1n9lzhTF1iqg7YIhgiMZFmEsUM6O7dUemjxilGw7GGcE2Z2MMkreIZfsp118Im4WcqseCgmzfLM7ORXTuxEoCWj1x5LuJL1H1w9SbIiyE8DMX7liOypZQA3VpH8wY3nO+1u+NHppHzAd1Jq+fp4qIvS5MJcdorUXA20ORcFwJ2piTR+5WufLmlHMTbMKD3q+S58vq2IiU7HGUy3W7X9N2aEBjzpfW/tfBYnNbhdOOlcuMeDt6pk5FKMrRApfE9bMvZ6X/swc8ITzX+cYbmt96cpjCvwFnBsNKnYOy6xRoMJfaKV7v9ETkH+bn1zFcc/cM2VnILXxb+e0K9TtS3yFzkRqFVg/NBmoUX6uLm4TQctmkSXDpyMzYkLVVYyDwRbtVIg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6390.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(396003)(136003)(376002)(366004)(39860400002)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(54906003)(66476007)(66556008)(66946007)(110136005)(33964004)(53546011)(41300700001)(6666004)(6506007)(6512007)(2616005)(26005)(36756003)(31696002)(38100700002)(478600001)(6486002)(4326008)(8936002)(8676002)(2906002)(31686004)(5660300002)(6636002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?WWRxMnBwRklNb0RxWlgxckVDNXpuY0NQeHp5NjZ2UXVRTG1GUzlreW8wNjh6?=
 =?utf-8?B?Z0RtQmdkdzg1Y2lPMUJjM1pWWXdEWXlCSXoyTittcHhNVWhOSHcwVG1jR3lw?=
 =?utf-8?B?OEFieUlLdU51UlFsa0xkcUsveHNxZ3B3cTlJSWkreVpFSm5BSVVIL2h6Nk9X?=
 =?utf-8?B?ckJHSTZpcHhra1M5SDk0Mm9qT2JaM241S3AyanNjV3FsYkVWZmt6eUZCT09V?=
 =?utf-8?B?NmJwSlBKNkwwbm9icmt6MktXSlRQS3lvS1FFajM5cHhPV1pCZkJrNEtxMHNT?=
 =?utf-8?B?OW9VNmxXUGwyK0k2eDlub3ZRdnN3Ky9ZN1B6dUpJMTk5dEM4Q205dXdyRlhm?=
 =?utf-8?B?TjJ2ZmVSUkozeHduQXFqendsWGNJK3p5MXo4eUZsZ0xNT0NtV3FtUVloSThB?=
 =?utf-8?B?anRNWDUvbmZaSWhQNVlnbUh6UHFvNW50ZzhjNmpPbFdWK1R6eTY2djNldktv?=
 =?utf-8?B?d0J5ZTFEblVYQmxKOS9DaktRTXE3RW5kamdOKzc3RjRNZllsSjEzUFZRY1NN?=
 =?utf-8?B?bkVHdjlpYm55RklmL1RhQ05yV01MWnVaWXVGYi9wNVZOandOR0NSSWpxMXpz?=
 =?utf-8?B?enU3NzNqaWVscWtEM0Rqalg3ZU1mVm9WcWphd01sTVV3ekpxSjdsRjhZckhh?=
 =?utf-8?B?WmRFRXJrc3NEL21Cb0FabHpCb2YrcHE0aTNOZW05YUdTZnJHekU1V1RPZkcv?=
 =?utf-8?B?QzFjWHFCbW5DU3h1RmhYQ052cWFJbnRUMnFCeW4rNko2K04xUnEyWXQvaklq?=
 =?utf-8?B?Ym1XWDRKVGJ3N3N1V1pmQzBnWndwMWMvYjZUUEZKQ1d6R25xQ0JTVVY1b25y?=
 =?utf-8?B?SCtDYzREZlVsNHVxS1hUTWpidEhjdGs3STVrdktSTmtVZk5xa0hlbnBrcXBK?=
 =?utf-8?B?OWQ3NUpoK0gwSnh2Q1MxaytHVmZtMWRkelo2QzgzSGE3a2R2MlpHSk81MkJq?=
 =?utf-8?B?alhqRDhDUmp2RHJTZWV1WitzMjNWRjJ6TmVPK2VVR1U2ZkRRVjg0TVFYb3c4?=
 =?utf-8?B?dmdqSGJ4QkR2Yy80akw2LzdYZTE5SmtEc2NxNU9YeWhnSEZJNExQRjQ2OHdL?=
 =?utf-8?B?R09JRUdCTVZUdXhHWWdVcUxQWWFjMFNWdDBtZDROSlY0K3hIVGpENStBTGlO?=
 =?utf-8?B?WWduVVE0Um9TSlgxSUlIQjcvM3ppMXBlejBkd09GMGplL1FtT3hMdnlyNVdP?=
 =?utf-8?B?ME9FNG44YXdta0VIRmlET2pGL3l4NHIxc2h5M2M0bnlwT0NGdjg0U2NMVkEv?=
 =?utf-8?B?U3FqSG5yVXNZMGJzT2xESTNqRE1YRFNoQW9BY3U2TXl1MmJSdm5DZTBCYnA4?=
 =?utf-8?B?SXlkM0VZQlZWamxESDRrdVNtMUhiTllSYmdyUFI0NUVVN3AyclZrczRnTWdh?=
 =?utf-8?B?bWlPZkpOd0RTMUI1WGk2ZURZVU1DVHN6RVgxckh0eUljNlBrbm9XYTBOSFFa?=
 =?utf-8?B?bi9yMU56MEZkejN0cFFZS1kxQW1UQ0szSjE3ajkyZ2MwVHZaR1ovNU9zQU9S?=
 =?utf-8?B?OW1xNUZSKzdGY1NzNGNwZFZqY20xT2UxdFVldUZPR3NZUHN2dVF6TmxIeXBi?=
 =?utf-8?B?Y0dGY212ZmF6N2dEaEdGWW1jN2g0ODlLVFNXREUrR2VOUXMwM2F5d0Z5YmdU?=
 =?utf-8?B?cHBNbGZablZhU3FadnNxYlZkQXVpQVdZeU5CZG0rbjAwRmhIQ2pHSVM4QXY1?=
 =?utf-8?B?eTBjc2dKWGdGS0V0cURLWXdXcW1JaXZxVlA0bVZJdTlQdTJNVXdMdGlGU09S?=
 =?utf-8?B?RVgvVWNHOWthdWE5ei9zYXNCUDJzcE9JY2psUkwzMFN5bXpnbGF1QzJjYTE0?=
 =?utf-8?B?a3pzcFpSZ3k0S243d3FkblB4VjhmWEJqVExhT2QwWFlXajJMOUpySC90Y0J5?=
 =?utf-8?B?bTQvMFZFU1hJNVNOQTh5cFZjbk5JYnhZc1RyZHRQVEhPUUlyd0FiYVVNeFVH?=
 =?utf-8?B?WHdaQVJENVQyeFRheGg1c0V5SkdpekRhNndLK1gxV0FHTUxxYUxHNG9LWmx4?=
 =?utf-8?B?cXpNSHRpYnZhanV5a01yNmJtUEZRVzhnOVR4d2NoNnRxaEpDMC9KSlY3cCtl?=
 =?utf-8?B?ZHd4blZCbFN0VXRxZTVGRGtpVlduRlpjODEvK1JmOWNtVGlaS05NeFZZQVpC?=
 =?utf-8?Q?cZUknQ6IHo4i4fAQ8FUozzMGO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae2432a6-eca8-42c6-999a-08dbfb63937c
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6390.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2023 22:42:09.9672
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 02NoODV5dbWNutj8BVixLEGUOtBkH7ULyAdr9nRD+wgehpXu3QEML/TQyE1yYe6kfMv300Y08571QBCquQV2HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7918
X-Mailman-Approved-At: Wed, 13 Dec 2023 09:56:13 +1100
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
Cc: Robert Richter <rrichter@amd.com>, linux-pci@vger.kernel.org, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, linux-kernel@vger.kernel.org, Kai-Heng Feng <kai.heng.feng@canonical.com>, Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--------------jjf8tczdmm0Z3kcMscEsoTDK
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

No problem. You can add my "Reviewed-by". Thanks.

Regards,
Terry
On 12/12/2023 3:23 PM, Bjorn Helgaas wrote:
> On Tue, Dec 12, 2023 at 09:00:24AM -0600, Terry Bowman wrote:
>> Hi Bjorn,
>>
>> Will help prevent confusion. LGTM.
> Thanks a lot for taking a look at these!  I'd like to give you credit
> in the log, e.g., "Reviewed-by: Terry Bowman<Terry.Bowman@amd.com>",
> but I'm OCD enough that I don't want to translate "LGTM" into that all
> by myself.
>
> If you want that credit (and, I guess, the privilege of being cc'd
> when we find that these patches break something :)), just reply again
> with that actual "Reviewed-by:" text in it.
>
> Bjorn
--------------jjf8tczdmm0Z3kcMscEsoTDK
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>No problem. You can add my &quot;Reviewed-by&quot;. Thanks.</p>
    Regards,<br>
    Terry<span style="white-space: pre-wrap">
</span><br>
    <div class="moz-cite-prefix">On 12/12/2023 3:23 PM, Bjorn Helgaas
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20231212212323.GA1021034@bhelgaas">
      <pre class="moz-quote-pre" wrap="">On Tue, Dec 12, 2023 at 09:00:24AM -0600, Terry Bowman wrote:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Hi Bjorn,

Will help prevent confusion. LGTM. 
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Thanks a lot for taking a look at these!  I'd like to give you credit
in the log, e.g., &quot;Reviewed-by: Terry Bowman <a class="moz-txt-link-rfc2396E" href="mailto:Terry.Bowman@amd.com">&lt;Terry.Bowman@amd.com&gt;</a>&quot;,
but I'm OCD enough that I don't want to translate &quot;LGTM&quot; into that all
by myself.

If you want that credit (and, I guess, the privilege of being cc'd
when we find that these patches break something :)), just reply again
with that actual &quot;Reviewed-by:&quot; text in it.

Bjorn
</pre>
    </blockquote>
  </body>
</html>

--------------jjf8tczdmm0Z3kcMscEsoTDK--
