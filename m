Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5668163CDB7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 04:13:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMPR81gqhz3bXt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 14:13:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=aMvLCvXU;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=FmmQMlNm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=citrix.com (client-ip=216.71.155.168; helo=esa5.hc3370-68.iphmx.com; envelope-from=prvs=3254d5a84=roger.pau@citrix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=aMvLCvXU;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=FmmQMlNm;
	dkim-atps=neutral
X-Greylist: delayed 64 seconds by postgrey-1.36 at boromir; Tue, 29 Nov 2022 23:02:34 AEDT
Received: from esa5.hc3370-68.iphmx.com (esa5.hc3370-68.iphmx.com [216.71.155.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NM1DV2Z4zz30QX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 23:02:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669723354;
  h=from:to:cc:subject:date:message-id:
   content-transfer-encoding:mime-version;
  bh=4ZdMAbNecvTCei3faS5kTz8Zm4XBHXYy66WOlASpKBU=;
  b=aMvLCvXUvki2L5G3D1b0ZzRb7dYJedFlHx6pkvvuJ7Bl3sOCkgBuWJBY
   2lluU6zUeDKuLYmBNH6/3sBWRTeaOYRw5boyfvHDTcBQiY0ywqG0CB4fd
   du8T3tfjT6Ti7Me/4bzwuszdVQow1d5wJgRULkuVjzdjCrdSus6caNrS/
   g=;
X-IronPort-RemoteIP: 104.47.55.106
X-IronPort-MID: 84801930
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:0MoiKall8FY+mVM3IeqSiI3o5gz6JkRdPkR7XQ2eYbSJt1+Wr1Gzt
 xIWXzqFMvePZWPzKdkiaNi1pk4FusfcxoNhSAds+382FiMWpZLJC+rCIxarNUt+DCFhoGFPt
 JxCN4aafKjYaleG+39B55C49SEUOZmgH+a6U6icf3grHmeIcQ954Tp7gek1n4V0ttawBgKJq
 LvartbWfVSowFaYCEpNg064gE4p7aqaVA8w5ARkP6kS5g6GzBH5MbpETU2PByqgKmVrNrbSq
 9brlNmR4m7f9hExPdKp+p6TnpoiG+O60aCm0xK6aoD66vRwjnVaPpUTbZLwXXx/mTSR9+2d/
 f0W3XCGpaXFCYWX8AgVe0Ew/yiTpsSq8pefSZS0mZT7I0Er7xIAahihZa07FdRwxwp5PY1B3
 dUBKxRSdw+Bu8aVwr2WEbNp1sA7Lda+aevzulk4pd3YJdAPZMmbBoD1v5pf1jp2gd1SF/HDY
 cZfcSBocBnLfxxIPBEQFY46m+CrwHL4dlW0qnrM/fZxvzeVkVE3ieCzWDbWUoXiqcF9hEGXq
 3iA523kKhobKMae2XyO9XfEaurnzX+rANtDT+XQGvhCsGG23jdKMBMsDl6Hj8nliWyEUY9EJ
 BlBksYphe1onKCxdfH5XhulsDuHswQaVt54DeI38keOx7DS7gLfAXILJhZRZdpjuMIoSDgC0
 l6Sg8ivFTFpqKeSS3+W6vGTtzzaEScPIGABZQcATA0Y89fkvYc/hw7OSdAlF7S65vX3GCvx2
 DSDpjkWhLgJi8MPkaKh8jjvgT22oYPSZhUo/QiRVWWghitzY5SkfMqv8kTB6uhbL5exSUOIt
 3wJ3cOZ6YgmD5uAiSiMS+UlB6yy6rCONzi0qUV0A5Ar+jCp+niiVYNd+jdzIAFuKMlsUTjtZ
 0H7vQJB45oVOna2BYdyYoS+DOwnybTtU9T4PtjfbsBPeYdZbwia52R1YkrW2Hri+GAokKciK
 Y+DeoOgAGgyDaV80CHwQPUZ2LUwgCckygvuqYvTyh2m1f+beySTQLJcaF+WNLlhsuWDvRnf9
 MtZO42S0RJDXebiYy7Rt4kOMVQNKnt9DpfzwyBKStO+zsNdMDlJI5fsLXkJIeSJQ4w9ej/0w
 0yA
IronPort-HdrOrdr: A9a23:Hoy2K61hz+KYHPzJSd5H6QqjBcZxeYIsimQD101hICG9Lfb0qy
 n+pp4mPEHP4wr5OEtOpTlPAtjjfZq6z+8M3WBxB8baYOCCggeVxe5ZnO/fKlHbexEWldQtqJ
 uIDZIOb+EYZGIS5aia3ODRKadb/DDtytHMuQ6x9QYPcek8AJsQlDuRRzzrZnFedU1jP94UBZ
 Cc7s1Iq36JfmkWVN2yAj0oTvXOvNrCkbPheFojCwQ84AeDoDu04PqieiLolis2Yndq+/MP4G
 LFmwv26uGKtOy68AbV0yv+/olbg9zoz/pEHYiphtIOIjvhpw60bMBKWqGEvhoyvOazgWxa2e
 XkklMFBYBe+nnRdma6rV/E3BTh6i8n7zvHxUWDiXXujMTlTHZiYvAx875xQ1/80Q4Nrdt82K
 VE0yawsIdWNwrJmGDY68LTXx9nu0KoqT4JkPIVjVZYTYwCAYUh2rA3zQdwKtMtDSj64IcoHK
 1HC9zd3u9fdRegY3XQrgBUsa+Rd0V2Oi3DblkJu8ST3TQTtmt+1VEkyMsWmWpF3I4hSrFfjt
 60fphApfVrdIs7fKh9DOAOTY+cEWrWWy/BN2qUPBDOCLwHAXTQsJT6iY9Fqd1CQKZ4gqfapa
 6xEW+x7QUJCgLT4Iy1rdd2Gyn2MSqAtW+H8LAc23B70oeMNIYDfxfzCmzGqPHQ3cn3MverJ8
 pbB6gmfMMLVVGef7qh/zeOKaW6ekNuJfE9i5IcZ2+khP7tB8nDitH7GcyjVYYFVwxUEV/CPg
 ==
X-IronPort-AV: E=Sophos;i="5.96,203,1665460800"; 
   d="scan'208";a="84801930"
Received: from mail-mw2nam10lp2106.outbound.protection.outlook.com (HELO NAM10-MW2-obe.outbound.protection.outlook.com) ([104.47.55.106])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 29 Nov 2022 07:01:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pq0Lnsc/9DuGd4w0vSUiheNg2s7n0dEvkIe1Jk2D1q2YIag+eQ8s33GNeSSEIfENZZpoTkc0Nq43a+10fz8BgG1PyeGNdH+Z2FZzMS9D9wt4GP330rJn5nbNOZ8lR+MwPQdReKWBemLqCRxfx8f+fDMFIfw3h1vIbHkDLbSAxMn/7fGxEHQIspkRshDYX+PKChXOwPhxLutGWV9YPwc8jzUOMxynXktWvXoWihucYQGcjaEOD5rEa5Xy5OJMjKWIuA+TgAwpJfo0Ms65CfIPaDFpAayPRK5h1BTnsraAYD6E+DQqZmW7vED5ycjTBxbvPUtomLQpRNpbMmK28HYv5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+YG+AVQRkR+gMk3rt1cCpjwAw8FXJtTQTw3JF64p1vE=;
 b=TVYOGPUZJes9EANs5GIzGLJO6TRkJF2SAqT/nf1xfB9FXGYz/rfLFSZgQH/e6z42kkA8p73WMH4VKsUpIiQ0PyzcpJx/jUMDY3koLplmjnc7B3AKN4VzC3SLAxqT6hUenKq1No/3oygf++zXezuJIjO+OIj/Fl2WbnQMi9LSl93NJBuSYzgn5bFYqxwJrUwyypJaTxdDn10225jN4LeRR8MPbgaqFnzhCNQ0i7SyRskzgMhZekKPt21nGc+ieMoXKGBDwGdcBdYql8gL4hlidbeZ9vBVo0C1tdXtmMcOWkpEjLb8GPz1UgmmcD6DKGYImQtTuwUymEtaLwgp+Xl0Mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+YG+AVQRkR+gMk3rt1cCpjwAw8FXJtTQTw3JF64p1vE=;
 b=FmmQMlNmEc7kjsndpbOU0UAbDpgt1GjxaQCL5kVVgyKAud4UGwPB2sStYM1EpDNik6wKjDEZ9i+XvgDK0sVDHzUdvT2H4lkVZC/o8cfcJIBjXURTduKj/JzTZf/x4RbMd4JEuklLy5v4oxzx5nILk4g5H1vDwsQ7H5CdBAjcq0M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by PH0PR03MB5814.namprd03.prod.outlook.com (2603:10b6:510:38::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 12:01:15 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 12:01:15 +0000
From: Roger Pau Monne <roger.pau@citrix.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] hvc/xen: prevent concurrent accesses to the shared ring
Date: Tue, 29 Nov 2022 13:01:03 +0100
Message-Id: <20221129120107.2942-1-roger.pau@citrix.com>
X-Mailer: git-send-email 2.37.3
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LO4P265CA0152.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c7::15) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|PH0PR03MB5814:EE_
X-MS-Office365-Filtering-Correlation-Id: eb8bed4c-2e98-4191-b0de-08dad2016aa9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	IPA0hAf4G0qA0hHh5QeEguAzLSUDS9ZuSnIehxXnaqVDjTHZHQ+oK3EBasy//O8Ft9TnzztXPVlF4FbjA46SbX055+A/sdlEWIQw3EH+KtmWXnkVLtlelbsbTvq53beMSQWmZTzSInCMhYeix1QAst7U9zPGu4IzQR6Qd7Crn3oyVjQo58atYGnVfuQFpbeJc0nqflmie2npzKNCL0XJvN+tAeo73OJ9EG5XbaTbOcD6wRRe72oH4jJfP7nurvAgnGG6jJl9C04O1rBx+P6irvNmm779R/VLQ4avep6UUQus39jetrXUnqjKlDjgRN7qLoiw2JHdF1uPZYbTwfsCbK7hNW5VqTMmAQon7vBnLmlPOGrWqJV5gVB+HI4Xu49eS3nQQBJel2aGsjOj2K83a9KQYrc+P5uLNyHZq49iUo5NxkDJvxgIAQzPaWWXLUkPmKpMXHJRw3QnPjVSV5LOyTVXyvki0GzHNa6qSYaM/0waGM0TXgXpYWQdPArHO7TXqCJBGMxVeSoVNrXB/Vrd5dGfNp5/jcHeyO3u4EbrmuOSAOIYBPPjny5hEy7NnMqfNqrAlcXab/pA/fFLUQK+idGxnEAZ+Oigf6ENbEQHJhIhuQm5bGkcIdwhodf6xDXjOCDTrVb18gAAWHjUUPqtZw==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199015)(5660300002)(7416002)(54906003)(316002)(6916009)(26005)(6512007)(82960400001)(41300700001)(2616005)(186003)(66476007)(36756003)(66946007)(8676002)(66556008)(4326008)(38100700002)(8936002)(1076003)(2906002)(83380400001)(86362001)(6506007)(6486002)(6666004)(478600001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?aTN0c3FSd2VDNEF3Y3orbnNvMnVsZmNyWW9UV2MrUUlnNTNJSmFwT3M3ME11?=
 =?utf-8?B?U0VMM3pWZFVYdzZ1MFpUeWUvS2J0M1JVUXZhSlBiN0o5N2ZVSFk1a1ZTRzdl?=
 =?utf-8?B?TkRxUnNlZk8zMGs4SHlyM3FpMStBQUNzOHRDSUltZVZzM2JDall1WklhWWZS?=
 =?utf-8?B?bWM0OHhNK29pYlhadmxKQW5lUkpvT0tjajlLdXRZdEVteDVicDZHTzlyKy9F?=
 =?utf-8?B?RGFwV2E3K2dHc0hPQnowaXdUc0dNV0NFZ1oxS3o0NVNTWlo4NTBoS0o4M2pj?=
 =?utf-8?B?VHdQTXZaNy9HblRmbkNMNnpWN0I3aUNtcjdwMXRGeVp4QlRHMUhRV1Uwd3B0?=
 =?utf-8?B?eEVENmM2bEc2Tk42VzFHc25jeWFDaUF4VTZzdE1uN0JWSStsY1BaeVpvMDRU?=
 =?utf-8?B?OUdTWDg2U0c0L0M3TU1aT1k3ZFBuRmZwNThnTlZnSUZlV3Foa29pL1U0K0Rm?=
 =?utf-8?B?YUhVQkQvcGYzRnFhREk2RVlYakdMaUszRG1NbVJQZnlIOUE5bU1wZzRpWGlQ?=
 =?utf-8?B?ZlhVbzdHUHNqSXZFWVFkSWQyQVAyL1FlczYyQUJub2tsdmlWanhIRGVVdjdr?=
 =?utf-8?B?L05tbjRkTzJZL1ZOdDh3THhDenBVOHR3MjhUbG45R3VURG45TXRYSGY0VDVp?=
 =?utf-8?B?SDdzQUs2RjRNVTVDbW5UT0l1YXZaMENnR1FtV2dvLzIyR0R6VlpET0dJR0t6?=
 =?utf-8?B?dVp6N0RMSkRaazAxcVM2V0ZTOFE1QlI1aUYxamxUQWZaYm1nWVRRZXNlZ3F0?=
 =?utf-8?B?NHE1TVNsNGE5aTRNVWkvdkVIcEdYT1VKSVhXdDBWdkpMNThvQ20xVmhDdzNt?=
 =?utf-8?B?bTJ6Yy9CL0ZjTGhHZW5DUlhqbHowOW5aY09Ra01oSDZUZUpPdnVtUHZJRWdx?=
 =?utf-8?B?bmp4Smh2OXRFalpIWjdRM3QxenBJOG5lUjR5dVZDTWhjbWEvN2h1cGF6R0xR?=
 =?utf-8?B?bi9ta0Y1akNYQzVURmdERVVNenpKRDdYSDBrTVlKeEVVcytIeXlhWEt3SmRI?=
 =?utf-8?B?dmJQN1dwdjd6eGtod1JsWFFsMlF4VExRTjlNUWxSUHdVeSs3QnVlQjRQS2hE?=
 =?utf-8?B?SERMSXlkSGVubG5jcFhDNzBVZjcvcUFCRUU1U3VnQU9PTWtwa3JVZzFNZTFv?=
 =?utf-8?B?MGhDLy9NY0ZsejMrWDJTRjNBNlpXbTdFQ1Q3eWFOcXEyWFhLaG1xcjB5T1dK?=
 =?utf-8?B?VGo4WmEyT0lHKzJRbHVEcUNtQlpLaGYzckRkWDZSRW84b2pucXEzU2QwNElq?=
 =?utf-8?B?Znp3b0VmKzVqeExoc2hPTC8yVW5HZ1ZSV0paYVZmZi9mN044Z2U2VHJ1SzB0?=
 =?utf-8?B?RzdSM3M1c1lReGFyWTIxT1J6WW5FM1hyR1psZTdRQ21EODlETkpBWHBmYURL?=
 =?utf-8?B?RnZCb0VNS2R0Y0hrUzhtTm5FVFpDdzdFOEdFdUU0cGtETjVybEZPRFkzY1BC?=
 =?utf-8?B?MjVRUVN6Q2x2WHBIbVJ3V04rNjI3U0swS2xhcmpHYkd6S1ZLQkJSNE1KSk5K?=
 =?utf-8?B?RlpxcGtBSitLOFk5Y1llMkorRWVGVmJ5OG0vOGoveWRVMXUweXFtZGYza3p5?=
 =?utf-8?B?U2ZsSjlZVVlOLzFhUWhLL2kwWllZUHpZWG1rWVR3UzQ2ZE5OTCtJV3RMcVhB?=
 =?utf-8?B?VktpN29kVEQ4ZEhhL1Z3M2htZnY5b0tTdXdqdzlUcFlHbi83UEd3czBBVFJB?=
 =?utf-8?B?dHViYlRpRkZVd3BsSlcwQk51ekdkUDZ1akdQOXB3THUwVEN1a3p5VDZXclc1?=
 =?utf-8?B?aDVSdUphZnZBdTZ2YVdNMkRPc3lxblZSTmNnUWp6WG9nVFVRKzR6SERGNDZE?=
 =?utf-8?B?aHhiWjJlR1V0RUthQjVRVldRQTVkY1lqUHFUbkFhUEZkcXZORlJVMjd0cUpD?=
 =?utf-8?B?VFVwL1N0WXFMRkFkTjZTSEdsQmVNYTlNdGxuc3VYam9YVVk2ME9yVUtmVUdD?=
 =?utf-8?B?N3BGeTg3VkliWllFdkpHcTlTUTF1TXk3emx2c0VER08zMG8ybFMxbjkxeHpK?=
 =?utf-8?B?ZS84Y3RSMFE1eTZKQmVNSFBYZTA4Q21tZUNIWmNaQmRHOVZHeHRJdU1oTXhh?=
 =?utf-8?B?NTQ0cWJwQWczdUZVK1FxYzhudjFDV3hrUjA2d1o1THFFbHpzZTZaUUFFVEJy?=
 =?utf-8?Q?m87IgA+BTp7I9mK5e9eoMUdVq?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?VFl5WVBkbHZGNEtRcDdwWFVjNXFoT21GZlVCZkdqRjdJR2xHZmhWL2FmVTh1?=
 =?utf-8?B?M2kvOENhWWlPYWc4TjZiWmx5TStXRDZpaEdyT2FsVllhdUwvSDY2MkV2c0hD?=
 =?utf-8?B?ZjlWL0FDeEpIMDMwWjZKcVh6R1ZHTWhtTkFZVjc2TVorRytCQmFWU0tQZGFF?=
 =?utf-8?B?YU1DK1RKRHFOSEpRRU52OUhYYkFnZlRRVXFrQytLTUV0bTBSd001aEZrUlZ6?=
 =?utf-8?B?YWl6OHBNKzJ5OUo3QkhVYTUrR2xnSHFiaXMyWHU4UHhlV0NaNWpWK0lGaE5X?=
 =?utf-8?B?YlJnbFAyL0FiVnZNaTVUcXJGem5aWmdacHZqeG5oYi91V2tsNFBKYW8zNzJY?=
 =?utf-8?B?cmZDVndWVVBMN3AxSUc1RGNIRU1wMUtPbDd6UnhaVUNYenNZbWVEOTlnTFhL?=
 =?utf-8?B?dFJ2Mld4RlpKSHhsbnB6NU1HY001ZCtMVFIrMTB2U09ic2JKZUNpVEd4a1d5?=
 =?utf-8?B?V3NRSFFkcGJ1VmIvdU92QzI2MjhCekNhQlhybGRBNm5QM3I1bGoyYm9VdWZt?=
 =?utf-8?B?VHlLVUQyNXkrblJsZkJlLzFXcDFQQlVaclV6b2RTcm8xbGJPdkFxUHFFZUd1?=
 =?utf-8?B?KzgxcG5mVVI4cVhUUVo5cUl4ankwSjRMZXh4Qyt6cHRkSkRoZEFsQlR4Wk5a?=
 =?utf-8?B?WXZ1cVR4MElNWkpnK1RRWllDMWNZVS94Z2VXVWJvOGVaRXczdVo3K2JRaVVL?=
 =?utf-8?B?UFJwZmp1WldNMi9DT1ZHUTBWZU1ZTEthTWx0TE5XRkY3TXZLRkxPVTZkdmhq?=
 =?utf-8?B?OWNNalB2VGlKcTBKdjM2MFJBNjJXYW53WFd6NFBNT25tRmtGcHpXTXYvTTRS?=
 =?utf-8?B?MVZrY0c0d2pOV0c0RHhRRFpzcS9ZYWduU1RzRDZNdnd6NmM2dmhMdHhBTm1v?=
 =?utf-8?B?cmw2YkRMcHA2Nnpvc2xyRDltbjNHckJIZHBMY0F0V0k4cURyN3QzYm9md2lh?=
 =?utf-8?B?aUFQSEo1ajRQQ1ltWHVYTlFUQTJJaVFLVC9BNnFvQVI0ZmJzY1VMNTJYMEdF?=
 =?utf-8?B?MTlTNzErTzV6c2VVVk41eWRjS3hINUtVMVJzUlRmUVhkbUtlWldhcUlsY1hm?=
 =?utf-8?B?MERHNElFNklSeE9ycmgwR2EvSnczMjBKa0tZUlR1SGhPblRjV1AzS3g1Qm5z?=
 =?utf-8?B?Yml0YXdxaVlDdHpDNXNPTkU1czRTUS9Nbi9scW9RQXNTUTZIZW5xTmNMblJX?=
 =?utf-8?B?UzRLZzhJNmRxT3pSY3d2bkFTUDlGR3VzcWUzNVpLSUVWNFE3MXJCZlJUSElY?=
 =?utf-8?B?RGxMdjhENXFpUld4VWRMM04zdHd0N29WMXovWDI0WUp3K0pBSE1FV0lIMjlk?=
 =?utf-8?B?SGlBaXZQNndUY0hmRDNhL2h5RkdEWjBjc3NUMytQUitMSmRKKzArVFZEcHZh?=
 =?utf-8?B?alhOTmFIM3VOMkhUYmlPVStvd2FrU3ptOTdLNVp5TTBhZ0cvZTVWd1gvWXNa?=
 =?utf-8?B?OWdISE8ybFJqYjQwRitsTHBqektqTTN2clhYREZJV2MvUWNhN1A5S3cyMjVz?=
 =?utf-8?B?ZGNHNWlndkRLdFM0bnR3Q3MyRTlTMmhkWjc2WWJFWWdwODJUZjE1SHFQYXFH?=
 =?utf-8?B?R1hYZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb8bed4c-2e98-4191-b0de-08dad2016aa9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 12:01:15.5464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ktgav4dLJYKN4nuK0T7205m95WqXQfH/XKmcrQPMr9JAjKPQQqd22t6mWoEBlFRUT0LBZ24o0fDBKxFI8F2fHw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR03MB5814
X-Mailman-Approved-At: Wed, 30 Nov 2022 14:12:19 +1100
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Jeremy Fitzhardinge <jeremy@xensource.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, Chris Wright <chrisw@sous-sol.org>, Jan Beulich <jbeulich@suse.com>, Olof Johansson <olof@lixom.net>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@elte.hu>, Roger Pau Monne <roger.pau@citrix.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The hvc machinery registers both a console and a tty device based on
the hv ops provided by the specific implementation.  Those two
interfaces however have different locks, and there's no single locks
that's shared between the tty and the console implementations, hence
the driver needs to protect itself against concurrent accesses.
Otherwise concurrent calls using the split interfaces are likely to
corrupt the ring indexes, leaving the console unusable.

Introduce a lock to xencons_info to serialize accesses to the shared
ring.  This is only required when using the shared memory console,
concurrent accesses to the hypercall based console implementation are
not an issue.

Note the conditional logic in domU_read_console() is slightly modified
so the notify_daemon() call can be done outside of the locked region:
it's an hypercall and there's no need for it to be done with the lock
held.

Fixes: b536b4b96230 ('xen: use the hvc console infrastructure for Xen console')
Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
---
While the write handler (domU_write_console()) is used by both the
console and the tty ops, that's not the case for the read side
(domU_read_console()).  It's not obvious to me whether we could get
concurrent poll calls from the poll_get_char tty hook, hence stay on
the safe side also serialize read accesses in domU_read_console().
---
 drivers/tty/hvc/hvc_xen.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
index 7c23112dc923..d65741983837 100644
--- a/drivers/tty/hvc/hvc_xen.c
+++ b/drivers/tty/hvc/hvc_xen.c
@@ -43,6 +43,7 @@ struct xencons_info {
 	int irq;
 	int vtermno;
 	grant_ref_t gntref;
+	spinlock_t ring_lock;
 };
 
 static LIST_HEAD(xenconsoles);
@@ -84,12 +85,15 @@ static int __write_console(struct xencons_info *xencons,
 	XENCONS_RING_IDX cons, prod;
 	struct xencons_interface *intf = xencons->intf;
 	int sent = 0;
+	unsigned long flags;
 
+	spin_lock_irqsave(&xencons->ring_lock, flags);
 	cons = intf->out_cons;
 	prod = intf->out_prod;
 	mb();			/* update queue values before going on */
 
 	if ((prod - cons) > sizeof(intf->out)) {
+		spin_unlock_irqrestore(&xencons->ring_lock, flags);
 		pr_err_once("xencons: Illegal ring page indices");
 		return -EINVAL;
 	}
@@ -99,6 +103,7 @@ static int __write_console(struct xencons_info *xencons,
 
 	wmb();			/* write ring before updating pointer */
 	intf->out_prod = prod;
+	spin_unlock_irqrestore(&xencons->ring_lock, flags);
 
 	if (sent)
 		notify_daemon(xencons);
@@ -141,16 +146,19 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
 	int recv = 0;
 	struct xencons_info *xencons = vtermno_to_xencons(vtermno);
 	unsigned int eoiflag = 0;
+	unsigned long flags;
 
 	if (xencons == NULL)
 		return -EINVAL;
 	intf = xencons->intf;
 
+	spin_lock_irqsave(&xencons->ring_lock, flags);
 	cons = intf->in_cons;
 	prod = intf->in_prod;
 	mb();			/* get pointers before reading ring */
 
 	if ((prod - cons) > sizeof(intf->in)) {
+		spin_unlock_irqrestore(&xencons->ring_lock, flags);
 		pr_err_once("xencons: Illegal ring page indices");
 		return -EINVAL;
 	}
@@ -174,10 +182,13 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
 		xencons->out_cons = intf->out_cons;
 		xencons->out_cons_same = 0;
 	}
+	if (!recv && xencons->out_cons_same++ > 1) {
+		eoiflag = XEN_EOI_FLAG_SPURIOUS;
+	}
+	spin_unlock_irqrestore(&xencons->ring_lock, flags);
+
 	if (recv) {
 		notify_daemon(xencons);
-	} else if (xencons->out_cons_same++ > 1) {
-		eoiflag = XEN_EOI_FLAG_SPURIOUS;
 	}
 
 	xen_irq_lateeoi(xencons->irq, eoiflag);
@@ -576,6 +587,7 @@ static int __init xen_hvc_init(void)
 
 		info = vtermno_to_xencons(HVC_COOKIE);
 		info->irq = bind_evtchn_to_irq_lateeoi(info->evtchn);
+		spin_lock_init(&info->ring_lock);
 	}
 	if (info->irq < 0)
 		info->irq = 0; /* NO_IRQ */
-- 
2.37.3

