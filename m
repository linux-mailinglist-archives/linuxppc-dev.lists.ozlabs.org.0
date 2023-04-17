Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D3B6E4C96
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Apr 2023 17:17:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q0Vz05HFYz3cdR
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Apr 2023 01:17:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=b7Nw6r9w;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=3471abd109=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=b7Nw6r9w;
	dkim-atps=neutral
X-Greylist: delayed 936 seconds by postgrey-1.36 at boromir; Tue, 18 Apr 2023 01:16:28 AEST
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q0Vy473jWz3cMr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Apr 2023 01:16:26 +1000 (AEST)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33HDmOdW015512;
	Mon, 17 Apr 2023 15:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=JiFgLnV6XxoI/mu1S7aAYlTsq1r9nIeaPKZCfcwAszo=;
 b=b7Nw6r9wXJv9Blwec13uqryt1zSVlVIZXo8oZcQivh8AVC3FY0FNCjfMmVMSQ4MsduVY
 bJ2gu0qH6FPtKbRUKM9hAfP7jP21iWDTXbyal/+BSrtmW3phBAJMkHPpJRqaZtfUUwRf
 3OQNkPAXsUFyb+oN87bKXpTOoVjy3FEMyzPIzTJlJqRZyXLKMGRZ9PvhJA/xGJoIn0Gl
 g/IznsEbI6QffUqMcQzqr6BVAt9jLuIG3YnSzM9zsafIaDxRrjf6/B54Co1g0qJrmeOc
 Cm7x4npmgTwWCe33c/R8nDSYIWtm/yEhUqRH2M+kFOC1B3OOlfeOUQbbRGidEoU6Eh++ HQ== 
Received: from nam04-mw2-obe.outbound.protection.outlook.com (mail-mw2nam04lp2169.outbound.protection.outlook.com [104.47.73.169])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3pyh53jvk9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Apr 2023 15:00:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UsPcCH9oRftRAy9A4cYON5SAPeF/u6pBgg91U/hLr/fhJn4VyYT0z3nHN7yeZVpnso3C4+JV27wrpGWuHEYY6P568AXeYpVpdw/jh404hQ9SYNidoD9BW6jkOVttq6MGdT3EgMryhbOg5fTJx+g5Pp17DWVv0WLxWZBv1NrX1SI7OnxKsKzDlm6npOWjNxNat5ugfGxOwvAVVYo21MQ4qnTlcG2fW9lgCbL0aBtHzRH1fbpztMiLij9KLxTm32EHl+smPa/wCHhEObbXebHSUiTlCA/WXg/PqirAuVU4DcfGIntRl5+IXT6iGPB5TsZ4N9ryfDKjKxjs066+QfiJRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JiFgLnV6XxoI/mu1S7aAYlTsq1r9nIeaPKZCfcwAszo=;
 b=TLaHiRrPu+TzhFe6H/hO0pJC28yLwGQJaYQaHlpKbUvRxlzxOS45v4yvslvpvkGBQ24AhJGPPZBRnFZWMoWPwm9AQjplYTsyqXqyHKs/K+gj+XZVhe3lE9IJXhAe3bI1/pQSIWkYxu8bHcncKa9uaPk8YFI1km3AOJ0ElcBt2rp1ru27M+WNya7dFu0a4iYrxN66nxfomg/lYXlELoGvSFQbomIDis1I/gffro281qKsD6khtM3fgiD8r6XqNQnW+A6sTFo9BMBhOdYEoAr7A+XeBry58foQCnEzk2ugiaZSKEOarcNeKMCgSH/Bnjqcw3Qv1ncetEf2PGK3CkYG1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by PH7PR11MB8252.namprd11.prod.outlook.com (2603:10b6:510:1aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Mon, 17 Apr
 2023 15:00:06 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::61d5:7319:52f0:cc4b]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::61d5:7319:52f0:cc4b%4]) with mapi id 15.20.6298.045; Mon, 17 Apr 2023
 15:00:06 +0000
Date: Mon, 17 Apr 2023 11:00:02 -0400
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Leo Li <leoyang.li@nxp.com>
Subject: Re: [RFC PATCH 0/4] Remove some e500/MPC85xx evaluation platforms
Message-ID: <ZD1e8ujPlrCeYiuo@windriver.com>
References: <20230221194637.28436-1-paul.gortmaker@windriver.com>
 <CADRPPNTyGPZOLwb5e20_FxwkpJ4ayt7VrgAEDgg7XqYSha3vMg@mail.gmail.com>
 <87o7nr9png.fsf@mpe.ellerman.id.au>
 <AM0PR04MB628965937FB711C2DA3A20FF8F999@AM0PR04MB6289.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB628965937FB711C2DA3A20FF8F999@AM0PR04MB6289.eurprd04.prod.outlook.com>
X-ClientProxiedBy: YT4PR01CA0220.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:eb::16) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|PH7PR11MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: 823e57f0-31fd-4242-a5ae-08db3f546e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Ffe/uNBoVz/aSqUsWWzn6N9Z09VjWjdxCTLOaG++kZQp26NWR59Pqc6sQNKNHFKh/GvCw16HdsT9Nm6JNI2AsTmtRlkORx1Bg4Hp7IeBED8/72VFa893/Ngc5iDwNh0qvIxYrIYvlL11NIAbkuxsmK5rg6T0fWgRLncQ8pwp3sjW4BWAw15/8kyd1yZPKaCnz7ngMCNb/6QN2mvThISVrnTREkeDq8yR32DKGpA6AZkwW9oL3MGrFblU6xfMppGJPq0n5dUpF0K+kOnb6k/al0vOSGxtCt6AEV4+WCoejFBgKyIIGRf3Uy9U2KfjX9+X7/Utq0cfpq5HzLgninP21w+E2JiMwxsndgO/wX2yJCKCoUkfJUMLjqmyfLbNyBNRRZP22KCQFQwsEJbEHkteYkN+6SXc8pMAhv+y74EAeaRn8pCTMFyCAgZ46n+OHBuf62yyZJounZypXrxJRl93Hp/d+zwQk7PTGqTiQwtw4JvNjOXcCjBDDM1O/dnJHni6xaoqWMRHyQkNGW9wZRAbssx00kZnrCtVhpvFJD/hKbyyRdL7xNBlPGDG92W0H3W6
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(39850400004)(396003)(366004)(346002)(136003)(451199021)(5660300002)(8936002)(54906003)(478600001)(6666004)(6916009)(41300700001)(83380400001)(8676002)(44832011)(4326008)(66556008)(6486002)(66476007)(66946007)(316002)(6506007)(26005)(6512007)(186003)(53546011)(2906002)(66899021)(2616005)(38100700002)(86362001)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?DZ8q8rTA4JG3UHhoTItzmJoQy/OHu4JZaHBaxn2fWxbZXHBF/ND6/TJrC5OI?=
 =?us-ascii?Q?qRtFb65O3BsdQ8vwNEAQU3ep7w/OvulK2Af22UxpVjmwiffOMsEynrzt7r5Y?=
 =?us-ascii?Q?VrK1TTkrXeZjuCUYmR2Bm/3eWT6qJx9L4VduRIoUppsJMwl2hny9Ks/SHj8+?=
 =?us-ascii?Q?XEbKT37D52iaXqXreu0A9e+UgIKLJyoIZKJ77Zbau2jTwQNtUB/zVt2saTyE?=
 =?us-ascii?Q?IODWgF49mv/ov9wnqKkMcYfGG9GayIyn6OUWGo+yJ9IcLLl04PfbUN27k7LL?=
 =?us-ascii?Q?Rbp3NNF/3SOsqtivU/8cAIV9P8JYGqwKt0p8WcPxzCT3cICG+bUUOyo0/Orm?=
 =?us-ascii?Q?qk1WT7uqk/qAn3lBxFlg+1gMSt6oAoUz+enCsLvM32Q7HVIr3wkxCC8eM0lb?=
 =?us-ascii?Q?ZYKyBc3h0H3cmaeE5GnnrboTVUszEgmZWvAJbH8LyoFIvVcIhl1n4nDB8m9g?=
 =?us-ascii?Q?EViZT3XzYrrMf1b4MXL7p2tUm3/tSARhLlU6VGvNA+7jlLIQk6Tz6HxSActP?=
 =?us-ascii?Q?dQUhrZAVHG4S+rcXyrt5UxlP0i9bThqKdN4JPi33VNoiz3oiMjodXef7MKUG?=
 =?us-ascii?Q?aWLJwI2tQqqFtGqaTYEhqsZgt/+aI7Z1LzdQTnOLWMeuetGRC4eHTkf8weUd?=
 =?us-ascii?Q?BuRYfyHzIdJX+IDFtYldCI9hTpj5Wk/MoWp+ScwMb8jQ+4KgP/Idb0JNM1Kq?=
 =?us-ascii?Q?tkBYQSROxAN+ANRdeqeMeU5BE2WXxdtnUv3/1R0FlFwHimzZzn6uDFtOYKSh?=
 =?us-ascii?Q?1t281ATXhmsw9buGVB38YtCCw65SyIJZ0CLYqjp1xvnybXcloq/wkmzzRkt7?=
 =?us-ascii?Q?ithXBo2HuKRdNEorpQcQ+8lQH58bTCuoMZRNr6YuLO+Kg3UmIQBkrpke4UEp?=
 =?us-ascii?Q?VIB07hjjQkIK+IQ9XVXPHF/XI4S3WJzSLzNbahumNfVQpB9+VOTRYLtm7gjT?=
 =?us-ascii?Q?cTsUNvsgybsvROxS9Xcw3n3SkcDbl/ZQO95LQlUF/y79a8L8CLItSQERimBB?=
 =?us-ascii?Q?E2dGWqpfC8wvhhyda3C2fuVOUeMmSC5IKWtahTOWX8EPfS4AqSGoXYuBwHV7?=
 =?us-ascii?Q?tLFfOthG21bnC8QkqJLUk06PKQLqOmu9VoSM9LrncEUAb0hLP8mMd1a/1DGa?=
 =?us-ascii?Q?97Ta9Hi4aDeSqzyG82aX5OoHI9u3hm1wccsS2hfJgGtcb3TT2J4h4WQnm/Rp?=
 =?us-ascii?Q?WJw2ztnKcj6f0l3qTCf63Zx1vRE82E4VAIRXJnVi5hV53V3PlwUYPM04yqxj?=
 =?us-ascii?Q?CXIz04zzMuoCx1RhYMdIvG8FLi+tewhLKlsl8dOUsMxGj+CwsSUrI8GSzXZX?=
 =?us-ascii?Q?06RNpzgsDD1WCocrgnAhB1eqAwJCwJlCZnAvV3uc+HZSfM5ZFbbk9kGl6nO/?=
 =?us-ascii?Q?Cg/A1cjY1WucCzfjv4J1CkVVDgfkR7DcasHiompjuD8G5n+Ov9FNvi2qZR9H?=
 =?us-ascii?Q?/yfjqhal6N0Oi+IVS7GziSpkcrB2mZs2dHk7M0IBwo/1yTi9juQhzH4k0z1y?=
 =?us-ascii?Q?WncsKDFTjOChkiU8sO/B57ZvyjAbApWT2SQhNL4rxnJmFbVRtCLT8Z1LnIAo?=
 =?us-ascii?Q?KurIV+nK7LjvZqtZ9ynxY7UtkMOIU7XJXp48BRJrs3WkqMOUvMmE14L5evfC?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 823e57f0-31fd-4242-a5ae-08db3f546e7c
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 15:00:06.8223
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AHnmtz0HhXsETnPlFB02OAgbfflhSI77+Mki3SOxTgNop6IPAsNOx4LPfQAlyOIih/bILVa31jNLfnPhRMLWkK+x6jwOihFMt8rPqErAr/4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8252
X-Proofpoint-GUID: jviO2qcv3iqYQqSEDYe3YbmMVgfXNdkI
X-Proofpoint-ORIG-GUID: jviO2qcv3iqYQqSEDYe3YbmMVgfXNdkI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-17_10,2023-04-17_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 mlxscore=0 adultscore=0 mlxlogscore=497
 impostorscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304170134
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
Cc: Pali Roh??r <pali@kernel.org>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[RE: [RFC PATCH 0/4] Remove some e500/MPC85xx evaluation platforms] On 14/04/2023 (Fri 23:29) Leo Li wrote:

> 
> 
> > -----Original Message-----
> > From: Michael Ellerman <mpe@ellerman.id.au>
> > Sent: Thursday, April 13, 2023 9:14 PM
> > To: Leo Li <leoyang.li@nxp.com>; Paul Gortmaker
> > <paul.gortmaker@windriver.com>
> > Cc: Scott Wood <oss@buserror.net>; Paul Mackerras <paulus@samba.org>;
> > Claudiu Manoil <claudiu.manoil@nxp.com>; linuxppc-dev@lists.ozlabs.org;
> > Pali Roh??r <pali@kernel.org>
> > Subject: Re: [RFC PATCH 0/4] Remove some e500/MPC85xx evaluation
> > platforms
> > 
> > Li Yang <leoyang.li@nxp.com> writes:
> > > On Tue, Feb 21, 2023 at 1:52???PM Paul Gortmaker
> > > <paul.gortmaker@windriver.com> wrote:
> > >>
> > >> [This RFC is proposed for v6.4 and hence is based off linux-next.]
> > >>
> > >> In a similar theme to the e300/MPC83xx evaluation platform
> > >> removal[1], this targets removal of some 13 --> 21 year old
> > >> e500/MPC85xx evaluation boards that were produced in limited numbers
> > >> and primarily made available to hardware/software developers to shape
> > their own boards and BSPs.
> > >
> > > These e500 platforms are similar to the e300 platforms that they are
> > > still being shipped, the targeting market probably caused it to have a
> > > longer life cycle.
> > >
> > ...
> > >
> > > The difference here from the e300 platforms is that MPC8540ADS,
> > > MPC8560ADS, MPC8548CDS, MPC8568-MDS are the only reference
> > platforms
> > > supplied by us for these SoCs.  We don't have a separation of
> > > evaluation platforms vs product-like platforms like we did later.
> > > That probably means even if they don't look like "hobbyist" friendly
> > > they are more likely to be still in use.
> > 
> > OK. But what is the chance anyone is booting upstream kernels on them?
> 
> We do still have these parts shipped, which means that there are definitely active users of these silicons.  But it is really hard to say how many of they are running latest upstream kernel.  IMO, if the nature of the application is critical it is likely they will need to update the kernel to get all the security fixes.  And the reference board will be helpful as a starting point when they update the kernel.

I think the right thing to do here with this series is to remove the
super ancient 20+ year old MPC8540ADS and MPC8560ADS; and leave the
slightly more modern ones for another day in the future.

I don't think anyone can realistically argue against that?

Paul.
--

> 
> > 
> > I assume no one at NXP is testing upstream on those boards?
> 
> To be frank they are not included in the routine tests carried out by the development team now which is not ideal to me.  But I think the support team are probably willing to help on issues with latest kernel when needed.
> 
> Regards,
> Leo
