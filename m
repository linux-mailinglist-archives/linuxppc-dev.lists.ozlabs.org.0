Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C8E16BE07
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 10:56:38 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RZ8M5jpFzDqXR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 20:56:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=40.107.7.57; helo=eur04-he1-obe.outbound.protection.outlook.com;
 envelope-from=laurentiu.tudor@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256
 header.s=selector2 header.b=gor9g9M4; 
 dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70057.outbound.protection.outlook.com [40.107.7.57])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RZ5y4f28zDqT7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 20:54:26 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BUmlltAnoSOnqgm/hUp8PdJiUBXw4bx2DfY9eP1kBifH1qsFlzv3cvCRFSlNqN0qsz2IPbj1L+LUt7m6JUSh+OegJZv4UsPyvddGJ8/Pyy0kBAHfMVYHu1qCkn4CVbTcrk/G8+CX7glRpaTQLfA9J3ciPrPD1/liZA3mDpUz7uAIWhbVhHDEQo/ubL5scCV94kDNugD/PXIJ+yf8i4hLIuAZ3+vXm5Y8FwiDWHhFZHRDkSPLyaSH7hDpOMeK23TBqgipWodPoY73oWEV3yALg8/5WP8jNvuXNB9wQXCH6Q4zpOUlY1o9k3SQBsqsPQ2FDCm+GoXrjJcNkq8sdw7rcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmNhZD8I9sIG3J4KhnVe7PS6DurKJNJDQfVJpzVdx5Q=;
 b=TaVGLzowwf7kaQJeaZF0212XB33wt4WJo1kewiE2VGBCXuJvLTZnJaM5/FEmVKZzA7IuhM17yHaSfNYiFUiDstRs44dfSkYQFlX4Qlvd8KK7zGxIN5T2GGeG+3kBjuPIoQNEm4/GnKGtYOATY12r5NP5IL/hr7HNIuFX/rHfESc5x9lindDhimMgBTkbZKtVLP9wI8XMMTyclMF6bW/plSP3CkIq/zLvZi/rIWZ9X4+qztJBsna4QM9Ka+rb8rZhYvttH8O+e/s5Q+VD9S5YwnMH2IRNI+uYHLrRUA9bs+pmAMf0Q699iOLX1U7M+24MBF/qyrBvtxanLPsukH9itA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SmNhZD8I9sIG3J4KhnVe7PS6DurKJNJDQfVJpzVdx5Q=;
 b=gor9g9M4BXHggRXkL3MmPoMlhzFW1fJLMUAhwxbzFWupZEwi+LQ6i5JGK8xXl6sOGMFY5n3xNcgf8BHj+XLxLe4BAPF0P7v8cvuDSkua1gjU34ApFZq5G0HJaLAViHeyaDSjNoJRDgeE4reh3msuy7jY92xt61jKDk57JfvhGAQ=
Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=laurentiu.tudor@nxp.com; 
Received: from AM6PR04MB5878.eurprd04.prod.outlook.com (20.179.0.89) by
 AM6PR04MB6071.eurprd04.prod.outlook.com (20.179.5.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.21; Tue, 25 Feb 2020 09:54:20 +0000
Received: from AM6PR04MB5878.eurprd04.prod.outlook.com
 ([fe80::bcef:1c59:7d27:d0e]) by AM6PR04MB5878.eurprd04.prod.outlook.com
 ([fe80::bcef:1c59:7d27:d0e%6]) with mapi id 15.20.2750.021; Tue, 25 Feb 2020
 09:54:20 +0000
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
From: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Message-ID: <37b145e2-a953-c0e6-f0fa-7ef420edfd16@nxp.com>
Date: Tue, 25 Feb 2020 11:54:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
In-Reply-To: <20200221105715.35c1d2e8@canb.auug.org.au>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0161.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:9::29) To AM6PR04MB5878.eurprd04.prod.outlook.com
 (2603:10a6:20b:a2::25)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.171.82.13] (89.37.124.34) by
 LO2P265CA0161.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:9::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2750.18 via Frontend Transport; Tue, 25 Feb 2020 09:54:19 +0000
X-Originating-IP: [89.37.124.34]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 26d171ce-36ba-48bf-0d7b-08d7b9d8af8d
X-MS-TrafficTypeDiagnostic: AM6PR04MB6071:|AM6PR04MB6071:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB60719A3286D92FD545749CA4ECED0@AM6PR04MB6071.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-Forefront-PRVS: 0324C2C0E2
X-Forefront-Antispam-Report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(376002)(366004)(396003)(346002)(136003)(199004)(189003)(6486002)(478600001)(186003)(31686004)(2906002)(36756003)(66556008)(5660300002)(66476007)(66946007)(86362001)(966005)(16526019)(4326008)(26005)(2616005)(956004)(54906003)(53546011)(6916009)(316002)(52116002)(16576012)(31696002)(8676002)(81156014)(8936002)(81166006)(44832011);
 DIR:OUT; SFP:1101; SCL:1; SRVR:AM6PR04MB6071;
 H:AM6PR04MB5878.eurprd04.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
Received-SPF: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0LaEBSQpXCn7QVuf2p4AO0zdX46ZNSBLv8tPmMiRaez1Hox4gw/wffNF4PVu66bo9Qm7Uc6F14o1w7VLQfj19kA66UmNiYjlCFdNGVDR9kmfpoLEobdLviMUCWZbT4vNyKvHG8qLlkHR5qX2Wib3RIIv7/bs1Ud2qB+lpHvOJywRXhCwp1HZcOCBcqJKRaSEtqPrJR+dIMMs3brX0+KuC1BWLNe76ySEm/UHz90BIrbEzYyv+wnOFtQulGeQr9PHWYisFgAPOF80WrIeWFp+z3w+jdJxBw41ADgdK3vPC/RwpmN1kXWmzcnIhsqFY5SjgVerzFFVZ77d/bIefEnIM8XFphRJPt0N7ot0BwJtZZfGyeKxIaPzH6apJ32TgjPiIktAPbK4/j27DJ6IuiDqwShZOXazX9I+IsA7zsojA5ARGvAqHD3VJc7yojWSl1An4P8z36w/s7oXnUynKa928tsDTHVqHg9m6iL5lGdttrfgs1AFiA+htzbSKzRf0UaWK+3E205VYtOzNZpvyNwV1w==
X-MS-Exchange-AntiSpam-MessageData: 5PVLHbnfbxsDjDcifVQ6wDGyvh34EtB6sYo7s91OTArbtKp8H/6h4qch+OBSkXTQQfUiwrBe6uO8vwj2STvmCj7cdsbdXabGnU6aZ3LP0/V812eiZ8DY2NenoN2zarLCk9Zt+R0F4xNICFxn4M8sdw==
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26d171ce-36ba-48bf-0d7b-08d7b9d8af8d
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2020 09:54:20.7704 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: avcqwRsfZ3pqbxk0g6FQ5nnCbL1SnC1itux4Qcw0lvvOYxnTrV4ZDZ73UqD6jPVwgE6Ogq0kiD3bNP2R/ELy7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6071
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



On 21.02.2020 01:57, Stephen Rothwell wrote:
> Hi all,
> 
> On Thu, 16 Jan 2020 11:37:14 +1100 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>
>> On Wed, 15 Jan 2020 14:01:35 -0600 Scott Wood <swood@redhat.com> wrote:
>>>
>>> On Thu, 2020-01-16 at 06:42 +1100, Stephen Rothwell wrote:
>>>> Hi Timur,
>>>>
>>>> On Wed, 15 Jan 2020 07:25:45 -0600 Timur Tabi <timur@kernel.org> wrote:
>>>>> On 1/14/20 12:31 AM, Stephen Rothwell wrote:
>>>>>> +/**
>>>>>> + * ev_byte_channel_send - send characters to a byte stream
>>>>>> + * @handle: byte stream handle
>>>>>> + * @count: (input) num of chars to send, (output) num chars sent
>>>>>> + * @bp: pointer to chars to send
>>>>>> + *
>>>>>> + * Returns 0 for success, or an error code.
>>>>>> + */
>>>>>> +static unsigned int ev_byte_channel_send(unsigned int handle,
>>>>>> +	unsigned int *count, const char *bp)
>>>>>
>>>>> Well, now you've moved this into the .c file and it is no longer
>>>>> available to other callers.  Anything wrong with keeping it in the .h
>>>>> file?
>>>>
>>>> There are currently no other callers - are there likely to be in the
>>>> future?  Even if there are, is it time critical enough that it needs to
>>>> be inlined everywhere?
>>>
>>> It's not performance critical and there aren't likely to be other users --
>>> just a matter of what's cleaner.  FWIW I'd rather see the original patch,
>>> that keeps the raw asm hcall stuff as simple wrappers in one place.
>>
>> And I don't mind either way :-)
>>
>> I just want to get rid of the warnings.
> 
> Any progress with this?
> 

I think that the consensus was to pick up the original patch that is, 
this one: https://patchwork.ozlabs.org/patch/1220186/

I've tested it too, so please feel free to add a:

Tested-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>

---
Best Regards, Laurentiu
