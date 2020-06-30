Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8159F20FDE2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 22:42:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xGWn1p1SzDqsL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 06:42:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=nvidia.com (client-ip=203.18.50.4; helo=nat-hk.nvidia.com;
 envelope-from=jgg@nvidia.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nvidia.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=nvidia.com header.i=@nvidia.com header.a=rsa-sha256
 header.s=n1 header.b=HsMARRVI; dkim-atps=neutral
X-Greylist: delayed 310 seconds by postgrey-1.36 at bilbo;
 Wed, 01 Jul 2020 02:29:53 AEST
Received: from nat-hk.nvidia.com (nat-hk.nvidia.com [203.18.50.4])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x8w122KzzDq7j
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 02:29:52 +1000 (AEST)
Received: from hkpgpgate102.nvidia.com (Not Verified[10.18.92.77]) by
 nat-hk.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5efb67400000>; Wed, 01 Jul 2020 00:24:32 +0800
Received: from HKMAIL104.nvidia.com ([10.18.16.13])
 by hkpgpgate102.nvidia.com (PGP Universal service);
 Tue, 30 Jun 2020 09:24:32 -0700
X-PGP-Universal: processed;
 by hkpgpgate102.nvidia.com on Tue, 30 Jun 2020 09:24:32 -0700
Received: from HKMAIL103.nvidia.com (10.18.16.12) by HKMAIL104.nvidia.com
 (10.18.16.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 30 Jun
 2020 16:24:29 +0000
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.108)
 by HKMAIL103.nvidia.com (10.18.16.12) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Tue, 30 Jun 2020 16:24:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CcPJsECZHGK9YklLcuvlrPJAa1fBLxBO34FmABzLbZGt2MfNPp34/TI4OBlKF23Lu8syoU5Gb4fSHE13WW4F6SL7zCMUJIzij7XUt9UXgsQpAFw3vj/Qk4Fq55uqCzxYZD/hXxRKGzlAdW6Y8piEgrUUSZAPzkS98RDER1xQhFnJjW6jv2P/mqvZuxnYuT72xiA6Bvk3IoIpIGEG4z46E685+6wF4rH1XVx97p4xDW5A74vVIuT/eORyACh87SvaEsOZi/xHLNTbwnGwo3OCP3dpRAbLuT+hOypmaM+cXybDiflIIW4u+d7gwHCF4R234aIWiMrXVFP/Q97svBNxDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tf2dhcL9+eo1RGk9caIfOU3fOhh/3KtsfCSJI4l1GHw=;
 b=K0DerbL9pLea0HuE0J896jSYDpAeL0ghQGBt4wAgXZsyQwH68K02qasZmt02oiULGXfxcbhh1gtK7UJKoC6IwpR+hKBGUkHfNWkfp5NARAC1Yc3cZ59KDsahvqWJzHQ78DcFmj2rR1Q5IY6EXb8R030muNtUKfFE722tM2EOJANxOY7+0/86u4IVF4e4MmwSGN704YXxylVbyDtojuxR2Ay+fFKYYiXyvWU0qfTGGYvUpdqlmqFEtphDxgjGCZKFUJJnqTWokSyCt1qv7rAIYmNzugjz/LkqS5wrzbh4/vs3lopuSe5pTtbKRg12DsHpWA2qkZL1DygJZF0d5m/d6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM5PR12MB1148.namprd12.prod.outlook.com (2603:10b6:3:74::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3131.24; Tue, 30 Jun
 2020 16:24:27 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1d53:7cb4:c3d7:2b54]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1d53:7cb4:c3d7:2b54%6]) with mapi id 15.20.3131.027; Tue, 30 Jun 2020
 16:24:27 +0000
Date: Tue, 30 Jun 2020 13:24:25 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: <refactormyself@gmail.com>
Subject: Re: [PATCH 0/8 v2] PCI: Align return values of PCIe capability and
 PCI accessors
Message-ID: <20200630162425.GA442499@nvidia.com>
References: <20200615073225.24061-1-refactormyself@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200615073225.24061-1-refactormyself@gmail.com>
X-ClientProxiedBy: YT1PR01CA0101.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2c::10) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YT1PR01CA0101.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3131.21 via Frontend Transport; Tue, 30 Jun 2020 16:24:26 +0000
Received: from jgg by mlx with local (Exim 4.93)	(envelope-from
 <jgg@nvidia.com>)	id 1jqJ3Z-001r7m-BT; Tue, 30 Jun 2020 13:24:25 -0300
X-Originating-IP: [206.223.160.26]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a534225-7b32-49c4-4a37-08d81d120ebc
X-MS-TrafficTypeDiagnostic: DM5PR12MB1148:
X-Microsoft-Antispam-PRVS: <DM5PR12MB1148183C60C0FC008ED7B4DEC26F0@DM5PR12MB1148.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2089;
X-Forefront-PRVS: 0450A714CB
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3XPA2mmporxd5D9lQSVd/w3UNdpOTkYAyDeRptOQ+3mdoGdmGzeaXYEED+RoOa61P3nzZIpgI9sEW4ClSwxU1wbAkpTbvQBgv5CR0hG2CHA9zaJIN0pNPb5Gjv4JtWPuTVl9L+pbiiVI0wiTo6+oiWYyNuvrbDCJ7GU62o1wOXL9fbBYDjtVIxVaNjinuSxqJSq0g6VDGYBk4ZXJ4bJlM56JYZErSXmclCAlX2z8xLjrSv4x/NUs/0cmxCWM0YaN4JPlju9dIBiIxqWxBOPcZ/mPAXsO5BU2mbQIfM20I7I+LhxH1vezIiWyAZXWBOtayVIs36DedBsEyc8IzUecV1WJ5iydhq+Dmbir6aXZP7pNprziQy+rA3VahyYi5ozE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFTY:;
 SFS:(4636009)(366004)(39860400002)(396003)(346002)(136003)(376002)(426003)(54906003)(36756003)(478600001)(186003)(316002)(26005)(33656002)(2906002)(4326008)(5660300002)(66476007)(8676002)(558084003)(7416002)(66556008)(2616005)(9746002)(9786002)(1076003)(8936002)(66946007)(6916009)(86362001)(27376004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: 09afyx1Vygn3DWQT3nHWI32fN/JAaWD8eJvQYVH8FzN4Q19YhTtvuTGhY39r6AKCfvmkaISzbTyGlrSrdpEm9p3sla5Cm54NTJCnLlrvTvrxsTSzqpMw2WKBZKAPvHScEKKZXS1v3H7/BgAvLD2TmX/tBCuc9/hfxSbX/tD8a3HcjfOfQDOjQUE49cRPAHhP31mun1sp2SpSjCIYWGZE0irwMIAg1Kzp+BeZkjiGUNlLuGw9eh26BQp4TDcdDTXuVLUU70rR59TVtZLWATNziJ5AOkxcCxHN6qxJiJTJha2PtMfa4DGSbL6eeaj2gU0FPqxJ9Tx6Bfu8N14zdZR4YKtPJeBfTFp3RpDGL/JtglcCF3IhH226mQ0ThHv1d2e7a9p+VS2y/X1CJBS7sL0KCXgBEzA7//z0C24j9rjbJi2sJJ8Zf/iTcGUfCu1eYcSpLzzWURdJzmlw6Z7mBXMO7oKQx17JCV/sAE2gAsyToN0F7ySURKn3U0wOj+NVjGCd
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a534225-7b32-49c4-4a37-08d81d120ebc
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2020 16:24:27.0560 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sZyulziyqRoJ09NgMW8dgaI5LP0LWmkpbCsYy5hVK+28abFou1qeF8SSXD7eXi89
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1148
X-OriginatorOrg: Nvidia.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1593534272; bh=Tf2dhcL9+eo1RGk9caIfOU3fOhh/3KtsfCSJI4l1GHw=;
 h=X-PGP-Universal:ARC-Seal:ARC-Message-Signature:
 ARC-Authentication-Results:Authentication-Results:Date:From:To:CC:
 Subject:Message-ID:References:Content-Type:Content-Disposition:
 In-Reply-To:X-ClientProxiedBy:MIME-Version:
 X-MS-Exchange-MessageSentRepresentingType:X-Originating-IP:
 X-MS-PublicTrafficType:X-MS-Office365-Filtering-Correlation-Id:
 X-MS-TrafficTypeDiagnostic:X-Microsoft-Antispam-PRVS:
 X-MS-Oob-TLC-OOBClassifiers:X-Forefront-PRVS:
 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
 X-MS-Exchange-AntiSpam-MessageData:
 X-MS-Exchange-CrossTenant-Network-Message-Id:
 X-MS-Exchange-CrossTenant-AuthSource:
 X-MS-Exchange-CrossTenant-AuthAs:
 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
 X-MS-Exchange-CrossTenant-FromEntityHeader:
 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
 X-MS-Exchange-CrossTenant-UserPrincipalName:
 X-MS-Exchange-Transport-CrossTenantHeadersStamped:X-OriginatorOrg;
 b=HsMARRVIdCuTSSBs8zmFYQOvzWCzbfgbyUub6vj2coY0KL3H8860ywhgI2ULPBE2d
 J9bc+8RjX7OLtatIXGW+oQJG2kqpd0T7WH79D9Js68fH/poAGD42OLKJEsATvRVTAU
 Rh/E+i/elKdbNWvq0P1YT+Sb49BKv3DbMxhsdEw8XT0daEiIzD2cbh2mru2a7T8G5D
 8QOFxtNUGBMKubvCACV8N6o8WrS55d2rpwv0uM4Lt/A+UanxXYI/uAResytJ/G5S9u
 TT9nWmInsNgmwm71mLDLztCIF7GhacpIDFc7uw6hYHysRFDvDY1gWGpJoj/ZiPA3UI
 93tIOuis4aCnQ==
X-Mailman-Approved-At: Wed, 01 Jul 2020 06:41:20 +1000
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
Cc: Don Brace <don.brace@microsemi.com>, Sam Bobroff <sbobroff@linux.ibm.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>, linux-scsi@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>, linux-rdma@vger.kernel.org,
 linux-pci@vger.kernel.org, Dennis Dalessandro <dennis.dalessandro@intel.com>,
 esc.storagedev@microsemi.com, Doug Ledford <dledford@redhat.com>,
 linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
 Vinod Koul <vkoul@kernel.org>, helgaas@kernel.org, skhan@linuxfoundation.org,
 bjorn@helgaas.com, Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jun 15, 2020 at 09:32:17AM +0200, refactormyself@gmail.com wrote:
> Bolarinwa Olayemi Saheed (8):
>   IB/hfi1: Convert PCIBIOS_* errors to generic -E* errors
>   IB/hfi1: Convert PCIBIOS_* errors to generic -E* errors

Applied to rdma for-next thanks

Jason
