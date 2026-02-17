Return-Path: <linuxppc-dev+bounces-16912-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uFOGO4W+lGnHHQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16912-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 20:16:22 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA9714F90F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 20:16:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFqB44cBgz2xnj;
	Wed, 18 Feb 2026 06:16:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771355772;
	cv=none; b=gQPvV8b6t7+TEh+D++V4So0IhavUGr/qWX5Yn+2NHjF4/u4aBTkLDSyDKmvmDGtddOOx+XAGXt6G3vA9DmRI47WPQrYFBIhBqDFZacafUd235Fv/tPKOejqU9x7JWml6IL845cuxENweyZjMBu5yimwIK016RsjH89qkGd1+sgNp34s6WXH5DorvK2J3OUowxqxiMiCYaBn7ZYcv5PDpTbJQwSq4hQSchOLiKR/HuynZ67375GMdscjrdSP71wLW6gqEhhVF0wpHrgzmlmNZRZtl/rYv/61/C15Gu4df8Zo1dn+RJImdDdaUldiLFQABC2RWW2PpVIEOCuN+yi7MSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771355772; c=relaxed/relaxed;
	bh=VNMpq4qyh3WYGxKXlPxpMOOQOK3XVP3jl0fTJEZhqqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PiVgrNdx18EfAswKG9WRTxce1WOIK0kZfdHV01Igt/grllZRBRYSSJUydBmadkDpvfqBusJOGNAUUABWc3JbPXWoIcy4AbFq/YdG9dwk6azk4iMh6SloZ7HQnTzKhCiifiAGcLej/X62j/ZRpRSJDZAVxofLU8i9OIunnYDBjhvr6VUgb638ZwmFqhp67/TXtvu4qyi28eV/uJdKD5bhTIZI4fBRmRzTuHpJY53EAKBJbv38vRp84TwV0A9wFHZGAsBs3NsnKDOjhRdTncvk0ggWEui3Itw+bS0I9kDWK1oGaga4FOoAwsa3oY8+jLgH2hKkEHc2g2w3A6W1sfqtwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o/v2cGmD; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=o/v2cGmD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=hca@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFqB34z6xz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 06:16:10 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HFF78t3013565;
	Tue, 17 Feb 2026 19:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=VNMpq4qyh3WYGxKXlPxpMOOQOK3XVP
	3jl0fTJEZhqqQ=; b=o/v2cGmDJBZclaH3Apz9H2Lc0UbZc9P/Nh3skMRUCeKyMA
	BOUm60hRT4KlqWFKAcCtme6tHHCy5GbTN3WIhfteH4xhMleebCTcvHwlWNfL7ot7
	815XqgrtpFscGVM+YpJR2984AxAF/7eWHJzMOvLmNoG0oKDr4/QszrE8VummC2VV
	Ag9DWnF7rEQRVSK5TbdVWXCxPmIY3nKLpFwC56+lGkMjZOEezyJbecxbh28WjQJr
	cMiaTXtSTxzyH4EKCqR0IxaDucrWebONz/4gSybT2a/s3Jq1Q/4PeKdB5BKv0Kjw
	8MIriOmt9N6Jo9Nc7oOIJ347c9p12d7hvBFlkxcQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cajcqx0b1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 19:15:39 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61HJ3ll3030213;
	Tue, 17 Feb 2026 19:15:38 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4ccb454hpm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 19:15:37 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61HJFYib50921818
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Feb 2026 19:15:34 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2514B2004B;
	Tue, 17 Feb 2026 19:15:34 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 61F6B20043;
	Tue, 17 Feb 2026 19:15:32 +0000 (GMT)
Received: from osiris (unknown [9.111.13.3])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 17 Feb 2026 19:15:32 +0000 (GMT)
Date: Tue, 17 Feb 2026 20:15:30 +0100
From: Heiko Carstens <hca@linux.ibm.com>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@kernel.org,
        ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com,
        rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net,
        ying.huang@linux.alibaba.com, apopple@nvidia.com,
        lorenzo.stoakes@oracle.com, baolin.wang@linux.alibaba.com,
        Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
        dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev,
        vbabka@suse.cz, jannh@google.com, rppt@kernel.org, mhocko@suse.com,
        pfalcato@suse.de, kees@kernel.org, maddy@linux.ibm.com,
        npiggin@gmail.com, mpe@ellerman.id.au, chleroy@kernel.org,
        borntraeger@linux.ibm.com, frankja@linux.ibm.com,
        imbrenda@linux.ibm.com, gor@linux.ibm.com, agordeev@linux.ibm.com,
        svens@linux.ibm.com, gerald.schaefer@linux.ibm.com, linux-mm@kvack.org,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH v2 3/3] mm: use vma_start_write_killable() in
 process_vma_walk_lock()
Message-ID: <20260217191530.13857Aae-hca@linux.ibm.com>
References: <20260217163250.2326001-1-surenb@google.com>
 <20260217163250.2326001-4-surenb@google.com>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260217163250.2326001-4-surenb@google.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-GUID: wcqAAen5QtOIh3Yd7KPIhfP50s2xWLqT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1NiBTYWx0ZWRfX7oqGr8VrV/Xk
 p0gIknVZDxQC2GBczDROOnBcM7o7b3pKMWShsmSu1vqb+BvlzcCZcclbforXI3g03Tg2w3NQXE0
 iXFAV4kar5rcK/dTEoKjXtQ1YydA7DBAYYTXJQ6GINk1YIMDoUkt+7mkJ3MI51bmInQTTszK824
 8nC+0GeJPvCKNnOgiTfjClOWWPT+8Lpcfx5vc85/5OZTHkYR01ktJG/0YRg76aGx/X0wf04+agQ
 4kI4XL8Z0IXYl+rLKXIZzDCweR6PPYquimZJ7zKZHJhugW/R0Zxnub8iJh9jLTWzQmDmDx2stnO
 COtshVSmyDhLJ6fSxUHaIBEZ1BEuSi+RgRGyBNoRxTvLU6HRcpoi/biPBkmqE8MvUghRu4fJIvr
 xZJMzLYZujcCXK+JpPkNmjgX9+7+EQ1UvF4aYXnwqc/76xKkXQpx4u4s86e/o2ezBaAxgc9G67x
 t92lhnQ8I8WJpFBDkPA==
X-Authority-Analysis: v=2.4 cv=UPXQ3Sfy c=1 sm=1 tr=0 ts=6994be5b cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=1XWaLZrsAAAA:8
 a=28GIsqCL1x42zXYMcZMA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: Atfp6M6HOZik-aY60bN0PvQ41cv5zLBo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 adultscore=0
 bulkscore=0 clxscore=1011 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170156
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16912-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:joshuah
 ahnjy@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hca@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hca@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0BA9714F90F
X-Rspamd-Action: no action

On Tue, Feb 17, 2026 at 08:32:50AM -0800, Suren Baghdasaryan wrote:
> Replace vma_start_write() with vma_start_write_killable() when
> process_vma_walk_lock() is used with PGWALK_WRLOCK option.
> Adjust its direct and indirect users to check for a possible error
> and handle it.
> 
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> ---
>  arch/s390/kvm/kvm-s390.c |  5 +++--
>  arch/s390/mm/gmap.c      | 13 ++++++++++---
>  fs/proc/task_mmu.c       |  7 ++++++-
>  mm/pagewalk.c            | 20 ++++++++++++++------
>  4 files changed, 33 insertions(+), 12 deletions(-)

The s390 code modified with this patch does not exist upstream
anymore. It has been replaced with Claudio's huge gmap rewrite.

