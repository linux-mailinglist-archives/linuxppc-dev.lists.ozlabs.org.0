Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5633F73B7BF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 14:42:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=JEcQnBdH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QncMh1xTNz3bt0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jun 2023 22:42:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=corigine.onmicrosoft.com header.i=@corigine.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-corigine-onmicrosoft-com header.b=JEcQnBdH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=corigine.com (client-ip=2a01:111:f400:7e8b::728; helo=nam04-dm6-obe.outbound.protection.outlook.com; envelope-from=simon.horman@corigine.com; receiver=lists.ozlabs.org)
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on20728.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8b::728])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QncLj5g33z3bYC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jun 2023 22:41:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YwGZmcnSrEg6+Cnu6ixdEl6Y2JII83qTWJFIAG5OjFWw7hBssqeyRHw9oQHurmlFGc8j6D04Z5yj1yPsp6IZn22tvgMWhYN1PtSKqvGAXBMbo9EtvOjumMIpsTobEy3u+NUGlMJ4y74jMIL5gy7IXwuhrmvOU9Kwrr+9T9DjJX41GavIgHMDVScNxAaB6/0V7XsNefnvPGdAzOghbqSqJw6rkikyVv5KkzRI1ucAeNcKIJH8S5EzfZQXtSYFNBcN+6jcoBDVgd3vCq3JOHBwMa7KERd05oXGDyZF8Gvqu64aTxXmBLIcsza/H6QMcDskPEQQuYnq15uJ/Cv2yLQ+Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HUC+rgPKwQe4ZDtNkf0qJiI1kevFBQlwJ2R3g3biXdQ=;
 b=YvQ1FUmFEW3L08Aom+FijlwblODN45MILP3DlUBcl6O/G9nrgbDMiRgA3KOi45ZkXFeRoCqMOecI/A7UnDVB/P+O5EYMVs3aoebYYsrCk3VXz1sxQm5GP/vMdDfbJPYhPxiUvwe8I0Ns5HDMygcwZPfv7/6yf/jCg3ttl6Q+WJ4mI11Qe6RFIyUEYNuns+nZE1IINQxwXDuLf3U/Y8T4sF0TsXMZAVMNwFmRl9brjqj4lxX7PrnUFLfyhVDEhpXmfI/5wqYnOCZg0Rw7H/TagGj0VFajyYa5itYiK8cwov92SRUBfCX1/7BSdYES70hK8fLUEyU5i9Fev8RIrdw/Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HUC+rgPKwQe4ZDtNkf0qJiI1kevFBQlwJ2R3g3biXdQ=;
 b=JEcQnBdHewsDNYcEeDspCwppy2jr2AUOSds0lzO5mAFa3AhEkFxAWbyPT9UDemA/Rmkpp7i0TeG0Ku8xc+cRr4p7MX1MW0cNriqDiFT67HfDI5mej2YSQn7lv0jD6Nf6zXK67EHegGEYd3stqUWGpUo+oeoW2I2/hf+U18vQkQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by SA1PR13MB5467.namprd13.prod.outlook.com (2603:10b6:806:232::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Fri, 23 Jun
 2023 12:41:28 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::eb8f:e482:76e0:fe6e%5]) with mapi id 15.20.6521.023; Fri, 23 Jun 2023
 12:41:28 +0000
Date: Fri, 23 Jun 2023 14:41:21 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Nick Child <nnac123@linux.ibm.com>
Subject: Re: [PATCH net] ibmvnic: Do not reset dql stats on NON_FATAL err
Message-ID: <ZJWS8coDN71C/oeE@corigine.com>
References: <20230622190332.29223-1-nnac123@linux.ibm.com>
 <ZJVPMyO/gBkk1OT0@corigine.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJVPMyO/gBkk1OT0@corigine.com>
X-ClientProxiedBy: AS4P190CA0021.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d0::6) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|SA1PR13MB5467:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f27aecf-ed38-4d6e-d07c-08db73e72a2a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	y0s6zhhvidxiBu9bXCXJYXeNSp7ihQWqypHqBzDxLsEWBDvh5UNBoRFoHKYNnGtFalMBu1QTzJlosZyH56Ofd37C/BF06paXB5cj46lq6xU9mtVC3b49cV77r7lf1XbuM/Epk3/DhLiAKaN1RKcr/19mQs5bwFAANIbky3/lJTJhQolgY82b/Su9wqa/4rbU80KANmFS1/a5rpTNPCu+hpi+P+A1h+aY+fMf1JWivgXdlYDvKRMHLsY34lkirXDEA1XhlCs1husq3V93kVvs6eR9Jk5RR2Tfwl0s8dI6oCoPwAdIG7hwgIpflWFz0/LeeKwTc4/4mUllwEIr8UrbrNpIxRReA4EZkot/hHA4VbhkkhE1H0jzcHp4wSfC6L/1IhGCLSCK4HxCEUHBXkdb0KSmNWaCmuuoF1Tf6/kZCJCN9I19iYfj47+Rt8UkSXJLEMkPcD4HGsonEvummM2LMk7AxZw23dopXeouYGBzZMEzx/fxEX24J/WovooDjITluqK2glcBJMTQOmFD0SFrSMaAgli+oSt/3uQBYPLfWDo5UyqmD5LC+3PU7c6tslQZiEN2Zk3+rtqpND2INoYhKhY6gttvskiLELj5NOcQFM8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR13MB4842.namprd13.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39840400004)(366004)(451199021)(8676002)(7416002)(5660300002)(36756003)(44832011)(8936002)(38100700002)(2906002)(478600001)(6486002)(186003)(6666004)(2616005)(86362001)(6506007)(6512007)(66556008)(66946007)(6916009)(66476007)(83380400001)(316002)(41300700001)(4326008);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Vgfz2q5Dzn1gUmPw6GZBmJHnxc58vq1LZ8RmXlhSXRUleQb/nVRaDV6ZltaP?=
 =?us-ascii?Q?WNaLHtwF6AnByE6YRPv5UQ53/+YUTdDZRUwmNNJSBpvZ/kVDfsHx7gyNjSev?=
 =?us-ascii?Q?myznYfw78vsROaKM8WJK6QLMoX9U5H7ucT20CyR1DFLEhtOZXPG/WPjva+mn?=
 =?us-ascii?Q?xgtjl/KZbVcvs4jWEleYuXJcEP+P26GF6xJp7/SaPNuHoiTDvo66fItdeUmw?=
 =?us-ascii?Q?Fhcztt491le8ozjSD8DfdP5FZ08Kx52220tLJ9MaBS7ymHwGJ+Fsx1tYfGBE?=
 =?us-ascii?Q?ZHjEEbLUxQguOK7WFM4y4QDUMUE1YR3SFLOyNHLKoZF9S5Wdp6vUtYZpXkoS?=
 =?us-ascii?Q?EBulCfzR1amd1ZVZwDIWLGIoUTRHW2eqNVlMChdTshRWdObDoHIyX6Y9CTHz?=
 =?us-ascii?Q?Wdd02Vc+GD5WdFGNNy5BGuu1LxzKC4/tZqyaazd/hQufyZpy6ew5tl8nr5r/?=
 =?us-ascii?Q?C9UK/Tuamz5HFU/AE/42QwxAmxhHch4UNxEKNId3GcMkPvsrs8ZJDICKLjxG?=
 =?us-ascii?Q?iqdA2ucdeGP1okxsKQLBtz3W07X3OAKjARLpnjH0eiyUI4vYzw2uriOsxOUi?=
 =?us-ascii?Q?w1xr746cl2ZLDG2qpksRTniWMuFR7QdPqYMft0DLsn3wBmzYgR/8+a2GkrHm?=
 =?us-ascii?Q?UH0J1V8fLrjPfefIToMh3Wc9o+A2ixnRHeRIc03p3cZqsNLhfSsQwQ9MCl3b?=
 =?us-ascii?Q?RpD5a4OMyXmavTUY+AXAcxZgxZf7V35f1mo1GDuzgk0yvN3PIPrAU1787uDt?=
 =?us-ascii?Q?iV6AzDa9Sagr++23HDM+LqIgeyAHgUlgpt4Dvpk8AnytCaSZCw4uC5/GKudE?=
 =?us-ascii?Q?6glS/Z0qyatb2qv2BP3gt/voVN/fNtlWXJdtgZzix8RGTxqhCmU6JiDdwY4o?=
 =?us-ascii?Q?LRoPjZEhifSVsvjIBY0uuPxNiqo2gE9AY+0LvW8yl1RtJsABsVTdxW9rlFOb?=
 =?us-ascii?Q?S86hPm4GSGaMp0K+2O7U6myC15Zol/JhSlAP/xhV6peZCb2cRBNNG6vXNjbS?=
 =?us-ascii?Q?lO576xkOejnfxSSytkCIJAoBlkwWCg7hkqwNI/hjmrH0lAcGFCr/RiidFKcz?=
 =?us-ascii?Q?VZXg57kOGgGC69nE/LO8bfSbWzJtWcvRBbQXZvFXbw9hzaTaLNR10qf0/SpR?=
 =?us-ascii?Q?K0mtViJyZV3NFuVZqTsiEz7KD8rrdV217XccUbLmnRiZvanu0wJhUH7gQcrL?=
 =?us-ascii?Q?1J6+qf34AtFLiQZ5UfmLcacAxtSzl2W+a+Qdirv+a+5VSVLqBX7iemrsZy3z?=
 =?us-ascii?Q?pQ/Sse5l4LW8PWQYs42B1JWskmA2oAsWNQbv1I9p2n52j6qPV4TM/jGKEvXq?=
 =?us-ascii?Q?HCaT8ol923wbfVzYL145/TbJMCgp8bruU5hHEVYd1WGTwjLZOBduuEhZbQCp?=
 =?us-ascii?Q?/wXlxnw9qRWhgyaWaJElyDAK/0rRG5s3LwpwsXforMPedv24aQYZWFOYxJuu?=
 =?us-ascii?Q?qQ3fflf+cnpdkdoueXOo78br6nVM4VWgNApSY7v0HtxJSCKRPiN3ly4mXeoB?=
 =?us-ascii?Q?POtiLu6/8YGaNMydiU8QPfVmvQo0wwNiR3c4fLBBm2nUgljUelIS2ZDcRFMQ?=
 =?us-ascii?Q?nTlexYdDjsrORQtncxUl1mEVi38CnX/w838a/OROo+l4/qT7XzsRUEOInps6?=
 =?us-ascii?Q?vv2MimaTAwpH5bRSRvnZ6Q4e65DZk/SnOg6EDKVh8Gacztqe2TIcllwAAE/e?=
 =?us-ascii?Q?1FYDJw=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f27aecf-ed38-4d6e-d07c-08db73e72a2a
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2023 12:41:28.6354
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2t43w4o4ThBsQuQlacUNvI0w79zfHqvrB61kORr7p39v61iU/v9O6MsgSuV51/FFasLpy/pmxtJHpk0Xlaz+oZb7ZnBgYeTs/79kAkTXA88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR13MB5467
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
Cc: ricklind@us.ibm.com, netdev@vger.kernel.org, danymadden@us.ibm.com, haren@linux.ibm.com, edumazet@google.com, npiggin@gmail.com, tlfalcon@linux.ibm.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 23, 2023 at 09:52:26AM +0200, Simon Horman wrote:
> + maintainers and blamed authors

A second time, because something went wrong with the first attempt.

> On Thu, Jun 22, 2023 at 02:03:32PM -0500, Nick Child wrote:
> > All ibmvnic resets, make a call to netdev_tx_reset_queue() when
> > re-opening the device. netdev_tx_reset_queue() resets the num_queued
> > and num_completed byte counters. These stats are used in Byte Queue
> > Limit (BQL) algorithms. The difference between these two stats tracks
> > the number of bytes currently sitting on the physical NIC. ibmvnic
> > increases the number of queued bytes though calls to
> > netdev_tx_sent_queue() in the drivers xmit function. When, VIOS reports
> > that it is done transmitting bytes, the ibmvnic device increases the
> > number of completed bytes through calls to netdev_tx_completed_queue().
> > It is important to note that the driver batches its transmit calls and
> > num_queued is increased every time that an skb is added to the next
> > batch, not necessarily when the batch is sent to VIOS for transmission.
> > 
> > Unlike other reset types, a NON FATAL reset will not flush the sub crq
> > tx buffers. Therefore, it is possible for the batched skb array to be
> > partially full. So if there is call to netdev_tx_reset_queue() when
> > re-opening the device, the value of num_queued (0) would not account
> > for the skb's that are currently batched. Eventually, when the batch
> > is sent to VIOS, the call to netdev_tx_completed_queue() would increase
> > num_completed to a value greater than the num_queued. This causes a
> > BUG_ON crash:
> > 
> > ibmvnic 30000002: Firmware reports error, cause: adapter problem.
> > Starting recovery...
> > ibmvnic 30000002: tx error 600
> > ibmvnic 30000002: tx error 600
> > ibmvnic 30000002: tx error 600
> > ibmvnic 30000002: tx error 600
> > ------------[ cut here ]------------
> > kernel BUG at lib/dynamic_queue_limits.c:27!
> > Oops: Exception in kernel mode, sig: 5
> > [....]
> > NIP dql_completed+0x28/0x1c0
> > LR ibmvnic_complete_tx.isra.0+0x23c/0x420 [ibmvnic]
> > Call Trace:
> > ibmvnic_complete_tx.isra.0+0x3f8/0x420 [ibmvnic] (unreliable)
> > ibmvnic_interrupt_tx+0x40/0x70 [ibmvnic]
> > __handle_irq_event_percpu+0x98/0x270
> > ---[ end trace ]---
> > 
> > Therefore, do not reset the dql stats when performing a NON_FATAL reset.
> > Simply clearing the queues off bit is sufficient.
> > 
> > Fixes: 0d973388185d ("ibmvnic: Introduce xmit_more support using batched subCRQ hcalls")
> > Signed-off-by: Nick Child <nnac123@linux.ibm.com>
> > ---
> >  drivers/net/ethernet/ibm/ibmvnic.c | 13 ++++++++++++-
> >  1 file changed, 12 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
> > index c63d3ec9d328..5523ab52ff2b 100644
> > --- a/drivers/net/ethernet/ibm/ibmvnic.c
> > +++ b/drivers/net/ethernet/ibm/ibmvnic.c
> > @@ -1816,7 +1816,18 @@ static int __ibmvnic_open(struct net_device *netdev)
> >  		if (prev_state == VNIC_CLOSED)
> >  			enable_irq(adapter->tx_scrq[i]->irq);
> >  		enable_scrq_irq(adapter, adapter->tx_scrq[i]);
> > -		netdev_tx_reset_queue(netdev_get_tx_queue(netdev, i));
> > +		/* netdev_tx_reset_queue will reset dql stats and set the stacks
> > +		 * flag for queue status. During NON_FATAL resets, just
> > +		 * clear the bit, don't reset the stats because there could
> > +		 * be batched skb's waiting to be sent. If we reset dql stats,
> > +		 * we risk num_completed being greater than num_queued.
> > +		 * This will cause a BUG_ON in dql_completed().
> > +		 */
> > +		if (adapter->reset_reason == VNIC_RESET_NON_FATAL)
> > +			clear_bit(__QUEUE_STATE_STACK_XOFF,
> > +				  &netdev_get_tx_queue(netdev, i)->state);
> > +		else
> > +			netdev_tx_reset_queue(netdev_get_tx_queue(netdev, i));
> >  	}
> >  
> >  	rc = set_link_state(adapter, IBMVNIC_LOGICAL_LNK_UP);
> > -- 
> > 2.31.1
> > 
> > 
