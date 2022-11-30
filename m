Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95263DAD6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 17:38:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMlJ42ThQz3bXr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Dec 2022 03:38:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=eTTsW1GT;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=Ausfw2Fz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=citrix.com (client-ip=216.71.145.142; helo=esa1.hc3370-68.iphmx.com; envelope-from=prvs=3264ca9f5=roger.pau@citrix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=eTTsW1GT;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=Ausfw2Fz;
	dkim-atps=neutral
Received: from esa1.hc3370-68.iphmx.com (esa1.hc3370-68.iphmx.com [216.71.145.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMlH340jyz3bWj
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Dec 2022 03:37:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669826239;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=aLK/4rYA/lP/TxDJxKDrnon9y4jvbOFcMo7+a78jTvc=;
  b=eTTsW1GTmYnITqqS/1+GNg9ZJ1lxCeLQEn+0K41uugJdqR28bkfncrkz
   hDQFA0xyOteiE+GEI8OwZaQSHIk7xsCmqj7CYm08pzQKpdltz3+5xJtfy
   upGoRhqIIc5NgwQgXxyAr7lkSvhX8g2eDPm9BWN7l2NxZSx9MsTkacUaP
   M=;
X-IronPort-RemoteIP: 104.47.56.168
X-IronPort-MID: 86302173
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:gJeZBK1xsdz1zXPmt/bD5bRxkn2cJEfYwER7XKvMYLTBsI5bpzMOy
 2NLCG/UOv2IMzT2LoxyYYy+ox4HvpXSzoQ3SVNppC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVlPagR1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfAV9tz
 /cxFBo2YFORodqtkIyiFORnv5F2RCXrFNt3VnBI6xj8VK9jareaBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqvS6KklwZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r82LSXx3qkA+r+EpXj/Ll4jWGO2VUWIx8bU2HrnamyhnaxDoc3x
 0s8v3BGQbIJ3EiqSMTtGh61uniJujYCVNdKVe438geAzuzT+QnxLngJSHtNZcIrsOcyRCc2z
 RmZktXxHzttvbaJD3WH+d+8oim/NisVBWsDYzIUQwwY5dXqvIA0iFTIVNkLOKy0lNzuHTj60
 hiJoTI4irFVitQEv4258krAmCmEvYXSQ0g+4QC/dmii9AJiIom+e5av90PY/N5HNo+SSlTHt
 38B8+Cc5u0TCZCGlASWXf4AWrqu4p6tKybAiFRiG50g8TWF+HO5e41UpjZkKy9BMcECYzblJ
 lDSvQB544VaN3+nK6RwZuqZD8Us0Lj4Dd+gWv3KRt5PeYRqMgiV+ChkfgiXxW+FraQ3uaQ2O
 JPeesH1C38fUP1j1GDvGbdb1qI3zCcjw2+VXYr80xmszbuZYjiSVKsBN1yNKOs+6ctovTnoz
 jqWDOPSoz03bQE0SnC/HVI7RbzSEUUGOA==
IronPort-HdrOrdr: A9a23:ZPSbV6NantNhHMBcTgajsMiBIKoaSvp037By7TEJdfRUGvb4qy
 ncpoVi6faUskduZJhOo6HkBEDtexzhHNtOkO8s1NSZLXjbUQmTXeVfBOLZqlWKcUCTygce79
 YGT0EUMr3N5C1B/KTHCX6DYrUdKbe8npxAzt2utEuFBTsaEZ1I/kN1AhuSCU1tRgNCDYAiFJ
 Wd7MJbpzymEE5nE/hTKEN1INQqELfw5e7bXSI=
X-IronPort-AV: E=Sophos;i="5.96,206,1665460800"; 
   d="scan'208";a="86302173"
Received: from mail-co1nam11lp2168.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.168])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Nov 2022 11:37:11 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c209cZJox8fbDBdJi9CeYWU6m7FTrqY3+WhVSsoFPei1/P1qXtDAN2+bajTlphWPlN2Y0/VNUTnxYtC8T6UQ2PaqxXxFbjmLC7Eu2bPJ6hhpw5mOGSbLz8OscRH29d6cGGLoP0rHds30c/FJ/xz0Bnbr78NNUn4kiTA9BPmkZxjX+TlHqNylGkVUCVds8oLmydZPP/mDJUmBGHG2MwjpAGcz7TMXfXykNlljcocz6NRP8kHVeTVxsdj7jx3Nv3W7ZRyAPt4qmUUnGzKMjfdrUrtniWf5KAaPPCayUChXireV8En/rhq60ZAtxHessSriLhExXNXqD4K48WK42PvoAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TEk6iK5GvuVMLVelUUxiis8clwrCKUaO8K0CKeMME58=;
 b=Fql3cSUfTvkH2EgyWXKoe7FKwby3AyLKSyFj8eO5vlSCljT2Amck684NgwfbOVCPTvOT3OLoFAVz5vPW/ECMLpQ4/zPq9ziJtd1smXVK+XAaXFld26UkAMSVgDAecQZWd+uCfT7YXljp4sHz14ReicalHzJnykXpTbEr7bud+HiNvyHsqDdLjsMXTBUqsRZvPQ0gjjDpQ4UWubht963WYsGewQqCGedBNVUigI77CyohzTy45TagM3ZfIERfrw+VNzfWx2Qsjl7jDUxB6XJmOC1jVSc3IkalMIQGMOGCFJtVngFgu6n45n18FGnsoBbXuF/uoi6nC14mXnPioQHhmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TEk6iK5GvuVMLVelUUxiis8clwrCKUaO8K0CKeMME58=;
 b=Ausfw2FzzLP1btz4wMGE1I6CVvRmf7/DID/hd4bWHQqmechomyuxqVGdyFVyDCSVD4gch7FfE+RMLskPtgUxllbbhEX8dGT7Sb0KG7CHDpmoL33OfoKi+j+oqTCMfW39FLThJ4lv7NWbMcBatKit+3ZNO4N4OagCipihqksINks=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BL1PR03MB5974.namprd03.prod.outlook.com (2603:10b6:208:313::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 16:37:09 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 16:37:08 +0000
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2] hvc/xen: lock console list traversal
Date: Wed, 30 Nov 2022 17:36:02 +0100
Message-Id: <20221130163611.14686-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO6P123CA0028.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::20) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BL1PR03MB5974:EE_
X-MS-Office365-Filtering-Correlation-Id: 2401b07c-0811-4c4d-b529-08dad2f11f9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	TtSWEofdWbLjERcNpzjf0HSLJev25IVXtnHHdxF+ZQbFUPTX+FZOhpG7M4kJEtChu7e+4w8a10KbdwETY8IWS0tZDJveXowiuQxozCYyR9HO5AJT/AAhiqO+zh2mcNCf2qgOGa662jwbIPXPuWWwE8bhMfipSDBk5+23/WZGJwHfQn/NLpKrXGAT4WIlLvMzmqR5u6y0gSGq9pt3/6GmQlCko21Pb980JL8Dc/h4RCEgzRmQP3LGxvvwjCz/8h0xV0cZVMIv9JGXKaEzLdjn/7QGwWh1IzRdQs9heO/RA6zn4voLSIEyy2W4/fyprSfJvC5aSxMqbq0c60YwJqiaVYIAMSaRUIzKGWPZVzYrvtIfHsrG1PFw8JQMvSWb+tggmAf1J0TAwhkhP5JMiYDcT/7JQJUwKkL5JWGU49zGii672DDhzPGRp/e7xOm1kK7kF120mQuKIXSg1+tRsWh9fxVlz0Hdu8Aqo0s8tj2aYWdyNi4hE44brKTTtVk9tXRfQqSp3NBOimH2V0uSIao2wQjqqMncN1+nRJDsEMlpD61duNvqJ9o4BHm6tM1KkRUTJnJKgwMyDMzm+Bhe+4VYmTujcu3+gTU9geb+SSxrghTcT9xFrkX5LXXkEI60aUbonTw4/FLRZw3r9MGbfecMgg==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(366004)(136003)(376002)(396003)(346002)(451199015)(83380400001)(38100700002)(6916009)(86362001)(6506007)(6666004)(6486002)(54906003)(36756003)(6512007)(26005)(82960400001)(1076003)(2616005)(186003)(8676002)(66476007)(5660300002)(478600001)(41300700001)(66946007)(4326008)(8936002)(2906002)(316002)(66556008)(7416002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?NGZJSHhHZklOUVFhWWFST2dTbWR5OVJhU21QYzQ0MU5PYWpKZmF6QVkrZWRh?=
 =?utf-8?B?WmZIRDlFUTQ0K1ZuaTM4NkhvMUFqTURrUVU1ZlIrTEk2Qm1WV2ZaaGRDM1Ax?=
 =?utf-8?B?MFRsVVJEblNzdFc3Tm5wcDAxOGFoZEg1RElPSzBXcW9ETDhvTi9xSjQreng2?=
 =?utf-8?B?dVBPT0Jyem9oMVBNNnY4OTdaUSt0Q0xEMVREZmxlWU53OWxmWVpENGtySGNa?=
 =?utf-8?B?VzNXSGZhOHNDZlZlSSt1cHhlTGxnODNndUFibmFUMG00dUJ3dWpOeCtlU01o?=
 =?utf-8?B?SDVyWjIyS1lSRW4xRVRYSHRvc3lHMWkwR2lVcmJhRTBhNjZMOEZ1TzJsRGgx?=
 =?utf-8?B?K3BQNWhoR1dwKzh3YTFEVHRJR3hzcHptT29nRENuVHFUa0l5ZTJNc2FZNUhl?=
 =?utf-8?B?LzhuaGhSZTVCOCtid3ZqWkRqcDQzc1UrNDB2Wi8xdHNyYUNnVWt5WGE1dXhq?=
 =?utf-8?B?WUtyYW9IRzYwU3RuRk1uMEs4OEUwRWxpV3FjUzMyQ3pUM2thZTNhV1hXR2NB?=
 =?utf-8?B?c2JhWWIxd1lUUThaTVhWUkNFMzNIMngxY3grU2dZRVhmQlpudWd3cW4vcDlF?=
 =?utf-8?B?cHRyMDRwNWZiY0tXaXhRYVF2SFVyUlJpS3JFZnd2MjY5ZDBpbXhVTjlwU09l?=
 =?utf-8?B?anhSYythQ3U0NHNjRzRXZVVGckVUdlVPNWM1VWMyVzhZNXNiWEdORzlmRTIz?=
 =?utf-8?B?ZGt6RUNtV05PUE9GRGlLMFBFSmliRUE3ckhNWlhkSnBpRlZ5K2lpN001QnU0?=
 =?utf-8?B?dUZ5YzRCSWJVT0lucEVhSURWRm1OTkJzeTNGeXIyalAxZC9ZSy8rR0lZN1B6?=
 =?utf-8?B?K2hUZVZvcXdzc2xUUVM5Z3kxWGIyQlRjQ2YxVnQzTGM4R0d0WHFwdjlIUDZM?=
 =?utf-8?B?Zy9xUjNYNHRBVmNMZTNQeHhpb2JVVW1nS1o1ekJ4ZVJCWitFUHN5OWxKRGdW?=
 =?utf-8?B?YU9OR28rMGNVQnRCc3pDN2QyZ0ZOUGRIR3psYk16WWFzc0FtNGc4amlxMnh5?=
 =?utf-8?B?TTdvQXFJQnFmVnBrbjNZenJKKzlETVkwazNtRE9aNGt1MGZwUExmYWFwbXg1?=
 =?utf-8?B?RlhEdi9HQ2pTalJVRm1xWllzTjZpSFVvL0lrMzUyT3hMZVpQeEt2dDBOK0Vh?=
 =?utf-8?B?emEvRGMyc1NBRlZGLzUxakVUL1pQSVA3TFRNOGhWZndTc3JpVXRMbjU0cExp?=
 =?utf-8?B?Y0cva3lHM2dub2o4SlYvL3dOd1JTSHI5OHMrNDM2REtqUmVtU1EwTUNrZ3dw?=
 =?utf-8?B?bmRWZmtBRVhybHpaUU1nSW0xNTdpaXVNb1RHWUVUNkdUbGZiTEFqdG85SmJm?=
 =?utf-8?B?N0F2RzZXa1k2cktmZXRrZHRKcStKcnhBOVFDZU9OdW5pb3F1RmxWT2xPdlFu?=
 =?utf-8?B?eitLaDk4UzJXMGhRMzJnQWQ1cUZSYkc4bXc1WVh4ZUlBRkJuZVgvam5nNHdN?=
 =?utf-8?B?MG96bXI4MmhZaFdRdmNoTHdxeDVHUTBTMVUzemMxNXB5Z0ZxV0VUekc3VXk3?=
 =?utf-8?B?aW5UUFlQb2F5WTBtTVlFMU8rTEc2MDM3YnFuanEzSVV4L1RCa3JOM2Q2aHBn?=
 =?utf-8?B?emVrSmxPbkZTTmJya1hReUpCRGltM0FvN3FHaGJpNkRUOHE2NFUvOXFDOFNx?=
 =?utf-8?B?QTV6M2xYeTc0MjZnc1dqVmFGS2Z5Z1Zqd000RHR6QnJaREpxY3hQYi9WbUpz?=
 =?utf-8?B?Y3EwR09ZM0xwQllFRkwvZkN6OEhIUUFXVnFtcW90dmx3Z0N4eHYyU1B1blhF?=
 =?utf-8?B?Tk9QZUxua2V2eGV5MW5iMnhMVFhaVjBNaGs1a0dpSzlLZnRPMnhFOVp2alRB?=
 =?utf-8?B?NnBYRkhQVittS1RUMVhKRS9sZ0VHTTNvSWFaQkZiNC9OdVBNd1NxanVSL2FF?=
 =?utf-8?B?OG5nclJWd2xDeW5GNzZUTFhLRUM2ZGczRzFtTklGMGVLOE9ua3QvM0xJaEtH?=
 =?utf-8?B?UFQwR3BENlNqWTd3Z3FDOEJaSnFyUU0vcHBXa0szVWhNVHVtZU80Vzg5UnZr?=
 =?utf-8?B?dVBObmpEQXNIdXl6bitEMzcweXRzbzVaM3c2NnhEcDVrcEpmMnFFczhFRkh5?=
 =?utf-8?B?bWhyVWFzcFVHZjdsb2svUG5ZUFlKWFd2Q3FTNTYrclloTyttR1N1ZERwYUI4?=
 =?utf-8?Q?jumEieS/po16dcq/iVcgElH86?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?Wkg5ZWlmZU9tczBuTHBXV0NOMEVSUHlJdyt0YVI0Qm55Y2lXZTlmaVRsNXcy?=
 =?utf-8?B?bVUybVpsWGNaSXhsM1VLNXJsUzBvdlUrYnpkU1IwUndXS1AxQ0FHZXNqamV3?=
 =?utf-8?B?SHBXSDFkMGhnRm9EOExEbExpUkpFMkxQSXJWZm1ad2EyNHl5MlJZbzM3UXBp?=
 =?utf-8?B?MWVEVFF6Um9xdHFpTXFnZ1lIMmhHZEIzVjFhTVJKWnVzazBEUU5tVms2Qnp5?=
 =?utf-8?B?RVdYeVZGajdQb3FrQjdXRy80dVUrUmEzVVplWWdYVE93dVNod2Z5dHdPVUht?=
 =?utf-8?B?SjdDelhLZUpYd0VoODFUQ2kvSzVwYjQrc0FDVTJRUDNnMlJKOGs4Mml2QzZQ?=
 =?utf-8?B?NzFpNTJNT0RyMk1RZkhTOXVwVmpFMjlQRXdOWHJGa01weTlmWjdCUWNMTk56?=
 =?utf-8?B?Umk0ZXFOeDh2NlpGN0pvMGQ1M2JSL09hQjNyS1R6bE8zT0RiUlBtNnVLNitR?=
 =?utf-8?B?bE16blZ1czdPVW5VUjlJckZiMUJ1TzBDV09nZlFWU1paVVgwaGZHZzRNbXlv?=
 =?utf-8?B?RVlnRCt0NWZ1anFqb2RkNFFQQjNtK1UrOURLeFNMMllSQ2pLWVBEdk1zbmh4?=
 =?utf-8?B?My9TTkFQeDYweDdicERKdVk3K2dhUUlWa0VJeGMvZklmRXhuR2NNOG9wSEpQ?=
 =?utf-8?B?V2R0Z0Zqdlc4dDZVN1FxV0JyQlI3Q3QzVk9KMG45VUZhUGdkTkU0ZmtMTzI3?=
 =?utf-8?B?RWFEcjZVaWZQVU96NmhMNjVjU0JHRkhjc0pCU0lqZWVmVTdGTUZOb0UyL1lm?=
 =?utf-8?B?aFFlSTl2NllFRlVNa3hhYzZOWXJDdm9lRCsrNzJzdHV0QTY0R25obGQvVG82?=
 =?utf-8?B?RXNkV0dXT3VDSFZoUEl0S3U3MXArd3RSb0FsMTA5cTl5cVh6Y0E3ZVlYUDdO?=
 =?utf-8?B?UTNxNlYrZjRSdHRJU0k5cHRlbmRWQTVaQ3FSRG5pMHB1SlJ5ajZ3Q1F3b3lJ?=
 =?utf-8?B?bVo4YzNDaGJ3cU1ISW9TZlp2NDdTU1MxbGhGcW45SW11bkl1VlJ2VnN2Tnc4?=
 =?utf-8?B?dGNxbDBVb2hUbnVZK2JGTnNMcEhNTlJ3empvZ2hFUVk1cXhoYUtGaVJVdjlJ?=
 =?utf-8?B?bGlLZmk1R2R4TW1UNXRRdkl0S2ZYeGxEY1Nrc1BLRDU0L0hlVE1UbG5pajJW?=
 =?utf-8?B?ZHYvamhWNjhQSnRTN2VFZ3JhekFLenlUZnVhSnQ4aUFSQzJGaWUwcDU3UXNq?=
 =?utf-8?B?VGYyZ1lHU1V1aDNnd1lYVUl0d0s5RTRpSUhxODRDZGc1K0RWMjBQanRlUUxP?=
 =?utf-8?B?cDZ2NXBVRGN5Yi92QmtmeFFZQy9jQUNPd09aZlIrWmJWM21SaDN0T3lPbHBN?=
 =?utf-8?B?Y1JqK0NTRGJEeEl1TTR6UEIrUk5rdjR6V1hkQm4vV0tzdnFCTzA1dUpKdXd4?=
 =?utf-8?B?UEx3N014MEgweFpma0wyWDRMSCt0Y2VTYTllYXc3Z2JZTUVRdlJIdmdGVjdP?=
 =?utf-8?B?Ym54enF3MlhSbEd5U1VCQUJVREptc3RYTUlTdTRRPT0=?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2401b07c-0811-4c4d-b529-08dad2f11f9e
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 16:37:08.8135
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T0qVeVlYhH2uO0F3jAoPrY6g7geZegC9mApJURMivRMKFataV/8DoY+S9XjZgAeiq55A9RxPgfcm8YzUugABXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR03MB5974
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jiri Slaby <jirislaby@kernel.org>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The currently lockless access to the xen console list in
vtermno_to_xencons() is incorrect, as additions and removals from the
list can happen anytime, and as such the traversal of the list to get
the private console data for a given termno needs to happen with the
lock held.  Note users that modify the list already do so with the
lock taken.

Adjust current lock takers to use the _irq{save,restore} helpers,
since the context in which vtermno_to_xencons() is called can have
interrupts disabled.  Use the _irq{save,restore} set of helpers to
switch the current callers to disable interrupts in the locked region.
I haven't checked if existing users could instead use the _irq
variant, as I think it's safer to use _irq{save,restore} upfront.

While there switch from using list_for_each_entry_safe to
list_for_each_entry: the current entry cursor won't be removed as
part of the code in the loop body, so using the _safe variant is
pointless.

Fixes: 02e19f9c7cac ('hvc_xen: implement multiconsole support')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
Changes since v1:
 - Switch current lock users to disable interrupts in the locked
   region.
---
 drivers/tty/hvc/hvc_xen.c | 46 ++++++++++++++++++++++++---------------
 1 file changed, 29 insertions(+), 17 deletions(-)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index e63c1761a361..d9d023275328 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -53,17 +53,22 @@ static DEFINE_SPINLOCK(xencons_lock);
 
 static struct xencons_info *vtermno_to_xencons(int vtermno)
 {
-	struct xencons_info *entry, *n, *ret = NULL;
+	struct xencons_info *entry, *ret = NULL;
+	unsigned long flags;
 
-	if (list_empty(&xenconsoles))
-			return NULL;
+	spin_lock_irqsave(&xencons_lock, flags);
+	if (list_empty(&xenconsoles)) {
+		spin_unlock_irqrestore(&xencons_lock, flags);
+		return NULL;
+	}
 
-	list_for_each_entry_safe(entry, n, &xenconsoles, list) {
+	list_for_each_entry(entry, &xenconsoles, list) {
 		if (entry->vtermno == vtermno) {
 			ret  = entry;
 			break;
 		}
 	}
+	spin_unlock_irqrestore(&xencons_lock, flags);
 
 	return ret;
 }
@@ -234,7 +239,7 @@ static int xen_hvm_console_init(void)
 {
 	int r;
 	uint64_t v = 0;
-	unsigned long gfn;
+	unsigned long gfn, flags;
 	struct xencons_info *info;
 
 	if (!xen_hvm_domain())
@@ -270,9 +275,9 @@ static int xen_hvm_console_init(void)
 		goto err;
 	info->vtermno = HVC_COOKIE;
 
-	spin_lock(&xencons_lock);
+	spin_lock_irqsave(&xencons_lock, flags);
 	list_add_tail(&info->list, &xenconsoles);
-	spin_unlock(&xencons_lock);
+	spin_unlock_irqrestore(&xencons_lock, flags);
 
 	return 0;
 err:
@@ -296,6 +301,7 @@ static int xencons_info_pv_init(struct xencons_info *info, int vtermno)
 static int xen_pv_console_init(void)
 {
 	struct xencons_info *info;
+	unsigned long flags;
 
 	if (!xen_pv_domain())
 		return -ENODEV;
@@ -312,9 +318,9 @@ static int xen_pv_console_init(void)
 		/* already configured */
 		return 0;
 	}
-	spin_lock(&xencons_lock);
+	spin_lock_irqsave(&xencons_lock, flags);
 	xencons_info_pv_init(info, HVC_COOKIE);
-	spin_unlock(&xencons_lock);
+	spin_unlock_irqrestore(&xencons_lock, flags);
 
 	return 0;
 }
@@ -322,6 +328,7 @@ static int xen_pv_console_init(void)
 static int xen_initial_domain_console_init(void)
 {
 	struct xencons_info *info;
+	unsigned long flags;
 
 	if (!xen_initial_domain())
 		return -ENODEV;
@@ -337,9 +344,9 @@ static int xen_initial_domain_console_init(void)
 	info->irq = bind_virq_to_irq(VIRQ_CONSOLE, 0, false);
 	info->vtermno = HVC_COOKIE;
 
-	spin_lock(&xencons_lock);
+	spin_lock_irqsave(&xencons_lock, flags);
 	list_add_tail(&info->list, &xenconsoles);
-	spin_unlock(&xencons_lock);
+	spin_unlock_irqrestore(&xencons_lock, flags);
 
 	return 0;
 }
@@ -394,10 +401,12 @@ static void xencons_free(struct xencons_info *info)
 
 static int xen_console_remove(struct xencons_info *info)
 {
+	unsigned long flags;
+
 	xencons_disconnect_backend(info);
-	spin_lock(&xencons_lock);
+	spin_lock_irqsave(&xencons_lock, flags);
 	list_del(&info->list);
-	spin_unlock(&xencons_lock);
+	spin_unlock_irqrestore(&xencons_lock, flags);
 	if (info->xbdev != NULL)
 		xencons_free(info);
 	else {
@@ -478,6 +487,7 @@ static int xencons_probe(struct xenbus_device *dev,
 {
 	int ret, devid;
 	struct xencons_info *info;
+	unsigned long flags;
 
 	devid = dev->nodename[strlen(dev->nodename) - 1] - '0';
 	if (devid == 0)
@@ -497,9 +507,9 @@ static int xencons_probe(struct xenbus_device *dev,
 	ret = xencons_connect_backend(dev, info);
 	if (ret < 0)
 		goto error;
-	spin_lock(&xencons_lock);
+	spin_lock_irqsave(&xencons_lock, flags);
 	list_add_tail(&info->list, &xenconsoles);
-	spin_unlock(&xencons_lock);
+	spin_unlock_irqrestore(&xencons_lock, flags);
 
 	return 0;
 
@@ -599,10 +609,12 @@ static int __init xen_hvc_init(void)
 
 	info->hvc = hvc_alloc(HVC_COOKIE, info->irq, ops, 256);
 	if (IS_ERR(info->hvc)) {
+		unsigned long flags;
+
 		r = PTR_ERR(info->hvc);
-		spin_lock(&xencons_lock);
+		spin_lock_irqsave(&xencons_lock, flags);
 		list_del(&info->list);
-		spin_unlock(&xencons_lock);
+		spin_unlock_irqrestore(&xencons_lock, flags);
 		if (info->irq)
 			unbind_from_irqhandler(info->irq, NULL);
 		kfree(info);
-- 
2.37.3

