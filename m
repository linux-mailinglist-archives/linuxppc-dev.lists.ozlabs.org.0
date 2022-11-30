Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F10A363D1CF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 10:27:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMYkn3bFQz3bf6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 20:27:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=Y35OQE5V;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=XWefflSB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=citrix.com (client-ip=216.71.145.155; helo=esa3.hc3370-68.iphmx.com; envelope-from=prvs=3264ca9f5=roger.pau@citrix.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=securemail header.b=Y35OQE5V;
	dkim=pass (1024-bit key; unprotected) header.d=citrix.onmicrosoft.com header.i=@citrix.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-citrix-onmicrosoft-com header.b=XWefflSB;
	dkim-atps=neutral
Received: from esa3.hc3370-68.iphmx.com (esa3.hc3370-68.iphmx.com [216.71.145.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMYjq1L9Wz2yxB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 20:26:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=citrix.com; s=securemail; t=1669800383;
  h=date:from:to:cc:subject:message-id:references:
   content-transfer-encoding:in-reply-to:mime-version;
  bh=a1tGRui2dX+2fniVTma8dS61MXBhNt7lFsSo8yvmmPs=;
  b=Y35OQE5V5QE8UhLqJKsdnkCBtuu4CVgZZviV1UYgN2KkdjMlCxKNOvP3
   GukPk+ixDsHnjaFe7Po0aBSSXyUQNkDmOYgtt9C/p08m6iYV4SK7EtY1w
   izlPck5XGg8muNRSBlop2WbXbZ/w7i23V+UVyyzxRMR3OyzXbqwrcVGbw
   M=;
X-IronPort-RemoteIP: 104.47.58.169
X-IronPort-MID: 85842101
X-IronPort-Reputation: None
X-IronPort-Listener: OutboundMail
X-IronPort-SenderGroup: RELAY_O365
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:VB20q60by8+5IVB2c/bD5ahxkn2cJEfYwER7XKvMYLTBsI5bpzwFy
 2BKD2zTaPmMZWOhLtAnbom0oxsDsJLcz9ZnSlM6pC1hF35El5HIVI+TRqvS04F+DeWYFR46s
 J9OAjXkBJppJpMJjk71atANlVEliefTAOK5ULSfUsxIbVcMYD87jh5+kPIOjIdtgNyoayuAo
 tq3qMDEULOf82cc3lk8tuTS9nuDgNyo4GlC5wVlPagS1LPjvyJ94Kw3dPnZw0TQGuG4LsbiL
 87fwbew+H/u/htFIrtJRZ6iLyXm6paLVeS/oiI+t5qK23CulQRrukoPD9IOaF8/ttm8t4sZJ
 OOhF3CHYVxB0qXkwIzxWvTDes10FfUuFLTveRBTvSEPpqFvnrSFL/hGVSkL0YMkFulfHGV//
 t48IRc2awmbieW86rP4UvNAr5F2RCXrFNt3VnBI6xj8VK9ja7aTBqLA6JlfwSs6gd1IEbDGf
 c0FZDFzbRPGJRpSJlMQD5F4l+Ct7pX9W2QA9BTJ+uxqsy6Kkl0ZPLvFabI5fvSQQspYhACAr
 3/u9GXlGBAKcteYzFJp91r827+Tx3qjAer+EpXkqdR0q0LJ91YwGS0tDVGf/NWCpm6xDoc3x
 0s8v3BGQbIJ3FewUtD3Uhm8oXiFlh0RQdxdF6s98g7l4q7V5RuJQ2sJVDhMbPQ4u8IsAz8nz
 FmEm5XuHzMHmK2YTzeR+6mZqRu2ODMJNikSaCkcVwwH7tL/5oYpgXrnQcxuH621ptn0Hyzgz
 TeXqiQ3m7QUi4gMzarT1VLGmTO3opHDXyY26x/RU2bj6Rl2DKanaJav8kPz9utbIcCSSVzpl
 HIDgcmFqucVEYuKijeOUc0KBrii4/vDOzrZ6XZtFZQ88zWm+1a4YJtdpjp5IS9BNcIDdxftY
 V/UvEVX6YM7FH6ra6BwS4+1F8lszbWIPd/lTPHPcfJVZYVqMRSA+Gdpf0H492TsllU8ibk0f
 JuWb+6oDG0GEuJg3j6/Tfxb1qUkrh3S3kvWTJH/ih6hgbyXYSfMTa9faQXfKOck8KmDvQPZt
 c5FMNeHwAleV+u4ZTTL9YkULhYBKn1T6Y3KlvG7v9WremJOcFzNwdeIqV/9U+SJR5hoq9o=
IronPort-HdrOrdr: A9a23:KmIqBqyGuaRbmbOWOHBeKrPxTOgkLtp133Aq2lEZdPULSKGlfp
 GV9sjziyWetN9wYh4dcB67Scy9qFfnhOZICO4qTMyftWjdyRKVxeRZgbcKrAeBJ8STzJ8/6U
 4kSdkFNDSSNykEsS+Z2njeLz9I+rDunsGVbKXlvhFQpGlRGt1dBmxCe2Km+yNNNWt77c1TLu
 vg2iMLnUvXRV0nKuCAQlUVVenKoNPG0LrgfB49HhYirCWekD+y77b+Mh6AmjMTSSlGz7sO+X
 XM11WR3NToj9iLjjvnk0PD5ZVfn9XsjvNFGcy3k8AQbhn8lwqyY4xlerua+BQ4uvum5loGmM
 TF5z0gI8NwwXXMeXzdm2qn5yDQlBIVr1Pyw16RhnXu5eT/WTIBEsJEwaZUaAHQ5UYMtMx1lP
 sj5RPQi7NnSTf72Ajt7dnBUB9n0mKyvHoZiOYWy1hSS5EXZrN9pZEWuGlVDJADNiTn751PKp
 gmMOjsoNJtNX+KZXHQuWdihPSqQ3QIBx+DBnMPv8SEugIm6UxR/g89/ogyj30A/JUyR91v/O
 LfKJllk7lIU4s/cb99LP1pe7r4NkX9BTb3dE6CK1XuE68Kf1jXrYTs3bkz7Oa2PLQV0ZoJno
 jbWl8wjx98R6vXM7zP4HR3yGGPfI3kNg6diP22pqIJ9oEUfYCbcBFqEzsV4o6dS/Z2OLyoZx
 /8AuMTPxbZFxqfJW945XyBZ3BsEwhubCQ0gKdOZ7vcmLO9FqTa8srmTd30GJ3BVR4ZZ0KXOA
 pxYNG0HrQM0nyW
X-IronPort-AV: E=Sophos;i="5.96,205,1665460800"; 
   d="scan'208";a="85842101"
Received: from mail-bn8nam11lp2169.outbound.protection.outlook.com (HELO NAM11-BN8-obe.outbound.protection.outlook.com) ([104.47.58.169])
  by ob1.hc3370-68.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 30 Nov 2022 04:26:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mem0jsJxVYcRnfsmc+k/2LMZTuFHuUdkWiyD1lPHwlvAPUU3cLbfwVRy0UPUm7G5IA/j9dxAHBHui+TcBCEYoGWCMx8Lqqm3sLY5qOWNHQjAvWo66r4jywrXnBo7FUGTegelcFyjDgrR30KIsZ10u0B0XlhRGHwNtKyhdplR47ewU8jXXf+NEstGJIzIIbOr8T/zrCRUaU+sk+jCqRZ5P5gggV/ssUI+5y0FI0U2gZau/r83C2R6YNd2J0eOxfcWcEFJ6/z3jXXc2TGNciWWgrvQdPbYR2MqxqtVtmKg+AnBuCt+Fsz5XBsu91f0EtDWWkUikeHBc7f7Ec4CEeL7eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2TzLxx3p+XBF6obhIGVlm//r/ntLl/f7S09/Az1T3TE=;
 b=C8ArNvCUME4TFpdm1A/YLoQigcFu3maxdghz98L3OmfkVx9K3BT7dAxQZTT+giL3DOKQrRPMj09wKgDBtI/Co0HOugYHtfPu58CssyjokS438oxJ8zcg+WwvPxsv2ML80vGnmmm3cuSIxtDc5A9TivyIhp0AeuDkM6m0HUMA2twCPRymrWvPbeASoKN2E0ml7n1B0w8GJGQsplhG1l4+cTQaIfdx82bIRY2CZyfhPi6U5rdpo1G1G+6CMnvAgbf96bPRt3yDj2WQifZJWjrvs7Dt6RiZCtvLeMrFoQSOClD3OReouQsUR+p9L6joAXh/mvp9xw/nBdaOU4WegaqHug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=citrix.onmicrosoft.com; s=selector2-citrix-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2TzLxx3p+XBF6obhIGVlm//r/ntLl/f7S09/Az1T3TE=;
 b=XWefflSB3yZkrI96wQwG1WHr36WZTTdeCbQOi1u/oUrEQo0A/upjFe8NiaXUH3d5E/CvNEPOD+9HaXs0OBofK7kH8oXpmcv6nKWmSEqYYKUeVEAYAFysOkG/0c9fqajDZrzk93XvhcxHSUTIVnRDxO3zHoxmJ3km7UZffrh3UCM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com (2603:10b6:a03:395::11)
 by BN8PR03MB4929.namprd03.prod.outlook.com (2603:10b6:408:79::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 09:26:13 +0000
Received: from SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1]) by SJ0PR03MB6360.namprd03.prod.outlook.com
 ([fe80::740b:4e0a:7de4:5ab1%9]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 09:26:12 +0000
Date: Wed, 30 Nov 2022 10:26:07 +0100
From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
To: Stefano Stabellini <sstabellini@kernel.org>
Subject: Re: [PATCH] hvc/xen: prevent concurrent accesses to the shared ring
Message-ID: <Y4chryL2YvfhgQmk@Air-de-Roger>
References: <20221129120107.2942-1-roger.pau@citrix.com>
 <alpine.DEB.2.22.394.2211291351160.4039@ubuntu-linux-20-04-desktop>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <alpine.DEB.2.22.394.2211291351160.4039@ubuntu-linux-20-04-desktop>
X-ClientProxiedBy: LO4P123CA0158.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:188::19) To SJ0PR03MB6360.namprd03.prod.outlook.com
 (2603:10b6:a03:395::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR03MB6360:EE_|BN8PR03MB4929:EE_
X-MS-Office365-Filtering-Correlation-Id: d2a09d31-8abe-4e4c-9fb5-08dad2b4ec2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	coUehJfqy0sK2s+0FBuo5dxZM22si/edpRVXAPbmY1Wr/POFPn5poWbLM8H59YpeIHrco97iuLybc3UivQX1NWOYGbBgA61Ae8lvlWAZ9twTTLcu45R9pggulOcin+psboATNCq90R7U/eHQDkzF5eFATbC14hmyfsIb9RiFC28TOnNDeA/Kx4rNiASMtjHYrANi0bEBCIQH5SC5faWUjc+GNNpCVyxzTol7kmZNOiWKK5O1pgUzFMpoK+QZAss84mqZlUtn6gQ/nr/kdk2jnYcbSaWGG3nkf/yNPJGotzdq6GCt1hRLVGiGBsQaYJ5fiEKUK3+mNqRGaup4KoRjycC1igOQQVhwEjq0fo+lDPanxGlM7q69TSfE0eiOc/9iDtDqZrgFvOfOLYekPxn2KAIMLWRi6TvDbEhbmWdA1vKS/yG2tjsuH2OhblQzoCu1JFq/EIiXRwTlz1IfbaSMwCPK91lsQPkGV9PrJ+D3S+34tx78wzHQQOxiLj7e3TjETXMlSjcxamvGGBoGheaLqWlzcUys7BTv6nsX2OE3bn/vl1PTAUQWU5kN96si0aI2NiIgJCxT78sLTgvH8rHO63iUEiaXDlY8QzT/um0kLgNTvFMleo0PeOr7v9lHSqlnRLQNpcU4ghSuXs22nJHhsA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR03MB6360.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(7916004)(4636009)(396003)(366004)(39860400002)(376002)(136003)(346002)(451199015)(6506007)(86362001)(9686003)(66946007)(8936002)(41300700001)(26005)(8676002)(4326008)(66476007)(478600001)(6666004)(316002)(6486002)(6916009)(82960400001)(38100700002)(83380400001)(54906003)(2906002)(7416002)(6512007)(5660300002)(66556008)(186003)(33716001)(85182001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?utf-8?B?Q0FEb3hzd3hRUkw3N2VjM3Z3S0pLQ0wxVG90TW9nK2p3ZHJzRk5nM2JnZWRO?=
 =?utf-8?B?T0gxRlNwM0NNWStoWDA2QnpoeDcySHRqQ25BNThhKzYxTmlmTWxyRXZ5RDA2?=
 =?utf-8?B?YjRmOHkxMzhSckZPWk42aVFUV291eDl4U0hEc1U3WTRkcG1ZNUxxT2I1RVJN?=
 =?utf-8?B?STJaR0E2Mmg3S1FmcXBpMHBPK2dxSmZkMWRreVI4amRJQUxrV0w3TXNiZUNt?=
 =?utf-8?B?L3p6eEhDc0hQVkZBTFVnUmIyQ2orcDliZlh5ZTlYTTBNY2JtT2FoN0pBN215?=
 =?utf-8?B?VzhqdEJTVlp0WGRLcERxU0Q4TnFkbGxadlFXYnY4TVhoUEJDdjdSNU9mQ1dh?=
 =?utf-8?B?d2hmdXd2aEs5ekJnSnRia0dsemVGdVNVMkZXY2haNlVUWFlGL1BxYlZlRnNp?=
 =?utf-8?B?WENvSUFaWVB2YjJkTTd3Q2RBVW50RVlJeGtTcnBhUGZJakUvelgvQUFyYWxv?=
 =?utf-8?B?cERndG9XUmNJYldCdEY4N0JDK0xHcmdURlpaaE9UUG1KbUwyUWNNQ2JCYWEx?=
 =?utf-8?B?M2w1ZmdrRGFEUlBpN2syRkNoQm5KVW91RUFGRUV1dGs3ZzNFQ0c2RGVJTXlE?=
 =?utf-8?B?b05ZQ0ZBUGhkckpTcWdhNVQ4cy81ZlBicmdadE16cnlPeWl6OW5mSFQxOTVw?=
 =?utf-8?B?cEVaaCt3dEtqN1U2S0plZ3BUWDhkRWZPaGhqSzRZZTFlbFM0TDVuRUxCclRt?=
 =?utf-8?B?NUhxWkhQTVpPUGVwcEtSeDBIRmllUVNvNVRpbEJLQVZPUTBUNk02a01IblFZ?=
 =?utf-8?B?cGo4N1JpUDRRVXptT3g2UUMra1IxaFJWV08wVUZRN2JCNzFJLytkM0l6bGor?=
 =?utf-8?B?WDZGWnRYSFUrNnZMNVVVaDNkbnFtQkllbWZ0VlJDZEpROFpBckgycitxb1pV?=
 =?utf-8?B?VmRvOXhFTC9ac25Wclc0amVJOTJRUVFLMTBjUEdJTURKdlJhVUovR3M1aXZE?=
 =?utf-8?B?TEZCQ0RMaFdKZHUzNG9DRUVYSEYycENuaGJDYlJRVDRWN3FnRXlMcG1rMXFx?=
 =?utf-8?B?cmZJeEJPS0UwbVBkYi9YUU5Zd1FRcGg3dHE4ZUJSdlVCMU9oU200TkxncUlN?=
 =?utf-8?B?ampxYnRwUjZyREl3Vmw2KzN2RENkN2dYdFVPdTRNRzlHaGcxNmExS0NTa0V0?=
 =?utf-8?B?STIzN3dmY3R3ei8vR3A1bUhKd1IwbjJ1dmxja2dDZmlvZ0dvTFNCdVdkVGgz?=
 =?utf-8?B?Qk5JQ2wvajhRczR3SnJmanozMDhwSUV1YlhRZXFNOEtIcGgxaVZzSEg2RHZw?=
 =?utf-8?B?WUJ5UGJnRWtRZ3BTV1pQVjRZeXpYM3lPWFZzT3BrSk1STlQ1VVJodXIzOU5E?=
 =?utf-8?B?L2RPV0dUTTdwSGw5TW55MUlORlZkOG02Ly9tcXlpRi8rUW1hYzdVbm53eElF?=
 =?utf-8?B?dTZySnBMdVdoK3VOTGxLT2FlVENCdTJMbmkrSWVSaDZjQlpQRTZTSWVUYWlU?=
 =?utf-8?B?SEVRU2JIWG9WWGVOWm42cGdyRTJ2SS8wK1pydGVGNmFuZzRjajR1NXdnYlpk?=
 =?utf-8?B?YStyQ0l4Y2VwU2lYZjd4RDBIL3pwTjYwWmdxUTduWWxKcEszaE9TazZUWEhU?=
 =?utf-8?B?c3V3RzJobFNyclpyaDR5cm5zTEFzQUh3dkNhOTRkYzNWUkh5SWoxS2h2eUVv?=
 =?utf-8?B?ajFtSWtuOU9WekJlM3ZiQVl2NzJYM21Bc1QzVWM0STVwY09PUVRDWENWbXFT?=
 =?utf-8?B?cjliTUQ2ZlY4TDlDYUZGc1l0R1hNS05OVFhNVFYzU3VoNTdzZjlZcVREZExs?=
 =?utf-8?B?UllnbnJsYnhjNFFORUJ3enhMMEtBMFY1aXpKeU84OVVXQXFJRnpESDVRQlZl?=
 =?utf-8?B?Q2dqRHNScWozUmxiN2RXL3NKZnJRMXhrRXNyM0s1blBNam0zNDFFc21WOFFJ?=
 =?utf-8?B?dHJkdWMySTFwV2Q1eFNYZTdJVVdRYnBaMklsc2lLdEFRcmRzbjc0S2c0bXFL?=
 =?utf-8?B?L25ISG9SRGV1eDJFdTZvMmJxV2N3eis2VnFkTjFQOFZOWS8vNHdRR3Vhc1c1?=
 =?utf-8?B?VUhIS1NJbm1McS85d1BMR2QxN1ZHN2FjdUJ4U2U1dDNINExFTlpCTTM0TW9p?=
 =?utf-8?B?cFZLazZKZm13N2FETmhmZnpSbG11T0tMMHI1S1F1L1VlazNyV2xTajF6dVlC?=
 =?utf-8?Q?wlFkFsIIcDYuTqlryEjVvVZt/?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 	=?utf-8?B?SXJnclNNamoxUCthZDNsUXBmVTB5TlVlQnFDQlBwS3J6NjZ6K0lNMlpGc3Rs?=
 =?utf-8?B?MmRZcjNqajFOemo5eGRLWHpNa1BSNXRBTy9SVDRBWkFhSlh1Z25IeWNJLzZW?=
 =?utf-8?B?SEpqM3VQUkg5RUg4ZHRmT2ZJK1VlVlJBTTRzSzNkc0F5YTNtNEswaEU2alpS?=
 =?utf-8?B?RVRtTWQ4Z3h0V3R3UllnNFc2ZnN6aDNLem0ySlQ1VFZWWjVxS2IveXo0UklC?=
 =?utf-8?B?Y3prVWlNeDhpOEVrUEYrM0t0RC9NNGdIeHg5alNQVFZENTFOZ1ZMdGFhcGV0?=
 =?utf-8?B?SnVZVmtPM0o0dFpvUmpDV25HbXpFUGFrdjVLS1JVRDY3SWFWTkp5ZXptUlVj?=
 =?utf-8?B?ZVVOZ2htcDdrT0NhdCtqUWIwdDE3SWx3NnV4Z2ViZExSUm93a3FMWnJmczVo?=
 =?utf-8?B?bCs4YWxMdWRXR2ZiMWRoSFVDL1daMTh3TjJnYW1DS0RxNWxaZndsNC8xK0Js?=
 =?utf-8?B?ZUwrcEU1OUZWZXE2MllXS0JhY0ZDdkJyL3pRTzl0R1FoK1VJTFdHTlM2Nmdn?=
 =?utf-8?B?YnplckJYSmdrTEFZN0xOdWFML0Y3cWlzeFNNdVF5YmpBOW43RXhTRnA0Zm5M?=
 =?utf-8?B?dnNVREFxaTJuSkVDQ0ZMd1g5akczZU1IbXBlck1NWGJMcVlRbFArV2RhYmMw?=
 =?utf-8?B?TGtSS2labHVBcWtSbXJNM200TVJuUHd1RUF2WU1Rc2VIYUxxKzNxSlNYb0R4?=
 =?utf-8?B?SDF3N3Q3U2lrSmZmRjR2WGFLU2oraGJzd2ZmOTJRNmNPRGZCTWFBUlhaVnJa?=
 =?utf-8?B?ZHRzTzU5WUNpZSsyeGZQdjNaR3E2Rk9MUVlabzF3MDg1ZDNWNDk4dFkzWVpD?=
 =?utf-8?B?VFRTSk56WktsRmpuSVBrOHNrOVJiT2tKSWJQNFZKREFQbXppZkRiTjhtN1hR?=
 =?utf-8?B?aXhBdkFzV3pvNytnbXhIcy9DT0p0TmxYb3lyV1daKzd0a2JYeFdzcUFRZmZW?=
 =?utf-8?B?c2MxY0dadjNzdjhLc3ZjSFpGVVhxUnZwOGhOL3dMMld0b0VYYlVuaS9GWW12?=
 =?utf-8?B?dWg1TVNMTGt1aUpZdjBqdDV4dk5JTGlpT3BhVVhERVhNdHFKTVltMDg0L1cy?=
 =?utf-8?B?R083T2lVZ2VlbXdZVG5Fd0Z5alNBMlVuLy9SL01uR2diRW9WMGVnNm04WDFY?=
 =?utf-8?B?eW1XY0tydkVBL3ZMazdibklMWm1oUUptSTBzdi9DRDM2NVBTMnFLTkpscTZq?=
 =?utf-8?B?LzhqMzZFT3lzSU9zMk9XblhLTGwzSWN3R3RYK0pIZy8rbkxvL2EvRXYzSGdy?=
 =?utf-8?B?MjhVdDVWdEN4NHpoV0I1MVN6VWZsUEhIV0tzRXp1OE9KSnlzV21TYzYveUZU?=
 =?utf-8?B?OEpuVm1CTHh2M0xmbmtIQTNtNHdrWHVrNkI4Vy9TRDQvUW8vWGk3MHUvVURY?=
 =?utf-8?B?Y1o0YkkrY3dMTjdEZkg4V3FRUmhoMVdnVjRDdnV4aTYzb2dnWE9rcFFscUJr?=
 =?utf-8?B?d2d2RXhibHJJTmJMSUFLMVY0Vmk2a2JoWEVFWkhnVGdwTWV1aDNRQXY3cUM1?=
 =?utf-8?Q?08gSesWchXBN/CujSB2xTuVK+JF?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d2a09d31-8abe-4e4c-9fb5-08dad2b4ec2b
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR03MB6360.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:26:12.7387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OW5FLAOYTNltQyc9kLF10SYk0a+UDEwl0NE8tLjVFsj+1cqAzVBEeNai075jRGkvp9WEFp1r3dLrSDtYrv2LwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR03MB4929
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
Cc: Juergen Gross <jgross@suse.com>, Jeremy Fitzhardinge <jeremy@xensource.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Chris Wright <chrisw@sous-sol.org>, Jan Beulich <jbeulich@suse.com>, Olof Johansson <olof@lixom.net>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Jiri Slaby <jirislaby@kernel.org>, Ingo Molnar <mingo@elte.hu>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 29, 2022 at 02:12:10PM -0800, Stefano Stabellini wrote:
> On Tue, 29 Nov 2022, Roger Pau Monne wrote:
> > The hvc machinery registers both a console and a tty device based on
> > the hv ops provided by the specific implementation.  Those two
> > interfaces however have different locks, and there's no single locks
> > that's shared between the tty and the console implementations, hence
> > the driver needs to protect itself against concurrent accesses.
> > Otherwise concurrent calls using the split interfaces are likely to
> > corrupt the ring indexes, leaving the console unusable.
> >
> > Introduce a lock to xencons_info to serialize accesses to the shared
> > ring.  This is only required when using the shared memory console,
> > concurrent accesses to the hypercall based console implementation are
> > not an issue.
> > 
> > Note the conditional logic in domU_read_console() is slightly modified
> > so the notify_daemon() call can be done outside of the locked region:
> > it's an hypercall and there's no need for it to be done with the lock
> > held.
> > 
> > Fixes: b536b4b96230 ('xen: use the hvc console infrastructure for Xen console')
> > Signed-off-by: Roger Pau Monné <roger.pau@citrix.com>
> > ---
> > While the write handler (domU_write_console()) is used by both the
> > console and the tty ops, that's not the case for the read side
> > (domU_read_console()).  It's not obvious to me whether we could get
> > concurrent poll calls from the poll_get_char tty hook, hence stay on
> > the safe side also serialize read accesses in domU_read_console().
> 
> I think domU_read_console doesn't need it. struct hv_ops and struct
> console are both already locked although independently locked.
> 
> I think we shouldn't add an unrequired lock there.

Not all accesses are done using the tty lock.  There's a path using
tty_find_polling_driver() in kgdboc.c that directly calls into the
->poll_get_char() hook without any locks apparently taken.

> 
> > ---
> >  drivers/tty/hvc/hvc_xen.c | 16 ++++++++++++++--
> >  1 file changed, 14 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/tty/hvc/hvc_xen.c b/drivers/tty/hvc/hvc_xen.c
> > index 7c23112dc923..d65741983837 100644
> > --- a/drivers/tty/hvc/hvc_xen.c
> > +++ b/drivers/tty/hvc/hvc_xen.c
> > @@ -43,6 +43,7 @@ struct xencons_info {
> >  	int irq;
> >  	int vtermno;
> >  	grant_ref_t gntref;
> > +	spinlock_t ring_lock;
> >  };
> >  
> >  static LIST_HEAD(xenconsoles);
> > @@ -84,12 +85,15 @@ static int __write_console(struct xencons_info *xencons,
> >  	XENCONS_RING_IDX cons, prod;
> >  	struct xencons_interface *intf = xencons->intf;
> >  	int sent = 0;
> > +	unsigned long flags;
> >  
> > +	spin_lock_irqsave(&xencons->ring_lock, flags);
> >  	cons = intf->out_cons;
> >  	prod = intf->out_prod;
> >  	mb();			/* update queue values before going on */
> >  
> >  	if ((prod - cons) > sizeof(intf->out)) {
> > +		spin_unlock_irqrestore(&xencons->ring_lock, flags);
> >  		pr_err_once("xencons: Illegal ring page indices");
> >  		return -EINVAL;
> >  	}
> > @@ -99,6 +103,7 @@ static int __write_console(struct xencons_info *xencons,
> >  
> >  	wmb();			/* write ring before updating pointer */
> >  	intf->out_prod = prod;
> > +	spin_unlock_irqrestore(&xencons->ring_lock, flags);
> >  
> >  	if (sent)
> >  		notify_daemon(xencons);
> > @@ -141,16 +146,19 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
> >  	int recv = 0;
> >  	struct xencons_info *xencons = vtermno_to_xencons(vtermno);
> >  	unsigned int eoiflag = 0;
> > +	unsigned long flags;
> >  
> >  	if (xencons == NULL)
> >  		return -EINVAL;
> >  	intf = xencons->intf;
> >  
> > +	spin_lock_irqsave(&xencons->ring_lock, flags);
> >  	cons = intf->in_cons;
> >  	prod = intf->in_prod;
> >  	mb();			/* get pointers before reading ring */
> >  
> >  	if ((prod - cons) > sizeof(intf->in)) {
> > +		spin_unlock_irqrestore(&xencons->ring_lock, flags);
> >  		pr_err_once("xencons: Illegal ring page indices");
> >  		return -EINVAL;
> >  	}
> > @@ -174,10 +182,13 @@ static int domU_read_console(uint32_t vtermno, char *buf, int len)
> >  		xencons->out_cons = intf->out_cons;
> >  		xencons->out_cons_same = 0;
> >  	}
> > +	if (!recv && xencons->out_cons_same++ > 1) {
> > +		eoiflag = XEN_EOI_FLAG_SPURIOUS;
> > +	}
> > +	spin_unlock_irqrestore(&xencons->ring_lock, flags);
> > +
> >  	if (recv) {
> >  		notify_daemon(xencons);
> > -	} else if (xencons->out_cons_same++ > 1) {
> > -		eoiflag = XEN_EOI_FLAG_SPURIOUS;
> >  	}
> >  
> >  	xen_irq_lateeoi(xencons->irq, eoiflag);
> > @@ -576,6 +587,7 @@ static int __init xen_hvc_init(void)
> >  
> >  		info = vtermno_to_xencons(HVC_COOKIE);
> >  		info->irq = bind_evtchn_to_irq_lateeoi(info->evtchn);
> > +		spin_lock_init(&info->ring_lock);
> 
> Don't we also need a call to spin_lock_init in xencons_connect_backend
> and xen_cons_init and xenboot_console_setup ?

Not in xencons_connect_backend(), as that's called on resume.  Will
fix the missing lock init, didn't realize the console init paths are
so convoluted.

Early PV console on the shared ring worked fine,  I wonder why that
didn't explode.

Thanks, Roger.
