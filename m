Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 65AFB16FB2B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 10:45:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48S9rd1MC3zDqdb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 20:45:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Void lookup limit
 of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:7d00::61e;
 helo=eur05-vi1-obe.outbound.protection.outlook.com;
 envelope-from=laurentiu.tudor@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=pnPvW5Hc; 
 dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7d00::61e])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48S9pd21RmzDqXB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 20:43:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVNOAkHehlU/mnS3AAmRWG2ZCz/wOSwXzvT2pkdjRFOOkrzRuGzPRArxFo1o6hVBjFFo+GmDLgEZq7UlEzhAY0AeU4WzTluFMKRn+kzh78Jwdil2mxgECNHcXBczs5c5MpFdSTPA5MUnXurZXmn14FMt+lvjh3+depEaeJJbAtFHdBMRDuojneUSYpJr+URLSKq6k3q/OOCqNdcNIlW2WlvraH+VXLSTMaGTEYInlCQ3trKoc0haBaOv2Y8PexvpjsCjiqVLzPQCy4mC4nVWiJsZaxx+XuSVzzi12t2npgBL476JELlSrFZghHuiddPGUNfUNYTMptbm4I4WCutDWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxNtk8Y9Gbjp2AqPaBfn3gYQ1+qoBn/MVIBeZiZIrAk=;
 b=JVb534J97gfLz+a6DqhKJDCnmRvXUrO+1FdG3Lzt6oi/9O/jyzlpf0ko6TwfJxSSuLfURY4Ph4KD2eaVTzNHzH6yDKYRHFakUJ0o8aWxJ+A2i1XhRgB5Tj2epFbtNqXEZXm4Gf9tp38ZGcj/ozFhAH0JxOEN/u2v3gJO3puBjrLbLmPHktQTaIgZC3gK064sQHVww4v99lhY12JRX21bjSiDA8k5xevg6yU6L9ub2WpRNyxWR0UsABuhSENePnLUWCAy/+ccthvkqv4IEUFHtpfB85NgDd0K7+SUqHUS6T/LRrch1ufn+QJfL27ajYXFZ2YnkrYsBxZN+15uoUV6mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FxNtk8Y9Gbjp2AqPaBfn3gYQ1+qoBn/MVIBeZiZIrAk=;
 b=pnPvW5Hc/3q8sKNC6Y6yFmFe5Lj70sv/BIYEEQmLqxBQc4j99+sZqPALy5JLGD+Xi9z0T9oArtruxOVphAsrY/9ssk3QQAVzBpqLbA2h4cGk09vo4zudPyRSoiAQTskzo128zHKHdwOjcGzehSwfmDwEyXdjYrAO9zlNprUQb2U=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.tudor@nxp.com; 
Received: from AM6PR04MB5878.eurprd04.prod.outlook.com (20.179.0.89) by
 AM6PR04MB6664.eurprd04.prod.outlook.com (20.179.246.82) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2729.24; Wed, 26 Feb 2020 09:43:14 +0000
Received: from AM6PR04MB5878.eurprd04.prod.outlook.com
 ([fe80::bcef:1c59:7d27:d0e]) by AM6PR04MB5878.eurprd04.prod.outlook.com
 ([fe80::bcef:1c59:7d27:d0e%6]) with mapi id 15.20.2750.021; Wed, 26 Feb 2020
 09:43:14 +0000
Subject: Re: [PATCH] evh_bytechan: fix out of bounds accesses
To: Stephen Rothwell <sfr@canb.auug.org.au>
References: <20200109183912.5fcb52aa@canb.auug.org.au>
 <CAOZdJXXiKgz=hOoiaTrxgbnwzyvp1Zfn3aCz+0__i17vyFngRg@mail.gmail.com>
 <20200114072522.3cd57195@canb.auug.org.au>
 <6ec4bc30-0526-672c-4261-3ad2cf69dd94@kernel.org>
 <20200114173141.29564b25@canb.auug.org.au>
 <1d8f8ee6-65ac-de6c-0e0b-c9bb499c0e02@kernel.org>
 <20200116064234.7a139623@canb.auug.org.au>
 <9f3311d12d418b87832ba5de1372bb76ffccbd45.camel@redhat.com>
 <20200116113714.06208a73@canb.auug.org.au>
 <20200221105715.35c1d2e8@canb.auug.org.au>
 <37b145e2-a953-c0e6-f0fa-7ef420edfd16@nxp.com>
 <20200226075605.4b9f6613@canb.auug.org.au>
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <82e93a67-be96-8970-7001-e6c996b52df7@nxp.com>
Date: Wed, 26 Feb 2020 11:43:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200226075605.4b9f6613@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0445.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::25) To AM6PR04MB5878.eurprd04.prod.outlook.com
 (2603:10a6:20b:a2::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.171.82.13] (89.37.124.34) by
 LO2P265CA0445.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:e::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2772.14 via Frontend Transport; Wed, 26 Feb 2020 09:43:13 +0000
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 2024102b-2f96-4d92-873f-08d7baa04c9e
X-MS-TrafficTypeDiagnostic: AM6PR04MB6664:|AM6PR04MB6664:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB66648A7EA85E074E6C84740CECEA0@AM6PR04MB6664.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0325F6C77B
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(376002)(346002)(396003)(39860400002)(199004)(189003)(6486002)(8676002)(5660300002)(66476007)(66946007)(54906003)(316002)(16576012)(36756003)(66556008)(8936002)(31686004)(81166006)(81156014)(44832011)(31696002)(2906002)(966005)(478600001)(186003)(16526019)(26005)(86362001)(956004)(6916009)(4326008)(2616005)(53546011)(52116002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB6664;
 H:AM6PR04MB5878.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M/xHOxxIj/wPMCBjW86eGilSNx7XgdjDrSg9IMXzSqHEPE7pLs0bBv1It+zsabs3e0DKvW/J55KL08UFQmL1zBDFbx95lD+HF/FEQpTFEITZUwzkN34hIxZR7R0mXWVY+sJxRLE4tZnB1QmhNLmey1f4gB4SeZcDkQhQf0SrhkzBah9T2CHIqo0HttR40G+KJdeIuhJjvu5XNVsLJvz6lU+z9rZrvK5ULhk5az55mdgDob8WgQA/3HtQEN9FueYvF8jYPyPubJvUN9mHytqAr5sVP0h5WmZEBtHtyLn3m2/tsg1y3toOJPg5Dbp1CcOcQRbza4s6RYoVYBNkuXxs4DXJ7TiErH/2MKYagC4sJ6v0CO7j6bFPg1IxbTib3JeAG6FY8sFu6eZm57T6vzkK6I8GVaiAqbQbf8H6pkwBeZ1cxiKIeyvUzjJkBZEiRIkx61jO+Lat7HraqAe1Ahqs4nS5/aZT1fZtVgbEtsy5bxEA3MFNKeFAqSzHFYSV7H3ZptYDlU73Jpu4Rq7Lpzvewg==
X-MS-Exchange-AntiSpam-MessageData: dF1ENsX81ytZcfbKEmGadVnvh11hqMoohsc7p++amYeqNPt/0lT2n0iShaFf9Z09VeXR+0VclqyvrN0cv4Anlfb4IeZsCtjpq2WaRFY0Y7iAEQhujNuVksdNSXbtaYxtUMG+Ppg4TXYv/Uc4DtOHrw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2024102b-2f96-4d92-873f-08d7baa04c9e
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2020 09:43:14.0924 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zs9oY0iZjW+9bTBhQeLNQSDpDvJcJ0fnuiNF2eXklrtQR0oc3guviHWScrSERVZC0oNDqWBti449OOQ1JC3HnA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6664
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
Cc: Timur Tabi <timur@kernel.org>, b08248@gmail.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jslaby@suse.com>,
 york sun <york.sun@nxp.com>,
 PowerPC Mailing List <linuxppc-dev@lists.ozlabs.org>,
 Scott Wood <swood@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 25.02.2020 22:56, Stephen Rothwell wrote:
> Hi Laurentiu,
> 
> On Tue, 25 Feb 2020 11:54:17 +0200 Laurentiu Tudor <laurentiu.tudor@nxp.com> wrote:
>>
>> On 21.02.2020 01:57, Stephen Rothwell wrote:
>>>
>>> On Thu, 16 Jan 2020 11:37:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>
>>>> On Wed, 15 Jan 2020 14:01:35 -0600 Scott Wood <swood@redhat.com> wrote:
>>>>>
>>>>> On Thu, 2020-01-16 at 06:42 +1100, Stephen Rothwell wrote:
>>>>>>
>>>>>> On Wed, 15 Jan 2020 07:25:45 -0600 Timur Tabi <timur@kernel.org> wrote:
>>>>>>> On 1/14/20 12:31 AM, Stephen Rothwell wrote:
>>>>>>>> +/**
>>>>>>>> + * ev_byte_channel_send - send characters to a byte stream
>>>>>>>> + * @handle: byte stream handle
>>>>>>>> + * @count: (input) num of chars to send, (output) num chars sent
>>>>>>>> + * @bp: pointer to chars to send
>>>>>>>> + *
>>>>>>>> + * Returns 0 for success, or an error code.
>>>>>>>> + */
>>>>>>>> +static unsigned int ev_byte_channel_send(unsigned int handle,
>>>>>>>> +	unsigned int *count, const char *bp)
>>>>>>>
>>>>>>> Well, now you've moved this into the .c file and it is no longer
>>>>>>> available to other callers.  Anything wrong with keeping it in the .h
>>>>>>> file?
>>>>>>
>>>>>> There are currently no other callers - are there likely to be in the
>>>>>> future?  Even if there are, is it time critical enough that it needs to
>>>>>> be inlined everywhere?
>>>>>
>>>>> It's not performance critical and there aren't likely to be other users --
>>>>> just a matter of what's cleaner.  FWIW I'd rather see the original patch,
>>>>> that keeps the raw asm hcall stuff as simple wrappers in one place.
>>>>
>>>> And I don't mind either way :-)
>>>>
>>>> I just want to get rid of the warnings.
>>>
>>> Any progress with this?
>>
>> I think that the consensus was to pick up the original patch that is,
>> this one: https://patchwork.ozlabs.org/patch/1220186/
>>
>> I've tested it too, so please feel free to add a:
>>
>> Tested-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> 
> So, whose tree should his go via?
> 

Maybe Scott or Michael can help us here. And while at it maybe, take a 
look at this patch [1] too.

[1] https://patchwork.ozlabs.org/patch/1227780/

---
Best Regards, Laurentiu
