Return-Path: <linuxppc-dev+bounces-16426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FXoESBhfGl0MAIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16426-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 08:43:28 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B79CB7FF5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Jan 2026 08:43:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f2Sg04r2Fz2ydq;
	Fri, 30 Jan 2026 18:43:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769759004;
	cv=none; b=MkB6CTmJ9vltSAcF59p1I/U6PMe6Ii7Iih836JsfcmzNFAg2Kngq95v+zyYaSBTOiogsWsQQqlWbXhpDrOAPdgyl3o4+yaNI2lQ1y21bEnvOPzBFRrHGUcheG6PbmAe94Z6rl3EKem9aFRh+zVfMBWHQhphGL+Ig9mlf2u2Tvp83Zu5dNx5RLDj64246CZz6f0YLNtHCqrYVgU+qMMU/o7HYoH605PYchX/LxOJyVvqg3vzIYr6ypamVgDrB1PjrgtsyZTfyXrhNl4KsamfajtYBiNSW3rL4kV1FW66wApu2nCh7+J0I7qJiFJLyb59ZFayuv/Op7WfZU1QVytcrXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769759004; c=relaxed/relaxed;
	bh=95K87GT0mkVJz9aYpJRbx8UZQXnKJ+WMM5rXV/1r+I8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=libMhKcUuU62uAwEWPJ+Z561TmuFpuhsiKFBUVdMQTE5ebzoOaeuk7KUnKbwv+GR9KRwMNkn4BmNST6ErQUkm8kKU0B6lb5uXfDOQJ1Rqc2mssKZdWv76Uh7xUAN3cDFXC11dndZA4YzV9cu/XocT9LH4pd8XXRMRnA++1GvvKupgZJWqRRKRLkDKIB9HtxOs+KrDvF/Y/Tt3Yv8N3J1sT2IUegRMQZcHBWgFjodYVW+SGi2Rsf0qbTKnzz+6P3l0AKTaIqsx3/c0v6ONYQekY5sIhIO+jsXaLbmlcmoAxqj6rH22sa/DnLbzfdTJQJYAEU3l2b7aM2IJgokvWFh8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pan6u5Pr; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pan6u5Pr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f2Sfz3ynjz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Jan 2026 18:43:22 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60U2qKfA012067;
	Fri, 30 Jan 2026 07:41:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=95K87G
	T0mkVJz9aYpJRbx8UZQXnKJ+WMM5rXV/1r+I8=; b=Pan6u5Prc3pgc5LX9U5WRP
	svhugs17kFpsgGwcQ2yBwaWpEMCIE6fZ06pvKpvzyqiX1aHp7H8RHTeKjh+jbezd
	JRGF+bexsNzPuPvNfs9C4yDnb0fCs6FKxONHMNZbrTQzp8nZijWBDHqp4cvBxW/w
	6w9pdknNIIZ1vtg7/UCNPQNI2ywsNMog+cLKm01dyy8pboBOft11lpVM29E0dnaF
	pVUmq/a5XYNw8wrtBJcgD7lvSdKkgFQ6+pWRTb8lviwJ9Pq0JYLGB9HuoFqOUVse
	bwKv3qk4lnJY0vHctphmMpWXpyRfkKbmdqtC/aBe0TCQ71+8ZQ/u10HiRodzXKIA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnr6hmsv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 07:41:44 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60U7fhde011928;
	Fri, 30 Jan 2026 07:41:43 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bvnr6hmst-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 07:41:43 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60U60LTk031037;
	Fri, 30 Jan 2026 07:41:42 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4bw8dswdk0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 30 Jan 2026 07:41:42 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60U7ffsT19726970
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 30 Jan 2026 07:41:41 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A62858056;
	Fri, 30 Jan 2026 07:41:41 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5814258052;
	Fri, 30 Jan 2026 07:41:35 +0000 (GMT)
Received: from [9.61.240.86] (unknown [9.61.240.86])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 30 Jan 2026 07:41:35 +0000 (GMT)
Message-ID: <94b9f14a-93f7-4d30-b22e-8a8aab8adb17@linux.ibm.com>
Date: Fri, 30 Jan 2026 13:11:33 +0530
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/bpf: Add powerpc support for
 get_preempt_count() in selftest
Content-Language: en-GB
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net,
        martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
        john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
        haoluo@google.com, jolsa@kernel.org, christophe.leroy@csgroup.eu,
        maddy@linux.ibm.com, mpe@ellerman.id.au
References: <20260129054035.168078-1-skb99@linux.ibm.com>
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20260129054035.168078-1-skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDA1NSBTYWx0ZWRfX4aRoRM6ToB9Z
 asD81+NT3htGMJSSIgQ+KNeeo4gCw8WSWe5cSGZM7f779f5XyxcgVOo1WX1+SB/L9Ptybjlzpkq
 CYktvsgvmFhQXsvgousEDtsnj3Um6NuE1PSVZTg/Joyic6xGhP9nPVF51TD9nxw1p/vXqfv0nMY
 gCpGQHjpG+MBinTMPxZs8YkDjg8PE7izLVTEwRcU+hB2RB6edI6icLY9qeuqhTqnYwSKm4TKoaf
 pXc8GOhJ7sQVO8Ud26JIaG5yLv+/XX7g3gSHEes/0Y95BxjYt6YRgzY5OLMmKyg4YnueT3CbTHb
 Ao8IMyqzOSttTf1VYKqbLjE/tZEwHJwUj5lI2AOtO0RXw6yjaxBE06URqEeDIojU59s6Lnzuyuw
 TYQSPxoQ9BauVwxMHYZZI8Wn3Uz18Q6IuPtwUZFzzzbP1VMavd33JpT1NBVuaUQh/0niW8J+Sme
 0bOEBUfC+c/VA+kBGXQ==
X-Proofpoint-GUID: cMUV8EMaqqGJO38IwVf2dzdE0AEwLKe3
X-Proofpoint-ORIG-GUID: 6TOvakzLfJS-x4Arnkt0u2kukkw6CH4y
X-Authority-Analysis: v=2.4 cv=X+Vf6WTe c=1 sm=1 tr=0 ts=697c60b8 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=Adbp-aZMoRQ6sjKNSjAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-29_03,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1011 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2601150000
 definitions=main-2601300055
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16426-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:skb99@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWELVE(0.00)[12];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[ibm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 2B79CB7FF5
X-Rspamd-Action: no action


On 29/01/26 11:10 am, Saket Kumar Bhaskar wrote:
> get_preempt_count() is enabled to return preempt_count for powerpc,
> so that bpf_in_interrupt()/get_preempt_count() works for powerpc as
> well.
>
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>
> ---
>   tools/testing/selftests/bpf/bpf_experimental.h | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
> index 2cd9165c7348..c3f039a878f3 100644
> --- a/tools/testing/selftests/bpf/bpf_experimental.h
> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> @@ -630,6 +630,8 @@ static inline int get_preempt_count(void)
>   	return *(int *) bpf_this_cpu_ptr(&__preempt_count);
>   #elif defined(bpf_target_arm64)
>   	return bpf_get_current_task_btf()->thread_info.preempt.count;
> +#elif defined(bpf_target_powerpc)
> +	return bpf_get_current_task_btf()->thread_info.preempt_count;
>   #endif
>   	return 0;
>   }

Tested this patch by applying on mainline kernel and it passes the below 
selftest.


./test_progs -t timer_interrupt
#481     timer_interrupt:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED


Please add below tag.


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>



Regards,

Venkat.



