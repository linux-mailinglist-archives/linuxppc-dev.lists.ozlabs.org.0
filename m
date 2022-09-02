Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 66AF85AADDC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 13:47:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJx3c2tkMz2yy6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 21:47:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M2gNa/TS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nvidia.com (client-ip=52.100.156.237; helo=nam10-dm6-obe.outbound.protection.outlook.com; envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=M2gNa/TS;
	dkim-atps=neutral
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10hn2237.outbound.protection.outlook.com [52.100.156.237])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJx2q1tlFz2xn1
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 21:46:39 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S3YHPTADOwpnthNvVQujTEPJV0pkwfbOR1Ekob9suyk4gr3nVOplijct3IENBctv7z1dMecEViZ/261r7UPRH7Hq3KcCff26Lur44gWaN1diB0+uch/nflIXmkUHt+hM0NdJIaQCcwUWpSz+cW6NsGjmXLGnNQiN4xu/pmXqC0nA4bzE37KhGd18hFbq/w0TxNy3OmCmq28FXWxc9Xqb3zUaA2jHR6iz9Qbs6Slq/xPvZm5M82TWfPjq5obUwNdRGTY9cZwM5UKCgBkyQQjx1yj1FV+QYrW7uTIhnZwktRR8Myy/wrWDQ0coMGd/vkz6iMP0Iju8NVJ+Mw/pSi+P4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kCssVa4sV/8Z1CMABgbFZBN9N0JD7ix8RO/klxBPpv8=;
 b=N8CPlq5zsOpWaQQwRGcBcuCmJwmZN7BeHd8zB6NuT5mXrvyY/q4qPO0m4K4VyI0OV4/pQz67vEr/WxfexX1kp1hTfeNlC7SQOXGfUTIpqJuoQtcfPehAYpp35sn7siqquY6grOA1HVWHV8cbcivxGwJDzyvEzJdM1B4mmwZaQzZRO5Jiw7yBOwdRa8LgvlaMCdjHGq+/Mn8h3yHO7lIgL1Qp9ofeFQq3cZNHBse9NsHU+DzLNYkUUpYxAVxEawmsBMvmGPcAdO/xkngrw54sGEqxGQM+NEsaWYnyEwLin8M6Jhab/WmVrs4CzE4PJjOJUfLQI2DxN4ouCOm7ImN50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kCssVa4sV/8Z1CMABgbFZBN9N0JD7ix8RO/klxBPpv8=;
 b=M2gNa/TSR/pDxR9eRWzq5AK3ao/e40GaUGW03LBy1dCEuiM2to2Dnh9BQGU7Vr67i962YxqujkWNoc0O4vUgvJpRiw2/EYGMh6pLrkPp5E7wCgwS0xdIWExxuryvyZvEkD53RyO9VtQaQwMTYzwidwAkXyZrV8tWsNYDWrrYqKP65ICoJ0mRo9SUnIEDzPncpQ/QDFJsAl5F+5qnbU7tfrRHN/Sem+/fXXmp1J9ifwfU99vCqmNKNMoE35+J5Sob8hdDa+2wvrvkQMuylWiju5PpBYh5j86JPp7AwF3+TMSipaQQ62enh3jTCl/ir4oplSBEYlTfJA1vJpy5kKm+vg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB4181.namprd12.prod.outlook.com (2603:10b6:610:a8::16)
 by MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.14; Fri, 2 Sep
 2022 11:46:20 +0000
Received: from CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::3d9f:c18a:7310:ae46]) by CH2PR12MB4181.namprd12.prod.outlook.com
 ([fe80::3d9f:c18a:7310:ae46%8]) with mapi id 15.20.5588.014; Fri, 2 Sep 2022
 11:46:20 +0000
Date: Fri, 2 Sep 2022 08:46:19 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH kernel 0/3] powerpc/iommu: Add iommu_ops to report
 capabilities and allow blocking domains
Message-ID: <YxHtC5xw9KBZ6hSc@nvidia.com>
References: <20220714081822.3717693-1-aik@ozlabs.ru>
 <YxFMWs3c+m/rubVk@nvidia.com>
 <87tu5qtelx.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tu5qtelx.fsf@mpe.ellerman.id.au>
X-ClientProxiedBy: MN2PR20CA0038.namprd20.prod.outlook.com
 (2603:10b6:208:235::7) To CH2PR12MB4181.namprd12.prod.outlook.com
 (2603:10b6:610:a8::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 57813666-c0a3-4db3-6be7-08da8cd8c0d7
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?461vzl8KvrKF+6BKqi/PhJ5/sVeTirDs2+amQyzyfPWVUXx0k23k1JZ2ap8L?=
 =?us-ascii?Q?3cLYgaOCCgFhqrzPFc6Boq3cf8AX6B2NMjfscqV3guKBP/gYycLDi/c6sPWy?=
 =?us-ascii?Q?aeMm9PLmGr6Up7sOUMVO9hD0BHvc4BlmC7poo5I3eAD1WdzSe0c43nH3g5zC?=
 =?us-ascii?Q?ko99igrUFmrD4W4nz7IFmGn7UQdCxe47buVU+s+swhQTkaZFOJaINOuR7xfR?=
 =?us-ascii?Q?K1fdl8VImgh8/GeGYytL7rVF98E7/iGect0ytKYtuwEudKNPi8tk/tkANANE?=
 =?us-ascii?Q?jcOdkw7+iVozOhkojk9t61hso0f0mnmG87Wmh30HbffMcTUXMs4gUOoOaK1N?=
 =?us-ascii?Q?yqSrARbJ24ZyyKRDAsTF5w1e40wbx/hlPeWq/a9rMZxPr/50Q1m63t/EbmR+?=
 =?us-ascii?Q?R+fSP93l7RC+duKjUyzM7NUHd15xqq7vqdautSi7IAxzRhKsPFj6o8zW8mFj?=
 =?us-ascii?Q?he5Jb+H2xGGM7jgCAp8qgBrd+dly+qwQTgNZ1EmTEFsfFCKLaHIrjB0GbiAj?=
 =?us-ascii?Q?gqyR4YgTev6v35QBF2L6+rDnKqKpH1TDduB4R19IlxCOyFy06EbzH6LJiCoP?=
 =?us-ascii?Q?jMWcRs5iM+rgvRrlGt+sEdl4O/YHL3cmVQEeIs1xQZCEnqna7IJzc9XUtKB+?=
 =?us-ascii?Q?Bc4D4VcRfcxbcVtzJYlN4uCJOzFEDVu/9vqGkSGS+v6aOBMxJ82aRYpUn4NO?=
 =?us-ascii?Q?rVHoRAyt6CzqOtm1GZPr50lvN3SAh5ekcyHT0SPnQUZRj08sQKE2W8JAr33f?=
 =?us-ascii?Q?CslttoU2v97QJr42U9WasthHdUv6YUHeY01S4oLrOI4V6hNgUKgMFPYJ0Hru?=
 =?us-ascii?Q?hHAVUMoo39dT6kJYkSNC1/syMIZJikr236d7MI0Gviy7OAO5nfE95de09RZ3?=
 =?us-ascii?Q?Z7PyB1GJGl1QMgLA+/3CzeSOhrD0znGFmLPfhxjEUwRQMeoWCMqP4q4Q4fK6?=
 =?us-ascii?Q?6JHLVVxwRJgIrhO6ikeJiuOqTlBJMMS9t0I5yRxqCOP6coY3DhAtsbkjXa05?=
 =?us-ascii?Q?BdrbmEYmSotU5ZcN6jISGT0pyNZ6pqVD2G5EnSx6zTynQo3dDbNLnHYqxQyw?=
 =?us-ascii?Q?egw1Lr5HJMLwghnSdu95SJaAeP9w4V+njorIuH+sKTrTesiizl57rog46H7S?=
 =?us-ascii?Q?S44WlVEOsYP8pBAckbdcqlC1HKlKt9GOqC3VwGbyO0mo1JcWOyLiT0Qvmbhp?=
 =?us-ascii?Q?gBQd0JTtuTIJyxMyZrVCMpTuNhIdz3pvxse3v7USxOzflN2GvKbZKBVH81b8?=
 =?us-ascii?Q?sPRuGe/lSd1fwi5KwsPk+vseG7Tal43ScEVyFPFQK3GplwpBqfI3bGdaph7x?=
 =?us-ascii?Q?K1qRRAMLKar8BhTqIh2TL+b5s5vNHjmbCGwVes3QgoKWS+ucrItjtaGbLXSA?=
 =?us-ascii?Q?C8YL2LHZAVyvAuB+x5o62LPZLxOa9WxtktufrXc2baUDRd05fQ=3D=3D?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:9;SRV:;IPV:NLI;SFV:SPM;H:CH2PR12MB4181.namprd12.prod.outlook.com;PTR:;CAT:OSPM;SFS:(13230016)(4636009)(366004)(396003)(346002)(39860400002)(376002)(136003)(66476007)(478600001)(41300700001)(26005)(6506007)(54906003)(6512007)(2906002)(36756003)(316002)(86362001)(6916009)(966005)(6486002)(38100700002)(66556008)(2616005)(186003)(7416002)(8936002)(5660300002)(8676002)(4326008)(66946007)(83380400001);DIR:OUT;SFP:1501;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?T/SAlWyBAopDAiZNI+zXPG5bfHFR+6uUin1t0+u+VX+IW2zleclQ41+xYosM?=
 =?us-ascii?Q?41f9iCwQ1KCoJyYaZD0ZS/tPhMEdHgI7iwgUV+6GWPAXSIT+Fbw6RFecpjtD?=
 =?us-ascii?Q?CqbjZDj2wdI4Ajcpy5lle2amKO9JNzRjxt8y5FG39xNZHmNGljzHmBUSaoan?=
 =?us-ascii?Q?M4/9D6yTbLrjJUxwJ7GHzyO78M1fQuKqPPURYyjFqhDQZ3ilMTtWdbZLXUAs?=
 =?us-ascii?Q?l/QigKoGLjLJ3e75xheSiz5uZa2G1IxQKLY0Wi3nsqmASyD2P9faum4jZm68?=
 =?us-ascii?Q?EoCXmfUN10X2RZAO6lhZARWandF+6yEwrpRPod4q5HJidTTJ04wH1NZ19XAc?=
 =?us-ascii?Q?tBmxtgzZhrO9FtofGAaFO00poobLOI2C/DqME4YaWEW3BEamAqevMQk/BVNW?=
 =?us-ascii?Q?CcZnPFPXrqj+jaS8mnkCaq2Lvcb9bur1M+m7GUU0byEFmDmg2B7q2/XHgAsK?=
 =?us-ascii?Q?fIUrOe863MNClSLaLuqt+a7w8TR9gAnwxzllgTpwrn9RUsMOew8iyew3GcZm?=
 =?us-ascii?Q?ESRIVx2LyTU3N07/s2yZEnRWqROvS+wBmQ4W16PYWXSy1SHje4U42VCm+pxy?=
 =?us-ascii?Q?s47YBPb5l8xWwW3LFvk66rGqr4fj2IpgN3UWDPQs/HjFFYbS4DAHX5i89wJP?=
 =?us-ascii?Q?QgBiKTletjHfam6NiK/0U8cIwPo31CmCIXxun24RNsQUIn9rDaAoowh81Ke3?=
 =?us-ascii?Q?dY+TArOEZR3mTYa0HrJKRp7l063ky0PkapgVhDgKSpJsyWHwyIR30lhRk61P?=
 =?us-ascii?Q?Yrxnx+BHvlZnI158fe+TDuT26MqLnxRPXJ6Iv29A4SY4VN2nwe6u0cfH1PgF?=
 =?us-ascii?Q?9WVx2AbevLLR5/Hc0Vpp+dtUg+dAnJCMShL9ysvTJ+RJN3a9+vyVQBpOK7iI?=
 =?us-ascii?Q?yomS+41Zj0hOCXzVgD2licgAQZEzST49qxGz7m13d0AmSgL2JC2XopuYw8wd?=
 =?us-ascii?Q?XTyOJ/hWD5g0t39toCRq4mHXlFHO4UE3NAH5wwz8MRX1CTc4mghB7Y2yRCsO?=
 =?us-ascii?Q?mei7AhQL3LzzmkLYPjLjGcoj7HdeJ9hN5TN1r4KutvVbDigvOGx65u2RYajS?=
 =?us-ascii?Q?NOwU+2PSEBlL6DdE7iPBe52m/QJybLCzgBJBFiiMGkkb67VMd2Qv+lx9QCmY?=
 =?us-ascii?Q?DQot/3ZtQFN8LV77CixXGGoc5VKCkyXL1d76c9qGAnN3B40uYT16eVcG43+z?=
 =?us-ascii?Q?IszEknwY3qipehV5SMQvK1RoThpdFLVXaGbaYJSErlJpcbeKjFNZTEkHjgbB?=
 =?us-ascii?Q?fN0m5OttPsVaWhbLNGiRzHSCA6v6/lvtKS1IYsaEFkdfjaOssNArKZ4Ki0ae?=
 =?us-ascii?Q?dep6zmVgGkXt6/+AVBvDyB8KqeNMHk8fXm1lzgnEPDgvHnl4yL9PFRNApkbD?=
 =?us-ascii?Q?+Tu/7sXHDcV0J/1fbOPIOB3jyJ9ldr6TMLbN1TJcfhBaibNsuZScqnSsAaX4?=
 =?us-ascii?Q?c1wRcOX3O6aKzKsHEaFwJYnWf44QF/TCYB7L6qNcQdlcJYt3tgqA7AhKcP4+?=
 =?us-ascii?Q?VKUcVJn8XNeINg2z46EYnZhqzqbhGnlbNRF3Pvg05PGGpn76aOSh+eWXwRgo?=
 =?us-ascii?Q?FgofSyfZWah6Rc1kP3Jrooj8cW8xLOJUQbH251LN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57813666-c0a3-4db3-6be7-08da8cd8c0d7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4181.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 11:46:20.4545
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CVo6vid+1klUASjEx3KuID21rhLdfE7MvIsWFx9nBFs0qzR97SuzlEM4AL69wf3A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6873
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
Cc: kvm@vger.kernel.org, Fabiano Rosas <farosas@linux.ibm.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, Robin Murphy <robin.murphy@arm.com>, Daniel Henrique Barboza <danielhb413@gmail.com>, Deming Wang <wangdeming@inspur.com>, kvm-ppc@vger.kernel.org, Alex Williamson <alex.williamson@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Murilo Opsfelder Araujo <muriloo@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 02, 2022 at 05:33:30PM +1000, Michael Ellerman wrote:
> Jason Gunthorpe <jgg@nvidia.com> writes:
> > On Thu, Jul 14, 2022 at 06:18:19PM +1000, Alexey Kardashevskiy wrote:
> >> Here is another take on iommu_ops on POWER to make VFIO work
> >> again on POWERPC64.
> >> 
> >> The tree with all prerequisites is here:
> >> https://github.com/aik/linux/tree/kvm-fixes-wip
> >> 
> >> The previous discussion is here:
> >> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20220707135552.3688927-1-aik@ozlabs.ru/
> >> https://patchwork.ozlabs.org/project/kvm-ppc/patch/20220701061751.1955857-1-aik@ozlabs.ru/
> >> 
> >> Please comment. Thanks.
> >>
> >> 
> >> 
> >> Alexey Kardashevskiy (3):
> >>   powerpc/iommu: Add "borrowing" iommu_table_group_ops
> >>   powerpc/pci_64: Init pcibios subsys a bit later
> >>   powerpc/iommu: Add iommu_ops to report capabilities and allow blocking
> >>     domains
> >
> > It has been a little while - and I think this series is still badly
> > needed by powerpc, right?
> 
> Your comments on patch 3 left me with the impression it needed a respin,
> but maybe I misread that.

It would be nice, but I understand Alexey will not work on it anymore,
so I wouldn't object to as-is

> Alexey's reply that it needed testing also made me think it wasn't
> ready to pick up.

Well, if so, someone still needs to finish this work. But I think he
tested it, he fixed things that could have only been found by
testing..

Jason
