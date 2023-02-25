Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1CD6A2AB1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 17:21:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PPBpb1PdJz3c9V
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Feb 2023 03:21:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=PXeUl/Dv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=1420409688=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=PXeUl/Dv;
	dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PPBnZ5kjtz3bgx
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Feb 2023 03:20:32 +1100 (AEDT)
Received: from pps.filterd (m0250809.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31PGB7IV021764;
	Sat, 25 Feb 2023 08:20:19 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=b+48mzWW7PjbxF/5kfmpWw0ciLVg8yEn7ogquc3WFoE=;
 b=PXeUl/DvJqQn6dNe5dnTgUHHW2gUS5WSk98OeQTf0fmqCwQV4LcDRd62R+w4PIKbjEBN
 aGmdv5MGE75arc1ToFbGJISIPC8BB17nxSP6g/hmVWHVKC3ogde7Uk8ORFo55WfGGhMo
 WAPjuT6VkqwcN/NGKIUG+cGQNm9m+U8nHIRUQRFUsHs1Hzm1ora503bARcM0bGyH+V8U
 jGNSxwaoDQT2UYKLx/jqzXrXDhhwBnQqO5xCVoBn+D6DgRGJMy4QnfgLyfcOASCKxWZH
 QOimN4eWLORqFL8/mx3mGsR+gD/HMjkzS5wqeoFNrit8/6dAxgBXfCdlpcxXq44D13yN vw== 
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyjqr83qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Feb 2023 08:20:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LCQpIl80pO8u6+2HT5nqSpq7YRaTnKHCIzY1lDhkq0FX2MVqby4ywjkgj3ewHrSeePUrv8ccCy+TsY/ijFoadsSoseQjnpvbTRuQy3/uAyZIPHxr/8VIaMuoRnmpl249Q5wCXyF24ekqZqicNU2c1CJMC30rob/1tehpNU5tkY0etrQQSxFjQBLrv0/ALBDASMjXI/TZauIwL/abe0baItbHOugztQBBOBamB6hpM9hqUKOm03ZEdogmKoSHRGLI/rv/AujGPmlYdPkhb08HPVMpDyC31Udjer5d+mkSY5vf2YhmO9/tOyQ6bqqAN0+Nb6P5y7Wsa0N6prieOOtxdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b+48mzWW7PjbxF/5kfmpWw0ciLVg8yEn7ogquc3WFoE=;
 b=agWYB9jAFhJJB5g68JKnea2TEv5yCvGnMfICqhPFfu+ntV/9Jgg2hljzAtNw8guh1C0MFArxnCYSqW66JRP3AQprHjEWTQreyfY5n0EUeDMgo1QCfBdjgZVYTCM74dRUBctWWfxwKPr8VuU3qv0fo6KH6Rhy6uFOG/XygYipy82Bj0gzjf9GfgTToFBh4UUeSLJF7vud6IgiYfi2WS35cFwfn3EdtQljNfCCFdxKsfFPeF3ReQL7x57PyvwBW/Z7joqTeIoj48O63AFOZ9k3mINR4YIzTM+kkA9w+RnhSDP4/Z9LjBKufCbwZ2+jdMu5wBIa8qbIZwrlL0BgFvr8wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by CH3PR11MB7937.namprd11.prod.outlook.com (2603:10b6:610:12c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Sat, 25 Feb
 2023 16:20:16 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::d4bc:86a0:7a8b:3899]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::d4bc:86a0:7a8b:3899%9]) with mapi id 15.20.6134.025; Sat, 25 Feb 2023
 16:20:16 +0000
Date: Sat, 25 Feb 2023 11:20:12 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Message-ID: <Y/o1PDFnLr/cdXHk@windriver.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
 <211175b3-bae9-4f66-8532-fe48c6421180@csgroup.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <211175b3-bae9-4f66-8532-fe48c6421180@csgroup.eu>
X-ClientProxiedBy: YT4PR01CA0134.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d5::15) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|CH3PR11MB7937:EE_
X-MS-Office365-Filtering-Correlation-Id: 3440de96-60f0-4980-ffef-08db174c2e0c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	+x/cQHHceSIQHSQLXif6ip7P5vUwdhl5nWlBVeFrkDG5x9RAUcVGDqTRDu4SG0uTFl9OjAEFN0r8fm80ydrzOXYcUanb577XA5RGUzPhnO6vQQyMQp8H14hdEbFyX5t3cJFCRanMOyHaF481EA6nEDUHyZrNbCRzx8O2P3YZX2Xi10MuVZY8t871qciBzsbS+roYhKj87lnsSccsqHBqLqEBMsfn0Cwd7n2mU/vhzI2Lfy6wJk/CI0ElZJ8nwcQd3winDFGtlb4AhgrwY46UnNUWz0X8wkltDwi1AI+p+QfM7JyJTyATYrkx7rKs2tUjujpIsj6mTRTPfjZcUzsWf8b//FajoyvM3UgzBN3zEu56owC1w2K+BmZPafehjjv3FW/Ae67nggUgNodwzuCBCIwHJsXszIM9r+oH2vx0hdAwFy4CCwNtfj9x0gzHrTtOn79xr6c/CqOhZtv2Hc8AJ249696ONv5iqbO1gIpKIxxCc0Of5uKB15rBuFb71vrEQlrsEWprGHHxH0D4LXzTEmbiCEYxXblDFyOkbUipzqeB7t/juJ+POU2PpK64HpsJsZ6Aq6WgzeoIVngin7srhgRjqlyKy2/uySgfrA8zd5rJeu+Th7T5IZfr8/fdBcUs
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(366004)(136003)(396003)(39850400004)(346002)(376002)(451199018)(38100700002)(8936002)(6916009)(66946007)(66476007)(4326008)(66556008)(8676002)(41300700001)(44832011)(2906002)(5660300002)(478600001)(6512007)(6506007)(6666004)(186003)(26005)(2616005)(6486002)(966005)(83380400001)(316002)(36756003)(86362001)(54906003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?HVgow0YUPmpuXhTQEW6hlPpTrr5BNMlFnK66zBd4lKS6Ct3kZiuZ7pz/QcdT?=
 =?us-ascii?Q?05Lq1h0qQ9byc0NcqwLJINO8sRY4dd/Hi3R9VXHhvXLasj4+/L9i03PzMHyN?=
 =?us-ascii?Q?7sbRC2h7/JMCTCjKxnXopFOs0tMJupRPAvfoVoRLZCBHiVNkA5XCZFJYmyHS?=
 =?us-ascii?Q?otvW8DSw0RNbi0JGNxvUd5QL8/IDeJcSgP70MTIc/dusMy+eAMH5dueKJlfM?=
 =?us-ascii?Q?aheA+bdNMW6a4VPg+ug0SXrchFYkM23YX9vgE8GglzUnt2BB5VCLv3g4Lx0u?=
 =?us-ascii?Q?cjU2YSI4bsatku/FVHho+M6WbxiQ4yZCXuxNTmMoE61usqRGfhIPcRt8NmMb?=
 =?us-ascii?Q?d2avGtZUNP9gbpFNABot/LssuDfaJLampOHW1sWa2P2V+YsgTNSITU0fWQ6T?=
 =?us-ascii?Q?s64c1znSLIHAfXYam8xg6XOGJdpKXgqtUcTIT67W76CGh0olfQoTJROuK51E?=
 =?us-ascii?Q?E5cSljnLF9t1JAjI9ASr7bUy98V0tyo7OPEjlCIa7QEFcqhc5EH5kYPdLjOB?=
 =?us-ascii?Q?gXzF87itTPnpbLXy2FPeWynCijyeDwEGN9e2MEW/qwei6sJJ6K9dHfK4XgBX?=
 =?us-ascii?Q?PuWRO8kQ95jnj+1IqWKz1UUZKQSptN4T9c6aOCuMLgIQ9li4LouBcuNPrtPR?=
 =?us-ascii?Q?wVGyRv0jyjsvzsmOa9ItAe85ZXGFlUIAnoFIqN//xt52Pu01V/fontRb4ruV?=
 =?us-ascii?Q?wn96nU0VpYsMRxGfiuYMc23zQ/y1JJFA2zJQpMef2Gk4hcTC0YXfcfoczzto?=
 =?us-ascii?Q?gJzg2Gtzk4Xo4Hx+CK41wa2hAs7ysV6ui0rOHlVsF9GbDPrSWqckuPwfZoFD?=
 =?us-ascii?Q?onLp6MzbN31J5ccevFLH+OE0aBOYNNpllMNnZTchYhaBXdiwB56nSbfOxqkD?=
 =?us-ascii?Q?ozliRbTBE3r//Azc4AUaG+oQUUHEGmGjxwLNyWPOVBw092YGTW/FgkvBvnvC?=
 =?us-ascii?Q?TLXO8PTTj4b2t7T+YGeilbq6LNsHmrghUwTxQnXIxjdWIzYEEtqCZG3KuvfD?=
 =?us-ascii?Q?0rbjEX7bzfPJd2FVq6f1DdqNqwTG4t69OrKVuHuR0yTeFyqZIO5/08CVmmpo?=
 =?us-ascii?Q?5hbQm1EwBatajdfyyB1KDniuQBOxXmVhrBQE5IiygADMuuWrf1ZFIn+h3OTZ?=
 =?us-ascii?Q?colMDemVFBlWgrTo2tgGlbM3rjaCwQAPuJYH7dmiVedip1/NavFZAqYhXO0y?=
 =?us-ascii?Q?yhxQOyro1IhX4dm5SsQyRzwhnGeNJyl87ikowAAz9v8hZk3pHgq9tgV1GEZe?=
 =?us-ascii?Q?lAtGYw3PvDKOqppxS6mVeFls5EQQ7hTG960TuhBxrbCGoFWfBn5fuVt/8YU+?=
 =?us-ascii?Q?sbZsl6nkbvX3zO1EQfB7ECkjM3JJhgCzFNMxFJ0b5r5NIfOc/vuu57qCb2hK?=
 =?us-ascii?Q?rswMRmObgH0JAgS/DsdnXx7MsTTtg7xog1VoxAqNIxhh07PO35OMOyVM44VG?=
 =?us-ascii?Q?4puSEK+gLyG2n9RX77Ponp8JPz5cwkKCYLNkD0ipX9V3bk/kjLqH0qkRRAgF?=
 =?us-ascii?Q?2/yZadSvqjNbsQeSBYdaVCIauSgc0151LgheHpeMdvsySKUgig5YFwF2EUCd?=
 =?us-ascii?Q?QIjYCDxNVk3QnaQ+SNDBGhsfGQZTWKjH68dx+RPPP+CQYPv311PWYoSOuDPO?=
 =?us-ascii?Q?lpkHHpqjPC5UwVdl7vSgb+s=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3440de96-60f0-4980-ffef-08db174c2e0c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2023 16:20:16.2333
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: I7SiwWFiae/k6janYvO2gYYHgrDAZhnlnSKCpDZ664ZDDEKDcX/fTtkyIY8C47qMRXJm1wdugVM4rjKvwjKPTXTTCvjhXzjZKtu/FX7jDDE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7937
X-Proofpoint-GUID: SfDx0RF0qbRBdUw_bbE4bqhtAaLIfoEQ
X-Proofpoint-ORIG-GUID: SfDx0RF0qbRBdUw_bbE4bqhtAaLIfoEQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-25_10,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0 clxscore=1011
 malwarescore=0 impostorscore=0 mlxlogscore=645 mlxscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302250136
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
Cc: Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, Claudiu Manoil <claudiu.manoil@nxp.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, Li Yang <leoyang.li@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms] On 25/02/2023 (Sat 07:40) Christophe Leroy wrote:

> 
> 
> Le 20/02/2023 ?? 12:59, Paul Gortmaker a ??crit??:
> > [This RFC is proposed for v6.4 and hence is based off linux-next.]
> > 
> > This series removes support for four e300 (MPC83xx) Freescale processor
> > family evaluation boards that were added to the kernel in the 2006 era.
> > 
> > These boards were all of a very similar form factor, a largish PCI or PCI-X
> > card that could also be used standalone with an external power brick, and
> > all shared the Modular Development System (MDS) designation.
> > 
> > These platforms were made in limited quantity and were generally designed
> > to get early silicon into the hands of OEMs who would later develop their
> > own boards/platforms.  As such, availability was limited to those who would
> > be working on boards and/or BSP support.
> > 
> > Many early revision MDS platforms used a mechanical clamping system to hold
> > the BGA CPU in place to facilitate CPU updates -- something not normally
> > possible for a soldered down BGA in a COTS system.
> > 
> > The point of these details is to give context that reflects that these four
> > boards were made in limited quantities, were not in a form factor that is
> > really "hobbyist" friendly and hence make sense for removal 17 years later.
> > 
> > Here, we remove the MPC8548E-MDS[1], the MPC8360E-MDS[2], the
> > MPC837xE-MDS[3], and the MPC832x-MDS[4] board support from the kernel.
> > 
> > There will still exist several e300 Freescale Reference Design System (RDS)
> > boards[5] and mini-ITX boards[6] with support in the kernel.  While these
> > were more of a COTS "ready to deploy" design more suited to hobbyists, it
> > probably makes sense to consider removing these as well, based on age.
> 
> Those boards are still being sold, see 
> https://www.components-store.fr/product/NXP-Semiconductors-Freescale/MPC8323E-RDB.html 
> they have 4600 pieces in stock.

Just to clarify for others - your link is for RDB boards - which I said
should be considered, but are not touched in this series.

Secondly, even if there may exist a large amount of NOS (New Old Stock)
of RDB boards from 15+ years ago - the reality is that they will only be
used in small quantities to repair legacy STB or similar - where no
hardware upgrade path exists.  That corner case will happen w/o changing
firmware or software (i.e. u-boot or kernel).

I can assure you that no sane company is going to take a 2006 STB/PVR
and do a software update to a 6.4 kernel.  That would go against decades
of Product Life Cycle experience, and would be inviting disaster as you
go up the wrong side of the bathtub curve.

As for hobbyists - feel free to go ahead and e-mail the folks at your
components-store link and ask for a quote, since they don't list a
price.  When you get an answer of $800-$2000 USD - tell me who is going
buy one vs. a modern PC.  Oh, and ask if they have next day shipping,
since they claim to have 4600 in stock - which also seems very suspect,
or a horribly bad investment on their part.

Don't get me wrong - I appreciate the input, but I don't think it really
alters what the right thing to do is for the 6.4+ kernel.

Thanks,
Paul.
--

> 
> Christophe
