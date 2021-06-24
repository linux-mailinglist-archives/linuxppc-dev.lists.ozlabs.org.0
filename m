Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E447F3B36CF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 21:22:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9qlG4h9Qz3c1y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jun 2021 05:22:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=AwapEz9F;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=lv5vM2Tg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.177.32;
 helo=mx0b-00069f02.pphosted.com; envelope-from=konrad.wilk@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=AwapEz9F; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=lv5vM2Tg; dkim-atps=neutral
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9qkh4MlNz307f
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jun 2021 05:21:48 +1000 (AEST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15OJBqEH025724; Thu, 24 Jun 2021 19:21:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=Q5jxGgw/e7hKqYXxYbU2t6cMICL0Den735IuDjh1eLs=;
 b=AwapEz9Fn4isusfA3zGuaEInXZkBGlEb+1ZsiVmDJRpcmk7RH0/zg04lPgfbHBJUVAZr
 UpsX+ZH4CCKA5VNyl4+RN6fTbStc1giOrabAVIXs82+pF+cQUDdPXLX7Wh+GyQciTi1g
 01TvEtkQAKEiqF/TOqlv2AFEirVNPYFUsdxdtSMRV184a/YziX++8dEyNjLbKTKCtjO4
 RlVmF+7gao7jmZOY/4KN0qQCK2oEALnCFm9wMRrFMXG0if8EZ9WYfPSW6MNd0Wisuzi1
 bBnFi3HJwrsqgq79XkmX3940QsqaN9ecafHt9eKmIbdTtsc9BWMg3lDrcgpB4D31E3ar hw== 
Received: from oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39c8twatp9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 19:21:10 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 15OJHgSF002381;
 Thu, 24 Jun 2021 19:21:09 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2103.outbound.protection.outlook.com [104.47.70.103])
 by userp3020.oracle.com with ESMTP id 399tbwf96k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Jun 2021 19:21:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bsJhIILTZggUN9b2aVXhA72CJGMmfSvKxcl8GoCi5gOkOxApwApWj4dHHwqSjJZwk63Qiwb6ZaOWgv5jCJ5giHkSHTRlRohjap4TJ8gX6dD4QZZSlF+7xWmXKy1IsPZeX9iyWx8YceDW3wWF5SrDqe+kaJHQ2Mhn2QMTNFl5C4bd6Sx2+6/enfGE9x2zwFSuasKiKa+H0tSeDSJz/7I9FKbdw5U5cGYYt1QoltONloTIAuuypdzXnlCM/7W7FDumf9GV6z5qU715zbRpdxj4xT4dTqsTbpi7yq+2QU7PCUMk/u63pq0HMv+Ia3JCKWEX2hd1sYukYKBn8rPTjuw9zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5jxGgw/e7hKqYXxYbU2t6cMICL0Den735IuDjh1eLs=;
 b=h9vQXr7yAwo1dF3Jr2Eu6WhoHSSGuRpIoSRJHdN/uNNNBUSSiUCPvof2dx+ZIj62ZIXngoSd8BaBZ5WCEBulia+B1w90dGcrspsFBO69LwPAuKp07TbgSmPj3pw5S8crsUxIWcBwStUmoxatAl6I5CDLxLXtBFrBuDm+TQ+RRWedvxDENdaAdxUwX5ExndqONyrxRzPcQP/iNE7dns7oQbu4IuqmVGWs82uPNanvnDkKV8CwphV6hPbvNCJJXZ9wNovaiLwnYSFBsNBRvZtNTv/Q8DJ3SHngHtSVrX9SSRJhFMifHYgzwrcuRVAZzxgLYMeBMVQ+r2iaDrVLdN+JsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q5jxGgw/e7hKqYXxYbU2t6cMICL0Den735IuDjh1eLs=;
 b=lv5vM2Tgin8y/ly7lXc68mx37dnRV098CJrmD3i5cpzSsBjE2qGcTrTJX5beuFzThZ8IhtKZUiWGMA7a4Hf7N9V0fYzcbAsx9BKaLxKZp3xGtgbVYPkRvExTAcdQd8GZsz5OdlLx+ikEYw+u2DhFiQjtrjyikX1QbN26ykKJzow=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BYAPR10MB3160.namprd10.prod.outlook.com (2603:10b6:a03:151::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 24 Jun
 2021 19:21:05 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4264.020; Thu, 24 Jun 2021
 19:21:05 +0000
Date: Thu, 24 Jun 2021 15:20:55 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <YNTbF5kP0r+VgO6Y@char.us.oracle.com>
References: <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
 <20210624054315.GA25381@lst.de>
 <CALiNf288ZLMhY3E8E3N+z9rkwi1viWNLm1wwMEwT4rNwh3FfwQ@mail.gmail.com>
 <364e6715-eafd-fc4a-e0af-ce2a042756b4@arm.com>
 <20210624111855.GA1382@willie-the-truck>
 <452155d2-c98e-23f6-86d6-3a2ff2e74783@arm.com>
 <20210624114829.GB1382@willie-the-truck>
 <43ec9dd6-12c0-98ec-8d5d-b2904292721e@quicinc.com>
 <YNSq56zyJ7EYdTcI@char.us.oracle.com>
 <CALiNf2_WCVodEZJz9PaCTgk_c8LpOAcD4=YZTLDMVyorJs3ESQ@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALiNf2_WCVodEZJz9PaCTgk_c8LpOAcD4=YZTLDMVyorJs3ESQ@mail.gmail.com>
X-Originating-IP: [138.3.200.25]
X-ClientProxiedBy: BYAPR05CA0015.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::28) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from char.us.oracle.com (138.3.200.25) by
 BYAPR05CA0015.namprd05.prod.outlook.com (2603:10b6:a03:c0::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4287.8 via Frontend Transport; Thu, 24 Jun 2021 19:20:58 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 20a391a4-213a-4ec3-68bf-08d937453637
X-MS-TrafficTypeDiagnostic: BYAPR10MB3160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB31604EE3C3F8658D0C7EA04489079@BYAPR10MB3160.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pYdgjjoUa/aadMQBwtD/HaKpdIg+4KgIuqoO2rsqwrEDpqRstvBdYENPfVnLzWHpNJjCHb9QbFMNnnTXwDfvjxsk05OWAn+ZZk7ZqrLSI/82FebrxBSJvfxTRi84KplYBLfPwiY1CCf+Rosv1U2n9pT+C6fVNAe81HhPD8uy531LADjyi3y2bFtLdxWkKKvJyke4G1NOYYAQg7F3HN1RVSPMgJlrQVI5bRT0R9fKz6TprhsQ5t6aR2CJ7oDMH1Ee5e1I8JyZJnNA0swpLooRhSzvzcaVqyBmXNRZwKkm+fse0vKviaVCEhSbgp2e16HdF1mZTLVQJHjfe0ibfaA5O16XkqiT0OJiCMo74bpd9eC4ahOLvF5pdpUL1G5sXnuEP8LkhAIbS0t2VpDp8WnhOQcXeve3eXgtGWtqU94EFic/C6blK+lGUmM66vBpyt30WIKdjOMJ6d9YSeSIkTbrcbWqIueR/NHLfMoyLLxC9MrH8QUqZ2KnWeNYrcNOa6QlhKHIV78Kv3jWwHqDMfDSRa91HdUC5tBKNECYDLBjHEASp9gW/+8Ld/94wvQBjfJsHiyc96nKbT8XBEoIhf5OHqvRmzW/TMknGru8oRla0WOtph/GqlK77xAr6fuBkQ8wf65//wDzww19mnuEpL0OQxZ3uejrISO2yLFunffeOXH7X3B8RKmV0Yh6ZshLRdYno4xAd2lcvRL1AuIJPfPT5yuM0NBzvHEx0tsSA4BEIs17wagt+7Va/75gfDlf2eF6PkCorBd3yT/wMYNPWnjYKtySAnEzW04zG8g/1b4xmlQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(396003)(346002)(39860400002)(376002)(366004)(53546011)(4744005)(54906003)(8676002)(5660300002)(316002)(86362001)(6916009)(478600001)(186003)(7406005)(2906002)(55016002)(16526019)(7416002)(26005)(6666004)(7366002)(38100700002)(52116002)(66476007)(7696005)(956004)(66556008)(4326008)(38350700002)(66946007)(8936002)(67856001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?meXSVjMpKq5RD4mjjT4/Qr7D7Q+QArEjVUVFZJT5oEzpGZFSOcI/yS9ccoxe?=
 =?us-ascii?Q?wI7pWoyITasmJCxtrUrlSo/hS2gKObh4hQtKhQDcx8HpRaTF4edWfIHa2SkZ?=
 =?us-ascii?Q?stvqg/xXlbOgXxvr5tslAWOlx8yFmmZvJb/mmxwvNVSnqeY6v2LPJYLnhSJn?=
 =?us-ascii?Q?aaNZJ7egPtod5QNSQ/zLpgo9Z8pzH0Mi75m7foM6WfZLewba4z92mM2/cnLe?=
 =?us-ascii?Q?TpgdrUWmpvpZ8FhpfK8nnRKWgMZeRL9Jli2vrkP/8cEjkvJw2f0c935CSi7P?=
 =?us-ascii?Q?67DB/0AkyD3Pb2IMnaOfqNG2esagbl9E/qjDjojDVGuUWVI7/Dzxkr5XHpYW?=
 =?us-ascii?Q?FdSZ/L5ZHM3JHYTDKTv5/bPzBtInxgXW0hvL4CSz1g+nzKc/PYcoJWDiboI8?=
 =?us-ascii?Q?zmAtuOek2Y29sidRZzl5CVTlRne/nTpkfxTGqQwLaiT7GYSZjBjmQ1dPoNM0?=
 =?us-ascii?Q?Ybqp6McVr3nGiSNQUm9QzT6zTBI7URhvkTqjbqbAvZZP6TLp311YWran4Dmj?=
 =?us-ascii?Q?eX6M42+vJ/A85WLbTZgGfZQA5TMu3cmBqs7Wbu2k/uZWkUAP/wudlw6xRNtU?=
 =?us-ascii?Q?7useIAOiDmMb8arkQy+jWyH1QDjKp8RR7INExGrMzxosIrFHTYbwyyuAQmf9?=
 =?us-ascii?Q?N1tJ+ilwRrZlCPpgy9BAwHVzXZkbLA3QOKiuAqrOpvWscu4eNpNhNx5WyNb1?=
 =?us-ascii?Q?DdFRdepguoe4L0y2Hlf1GhjqxurSVJTnqJ5DA7XdwsuqQPDbZgR1Ya5Ks+sZ?=
 =?us-ascii?Q?bVGV0IjPkUisUct4x3thR1ymDEfLeU8NlYcb5JOhQuZkP7gKa+jlak0HSc9I?=
 =?us-ascii?Q?xRTEBqH9Nsnw1FxWixrO/579nemhCY+MoyhbWYSKN/+VDqcsELR110XP2BjM?=
 =?us-ascii?Q?/ctaZwoWMQX1LdRpKO9EzMG/WYN0hukGlnX7fyazUCETSDeoG+r475DqEnjZ?=
 =?us-ascii?Q?CenePjAGDu48t5PTi2Slz9HrZR4MUzGLBWJvecVcgD6pUX96GCbQdfBwiXEu?=
 =?us-ascii?Q?BFdSlGQAFG+orSOAoT0AmH0v4X1NqVcZVtZ57rUG548tSEajIgAB6ADfs+EQ?=
 =?us-ascii?Q?Uj2xGAo6Tsh9QKLAFrZvdFifHZaMfYq2GGOpA+ZAiMdIiQnNIZT+xFoqZQ5w?=
 =?us-ascii?Q?3boPCIdkRAZIWTt0uQB86DYbkUQUozkfaKUQkzWI2TUZmNdC27dM8QcjNMfG?=
 =?us-ascii?Q?D6qyA3rB5B0gADdrjhbGjV8ULm8zWAq/yC5toUEPNf72nl94mwq1NYqT+pq3?=
 =?us-ascii?Q?1dkzG1Jgs4D0hJtYoL6gzcU1pKDDJHsMSzxQdSQn5sifopfJbrigdqAK8WT+?=
 =?us-ascii?Q?C7DTauQD5TUqGkw6+haxD630?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20a391a4-213a-4ec3-68bf-08d937453637
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2021 19:21:05.4356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 82hHNNiOaxu54jnsZ4uTpzVrq+TlaocBwcIevDh/KhHXr/l8iUrl6xoWdmw7bEEIWdz2uCVQRg7ZaiQhMoWsGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3160
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10025
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0 mlxscore=0
 spamscore=0 mlxlogscore=999 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106240106
X-Proofpoint-ORIG-GUID: 6iDfD9Kng50yFMMjc0HRylcYvzz-gyz5
X-Proofpoint-GUID: 6iDfD9Kng50yFMMjc0HRylcYvzz-gyz5
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
Cc: heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Jianxiong Gao <jxgao@google.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 Jim Quinlan <james.quinlan@broadcom.com>, Will Deacon <will@kernel.org>,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 airlied@linux.ie, Thierry Reding <treding@nvidia.com>,
 linuxppc-dev@lists.ozlabs.org, Randy Dunlap <rdunlap@infradead.org>,
 Qian Cai <quic_qiancai@quicinc.com>, Greg KH <gregkh@linuxfoundation.org>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 24, 2021 at 11:58:57PM +0800, Claire Chang wrote:
> On Thu, Jun 24, 2021 at 11:56 PM Konrad Rzeszutek Wilk
> <konrad.wilk@oracle.com> wrote:
> >
> > On Thu, Jun 24, 2021 at 10:10:51AM -0400, Qian Cai wrote:
> > >
> > >
> > > On 6/24/2021 7:48 AM, Will Deacon wrote:
> > > > Ok, diff below which attempts to tackle the offset issue I mentioned as
> > > > well. Qian Cai -- please can you try with these changes?
> > >
> > > This works fine.
> >
> > Cool. Let me squash this patch in #6 and rebase the rest of them.
> >
> > Claire, could you check the devel/for-linus-5.14 say by end of today to
> > double check that I didn't mess anything up please?
> 
> I just submitted v15 here
> (https://lore.kernel.org/patchwork/cover/1451322/) in case it's
> helpful.

Oh! Nice!
> I'll double check of course. Thanks for the efforts!

I ended up using your patch #6 and #7. Please double-check.
