Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C960C6CBA88
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 11:27:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm4835GXTz3cgq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 20:26:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=dxev/6uH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe02::61d; helo=eur01-db5-obe.outbound.protection.outlook.com; envelope-from=ioana.ciornei@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=dxev/6uH;
	dkim-atps=neutral
Received: from EUR01-DB5-obe.outbound.protection.outlook.com (mail-db5eur01on061d.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe02::61d])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm4736vnTz3cM1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 20:26:06 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cVfItfSS8ik/rNPlbLEcEnBg1R7qvXM2OfB3OtTj4k9BIVgrhR1Iii4ztcLHcru9UCG1ePfofFAgqgVWM75ulYg21oExY64dhsOlJyUk3htP2DLhmLzGsXI0AcP7Y/4x6EpJVMZDU7oDJTci+f1a+IZG3wqkDFYxom/zONJJK+0hx14sgOyLgXMe0ITczru60gQJtx71YjlwNQRqSu0gh6rZH6m4vqyyu/Fz+36nM0w2o5ELR2QaHWSKKlH5+qBz4Et8wGVg9MmUEloD71EDdddnLyfR6zVOFHsRFyP6bBCG8Qcb+d9Uxesee0S3U91emxbgCeFY0d9qMW05jpwhGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RSO0NKF8/hxKy6iYDnOj4iZUPfsYoJdhZHSt3FvIO9o=;
 b=ZWip522fOd/Lveq6mpbhhX+D0bVYVFGx9OJ92BSAkwzS6ZxJNNMmGyXPOzR2xRwLC1gPrNg5M8IcpK+dfqrYtagNzM/sgsehZV2rU6nR6O3/7Bt6uBladsZLtwsxO8DN/A1/kyFb8k5NU1SipinD9/4B0BL2z2bNd3EQtEqB0YQoRxQM9S9+Oz5PekcNW69Nvt++KEmV0hqOZF489KvtwyHIeFERi91Ky8In4pE6gLCSRFTSYQFrbfXT0eMq9neV8vTizBaxEy31GNW8zrBx3WxNQ3lXDcgklxaa9ecZBTCqFME0eGpY9JhCzzEMHr3oOY+hkEtXIFkd+KoGBSz1NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RSO0NKF8/hxKy6iYDnOj4iZUPfsYoJdhZHSt3FvIO9o=;
 b=dxev/6uHn72YZoKp8XYKgmAz5RvW5t6/+y1MqKnIVtmfJd01rNMCylW45BvfuAIrt9dALr2OBUkNUFPxNssPFYNeoHOewpv1YQwSshTvK2Sev5heih30JQJODxmiXxAbvAC47pr9L4ewxG9c5kbrhRAhac4aAGWlL/jbnAQ6o9I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from GV1PR04MB9055.eurprd04.prod.outlook.com (2603:10a6:150:1e::22)
 by AS1PR04MB9581.eurprd04.prod.outlook.com (2603:10a6:20b:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Tue, 28 Mar
 2023 09:25:46 +0000
Received: from GV1PR04MB9055.eurprd04.prod.outlook.com
 ([fe80::9c6d:d40c:fbe5:58bd]) by GV1PR04MB9055.eurprd04.prod.outlook.com
 ([fe80::9c6d:d40c:fbe5:58bd%7]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 09:25:45 +0000
Date: Tue, 28 Mar 2023 12:25:41 +0300
From: Ioana Ciornei <ioana.ciornei@nxp.com>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v12 13/13] arm64: dts: ls1088ardb: Add serdes descriptions
Message-ID: <20230328092541.og7mexyh4espbh6t@LXL00007.wbi.nxp.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
 <20230321201313.2507539-14-sean.anderson@seco.com>
 <20230324131701.4ucxf65sxfdtqcai@LXL00007.wbi.nxp.com>
 <5ca4aeba-db2c-4c0c-c620-d380b4b839bb@seco.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5ca4aeba-db2c-4c0c-c620-d380b4b839bb@seco.com>
X-ClientProxiedBy: VI1PR07CA0227.eurprd07.prod.outlook.com
 (2603:10a6:802:58::30) To GV1PR04MB9055.eurprd04.prod.outlook.com
 (2603:10a6:150:1e::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV1PR04MB9055:EE_|AS1PR04MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 292bc19f-f653-4a03-7a64-08db2f6e6897
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:  kFt82b6VzR/iZdbPj+L18xRjQDBZ6uBKL03ukRe+nF1RYHn/g0t7Wz33ip1cyqtWy8Omz5rHiKRWOY6SsMmsu9FPIkgK+2YG+asrIaHWiDQttFzhQead8Im4Rq6T2pmMgij8JDh8LkO8vtv1Uw2dvwblTYhSSoRv6ERGOqAyxB4Fv70bSv1OWK0tnuz7l4czscx5Sl6PHJaaUgPVvLG0o4NfiFaFW+djBIZvtuA1JSWByhSGudSAz/Kdwk8s/gcwIV+7NXtMLwbTxMjq2KRA8WIeikUESAz2073juV9wCKCBhHS/Ko67LWBr/0gFuepKZGT8Nn/gPf/IkWcLXemrgSXhJLWiW8k/Bm9UiD3ebn8J5EyzK61uNbidMuXESoRrj98xQEQGHOpa2Q1Wf2xEJxM2+d+pRiEZHzrrNZPq062gr4dDoP3jAPgFBTRr9q8svIS/E0NnbsHfTBICPGczE1IVMGdOESXhzLRNTxRso4pggG9Me2hBtD8sNSt1rPS3KVLcCzeAurr9bn0uT+sdO+A6Ysd5hXnL863uoZOfwnJdFhuL4GyvKsxKexDUaUWI
X-Forefront-Antispam-Report:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR04MB9055.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(346002)(136003)(39860400002)(366004)(376002)(451199021)(86362001)(44832011)(2906002)(478600001)(6666004)(26005)(83380400001)(54906003)(6486002)(1076003)(4326008)(66476007)(316002)(66556008)(66946007)(8676002)(186003)(6916009)(53546011)(38100700002)(5660300002)(6506007)(8936002)(7416002)(6512007)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:  =?us-ascii?Q?b6JJsn8n46P610PVHv/NQEU6pwZ7Uoe3KC2wAFZHU6KWTdXAQQVthPsw4LHQ?=
 =?us-ascii?Q?TDHpSf6JOmcJnb64dQ2ksO/vML9SWH3rMTPtl8A5NOqzAmoo4MXL/vUgILMn?=
 =?us-ascii?Q?HAtEV3qX3lZbgJI5jkQmc16wqLSQTSmwRdhqxFrTlOKNfqE/6JoQNL3ozkDQ?=
 =?us-ascii?Q?tlAJTRIGa3rYHCiLPXN0quZzvS7W5v+F23m0BpxwSIAE7CamSG+scD1JT/qa?=
 =?us-ascii?Q?+S6RRSX4x4ipVQi7WJGIcCif4jFCTafw0lNZ88VMUObThdGoS580iF16X/Yx?=
 =?us-ascii?Q?WS5smP7lvWouZFpWxKbTMLHwWq2r5Y6ER2Lc3YVyVLerSJ530MeFtJNBFl8/?=
 =?us-ascii?Q?fNZ9kITuMb/QG0eDqGGz3ggC1tmngHCvhig7UPYB0WMd6D46p12PsAYQSy7X?=
 =?us-ascii?Q?1AV7OGTkpS3kdGnDdMn5vCk5s2pehIpgZZOdzogk7FiATG6B3LdzM3IumYk7?=
 =?us-ascii?Q?tAQkHRYX76YgdX6AJ5JooJrQV9dUeFV/YmyIvD2yZDO528ruteNfkoOZkvTZ?=
 =?us-ascii?Q?gmehNb+AKliQZ0tlEQ+q15TH73LLLxs6x8+EI+yYTq25+fak1SmJKQMyTnqn?=
 =?us-ascii?Q?i3MFOhI7BVWtzSt1jp1TJdqYC9pWFsW1bnXlpLNx4UFQKzMGUwViypvGfavL?=
 =?us-ascii?Q?uV3dW933q0yn9r8gKCBTNhtQmt5/eZ4QerjlXNQ8t1cFcc+8BhPjUd92XazQ?=
 =?us-ascii?Q?98512/eMBqqmlXLLfH75fiW8zliokoe9XSRkQ+ecN3+JQbLREZFdq9m4/ZQv?=
 =?us-ascii?Q?YpBvqBjOY8yyqa9kvnMOji4hLoyCZL3ZNAMxjwk17tnXbmH2At0NiKIqYimw?=
 =?us-ascii?Q?0Q9eAGIcvGGGkNZjU6Exvj6rc9Rzrt2SP9uudPcpkpwrFAlYJKTJUh2246+B?=
 =?us-ascii?Q?2dc2S1Ni+df7Zds2iIMarVSm1yXNElBwPeD9chx1g+/vff8koqv1A9WwuTpU?=
 =?us-ascii?Q?wUnd851sv3MH2dTPgwkvqcAnRSXTrgndonRxvRC9esd8Ct7KCFoGamzw9NOm?=
 =?us-ascii?Q?ao0j1jyQFuDmQyw9NVRSM4iLh2BsoK+MHpOofdv+BEZ6LdIw1klF5rW/XILO?=
 =?us-ascii?Q?0/QBrhT4M/goVZ5h3pkO8Ah0A6Zdq5+90IC4rxTkznxGMw0J3UdZRSMF0uvE?=
 =?us-ascii?Q?hmPSOWy7cDjMYq6V/4vFsCGajTe8V35oqWb1nCkBi7n7y/HPkJ6/820ulvki?=
 =?us-ascii?Q?PVafdiLKwzzSMpPzzuNf1Y9/A9fbfJegFkSGWY0oB98JIko+9tYd0/I0gaLN?=
 =?us-ascii?Q?Y6xKpfwPPW4ThMZ9/9wEAgij2FubZJ3IMGxKhjLSfPn2ACalMudNZlNEeBa7?=
 =?us-ascii?Q?Cp+OcLY6Rjecsvd6xljlmu8Bd9TFxD6kE+MiW93NjgHf70mTMJrn4/HZkQ72?=
 =?us-ascii?Q?8VxLwMztv7TZlFU8/icdyfON7wBOQQM1xglJc/KKiZwVFWKyGplmF53wKKFE?=
 =?us-ascii?Q?dADjH9AZvUEK+JIElc8e5xj5pF+KAZ7YthW97CrA9qLT0kaNtzaDha741B3K?=
 =?us-ascii?Q?V4vc4hqg3/mjohmupt97lXJiQ7naI5QGlUkCm+TOrigTc74tuD/Q5hnnxFQS?=
 =?us-ascii?Q?xs/mWShN/5UUeiCB+PmUv+j7WDdS/Czl72RMErxm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 292bc19f-f653-4a03-7a64-08db2f6e6897
X-MS-Exchange-CrossTenant-AuthSource: GV1PR04MB9055.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2023 09:25:45.4329
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mhPU9oEpcEQYozoLK91kTOsuKQ7fNb21ZIbgsM4iSGxQNapsQR8qdTldi8Spqp+Ckf481VTXhwZT20guxrcXQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9581
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 27, 2023 at 02:15:47PM -0400, Sean Anderson wrote:
> On 3/24/23 09:17, Ioana Ciornei wrote:
> > On Tue, Mar 21, 2023 at 04:13:12PM -0400, Sean Anderson wrote:
> >> This adds serdes support to the LS1088ARDB. I have tested the QSGMII
> >> ports as well as the two 10G ports. The SFP slot is now fully supported,
> >> instead of being modeled as a fixed-link.
> >> 
> >> Linux hangs around when the serdes is initialized if the si5341 is
> >> enabled with the in-tree driver, so I have modeled it as a two fixed
> >> clocks instead. There are a few registers in the QIXIS FPGA which
> >> control the SFP GPIOs; I have modeled them as discrete GPIO controllers
> >> for now. I never saw the AQR105 interrupt fire; not sure what was going
> >> on, but I have removed it to force polling.
> > 
> > So you didn't see the interrupt fire even without these patches?
> 
> Not sure. I went to check this, and discovered I could no longer get the
> link to come up in Linux, even on v6.0 (before the rate adaptation
> tuff). I see the LEDs blinking in U-Boot, so presumably it's some
> configuration problem. I'm going to look into this further when I have
> more time.
> 
> > I just tested this on a LS1088ARDB and it works.
> > 
> > 	root@localhost:~# cat /proc/interrupts | grep extirq
> > 	 99:          5  ls-extirq   2 Level     0x0000000008b97000:00
> > 	root@localhost:~# ip link set dev endpmac2 up
> > 	root@localhost:~# cat /proc/interrupts | grep extirq
> > 	 99:          6  ls-extirq   2 Level     0x0000000008b97000:00
> > 	root@localhost:~# ip link set dev endpmac2 down
> > 	root@localhost:~# cat /proc/interrupts | grep extirq
> > 	 99:          7  ls-extirq   2 Level     0x0000000008b97000:00
> > 
> > Please don't just remove things.
> 
> Well, polling isn't the worst thing for a single interface... I do
> remember having a problem with the interrupt. If this series works
> with interrupts enabled, I can leave it in.
> 
> Did you have a chance to look at the core (patches 7 and 8) of this
> series? Does it make sense to you? Am I missing something which would
> allow switching from 1G->10G?
> 

For a bit of context, I also attempted dynamic switching from 1G to 10G
on my own even before this patch set but I did not get a link up on the
PCS (CDR lock was there through). Pretty much the same state as you.

What I propose is to take this whole endeavor step by step.
I am also interrested in getting this feature to actually work but I
just didn't have the time to investigate in depth was is missing.
And without the dynamic switching I cannot say that I find the addition
of the SerDes PHY driver useful.

I have the Lynx 10G on my TODO list but I still have some other tasks
on the Lynx 28G for the next 2-3 weeks. Once I get those done, I will
look closer at the patches.

In the meantime, some small thigs from this patch set can be submitted
separately. For example, describing the SFP cage on the LS1088ARDB.
I still have some small questions on the DTS implementation for the gpio
controllers but I would be able to submit this myself if you do not find
the time (with your authorship of course).

Ioana
