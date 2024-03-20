Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33123880CD7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 09:13:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=vlL4wm6F;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=vlL4wm6F;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V01ZQ6d3Bz3dkm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 19:13:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=vlL4wm6F;
	dkim=pass (1024-bit key) header.d=armh.onmicrosoft.com header.i=@armh.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-armh-onmicrosoft-com header.b=vlL4wm6F;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=2a01:111:f400:7e1a::60a; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=luis.machado@arm.com; receiver=lists.ozlabs.org)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V01Yd2BxPz3bsw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 19:13:05 +1100 (AEDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=fDM85NnGZNTrlTlaVjCL29Goe8p70Qj/VatI0Du9mbKaAqeieMQ8XyzKApwcRFdGYtEfpu0cUtLmmnX1JrWZFIk38Y+in6dQqzJ26uhmMrrHg+CeLb+NBg52YD3R3NFf48LOYSl/HM/lEgxUsEiyOnPHDgQCcKqDYgy3WMIAEHFa51fSWEQtRxXOcUolvh+DQ17Pqre5K45VSw8USBB3VGM6/P/SqyQymctmx3J5YeN56Wxu5NhF6/HHjOwl1gBCLhW1QHOuBWwpoopaS6a4LPkcE/KHg3pmzUiatF3vlX1JFAb1iiWbeZv0QTJqhLdEKmE+GvPjRI9aceXEcwO/3g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jt0+QpsVElN8a4lucaX9vVROoHh6h1nTL9n4s+qpaiU=;
 b=Eu6qbORVWDYGAWbZh9Mb9BVGP5opeqGbEgR03H4SGEED/1nnM+e3TrLAkCeC3zWz+kDPoUFnZcXVkZg8v/spABdmc9DdfWQtdMPvQUtRw4TIqcMJsle4avHW+nEDgwfRWem4yRoRzK3T7O+lCQLmM8hltuYPBWXmPeLaAn+Yz3rXco6aGnZCPxkvfDm21Qw9prd/7g8H7OFG7g6iFl4KcaHkCRrfjT5GmxznSBGolE2IgtLf38LvJHS6Dp/3w6lE/zA9mcpv6rLWf41BOoAubToH1NCTOvGxMDQQMOII5Pwk34XfnPfgT5kbEAzwRU5v6lcaH50SQr9bj33EVDt7vQ==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.ozlabs.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jt0+QpsVElN8a4lucaX9vVROoHh6h1nTL9n4s+qpaiU=;
 b=vlL4wm6FjPf1LJWC/1/dBHm3n/QgNQjRr1FrZF9/6cTRDNsr9lPncO418aH1a/BbleABUM0W3ioe8m+R1i8dR/nkW14F+N13KKfKy1DffNlt9LYwyvKlMyk2aHWQb0QUS2kLUpsnqXjVJjH5U1d5pMh/IE7s28uq1hSehSznVo0=
Received: from DU6P191CA0038.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::22)
 by DB8PR08MB5322.eurprd08.prod.outlook.com (2603:10a6:10:114::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27; Wed, 20 Mar
 2024 08:12:45 +0000
Received: from DB5PEPF00014B8F.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::a9) by DU6P191CA0038.outlook.office365.com
 (2603:10a6:10:53f::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.27 via Frontend
 Transport; Wed, 20 Mar 2024 08:12:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DB5PEPF00014B8F.mail.protection.outlook.com (10.167.8.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7409.10 via Frontend Transport; Wed, 20 Mar 2024 08:12:44 +0000
Received: ("Tessian outbound 9d16f63426bd:v300"); Wed, 20 Mar 2024 08:12:44 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 3f506dc0523184e5
X-CR-MTA-TID: 64aa7808
Received: from 5ba36317b1df.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id D4662689-3DAB-4D16-964F-4244560F5115.1;
	Wed, 20 Mar 2024 08:12:34 +0000
Received: from EUR05-AM6-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 5ba36317b1df.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Wed, 20 Mar 2024 08:12:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WndU/REmIeRG427exB486aVows2C+V3z/DnoODDcl4ta7DcWzNM8I0LVMIsSxqwTnndTqZcnxkpdyaDK0IFmskQ4MZUnOayG6gcjAh+sQXCl6CeRSudoUpP+4X+q4gLRfb8O3PrSRa4+CNOccGRzJVcuR+4Jrd/rxeyCR5Ut4mDe6lgzoMRwUURazKGzBzqVqZXZHvshUejQF7YNlhzEqR+rbVqSrMGNUqfy67y1ZwKwCWeUn2Nka2s35RcHco0iVWm5oPFwHGIr7RbF1G6uP4Sdx7BtmDCZhQdgob1xe1WZc+BOxGEieE+O5mvOZgT1FigafR6Ig+nMhsNoa4SuoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jt0+QpsVElN8a4lucaX9vVROoHh6h1nTL9n4s+qpaiU=;
 b=ftl4+Gjnm7s7x+wE4B3TVB1xPJGRn0w6ZRwJL29AbTZSp7qGcGbo+2nIOeXT1lz4IQWUHJgPeFIHiDADXBwGt33ff38LzLOQ5YaAmXc5ok70wubCPYXycI+thw1Xy8NPrentHGzEsZHWjwvJCefaa0hB/j3o3JndzpWDZnPlWVfs4Oi7oR39AGdp+R2lFpPb3irwoLi4kOi8rjfEQhfLEHsPvQpjgtA+SB4uB+1IAu0M56TkcLueWy4dOPRl2LkjI+hJaX/pUKJ23cBY/Q/TCxBf1k5BgjZ5Xabe5mxb8fQv4mePhmrY72f4Fs/uV638sHIJ51IQ6WB9XXqdQ3UggA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jt0+QpsVElN8a4lucaX9vVROoHh6h1nTL9n4s+qpaiU=;
 b=vlL4wm6FjPf1LJWC/1/dBHm3n/QgNQjRr1FrZF9/6cTRDNsr9lPncO418aH1a/BbleABUM0W3ioe8m+R1i8dR/nkW14F+N13KKfKy1DffNlt9LYwyvKlMyk2aHWQb0QUS2kLUpsnqXjVJjH5U1d5pMh/IE7s28uq1hSehSznVo0=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com (2603:10a6:803:c4::31)
 by PAXPR08MB6384.eurprd08.prod.outlook.com (2603:10a6:102:154::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7386.28; Wed, 20 Mar
 2024 08:12:30 +0000
Received: from VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::363f:3fc8:fc36:58ed]) by VI1PR08MB3919.eurprd08.prod.outlook.com
 ([fe80::363f:3fc8:fc36:58ed%5]) with mapi id 15.20.7386.025; Wed, 20 Mar 2024
 08:12:29 +0000
Message-ID: <6d0dcb2e-09a2-4238-8629-e6857504765f@arm.com>
Date: Wed, 20 Mar 2024 08:12:18 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] sched/eevdf: sched feature to dismiss lag on wakeup
To: Tobias Huschle <huschle@linux.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>
References: <20240228161018.14253-1-huschle@linux.ibm.com>
 <5a32e8e1-67cf-4296-a655-f0fc35dc880a@arm.com>
 <ZfL/hROYxQudcTuX@DESKTOP-2CCOB1S.>
 <66c4286e-deaf-44a0-be62-0928529ae73f@arm.com>
 <4b25ab45b762e64b9df09d4d12d8289f@linux.ibm.com>
 <CAKfTPtDyrsnq-CSFo+upzdOJpuH=JkRzSALad-OL29OvqkK2dg@mail.gmail.com>
 <ZfqKbLm4rWXmfPN4@DESKTOP-2CCOB1S.>
Content-Language: en-US
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <ZfqKbLm4rWXmfPN4@DESKTOP-2CCOB1S.>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0161.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::9) To VI1PR08MB3919.eurprd08.prod.outlook.com
 (2603:10a6:803:c4::31)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	VI1PR08MB3919:EE_|PAXPR08MB6384:EE_|DB5PEPF00014B8F:EE_|DB8PR08MB5322:EE_
X-MS-Office365-Filtering-Correlation-Id: 58b5fd1b-1743-4807-b80e-08dc48b58585
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  8OTKQqyZylVTdIRBZ+sbWbpU4AbjdMmS6SGBHr2vviP78Um+jDZ9BnOJnK2tsz3SszqbU+Qf0qoR0wbrGEVkgwfVoEm6UkZS6z0eBGoWuN9T+0MYsvoqUeGsVXfr77+CbqrnMR8Zr4R02LREPs7UhQYBOBpSmEj92ySuRdFdhlQ480O/k9FUCtyPBR3wGU1USVSpIkM/9L71etxNUKrhCXt3Ft58a710N1S8Kv1kmdcwLPf9LfzBgvjDGb3I6jo7SfxwYzrkYlDO1nK8Bxcpx2l802MYBK9G/TAimwqlF5b2kqkircb9ji8qzpC5xMMg64vV3ktMNB7JeSjJRCZwaedqliC7TYdVlRnueJDobk7MONK22kMnjUS2Bgs3nwkNn6Q4FiN6DhVRnrjjuIHzCWhaL0DuHgTAU7O/eCZKEXq6gjMB4tS+pvbfxd3efhHbcdcpj1QbrizkcCSVSmc0hyYoZ8+KVpOfIbxdzOM2TiF4RnEusLvSKPMQoxeGqR9/xwTk0C58hmJdIij9FjruBRKXtaaKhql8NZ2/HZfRNjueORqxwjIjJeE8s5IJIfHmjc2ueKuElFPjxp3en/XZ/vVq09f7gfE4Z6k+w+jGKv8=
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB3919.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(1800799015)(366007)(7416005)(376005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR08MB6384
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	258f15a3-5473-4b00-2bc0-08dc48b57c20
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	qGHZ7Jjn3pRlOiIwAdoGVA/EWJCOicTQbv+4s2FPBwfNEXcxD37Uei99uVW1Qty7/3rECbD3qMqT8SEInGYsClUyTpPWnM6YAZIAFVb4a7+iwYp1Sj8wdSnwVI9TXc0X30Z9FEatBUG1beDhgWNYvgagpbkTDtMf6axibh9k/XsiVCilsAeY6RIJT6v3i27C7BERMfLDtuxtc5NEMaoj231xAyQPn+0Cvgg4SiJGGU5NHvy6JZRbmwEtK89AAETfejR3h29UVsrRb3e61gOQdzOhg9IYEm1amRO0btrgHzGN7GzRddF79GkYAgqhUggLQfK6ckkaQF59YP2z6/nNqQXy3F2c9OcrhSFNO/Dd5rBXjz5aMNdLdpLEXYt3O/ZyF/5VoN9IVpj0ZJAvn8NmAwSydtxr9OazITDOiXOigCk0/VQkyYuHMCpVbBYVpofURCaEGOGNnVeyixHGDYtTjmeox1wY/I1HvaIJWDRmeHnuqz6ofp0WgF9R1uLXgcDCI2z0e8i6dUQTUM+iSevmwQH1BcUSBgcjxegF/I7B1szp9rJU9tgl2pOXuMYRiQoLUraKTMesTC8s2zddINmBMagB5894XAle2rOdUIDY1dONeagTT+OVxZGiLMkYUjthrwRXYkhkYPectrQIFF8Yhk+pbrUEszpX2bslA68HqMvFeqEdfviQlbrSnXYlMMqc2JEswEIBOZUpeUPVB4Kcpw==
X-Forefront-Antispam-Report: 	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(36860700004)(82310400014)(1800799015)(376005);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2024 08:12:44.5556
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b5fd1b-1743-4807-b80e-08dc48b58585
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB5PEPF00014B8F.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR08MB5322
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
Cc: juri.lelli@redhat.com, vschneid@redhat.com, srikar@linux.vnet.ibm.com, peterz@infradead.org, sshegde@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rostedt@goodmis.org, bsegall@google.com, mingo@redhat.com, mgorman@suse.de, nd <nd@arm.com>, bristot@redhat.com, dietmar.eggemann@arm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/20/24 07:04, Tobias Huschle wrote:
> On Tue, Mar 19, 2024 at 02:41:14PM +0100, Vincent Guittot wrote:
>> On Tue, 19 Mar 2024 at 10:08, Tobias Huschle <huschle@linux.ibm.com> wrote:
>>>
>>> On 2024-03-18 15:45, Luis Machado wrote:
>>>> On 3/14/24 13:45, Tobias Huschle wrote:
>>>>> On Fri, Mar 08, 2024 at 03:11:38PM +0000, Luis Machado wrote:
>>>>>> On 2/28/24 16:10, Tobias Huschle wrote:
>>>>>>>
>>>>>>> Questions:
>>>>>>> 1. The kworker getting its negative lag occurs in the following
>>>>>>> scenario
>>>>>>>    - kworker and a cgroup are supposed to execute on the same CPU
>>>>>>>    - one task within the cgroup is executing and wakes up the
>>>>>>> kworker
>>>>>>>    - kworker with 0 lag, gets picked immediately and finishes its
>>>>>>>      execution within ~5000ns
>>>>>>>    - on dequeue, kworker gets assigned a negative lag
>>>>>>>    Is this expected behavior? With this short execution time, I
>>>>>>> would
>>>>>>>    expect the kworker to be fine.
>>>>>>
>>>>>> That strikes me as a bit odd as well. Have you been able to determine
>>>>>> how a negative lag
>>>>>> is assigned to the kworker after such a short runtime?
>>>>>>
>>>>>
>>>>> I did some more trace reading though and found something.
>>>>>
>>>>> What I observed if everything runs regularly:
>>>>> - vhost and kworker run alternating on the same CPU
>>>>> - if the kworker is done, it leaves the runqueue
>>>>> - vhost wakes up the kworker if it needs it
>>>>> --> this means:
>>>>>   - vhost starts alone on an otherwise empty runqueue
>>>>>   - it seems like it never gets dequeued
>>>>>     (unless another unrelated task joins or migration hits)
>>>>>   - if vhost wakes up the kworker, the kworker gets selected
>>>>>   - vhost runtime > kworker runtime
>>>>>     --> kworker gets positive lag and gets selected immediately next
>>>>> time
>>>>>
>>>>> What happens if it does go wrong:
>>>>> From what I gather, there seem to be occasions where the vhost either
>>>>> executes suprisingly quick, or the kworker surprinsingly slow. If
>>>>> these
>>>>> outliers reach critical values, it can happen, that
>>>>>    vhost runtime < kworker runtime
>>>>> which now causes the kworker to get the negative lag.
>>>>>
>>>>> In this case it seems like, that the vhost is very fast in waking up
>>>>> the kworker. And coincidentally, the kworker takes, more time than
>>>>> usual
>>>>> to finish. We speak of 4-digit to low 5-digit nanoseconds.
>>>>>
>>>>> So, for these outliers, the scheduler extrapolates that the kworker
>>>>> out-consumes the vhost and should be slowed down, although in the
>>>>> majority
>>>>> of other cases this does not happen.
>>>>
>>>> Thanks for providing the above details Tobias. It does seem like EEVDF
>>>> is strict
>>>> about the eligibility checks and making tasks wait when their lags are
>>>> negative, even
>>>> if just a little bit as in the case of the kworker.
>>>>
>>>> There was a patch to disable the eligibility checks
>>>> (https://lore.kernel.org/lkml/20231013030213.2472697-1-youssefesmat@chromium.org/),
>>>> which would make EEVDF more like EVDF, though the deadline comparison
>>>> would
>>>> probably still favor the vhost task instead of the kworker with the
>>>> negative lag.
>>>>
>>>> I'm not sure if you tried it, but I thought I'd mention it.
>>>
>>> Haven't seen that one yet. Unfortunately, it does not help to ignore the
>>> eligibility.
>>>
>>> I'm inclined to rather propose propose a documentation change, which
>>> describes that tasks should not rely on woken up tasks being scheduled
>>> immediately.
>>
>> Where do you see such an assumption ? Even before eevdf, there were
>> nothing that ensures such behavior. When using CFS (legacy or eevdf)
>> tasks, you can't know if the newly wakeup task will run 1st or not
>>
> 
> There was no guarantee of course. place_entity was reducing the vruntime of 
> woken up tasks though, giving it a slight boost, right?. For the scenario 
> that I observed, that boost was enough to make sure, that the woken up tasks 
> gets scheduled consistently. This might still not be true for all scenarios, 
> but in general EEVDF seems to be stricter with woken up tasks.

It seems that way, as EEVDF will do eligibility and deadline checks before scheduling a task, so
a task would have to satisfy both of those checks.

I think we have some special treatment for when a task initially joins the competition, in which
case we halve its slice. But I don't think there is any special treatment for woken tasks
anymore.

There was also a fix (63304558ba5dcaaff9e052ee43cfdcc7f9c29e85) to try to reduce the number of
wake up preemptions under some conditions, under the RUN_TO_PARITY feature.
