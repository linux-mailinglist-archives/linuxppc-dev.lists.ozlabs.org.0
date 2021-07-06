Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DA283BD8EB
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jul 2021 16:48:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GK5651ck7z3bXn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jul 2021 00:48:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=ljpM9895;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=dTxG3qWm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=konrad.wilk@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=ljpM9895; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=dTxG3qWm; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GK55S3qrCz2yMP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jul 2021 00:48:10 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 166Ea92x007666; Tue, 6 Jul 2021 14:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=WU+kWS+XFwScrBHDFLuHuPL8XAeR1HWcalcFJDsg5/A=;
 b=ljpM98954IvHlAJtclNXnzXU4bMz9wn7GaK8celDgHItU3i1yeDwdbg+ZsQDArrXuQxC
 imZllZaAKMFdKATE7d+bWo7vBXIAwdwVF1/FfCFHJA93dK6oHtjqfLzp9ME8PDtvW0oU
 vwgmGG5Ae5vTrDfFJurOG6byc3EyZv7ptrcTPlrt9HZNzqwTo6ptBTANNS+Yq4LW1t0s
 bQr20/8oupHA8HBMaN6kHlhIFv4cBiL6xSPakuRkKkMKBkajaaTxP5f55D4yO+Sazp/v
 1rgLevs4fkbDwG2oMpadh3Ks2Kz+bojXWijZEvR+FL8TPeUtG5shX3/KbABlhjeop55v HA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 39kq8eb22y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 14:46:30 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 166EaUSp016951;
 Tue, 6 Jul 2021 14:46:29 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2168.outbound.protection.outlook.com [104.47.56.168])
 by userp3020.oracle.com with ESMTP id 39k1nv635h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 06 Jul 2021 14:46:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZGnTw1swKcW5ip8J4JmjZSqOFUFv+Z7J0PAEOYO/6hNXTzdXvOLrNAirdhv4zbr3UlF/r/p0OOemrO1JjsCFhreATieBhz99voxQU8q71X2xJBRqcWi9BYHQGz4JFV25lrk2xgYgIyzQI0DvhF6Nhfl5NAaL8TKU270O+sVU6vjQtOiMbQLUrw38R2ETunyQaEdc36d4X7G9z7nj4KZK2nex88XVBhoDHfx6IErHoiASubQvLS2egua3f35RIDd3Hj3KPM3df+KHKhDv26uaQiAB1nut5eGzEop+G1jrRAh+YMaaoJudf/FpfaA6A07165gif9un55Ti8lm2F6rjjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU+kWS+XFwScrBHDFLuHuPL8XAeR1HWcalcFJDsg5/A=;
 b=UPgeZ49NT7JcUfjo6Rpw3D3Et0hbOa8BX0EQbXpm271GjU+mNAgIK/fdGjUB4fjn87bVL0qASWFDfEOlxs7zWPaTJBHG3V/enVlRnUfKdIvKRYOHjabeMr5PUChKJH/dOR5xnJ+EjH8cAxdYX65PQbxo3oEBDo5bQBP/n0XWzOyNwPabFdnOJeanH2JYLpnqGeY05OKkSSfZtsibhQPwV+C+hNy3OTusnOR+iVbEs93rY+ND+KH3vKd93+AGI0T8jo86akEFjQkqPdEoveBT5G8g5YLEcBbuQJQuXECUYyQjdR1OCyau+KWI+V/Sm8GXRdBWXGp6DD7Pcm/4zCwrIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WU+kWS+XFwScrBHDFLuHuPL8XAeR1HWcalcFJDsg5/A=;
 b=dTxG3qWmEG98UvY0KgSxasmXk1z+hyVb1s/lfz6eLJJ97qyZaYDWAzWGs/1d1V9te3baS2j8lKrSOJGfiA0OU3ovAL3oqigBm8H/6DnuIJy/c84pLBc7FWGhY036bxMmM2VrrFd9FrMna/eKWOvp0ktvvP3s9Tnwp1JESmmtrPc=
Authentication-Results: lst.de; dkim=none (message not signed)
 header.d=none;lst.de; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BY5PR10MB4148.namprd10.prod.outlook.com (2603:10b6:a03:211::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Tue, 6 Jul
 2021 14:46:23 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4287.033; Tue, 6 Jul 2021
 14:46:23 +0000
Date: Tue, 6 Jul 2021 10:46:07 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH v15 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <YORsr0h7u5l9DZwh@char.us.oracle.com>
References: <20210701074045.GA9436@willie-the-truck>
 <ea28db1f-846e-4f0a-4f13-beb67e66bbca@kernel.org>
 <20210702135856.GB11132@willie-the-truck>
 <0f7bd903-e309-94a0-21d7-f0e8e9546018@arm.com>
 <YN/7xcxt/XGAKceZ@Ryzen-9-3900X.localdomain>
 <20210705190352.GA19461@willie-the-truck>
 <20210706044848.GA13640@lst.de>
 <20210706132422.GA20327@willie-the-truck>
 <a59f771f-3289-62f0-ca50-8f3675d9b166@arm.com>
 <20210706140513.GA26498@lst.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706140513.GA26498@lst.de>
X-ClientProxiedBy: SA9PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:806:24::16) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from char.us.oracle.com (138.3.200.56) by
 SA9PR13CA0101.namprd13.prod.outlook.com (2603:10b6:806:24::16) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4308.12 via Frontend Transport; Tue, 6 Jul 2021 14:46:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3025c928-428b-4e34-408e-08d9408cd2e6
X-MS-TrafficTypeDiagnostic: BY5PR10MB4148:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR10MB41488CBFBBC87F5A0D8771B6891B9@BY5PR10MB4148.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zF6soiZvqQ5qK3hqPmokbLbv7oSQfaV92o/5XjwtoXrBZWQFQPz+wW678QL4wTY5k5ZCfXWq5Lq8r4W+6DdO4dp4dxT8OB58Qh+3Gso3HkYUhPjLIE4B3WSMht+E6V+A++qEKz7lO+Ds8jc3+wCUe9nxeH8NXRt1e5eQQf4lv1u4r5rYwv+vRBuTDJbDeTolJnrd23RSyc9mRbqkBgaFHGOxk9ymj3WWeRQy5iPzm0N4KjQm5Lkwa22g394xGUcVc2U99x/DCRYK7HF/t3m+UbpBTQkqE6XV/IPx6WP2XFykVTYnOSnvXfJDdRq1839Pt/59hqSvHEqIyalZiSqlBNNkobvj01ky0rmuES6qv9YstFZUyoLeDdg2AF/pjXiMStTZXEWwgu9ZPSLUIqq9AOudfPABjkgIv8PuX4QyU/NVpy3H7nIkXVayYXsnBCWR6peYbPOhnkJzKXZRLAHu5znTwPFliuTJhcrz/7wVY2EV4Z1SbIz6cQUCv5ttLigzaKaAvQWAv0t2PsnxDoubqArLdRhhwwXGS5WtmNrWAR91QOwAnqK9cEq0MzipvpCbeV6qDNwSkbnGqyDCyIAQt4+Qdz+N3zQEKt29hNwn118pkmgo4V17rlN5f2aIyfkV2IQDgq+9HVmDEMAxSXy/ag2XjG18zq0IKJ/ddCL0H7ylKJVOQfi0Y8uhxTCv18JSiJ3hwKZVHt6KsTdU8FvNhw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39860400002)(366004)(346002)(396003)(136003)(376002)(4326008)(26005)(52116002)(7696005)(956004)(478600001)(66476007)(7416002)(186003)(7406005)(7366002)(86362001)(6916009)(38350700002)(38100700002)(5660300002)(55016002)(8936002)(54906003)(2906002)(66556008)(8676002)(316002)(66946007)(6666004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ylmDwz4fIvOiYvZenj2A98Qc4waYmu0qu9/y10agl2MovOknW/kj9bS4dIKy?=
 =?us-ascii?Q?kzOMtO6hZE/AtHsmdBqyFsgdnfYcpE5Sp0BNocjxGTT0irDdAd9MNu+Zjg5s?=
 =?us-ascii?Q?J0nWMeE6ReYK5jYw8Q8488gHHxN805F8JpvsyzWk/9P4PlR9peIU/x2XDeRT?=
 =?us-ascii?Q?PElgi1zHnvjyncWax6mYAlgxusncGDEZHPkI3g9cqdrUxsK5T63iNXOjQeND?=
 =?us-ascii?Q?X2OH3l6sC1hjDvC2gxupEHJPgB0vQmdo7YDJOvSqs+glaIuqW+IfQxcXK6Or?=
 =?us-ascii?Q?sxQm1ieS8n1xc0ZQD+zAiOT0bg3+LTYaGiO3f3jPk+cEPzeQAIiZY/qTA2Vc?=
 =?us-ascii?Q?PHyzUMD+nar9xGaOTvtvmh0Td2Mfv35JASQr5NpY29dh7s4Klrcniy74BOf1?=
 =?us-ascii?Q?u7s2ppj7XsT4xUqSxQJKSPMAn9xnQfNKgVNl4D8BN0mXzQv9smLhlJhE7h66?=
 =?us-ascii?Q?fdIwcvJp3+Hb0GH+uMslBX4I3nYNSde9d+YKYY0zhlZ7xZ6QFgzYAr+35dSa?=
 =?us-ascii?Q?GwlxnQfMcV6TMtnShlFSmc4xoTkUgozMyB+fYab7X91e/t6CKtA0WeTZnW3A?=
 =?us-ascii?Q?MUp3YncCSSmEl+Bn2dBW+aR6GDLpZoqaaWivOlHmm0VLZjgb7B1CNsBw4zOg?=
 =?us-ascii?Q?YIPqDTMvrceomjZuZmPRNjkXE8m3bLNchfsW+4XaEmU34JHjrg1RMlUpaIAX?=
 =?us-ascii?Q?AjvmEiXWEhqwHfkvcJkooJGhfla+7D5wZUVA3Oqr4GHJbqSRB1HVViIVd8Pt?=
 =?us-ascii?Q?fhq96k43i7HKe/nLQZxvIBP9dACKZW6kqjrOBc4szQM9NeD28ER9cK7gFX/Z?=
 =?us-ascii?Q?wBj8f3Kd+InP9LraK+pVLaQkizpgNEBy5Khp8LNFwKx2QBsIDRRHe/ph3s6S?=
 =?us-ascii?Q?GGO+JAt6nz61QJ3A6IM+wjxwtQxJWPTxRPMyX5DvrHbN3Umq/yPviooWlcg0?=
 =?us-ascii?Q?3UyFGhYKnKEVLCItFWZVhMr9c9m1RKMmw/80PCQThGkW/KDxP44B0pgQe1wx?=
 =?us-ascii?Q?K0rDHqi80QRNtpL/WpPBJ9dS6rwPzgKNfuhmMlqZRfLmtwpqdIiVl7K5r5X5?=
 =?us-ascii?Q?N7gBvdec0XcBKzaxQi97BsNnG4mvBkgns6pdXToh+XpyLGUOF13XQBKuzElF?=
 =?us-ascii?Q?xHwGFixJJTfRqlAXZRkxIqOR3QWOGz7uPvEG2R+upn/90caFAztXOWhblXTS?=
 =?us-ascii?Q?PUb0BTERL55p1lxuNz7fKdZ9A7SckPqeT+pxjosxGWgt0KF6e/dp5rMZMTE1?=
 =?us-ascii?Q?gZ3mCx6mOReNtlBLTB+MxqKkf1CtyBgkdxWfhIONaPMpJa1i269Tg39PX6FK?=
 =?us-ascii?Q?WZoteRTQ6Xr9npwaCdc1oV3m?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3025c928-428b-4e34-408e-08d9408cd2e6
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2021 14:46:23.0788 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWnBQz0Nm3vUrv9srYd4Kk1ov4KnDekN5v7MvGmwZCxRwUoX4n3GZhCUf/xMSE5l+zgBcq4SLUcaR4pDsl9LNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4148
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10037
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 spamscore=0 phishscore=0
 adultscore=0 suspectscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107060068
X-Proofpoint-GUID: EICPB_qXh3tYgTdDU7lDjxv4jJl8DKoT
X-Proofpoint-ORIG-GUID: EICPB_qXh3tYgTdDU7lDjxv4jJl8DKoT
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
Cc: Jim Quinlan <james.quinlan@broadcom.com>, heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 linux-pci@vger.kernel.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Jianxiong Gao <jxgao@google.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, xypron.glpk@gmx.de,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, Thierry Reding <treding@nvidia.com>,
 matthew.auld@intel.com, Nicolas Boichat <drinkcat@chromium.org>,
 thomas.hellstrom@linux.intel.com, jgross@suse.com,
 Will Deacon <will@kernel.org>, intel-gfx@lists.freedesktop.org,
 maarten.lankhorst@linux.intel.com, jani.nikula@linux.intel.com,
 Nathan Chancellor <nathan@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Claire Chang <tientzu@chromium.org>, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 boris.ostrovsky@oracle.com, airlied@linux.ie, linuxppc-dev@lists.ozlabs.org,
 Randy Dunlap <rdunlap@infradead.org>, Qian Cai <quic_qiancai@quicinc.com>,
 lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Greg KH <gregkh@linuxfoundation.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 06, 2021 at 04:05:13PM +0200, Christoph Hellwig wrote:
> On Tue, Jul 06, 2021 at 03:01:04PM +0100, Robin Murphy wrote:
> > FWIW I was pondering the question of whether to do something along those 
> > lines or just scrap the default assignment entirely, so since I hadn't got 
> > round to saying that I've gone ahead and hacked up the alternative 
> > (similarly untested) for comparison :)
> >
> > TBH I'm still not sure which one I prefer...
> 
> Claire did implement something like your suggestion originally, but
> I don't really like it as it doesn't scale for adding multiple global
> pools, e.g. for the 64-bit addressable one for the various encrypted
> secure guest schemes.

Couple of things:
 - I am not pushing to Linus the Claire's patchset until we have a
   resolution on this. I hope you all agree that is a sensible way
   forward as much as I hate doing that.

 - I like Robin's fix as it is simplest looking. Would love to see if it
   does fix the problem.

 - Christopher - we can always add multiple pools as the next milestone
   and just focus on this feature getting tested extensively during this
   release.

 - Would it be worth (for future or maybe in another tiny fix) to also add
   a printk in swiotlb when we de-allocate the buffer so when someone looks
   through the `dmesg` it becomes much easier to diagnose issues?

