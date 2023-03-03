Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AFE6A8E7B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 02:05:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PSVCH2zDsz3cQk
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Mar 2023 12:05:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=aWL3YHfX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=windriver.com (client-ip=205.220.178.238; helo=mx0b-0064b401.pphosted.com; envelope-from=prvs=2426d6b7e7=paul.gortmaker@windriver.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=windriver.com header.i=@windriver.com header.a=rsa-sha256 header.s=PPS06212021 header.b=aWL3YHfX;
	dkim-atps=neutral
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PSVBJ2YYHz3c65
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Mar 2023 12:04:54 +1100 (AEDT)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3230Pw4g007926;
	Fri, 3 Mar 2023 01:04:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com; h=date : from : to :
 cc : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=PPS06212021;
 bh=lXS+bsL9EemQkXqWwMkUCleQQ7Jw945iRk4wQybKCOs=;
 b=aWL3YHfXANGXqvFD/n5tEiUNUv1oazgN9IphJzzxMS3GZvBsLnJRPJqxkCk0Vpi26jvC
 bmq5RmaUfVWXZuI0Xiz3xKgBcI3BVeIz4yODfas1v/eVNDXbLbesaVBJ7Df4bz9N+StV
 Nxu3mhnVgiyj/er29rmMy7UZaEaHXQHKXlclkQ2Uhl4VUc/emha+wMcElXc00OHWwiu5
 kNqQbFHLvIkbRLvIy3rEWLP6sMbmn5Z4aNHwrko6+SjT8IGXHnBBzhfhpAHqkhIhSlwr
 7MZYxWnvlZUZxVgvMd/SkGE4IdfHRmbv/bROByjDXjD3Xpk1Qu9UTO2wTvNUnQaWxDug mg== 
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 3nybmke4w2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 03 Mar 2023 01:04:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=akM6EOng9J++Jw8kxrh3YmFlw0am77yRq18EToc7xRpcgHdRe/9FGXshL6IX5l6n8KoUZbT6vV97nwSS72XPDbXusAJO3awW3mkup0ayYlb0ZuDPbBV2Eu8vzqfkAKyvXUb7ZkinPatYo79JGmmAn0t9HqAu/ve1eO/uQRHT1qXbbXQUGl19sbPidPFmzkNA6ogiKtAKC4QUtYisMugukINZYqv86VzMpYD5acKeYZB8kxAgFuZIC9V5bqr1oRwQN/wOz2dgae8EUTRVNJdT8DDiDnEW0ecVd2elh+J4J4t37KzPlq/0oClgbHiWLeer0yB4dZGFbX2sANd2uXiwOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXS+bsL9EemQkXqWwMkUCleQQ7Jw945iRk4wQybKCOs=;
 b=UfwaEPyN1nitGfHUUnRQWq7WXZtA3MpFZTMMQ79mC33kTdHbcY8IKVQHY1oSTVF3sxZIF27SaBnlryp+icCPlyVjvpLbIDh3ruucKZiiTjd/lwgXJe5UNt+Q4NYGEzN5ED1um4z0jv0zR8zm/ypyhsJAwy0UYPU1/J6+a5mPuzM6xTh+h2McSlSq/dQArAgWeDxEmqW5k3OcghUTsgcwF3Y9IDJ8LkvEWGr5KC6rWiJiIGVeVVD4bzZwDL+PQUIbmYwh8kXYbi7FOs9tb8X0QSyr49nSfK5GrksOnawcGt3q1Cyf/WFqNktdmkfpWgepJVMx5Q1yNdvoP+WHnWF1Rw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from IA0PR11MB7378.namprd11.prod.outlook.com (2603:10b6:208:432::8)
 by SA1PR11MB6944.namprd11.prod.outlook.com (2603:10b6:806:2bb::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.18; Fri, 3 Mar
 2023 01:04:36 +0000
Received: from IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::d4bc:86a0:7a8b:3899]) by IA0PR11MB7378.namprd11.prod.outlook.com
 ([fe80::d4bc:86a0:7a8b:3899%9]) with mapi id 15.20.6156.019; Fri, 3 Mar 2023
 01:04:36 +0000
Date: Thu, 2 Mar 2023 20:04:29 -0500
From: Paul Gortmaker <paul.gortmaker@windriver.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms
Message-ID: <ZAFHnaSN6F5ZYTO5@windriver.com>
References: <20230220115913.25811-1-paul.gortmaker@windriver.com>
 <AM0PR04MB6289FA528F76DDADB2BB0F958FA89@AM0PR04MB6289.eurprd04.prod.outlook.com>
 <Y/o8bQz5CuRhdD8B@windriver.com>
 <CADRPPNRTZmhEbS0Ts6iA7bmviT_C+caUkyFwJ5WGcN6q1rTORg@mail.gmail.com>
 <1b9d4d586ae7bb5cddbb97fbc9ec7de1c475afee.camel@infinera.com>
 <83565b97-8149-492e-8f22-e3722e659b98@app.fastmail.com>
 <a1e955cb-f48d-4630-6c9d-2fb3e2212aff@csgroup.eu>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a1e955cb-f48d-4630-6c9d-2fb3e2212aff@csgroup.eu>
X-ClientProxiedBy: BY5PR20CA0014.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::27) To IA0PR11MB7378.namprd11.prod.outlook.com
 (2603:10b6:208:432::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7378:EE_|SA1PR11MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: 53930903-3238-4d6c-e01e-08db1b8341be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	6G+GQhvLpwEK+NIBxuJtVsS5ALGeuttbiIFT5rUpR1davxEopDjDq2RKHStHd55tqbFYMFH5YvrhMlvj5nL+Wp/z2R4sMTQ+Fs74nDDBj4r5f4hIhyiXegqtKRckiFyd9RqxR1MJbMa8wISSRAWb2zIpuEmbKvNzHQMdUjPKWx67XHbUaMvWbuch0dxUNTaRUfzrg5miqYBor+VCb2Gh0cda3uf+emhWERnauxOckfP6nTShYKmlGPcqMmDAZYi1jpPg67Wffi4PUKbsGwc0XGrkjT5ZRnJJda50vF2ZDbx525zwZuXZJSgZ32ybIDPDWYqUUiw6xMHCz4rQpW/Cd8NeOBSpK0avwGJexf8RJ7eRccPFxWJ7Rgyq1dtbfOKbuIWDYMM75gLR3PgatecIN8PeC8SIgH1tazm6gDfsNOc5vjXO+vS95XW2sIOLX/8Cmy0PGSrP08icEHN99rL7/+sHW6/+DJka+pbC6IqVhHpZykBDcklp+7TlaKYV1EykN1wNxHK1EGmMdhjQD5lGmKzRckkr59OBMzVqIHh6y00tDm5s9rXOtQy3luGQvmLC6n1LSaGOsXbaOa3RXnTw+omo5L2MrFi2mvJLZ3slr54MYQ8EGFX6EtDn9PBl0aCUtsyaIm2P99Lr3QKrrO/RFVr8eywgaWTHq9AHQbdBPF/cIkU43RGhFPDlM6t1IndR
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB7378.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(4636009)(376002)(396003)(39850400004)(136003)(346002)(366004)(451199018)(6486002)(5660300002)(66476007)(4326008)(83380400001)(36756003)(8936002)(41300700001)(66946007)(2906002)(66556008)(8676002)(316002)(44832011)(38100700002)(6916009)(26005)(6506007)(6512007)(186003)(6666004)(2616005)(86362001)(54906003)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?yhRqvYOIZMJr1gn+iNnCr1nTbi9ld8at/K4NE8yyo19xtm47E//vvyeOnttA?=
 =?us-ascii?Q?epDdzinzkzQmT4kgxIxAIHWbY88WiLetRPhpiqccib5tP+vjbIYxp5fFeIxW?=
 =?us-ascii?Q?COjPLWvOB5Aafnf6LdnMaShnqUmekeIH67HZpWPqQFQe3LYcLt08odpuGKQN?=
 =?us-ascii?Q?hsFw3ymAoaZRHNHwbp7zUonnv9Ee005A2+jDJORuytsKR1hn2K48IctgcZUf?=
 =?us-ascii?Q?RyYkihFIhgKCx52YxFS7UsfH6ceOOkg+i4odseOKt8//YaatXuRj5qrsrLLl?=
 =?us-ascii?Q?IIkYpOycQosjFXnEUQN+wv0P1v0Y0+C4SiOA+zUkyJT1+dOOcmv61s8M/Zbo?=
 =?us-ascii?Q?BMzAyiM8IenMjdyiUBMwSm6ifjJPLfDQ4UquIX0CniTozdkm1bjXcGe+CE0R?=
 =?us-ascii?Q?eSd6lHrLzeL+CcziKCjBvR69eAQp8NMcTU4F5uEOU1bKOoq8wbkIFC9PGmPA?=
 =?us-ascii?Q?zsdJQcXlGvYEQ6is6B/bTEbOIbGi0+VhCbEfo5g+pRaqg53/TGxYXeuwGahp?=
 =?us-ascii?Q?+d88RFYkVE0vRLEnkMR5sXCi5eOGSKUszHYVJjk6rVTTZG+cLTO+uudV5SsY?=
 =?us-ascii?Q?CaIPfeD9h2epvAhAnT3RoS9k4YnTfC5lfNoij2k/isnQb4ikutLEqSKI8Xhl?=
 =?us-ascii?Q?tMa3i9MSg+tEukzaR2Ud7Gu2/oZjxY9URgTlefsiwiZyPZVShEPK16G55qXD?=
 =?us-ascii?Q?qXaVQ/VybngWSNL50dzKbrLueYr6k571Wy6inW+UtTz5fdgi6lRKSC+3PJ75?=
 =?us-ascii?Q?+RDK+nkzsd975oGv6Gwyq6wUujlitYTIDo8zYOczqdjo0QyCMMUD/bDNmrnm?=
 =?us-ascii?Q?JSKnAtbBZRm7azlHrCtryWNQMyc7x8LUzwO9DqwgY/XSMQxZJZ3qn+dnzIDN?=
 =?us-ascii?Q?DLYyDc2nSd/PP4B/kyANfwilSyKbCtcQmWSwNj4xb0GQA2gUQG8mSPQymQzN?=
 =?us-ascii?Q?U2+UdDLCp1thz3n2oVRFDmGynTgAJqqaZ+45hHEcpZ8/OS3U3fgbzK0kgamA?=
 =?us-ascii?Q?oV3z5wylNoQcQ518+gtRzwO70WGH5/iaFe6atZLn/C2a3zUE5IusxmVaCSC5?=
 =?us-ascii?Q?gRoFLTHhMoiBgYTjjASidNWuw59itCpG54hjCWVvh7C8KpQ0QhIljAZmE877?=
 =?us-ascii?Q?pbiEaE4AHM/WQnNAvo1RVhOVIKPUZG36G33kWmr5WMDs+vOd/+1CDnGXUpqe?=
 =?us-ascii?Q?rir4kNpLc+NIki9fmOn7aXRKEFbbFUyPqH8zC00Sd/8k8Z67Br3D59MYR08h?=
 =?us-ascii?Q?CKwDtQZYEwM/i36Cs4gmoJWPYKgjuiTMbeuRec7R2KQAfixH6PJo7Xfnq6NA?=
 =?us-ascii?Q?6a1vbIHKr6+bR8b6XSlNBsvv//UX3OQKXQ8gw5joNQHwKxaQkQV4C76bq0O+?=
 =?us-ascii?Q?B0fb3wnYR+/46qCwdt11cVgnDRGxigk9Ax/kv//ailVL5FfnRLlV7ZHyt8Q9?=
 =?us-ascii?Q?1Koow7OkfHar8md7TtapO57l0Xwq0glWTH4lylMsrZPGH8SCv6aW1uZ0Vvgb?=
 =?us-ascii?Q?hWr5hgZ+YsI7wmA02B+WTFAQAzk1k8U7f8d6Y/ccbfRsEgUINFmtWyTuE5m9?=
 =?us-ascii?Q?KEur+ubOrgiOvvLowJ9bzwOE2jIatkAREvgr74GzziY9TldUixi2sDM6enCc?=
 =?us-ascii?Q?Q9LY3UNwIHO6dgbRc+919as=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53930903-3238-4d6c-e01e-08db1b8341be
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7378.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2023 01:04:36.2751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WAbUJp+QT3w43Cx8eHks+ITZDQCjBHuQcWWLXoySWgoq8xXEAdMuZcZUN48nsJCqqJpWn18A27F83h6mOLGogQO+zbhBpW4EF9+5IuGiZo8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6944
X-Proofpoint-GUID: ixua-XVIZvC8GqEOO2nDvig4XdM9TOKH
X-Proofpoint-ORIG-GUID: ixua-XVIZvC8GqEOO2nDvig4XdM9TOKH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_15,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 clxscore=1011 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303030005
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
Cc: Arnd Bergmann <arnd@arndb.de>, Leo Li <leoyang.li@nxp.com>, Scott Wood <oss@buserror.net>, Claudiu Manoil <claudiu.manoil@nxp.com>, Paul Mackerras <paulus@samba.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[Re: [RFC PATCH 0/4] Remove some e300/MPC83xx evaluation platforms] On 01/03/2023 (Wed 14:23) Christophe Leroy wrote:

> 
> 
> Le 28/02/2023 ?? 18:51, Arnd Bergmann a ??crit??:
> > On Tue, Feb 28, 2023, at 11:03, Joakim Tjernlund wrote:
> >> On Mon, 2023-02-27 at 14:48 -0600, Li Yang wrote:
> >>>>>>
> >>>>>> Here, we remove the MPC8548E-MDS[1], the MPC8360E-MDS[2], the
> >>>>>> MPC837xE-MDS[3], and the MPC832x-MDS[4] board support from the kernel.
> >>>>>>
> >>>>>> There will still exist several e300 Freescale Reference Design System (RDS)
> >>>>>> boards[5] and mini-ITX boards[6] with support in the kernel.  While these
> >>>>>> were more of a COTS "ready to deploy" design more suited to hobbyists, it
> >>>>>> probably makes sense to consider removing these as well, based on age.
> >>>>>
> >>>>> These boards are mass market boards that sold in larger amount and are much more likely to still be used.  We would suggest we keep them for now.
> >>
> >> Agreed, the RDS design is still used here.
> > 
> > Can you elaborate what the typical kernel upgrade schedule for
> > these boards?
> > 
> > Note that for the debate about dropping the machines from future
> > kernels, it does not really matter how many remaining users there
> > are or how many boards get sold. The only question is whether
> > someone is still planning to provide upgrades to kernels later
> > than linux-6.3 in the future.
> > 
> > It sounds like there are commercial requirements for validating
> > and distributing kernel upgrades (in addition to hobbyist uses), so
> > I would expect that whoever is paying for the upgrades has a clear
> > plan for how much longer they are going to do that, or at least
> > a some idea of how many of the previous LTS kernels (5.10, 5.15,
> > 6.1) ended up actually getting shipped to users.
> > 
> > It may be worth pointing out that the official webpage for
> > the MPC8313ERDB board in the example only lists a hilariously
> > outdated BSP kernel based on a patched linux-2.6.23 release,
> > so maybe the marketing team can change that to point to the
> > latest validated LTS kernel instead.
> 
> Let me present things in a slightly different way.
> 
> My company has designed and manufactured and sold communication systems 
> embedding three types of boards:
> - First generation, with MPC 866, designed around 2002.
> - Second generation, with MPC 885, designed around 2010.
> - Third generation, with MPC 8321, designed around 2014.
> 
> When NXP announced end of life of MPC 866 and 885, we bought enough CPUs 
> to be able to produce boards for the 10 following years so we still 
> produce some.
> 
> MPC 8321 is still in production.
> 
> All those boards are used in critical systems where we have a customer 
> requirement to keep all software including U-boot and Linux kernel up to 
> date, for IT security reason mainly.

Firstly, thank you for the detailed reply - I totally appreciate how
framing things with this detail was not without effort on your part.

And your reasons for updating u-boot and the kernel are also valid.

> Until now, the boards were delivered with kernel 4.14, with is due to 
> EOL early next year.
> At the moment we are working on upgrading to mainline kernel with the 
> target being to be able to upgrade our customers to next LTS kernel at 
> the begining of 2024.
> 
> Note that because our kernel code is prehistoric, it is not mergeable to 
> mainline. Not because of licence issues but because the code is just not 
> following at all linux standard. So our boards are not in mainline. Two 
> of them are in U-boot and the third one should soon be as well.
> 
> So, to come back about the RDB boards, we have a couple of MPC 885 ADS 
> and a couple of MPC 8321 RDB. They are reference boards and we always 
> check that a given kernel version properly runs on them before starting 
> to port it to our hardware.

Just as a reminder - I only mentioned RDB "for consideration".  None of
the RDB platforms were removed in this series.  I don't want people to
inadvertently conflate the two.

> Hope it clarifies how those reference boards are used.

It was really useful input and gave an insight into how things get used.

But let me put a slightly different slant on things.  If there is no
maintainer for the platform/architecture/CPU, then where is the
obligation for mainline to keep it up to date just for your company to
use the code/BSP as a reference?

Do they continue to do this for one more year, or three or ...  ???
Does someone list themselves in MAINTAINERS for arch/powerpc/83xx ?

Let us put that aside for now.  I've worked with linux-next for decade+
and have a pretty good idea how all that "upstream stuff" works.

If you have custom out-of-tree BSP and are interested in how upstream
changes impact it, you should have nightly builds pulling down
linux-next and applying your changes and finding when things break.

If you see change 0123abcdef breaks boot on your platform, you have a
legit voice to gripe about it right then and there.  Don't wait!!!

If you instead try and jump from v4.14 to v6.1 in one step, and then 
expect people to bisect on your behalf -- well good luck.

The same applies to RDB boards - doesn't matter if they are in tree or
support is applied manually.  If they are of interest to you, then track
and test regularly.  It will save you a whole lot of bisect effort.

Hope this helps,
Paul.
--

> 
> Christophe
