Return-Path: <linuxppc-dev+bounces-16419-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yFSVAqxFfGnfLgIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16419-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 06:46:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 207A4B76A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 06:46:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Q3r5scxz2xpg;
	Fri, 30 Jan 2026 16:46:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769751976;
	cv=none; b=Tk7F7QBQtZFPHko+qZO0MiUeXZ2vIdQImi7Lm2ajTe/4MzhlgDa4XmE+n0kr3ZZsekc27nZkRz3SjR8jhk2o1MK1L07pBnGpcCDXIROf2CV7NAojM0AjVqNh8zTGPFUlwf09aTs+q6UF6BZuUz40pl/wF3vIhxxLmVyQqD8c7bMrjxmLfmUV9tLdcHvKHeHFPnsQetoI62pVeb83kff9mPyinLljyADQmx+Ow97CFzvfhmVBWulV6ud9lJmNsW/Wznaew572wpwypo8LLapFZKKnGUXC27ZBB05ZJjkgMIVwabUru5z5bKWdW1cOc1zjX7POSVRFV7bpTBZhylFnWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769751976; c=relaxed/relaxed;
	bh=Ez2f5J4iIXsfO+/V2AsQEPmwIM0HXd7GRN6J7qk/9m4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oXlZbYR4Uaio2qgpEYNvnzOs9R0z4ceqgUjXTF6f5c8vr7z9N8LXVAO957YmDDbl2fuFL8IayqSvTFdTJ4w1Ou3b2NtfsaHlVDTk0ZEVdwQg/I6nAxZ1muLhi2XHtH1r6A+5sJG24xEyNjM/VUPhn4Mq6RgBXLHwoff75/FA63CqAmjx+56J5L4IoA5QFWYRsceCA1wM+rLx5JksIflnvPcWB0dL22JyWe8/+IIFAtzGZwZMcrXrYKkOiZU6nBCWrD8FZJ8+9jP2LSIijwQiQ7EEJgxdjUP4tKKeviDITuGzOeTe3L4nLpqQOZeU/b7+VUxKBeSV5U2i3bB2PvAS3g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jUvq0K2u; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jUvq0K2u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=donettom@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2Q3q35g4z2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 16:46:15 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60U5D9TA011294
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 05:46:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Ez2f5J4iIXsfO+/V2
	AsQEPmwIM0HXd7GRN6J7qk/9m4=; b=jUvq0K2uBrGneyUhwUwWF1AXA7vmfLH3q
	N6a87tTQgUWBRhjiid67feVQMu/gefNYk167TI498OA03Vae9KFFIMbndD7cW3YJ
	OxQ9cxj9LCCqBSOrOzKRapRdU1fChmOTxvbEghZCImmtXG8+9O8Y3OM5ctN9oHKW
	nrKt34iBSgpYMqgkrCIMi2th5BHZMz5AI2ehtIATgf6aMHJk3Owdc8SonUTHiNTa
	PimPCSZUbddzSs8pAWw3Xn/pge2/CVIiwOm2sQpmW0CNjrjO7yR/kw3Dt0tWVZ6Q
	U8Dy1SgHFXilGXpLn7no68JL5gSkloKOc8AFyw8xQdpbBnKI1+77w==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvmgg9j92-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 05:46:11 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60U1p6He018394
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 05:46:10 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bwb424sdk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 05:46:10 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60U5k6l036897200
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 05:46:06 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A1BA52004B;
	Fri, 30 Jan 2026 05:46:06 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9EEC42004D;
	Fri, 30 Jan 2026 05:46:05 +0000 (GMT)
Received: from li-218185cc-29b5-11b2-a85c-9a1300ae2e6e.in.ibm.com (unknown [9.109.215.162])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 30 Jan 2026 05:46:05 +0000 (GMT)
From: Donet Tom <donettom@linux.ibm.com>
To: gbatra@linux.ibm.com
Cc: linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
        Donet Tom <donettom@linux.ibm.com>
Subject: Re: [PATCH] powerpc/iommu: bypass DMA APIs for coherent allocations for pre-mapped memory
Date: Fri, 30 Jan 2026 11:16:02 +0530
Message-ID: <20260130054602.21331-1-donettom@linux.ibm.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251107161105.85999-1-gbatra@linux.ibm.com>
References: <20251107161105.85999-1-gbatra@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Z4vh3XRA c=1 sm=1 tr=0 ts=697c45a3 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8
 a=5ow3zEcTcvu9A-jyJV8A:9
X-Proofpoint-GUID: fRVW-NjcxcxTKs9xLBhWdFGgVMPwNP2d
X-Proofpoint-ORIG-GUID: fRVW-NjcxcxTKs9xLBhWdFGgVMPwNP2d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA0MCBTYWx0ZWRfX7zVsLA0pw/qu
 jco5lfwMeQ3EceWmnwZNZUyXMs/0fS2ow93RyTW9DdvgQ/rzuI6rAQNs8nbff5uuUfcYZsXbL9R
 bpqpx/D4aoI5xg5BtjTtWitNPH2A8p/p2UUiCemOujDcwnbgUh6CuktSNZtjz2LYGsptAefpxpO
 63sRFjRT5QBz8cYPJrcruX/Xf3/N2YpSDmDo3wcWnSeHrY4uE/H4D+N8XOHKlXIYylbMF3SEb67
 I5DjtmK/JJPPS8/1OfLIBbOkEO9ElWse6TXfAL5dhxfEmJEB1Mh3uO/0ZIzpUup7odnZXdpV72A
 loqPWEp/DzEBOY60scaLz1I3PKKcuhGSdAMRtjdPDY06lx6ju4sCQcvpHmT4OHrVLHMUhqLu/xm
 MagpczncpqzdlnB4axx0Ew/v5jiLvkS42QUZFtllmlb1tMOAMZudfdsFCBNQ+xV7kZCkCUt1fCA
 dhFq0cq3zo8d11u4alw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1011 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2601150000 definitions=main-2601300040
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	URIBL_MULTI_FAIL(0.00)[lists.ozlabs.org:server fail,linux.ibm.com:server fail];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16419-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:gbatra@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:maddy@linux.ibm.com,m:donettom@linux.ibm.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[donettom@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_THREE(0.00)[4];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	FROM_NEQ_ENVFROM(0.00)[donettom@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 207A4B76A7
X-Rspamd-Action: no action

On Fri, 07 Nov 2025 10:11:05 -0600, Gaurav Batra wrote:
> Leverage ARCH_HAS_DMA_MAP_DIRECT config option for coherent allocations as
> well. This will bypass DMA ops for memory allocations that have been
> pre-mapped.
> 
> Always set device bus_dma_limit when memory is pre-mapped. In some
> architectures, like PowerPC, pmemory can be converted to regular memory via
> daxctl command. This will gate the coherent allocations to pre-mapped RAM
> only, by dma_coherent_ok().
> 
> [...]

Even though this patch is now merged. But FWIW, I had verified this on my
system and it fixed the iommu_alloc failure problem for me. So

Tested-by: Donet Tom <donettom@linux.ibm.com>

-- 
2.52.0


