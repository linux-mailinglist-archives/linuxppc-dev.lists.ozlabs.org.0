Return-Path: <linuxppc-dev+bounces-15850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B579D2502E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 15:42:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsQgk191jz309H;
	Fri, 16 Jan 2026 01:42:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.177.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768488162;
	cv=pass; b=Ws+pwwxQn/kTogJoVkPoqfZ7tk/pl3/qXYpL+H1mhO0PZv95eeCThWrhes14zTXbK/SViGDtllC52lBWEVZ1iwir1ftodf9ZnYIu83UGs7EvmbvRTDDePNju86ttQ4TqqZ/JddvWHGr4sbOgqMJWdMsX4l/JS8y9HuJouTuu2PLHmx4+MXilXKAlB1G8KOzokBg3ers6PsyngNPtQmjCdl7O3kiwMrTbNSU6WL27wYDAhwuuu+fsh+lsY0mG9KpEMBmwUjW1yV+FMrW6dC38EQdTw0HbsqGXDqwNdf83FmUmibyVfUkzYROolGViz/ZUXOhj1Z/WBKagVckkpf+BuA==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768488162; c=relaxed/relaxed;
	bh=81SwDb2ZUODLNOB/N7wKJ9zbmpWP4I6Lt4Pj0c6Op7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=R1ZxHR51x3O1Z/LBDeSm9OLfnoKtk/e/bf4ubl454m4GFMhHa1nFhzcBjb46xYNmLveBmmVNRntyQ/X9kZm2LrcsfPSHpQSrKGHFuJyMSpCfOAtLtVVYArJVEsA4aETbzA18tzzd2+hxe0fjbyLR2/NtFwip9pfEAjp2rZGhpDGJIU+zNKZT/durppWCZIZSneFB/Khl8pXyF2IIFiy8HiMVhUEh+SX7boUlMS1gAY/FuQ9ivS08urTMsmltEPfN3R7ew3HH5Od1V54VaiFt6u1+uFVs6e0lfv4q2Cm9d3OXt4Q8k1dkZb1chhSZsb1u4mnYEdV2RZ3s0I9bWVokWQ==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=heHtFfpI; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=n3p9LGy5; dkim-atps=neutral; spf=pass (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=heHtFfpI;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=n3p9LGy5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.177.32; helo=mx0b-00069f02.pphosted.com; envelope-from=liam.howlett@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2145 seconds by postgrey-1.37 at boromir; Fri, 16 Jan 2026 01:42:41 AEDT
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsQgj0rw4z2xNg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jan 2026 01:42:40 +1100 (AEDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60FDjth72863589;
	Thu, 15 Jan 2026 14:06:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=81SwDb2ZUODLNOB/N7
	wKJ9zbmpWP4I6Lt4Pj0c6Op7M=; b=heHtFfpI6k6z3PxV6kxGp0iBEyUVVo5LHL
	JB3NZKWxPyD031R1oFZB5LDcUiLB254BKVoxSA0/vac0mMOQ7IBlfWcqDucD+Iq/
	VI7Hs0VEp8Dox0ED7E2ZULaRtA//0c6ByKLBT59hrYLEl/xq6yHj09uzNgw8JIg1
	cwIWGNqo1gkudeWgsW3kHMhCd9PKp6M4Yaowyl6cssC7LA0MgzaKI2rMmg29rn2f
	efNEv82gmp14Ydxo+EzKmiU7EMHTDPppJl/MYBEIfi0Tgj1ng+WF4lwfHt4SPNeq
	QUmn3z1TGvnar4+BakiIXp1h9gHqUmsIXWwkXv8REgbO5h0200Ww==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkh7nr20q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 14:06:24 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60FC5UTP004547;
	Thu, 15 Jan 2026 14:06:23 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012009.outbound.protection.outlook.com [40.93.195.9])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7bbehb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 14:06:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OxIz0v4B/8X8QyS1RP1WFAPTvDPeK8Q5l9HcgQpl9yN5Pbz9/z7EsEclJXN6S21M87ndg/P0hos73LEnaKKbUbyUjP4XZ49IRaZnG4htWOBb3UmHHWO+PSQz0pRIUT46/HPNfcV0G7sUuszyxvucvxTsNWQx8IWJRgyXyQ1MZYqi4oST0cSzmBvjnPdBvpz5TbTTDw5Jo2u7jEV+0bfypZAevv9R0HTWkHpbXmCUmb1y6rS9KvozHFJcR3uuUAe8ABWun+m6lN+f/YHBRcZ71kC34IQl7rqohd+S/yVQHHlukM2goR2Aq2kzf2l3TppOqmKeG/xBh0MLrL5VyQrs1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=81SwDb2ZUODLNOB/N7wKJ9zbmpWP4I6Lt4Pj0c6Op7M=;
 b=q1BrQJ7dVR+D5BSGIyClxph/HtLnaMSpTlUE6V8dmokE6UbuDlbWOItt1F7H6dM2Co011FL+vPvayhs9JDRgr14T497CZcYG64bLIanTaeNi+yVKgUNshMCTCrQqYXMjpMFArf+MRQzYqrisWd7cvu4OhrehztjY1EB2AllGN8MZC+aLmyqx4WKz1Q75veD7zelIXSLCTjCQxDydpWMLhjfEPseZ6oIgFKwqUz+chPQceFEqZIS3sjpoToizNreqOBvueDDTVOx9kw9J3qTZUYgrfuUvuNpQANoxzI9O7Ns3zZXUfIvhfIn2GoI2ogI5m/3Q1IChOUFYoLZqXWiPrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=81SwDb2ZUODLNOB/N7wKJ9zbmpWP4I6Lt4Pj0c6Op7M=;
 b=n3p9LGy5H0NWWlI2JzSinI6B98F9MdxROJGdVqeDpF7LWMaCNYwJtYPnFVi1y8+9ryJW2FOfwFwXVOG/ERkHYf8TC5S8MFFvDMeeGBlsY2s4dnD588wXFNpCcZ3RABc1SJ8WhNI6IWCJ9GTdFG2r9gHh7gkcKaPIMBhFE3A57EA=
Received: from PH0PR10MB5777.namprd10.prod.outlook.com (2603:10b6:510:128::16)
 by DS0PR10MB7201.namprd10.prod.outlook.com (2603:10b6:8:f2::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.4; Thu, 15 Jan 2026 14:06:19 +0000
Received: from PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce]) by PH0PR10MB5777.namprd10.prod.outlook.com
 ([fe80::4b84:e58d:c708:c8ce%4]) with mapi id 15.20.9520.003; Thu, 15 Jan 2026
 14:06:18 +0000
Date: Thu, 15 Jan 2026 09:06:13 -0500
From: "Liam R. Howlett" <Liam.Howlett@oracle.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
        Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
        Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
        Zi Yan <ziy@nvidia.com>
Subject: Re: [PATCH v2 05/23] mm/balloon_compaction: centralize
 adjust_managed_page_count() handling
Message-ID: <vdgwo5wyvuxuijygb5jq4mv4wsxtj3lwweebynyc44iukoiecy@qjdu4qpxpokh>
Mail-Followup-To: "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	"David Hildenbrand (Red Hat)" <david@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-doc@vger.kernel.org, virtualization@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Oscar Salvador <osalvador@suse.de>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Zi Yan <ziy@nvidia.com>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-6-david@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092015.3928975-6-david@kernel.org>
User-Agent: NeoMutt/20250905
X-ClientProxiedBy: YT4PR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::8) To PH0PR10MB5777.namprd10.prod.outlook.com
 (2603:10b6:510:128::16)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR10MB5777:EE_|DS0PR10MB7201:EE_
X-MS-Office365-Filtering-Correlation-Id: a14e8496-2fa1-42c6-c399-08de543f40ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?STHPXkOPhRd4cVUdDRMsLqWgq71P7Lwez3kU863/IYHXsyAYv5coz1v5hi7f?=
 =?us-ascii?Q?6p47XWW+s51hnh3K70v5+tzuUsjl1alpI3vFgsaew/4K9juZSsww/p4cfo0t?=
 =?us-ascii?Q?zFjmqGpHu9cPCM/MaDVru4Ng/ip+vxWocrLGvNcjhHiLCy2TyU2/a/gPotxl?=
 =?us-ascii?Q?ZJWFo39G3/A9ZJuWJS/r/QxqCk149DVXW0qJFTJeVOhjmWiBTMk63qnmkaBE?=
 =?us-ascii?Q?nQL5FGt9qKo1q4U0pJBT9G0aTrKV4KMTFg8bQtl9w14KH8U18y0igIUiutpu?=
 =?us-ascii?Q?DaUi9Fkyh3MtgCr2f5zYXT8a7iBLbDEthSbxEWSfCPzzkmZk+HnWx51DY4Qk?=
 =?us-ascii?Q?VBpsSgsbM00aljk6K5Bw5UQUYJd1smv8t9cV3odzfpSzCOpRQwvdN7lRoZrv?=
 =?us-ascii?Q?Aep85mRGZ7RdJV8IImS7ieEcg15tozYNU5YlAIXEVlTqkTlnUpVvnnqialpg?=
 =?us-ascii?Q?zIQwpamQzedo0+2hQbfFtn24CjQoBRzTzJzumN4UOscW4mThWCuLaNn0rlD3?=
 =?us-ascii?Q?UgHGCWWnBgEUFIy1tQnbJFp3xoaqKNdlVkUXDhlYe8U2ygraWrEHyAw2hSxn?=
 =?us-ascii?Q?vnC0ts6Sor0of3OcklAVED1HZabkTerjkttCWModU37cEQQb+Up1uU2iRbom?=
 =?us-ascii?Q?Cwcem2wN/KCcEiyJZVd8d6MTg7Ufp8fa9krPE/aeniuLO+Tk4umwq7XwdyOp?=
 =?us-ascii?Q?UEZGd6FrJLO65M4mw8UbmvqNRTdxSpPeAKIPyIEZzXL36lbSDoFcbR5JAP/H?=
 =?us-ascii?Q?Wwj6HnKZ5bZOjKriffQQTYwxngvAeIRebMXLjs1iEmSkDlHy6OxmvJ0ly6WH?=
 =?us-ascii?Q?YTrO4dypFd34iz7NCHWT+15hK0EEPdnlrVPPcFEdQ6YURcHzFrn+sOOrrZqI?=
 =?us-ascii?Q?wu2q1na0r0qU9G/DmFyGD5B2p+NxQyU1fd5oA/al6fdddEdCS0ZpIgXCHv1X?=
 =?us-ascii?Q?K2wpvHVrXjvbvqX1tY+lDZgYk3Gz1I3mbBW9580qNN13bWGRsaMG93VNN+Ip?=
 =?us-ascii?Q?SvSsh0uavoSzgf6WEGgNxwADPxH2hTOuhA6+PWm1idfeewsqMQm/Jdkbowlv?=
 =?us-ascii?Q?gstyBwTEDiqntFFUNnMAEZ4qb9vmeyQJAcuttO4vtBrE6b7BHswLpJ5FBaDn?=
 =?us-ascii?Q?5lMxWBzk+DRxwWv6GaVqoZg5rUwC27SvZ0Ph52LpKFgZ7xJ9sVZo0ugHF6dO?=
 =?us-ascii?Q?XjRbBGOf8k0pFEGohXDqQrK2sNQPW7+SwaMQq5Iq0Bvu9wP6dYUS0cuvuVVY?=
 =?us-ascii?Q?SklD/AlEPQqhiZX95DXbxoVnRBfo32jX3oORFkBaCZ0V46WdmJD+xmeiQ0Ex?=
 =?us-ascii?Q?TlVPmFaPsv3cmGUuqNrYnSimAjgdbmWWzwaIRIgx67r6pE5/T43/51G4cI2c?=
 =?us-ascii?Q?gBY/FsvVPKnN3/1bVT0Ubo+koXMb4wpo99oBWVFnyuZdT0MCF7RQifo8rx07?=
 =?us-ascii?Q?iITaDro2I6JaqJ1HCwPmXMhnvaEN74GjKSQijOFBrFIl+qnhzaPWbAVCsBN7?=
 =?us-ascii?Q?KU618E8Kl+XV+QgnU+W6S4+ogukYhTS2RwqP8pA/VgaMmnJv7ZujFIo8/21Y?=
 =?us-ascii?Q?LmEStCb+Kqi5JrxAC7E=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR10MB5777.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hLoZL2J5tMhRvDqJBqxO3IyCPBjUW+e76MJLRc7Cq2MjBggEKPCX4m+/Gr02?=
 =?us-ascii?Q?ESyPr14vflX/23Ea1Srn5r7W+UdXgVv1nfWwh/xSOzLgWqvBvtESRZx1DAk4?=
 =?us-ascii?Q?a+HmWayk6ldS4uzwvGQm9jwa28MySTHREeuRUxqYgRqMe8TLg5aWiCTg0aeC?=
 =?us-ascii?Q?Uvz3LvJuKWztAQOKDtO861bcTwSc81lGP/KFkT8JESgL3IvLwhBY49VgPK//?=
 =?us-ascii?Q?JT6HC4ZmjE+AnaQ4cq4xCXUAwXPOQVHq4MxlLzQ8FfLN+8M9p/Etpmd1ESgq?=
 =?us-ascii?Q?thOb9e1FWJPTtxOoDSKyrJsuweKOB3WevJ1Emluk9S4myJVLElw6E3nzlk2I?=
 =?us-ascii?Q?m5N3Z0ZnmhyvzSxKksRS2CWPrYwd5X1tvfgxq+6wI/7SqrDW/bDvDhWbXkKa?=
 =?us-ascii?Q?EZlvOmaLwg0ZZWqyYU/CbEa3bU2kHxNmOjk2l2K6icZRilXYt94E8TxGL+gm?=
 =?us-ascii?Q?2oy6j8q5aKWpeZU3KNsJtpRgOzENpRWv2d+aBIlVewVu9jWY/edpa4uADP+u?=
 =?us-ascii?Q?Cho0xuJ65aR8f3X2F141qbiAQTgl5Ij7ytYxyZtvoThuREEqVTWsXV2gJ61K?=
 =?us-ascii?Q?ioSfnNR8Oii7t0bdy2DBzkJI+Cd0I+s7CYRNbHWhjkFvjqxLI6HL7Yic47r/?=
 =?us-ascii?Q?kCr7AXMij6vGdxhC+wjpzr9aVGwZtludFUhGqdsvgbqeSzo1XXF2LmGrIVuQ?=
 =?us-ascii?Q?eqCkAf0Ev1vvTtaef4fTEEbjquAlrRWdfse9NwHOH1uBd00PFdSwxtmuc87B?=
 =?us-ascii?Q?GPTOM1fPFNNDBZi3XaHUElwne+cQOF6WxYnEUhWWT6JKmwfXVDztbYr4nPVN?=
 =?us-ascii?Q?kYCbWk1t0uLvmFiBRvdG6XGx8j2ibHlx9nHVK/D+HLC08lT4SHOo0oXkXxbA?=
 =?us-ascii?Q?0xuZrULNcmDDq4e0BLL1BlbSkWfIpe4EiZ5QLzbrmFElaKit1Q3IEQySvxgx?=
 =?us-ascii?Q?ofsWsE2TuNxgy6tlyt5zSYorWjxlCTqHM77rM0rw5ZBd0/KOTPKKTU6Ah26K?=
 =?us-ascii?Q?hfRPR9hl/Mi16lX4Ks4tlrvmFAAGjLeW5k40F4OqoN7GLCkOYSN8WRzTJ7S4?=
 =?us-ascii?Q?diLD1+hb0gGECA0XLW8PIIUMiRdJdXuPkY/0T2G/6tZBsvwdnQJ9vBzoxb4J?=
 =?us-ascii?Q?VtqUCDNK+jh+24fOp/yXns5HHiWyHWjibVhe9jyeQNHrmsjkpE8ihN9ODWPv?=
 =?us-ascii?Q?XksUvljtOc2qU59LPzjUsS89R4DXD9YI3BZKK/jK8gSaaRnkAHIjKBBIgj3v?=
 =?us-ascii?Q?MRvIqFTWM8JEhQQ6XRkY+8/VoWnKFgVnz+zU9kxheNftLUHO+UsakLpFrjPN?=
 =?us-ascii?Q?07ljC9+sFn9w0JiXUmZKpPXCjVNkJK5fnITs4T8e5KlvmBRVosNduRMmFBl6?=
 =?us-ascii?Q?ppR/nMdiHx6bzpFAric9f5IWCIzjGOwy3Z7iYu+JeS/bFtGMWazjWboYZ4U6?=
 =?us-ascii?Q?KG7kr4HYEsON8K5pU+PK3EbJProbtPQyM00IfE0mEfip9X/9qjemNr7/oKL7?=
 =?us-ascii?Q?kIoycTgZoU9Zz8XtAZwBMvyHmAufTLbFJl++kXFLqhD7vC5Y3meOqWdHuX7l?=
 =?us-ascii?Q?Jz60P0+jIGsi7dhygrPQuX0MqNbbAvkH2z8G+izduHXGdWHcLrM+lEqna4lN?=
 =?us-ascii?Q?k4OaQuT7QL6WC39LomN++4UAo/D4XKtJRn5oXWTQmGF/+6bvUpy1dehGWHxA?=
 =?us-ascii?Q?BtD1d65OVONYIBFBLg+aXc6ZrdHEg+3EfNHUNdl6g2BOZd6vFFJJt1JUMPor?=
 =?us-ascii?Q?qK0hkonAdw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	3PZE06udBpZ24zEMgqrsul2z8ObeK50xSRoe94bIAdxBgO9XecXWwAFL4DwG74Yk7k9zcLQbSg8ndILvreQ/x7ypJ13cT9xJs70/GxcquQ97NGYmDFiDIl0nseio0SuNNGCyfrv45lWctyg0k1sgOu/zkIPgnU3eGJHssZUhs6nDHz18cB9sfio6w4IYNJQbMDLIOiPqsTDb4/fMUvhvbsjUKU+UjpSAEx4j7ML3KsIbFvyPH17Mw5ywbPdQPcw+z7shob3HvqCoJrePZ5LfAofBAkuF4hLe94brMLrgcbPknTiJRZUkG5esPnuOnx9GWmm9eYyqG1pK0+cN6Cxlg82XUn7Jmf+W+/zUAv9zV0O6Mse8NjHNrIrAKzXJevKVpfapd/ak56AJ9BhDvHvTuPCoyoVSp6JcZ6AvJq9Loi5g9uvd42GYf1RQpiHGydWlg6Q912df6MjrMl5SmXm1q8uTs9rVjhE4o+mxNP18MCCy0tuaS3fwW74ckq+dDzn2P0dcOxZPZtacmBEuDbLqN/Bja5qqwGKnefn2r8SY2Hrzt+Ita3V7OKanviWrdU6Qh7HeYGJW/SumhRafNp4jIJI6fXVUyEG5FYpxZBmDhd8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a14e8496-2fa1-42c6-c399-08de543f40ed
X-MS-Exchange-CrossTenant-AuthSource: PH0PR10MB5777.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 14:06:18.6332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NA2cQCRlVBd/aSkL+qnjVNSt0frLp2MgQWKTPu3tEfo+CE0n40H+bb5dJEQYRkg5pWFmGVeSisZFGrL/L+Px5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7201
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_04,2026-01-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 adultscore=0 suspectscore=0 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2512120000
 definitions=main-2601150104
X-Proofpoint-GUID: s8wI8iqfIigHJoUS-C8oEAUXy3MuF6Eu
X-Authority-Analysis: v=2.4 cv=X7Bf6WTe c=1 sm=1 tr=0 ts=6968f460 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=dFmrGhp3TjRllwzZRqMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDEwNSBTYWx0ZWRfX8fatSKCT5E0G
 i/GsIQpnDdNrB04Ymv9FprMXDPcNAQzTsrE50oJ8aDyz/ZvT9Na6LmpGl5owzQlLrxiGcQrRQuo
 p+t+jW3ZHvDW8Le1jzYDVXmrGybhmm3VJHLm10Ag0HUx874uNdWvKuzelExH/RIPL/DbRZ4Vf+p
 +O0mpor0nfEeMm6PcjqoeHDH/Ta91J4uhGZFWxIlwfsYhFzR7SNtzaeyGznp1/vCNCYvsFGjTsK
 YNcaZv8YxNiaAKi/OqJ1mK5MDBlOckIoluF1KCQPT01p1cZTzOFiPGhfXQtrQXtnCvzSp8DLNAJ
 lGEa8od4tPP7bC7PMOKpzgdmiLQnjxAiFxD46IU/AbdaksiH7J0GU78tW5gxdb8gYrVr7BzcVpG
 bd81OCagn3PBrHdr0hU6gE6eucozsHdz5cM8CI5LhH5QIvyASkyyTexDxYi0OU5KRsdr7qUWdCr
 ftkXXHC83P20J+cAJZQ==
X-Proofpoint-ORIG-GUID: s8wI8iqfIigHJoUS-C8oEAUXy3MuF6Eu
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

* David Hildenbrand (Red Hat) <david@kernel.org> [260115 04:21]:
> Let's centralize it, by allowing for the driver to enable this handling
> through a new flag (bool for now) in the balloon device info.
> 
> Note that we now adjust the counter when adding/removing a page into the
> balloon list: when removing a page to deflate it, it will now happen
> before the driver communicated with hypervisor, not afterwards.
> 
> This shouldn't make a difference in practice.
> 
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>

For what it's worth,

Acked-by: Liam R. Howlett <Liam.Howlett@oracle.com>

> ---
>  arch/powerpc/platforms/pseries/cmm.c | 13 +------------
>  drivers/virtio/virtio_balloon.c      | 19 ++-----------------
>  include/linux/balloon_compaction.h   |  2 ++
>  mm/balloon_compaction.c              | 17 +++++++++++++++++
>  4 files changed, 22 insertions(+), 29 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
> index 15f873f733a41..7fd8b3d7e7637 100644
> --- a/arch/powerpc/platforms/pseries/cmm.c
> +++ b/arch/powerpc/platforms/pseries/cmm.c
> @@ -165,7 +165,6 @@ static long cmm_alloc_pages(long nr)
>  
>  		balloon_page_enqueue(&b_dev_info, page);
>  		atomic_long_inc(&loaned_pages);
> -		adjust_managed_page_count(page, -1);
>  		nr--;
>  	}
>  
> @@ -190,7 +189,6 @@ static long cmm_free_pages(long nr)
>  		if (!page)
>  			break;
>  		plpar_page_set_active(page);
> -		adjust_managed_page_count(page, 1);
>  		__free_page(page);
>  		atomic_long_dec(&loaned_pages);
>  		nr--;
> @@ -515,16 +513,6 @@ static int cmm_migratepage(struct balloon_dev_info *b_dev_info,
>  		return -EBUSY;
>  	}
>  
> -	/*
> -	 * When we migrate a page to a different zone, we have to fixup the
> -	 * count of both involved zones as we adjusted the managed page count
> -	 * when inflating.
> -	 */
> -	if (page_zone(page) != page_zone(newpage)) {
> -		adjust_managed_page_count(page, 1);
> -		adjust_managed_page_count(newpage, -1);
> -	}
> -
>  	/*
>  	 * activate/"deflate" the old page. We ignore any errors just like the
>  	 * other callers.
> @@ -551,6 +539,7 @@ static int cmm_init(void)
>  		return -EOPNOTSUPP;
>  
>  	balloon_devinfo_init(&b_dev_info);
> +	b_dev_info.adjust_managed_page_count = true;
>  	if (IS_ENABLED(CONFIG_BALLOON_COMPACTION))
>  		b_dev_info.migratepage = cmm_migratepage;
>  
> diff --git a/drivers/virtio/virtio_balloon.c b/drivers/virtio/virtio_balloon.c
> index df2756c071dae..15c1cf5fd249c 100644
> --- a/drivers/virtio/virtio_balloon.c
> +++ b/drivers/virtio/virtio_balloon.c
> @@ -274,9 +274,6 @@ static unsigned int fill_balloon(struct virtio_balloon *vb, size_t num)
>  
>  		set_page_pfns(vb, vb->pfns + vb->num_pfns, page);
>  		vb->num_pages += VIRTIO_BALLOON_PAGES_PER_PAGE;
> -		if (!virtio_has_feature(vb->vdev,
> -					VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
> -			adjust_managed_page_count(page, -1);
>  		vb->num_pfns += VIRTIO_BALLOON_PAGES_PER_PAGE;
>  	}
>  
> @@ -295,9 +292,6 @@ static void release_pages_balloon(struct virtio_balloon *vb,
>  	struct page *page, *next;
>  
>  	list_for_each_entry_safe(page, next, pages, lru) {
> -		if (!virtio_has_feature(vb->vdev,
> -					VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
> -			adjust_managed_page_count(page, 1);
>  		list_del(&page->lru);
>  		put_page(page); /* balloon reference */
>  	}
> @@ -839,17 +833,6 @@ static int virtballoon_migratepage(struct balloon_dev_info *vb_dev_info,
>  	if (!mutex_trylock(&vb->balloon_lock))
>  		return -EAGAIN;
>  
> -	/*
> -	  * When we migrate a page to a different zone and adjusted the
> -	  * managed page count when inflating, we have to fixup the count of
> -	  * both involved zones.
> -	  */
> -	if (!virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM) &&
> -	    page_zone(page) != page_zone(newpage)) {
> -		adjust_managed_page_count(page, 1);
> -		adjust_managed_page_count(newpage, -1);
> -	}
> -
>  	/* balloon's page migration 1st step  -- inflate "newpage" */
>  	vb->num_pfns = VIRTIO_BALLOON_PAGES_PER_PAGE;
>  	set_page_pfns(vb, vb->pfns, newpage);
> @@ -958,6 +941,8 @@ static int virtballoon_probe(struct virtio_device *vdev)
>  	if (err)
>  		goto out_free_vb;
>  
> +	if (!virtio_has_feature(vb->vdev, VIRTIO_BALLOON_F_DEFLATE_ON_OOM))
> +		vb->vb_dev_info.adjust_managed_page_count = true;
>  #ifdef CONFIG_BALLOON_COMPACTION
>  	vb->vb_dev_info.migratepage = virtballoon_migratepage;
>  #endif
> diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
> index 7cfe48769239e..3109d3c43d306 100644
> --- a/include/linux/balloon_compaction.h
> +++ b/include/linux/balloon_compaction.h
> @@ -56,6 +56,7 @@ struct balloon_dev_info {
>  	struct list_head pages;		/* Pages enqueued & handled to Host */
>  	int (*migratepage)(struct balloon_dev_info *, struct page *newpage,
>  			struct page *page, enum migrate_mode mode);
> +	bool adjust_managed_page_count;
>  };
>  
>  extern struct page *balloon_page_alloc(void);
> @@ -73,6 +74,7 @@ static inline void balloon_devinfo_init(struct balloon_dev_info *balloon)
>  	spin_lock_init(&balloon->pages_lock);
>  	INIT_LIST_HEAD(&balloon->pages);
>  	balloon->migratepage = NULL;
> +	balloon->adjust_managed_page_count = false;
>  }
>  
>  #ifdef CONFIG_BALLOON_COMPACTION
> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
> index 5444c61bb9e76..fd9ec47cf4670 100644
> --- a/mm/balloon_compaction.c
> +++ b/mm/balloon_compaction.c
> @@ -23,6 +23,8 @@ static void balloon_page_enqueue_one(struct balloon_dev_info *b_dev_info,
>  	BUG_ON(!trylock_page(page));
>  	balloon_page_insert(b_dev_info, page);
>  	unlock_page(page);
> +	if (b_dev_info->adjust_managed_page_count)
> +		adjust_managed_page_count(page, -1);
>  	__count_vm_event(BALLOON_INFLATE);
>  	inc_node_page_state(page, NR_BALLOON_PAGES);
>  }
> @@ -95,6 +97,8 @@ size_t balloon_page_list_dequeue(struct balloon_dev_info *b_dev_info,
>  			continue;
>  
>  		list_del(&page->lru);
> +		if (b_dev_info->adjust_managed_page_count)
> +			adjust_managed_page_count(page, 1);
>  		balloon_page_finalize(page);
>  		__count_vm_event(BALLOON_DEFLATE);
>  		list_add(&page->lru, pages);
> @@ -256,12 +260,25 @@ static int balloon_page_migrate(struct page *newpage, struct page *page,
>  
>  		balloon_page_insert(b_dev_info, newpage);
>  		__count_vm_event(BALLOON_MIGRATE);
> +
> +		if (b_dev_info->adjust_managed_page_count &&
> +		    page_zone(page) != page_zone(newpage)) {
> +			/*
> +			 * When we migrate a page to a different zone we
> +			 * have to fixup the count of both involved zones.
> +			 */
> +			adjust_managed_page_count(page, 1);
> +			adjust_managed_page_count(newpage, -1);
> +		}
>  		break;
>  	case -ENOENT:
>  		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
>  
>  		/* Old page was deflated but new page not inflated. */
>  		__count_vm_event(BALLOON_DEFLATE);
> +
> +		if (b_dev_info->adjust_managed_page_count)
> +			adjust_managed_page_count(page, 1);
>  		break;
>  	default:
>  		return rc;
> -- 
> 2.52.0
> 

