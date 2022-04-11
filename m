Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02EE84FB5E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 10:22:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcMKb0TH8z3bcj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 18:22:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=h9qgN+Vy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=ibm.com
 (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com;
 envelope-from=geetika.moolchandani1@ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=h9qgN+Vy; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KcJr96rl2z2xnL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 16:30:16 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 23B5lJHo037176; 
 Mon, 11 Apr 2022 06:29:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : references : in-reply-to : content-type :
 mime-version; s=pp1; bh=fTBQfwzA/ajYQSe8NmLTG2fysUoiYkUW7Z/hnE7gtqw=;
 b=h9qgN+Vygi5mOUvjap96tg0jXutGonlZgpyjAbw3KY8NO30wmX//DSs+2vRki2AP5pOw
 41t+/y/cQeYV/7LSOvKLKC+Ptv+WCOovV74mkQ9XH34mJIwMjKXo0zZBKB6B8I/i7aop
 831r1kMRJ45A0C1lrl6YqS9S2IHAkBH2g97Wy7QYQWQmNN9aXrWtTHpDkvQNyOCn/Bpn
 hhFLwoPNsuCSsYWE+vNyNBhbxNWuSCMfG1fLhVDJLEP84JKdttFPKRJIN+lNa/MYYJ2t
 BNvG3FobdUBSa3wXaPITZotYaxXhwtuxLQANOSq2f2gOZ2pxUGKJeD0OzHTdog0b4YGe aA== 
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3fceg10p5u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 11 Apr 2022 06:29:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZIsRAlMeEEiyhBILbyaqq+Ng2WW/7jRm85XOu04rYjC2njgIknbxfkbK2J5MScXXov8a8S96EeZ6aSZc+/Izi6t8OH2IRhvy3eZoShY9Gh2qsY9uDCvGV6FNsx19uIPrnSlzC4p8jjk+3yjeOToo5uOpq8ksYZGYdfmndiX4pCdCXLq5dO4gNUPHBl/aiAnY+ol6z7Quv/MkWIhjAZcoSveveMfWWoUAcKT4HPqNBhumo1fBe2UqiVJ+sxifmWuPE7wdsagISR6qj1QE8NN6Vy2StlWGkQXBXBqvmmBtGG65jXBNZBzx7S7LIrWApUs0fyhp3b71WLGpJbANBA6BIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTBQfwzA/ajYQSe8NmLTG2fysUoiYkUW7Z/hnE7gtqw=;
 b=jLOKtzGkLmyj0JtPO7bX5zkxGSTh/ZMyuLEEJXoes32JwLhSfw2n5g9lMEy3rOC0MIZ4SiM0k+GDfFcZlB8v1XxNedVvwCURBm/+juNXMF5K73E9cEFBqxcLe4hTJ80XSRh2+saztGKLYqlwnP2W8EyiLfsfQQnCZQAWz5CxxaLTQFitdaniUZL9uPZ6FsGQx8bIlimksQPzBfyGRVpzKGdw09PKZsgzww/nLsY7Z6+ieQKtn0aoSsAIxmNRvP1Gy2y23YEy2mkvq93lgHax1szY1PcP5NKDkDDAC2k6JZ+AMtw359RFPWQOv5Krxrrq1SOzI0d+whTa6PWV5iiDOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=ibm.com; dmarc=pass action=none header.from=ibm.com; dkim=pass
 header.d=ibm.com; arc=none
Received: from SN6PR15MB2256.namprd15.prod.outlook.com (2603:10b6:805:1b::16)
 by BY3PR15MB4914.namprd15.prod.outlook.com (2603:10b6:a03:3c1::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 06:29:55 +0000
Received: from SN6PR15MB2256.namprd15.prod.outlook.com
 ([fe80::47c:4296:b0db:8402]) by SN6PR15MB2256.namprd15.prod.outlook.com
 ([fe80::47c:4296:b0db:8402%5]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 06:29:55 +0000
From: Geetika Moolchandani1 <Geetika.Moolchandani1@ibm.com>
To: Oscar Salvador <osalvador@suse.de>, Srikar Dronamraju
 <srikar@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/numa: Handle partially initialized numa nodes
Thread-Topic: [PATCH] powerpc/numa: Handle partially initialized numa nodes
Thread-Index: AQHYS0PG74qVAW9xE0+kovP9oKDQG6zqQ4m2
Date: Mon, 11 Apr 2022 06:29:55 +0000
Message-ID: <SN6PR15MB2256778D6D0604601B8E05D5BBEA9@SN6PR15MB2256.namprd15.prod.outlook.com>
References: <20220330135123.1868197-1-srikar@linux.vnet.ibm.com>
 <Yk29dMa3H8bk0yST@localhost.localdomain>
 <20220408122537.GD568950@linux.vnet.ibm.com>
In-Reply-To: <20220408122537.GD568950@linux.vnet.ibm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9ddc91d3-c29a-40e6-68c0-08da1b84b17d
x-ms-traffictypediagnostic: BY3PR15MB4914:EE_
x-microsoft-antispam-prvs: <BY3PR15MB491489F7B1D8AB7E8985A83DBBEA9@BY3PR15MB4914.namprd15.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ZYBsueP3/0nTUvNsP4ZkIDBUxKz/UJJmb0ypi+4rVOPK9LVLeMRXzRMVDsMdApmA7PISwBTzVLCbe3lymespQPH19pUMgKR/KbpkW9h+gTVrbAjrtci7h7dmNfJtISTuincKPvbg1icnjFEyGOSeQlw9YyKDsF+ggjkkZFf44DY8okXuWPQN38cHkiuHfSCTvb+Thftsr4Q3P7XPWrnzta+jzoOFheWUv4fawlEICWbzSLFUILvo/xTMsRWVlEgtTJ3bWhB0B80nYw8JOu+Z+UC5PBRd216CCqi3b8MoPgVmq9AfLWD316tJWLmgt/v00xFcZKFFw9fStE8iK/PRIJ8Qfr1zejCacqnEDOHtj3RbrMOufzbq+F6WCrQa5TRChHPNeuu6NMCfebrG/XEOyuffCWHcCAYPz4l0GNiKhRunIWWPJSoNbycCfGoaaARFSsh9CsT3caTLYgyTg97KiNQEa2Gqi4mIo3xrLyt+9hSbnqxwclsosgyMDDFgb/YyeaBNMpjsraqkC3lEif7ffEx9d6CCm2LV9zpTALam4tgEKqMMqatLno17rciOefQ3KYvacfHl0vWT60j44BAPXwNMGSVRuXrCRyX7GNNSt2KYbwVF77UPLQRAKHKZfQHBF4PFzJ8TVHNMO48hyWHW7pbHWeFgJsh5Lfx6zEdSP+V6KtgYRHBdaEQ/4IV7X+V46dOmayfegbkvfGKeGwfaMA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR15MB2256.namprd15.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(76116006)(66556008)(66946007)(71200400001)(8936002)(91956017)(5660300002)(66476007)(38100700002)(38070700005)(55016003)(19627405001)(9686003)(33656002)(7696005)(186003)(6506007)(53546011)(26005)(2906002)(508600001)(86362001)(54906003)(110136005)(83380400001)(122000001)(66446008)(64756008)(52536014)(8676002)(4326008)(316002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?RzXk11t15o+O2XiXCKxQgC4JLwNxJTzbbufB3MHKh+drWOhYKPPCdQxg4x?=
 =?iso-8859-1?Q?59ulAgOiin1KPVwJMJczBt8CQ8uCZ2SbimIL10oqIUUpNqJqJQTSuxgCbD?=
 =?iso-8859-1?Q?o64mNNdoDACduD2ThpnxYHcAbnnYlebUPB/9qM1fS30whRHaHGHQn+LUVG?=
 =?iso-8859-1?Q?1ZJotFaZ6J3YZoljWWN+3AXbFHJhV+/8F66m9fdchzSdW3yRiTVJrgZmXv?=
 =?iso-8859-1?Q?zIe1EngZenJdoQc/qvxCrrUu2XGoK6XRU2gLxfE3Wk947PS43uufVF1K+t?=
 =?iso-8859-1?Q?XjM/xkMXppwXznYev6WBI1zyZCCoqvHyTuGodZfd18TwL8pSfTbx0a81Ua?=
 =?iso-8859-1?Q?ptLeB/GlCJhbHHiF+OdeZ4V+UCfCRwhqaiLcZ0kHqeGKOSCisC2qqagVb8?=
 =?iso-8859-1?Q?qKLAgiEwhE5gQ5ZYqIEag0Cyg6DqZhErD81mblG+9uej+xq5kE+qYNNmql?=
 =?iso-8859-1?Q?LIVHtAK5q/4UacIkvOTQjjM1g4D5pqfyM0qfR3gsb7C8gAWBjPluZu+0Vp?=
 =?iso-8859-1?Q?tQR1W87dg8nmoYlK33pzfC26TsFYAB9/x4lK7xvpv77mORSMgMLFEcmAj3?=
 =?iso-8859-1?Q?ObN6ZfZXKmBDaVq48SKBjWdKSgzDTe2BBJP6XmOpsBXIXA+05Rd3XVtX2U?=
 =?iso-8859-1?Q?FzCmiGbNaO3AwKS6qwIPR9mGRIjwL356Q/krdQfE9m2tDh4obazj3PbeyM?=
 =?iso-8859-1?Q?gtDFKbhEUFO+R+dkzanvCjhGh4/Nu+sTKUJKr1IXWJm3hwOm0CKzSGciUz?=
 =?iso-8859-1?Q?/qFL1QLfXpWP6ppHWf0z9//5MjDmnP2VdicT86mm0/7iMuATdaL3LOoLsP?=
 =?iso-8859-1?Q?9BeJ0aBjCVua2jKxD9HpeiRFl8N0VH9aBv+2EQ40UbJLLFG1fhl1rm/MNk?=
 =?iso-8859-1?Q?IyoxvOfeWEvFuP6G5kl/DyCy0hTsjYHMDneLHkrQC6mnvUdV1bAPZNdmkB?=
 =?iso-8859-1?Q?04LJFoKEx5BthRu8avkMxeva9nFmeBNqz7wib77wijVOa8VxMSEUYBwT1p?=
 =?iso-8859-1?Q?Ge5BjrGMZTKEgKyFyQmVAnB5S7LVrVWsImFEWvZ/7jSrZxsP6um4IcMAyV?=
 =?iso-8859-1?Q?RokxZL4s2U8fBEZxPbUK3CpyubgqFQ+jDh5WZc08Rvw9rfzfx2SCAosznl?=
 =?iso-8859-1?Q?mUzu9kXcMeMVLKyoTEB1SLYw4crbwSPbpYj/2qzO1oW89n72BaJVoe74u3?=
 =?iso-8859-1?Q?sI5AKCjamYAs4YFUZ7Ry1kQBRWzHbKUtOZ4wr6vGfTUgt2Cb3sy4BAM+1F?=
 =?iso-8859-1?Q?rH6UN2nrOkE8+kxfy5P59qSaLf8nVD/NHxhAMClkzD+Mm+5HhpYmsxw5Ra?=
 =?iso-8859-1?Q?hjoDENO8zWtrDhUX/Rr9kPvVrP1he7av7RlqwR3zY9HqZ55ogBHVvyY5G/?=
 =?iso-8859-1?Q?Jjg7ppeJ8v1NQvUkkJ5OdAk0aXQ4YufOkK/4HxwX8Zfl98NIAEZsKz7pHt?=
 =?iso-8859-1?Q?3f/xQklUbYjG5OYg7Arzn5+Bo+ACVkX8jFK8rSlSbeSofQnP08xvqeoZRX?=
 =?iso-8859-1?Q?+0kz7JrNtKRfIJkuEZYxxbw+SqKhLeYbk80CyS+K46ehb0Abdh1rPLPbUg?=
 =?iso-8859-1?Q?AtE+dw8WUPewyxZZjGnX8U6lYg3iYviSa2humrMJNYL5O9MU4lt127rs91?=
 =?iso-8859-1?Q?jOtKPA8RZvNYkBUlKutF5TRiPk17j/bm9aRAc0r6gxQYSV/M0R6NfbnoXD?=
 =?iso-8859-1?Q?EQO+jc7EmCYKP5t0baVSTSp0tLPesh7gmdPo0Ka9I3VrIfQVW/WtJEonTK?=
 =?iso-8859-1?Q?sXSy9t4rY1OyYGvYXcRFJiwCPJqA50GZ3uqb8+p3CmosahAVyhTs/E1LxJ?=
 =?iso-8859-1?Q?Sq5t4JatubokVJNN6l5CIP2DwgzSvho=3D?=
Content-Type: multipart/alternative;
 boundary="_000_SN6PR15MB2256778D6D0604601B8E05D5BBEA9SN6PR15MB2256namp_"
MIME-Version: 1.0
X-OriginatorOrg: ibm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR15MB2256.namprd15.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ddc91d3-c29a-40e6-68c0-08da1b84b17d
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Apr 2022 06:29:55.3140 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: fcf67057-50c9-4ad4-98f3-ffca64add9e9
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qZYzQHP8Ra6extqnnHKSHZc+ecftTIOZu9zTBdOIrjwK06vVofMrdZo9YLZFQ3iOlcCnkxpWJ3UdZM3fT72FaYOFOI2Wm0Ke38R/IhAYuMQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY3PR15MB4914
X-Proofpoint-ORIG-GUID: DNoJ4VkYVqgUTUGl-QY4V6IruN4Jzi9e
X-Proofpoint-GUID: DNoJ4VkYVqgUTUGl-QY4V6IruN4Jzi9e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-11_01,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1011 impostorscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204110034
X-Mailman-Approved-At: Mon, 11 Apr 2022 18:21:48 +1000
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
Cc: Michal Hocko <mhocko@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--_000_SN6PR15MB2256778D6D0604601B8E05D5BBEA9SN6PR15MB2256namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable



________________________________
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Sent: Friday, April 8, 2022 5:55 PM
To: Oscar Salvador <osalvador@suse.de>
Cc: Michael Ellerman <mpe@ellerman.id.au>; linuxppc-dev <linuxppc-dev@lists=
.ozlabs.org>; linux-mm@kvack.org <linux-mm@kvack.org>; Michal Hocko <mhocko=
@kernel.org>; Geetika Moolchandani1 <Geetika.Moolchandani1@ibm.com>
Subject: Re: [PATCH] powerpc/numa: Handle partially initialized numa nodes

* Oscar Salvador <osalvador@suse.de> [2022-04-06 18:19:00]:

> On Wed, Mar 30, 2022 at 07:21:23PM +0530, Srikar Dronamraju wrote:
> >  arch/powerpc/mm/numa.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> > index b9b7fefbb64b..13022d734951 100644
> > --- a/arch/powerpc/mm/numa.c
> > +++ b/arch/powerpc/mm/numa.c
> > @@ -1436,7 +1436,7 @@ int find_and_online_cpu_nid(int cpu)
> >      if (new_nid < 0 || !node_possible(new_nid))
> >              new_nid =3D first_online_node;
> >
> > -   if (NODE_DATA(new_nid) =3D=3D NULL) {
> > +   if (!node_online(new_nid)) {
> >  #ifdef CONFIG_MEMORY_HOTPLUG
> >              /*
> >               * Need to ensure that NODE_DATA is initialized for a node=
 from
>
> Because of this fix, I wanted to check whether we might have any more fal=
louts due
> to ("mm: handle uninitialized numa nodes gracefully"), and it made me loo=
k closer
> as to why powerpc is the only platform that special cases try_online_node=
(),
> while all others rely on cpu_up()->try_online_node() to do the right thin=
g.
>
> So, I had a look.
> Let us rewind a bit:
>
> The commit that sets find_and_online_cpu_nid() in dlpar_online_cpu was
> e67e02a544e9 ("powerpc/pseries: Fix cpu hotplug crash with memoryless nod=
es").
>
> In there, it says that we have the following picture:
>
> partition_sched_domains
>  arch_update_cpu_topology
>   numa_update_cpu_topology
>    find_and_online_cpu_nid
>
> and by the time find_and_online_cpu_nid() gets called to online the node,=
 it might be
> too late as we might have referenced some NODE_DATA() fields.
> Note that this happens at a much later stage in cpuhp.
>
> Also note that at a much earlier stage, we do already have a try_online_n=
ode() in cpu_up(),
> which should allocate-and-online the node and prevent accessing garbage.
> But the problem is that, on powerpc, all possible cpus have the same node=
 set at boot stage
> (see arch/powerpc/mm/numa.c:mem_topology_setup),
> so cpu_to_node() returns the same thing until it the mapping gets update =
(which happens in
> start_secondary()->set_numa_node()), and so, the try_online_node() from c=
pu_up() does not
> apply on the right node, because it still holds the not-up-to-date mappin=
g node <-> cpu.
>
> (e.g: in my test case, when onlining a CPU belongin to node1, cpu_up()->t=
ry_online_node()
>  tries to online node0, or whatever old mapping numa<->cpu is there).
>
> So, we have something like:
>
> dlpar_online_cpu
>  device_online
>   dev->bus->online
>    cpu_subsys_online
>     cpu_device_up
>      cpu_up
>       try_online_node (old mapping nid <-> cpu )
>       ...
>       ...
>       cphp_callbacks
>        sched_cpu_activate
>         cpuset_update_active_cpus
>          schedule_work(&cpuset_hotplug_work)
>           cpuset_hotplug_work
>            partition_sched_domains
>             arch_update_cpu_topology
>              numa_update_cpu_topology
>               find_and_online_cpu_nid (online new_nid)
>
>
> So, yeah, the real onlining in numa_update_cpu_topology()->find_and_onlin=
e_cpu_nid()
> happens too late, that is why adding find_and_online_cpu_nid() back in dl=
par_online_cpu()
> fixed the issue, but we should not need this special casing at all.
>
> We do already know the numa<->cpu associativity in
> dlpar_online_cpu()->find_and_online_cpu_nid(), so we should just be able =
to
> update the numa<->cpu mapping, and let the try_online_node() do the right=
 thing.
>
> With this in mind, I came up with the following patch, where I carried ou=
t a battery
> of tests for CPU hotplug stuff and it worked as expected.
> But I am not familiar with all powerpc pitfalls, e.g: dedicated vs shared=
 cpus etc, so
> I would like to hear from more familiar people.
>
> The patch is:
>
> From: Oscar Salvador <osalvador@suse.de>
> Date: Wed, 6 Apr 2022 14:39:15 +0200
> Subject: [PATCH] powerpc/numa: Associate numa node to its cpu earlier
>
> powerpc is the only platform that do not rely on
> cpu_up()->try_online_node() to bring up a numa node,
> and special cases it, instead, deep in its own machinery:
>
> dlpar_online_cpu
>  find_and_online_cpu_nid
>   try_online_node
>
> This should not be needed, but the thing is that the try_online_node()
> from cpu_up() will not apply on the right node, because cpu_to_node()
> will return the old mapping numa<->cpu that gets set on boot stage
> for all possible cpus.
>
> That can be seen easily if we try to print out the numa node passed
> to try_online_node() in cpu_up().
>
> The thing is that the numa<->cpu mapping does not get updated till a much
> later stage in start_secondary:
>
> start_secondary:
>  set_numa_node(numa_cpu_lookup_table[cpu])
>
> But we do not really care, as we already now the
> CPU <-> NUMA associativity back in find_and_online_cpu_nid(),
> so let us make use of that and set the proper numa<->cpu mapping,
> so cpu_to_node() in cpu_up() returns the right node and
> try_online_node() can do its work.
>
> Signed-off-by: Oscar Salvador <osalvador@suse.de>

Looks good to me.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>


> ---
>  arch/powerpc/include/asm/topology.h          |  8 ++-----
>  arch/powerpc/mm/numa.c                       | 31 +++++++---------------=
------
>  arch/powerpc/platforms/pseries/hotplug-cpu.c |  2 +-
>  3 files changed, 11 insertions(+), 30 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/a=
sm/topology.h
> index 36fcafb1fd6d..6ae1b2dce83e 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -111,14 +111,10 @@ static inline void unmap_cpu_from_node(unsigned lon=
g cpu) {}
>  #endif /* CONFIG_NUMA */
>
>  #if defined(CONFIG_NUMA) && defined(CONFIG_PPC_SPLPAR)
> -extern int find_and_online_cpu_nid(int cpu);
> +extern void find_and_update_cpu_nid(int cpu);
>  extern int cpu_to_coregroup_id(int cpu);
>  #else
> -static inline int find_and_online_cpu_nid(int cpu)
> -{
> -     return 0;
> -}
> -
> +static inline void find_and_update_cpu_nid(int cpu) {}
>  static inline int cpu_to_coregroup_id(int cpu)
>  {
>  #ifdef CONFIG_SMP
> diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
> index b9b7fefbb64b..b5bc8b1a833d 100644
> --- a/arch/powerpc/mm/numa.c
> +++ b/arch/powerpc/mm/numa.c
> @@ -1423,43 +1423,28 @@ static long vphn_get_associativity(unsigned long =
cpu,
>        return rc;
>  }
>
> -int find_and_online_cpu_nid(int cpu)
> +void find_and_update_cpu_nid(int cpu)
>  {
>        __be32 associativity[VPHN_ASSOC_BUFSIZE] =3D {0};
>        int new_nid;
>
>        /* Use associativity from first thread for all siblings */
>        if (vphn_get_associativity(cpu, associativity))
> -             return cpu_to_node(cpu);
> +             return;
>
> +     /* Do not have previous associativity, so find it now. */
>        new_nid =3D associativity_to_nid(associativity);
> +
>        if (new_nid < 0 || !node_possible(new_nid))
>                new_nid =3D first_online_node;
> -
> -     if (NODE_DATA(new_nid) =3D=3D NULL) {
> -#ifdef CONFIG_MEMORY_HOTPLUG
> -             /*
> -              * Need to ensure that NODE_DATA is initialized for a node =
from
> -              * available memory (see memblock_alloc_try_nid). If unable=
 to
> -              * init the node, then default to nearest node that has mem=
ory
> -              * installed. Skip onlining a node if the subsystems are no=
t
> -              * yet initialized.
> -              */
> -             if (!topology_inited || try_online_node(new_nid))
> -                     new_nid =3D first_online_node;
> -#else
> -             /*
> -              * Default to using the nearest node that has memory instal=
led.
> -              * Otherwise, it would be necessary to patch the kernel MM =
code
> -              * to deal with more memoryless-node error conditions.
> +     else
> +             /* Associate node <-> cpu, so cpu_up() calls
> +              * try_online_node() on the right node.
>                 */
> -             new_nid =3D first_online_node;
> -#endif
> -     }
> +             set_cpu_numa_node(cpu, new_nid);
>
>        pr_debug("%s:%d cpu %d nid %d\n", __FUNCTION__, __LINE__,
>                cpu, new_nid);
> -     return new_nid;
>  }
>
>  int cpu_to_coregroup_id(int cpu)
> diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/=
platforms/pseries/hotplug-cpu.c
> index b81fc846d99c..0f8cd8b06432 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
> @@ -398,7 +398,7 @@ static int dlpar_online_cpu(struct device_node *dn)
>                        if (get_hard_smp_processor_id(cpu) !=3D thread)
>                                continue;
>                        cpu_maps_update_done();
> -                     find_and_online_cpu_nid(cpu);
> +                     find_and_update_cpu_nid(cpu);
>                        rc =3D device_online(get_cpu_device(cpu));
>                        if (rc) {
>                                dlpar_offline_cpu(dn);
> --
> 2.16.4
>
> --
> Oscar Salvador
> SUSE Labs

Tested-by: Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>

--_000_SN6PR15MB2256778D6D0604601B8E05D5BBEA9SN6PR15MB2256namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div id=3D"appendonsend"></div>
<div style=3D"font-family:Calibri,Arial,Helvetica,sans-serif; font-size:12p=
t; color:rgb(0,0,0)">
<br>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font style=3D"font-size:11pt" face=
=3D"Calibri, sans-serif" color=3D"#000000"><b>From:</b> Srikar Dronamraju &=
lt;srikar@linux.vnet.ibm.com&gt;<br>
<b>Sent:</b> Friday, April 8, 2022 5:55 PM<br>
<b>To:</b> Oscar Salvador &lt;osalvador@suse.de&gt;<br>
<b>Cc:</b> Michael Ellerman &lt;mpe@ellerman.id.au&gt;; linuxppc-dev &lt;li=
nuxppc-dev@lists.ozlabs.org&gt;; linux-mm@kvack.org &lt;linux-mm@kvack.org&=
gt;; Michal Hocko &lt;mhocko@kernel.org&gt;; Geetika Moolchandani1 &lt;Geet=
ika.Moolchandani1@ibm.com&gt;<br>
<b>Subject:</b> Re: [PATCH] powerpc/numa: Handle partially initialized numa=
 nodes</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt"=
>
<div class=3D"PlainText">* Oscar Salvador &lt;osalvador@suse.de&gt; [2022-0=
4-06 18:19:00]:<br>
<br>
&gt; On Wed, Mar 30, 2022 at 07:21:23PM +0530, Srikar Dronamraju wrote:<br>
&gt; &gt;&nbsp; arch/powerpc/mm/numa.c | 2 +-<br>
&gt; &gt;&nbsp; 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; &gt; <br>
&gt; &gt; diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c<br>
&gt; &gt; index b9b7fefbb64b..13022d734951 100644<br>
&gt; &gt; --- a/arch/powerpc/mm/numa.c<br>
&gt; &gt; +++ b/arch/powerpc/mm/numa.c<br>
&gt; &gt; @@ -1436,7 +1436,7 @@ int find_and_online_cpu_nid(int cpu)<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (new_nid &lt; 0 || !node_possibl=
e(new_nid))<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; new_nid =3D first_online_node;<br>
&gt; &gt;&nbsp; <br>
&gt; &gt; -&nbsp;&nbsp; if (NODE_DATA(new_nid) =3D=3D NULL) {<br>
&gt; &gt; +&nbsp;&nbsp; if (!node_online(new_nid)) {<br>
&gt; &gt;&nbsp; #ifdef CONFIG_MEMORY_HOTPLUG<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp; /*<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp; * Need to ensure that NODE_DATA is initialized for a nod=
e from<br>
&gt; <br>
&gt; Because of this fix, I wanted to check whether we might have any more =
fallouts due<br>
&gt; to (&quot;mm: handle uninitialized numa nodes gracefully&quot;), and i=
t made me look closer<br>
&gt; as to why powerpc is the only platform that special cases try_online_n=
ode(),<br>
&gt; while all others rely on cpu_up()-&gt;try_online_node() to do the righ=
t thing.<br>
&gt; <br>
&gt; So, I had a look.<br>
&gt; Let us rewind a bit:<br>
&gt; <br>
&gt; The commit that sets find_and_online_cpu_nid() in dlpar_online_cpu was=
<br>
&gt; e67e02a544e9 (&quot;powerpc/pseries: Fix cpu hotplug crash with memory=
less nodes&quot;).<br>
&gt; <br>
&gt; In there, it says that we have the following picture:<br>
&gt; <br>
&gt; partition_sched_domains<br>
&gt;&nbsp; arch_update_cpu_topology<br>
&gt;&nbsp;&nbsp; numa_update_cpu_topology<br>
&gt;&nbsp;&nbsp;&nbsp; find_and_online_cpu_nid<br>
&gt; <br>
&gt; and by the time find_and_online_cpu_nid() gets called to online the no=
de, it might be<br>
&gt; too late as we might have referenced some NODE_DATA() fields.<br>
&gt; Note that this happens at a much later stage in cpuhp.<br>
&gt; <br>
&gt; Also note that at a much earlier stage, we do already have a try_onlin=
e_node() in cpu_up(),<br>
&gt; which should allocate-and-online the node and prevent accessing garbag=
e.<br>
&gt; But the problem is that, on powerpc, all possible cpus have the same n=
ode set at boot stage<br>
&gt; (see arch/powerpc/mm/numa.c:mem_topology_setup),<br>
&gt; so cpu_to_node() returns the same thing until it the mapping gets upda=
te (which happens in<br>
&gt; start_secondary()-&gt;set_numa_node()), and so, the try_online_node() =
from cpu_up() does not<br>
&gt; apply on the right node, because it still holds the not-up-to-date map=
ping node &lt;-&gt; cpu.<br>
&gt; <br>
&gt; (e.g: in my test case, when onlining a CPU belongin to node1, cpu_up()=
-&gt;try_online_node()<br>
&gt;&nbsp; tries to online node0, or whatever old mapping numa&lt;-&gt;cpu =
is there).<br>
&gt; <br>
&gt; So, we have something like:<br>
&gt; <br>
&gt; dlpar_online_cpu<br>
&gt;&nbsp; device_online<br>
&gt;&nbsp;&nbsp; dev-&gt;bus-&gt;online<br>
&gt;&nbsp;&nbsp;&nbsp; cpu_subsys_online<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp; cpu_device_up<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpu_up<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; try_online_node (old mapping nid &=
lt;-&gt; cpu )<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ...<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cphp_callbacks<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; sched_cpu_activate<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpuset_update_active_c=
pus<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; schedule_work(&a=
mp;cpuset_hotplug_work)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpuset_hot=
plug_work<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; part=
ition_sched_domains<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
; arch_update_cpu_topology<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp; numa_update_cpu_topology<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp; find_and_online_cpu_nid (online new_nid)<br>
&gt; <br>
&gt; <br>
&gt; So, yeah, the real onlining in numa_update_cpu_topology()-&gt;find_and=
_online_cpu_nid()<br>
&gt; happens too late, that is why adding find_and_online_cpu_nid() back in=
 dlpar_online_cpu()<br>
&gt; fixed the issue, but we should not need this special casing at all.<br=
>
&gt; <br>
&gt; We do already know the numa&lt;-&gt;cpu associativity in<br>
&gt; dlpar_online_cpu()-&gt;find_and_online_cpu_nid(), so we should just be=
 able to<br>
&gt; update the numa&lt;-&gt;cpu mapping, and let the try_online_node() do =
the right thing.<br>
&gt; <br>
&gt; With this in mind, I came up with the following patch, where I carried=
 out a battery<br>
&gt; of tests for CPU hotplug stuff and it worked as expected.<br>
&gt; But I am not familiar with all powerpc pitfalls, e.g: dedicated vs sha=
red cpus etc, so<br>
&gt; I would like to hear from more familiar people.<br>
&gt; <br>
&gt; The patch is:<br>
&gt; <br>
&gt; From: Oscar Salvador &lt;osalvador@suse.de&gt;<br>
&gt; Date: Wed, 6 Apr 2022 14:39:15 +0200<br>
&gt; Subject: [PATCH] powerpc/numa: Associate numa node to its cpu earlier<=
br>
&gt; <br>
&gt; powerpc is the only platform that do not rely on<br>
&gt; cpu_up()-&gt;try_online_node() to bring up a numa node,<br>
&gt; and special cases it, instead, deep in its own machinery:<br>
&gt; <br>
&gt; dlpar_online_cpu<br>
&gt;&nbsp; find_and_online_cpu_nid<br>
&gt;&nbsp;&nbsp; try_online_node<br>
&gt; <br>
&gt; This should not be needed, but the thing is that the try_online_node()=
<br>
&gt; from cpu_up() will not apply on the right node, because cpu_to_node()<=
br>
&gt; will return the old mapping numa&lt;-&gt;cpu that gets set on boot sta=
ge<br>
&gt; for all possible cpus.<br>
&gt; <br>
&gt; That can be seen easily if we try to print out the numa node passed<br=
>
&gt; to try_online_node() in cpu_up().<br>
&gt; <br>
&gt; The thing is that the numa&lt;-&gt;cpu mapping does not get updated ti=
ll a much<br>
&gt; later stage in start_secondary:<br>
&gt; <br>
&gt; start_secondary:<br>
&gt;&nbsp; set_numa_node(numa_cpu_lookup_table[cpu])<br>
&gt; <br>
&gt; But we do not really care, as we already now the<br>
&gt; CPU &lt;-&gt; NUMA associativity back in find_and_online_cpu_nid(),<br=
>
&gt; so let us make use of that and set the proper numa&lt;-&gt;cpu mapping=
,<br>
&gt; so cpu_to_node() in cpu_up() returns the right node and<br>
&gt; try_online_node() can do its work.<br>
&gt; <br>
&gt; Signed-off-by: Oscar Salvador &lt;osalvador@suse.de&gt;<br>
<br>
Looks good to me.<br>
<br>
Reviewed-by: Srikar Dronamraju &lt;srikar@linux.vnet.ibm.com&gt;<br>
<br>
<br>
&gt; ---<br>
&gt;&nbsp; arch/powerpc/include/asm/topology.h&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp; 8 ++-----<br>
&gt;&nbsp; arch/powerpc/mm/numa.c&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp; | 31 +++++++---------------------<br>
&gt;&nbsp; arch/powerpc/platforms/pseries/hotplug-cpu.c |&nbsp; 2 +-<br>
&gt;&nbsp; 3 files changed, 11 insertions(+), 30 deletions(-)<br>
&gt; <br>
&gt; diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/includ=
e/asm/topology.h<br>
&gt; index 36fcafb1fd6d..6ae1b2dce83e 100644<br>
&gt; --- a/arch/powerpc/include/asm/topology.h<br>
&gt; +++ b/arch/powerpc/include/asm/topology.h<br>
&gt; @@ -111,14 +111,10 @@ static inline void unmap_cpu_from_node(unsigned =
long cpu) {}<br>
&gt;&nbsp; #endif /* CONFIG_NUMA */<br>
&gt; <br>
&gt;&nbsp; #if defined(CONFIG_NUMA) &amp;&amp; defined(CONFIG_PPC_SPLPAR)<b=
r>
&gt; -extern int find_and_online_cpu_nid(int cpu);<br>
&gt; +extern void find_and_update_cpu_nid(int cpu);<br>
&gt;&nbsp; extern int cpu_to_coregroup_id(int cpu);<br>
&gt;&nbsp; #else<br>
&gt; -static inline int find_and_online_cpu_nid(int cpu)<br>
&gt; -{<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; return 0;<br>
&gt; -}<br>
&gt; -<br>
&gt; +static inline void find_and_update_cpu_nid(int cpu) {}<br>
&gt;&nbsp; static inline int cpu_to_coregroup_id(int cpu)<br>
&gt;&nbsp; {<br>
&gt;&nbsp; #ifdef CONFIG_SMP<br>
&gt; diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c<br>
&gt; index b9b7fefbb64b..b5bc8b1a833d 100644<br>
&gt; --- a/arch/powerpc/mm/numa.c<br>
&gt; +++ b/arch/powerpc/mm/numa.c<br>
&gt; @@ -1423,43 +1423,28 @@ static long vphn_get_associativity(unsigned lo=
ng cpu,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; return rc;<br>
&gt;&nbsp; }<br>
&gt; <br>
&gt; -int find_and_online_cpu_nid(int cpu)<br>
&gt; +void find_and_update_cpu_nid(int cpu)<br>
&gt;&nbsp; {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; __be32 associativity[VPHN_AS=
SOC_BUFSIZE] =3D {0};<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; int new_nid;<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /* Use associativity from fi=
rst thread for all siblings */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (vphn_get_associativity(c=
pu, associativity))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return cpu_to_node(cpu);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; return;<br>
&gt; <br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; /* Do not have previous associativity, so fi=
nd it now. */<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_nid =3D associativity_to=
_nid(associativity);<br>
&gt; +<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (new_nid &lt; 0 || !node_=
possible(new_nid))<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; new_nid =3D first_online_node;<br>
&gt; -<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; if (NODE_DATA(new_nid) =3D=3D NULL) {<br>
&gt; -#ifdef CONFIG_MEMORY_HOTPLUG<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /*<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * Need to ensure that NODE_DATA is initialized for a node from<br=
>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * available memory (see memblock_alloc_try_nid). If unable to<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * init the node, then default to nearest node that has memory<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * installed. Skip onlining a node if the subsystems are not<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * yet initialized.<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; if (!topology_inited || try_online_node(new_nid))<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; new_nid =3D first_onlin=
e_node;<br>
&gt; -#else<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /*<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * Default to using the nearest node that has memory installed.<br=
>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * Otherwise, it would be necessary to patch the kernel MM code<br=
>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * to deal with more memoryless-node error conditions.<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; /* Associate node &lt;-&gt; cpu, so cpu_up() calls<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp; * try_online_node() on the right node.<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp; */<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; new_nid =3D first_online_node;<br>
&gt; -#endif<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; }<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp; set_cpu_numa_node(cpu, new_nid);<br>
&gt; <br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; pr_debug(&quot;%s:%d cpu %d =
nid %d\n&quot;, __FUNCTION__, __LINE__,<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; cpu, new_nid);<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp; return new_nid;<br>
&gt;&nbsp; }<br>
&gt; <br>
&gt;&nbsp; int cpu_to_coregroup_id(int cpu)<br>
&gt; diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/power=
pc/platforms/pseries/hotplug-cpu.c<br>
&gt; index b81fc846d99c..0f8cd8b06432 100644<br>
&gt; --- a/arch/powerpc/platforms/pseries/hotplug-cpu.c<br>
&gt; +++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c<br>
&gt; @@ -398,7 +398,7 @@ static int dlpar_online_cpu(struct device_node *dn=
)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (get=
_hard_smp_processor_id(cpu) !=3D thread)<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; continue;<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; cpu_map=
s_update_done();<br>
&gt; -&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; find_and_online_cpu_nid=
(cpu);<br>
&gt; +&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; find_and_update_cpu_nid=
(cpu);<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rc =3D =
device_online(get_cpu_device(cpu));<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if (rc)=
 {<br>
&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dlpar_offline_cpu(dn);<br>
&gt; --<br>
&gt; 2.16.4<br>
&gt; <br>
&gt; -- <br>
&gt; Oscar Salvador<br>
&gt; SUSE Labs</div>
<div class=3D"PlainText"><br>
</div>
<div class=3D"PlainText">Tested-by: Geetika Moolchandani &lt;Geetika.Moolch=
andani1@ibm.com&gt;<br>
</div>
</span></font></div>
</body>
</html>

--_000_SN6PR15MB2256778D6D0604601B8E05D5BBEA9SN6PR15MB2256namp_--
