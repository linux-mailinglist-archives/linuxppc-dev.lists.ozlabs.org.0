Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A4BAF678B1E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jan 2023 23:57:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P158B3bJ4z3bgK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Jan 2023 09:56:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=cImPVWk2;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=pu5GLrPN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2022-7-12 header.b=cImPVWk2;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=pu5GLrPN;
	dkim-atps=neutral
X-Greylist: delayed 8162 seconds by postgrey-1.36 at boromir; Tue, 24 Jan 2023 09:56:03 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P15775gFlz30CT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jan 2023 09:56:02 +1100 (AEDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30NKDsoZ009866;
	Mon, 23 Jan 2023 20:39:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2022-7-12;
 bh=czRKAIOZTllQPGXQmj2DGK78pBIC+mjwcvm1f4ngOKI=;
 b=cImPVWk2f4zJSPrkb3Lr7gQy9OlXNLlg/M+071mYCJLLuL4zAebLrRlqjfstD+lT+keB
 Sm0fFEqTDWl6q8I9lVmkcsW0upeNrxzFxj5oEw8z1o0oPJULs+5cbOx1LxkKLshWwFox
 9dDOy9kPeoTRfkD0yzclmmUX40xDcSCY9cgqkzVfab7cLzKYXraLDSd1NuEHtobhf9Hl
 IuNiXwd+b7CN4mED4UUPyr/c2BEB9gPGav3AVbVWlcpGXMpqsW4sFPBXicEo+mYK0/Hp
 MVjSJWEvLbev8pGuIjegGVYBQFGvXvfHwJw11PnVT18JfXvgl+T78I3TpYSV+LlDWjnH 8g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n883c3u9w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 20:39:01 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30NJOG0R040119;
	Mon, 23 Jan 2023 20:39:00 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2109.outbound.protection.outlook.com [104.47.58.109])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g422tc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jan 2023 20:39:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eJwfv+IXsPa8fwQ1SJ7uf9rAqEKecGZMu45/XAPGpdRcnQVDtJ9lF60+Kgjz7OrQeP/P7SPgn+5ds/DLmIwWXnl9dA44jaGOCweDYNIXmH4Ili055rlBihTvw8icy+fU/L5ZfIWQIja8KxdhynhpLG155vak5WjKCAnfvUGieipogzQwrzbaUhf9NQMJxZbnAFCBHLVub54E4ugZ4zusiFkTXq5lW0fPEyYiKfuAtONWk5wJJMQOxCsyExBVnSjOOmVh12zV0USLozzly2kz9oalkhFdvEswJhjucjrlzv17Lx1os8btJYgqT6dbOuzwlFXm6THGxKHdYfhdn/WHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=czRKAIOZTllQPGXQmj2DGK78pBIC+mjwcvm1f4ngOKI=;
 b=EicFDSKadzZQbeeVjjPaG1ob0WhVENvJzQPhUZ1zRbX93ME/7qVzt1kW1eT8QvTOKrqFn1rpgXvBsE1WQO05A24AxU+vGI3MCbkUFF3NU01ayze4BRelKm0LK7tbucGwAFw/zFVw2yTcWWZr98k/2h3isunPCu+cUd9JmXPFZ1VGyckIPyTqwuv0wRA7pAdsopu29jGO3u2OJLI4mkb+eB48+9FoetN/5eoj0F64Dd4ozWWC3XNNDXdLMvO5zCmoDW4kbqlI7SvmkCnb+IOIlHWbGUcEk+OE1S4mIxkkJMYrKpjkm37pm1x1fAw/MLqgfd5znzPPPB4t51iKvWYShA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=czRKAIOZTllQPGXQmj2DGK78pBIC+mjwcvm1f4ngOKI=;
 b=pu5GLrPNej3WhzdRX8Q76/Z7Y4G9Kd3kkrlCorGEzeZOdcOOZQhkDpCW3lmpq0h/ULOFv+0sNDOBt4SIXAHphUCxpZw5FCzchbBu601WzdggH9baAAm8y0egseHnfa0Qb101IO5Cph1zeVz1oQd1Q496Ahbf5kNUCoEFYTyahIg=
Received: from SN6PR10MB3022.namprd10.prod.outlook.com (2603:10b6:805:d8::25)
 by SJ0PR10MB4622.namprd10.prod.outlook.com (2603:10b6:a03:2d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16; Mon, 23 Jan
 2023 20:38:57 +0000
Received: from SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::7306:828b:8091:9674]) by SN6PR10MB3022.namprd10.prod.outlook.com
 ([fe80::7306:828b:8091:9674%5]) with mapi id 15.20.6043.016; Mon, 23 Jan 2023
 20:38:57 +0000
Date: Mon, 23 Jan 2023 15:38:51 -0500
From: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
To: Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 39/41] kernel/fork: throttle call_rcu() calls in
 vm_area_free
Message-ID: <20230123203851.227zepvcmwiydqfr@revolver>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@Oracle.com>,
	Michal Hocko <mhocko@suse.com>,
	Matthew Wilcox <willy@infradead.org>,
	Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org,
	michel@lespinasse.org, jglisse@google.com, vbabka@suse.cz,
	hannes@cmpxchg.org, mgorman@techsingularity.net, dave@stgolabs.net,
	peterz@infradead.org, ldufour@linux.ibm.com,
	laurent.dufour@fr.ibm.com, paulmck@kernel.org, luto@kernel.org,
	songliubraving@fb.com, peterx@redhat.com, david@redhat.com,
	dhowells@redhat.com, hughd@google.com, bigeasy@linutronix.de,
	kent.overstreet@linux.dev, punit.agrawal@bytedance.com,
	lstoakes@gmail.com, peterjung1337@gmail.com, rientjes@google.com,
	axelrasmussen@google.com, joelaf@google.com, minchan@google.com,
	jannh@google.com, shakeelb@google.com, tatashin@google.com,
	edumazet@google.com, gthelen@google.com, gurua@google.com,
	arjunroy@google.com, soheil@google.com, hughlynch@google.com,
	leewalsh@google.com, posk@google.com, linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@android.com
References: <Y85Z0Ovl68o4cz2j@dhcp22.suse.cz>
 <CAJuCfpG86qc4odkpUbzuROb+jThQgXGWjcFXb0e-c2i0wEGg4g@mail.gmail.com>
 <Y868Fadajv27QMXh@dhcp22.suse.cz>
 <CAJuCfpGSCHpnZwwVV_922fmMBpFPZL0HAHMABuDzMfuURF2sWg@mail.gmail.com>
 <Y87A2CEKAugfgfHC@dhcp22.suse.cz>
 <CAJuCfpGJRZATfc8eUurvV5kGkSNkG=vK=sfwJbU72PESOyATSw@mail.gmail.com>
 <Y87QjHH2aDG5XCGv@casper.infradead.org>
 <Y87djZwQpXazRd00@dhcp22.suse.cz>
 <Y87gY7fhi5OJ35WQ@casper.infradead.org>
 <Y87nVydD7oF9BGMb@dhcp22.suse.cz>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y87nVydD7oF9BGMb@dhcp22.suse.cz>
User-Agent: NeoMutt/20220429
X-ClientProxiedBy: YT3PR01CA0107.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::20) To SN6PR10MB3022.namprd10.prod.outlook.com
 (2603:10b6:805:d8::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN6PR10MB3022:EE_|SJ0PR10MB4622:EE_
X-MS-Office365-Filtering-Correlation-Id: 5653e39d-8bcb-4942-37bb-08dafd81d9b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	p5EViOZePQF+ufOjFFodPq2skqMKbd9Y8bp918YkHXdO4sJu2BxecitgFdjgqPor6QxjzZkYNkwPExo6U7LymW5wb0nHui1BaGHI0u+ouEwUQV0DRD1M7lb4aQcHVYtTTWIudHw9TuyAIkGlRPw4k65ZWfV/1SGw51aVN1L3C0iKDMDp9OHVsOf8NknYUN4FR14jk0utJXXC5sMNH0CbfYKvh51peHzzNxdKrpuP2Z3P3ZnXSRk0601mZC2geS23ssU+DV8QGf8uAO5CElx3FqUOCr60itk9N6L7tcND3Cs1H2PTqr0n8U/FRGY+4YC/VbO9SadAjpZRlFuxLvZaAFuE5sdx8+1GwgiSes9H9Q6pHRjtehM8a9/xvLp1FxuZO73Ln5iXvtUrRXq3QpPq8ZhokErCAc25H8foXOBVpTpx1XVPpqd5ZcGlQgXky0HXIMxtWtbYfhR4/yp7QCMAyJ2QoEayzbNZCTx9tNvCf93RuGltYFlr1dyK1KTu7AfdYvoNPz4Hy9KodsWM95rmw3cXvXwVpfPrmoYOZ++/HHQdzP5KU1ep+9e71/aYEYr97CIB0whETAoE7MnwsUm2Quq2m4y7hfGekXYdEXeG4NCI6L7FC89IHVAtXgAf9eGH0qvPQd3SqGLdm3lrVMvAfw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR10MB3022.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(39860400002)(376002)(136003)(396003)(366004)(346002)(451199015)(83380400001)(66476007)(66556008)(66946007)(86362001)(6916009)(8676002)(4326008)(316002)(54906003)(6506007)(6666004)(9686003)(26005)(186003)(6512007)(478600001)(6486002)(33716001)(1076003)(8936002)(5660300002)(7406005)(7416002)(41300700001)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?TRNEaPE3fy5PEJ+wCQklGYbg4u9jVh/339PLp4u5KE70A6b0k4eTo7eH7ZpT?=
 =?us-ascii?Q?Gla98kt4Dw0fJBbp608wz8KO2702zffK4SAMZPvwhEowB7CsAooiGMMmz0J1?=
 =?us-ascii?Q?TvZwJy17NRnlBin3GIRmRwmTyzdU/TOpspE1IB3MgQRoW6ziZ22j8MzOqjXJ?=
 =?us-ascii?Q?GWam3eGQ8+shCo+LAJzaiV+Agqm9YTiyePLME7TsznhSgmKx51OSli/qWkol?=
 =?us-ascii?Q?Zk2FTt8MUz5t8WKtA9uQY/D1oNipjeAvVJTGqdSfvTz0ouFygeNQFOXnA4gd?=
 =?us-ascii?Q?neStpkjh8gPLljziSaH4f0gBH2tSi4+N0SqAkO3Q/F0KVB3rJPinD65rxVO8?=
 =?us-ascii?Q?srnIBoOxFwptLKtWK/hWjiwuAj6v9TUPtHekbDViZ+N/vVGa9qKb20KnVdty?=
 =?us-ascii?Q?Ds66Q5benARocBfuLnXs6BLHkghSSTDwgMEkwYCrZYzp6gy0oJZ/1R0x88Ex?=
 =?us-ascii?Q?gIEr+/wTZkLVzh3w5m7S7wbp52xE4OjBZJ5YpSrhm0rkdZeieSRZnnNhLEft?=
 =?us-ascii?Q?pIeczlAE6Smv6IrAez8Z/Mf3QGlp8lTKWEwM4+dRwDxlG8Q/fcHH0ykZiHPH?=
 =?us-ascii?Q?z4xPEnWJXV/AEXpaVRfqrjB1PgsARHWYDsdoAYolvSefJH0sZQPJgXvWUTQA?=
 =?us-ascii?Q?m2tPLqsCN+sygf4x7z9HSFPlo1Y545RXHUQZFPLzWmP4IqJP2e6jI6KAZSgP?=
 =?us-ascii?Q?3Oc/7/AHmdWeZZxxBfntDC6GNEdlEc2q/r7Eeh0uuZhu1VksHyTbOhR7m49a?=
 =?us-ascii?Q?2LMZco3gE3Hll9+GT6QrTsnn1jV2JUqnYLoSRYNcl7/MRSSSUddzx5tw0Zrk?=
 =?us-ascii?Q?6K9ps3EfXmldA8jgPpv/5LE3M5nGZ2ufyQbG8jOlByAxv37jWlDIGPnWMQXi?=
 =?us-ascii?Q?kN1lp32kCCn7am8Eb9MDMF2H0pP+O0BDwJ0bLIlpqAfhaouerck3hXtEygOM?=
 =?us-ascii?Q?8W7FHJvJGulp7CC7QHTjAUemuV8JmZ6fNZfo09vMZzbfdc7QCBukWhbhdIQW?=
 =?us-ascii?Q?2H89IVBvoZ9KrMftfZN+h7JxgPn77OqbEy0eVWIfQjMFHgjS+SJTj982EHiB?=
 =?us-ascii?Q?vxVkrq3UXnrxC09l/IPyFbO+hrQPb1dlRUY9vXkesO+07c7PlAcJ8iiUYZXY?=
 =?us-ascii?Q?ZmPAc+Y4JegmOvW3J0OvrPLm0265miD+9EjbyOQAAFX7lwuCxAGUxkggqW+0?=
 =?us-ascii?Q?2hDF4556dRApbl98cyG6EWp5diYHtApc3ny2uoRnSDv+jlkMYNB5igPzfu9s?=
 =?us-ascii?Q?eT9/h7UGfRpC9rhhZtVCilZEGO/Gdlvk5STURdMoCE8GFUlRsWgcvGMLcGTS?=
 =?us-ascii?Q?HB9UHdafSE9WsOgEj+LL8din3qHutCK+MYBabxdggu19yCrnirmAbkxpfRqh?=
 =?us-ascii?Q?GBJ/dvArSqAcFbeynketnmsFSOE9xio8lqI6hNH4SwbLslDnGscGBGyg1tAl?=
 =?us-ascii?Q?rfy7RL616doI6QbPjRY3zQ2pcjXjmSMjD4O+XhRXsyQzGVtuz322xFN+y/Gd?=
 =?us-ascii?Q?eFyr9ODDEv4AJ6uVY51wDg6RGebKRg5fP14pQJBZ5wmrl7OGzQgPkZ3HdI5w?=
 =?us-ascii?Q?Sei11K+MCmCow1ODdssAtETYmiztd6vDJ+LFtlmxB5J2p/foMhG6SzoKVvSw?=
 =?us-ascii?Q?RQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?us-ascii?Q?jFkY2QXR79CVOLsuiS32dqQxFeU4cGxeyiWvsHVHMsIBd4ujbz+CRKtXsrZf?=
 =?us-ascii?Q?ywsFXbpE/9OR6Zo7uURkoXeJo732GayQkPJNOx4AxQFjPRQHY8qEods3eOcA?=
 =?us-ascii?Q?I8ciKcad2jqoBstgfdMwfU4ltpK5WmtN+7D6Z4/I7sEl66UiMabHvPIIuAP+?=
 =?us-ascii?Q?L45YSN0dFMVO1dw6WEyxL7WCJS7Levcwr1uh9/Ndvd84ml0SFTbs8gwnwjXS?=
 =?us-ascii?Q?8EZ/kc/CsDyr7LkoxJZPG0c2tKZjpqGabkoI5Yb7wSTzHUyqLF596gAulpWs?=
 =?us-ascii?Q?NABN1B/+gRiCGLfWB0tWtCwkG5By+CDgWFlPAFaeUFJ0izTI3olgH9FBlSGb?=
 =?us-ascii?Q?iFclnxJppw6A15PBTfV8sifVa9TGofU+8jW3XbzQjY8ft3L+iL6jfW8C0Ufz?=
 =?us-ascii?Q?qQ7xUt1lb/Vh+53+hD0AiYCaUnVYwqtRjZkJLhhkLVj2pPi2CTg7bhXiBdlB?=
 =?us-ascii?Q?ilA6I3llIZUulW4p7j5+lBNLQxNwrEmuNJ9JX8e+K/w8w69sNuXnzVlNzHYg?=
 =?us-ascii?Q?136TOoezrVOvwCTOfnV5qVFrcDgy6b6BKCZHhYnOyqbwYE2/GYnyxpp3JrPt?=
 =?us-ascii?Q?M+8oxaitDFI5Vj1P8jSbFzuwU8ELSvndLywODXhxNFR7Ayx2jZYfR7KfwuGK?=
 =?us-ascii?Q?C7kGxq8QxZhTHtCzEFb+WA9BeYX5FnjiXPVh3twVT+9YydjayP8JuVtudGC8?=
 =?us-ascii?Q?yq4kD+D2LrCOhZqjZs6ibtJ6x/35Nzr673sIIj5L+PuUAUMDPknhMQELWzuv?=
 =?us-ascii?Q?NdLUhOlNVLujV22ZFjMOgB6mYN0Lh0Hl494f4do1w7z9gcDe1ORHFoxSiUaz?=
 =?us-ascii?Q?p/oAdZ8Pf51RlbYsJ1R0YiJQOBL9k7F0o2vZOo15zrguPB5wk9Cec42tG3KG?=
 =?us-ascii?Q?cXGBzG39NYBF7vg8GFWjOlwAy5FSWWtyzJhKssHJMCQpfIvYQUQli6qccEQ0?=
 =?us-ascii?Q?u8t+APKBOssng1Vzgsm1KFOaKd2dijhXpAld+puTg1YkghO+Eebg32ET45P3?=
 =?us-ascii?Q?ovj+MoqpSz0fHEJFIDSSzerjVd+Ul789lGh7B55b4qbq2s9r27Ql54BSE3zr?=
 =?us-ascii?Q?MHb7CfgYS22wnFlhNWBWCTq7MXtpkPT9Fdh0BsZK+p67g/E3FsGNmUbYwdd1?=
 =?us-ascii?Q?iIIkY/bsXZg2Wrjzwo2cvruH1MGYlwSshjnOpuPQE6d83+4QMf2Wa6KL2yQ/?=
 =?us-ascii?Q?HzoEuf0Wv06RhyzOxvc4tKviCC1uCbAsDbvs6EUhNPRebYE8X+HEwygb5GLY?=
 =?us-ascii?Q?cLGMmTY9NdJp3KptVYEz0q2g34LxDKmWxctE8IyNtFe9Y4ZtdioTsuhC7pOS?=
 =?us-ascii?Q?bxCNSDSP53+zpIIHWmnJX/bQxCq+lwyeDVpV+7QZp2n62ZEntIyLmSrRnZGq?=
 =?us-ascii?Q?2wQpZ51RjZ3XvVjlhx1mv161s62XBe+93kGbQLLWU2yBGZx0wdgILnIIpG8S?=
 =?us-ascii?Q?gi9XJpWgKvCBXvnodrEkqNGAFvLScd34nW5zpn3eOrlN7rtDJ62KLs9RFJ52?=
 =?us-ascii?Q?5o6IaOcqvF8ZwO7nFDOa7ndUS0PhNd2TBp+S?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5653e39d-8bcb-4942-37bb-08dafd81d9b3
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB3022.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 20:38:57.4793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LfLxSRa+S2Y78rPXC3npeZGVVIXliV5KbuCfo/eVplP0UYI27luJqQJYsyYpq6NDrAxOoo2S7KH5XtXkO9lKoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4622
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 bulkscore=0 mlxscore=0 mlxlogscore=465 adultscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230196
X-Proofpoint-ORIG-GUID: T5f6sloYXiQs4Bcfngq21MrCyjx-6X5W
X-Proofpoint-GUID: T5f6sloYXiQs4Bcfngq21MrCyjx-6X5W
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, Matthew Wilcox <willy@infradead.org>, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundation.org, tatashin@google
 .com, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michal Hocko <mhocko@suse.com> [230123 15:00]:
> On Mon 23-01-23 19:30:43, Matthew Wilcox wrote:
> > On Mon, Jan 23, 2023 at 08:18:37PM +0100, Michal Hocko wrote:
> > > On Mon 23-01-23 18:23:08, Matthew Wilcox wrote:
> > > > On Mon, Jan 23, 2023 at 09:46:20AM -0800, Suren Baghdasaryan wrote:
> > > [...]
> > > > > Yes, batching the vmas into a list and draining it in remove_mt() and
> > > > > exit_mmap() as you suggested makes sense to me and is quite simple.
> > > > > Let's do that if nobody has objections.
> > > > 
> > > > I object.  We *know* nobody has a reference to any of the VMAs because
> > > > you have to have a refcount on the mm before you can get a reference
> > > > to a VMA.  If Michal is saying that somebody could do:
> > > > 
> > > > 	mmget(mm);
> > > > 	vma = find_vma(mm);
> > > > 	lock_vma(vma);
> > > > 	mmput(mm);
> > > > 	vma->a = b;
> > > > 	unlock_vma(mm, vma);
> > > > 
> > > > then that's something we'd catch in review -- you obviously can't use
> > > > the mm after you've dropped your reference to it.
> > > 
> > > I am not claiming this is possible now. I do not think we want to have
> > > something like that in the future either but that is really hard to
> > > envision. I am claiming that it is subtle and potentially error prone to
> > > have two different ways of mass vma freeing wrt. locking. Also, don't we
> > > have a very similar situation during last munmaps?
> > 
> > We shouldn't have two ways of mass VMA freeing.  Nobody's suggesting that.
> > There are two cases; there's munmap(), which typically frees a single
> > VMA (yes, theoretically, you can free hundreds of VMAs with a single
> > call which spans multiple VMAs, but in practice that doesn't happen),
> > and there's exit_mmap() which happens on exec() and exit().
> 
> This requires special casing remove_vma for those two different paths
> (exit_mmap and remove_mt).  If you ask me that sounds like a suboptimal
> code to even not handle potential large munmap which might very well be
> a rare thing as you say. But haven't we learned that sooner or later we
> will find out there is somebody that cares afterall? Anyway, this is not
> something I care about all that much. It is just weird to special case
> exit_mmap, if you ask me.

exit_mmap() is already a special case for locking (and statistics).
This exists today to optimize the special exit scenario.  I don't think
it's a question of sub-optimal code but what we can get away without
doing in the case of the process exit.

