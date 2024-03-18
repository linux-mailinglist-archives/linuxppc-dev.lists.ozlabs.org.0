Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A1687EB5D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Mar 2024 15:47:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=CnI7UZxt;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=CnI7UZxt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TyyP15Xz9z3vXM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 01:47:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=CnI7UZxt;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=CnI7UZxt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f403:260f::600; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=luis.machado@arm.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:260f::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TyyNF0GXDz3c0H
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:46:17 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=aiQXyI0qnA5+fwJZK3Zi/GZhppYIz55Ef3YI/LansjSp6dCEIqBQ9Iodzp1zLfN8/6FpGQlPpQnOKdXSHUUdxpoclYnAqBnZQUQQktw4JFzjCBq+DIajJcpI5E47YbFfFv0sWpOUlGQeG7/dxTp70qCRqlZOiNmpF2Sa2AqW4dD4rJPvBmTUqct6HvVVxpqC/zqGRDyIxlm/Ri96h9DNAmJ081QZt1tZ+oI7YKq5IzDO9h8/bkjrTdjgIwLdME4Y3AuWXgMnM3cNNoP+FZPe9xOKKvHu2ieWUttsweuBxrI1GGG99kD9NgX47SrNEza2Ks82XoB5RghZkXinPfqBYA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fkRDFt3FxJNApgJDoeBREY8AnHGH/ESkLOwj9vcRLs=;
 b=mHxZwo7/eho4w1+ChpuRSyigrJ0Q65ob9PeTyDO5qhDllsGiWFPOlg8mAmUTi8p8GgRhjrBsl+5TiPYwW9AeUBirD0+ywdAEi7SGensD1DqBM4mR3nr6rXuRNjX1VVRv2WgNBc/ZxL84E74S4CGQIbeox+/BasKEWBmgZSNNVycLcohWnmoXHY2ZZ0xYXeWv8e9OxsVJQIOYoMI8j2BVrvTylRCu73kdo85+WMn1yrpZC77onXcE3iJRPY1fXAbJ7ytEUQxxqez3ZqmhLToElaP5ypj+jDqnqZkTM4myTL7bYvdjHqdXBMqgDjPo2XnrYOMwG4sLlfS0DkgM/0vP+g==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fkRDFt3FxJNApgJDoeBREY8AnHGH/ESkLOwj9vcRLs=;
 b=CnI7UZxtyvNiNVcwGPbLWLLiMoMvc9YXxkmgqbsx4BET7/Rc2dwkRd8QHKfpfeBn48QEkV45G4Vf4fZpRD09S3meCyHrC3BUSyJjg3pJvRaIH391zROvbzA7KexetQCsX63QNGIUS4XpDTo2NFKMVSC6V7IRcE3vJvU7Q5j7JC4=
Received: from DU7PR01CA0023.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50f::20) by DB9PR08MB7889.eurprd08.prod.outlook.com
 (2603:10a6:10:39c::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Mon, 18 Mar
 2024 14:45:50 +0000
Received: from DB5PEPF00014B90.eurprd02.prod.outlook.com
 (2603:10a6:10:50f:cafe::7a) by DU7PR01CA0023.outlook.office365.com
 (2603:10a6:10:50f::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26 via Frontend
 Transport; Mon, 18 Mar 2024 14:45:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B90.mail.protection.outlook.com (10.167.8.228) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Mon, 18 Mar 2024 14:45:49 +0000
Received: ("Tessian outbound f0b355493f75:v300"); Mon, 18 Mar 2024 14:45:49 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 2a4549fbc38e6589
X-CR-MTA-TID: 64aa7808
Received: from 817df38c814c.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 2396F9CA-F3A3-4A51-8AF6-49AEEB9DA5C5.1;
	Mon, 18 Mar 2024 14:45:38 +0000
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 817df38c814c.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Mon, 18 Mar 2024 14:45:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LRrAjmJi3CkpOzovfZVHYBIpDXC6wZpyrxvaMNebbhWfOfqgAzeJBSHhwCNzU0E1gJiAXDpQaRo+6Y8xuFiz6v/9neUxP6u51EOvdiBLTX0n3PgIQW9Gaqjwf9jzAgcMrR8TOL/ki0mgkWMcfcpsgCFSOqR+TKcLwXoBjdSZxqtvMENy5oqIxKohOzliImcFcya70q+UCWSNvigB+GoNQlr7gUv8tE5ehv6taI108I+apHTfRLeMCb29S/dR+K4+2MSQf1xBnp5/wKumQXyF/w4+DqhTKUcY6JSnSLmaG5XvM7yYJ+6GoblsA5HB1OQTQ8BmAV8D/arWd4Tj1SIpIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fkRDFt3FxJNApgJDoeBREY8AnHGH/ESkLOwj9vcRLs=;
 b=gvMNnWnX6od5RMzw+vrh8i1xLWq79yB9qWGxDOlKCPJ+D4fhJqvASZLUl0ukQGgwQ+L+DOeLiMOHmi4TU6nj9t5/in4zRIwVQwGnk7ZLgPZIUV9tKuSXKMnV3uPfJg8x+MGV6cBE8etlObPmAatNLziZUAZF/QyGje4WcR068OgTfKE12OHz9IkV8NWr1/8nRLUKWerj3WSJv+g7I1AlsJ7307vcCZwZTAu1ImfZz6wXm7KiO6jU7G9U1JEEFJ3gs/0cr4sagEOXR42zgwRPjRUWyGHv5FA9hexu9w69bzoSfxobmN2ge2K5vETFNlYdU2XiviKhpRCo6ikfjrCa+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fkRDFt3FxJNApgJDoeBREY8AnHGH/ESkLOwj9vcRLs=;
 b=CnI7UZxtyvNiNVcwGPbLWLLiMoMvc9YXxkmgqbsx4BET7/Rc2dwkRd8QHKfpfeBn48QEkV45G4Vf4fZpRD09S3meCyHrC3BUSyJjg3pJvRaIH391zROvbzA7KexetQCsX63QNGIUS4XpDTo2NFKMVSC6V7IRcE3vJvU7Q5j7JC4=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com (2603:10a6:803:c4::31)
 by GV1PR08MB10536.eurprd08.prod.outlook.com (2603:10a6:150:164::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.26; Mon, 18 Mar
 2024 14:45:33 +0000
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::363f:3fc8:fc36:58ed]) by VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::363f:3fc8:fc36:58ed%5]) with mapi id 15.20.7386.025; Mon, 18 Mar 2024
 14:45:31 +0000
Message-ID: <66c4286e-deaf-44a0-be62-0928529ae73f@arm.com>
Date: Mon, 18 Mar 2024 14:45:27 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] sched/eevdf: sched feature to dismiss lag on wakeup
To: Tobias Huschle <huschle@linux.ibm.com>
References: <20240228161018.14253-1-huschle@linux.ibm.com>
 <5a32e8e1-67cf-4296-a655-f0fc35dc880a@arm.com>
 <ZfL/hROYxQudcTuX@DESKTOP-2CCOB1S.>
Content-Language: en-US
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <ZfL/hROYxQudcTuX@DESKTOP-2CCOB1S.>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0350.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18d::13) To VI1PR08MB3919.eurprd08.prod.outlook.com
 (2603:10a6:803:c4::31)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	VI1PR08MB3919:EE_|GV1PR08MB10536:EE_|DB5PEPF00014B90:EE_|DB9PR08MB7889:EE_
X-MS-Office365-Filtering-Correlation-Id: a3f85795-e05e-4cb9-9136-08dc475a1aa5
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  7aoamcJB01kBge1l5H6ivJJw6MqkPuljgJG9ERuLGNTjdRG8j6naeNaFUCAp2m01M6ThYIiyl5A5/W6McB5EcG9hzoUlKe3dhP1yH5g0BJetNkbzVd/zBW+huNX86cncf5QgaXzWwpGz/T1aBRPJiZe79bbvKrD7KLdxg1s04M1o2klGGyXf6Y9zRJtedzVI0TVojxmAuCxjh4cd0iylSkut9P3qTgb6nr28W3k36XWXOOVaHiDgmMsd2FGmD2drtY0MFo7JrAJbrpo0j4cFPamn+uWtKZAccgUZ8zrKPtvSmvz4LYXpZi93uQ7lhiPCgTp8beylqFaF+QfhJMH17opGIMrZVEENNKhZ2AZJxPp0cXTmsHoQihi5K8hLzB4j6H/Jxfz2Sfynr2jLl4YBtKKW/3lAW81TnyTzQNACL/jZUDl+Q8qx7NlkW/Bi/HOEjfc38yQja8G8ZBl5F4EHx/NdZsFs84uuz75buTeFuskr6ShbT15Ne2BdoiGPezThYmMRZm9bwqxQjov1WTAo7LQ3LkL63mhKouZeRzYbgkb88ecrP8g7tKWmGCvzEHc4L6igUnb9stW67EUosEWShoP88LiqclwZu3rTGaJ9cbU=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(7416005)(366007)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB10536
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	255463f8-ab7e-4d72-a5af-08dc475a0f8b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	JSWbQqyv2wfOYlvOVvxWhzZadG6XiAVWsmHemJaY0Tppl2JIkMdtnj4vTrOd09F3jYhhx4qhQYwDn8I588bl6twstV9/bT/94MC7qqh1HUA13DoE/GAvAnjd6mFiNFKvAyJRBgWZcCtzFl4I4Q93NBMsz68zEINu8CkPtJLBFa1TmjHRntATggALBMyyBjsjlxZBFYoJeCzGywBH0DTbaTMPSDqD7YgugZi8+VBCaqJWLcq763UN2aUHu2ftRKIn+grT7n6GWy80v9viKIRc+R5MLsZj10PttqUeJWq9jXIZ3CxaedZ/r+Cj1G5bQpGTbEEEWU+dutZSn2y5pR+6eHtRnxH+9rCdFnFBdnJBLcH2ZrcnEnfshQQ1k6MzE2/73GpWXkodlwXNa64op2Ii55eL4TcqK8PhS70JO9TDX7OKxG40r3nsruCQMT+Jwd8CX5Gb7jyYAWrna6YGQtBnmn0+Sl7L5UzhZPHIQQ6Rgre0dC3t+6oHmwLqDdn5msSQsynNPNaoD6/SKsD/Df0PWLbHFxIoPmpuQsSfB7mvhOayIQPc2Mz/j8+Kex5FsC2yE3Myik9O1J+SFaupi756yIskzXvX3Jdwkw7fS/fuHrK3ISYEg0ZNxi12IM58vkmDrroTZvZGAsVpC2TEVP4QRPNNe7LHDCMjaaaCko8rUycM7WSuTuY7JzHbWc6D6xwpiWJ7CMf1ExY7nNpDz3m2GQ==
X-Forefront-Antispam-Report: 	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(82310400014)(1800799015)(376005)(36860700004);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2024 14:45:49.9454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3f85795-e05e-4cb9-9136-08dc475a1aa5
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB5PEPF00014B90.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7889
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, vincent.guittot@linaro.org, srikar@linux.vnet.ibm.com, peterz@infradead.org, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, nd <nd@arm.com>, bristot@redhat.com, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/14/24 13:45, Tobias Huschle wrote:
> On Fri, Mar 08, 2024 at 03:11:38PM +0000, Luis Machado wrote:
>> On 2/28/24 16:10, Tobias Huschle wrote:
>>>
>>> Questions:
>>> 1. The kworker getting its negative lag occurs in the following scenario
>>>    - kworker and a cgroup are supposed to execute on the same CPU
>>>    - one task within the cgroup is executing and wakes up the kworker
>>>    - kworker with 0 lag, gets picked immediately and finishes its
>>>      execution within ~5000ns
>>>    - on dequeue, kworker gets assigned a negative lag
>>>    Is this expected behavior? With this short execution time, I would
>>>    expect the kworker to be fine.
>>
>> That strikes me as a bit odd as well. Have you been able to determine how a negative lag
>> is assigned to the kworker after such a short runtime?
>>
> 
> I did some more trace reading though and found something.
> 
> What I observed if everything runs regularly:
> - vhost and kworker run alternating on the same CPU
> - if the kworker is done, it leaves the runqueue
> - vhost wakes up the kworker if it needs it
> --> this means:
>   - vhost starts alone on an otherwise empty runqueue
>   - it seems like it never gets dequeued
>     (unless another unrelated task joins or migration hits)
>   - if vhost wakes up the kworker, the kworker gets selected
>   - vhost runtime > kworker runtime 
>     --> kworker gets positive lag and gets selected immediately next time
> 
> What happens if it does go wrong:
> From what I gather, there seem to be occasions where the vhost either
> executes suprisingly quick, or the kworker surprinsingly slow. If these
> outliers reach critical values, it can happen, that
>    vhost runtime < kworker runtime
> which now causes the kworker to get the negative lag.
> 
> In this case it seems like, that the vhost is very fast in waking up
> the kworker. And coincidentally, the kworker takes, more time than usual
> to finish. We speak of 4-digit to low 5-digit nanoseconds.
> 
> So, for these outliers, the scheduler extrapolates that the kworker 
> out-consumes the vhost and should be slowed down, although in the majority
> of other cases this does not happen.

Thanks for providing the above details Tobias. It does seem like EEVDF is strict
about the eligibility checks and making tasks wait when their lags are negative, even
if just a little bit as in the case of the kworker.

There was a patch to disable the eligibility checks (https://lore.kernel.org/lkml/20231013030213.2472697-1-youssefesmat@chromium.org/),
which would make EEVDF more like EVDF, though the deadline comparison would
probably still favor the vhost task instead of the kworker with the negative lag.

I'm not sure if you tried it, but I thought I'd mention it.
