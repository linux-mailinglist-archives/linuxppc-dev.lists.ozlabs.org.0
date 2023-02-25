Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B93AA6A2AE2
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Feb 2023 17:52:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PPCV34pkHz3cTk
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Feb 2023 03:52:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=Ro5dE6FE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.166.238; helo=mx0a-0064b401.pphosted.com; envelope-from=prvs=1420409688=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=Ro5dE6FE;
	dkim-atps=neutral
Received: from mx0a-0064b401.pphosted.com (mx0a-0064b401.pphosted.com [205.220.166.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PPCT46GVnz3bck
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Feb 2023 03:51:18 +1100 (AEDT)
Received: from pps.filterd (m0250810.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31PGmbw5029091;
	Sat, 25 Feb 2023 08:51:02 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=cic78opLPLykN9BeZb8LNcZSwZnK/Dr//0c7rsanoxw=;
 b=Ro5dE6FE7HlZTEImJYnLI5dDEo/CdS+bmJe8c3VfTOfZ0wk7Uij4SDTQDSkCXZ+7wzQA
 JfLBBhkM8DbEQzLDZSgG+A8OzZ8HmL1/EFaCDPHCnRGKItvN47Ao/uNQMVA0Kx2ggwDu
 uQ483Vmwnj8dzltAM4RX8CFF6oGWkqBB7eaHXz69VCtpNkxKbT3F4oF6wfrwBwMTm3/U
 wwkQ8s81PGy3KKY+NKxTLZE0+qfYgudKUVZmJElKhEBzbhTlbaPzDv+C0ouDwu1JcA3Z
 zJmh/i+7kIjZA3W2X5sLTIsGLiAkzZQ/u1fmypHLolxqokMfQSUZooR3ANSF8gxMijUN bQ== 
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nyeg889xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 25 Feb 2023 08:51:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hmJvtJy76Gt5yQMpbhL+LLuznObkpfg8Lg7vpq4nvIZ2kG9BZK986j0JXqH8scKuYxLqlIV1ZJjlAoP9RAI/4g4nyaIpSABOEbR9tUSNxCu3mXyKvuarwKU8vzBU/IHEd2BcQhazBcgcjeMwoWMIRM0BZadOfXEitIt6pQXoQrhi+MU+5MMdXOLwadG69W9szJQcRLUnvikrKGjFstcOuLx0yt2AF3GRJArNRjQybp02nJqvV9I/ES6gDqsUIUXRTG1QXTCftHs01MCXjJmzP5wEWwSTUa0SpEFdx23goEpeA2re3qfQWXK3SB4NcOt27wkZwOvA245vIfKrZPvH6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cic78opLPLykN9BeZb8LNcZSwZnK/Dr//0c7rsanoxw=;
 b=O3VO8q4KaCg0g5q6qk7zxAapgjjqLRGfIAOkuX8xamh7UV+Zczha2ebnSHxIue9brMtYlf1hJOYqbvFeS0sOgxmNmbEknOkebU1xW2W51gLtXDK3jKgrYO8Cnym5Caw0VOAa+5HsOXVbBvAXJxT7iWZPnwd6fpg9zMrZPQkv0SjdBJKTYlx38PhtwKovHz+YsqpP9P7lVQr49HrUOu2Q4dyLDYmJWuLz2VY5tq8fFPnlnPAQHcga69HTMlXVtenSYtCNk3ml2plhyVngbic6alk27+dQlHyBcq6djqkXU/ofTMci20NnSSRnBLWiVQ8F+xm/r8jZyysLBN0ivgNqCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by SJ0PR11MB5086.namprd11.prod.outlook.com (2603:10b6:a03:2d1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Sat, 25 Feb
 2023 16:50:58 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::d4bc:86a0:7a8b:3899]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::d4bc:86a0:7a8b:3899%9]) with mapi id 15.20.6134.025; Sat, 25 Feb 2023
 16:50:58 +0000
Date: Sat, 25 Feb 2023 11:50:53 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Leo Li <leoyang.li@nxp.com>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Message-ID: <Y/o8bQz5CuRhdD8B@windriver.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
X-ClientProxiedBy: YT4P288CA0086.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d0::20) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|SJ0PR11MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d2455b1-0ab7-43e6-f328-08db17507819
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zl3KLC5AuB1IlLEo1WvWG7y55xiDhtNOk1v2/q32RXPelbrAF+4NDUuCji18wKjLBI4gfW+JrJC0/K/gH+SRd+VAAgclXfJCcItr0TEzlb+qeXsZm3ydLNZYniOYq6df7sQpvxsFI11Oj9Dz4S7Ls+tjrKZgC/qac+425aIZSMe9b/3Wx5if4W4iIJEvLe/HGCSnJKA0ImvFng4FK7/u5mWZJG77S7IT0m7i7A9s44xJmUCFncKOcMgdmakVkxHguPUtfNPlZjdhImU755xvSqdjM2BxaIcTNnsSZpqTbUVVNBmxhYHYEGj7v0kWsDsBuynYedzZYcl9vfh3YCLEvIPjkX4wR6lTnlusbXWMNmxFEKhbNLTPYnKA4AcwliP+Bs5jM9CZUUpBDKStd1ad81gXeCeFFImHtUZpaAoN+XiTh9BGlxqF6fVi9ZDbTWwRcHeEZn1hY/UdUn2UOGoq1gb0Xoi0e4Ksjzv4p67T6c1iPFFSTpGKlCyBZA2PDTj71ipfqTCt1P65vTNDm2HaP3YhOkB1gwNlPb/BJV/BjvZ+BT/h3ziZ67c2/PcOp5H26T3mJXmDhohPOb4WYKuKwiBs7towVvGHC/u9GPkDkaCKQUBXgLCu9FO2baUxY+636vI4QLdsz+s3hfFs9rrm2A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(136003)(346002)(376002)(396003)(39850400004)(366004)(451199018)(8936002)(5660300002)(30864003)(44832011)(2906002)(41300700001)(66556008)(8676002)(4326008)(6916009)(54906003)(66946007)(36756003)(45080400002)(66476007)(478600001)(6486002)(26005)(6506007)(6512007)(6666004)(86362001)(966005)(316002)(53546011)(186003)(2616005)(38100700002)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?I3B3YE6xpmK+Gxmnddom3S72QtyWOyjCNBIEnIEtxwpOhCPG43E8zFYUsaqQ?=
 =?us-ascii?Q?jyePqE/ZCbJ+E2ipVV/IaSeHIwr/az5rzCIfL50QB1INj8E2ApHoaVfQpRKU?=
 =?us-ascii?Q?YqdkGEfoyrq1rnJKG/d9x2y6orLGtVJlEnnMaCw+MW6lsO5VFnvsjADt6V5h?=
 =?us-ascii?Q?eTpaw3Uqh55jYBLWQ4gd0Mz+la5Qyr4JPdV2p/oF6sQT9XXYPsbscRdsrFoE?=
 =?us-ascii?Q?ZCa40fernF3tm303iRrtU/SbPIWrtHuOkQ6JuVI0utnk0S62PhmyxAfLoWTG?=
 =?us-ascii?Q?PGAiKA+MdGD2sc3YhYPtbVLmOrbBUJ1je2nZH0jEsGVviuTx/9A0uw2RslEu?=
 =?us-ascii?Q?v8XOEpXAYZaGF7Wyw+5p3WfCycoDpcie8Uh8LQjsD9//+Mjj8gfHCb7bpu4L?=
 =?us-ascii?Q?bcGkqzzltqtVOWhZ2PeDljqbFRtMFMPOaJM6UR9282dCo37bxdk433FP9wBh?=
 =?us-ascii?Q?fe6KFdk9vSrfP689fcXE3yZfHsrf1u9/2KqqVJAOdmnbF8Xcov8phSPCPEUs?=
 =?us-ascii?Q?wbKRyrIiFUPDKcj1t/+ISdr9zSJ9BNzCXPtnhV80zckDK94LUfUQgVDUc7FU?=
 =?us-ascii?Q?ykZsNOZPYxvdzS1hEp/4apSkgEHn2i4M5KJLLNVPWerTX6zHyCxXgAwHLT7L?=
 =?us-ascii?Q?6vx2B2O4dY6MtTAxT0RXENH0KVfpagja4ygU9JmeM4tH2vvLlY0EzoLoa7aR?=
 =?us-ascii?Q?w+EuWSP1OdnLwu2m43MLUfTt+y1uzfqTigQdwXdy8W5bifPU42CvakxeOqU/?=
 =?us-ascii?Q?babRi9zUAeL/NjoFy1dhEl5al1rgjro/kpL7+lO+ipME6luu8PLjxN9yhfxP?=
 =?us-ascii?Q?r4G0h0S+j97nDVBjT9QLvYzt3D0N9VrIwRAls8Vi8bz33u03wekuQHQ1LjQa?=
 =?us-ascii?Q?mP/3J3OGRCwBjtn24OK8TNc3Eq993WVkpWyEPUY1ioGfU7oSAlVEnS7Ip2M/?=
 =?us-ascii?Q?ff5SWCogXohuZ7pd//I+ORvy2zIyITQCPSSGisT+OffWp0WuHB8Te3epnYIW?=
 =?us-ascii?Q?orTTTZmOJU5EtXNapNbXjolhUC3vmSGIWlM+ykkvcFM3MTd/UL+U+ihs/GlV?=
 =?us-ascii?Q?w1U+uTkj/mgmNf5T09jl2yQvLvZv2imHdwlhPeLKK9LbsqzaOJuGRZjW/CtZ?=
 =?us-ascii?Q?ywPhxp4VC2Da8ogWmOMlTnXoXWw9D89tmzTw2rXNqz5UmZy0qa9Fth7Nns9F?=
 =?us-ascii?Q?7rSwDPPhr8Km9psZlcYSZFsHHrQQ+1kfQ3OzV2rh1AO4gjgB9BCyntD7P50E?=
 =?us-ascii?Q?4cUvyNQWDZhzrGtNYA504kujwLhI68QuQNjW2zHiAFwGm6peqKsKpMkKuDrt?=
 =?us-ascii?Q?ETxLqw83f4byGiSMpeTcdLFoScH0Wkvkk7s33nC5wlZ7+Qh+h2pHwtsiVn1K?=
 =?us-ascii?Q?xF9h049K1YnwI1H7Thx1qkh/zelI0KK6Ou+SnBqFy9s/nb511QPZARg20zU3?=
 =?us-ascii?Q?Wf42psPfkFXeXiySTX1wL4BKl5ZuY0o+NKtS5PyqiGEEP2KSGMhQge4BPoMM?=
 =?us-ascii?Q?+1UJRfZLMMrvpgjs33ti6T8uPYg2TTJZoWsbYnK7SpgotwTXbW4zcB2GuXO4?=
 =?us-ascii?Q?zOHnLTI4K4bDVgrF0gR1kY6bHLx/XEvZXF7+LDmD9Fq3SbB/eTqND72Jz0gL?=
 =?us-ascii?Q?luCem3jLDTg+/sXpK9X1dbU=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d2455b1-0ab7-43e6-f328-08db17507819
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Feb 2023 16:50:58.3783
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7q0JJer1J21Ez6N3z1k50iSXXGuEQ7ZSGK6l0jKL1gTCB9gcv+zXTqUkTULm4NKyK1uK3bqN2ZQv6RKCoOcfTYXheQH3HxcjR3dESSFeX3E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5086
X-Proofpoint-GUID: y04qJVK-LPi9vJX1Zfzar_MpDaZgqc1L
X-Proofpoint-ORIG-GUID: y04qJVK-LPi9vJX1Zfzar_MpDaZgqc1L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-25_10,2023-02-24_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 clxscore=1015 malwarescore=0 mlxlogscore=582
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302250142
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
Cc: Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[RE: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms] On 24/02/2023 (Fri 21:16) Leo Li wrote:

> 
> 
> > -----Original Message-----
> > From: Paul Gortmaker <paul.gortmaker@windriver.com>
> > Sent: Monday, February 20, 2023 5:59 AM
> > To: linuxppc-dev@lists.ozlabs.org
> > Cc: Leo Li <leoyang.li@nxp.com>; Claudiu Manoil <claudiu.manoil@nxp.com>;
> > Paul Gortmaker <paul.gortmaker@windriver.com>; Scott Wood
> > <oss@buserror.net>; Michael Ellerman <mpe@ellerman.id.au>; Benjamin
> > Herrenschmidt <benh@kernel.crashing.org>; Paul Mackerras
> > <paulus@samba.org>
> > Subject: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
> > 
> > [This RFC is proposed for v6.4 and hence is based off linux-next.]
> > 
> > This series removes support for four e300 (MPC83xx) Freescale processor
> > family evaluation boards that were added to the kernel in the 2006 era.
> 
> Hi Paul,
> 
> I talked with our marketing team on this.  Although we do not recommend any new design with these SoCs, they are still being shipped in large amount to customers now.  Plus it is possible for the bigger amount of existing devices to be updating their software that includes a new kernel.  So we should definitely keep all the common SoC code that might be needed to support their own design.

Thanks for confirming with your marketing team that they "do not
recommend any new design with these SoCs" -- it also confirms the
information I read on the web pages for the platforms.

As those of us immersed in this world all know from the 101 basics of
Product Life Cycle lessons, it doesn't matter if it is a phone or a
set-top-box/PVR or whatever else kind of non-PC consumer device --
kernel uprevs never happen in that product space.

So with the best interests of the mainline kernel in mind, I think we
are good to proceed with this for summer 2023.  And of course as I've
said many times before - the kernel is in git, so really you can't
delete anything anyway - it remains in history forever.

Thanks,
Paul.
--

> 
> > 
> > These boards were all of a very similar form factor, a largish PCI or PCI-X card
> > that could also be used standalone with an external power brick, and all
> > shared the Modular Development System (MDS) designation.
> > 
> > These platforms were made in limited quantity and were generally designed
> > to get early silicon into the hands of OEMs who would later develop their
> > own boards/platforms.  As such, availability was limited to those who would
> > be working on boards and/or BSP support.
> > 
> > Many early revision MDS platforms used a mechanical clamping system to
> > hold the BGA CPU in place to facilitate CPU updates -- something not
> > normally possible for a soldered down BGA in a COTS system.
> > 
> > The point of these details is to give context that reflects that these four
> > boards were made in limited quantities, were not in a form factor that is
> > really "hobbyist" friendly and hence make sense for removal 17 years later.
> 
> We would agree with you that the MDS platforms are only used by a limited number of customers for evaluation purpose, so it should be fine to be removed.  So for this series:
> 
> Acked-by: Li Yang <leoyang.li@nxp.com>
> 
> > 
> > Here, we remove the MPC8548E-MDS[1], the MPC8360E-MDS[2], the
> > MPC837xE-MDS[3], and the MPC832x-MDS[4] board support from the kernel.
> > 
> > There will still exist several e300 Freescale Reference Design System (RDS)
> > boards[5] and mini-ITX boards[6] with support in the kernel.  While these
> > were more of a COTS "ready to deploy" design more suited to hobbyists, it
> > probably makes sense to consider removing these as well, based on age.
> 
> These boards are mass market boards that sold in larger amount and are much more likely to still be used.  We would suggest we keep them for now.
> 
> > 
> > But before we get to that, lets see how this goes -- and then we should look
> > at similar early e500 evaluation platforms [MPC8540-ADS, etc] next, as the
> > oldest there date back to 2002[7] -- before considering RDB/mITX.
> > 
> > I intentionally didn't put any links in the commits, since as we all know, they
> > tend not to be stable long term, so keep them here in the merge data.
> > Credit to NXP for keeping around these old legacy docs this long!
> > 
> > Paul.
> > 
> > --
> > 
> > [1]
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww
> > .nxp.com%2Fdesign%2Fqoriq-developer-resources%2Fmpc8349e-modular-
> > development-
> > system%3AMPC8349EMDS&data=05%7C01%7Cleoyang.li%40nxp.com%7Ca2
> > 820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> > 7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> > MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300
> > 0%7C%7C%7C&sdata=Q4COgwpjsE4mHXvl9HdGo3otPCYML3z%2FR6IoCEYRE
> > wg%3D&reserved=0
> > [2]
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww
> > .nxp.com%2Fdocs%2Fen%2Fuser-
> > guide%2FMPC8360EMDSUM.pdf&data=05%7C01%7Cleoyang.li%40nxp.com
> > %7Ca2820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c30
> > 1635%7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8ey
> > JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> > 7C3000%7C%7C%7C&sdata=JyLT0MfGAHQ8a%2FNgpLdVFtyACkwPR%2FOkB
> > yN1aW0wySs%3D&reserved=0
> > [3]
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww
> > .nxp.com%2Fproducts%2Fprocessors-and-microcontrollers%2Flegacy-mpu-
> > mcus%2Fpowerquicc-processors%2Fpowerquicc-iii-mpc85xx%2Fmpc837xe-
> > modular-development-
> > system%3AMPC837XEMDS&data=05%7C01%7Cleoyang.li%40nxp.com%7Ca2
> > 820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%
> > 7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoi
> > MC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C300
> > 0%7C%7C%7C&sdata=052dpEEcGmbuhRLnMDCNoOkTeguF%2BPA0oJGNvV1
> > jSjI%3D&reserved=0
> > [4]
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww
> > .nxp.com%2Fproducts%2Fprocessors-and-microcontrollers%2Flegacy-mpu-
> > mcus%2Fpowerquicc-processors%2Fpowerquicc-ii-pro-mpc83xx%2Flow-
> > power-powerquicc-ii-pro-processor-with-ddr2-tdm-pci-security-usb-quicc-
> > engine-with-
> > utopia%3AMPC8323E&data=05%7C01%7Cleoyang.li%40nxp.com%7Ca2820c1
> > e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%
> > 7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4
> > wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7
> > C%7C%7C&sdata=mZQh%2FogNgNUb0wNJV972kYIDvn61gx0TWNd1u1d7PZ
> > Q%3D&reserved=0
> > [5]
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww
> > .nxp.com%2Fdocs%2Fen%2Ffact-
> > sheet%2FMPC8379ERDBFS.pdf&data=05%7C01%7Cleoyang.li%40nxp.com%7
> > Ca2820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c3016
> > 35%7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJ
> > WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> > 7C3000%7C%7C%7C&sdata=EJmP6Regr7zpvYvHUmX64h3LZSaBT3Mb1h%2BN
> > KQT%2FUls%3D&reserved=0
> > [6]
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww
> > .digikey.ca%2Fen%2Fproducts%2Fdetail%2Fnxp-usa-inc%2FMPC8349E-MITX-
> > GP%2F1204733&data=05%7C01%7Cleoyang.li%40nxp.com%7Ca2820c1e44264
> > 0c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C1%7
> > C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAw
> > MDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%
> > 7C&sdata=hw6IQDUaXH6huQFCnCkFIbNfj1xMrq%2FanDMUU%2FXZYQg%3
> > D&reserved=0
> > [7]
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww
> > .nxp.com%2Fdocs%2Fen%2Freference-
> > manual%2FMPC8560ADSUG.pdf&data=05%7C01%7Cleoyang.li%40nxp.com%
> > 7Ca2820c1e442640c5a39108db1339fd9f%7C686ea1d3bc2b4c6fa92cd99c5c301
> > 635%7C0%7C1%7C638124912025220501%7CUnknown%7CTWFpbGZsb3d8eyJ
> > WIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%
> > 7C3000%7C%7C%7C&sdata=Ed%2BZR07y9Sp8xx5H47SAXzk9ET73creygxk%2B
> > emmbfuA%3D&reserved=0
> > 
> > Cc: Scott Wood <oss@buserror.net>
> > Cc: Michael Ellerman <mpe@ellerman.id.au>
> > Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> > Cc: Paul Mackerras <paulus@samba.org>
> > Cc: Li Yang <leoyang.li@nxp.com>
> > Cc: Claudiu Manoil <claudiu.manoil@nxp.com>
> > 
> > ---
> > 
> > Paul Gortmaker (4):
> >   powerpc: drop MPC834x_MDS platform support
> >   powerpc: drop MPC836x_MDS platform support
> >   powerpc: drop MPC837x_MDS platform support
> >   powerpc: drop MPC832x_MDS platform support
> > 
> >  arch/powerpc/boot/Makefile                    |   1 -
> >  arch/powerpc/boot/dts/mpc832x_mds.dts         | 436 ---------------
> >  arch/powerpc/boot/dts/mpc834x_mds.dts         | 403 --------------
> >  arch/powerpc/boot/dts/mpc836x_mds.dts         | 481 -----------------
> >  arch/powerpc/boot/dts/mpc8377_mds.dts         | 505 ------------------
> >  arch/powerpc/boot/dts/mpc8378_mds.dts         | 489 -----------------
> >  arch/powerpc/boot/dts/mpc8379_mds.dts         | 455 ----------------
> >  .../configs/83xx/mpc832x_mds_defconfig        |  59 --
> >  .../configs/83xx/mpc834x_mds_defconfig        |  58 --
> >  .../configs/83xx/mpc836x_mds_defconfig        |  64 ---
> >  .../configs/83xx/mpc837x_mds_defconfig        |  58 --
> >  arch/powerpc/configs/mpc83xx_defconfig        |   4 -
> >  arch/powerpc/configs/ppc6xx_defconfig         |   4 -
> >  arch/powerpc/platforms/83xx/Kconfig           |  32 --
> >  arch/powerpc/platforms/83xx/Makefile          |   4 -
> >  arch/powerpc/platforms/83xx/mpc832x_mds.c     | 110 ----
> >  arch/powerpc/platforms/83xx/mpc834x_mds.c     | 101 ----
> >  arch/powerpc/platforms/83xx/mpc836x_mds.c     | 210 --------
> >  arch/powerpc/platforms/83xx/mpc837x_mds.c     | 103 ----
> >  19 files changed, 3577 deletions(-)
> >  delete mode 100644 arch/powerpc/boot/dts/mpc832x_mds.dts
> >  delete mode 100644 arch/powerpc/boot/dts/mpc834x_mds.dts
> >  delete mode 100644 arch/powerpc/boot/dts/mpc836x_mds.dts
> >  delete mode 100644 arch/powerpc/boot/dts/mpc8377_mds.dts
> >  delete mode 100644 arch/powerpc/boot/dts/mpc8378_mds.dts
> >  delete mode 100644 arch/powerpc/boot/dts/mpc8379_mds.dts
> >  delete mode 100644 arch/powerpc/configs/83xx/mpc832x_mds_defconfig
> >  delete mode 100644 arch/powerpc/configs/83xx/mpc834x_mds_defconfig
> >  delete mode 100644 arch/powerpc/configs/83xx/mpc836x_mds_defconfig
> >  delete mode 100644 arch/powerpc/configs/83xx/mpc837x_mds_defconfig
> >  delete mode 100644 arch/powerpc/platforms/83xx/mpc832x_mds.c
> >  delete mode 100644 arch/powerpc/platforms/83xx/mpc834x_mds.c
> >  delete mode 100644 arch/powerpc/platforms/83xx/mpc836x_mds.c
> >  delete mode 100644 arch/powerpc/platforms/83xx/mpc837x_mds.c
> > 
> > --
> > 2.17.1
> 
