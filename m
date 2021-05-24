Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 548D838F17C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 18:25:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpjH51lpGz3bnj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 May 2021 02:25:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2020-01-29 header.b=vLNS1NYt;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=TwpZ4hb2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oracle.com (client-ip=205.220.165.32;
 helo=mx0a-00069f02.pphosted.com; envelope-from=konrad.wilk@oracle.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256
 header.s=corp-2020-01-29 header.b=vLNS1NYt; 
 dkim=pass (1024-bit key;
 unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com
 header.b=TwpZ4hb2; dkim-atps=neutral
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpjGT1b0Hz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 May 2021 02:24:33 +1000 (AEST)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14OFW6We006046; Mon, 24 May 2021 15:53:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2020-01-29;
 bh=A7JwayUn9NB8mCxjunudM0ZYoEEzZyrOR+KOm3Nbk/Y=;
 b=vLNS1NYtPu1R+6D8v9fR+7tu1wakKWhso4S4TMh1hXnHktYgdbka69vwwM0Ebq9H2LLT
 BaHPLTI6m5bPywWO8BDR91EfNnWKXHdSYfYLQoGVHOnlaeUWTxak+iz0H42zrjRXVqoN
 DBknsO4TW4REbFb4VMzlFMMgZv/tiz8izHPT/FjkB8qt5ggZXYFeqbgWYthKUzM/LgHl
 5zM3Pu3d9iUpqo8vFLdtj5K1fd/+gczS3SipYMfxocmVRr9Rwuh+kLKYI7D/iMncEESA
 qLmHLkVbqR96lPzGoQogxLVx+8vcnkZBDprVOEEuGDDm1zp/9yIuRzhvHilZhCJ7/maE jg== 
Received: from oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 38r267r8ng-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 15:53:35 +0000
Received: from aserp3030.oracle.com (aserp3030.oracle.com [127.0.0.1])
 by pps.podrdrct (8.16.0.36/8.16.0.36) with SMTP id 14OFp07H032145;
 Mon, 24 May 2021 15:53:34 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2046.outbound.protection.outlook.com [104.47.74.46])
 by aserp3030.oracle.com with ESMTP id 38pr0b4701-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 15:53:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoyzvSeybqrYgtTdx2epAplFD49dsvlNWVgf6y5jjwphzehjOl59t4EAK7hc9srv9KEmBVQWe1TSwZhZl8fV1DGtrUn8gskBlGAMISDn478ClkyoeQSYKeyIEoIKhFjGA+i+zbFLXW+arWi5qYPIRdDS1llVpGkQ8F+zsXq25hNTY/PDJWmK685us1zD406vHQoBVQRNwknB96BeectJ4unOnjJjmTgb3wWl3KWzjo/R5nOm9byEdpxuCDh6eGWY6gkuUZ3tptQ0D3Rgdlku0yNTn/Fk7Iuqv0XwB8o68F6QFnVwYIKQVtFakTnlCPO/SOOmk4kNCJJE7uVLaycZ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7JwayUn9NB8mCxjunudM0ZYoEEzZyrOR+KOm3Nbk/Y=;
 b=oRwSdKTweSsbA4+gVwABEjikbXLUbRQm6SJJsdzZOjhWkib0yzHMZ0bqkfHujfeakLlNfksaSNCBRL0GXx6CPdu8xprbRCGVCQDGy7d8nzmty88RNYOUu59N7+2rsxv7MF++HEEyljuYu06CT6SU9/MyfbSQ6txjfJnsa4ye164WPci/QcOErKEz1CUKGKeoFbehMaYwn5T47mPOCnODsQ9spG2sLGMxftsuEoY8JiN2R8gMZgfqAJDo/RTMwbgGs2mhzgJFLrTKx91paBilvfLAyLdrCMWTfXf/dyhLDCd67/rV9f7c0ku949ygOzNgU6O0k+lKVvvj8iRTGNB8bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A7JwayUn9NB8mCxjunudM0ZYoEEzZyrOR+KOm3Nbk/Y=;
 b=TwpZ4hb2LByKNEYWDv/1b3QPaOvXgSKfc63kxrzyEKQCQJF0HOiGMhbyptD+IQ5xSQggUzakW1jjRKFymb2QW8LZwCqG9YxbWcFu50KHCxMCCHjA+Kzf2GIKczKymocMUS6sGhlVK30vd17t10cxrQIDK/TGvp8H1H2VARpbiDM=
Authentication-Results: chromium.org; dkim=none (message not signed)
 header.d=none;chromium.org; dmarc=none action=none header.from=oracle.com;
Received: from BYAPR10MB2999.namprd10.prod.outlook.com (2603:10b6:a03:85::27)
 by BYAPR10MB3096.namprd10.prod.outlook.com (2603:10b6:a03:151::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.26; Mon, 24 May
 2021 15:53:32 +0000
Received: from BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d]) by BYAPR10MB2999.namprd10.prod.outlook.com
 ([fe80::8111:d8f1:c262:808d%6]) with mapi id 15.20.4150.027; Mon, 24 May 2021
 15:53:32 +0000
Date: Mon, 24 May 2021 11:53:23 -0400
From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [PATCH v7 01/15] swiotlb: Refactor swiotlb init functions
Message-ID: <YKvL865kutnHqkVc@0xbeefdead.lan>
References: <20210518064215.2856977-1-tientzu@chromium.org>
 <20210518064215.2856977-2-tientzu@chromium.org>
 <170a54f2-be20-ec29-1d7f-3388e5f928c6@gmail.com>
 <CALiNf2-9fRbH3Xs=fA+N1iRztFxeC0iTsyOSZFe=F42uwXS0Sg@mail.gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALiNf2-9fRbH3Xs=fA+N1iRztFxeC0iTsyOSZFe=F42uwXS0Sg@mail.gmail.com>
X-Originating-IP: [130.44.160.152]
X-ClientProxiedBy: MN2PR19CA0027.namprd19.prod.outlook.com
 (2603:10b6:208:178::40) To BYAPR10MB2999.namprd10.prod.outlook.com
 (2603:10b6:a03:85::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from 0xbeefdead.lan (130.44.160.152) by
 MN2PR19CA0027.namprd19.prod.outlook.com (2603:10b6:208:178::40) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4150.24 via Frontend
 Transport; Mon, 24 May 2021 15:53:26 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 08e4fc1b-8f07-4c22-09a0-08d91ecc1491
X-MS-TrafficTypeDiagnostic: BYAPR10MB3096:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR10MB3096B6F574AFAD453EFAC5A989269@BYAPR10MB3096.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TsJFGyxezPXIndmWi2tIGB7pMN9ztv7RcFh168v9DkAiVW2GKDctVYUGiOFhQ65EfuLsPAI/crH2cmy51WbjsE+UPrzhoqZY9akD49FZIsRBPacfO7wa2plu24YYqvOttqec+l2eEpgNCfxrV2My8AbdEF+loaulWwCHyOn846TrliNRs7X80aFOWzGw4rBKgzATs8gKfwYhb3wI0Imk5Y4wZyx0B0CuCx012vBA+S0JIkdP2xQcuvIzuSoKJCj3wqO2knz+4NY7suIQ0+1/+szYf/vLFfvy5XwswfhHg5JbYyNVLmaRZkr8G4+2iJUBC7FqWCx5fPpaAyusjIEeVbtL7JTGAL8QkZqNBEDqze5VtYo8O5fIhpYtcdMTF8lf+/AhItZMc66uEWaraKGoJKonCl6gXeKPujgZxwYZ0TSCuHoPdPvTOnFiTw3KJd3j5IKj/y8cd7+D/dhvEnpN3mjj2aws6VpeZmZKN+PqJD9wHv/+RiuZZw88ZvSBo6j8SBZDNX+qwpE+3xoKsYss89gA7e5iw3xLLGPfxqare4eKZ44CKeV7r6bQh5O0f9NBNeW0C222H6ws3WGueEz4j/Jrg5yFWuBkniBSux3rgeUoEjAp24+JF8dHNibzQpHgDF3VPEaWL3wA/mthvpfUig==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR10MB2999.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(376002)(346002)(136003)(39860400002)(8936002)(8886007)(9686003)(4326008)(66946007)(66556008)(66476007)(52116002)(6666004)(5660300002)(36756003)(2906002)(6506007)(7366002)(6916009)(7406005)(8676002)(7696005)(7416002)(316002)(4744005)(956004)(186003)(26005)(16526019)(54906003)(38100700002)(38350700002)(86362001)(478600001)(55016002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?yKZMqEftj8fUJPi6Gyydk5po/IDtKE3QYW3QlmDLM/6uQUS6+ICA21HhoxgS?=
 =?us-ascii?Q?jHHidKgvmQF/Nl8QSARzWqhX9WBedrpIvmjSFG0Rig0vOTBbCIiEzrJjwBr2?=
 =?us-ascii?Q?17RwKzfLDCfh1aHF1ZZvAffYkZ3JEOGtqVpr1PDS2Mct4inKjy2f4b2W6nBb?=
 =?us-ascii?Q?SPSoi+hmUoOyWw4a/bTFsBdMtILjK+Qo+jXVUJX2ik6qkmmBwZlkWrk4RtDA?=
 =?us-ascii?Q?JBiS3T2Z7MhOs0xnSWDMS2LQaTTodv/AaKsOcTAFx2mclhdJ7M4ooVxJX8Al?=
 =?us-ascii?Q?hu1Cu4e2dbTKd1E9crSyo1mlfTgh6Pvfz/MR67ErwCxjMP4iw1NfrFPDy41+?=
 =?us-ascii?Q?uVAI4SLPPSFDnMa05NusOWQRmDUzFJyaJ9TDeN4cAmySEAI4GmBC4WhFZvBe?=
 =?us-ascii?Q?iZLVXOtgmo7W7EjABhuFXFwt5gOL3dsawXN7xkQVccDrWzaV4I6xPYoyiyBl?=
 =?us-ascii?Q?/aBPELm/xb6BaBum6PGNxB8jkLL9X+bplmVOM++x2tmZiIryCJrZdAMS+x0D?=
 =?us-ascii?Q?vbTB+9rxYjEzDZ6kpMx/wSRreQ+GNs+KRF8Kfuh4+Lu1pCBUTHjMErUHiEyq?=
 =?us-ascii?Q?QumlmHebWtQa2+NEngx696gtrakLYFyhD9u9/FtmJrh8Fl743/tEANM3sFnf?=
 =?us-ascii?Q?jc/Bj8iq3zUviqaNWfQxv9wWvwaZi9d5/rbPTxyBZ/8tnTjzuZhEZeLkFo9b?=
 =?us-ascii?Q?aqMHMQxj7MV3OsKZZ2Z+fWJFuJiGFlxaVt4+2aKHBWZHPx1vfhET9LAom8tJ?=
 =?us-ascii?Q?9aZ8Q9ycO7qrWSWM9F+0UeRbbsQHvB8O14Ux5jpSt8T/xbS57V+Ku0AvtALo?=
 =?us-ascii?Q?IKyxBZiri/8wLBrS4sHR5bTZiA45+9Hkzb4zSh11tSHu4/Pie49bN7O8YCB/?=
 =?us-ascii?Q?Pt/weHq391Bs8WTdtMNQLegh9m1EoceInNv87VsmKVSZUKVpG33mWYxJFWCt?=
 =?us-ascii?Q?8/n3OTqlNAEtJtLBUmmQJpWNQh651apWmpmhYlZz4sBpKd31vwWaEmeqCJXj?=
 =?us-ascii?Q?pOreHHq5xq2OXKe1aM14dswYBBAnLOYH8fwErlnKE1VGTgS2kA5RgvCUTFNH?=
 =?us-ascii?Q?bksPyUmQPHvuajUQgBC8a2ZzDKfK5aatcPSS18ZUIvRXPCeVxEVFvBkGo0Gn?=
 =?us-ascii?Q?wgdFgSfytUyX/Phq2pKifHFpQn1a+0Pc+jSWN3SmW6S+K3haInt8K0R3IWiq?=
 =?us-ascii?Q?a47x0pHOP/cj77wIWDcwPHxWq13gTpFVVCPvnw+LDKTsxQ3iJsHzPAx9Ga6k?=
 =?us-ascii?Q?p6vbF9UEKrYNSIg83nDLsQEzqcPd/n0nECi3zijW7veVC/h2pA3664PQZfsm?=
 =?us-ascii?Q?zshbFkdLz+9Mtut9qMmvuDTe?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e4fc1b-8f07-4c22-09a0-08d91ecc1491
X-MS-Exchange-CrossTenant-AuthSource: BYAPR10MB2999.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2021 15:53:31.8226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TwmaXt8HqSELbqkBV+B/DF3SjeYdChpXLoD9nd5acJv8xcUKGm9Cdiv+uBhCXl66yAuGOgtW2aJp6yfIsmpQDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3096
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9993
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 bulkscore=0 spamscore=0
 mlxlogscore=999 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105240095
X-Proofpoint-ORIG-GUID: EHAtG7WMwVF7Lhz1byowmXmOg4cDSTpJ
X-Proofpoint-GUID: EHAtG7WMwVF7Lhz1byowmXmOg4cDSTpJ
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk,
 grant.likely@arm.com, paulus@samba.org, Frank Rowand <frowand.list@gmail.com>,
 mingo@kernel.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, maarten.lankhorst@linux.intel.com,
 airlied@linux.ie, Dan Williams <dan.j.williams@intel.com>,
 linuxppc-dev@lists.ozlabs.org, jani.nikula@linux.intel.com,
 Rob Herring <robh+dt@kernel.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 sstabellini@kernel.org, Jim Quinlan <james.quinlan@broadcom.com>,
 xypron.glpk@gmx.de, Robin Murphy <robin.murphy@arm.com>,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > do the set_memory_decrypted()+memset(). Is this okay or should
> > swiotlb_init_io_tlb_mem() add an additional argument to do this
> > conditionally?
> 
> I'm actually not sure if this it okay. If not, will add an additional
> argument for it.

Any observations discovered? (Want to make sure my memory-cache has the
correct semantics for set_memory_decrypted in mind).
> 
> > --
> > Florian
