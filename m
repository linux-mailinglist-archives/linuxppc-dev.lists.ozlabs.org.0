Return-Path: <linuxppc-dev+bounces-15812-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 710AFD23EB5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 11:24:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsJxH03Y8z309H;
	Thu, 15 Jan 2026 21:24:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=205.220.165.32 arc.chain=microsoft.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768472642;
	cv=pass; b=hmLvIsUTnY30f03LVF9LeP0lXEc5cbG04cn7hbP8sv8diLr95yEmvUIUemm5tXW9V1hg7neDIbmV1cttchKfWV/ExiSqQNTAxTfd20j4UF0Ts0NyeLU9QwWSmJnnjim7uuq4LRTGlAzLzHHssN9SQ6PZp42iurWG6f6XxZcqFV/93TuQBN8F3wR+7J6T+WYiRElEs5/wIdHSX7wKX7Yao4vrd6RVOQDf4HhuQxMyHl5EFceFF9y67WEMkhynJUXt2xx8bEm3mTKDUvGT1xJHgph2hDdi4vbac/aKeGrr7e/jzTy5Rw8pVKMr+0MrkHJCm9ut6mkS/ZCJL+fqertecg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768472642; c=relaxed/relaxed;
	bh=lUB1R4J8oGWwBz4a1P1g8iPS0dDYfPfJJ4sQrDBEuLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=iw9sijHSA8jZOgJveYYUExjDc0lOYnAN9DtbHX1cljYx6p8VssSqQ6lcrNURtf0qJ9ForpEtCpM/fZAXSIIjpddUg9bd756cKk6PtNBkc2+UTxY6IRm2VtGKy72hXB8KOg6c2kIkCjihjq0o/Fyh+Z0bbHMgFOAJHkYGbpCRSp/k1Mwr2rgnR9hY23CH72/VFKyITgOFvzbNq7csR0FVs5oHxtKBn/1VFadKAf4uBWjxOYz5FWuVCFK/afA5pmauUubqhSUUh6EEKggWelnyMDvOl2c6tqWCvci3GzGdN0OvMG9J0KFdBy2v2QxoRMMmhSj23GxVCfgbhR0or8YMfw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=QQVpZS7X; dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VffAw9X4; dkim-atps=neutral; spf=pass (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org) smtp.mailfrom=oracle.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=QQVpZS7X;
	dkim=pass (1024-bit key; unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=VffAw9X4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oracle.com (client-ip=205.220.165.32; helo=mx0a-00069f02.pphosted.com; envelope-from=lorenzo.stoakes@oracle.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1613 seconds by postgrey-1.37 at boromir; Thu, 15 Jan 2026 21:24:01 AEDT
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsJxF4d1Zz2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 21:24:00 +1100 (AEDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60F5mpAQ2753320;
	Thu, 15 Jan 2026 09:56:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=lUB1R4J8oGWwBz4a1P
	1g8iPS0dDYfPfJJ4sQrDBEuLg=; b=QQVpZS7XUyS3HCi5n3k5bi94TJusSxTodk
	Pa3/skuhHueknrdy4/EwTFfX2RbURRReTuIx1wtuJnHU254acM+OHHN9RVvyK6/Y
	lpo9vmos0K6sbZZew+/Gx4Al9v+dQikwqiW/DM/NQSfofT6QYeiCHpsip398T9IQ
	7z3uopo7e+ODVFGyvMZCa0qwD/ZkwW2UYH+xpTdutB/lFLXsmfYTEs15Op/Ulkr2
	voUT4xAW6F/vRjn/xunOLFcPNekhqAn4UtOP66nJoWhu3j+EpwpbJAO21+uihO0U
	DF7R2lsGIg0LxS6s8NdY+y8Pcj5/yuFaIxz55dBXyoTcq6nmcpUw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkpwgq8hn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 09:56:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 60F8jJSI005727;
	Thu, 15 Jan 2026 09:56:37 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com (mail-southcentralusazon11012046.outbound.protection.outlook.com [40.93.195.46])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4bkd7awkm6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 15 Jan 2026 09:56:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rdGHi2xbgzYrzx5+NOkV/KUOWONFqOTrjhTss9bdv0AIpSS9yAzrbPqeWC9Hg24eZ6gp919VfRNkEkPWSeZEwuJfA7Munbma49R5NAufEPPFQ8XaU8h+96Gff5kd4k+sHiItukeafFyLcN8157KpUYTgW7Or5zK6VStGNpEkrEr/ifr0c4oVIdme1Rqx1LM7TcEjR9nJZcoWKpW0ETQweKqPP2rlwoDafydmpT9Uu2wplQgSZu6OI2IOkwxdfRp1dE8yjVICUQiWoZBHjNUnf96ArsF9GhVV30Rdm3AUX3R+IFjfdbhvsnoB6kAQUiJ5ZgMLCk55EDG9KXL4pC+0fA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lUB1R4J8oGWwBz4a1P1g8iPS0dDYfPfJJ4sQrDBEuLg=;
 b=WvaMxJJSRXMP6yn9gIwgUeH6elCn6XUb41rgFpkjPnv44ZohNWM5LHafhOlg4qdMwUxOoY4Ilbj2UTgPVQhvr7HkPIi4TyF88pVH/bAJVMOsk2Pw1Y5lB8GxMbfs03+FqBg/YK5c3PrDu+M1ksLbEP0cpFbmHHpnsxYrwjq4Nc3E2JMAkEcX2Di+H3tQ9uo9Nt3NwYhaUUGiHbpKFwbOKW5XNyZ2uPd46c1Gp5TI5/tZzPSVqS6rRdfUTzdrh7wMiSQGTIa9m3SU+WvNHxnSM/FKLthTS5bf0zDHrVjazwayWkuV7PzwhbcBu11XFAFyurWxCbp1Hxaiy3zjHFJ72Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lUB1R4J8oGWwBz4a1P1g8iPS0dDYfPfJJ4sQrDBEuLg=;
 b=VffAw9X4TA31IHXiNy/G74sG2bd1KYDq6te5xFMNTrJ8GSY0OhWnA5zI9xHDcogPeM9rBAeN6zPuirRNZszYn9T0M7CDUnFRcsKHkPfK4eohLf8GZKB3SDxNdwTZ10tDzBBgWN6u3XsExzC/q2t/XzYYxUR1xDxFxSWtMde5RG0=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by CY8PR10MB6633.namprd10.prod.outlook.com (2603:10b6:930:57::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Thu, 15 Jan
 2026 09:56:35 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::f3ea:674e:7f2e:b711%6]) with mapi id 15.20.9499.005; Thu, 15 Jan 2026
 09:56:35 +0000
Date: Thu, 15 Jan 2026 09:56:35 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        linux-doc@vger.kernel.org, virtualization@lists.linux.dev,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        "Liam R. Howlett" <Liam.Howlett@oracle.com>,
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
        Zi Yan <ziy@nvidia.com>, SeongJae Park <sj@kernel.org>
Subject: Re: [PATCH v2 01/23] vmw_balloon: adjust BALLOON_DEFLATE when
 deflating while migrating
Message-ID: <0b57537d-1720-40ef-90da-b981ac4cbb38@lucifer.local>
References: <20260115092015.3928975-1-david@kernel.org>
 <20260115092015.3928975-2-david@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115092015.3928975-2-david@kernel.org>
X-ClientProxiedBy: LO4P123CA0175.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::18) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
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
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|CY8PR10MB6633:EE_
X-MS-Office365-Filtering-Correlation-Id: a379764d-45ac-4844-79f2-08de541c5e15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?yXFvY90CYsJxu3Jz68TR8yjYqgRKqGBh8X8NqIMXeElSmDKl9U+qd1hOMhHE?=
 =?us-ascii?Q?eIJPEQs8D0wxLFb1fXbTXEIrG9vtB5fUuEV2CIdx5w+cGVf1d/Xw9P74aX2N?=
 =?us-ascii?Q?xFFEsmoKypCRKt7E1aekhXupj4Wi7O/2/O0wUJbl1KJsuvt2axmT4mLcYl2R?=
 =?us-ascii?Q?6batiZP5/PR1w7en5RTmWcJgttQ1giBu0KbxLMlw76uQbM9ozy6KkLpHoIp+?=
 =?us-ascii?Q?qXLODPuaKSUSjVtX/yjURCJdBlurYPw4uSxC72hmECU+znirZT8inRgKzwWA?=
 =?us-ascii?Q?zy1oD+VguDC3N+ptZe8iYHO64jEn5R2uyCI2MIGcLuA7visxc4YTaSWbyrWv?=
 =?us-ascii?Q?X2Tcu2EKL30IN0TPrVhTESOcFjFc977zJ3dtOaWDJKtwggtEHLVQos1H8ciu?=
 =?us-ascii?Q?HXDYysciZvgn1QhHIkLsZjsFhaFXfv0CQEDmaY6TaN88HLnK+mXmRuOT2FM3?=
 =?us-ascii?Q?c22TEscijYOKAq9uRK3vzFbo5bnm6waCKbj3ocUd59qtNFLA+UVbXEmJL6ZZ?=
 =?us-ascii?Q?6OSz1nHHrQ9qJdnKeY+QVz2mpwboiKuVEpKqCTJe1eGQ2UngVfwTTSQkKI9M?=
 =?us-ascii?Q?aQHKzunfMY3RZXXWnUb/eqtpY2zvrhlpRPb3HWIHOjlKu7n1QFVolV1Bou4F?=
 =?us-ascii?Q?W+2RsFCV+B82R5XDIiec3MCLlkfoT4oYoPfn+gFdYqMhqcOPWMgpwEbB6lyS?=
 =?us-ascii?Q?roSRHYXK86qwaaWojJWBl9i9yh6EuNu6PUSxhhE/ZF9w6keINBoluuP+++PF?=
 =?us-ascii?Q?/WX8dbZrfhWLki2noFzgU1HnHlXAUX49OGq9BF/g+AsBLU/n5sRAhMkrAWBd?=
 =?us-ascii?Q?eeMx6zgTDvgmtizLABGh6Ip909sRDaecCWQkZ1E4FkEpbyUiMlxp/VIWk5yt?=
 =?us-ascii?Q?qPf0TQYmxeDOXNq0IsUFmmUFkTzUKB3MySpuoGfheqqoYvTgLCUOx+VbgWa1?=
 =?us-ascii?Q?8bvtbc7VnQXguZvNdjD/wZj06aVKDAu8l8W3KDfA9gzrvP1w0s33c3g7Vdcl?=
 =?us-ascii?Q?5ft9dDOHfNQXgTOFQiaA+QWehA+tR7VCNblfMM5HHi2ubKXLinmtvS2xxJL2?=
 =?us-ascii?Q?W5e8roPK5rR64b6dXJktdGqs2oF/6ECzMDArPctEpuhspC9xJgkzzv/y2Xac?=
 =?us-ascii?Q?yM2dqkhQGnzGJqw67gVZTmBHjwLFBaJ/YopmnvTeDshK/3idJGbTgoRj+r1P?=
 =?us-ascii?Q?wMpebqpOUEGcEB4D7MbDCqqljQiN0uXaddSUgzAst8eZAGjZ0AMvPTTsgWBz?=
 =?us-ascii?Q?1ObtNyQSiUURoyeImv6/BmLz+2jMgqDj7W+JQDLqzvAb9xLbaQnkGAvoZkCK?=
 =?us-ascii?Q?foxteg2wqPlWYeG9KLOXIcn2/xZsfaYOnHil+smiLipdMkJyk/Ej2Pm4JVq1?=
 =?us-ascii?Q?36hdQABNLsacQjQTeVjmv9/qVRpUHlJWKMobb6U88AqDYD+9rEcAHnd62t+x?=
 =?us-ascii?Q?QwlB6p3awRn4yrhA5V+RUWZNEhjZpxbbuP6NdFcwH4BeDt2G+GmTpgX+/rGw?=
 =?us-ascii?Q?TRnS5oEn/lOJeoG7dbFD5UoaLaOGidCZp7cr8ZAkFzX+gZaScckL6PNEqvBZ?=
 =?us-ascii?Q?KlyWi0ghQR8vU5q6kWA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L8IdMevnXpFSy6cL6QDEIhxT+BreoOovsJ0EdnWJliD5Uj+LrPLg3138E1a3?=
 =?us-ascii?Q?7WfdVDSfdWmIxS50rHI9NHLjF9YqQuBsrGf+SfMGir8Glm2aQSrpLW+ZCZ0g?=
 =?us-ascii?Q?H1B9mU83bcTJZC1uJYhA4W4Kq8NcELLePGtUhIH0jqi34Wr3GuYTqcihAD9E?=
 =?us-ascii?Q?LyuYS27rzPvfyOV4l7g7MDs/IN1z+MtyP0RDsbu3VTxKIOx+kYUtFQYgDZxj?=
 =?us-ascii?Q?2K0Z7zuXNpVVKn3I0WxI5dlxPEFljoirN37aYAE3oj0h5M+Q7z116/G4we8I?=
 =?us-ascii?Q?F8A/arMviMdIJwdz+QjcvNThl9kFi6a1rWVnwj1ILv4uM65Ffe+Wke9QI7UW?=
 =?us-ascii?Q?hJkyvPRRXQdEB3SGPSaKOhuDlZCKNymNQL8G8DHpTFU5BfDFSpDCXzfSJhOz?=
 =?us-ascii?Q?4Oe7YJrpem9TLRMbzNzSinz3jPsnX3JLhUVjbGe9MpUReUio3ZDnJBsCvyvc?=
 =?us-ascii?Q?yfW7A38uIkyePTqCX9+VY03JqQ9YODxM9HMOFK3i/wQC5HjSi+C2B0lou8hH?=
 =?us-ascii?Q?aHFrVM96W4eO1z4hUg6CV8eaz5WDQdEFJkA95cxEkbfa1BguaUDrRd8PYZzE?=
 =?us-ascii?Q?D+tTPTmhYlE83FZ37HMd1XhvfzOLl4gwAfXYOlcRbT4iBof86fmj1/Ru3TaZ?=
 =?us-ascii?Q?32e3QOcRNmC2RzxXF8eKyiXa8WjMPD1b0Wa2siv04ooxy+8Pzb9AlaR1y1VH?=
 =?us-ascii?Q?p5+njR+lnPwa3CWLtkdaW7HevL/cZqkbc/ZlWPbErmEvrBR/9ykQhO/nX1f5?=
 =?us-ascii?Q?aBmf3wCFMguwvjQe/W4BAVycpitvpSsOZLQz141/ruMmpP4uFjOyNPGdsn10?=
 =?us-ascii?Q?tlv5RKOtBFmAVdP22dTeyfoDMnSGZK1KhTJf3lWNTwPPhqqLgNBmfw6UVp8U?=
 =?us-ascii?Q?p+G8Sfok+qRFjOpbssS2cIq3vPN3BPv0yrMMJADRocT6R+ib+wpdOwd/hmc+?=
 =?us-ascii?Q?fA0BrruJyNKWOCY8l5yVM0o2U6cYNs4qAbfWSqwLcuexNzTWtHX7qHF1uxmo?=
 =?us-ascii?Q?YlmtTz2lDZ6Yy1jmCgAd91alVL6jyGDpQgZKwFISMlca+BAT/HHI4JopQNk+?=
 =?us-ascii?Q?WEpC5fePU90X0pXGpfbLHpNSslNy2ypAfWjHbruvBpDmAz2pbmPFxldY62BI?=
 =?us-ascii?Q?Of0YxL/lBlcT2Cu5R/SCkGPMQtMHFwXMTPnP0TmAxW/R0/ohU8VbfkhKMukp?=
 =?us-ascii?Q?N/Y6RJCd06mpLrBF8t2WRgn5FKTRb1s+q000JHEqKL2x0qz711aKtteYaU7m?=
 =?us-ascii?Q?IY4TABLAYwcrzqn+3CDcDIBzUA0eZ+a9njdkz1ZNMNbipycKFbbgLWrfMIei?=
 =?us-ascii?Q?6OqxAdEcuIA3foRSib53ZwZLk0alnC6/Rg/ND8eZE06ZuCx3q5lulJRRTO0k?=
 =?us-ascii?Q?8cP7UneA4UJn4CdZf4bbNMEomUJuxkWaWLa9iOwGs/9i+N4stw+3nUqxyCrd?=
 =?us-ascii?Q?ngAzG7kitHHgCojznlgueOWkTumkjl6Vzao691Uq/KiXgXk5j/o0eY1649Cc?=
 =?us-ascii?Q?mp811MsVFVsThKQMkBWP0oMyyganzlL/9tSxzNfk8MPn4rUJUNSieYFmlC2A?=
 =?us-ascii?Q?T8JZkEJnsRiCphSvojtXzLH0oII34dLla6wchjxQKX2xqXqnDIBCP510H/bm?=
 =?us-ascii?Q?aKp7x5ZWzMNaGBQw7P3rweNJBeEuZjcv0dbQrBuk0fnMLSNd2zl46mkX+WZr?=
 =?us-ascii?Q?MkTtd/ysIgKmNHKDHOfjo7AVNv4meF8BBTZt6EEKWzqTNguh9he/ZpoTAQBU?=
 =?us-ascii?Q?j2jwcwlMYVi2bGN5vDo7gSStYOPgnj4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	nCsSfw2jGRY5Fm/5hwYFXzHjFLS2WKJsBcs3SQ1kZ9tsNLHfhsfelAcPOgpOf3czLP3fel3WLRddaN5f6gkyTxe4fC/AeIBc2ZrEyb6ZCabvkhmD+NPcYbvZ1aMuG/NAP/+eKpLBpsxKSdoqum/mE0yT+67/6Wk9/vmdbu4kEUy7LBpn2BqMPlwhZvh2tr7j40ypq2ZCS1JqIzf21lagjSGc1LOHwJbt+Gci1CSPGwqIXFNJrFc652tHCNuK3vv1l9cxo+UkAALDwhBs/HFZ/gqqIqjS/qolwAx2TRNHBHbv03A6/1BZ+92VoT/l9NGiIxyaTcFVBWM//XDCUX4RSCpqHwcSLuZw8rm2VJAt+l9v3JsAxyunY7wREAcEDwSMIoAMYRFQGiJApURn+/SR1gEBhrJt1A20CPVO9MSBoZVCUmPc0xHuiAa4PwKAZUJrltBHono8L4y4knt/nWY/T42jswfEr2snep4hD391tpcKqpwslvxSzQVVZ+B0J7aGBEvG7nYWeN3N5cPYKepja3huZezLnPjoEAeiYVnd4y+Xpng9Fdx/4J9Hp7+RKWoX6b/VKr81QBTqJauxKrSrIMT1hUI8QaBviMRlZRp0vp4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a379764d-45ac-4844-79f2-08de541c5e15
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 09:56:34.9414
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T+eAQz+oQcY2PQ7fOJaIY9V0h2vSR8pntiLmOb3D7LzmZSq0aKBvoL/Z1cW8cWFtYXYvIF0llAYSb36vydypfbW1w8b9Z/Bu4otiLfK/sNI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB6633
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_03,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 adultscore=0 phishscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601150070
X-Proofpoint-GUID: tvF-ZkvMTOLC0qhc8Hb4vpxzUYH-Dn48
X-Proofpoint-ORIG-GUID: tvF-ZkvMTOLC0qhc8Hb4vpxzUYH-Dn48
X-Authority-Analysis: v=2.4 cv=ZtLg6t7G c=1 sm=1 tr=0 ts=6968b9d6 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=Bfv0NvBistDCrrCQ8UgA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA3MSBTYWx0ZWRfX1ZaWNiyTocqg
 WN92RU0F0fWLppt+s4Mfsv3tLKgdZjYS50Rg+b0ZDbBGPAcgKfgPHa3AYEnRPwnpUf+RW4+YudE
 mIEovmLTrLwHiUqE66k3edY8b6WIMuhBeBAwylBTVMDmFR5kHkMjiFyWR03PZBqFEv4KcDKWVSr
 RWfrEH19z13lPmkK5DyI3mtGDuRvZLEoA8gYO1Ssvtsdc72B0g+yZozEKMoPe/aNwV7QNIjB3oA
 9Z8yNUuz/XTzPrkb3x/I1IYzE0JwF/mInmoGMFW75OTiIXZTV7pvaT0w1oTorV12m/tPEz/BEKj
 YPeXEJsxFuISz4wjj+4xCs9LwrBWrONkl5AEdL1YECrH12p6rHiq/+7XWBSwVnjpsz/vx4YzIw+
 Vrkyb0SLTCkKKACNfRNCG1yNZQZfMeJldlaXwXMaGyGx+rYi2wmEaqc35WgCh9w3GgMcGMfDoEg
 JirnT153LlqLqWQp+Cw==
X-Spam-Status: No, score=-0.9 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
	RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Jan 15, 2026 at 10:19:51AM +0100, David Hildenbrand (Red Hat) wrote:
> When we're effectively deflating the balloon while migrating a page
> because inflating the new page failed, we're not adjusting
> BALLOON_DEFLATE.
>
> Let's do that. This is a preparation for factoring out this handling to
> the core code, making it work in a similar way first.
>
> As this (deflating while migrating because of inflation error) is a
> corner case that I don't really expect to happen in practice
> and the stats are not that crucial, this likely doesn't classify as a fix.
>
> Reviewed-by: SeongJae Park <sj@kernel.org>
> Signed-off-by: David Hildenbrand (Red Hat) <david@kernel.org>

Seems reasonable to me, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  drivers/misc/vmw_balloon.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/misc/vmw_balloon.c b/drivers/misc/vmw_balloon.c
> index cc1d18b3df5ca..2cc34c4968fac 100644
> --- a/drivers/misc/vmw_balloon.c
> +++ b/drivers/misc/vmw_balloon.c
> @@ -1818,6 +1818,8 @@ static int vmballoon_migratepage(struct balloon_dev_info *b_dev_info,
>  	if (status == VMW_BALLOON_SUCCESS) {
>  		balloon_page_insert(&b->b_dev_info, newpage);
>  		__count_vm_event(BALLOON_MIGRATE);
> +	} else {
> +		__count_vm_event(BALLOON_DEFLATE);
>  	}
>
>  	/*
> --
> 2.52.0
>

