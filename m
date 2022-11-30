Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 332F463D2E1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 11:11:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMZjx73Bbz3fGG
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 21:11:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=Fl03S+5f;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=Q2yUYqW5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=citrix.com (client-ip=216.71.145.155; helo=esa3.hc3370-68.iphmx.com; envelope-from=prvs=3264ca9f5=roger.pau@citrix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=Fl03S+5f;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=Q2yUYqW5;
	dkim-atps=neutral
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com [216.71.145.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMZj03yyFz3bX4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 21:10:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669803044;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=UH4or9v6W4G1BQ9Ha9K2Tded3QFAg1mp3HDjiohAk/I=;
  b=Fl03S+5fFrEHgc1YgqDogNT1TgDH1wf+9vdUwO85H39kOH6k5REz1VoF
   COwjHj98asMCL6VILFxRYgCmu0blc7e1u7N7NgK7KqTil0597Rq/Ck7db
   eJv08B7tdhxxrRLOgnLj5r9MGX7nHxdwPfd6zk3izG3BCu2RBRZanYsiw
   A=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 85844826
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:PzltvqM0wtnI1k/vrR3el8FynXyQoLVcMsEvi/4bfWQNrUok3z1Vy
 mdOC22Caa7cazehKN9/atm/9h4BuZ+AmIcwHAto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQA+KmU4YoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvzrRC9H5qyo4mpB5QRmP5ingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0uYqBEVVx
 aFGEmBTcD+BtfOb5e6eVcA506zPLOGzVG8ekldJ6GiASNwAEdXESaiM4sJE1jAtgMwIBezZe
 8cSdTtoalLHfgFLPVAUTpk5mY9EhFGmK2Ee9A3T+PpxujaCpOBy+OGF3N79YNuFSN8Thk+Fj
 mnH4374ElcRM9n3JT+toi/82rOfx32TtIQ6E7aq9KNXgH+v9jZKNg8SDVC+naeIlRvrMz5YA
 wlOksY0loAw/kG2Stj2XzWjvWWJ+BUbXrJ4F+w89RHIyafO5QudLnYLQyQHa9E8ssIyAzsw2
 Tehj97vQDBirrCRYXac7auP6yO/PzAPKm0PbjNCShEKi/Hsuow8jRLnStdlDb67icDzFTjsw
 jeM6i8kiN07j88R1r6/9FrWqzGhvJ7ESkgy/Aq/dmCq9ARif6a+epelr1Pc6J5oJoGDT0LHu
 2MYgc+A9+MfJZaXnSeJTaMGG7TBz/GBNzP0hV9/GJxn8Tmxk1amfIZf5xlzIFtkdMYZERfiY
 FXSohx5/5hOJz6xaqsxZJi+Y+wuzK79Bcz9XbXYY8RmZplqaBTB+zNqbESLmWf3nyAEirojM
 J2WdcKtC3cyCql9yjeyAeAH3tcWKjsWwGrSQdXxyUSh2L/HPXqNE+5bYR2Jc/wz676CrEPN6
 dFDOsCWyhJZFurjfi3Q9o1VJlcPRZQmOa3LRwVsXrbrCmJb9KsJUpc9HZtJl1RZoplo
IronPort-HdrOrdr: A9a23:JXa0zK8mLkkVg0jRR8huk+D1I+orL9Y04lQ7vn2ZESYlC/Bw5P
 rEoB1773XJYVMqNU3I9urwXZVoLUmzyXcx2/h2AV7AZniahILLFvAH0WKK+VSJd0LDH6xmpM
 BdmsNFaOEYeGIK7/oSlzPIcOrIruPnzEniv5an854kd3AQV0hP1XYCNjqm
X-IronPort-AV: E=Sophos;i="5.96,206,1665460800"; 
   d="scan'208";a="85844826"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Nov 2022 05:10:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CZSxt/gR2W64BWQZ5+oqJDk0093zuxW+2EKC8/QLcNfPWHu/dyU3dIe2D8cjYiZEmLwOzl/fq6SWEfbTkUtuI6mzAWUsIdym2RSmw30SWfcdyCBSVNPxY7ozbVxQrH3EJrUuXB0l/UZQku70IF2UUDeq75zi0P375wyjNxNnCF3yDw7T2FqDyx/W5CHUiMnsxlMSiGjGeyDlqp8HUzTD2k85AeZXuN1HvxSfmE5ctUQIz8U/fd1pp00Yuq1ZFHmOM6LK9qMheSRgCW+4ibdlMLg8NXWLdZxnazDIgnkDkckhaIGGBzSxfP08gY1h6Y3zrnPRMdiyCa1KG3qYSiUNfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DTzxxCZ+Kq9uX93zQZa8I0RFtDAt2genjXSVBUCq8JI=;
 b=jW14PKRD+ei8o+EnK+KZ8NJ61DMQedOBQl6RMMV5aeiYgPFhnWIrmldy4Svk6o3gVCV86yZrstAwBd1VhZIJLDEE0iIhh+BxPuLtKpL+Mo6pV6q2TugLDanQHZvX1JM9uZWFzWjjO5wiq82MIGUqTvOrO34muTwMKkX4rvNbQS18xYk0fsWKDImHQKargVJegNa6r8RWjm4HsyOzV2x0Gvdh5dcpva0faCUYUfpU0sBR7USm/wiCo8nsNyLV3IR0BbW/Lr/tjs1HDfDwrJRN73w+aCVGkq8/21W9qmnK+9I4Ne08ZmT4gWvtC7dn0UE/VOI268bTaX5BuVOa4pLOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DTzxxCZ+Kq9uX93zQZa8I0RFtDAt2genjXSVBUCq8JI=;
 b=Q2yUYqW5+SrMrgen2TCJu2hiqqgb54ILAY5gwnz82mE6vslKuhhr3kB2WTNPTgUD0oCJ1Il/pqsgePvQBmxhhhJGxaLWHZi3loxxcMij+bz2sd8BThjEvE9tGY3eG6rCixW71t/nJFAWeBjvhu+gdZ/XUZmaCIKZ2ZHMsGAoLVQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BY5PR03MB4917.namprd03.prod.outlook.com (2603:10b6:a03:1e9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 10:10:37 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 10:10:37 +0000
Date: Wed, 30 Nov 2022 11:10:32 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Jan Beulich <jbeulich@suse.com>
Subject: Re: [PATCH] hvc/xen: prevent concurrent accesses to the shared ring
Message-ID: <Y4csGBQ6NXBC7vIO@Air-de-Roger>
References: <20221129120107.2942-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2211291351160.4039@ubuntu-linux-20-04-desktop>
 <Y4chryL2YvfhgQmk@Air-de-Roger>
 <8d8f8c11-6ca5-5770-989c-704f76436cc4@suse.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d8f8c11-6ca5-5770-989c-704f76436cc4@suse.com>
X-ClientProxiedBy: LO4P123CA0684.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:351::17) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BY5PR03MB4917:EE_
X-MS-Office365-Filtering-Correlation-Id: 218b030f-6491-4270-4bd4-08dad2bb2035
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	iZII7XY7lkWei01KyrpuVq55aGJ9PG2UK+JdyIfHANucu7yM9RM5Xq2llq2ezsRVTerZkrELJ+TKTff90SYqEZlz321mrzrIUcFP7mZT6gFEvELfmYHP5elGzNLhOwstHFy45um8Z/XaLI6wMqsTv2+WwTSKvwsYKas8BMxUoEKGN7wuq5MjgFs/8ZqJLt+BNQqy0Sd8xHl9K5zCPvTZg0AFh59+YBXq7lNAhWvoL18UIFopI0iWW6bbpJdYFXSQSaqDn2lRUhjoENTi/qGyMScd1qZl63tfdQrZZqI3V+07jgJPhjwYnHFK/HJKijMMZ3kQLD0rbgUXDwTu5acEgypbPgeIaN/d6XZa5h2oqlwlpqoLoHgL+NaP2nMjBnp6sqbNsqoUsTjW9RoCEeGN3OvvwvHUCcQPG4RyXX8GXLe6HrMN+/Xoradi64VQY5Oyeh0SPWaPytLfhpq4iJcxb4xg7CF93+beEIKw4d7V2OQv8CVed7hU7AOsFaF/zMuKywXwMfifX8P42b1KzKaRf/qN6ImxtWzC1bSqpbPsDAWw89RNqIP0pPvZleEK/oefQ+vhUePxMW0VI5tHeBTtGQaXeH+MIKPdFhlXULnSU/S1Up6TGwxWOtuZz9hTh4nbtdznL8krzTuYf02XkGxd0w==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(451199015)(7416002)(5660300002)(33716001)(186003)(8936002)(54906003)(6916009)(26005)(6512007)(316002)(9686003)(41300700001)(66946007)(8676002)(66476007)(4326008)(85182001)(82960400001)(66556008)(38100700002)(2906002)(86362001)(83380400001)(478600001)(6506007)(6486002)(6666004)(53546011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?SHFZODFtY0tLcTliNDV6MFM4SkpvbkR0dVNSbXY2TmdTVHYvT3lRcVRvSWhW?=
 =?utf-8?B?UkkvakpTbGpPdGpRb2JpZVdIbVVxdkdTVjRtZVlCZHRRcGlyK1Jka0xMcE1a?=
 =?utf-8?B?dkpkcnJQckVvWHFUZFZTTDFscCtFR2p0alpRcnJoSW1Qd2JGeENocjRTSXdo?=
 =?utf-8?B?dVN0N0VFRVliNDBzeEdvZmRIQmhSQnZRcHIzWkE1MytlZmxacUprTmFYRzBG?=
 =?utf-8?B?ZERXWDRLSGNUa0NDMGV1SnRwSk8zc2xYUDVBUDhoMXFXZWRNNTBPZTlCLzc5?=
 =?utf-8?B?ZnRJZzRIZG1ZVTJvd0NVb0tSRzBQOVdsWWViNUpnSGdyNEFaZC9BMkV2YlRN?=
 =?utf-8?B?aHNDeVhvUWFCT0hlanM5QXpFRjBFamppeVllanhDNUlXWHIxNXZaK1M0OTNh?=
 =?utf-8?B?MnJtTmZyYmpmem0yd1FaOEpQU1VoWGdVRC9DOHlRUExpeHcxY0h0UnNRd2x1?=
 =?utf-8?B?NFBsZVRHZFh6eDBCdjFZL0kzSFZoMWNLQ1E1a1ZvRFJLd05sN1BMSVpYSEJZ?=
 =?utf-8?B?Q2s5VUZuUW45Q1loeVVxK0hiQmdTeW5MbklaOXBKbVU5eGI5ZVZoUS9rRWVO?=
 =?utf-8?B?L3dxN3RLMndGaG41bWRjSElxN0wxSFVDUnNQVUxaVFd6VXZYSlRnbjJBa0VZ?=
 =?utf-8?B?bklxdnJMZ3o0L3ZqN2toY3pVZUFNc0JpR1lxRzF4SUw0bUFCWmZDR0dicmRi?=
 =?utf-8?B?YUpNVlo4d0dScVlUd09mN1NpdmRyZTZ3YXp6MWFKc3RDcnZ3QzM0NitRVEpk?=
 =?utf-8?B?MnB1RjRYOTEzbDJDSHo2blhkTEFYZ1hxRkNuaVdXU05pWEFpMEhEdjdtSHZ3?=
 =?utf-8?B?dDZiQTVuYU9SUUUwaXZSNCtHd0VnZC9QY2VhTTkwN1MvaWI0R0E5bVFRSVJX?=
 =?utf-8?B?cm9TT1dhczIyR0ZpTTRqV29NRURJTTdSWHpkQXRiTEE4MURMcm5laXYyY0Ix?=
 =?utf-8?B?dGEwTkpKK3R0T0RqUWRkcU9udzA5Q0FoTlF4L3NWZjY3M0xYYStjYUxEZkV4?=
 =?utf-8?B?a2IyTXB0TEluVWhXUTVMOUxBM0FsbFV0dG1CeGRPV2xiMzhscnZuMk84UDV3?=
 =?utf-8?B?RjVzMm0zdmNYVE93UDd3all3Y1YxaUpPOU11ZkYwY1ZtWDd0TUxPZVJ4c3Jz?=
 =?utf-8?B?Z3JyR1J0eXUwbTR1MTRoNFhaQmFzY21kdlpUM0RZeFQ3T3VmUllkbzRUUit4?=
 =?utf-8?B?eHZpK3AzV29Vc3Z1K0RnNnhsL2UxQTgwbVlLSmxPMTYvalFkTlFwUlR5YjN5?=
 =?utf-8?B?N1VwTUJkMXVLdVVuTmhjbWhweVBEYUpBVHpnZ3pNb1hYdG1MeHNyb0xPL21I?=
 =?utf-8?B?cnU2ZWtWZHhseFRaazVKWDdlYW9nTTFSSEc2RXR1dzJzT3JHeWg5K1l2Nnh1?=
 =?utf-8?B?WDVWZmdUd3VxMUg0d0tXRzcyaTBoTkJEZW5ER2xyQzlRSzNNTnhIeVk1U2Vp?=
 =?utf-8?B?MjJmTm90TmkxQXpqeVlXWVpISkUvR3EwNnYvYVFweFROQWxVeFJWSTIyd29N?=
 =?utf-8?B?M0swMnl2bThCZ0Rkakdzb0UwTGVRYnk2VFZXY3ptRUJzbHFDbzFhRWZZQVBL?=
 =?utf-8?B?UG51aEt3cUFSYnVkd1VHSmNXT0lHbVhHT0FMdkVGY2JXQjVlWi9GL3hLcUc5?=
 =?utf-8?B?dkxLY2d0Qnc2cHlqdk93bzFIcU8wcjE3TlZueDg3S1ZteWZqeVBHc3gyeER0?=
 =?utf-8?B?NHlFNnZmbXVZbFZLOFB4dkRNVkV4NzJLYWF4MXBGQ210Z0JVbDBUN3VsUEpp?=
 =?utf-8?B?cncvM09hc1k0U21SNkM0QjN3bGdBUzM4cFFHWkFsYXdzdTI2eld2NmRwWFpy?=
 =?utf-8?B?YTBsdlFlU2E1WGVDSzNEVnpDZ29DQVc1ZjJ3dlV2UVBSSW1vRTcrc3BaUnJM?=
 =?utf-8?B?ejlaOXZKYnFYc2YzVndlWFV5cDdyVkhoaXV5a1dadTFSeHJKNGR1em91UTFX?=
 =?utf-8?B?QXJGN0hVRXo0S2RUcDgxVzNNQ3dEbUxBWkc4VHVXOW1Cb1NqSmozemRCeDJW?=
 =?utf-8?B?eVNsSk44VzZrSkJzdXFzdTdsQUhMdXRGMjVacU1RVGhIbk1uRDN0Z05HdWFn?=
 =?utf-8?B?NkIwNEZlSUNiKzVOTGplK0VRUjNVa1lyK3ludjFZcWhxRVBEdXlwajdmTm1O?=
 =?utf-8?Q?OQVPfUEDmO9aY/jVEfIwTk677?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?RGt1VjNVTFdyQ3o3a05vK1RkY29RMWNqbEdReCtWcjlHWGphVllLck11SnA3?=
 =?utf-8?B?bTdwYWhCSmxSNFhFOTdXK0FlUnVaeUFVa0Y2WE05NWRGUHhZdDZyZDFDeUN5?=
 =?utf-8?B?R2dDUlhxVE1SUjJWTkt3QVNqNDhRSkxjSDJPV2pWQ09aMUlFUXFxSFdBbXNV?=
 =?utf-8?B?T3ZOS09uUTR4Y0xwMThudEJaRzRsVkhnd2lEUW5GSm5yemhvTC8zUkQ4enhK?=
 =?utf-8?B?bEZYb1dsRC9TQ1NWQnVQdlVZR2IyVXQ1R0luUmxqeU9SUDBDTmtDR3YwWjcz?=
 =?utf-8?B?bDhYZVJHYVgrMEtJRld2UGx5bEc3QStTNi9oUTFZZ1YvMWE0MDlWTkplaFpp?=
 =?utf-8?B?amlyd1lrV1NoVmN3SWo0REpVNHpPeHFrWFgyYVBkdlU2bUhkMkw2MHpZVlpX?=
 =?utf-8?B?MVFKTjZrWDRvUDF0QkdjQkdaOFdkSHhWcVN3RVN5Rm1VYmdHZG45YlR1UnZD?=
 =?utf-8?B?VTNYZUk4UUlPRnNzTXBQU0Y0WXZhcFFkZG83S21KWU5WVWlDWlVNVVY2RHRN?=
 =?utf-8?B?WFo0NFNsbUM5ZXBCcWxhTTFHYjh3M3lvNUZVZlAvOEhrZ1k2cGdEWXk3RUhx?=
 =?utf-8?B?cjhjN0pDL0VxM1FIdFpRVTVjaVZ5RzY0a1ErRTV6dTdDU0xPRTR2MWwrbXBo?=
 =?utf-8?B?eXUyT29KV211cW5IVm5kV0NyZi9jY2VEMTN4WEdGK1M2NXA0OUJNWC85b3or?=
 =?utf-8?B?K3ZyK2ZUeUVRZGdNNmZLejRVbnVRQzBERG9ZRUM2ZHFtbGxzNE9qNFlsY0ZI?=
 =?utf-8?B?dXFUVFpualVxd2gyRGUzS2cxT20ydDJvOWJOTzN3ZlBOR0RiaG03QitSSm9h?=
 =?utf-8?B?bi9iVEwrbEdnMi9MbHR1OG9RTUpqNnlCZk9hejgwRE9wVUwvV2h1Z1ljS2tG?=
 =?utf-8?B?b1NOaFhnTjU5VU5YbmNLRkwwaGZCWFlnbkRrbHpxOWRDOG5RWGtDM3c4Qjh4?=
 =?utf-8?B?ZTFwTGlHdUZkNi9GUGhYWWdLa2luaUU3TktlbVd3RnN6T3g4RWEvVmhQYXl1?=
 =?utf-8?B?UGNJcVF4NFBaS3UraSt0UlBNRVlpQWlVdVVrRFhXNTBLeFhwd2tpTlNJc2Y1?=
 =?utf-8?B?dnpnM21tcVl1MUJuS3Y5aWw2VEpFYXpZSk9JM1duV1VvNDVqRE8weWRCV1cw?=
 =?utf-8?B?Q0VYbkJFUkZkMkMzQmhyMWV3MVd4cXB4SzFERUNOSWpjSlp3Nys3Qy9qUGVw?=
 =?utf-8?B?aU9qdlJYdkV4TnBKOFVGcFFIdXhLKzVVWDdibmhTUjI0eFhrd3NNcytWcWZZ?=
 =?utf-8?B?ZjF2R1BaMXhRSUxVWTdnbXAycjVGcy9zRUZ6UEhvc3l4a3RkMDZ6UUErcG1X?=
 =?utf-8?B?R0hTQ2tBbFhXQXRiUDlQSEE2MlcwaHFUaXFNditZWWJDMVczcHBkY3BLT2FV?=
 =?utf-8?B?cXhNV3lDQUkvZWtVOGRQb1M3N1Y1cmt4WTByOEo5WC9pVUtKeU9wMWNRNzNJ?=
 =?utf-8?B?cjFXZE9rRVNOU1BxRzZLbjY4VmFkWXJ3ODYzZG5DTlJUa1grajIzMXhSaTVZ?=
 =?utf-8?B?dFMzZ1pSUStMc1paaW04dENHWDRML3dKOEZYRGFYUUtLU0kxN0tqL0R4SEJY?=
 =?utf-8?B?bkNqZz09?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 218b030f-6491-4270-4bd4-08dad2bb2035
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 10:10:36.9771
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sO3aWRPMgiNDbxJtskb1SrKt8m1sNGkLCbh5TPw8NK8W86RlbpbuTenmfz6nl69jlekO797Q8dWapuEUn90Vdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR03MB4917
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
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Chris Wright <chrisw@sous-sol.org>, Olof Johansson <olof@lixom.net>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@elte.hu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 30, 2022 at 10:34:41AM +0100, Jan Beulich wrote:
> On 30.11.2022 10:26, Roger Pau Monné wrote:
> > On Tue, Nov 29, 2022 at 02:12:10PM -0800, Stefano Stabellini wrote:
> >> On Tue, 29 Nov 2022, Roger Pau Monne wrote:
> >>> The hvc machinery registers both a console and a tty device based on
> >>> the hv ops provided by the specific implementation.  Those two
> >>> interfaces however have different locks, and there's no single locks
> >>> that's shared between the tty and the console implementations, hence
> >>> the driver needs to protect itself against concurrent accesses.
> >>> Otherwise concurrent calls using the split interfaces are likely to
> >>> corrupt the ring indexes, leaving the console unusable.
> >>>
> >>> Introduce a lock to xencons_info to serialize accesses to the shared
> >>> ring.  This is only required when using the shared memory console,
> >>> concurrent accesses to the hypercall based console implementation are
> >>> not an issue.
> >>>
> >>> Note the conditional logic in domU_read_console() is slightly modified
> >>> so the notify_daemon() call can be done outside of the locked region:
> >>> it's an hypercall and there's no need for it to be done with the lock
> >>> held.
> >>>
> >>> Fixes: b536b4b96230 ('xen: use the hvc console infrastructure for Xen console')
> >>> Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> >>> ---
> >>> While the write handler (domU_write_console()) is used by both the
> >>> console and the tty ops, that's not the case for the read side
> >>> (domU_read_console()).  It's not obvious to me whether we could get
> >>> concurrent poll calls from the poll_get_char tty hook, hence stay on
> >>> the safe side also serialize read accesses in domU_read_console().
> >>
> >> I think domU_read_console doesn't need it. struct hv_ops and struct
> >> console are both already locked although independently locked.
> >>
> >> I think we shouldn't add an unrequired lock there.
> > 
> > Not all accesses are done using the tty lock.  There's a path using
> > tty_find_polling_driver() in kgdboc.c that directly calls into the
> > ->poll_get_char() hook without any locks apparently taken.
> 
> Simply by the name of the file I'm inclined to say that debugger code
> not respecting locks may be kind of intentional (but would then need
> to be accompanied by certain other precautions there).

I'm also confused because hvc_poll() which calls get_chars() does so
while holding an hvc lock, while hvc_poll_get_char() calls get_chars()
without holding any lock.  The call to get_chars() being done with a
lock held in hvc_poll() might just be a side-effect of the lock
being hold to keep consistency in the hvc_struct struct.

I also wonder whether new users of tty_find_polling_driver() and
->poll_get_char() could start appearing and assuming that the
underlying implementation would already take the necessary locks for
consistency.  Just looking at hvc_vio.c it does take a lock in
its get_chars() implementation to serialize accesses to the buffer.

Thanks, Roger.
