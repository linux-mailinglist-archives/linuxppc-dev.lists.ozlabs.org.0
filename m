Return-Path: <linuxppc-dev+bounces-16841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KHNFFSCzjWlz6AAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16841-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 12:01:52 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9D4812CCC1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 12:01:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBXRp2l7xz2yLH;
	Thu, 12 Feb 2026 22:01:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770894102;
	cv=none; b=lldqeZDtUT3PtBy3G24uxGe1wV+10OVDHWs2ZSunh/OFhtQZ+1tF2unGUbJvHVzxhgUUBSF81kcINECwQT3vdTNUjbcxJYz2chi+nDd2fCsi7BdPEBAY+qcu7UB5fMDYKH+W8NEf/Jsl2TPFACQCfsYA05/D0VgdJe3OO6hlXjMHPBgPWsT7mY6vjORGQNy7jIM7bZ6Cd/IXKtNu7I0fDuZL4/dAeyMXEsXE7EBlQMV0bqNO0P8pvQ+wzX1ntqzNv07qrKCf3BRkG6pSVJ8iVI4tTgRMARPIfHZJH1AJXX/AbdixQ0Bn2t7QxMKYHWKIc803hpJ/esuZ6BaZ3+5XNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770894102; c=relaxed/relaxed;
	bh=kC5PBCrX/sgH2Fq02LEGV9wm5gA5lKwK+RKOC9phkJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wl/rTiJZMhSy+wfxZizejuOCqG5g5po/OQtldl/rSE0XnRa+/1/B4ihA8mwQ/Kiu5LQSGDCyg9Fwypafbhifp3+mdv05IJ1OgLyIypyqxQj3gLNoH1eiraA1O9EncYN/RwS38F7TuacilsWDiJ5HoUnmgIHqKMQLP3wDDdPDx6e960fGViYm55BVcb+PSftHewsuWVNj0vH4PA3eyHdadr3vFCUZ08Bn+nZnMZrJ2qQFlJZibNr08CUCTwZe7wKqN3wzbz0iYVpBHp92MnGjrEHuDyBLNKl/sTGgFY0bhQVFd8uFIukHJ0Mt7nT+Cmc0HpMBzveG6nWChNDcBDTsSw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W6deOLrS; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=W6deOLrS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=venkat88@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBXRn3W7Rz2xlh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 22:01:41 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61C6UE1H394028;
	Thu, 12 Feb 2026 10:54:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=kC5PBC
	rX/sgH2Fq02LEGV9wm5gA5lKwK+RKOC9phkJk=; b=W6deOLrSmmtVXSPitFAh/t
	/yBHKrAlcNTtI9G2w3XSfMQ6B1/zODmHq06iD+ZfKumubAs6nV6iTliB+UEp0Ntl
	8Cs7U338COVX2cWNF+AIo6nyGVtLY0smGBojDsAH/hRyXDcp6lL7X7O8vpRrnt9a
	oYu8b7RW2DFx0998nUBXhu0s7m3sl2kWFiPw/K9pi6jJA0Pfh/pjKvUINHi26nim
	l/j+HsqLiL385OXH5hHyXP4/xh8COWTuL7cY6ke5qKFjUYhpvo81VJ6KQbTb+Ctg
	/mFfB/IqEHmolK7w6f/4lowqdRGlStPCg3TQngK9BSyhKJkWqD1R7SDBthKZX5xg
	==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696wdq7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 10:54:48 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61C7nV98002631;
	Thu, 12 Feb 2026 10:54:47 GMT
Received: from smtprelay05.wdc07v.mail.ibm.com ([172.16.1.72])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c6fqst8v0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 10:54:47 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay05.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61CAsjQH34538186
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Feb 2026 10:54:45 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 86C0C5803F;
	Thu, 12 Feb 2026 10:54:45 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1985158054;
	Thu, 12 Feb 2026 10:54:37 +0000 (GMT)
Received: from [9.61.249.62] (unknown [9.61.249.62])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Feb 2026 10:54:36 +0000 (GMT)
Message-ID: <ab6ee329-ca59-4765-b309-22e64dfca861@linux.ibm.com>
Date: Thu, 12 Feb 2026 16:24:32 +0530
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
Subject: Re: [PATCH v2] selftests/bpf: Add powerpc support for
 get_preempt_count() in selftest
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, bpf@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, andrii@kernel.org,
        eddyz87@gmail.com, ast@kernel.org, daniel@iogearbox.net,
        martin.lau@linux.dev, song@kernel.org, yonghong.song@linux.dev,
        john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me,
        haoluo@google.com, jolsa@kernel.org, christophe.leroy@csgroup.eu,
        maddy@linux.ibm.com, mpe@ellerman.id.au
References: <20260212092558.370623-1-skb99@linux.ibm.com>
Content-Language: en-GB
From: Venkat Rao Bagalkote <venkat88@linux.ibm.com>
In-Reply-To: <20260212092558.370623-1-skb99@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=YeCwJgRf c=1 sm=1 tr=0 ts=698db178 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=dEnyWooXetdK__wXnIsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: vWFzbJ8g7-APD3QRBeCM2NAPYlHWG-t7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDA4MCBTYWx0ZWRfXwEgo77BKqPdE
 iImaK5TJ1OnJGXC4bb24zqQOdCkx9cxPxpk3CGWIxYa+4qjLLH1ncmwATrKAV6eS9TAXWQaFs72
 Hwwklk+/t/hvrJBGI+AtNCWScJrctvdEs7FCX+Zws1VMi5seAibiLj6TIL6T9YYQDzpGtn3FBHQ
 2idSMCok3s10aRKZHvAYvMvDgIsoV3QCsPZmICDbox7Vmo3qCksV2bdFhtWMd3piPReKu7dpK7i
 xOf+X0GNlfVo4jL/H0CQX4fBxq/PoI4E6r7hI9o3l/eEzZB24rRoMhplPBbjNFiKjkdIq/IMaOS
 Z6oCVzDQpFsDvhkIQ7Izb763jSfBmbrE7jpTpCrJZXij2DhsPv5sT75PkIFhdob4PMKqKSzFFh4
 4btmZDOx4kh74MxS0BQ4Z58Koc8ilQpcxRFWhwPXpY1oczIlUbcKlJz4fYLRzFCGRwkG+Jp4xTr
 fYPuyaT/ott0OGgxu9w==
X-Proofpoint-ORIG-GUID: 2WhUC-_kZ49qYXhZKIZ4D9ah3Ix5TocJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_03,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120080
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16841-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10];
	FORGED_SENDER(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_RECIPIENTS(0.00)[m:skb99@linux.ibm.com,m:linux-kernel@vger.kernel.org,m:linux-kselftest@vger.kernel.org,m:bpf@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:hbathini@linux.ibm.com,m:sachinpb@linux.ibm.com,m:andrii@kernel.org,m:eddyz87@gmail.com,m:ast@kernel.org,m:daniel@iogearbox.net,m:martin.lau@linux.dev,m:song@kernel.org,m:yonghong.song@linux.dev,m:john.fastabend@gmail.com,m:kpsingh@kernel.org,m:sdf@fomichev.me,m:haoluo@google.com,m:jolsa@kernel.org,m:christophe.leroy@csgroup.eu,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:johnfastabend@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux.ibm.com,kernel.org,gmail.com,iogearbox.net,linux.dev,fomichev.me,google.com,csgroup.eu,ellerman.id.au];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[venkat88@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: D9D4812CCC1
X-Rspamd-Action: no action


On 12/02/26 2:55 pm, Saket Kumar Bhaskar wrote:
> get_preempt_count() is enabled to return preempt_count for powerpc,
> so that bpf_in_interrupt()/bpf_in_nmi()/bpf_in_serving_softirq()/
> bpf_in_task()/bpf_in_hardirq()/get_preempt_count() works for
> powerpc as well.
>
> Signed-off-by: Saket Kumar Bhaskar <skb99@linux.ibm.com>


Tested this patch by applying on mainline kernel, and below selftests 
passes.


Please add below tag.


Tested-by: Venkat Rao Bagalkote <venkat88@linux.ibm.com>



./test_progs -t exe_ctx
[  610.897388] bpf_testmod: loading out-of-tree module taints kernel.
[  610.907373] audit: type=1334 audit(1771408772.036:229): prog-id=72 
op=LOAD
[  610.907385] audit: type=1334 audit(1771408772.036:230): prog-id=72 
op=UNLOAD
[  610.907461] audit: type=1334 audit(1771408772.036:231): prog-id=73 
op=LOAD
[  610.907467] audit: type=1334 audit(1771408772.036:232): prog-id=73 
op=UNLOAD
[  610.941282] audit: type=1334 audit(1771408772.076:233): prog-id=74 
op=LOAD
[  610.941290] audit: type=1334 audit(1771408772.076:234): prog-id=74 
op=UNLOAD
[  610.956474] audit: type=1334 audit(1771408772.086:235): prog-id=75 
op=LOAD
[  610.956481] audit: type=1334 audit(1771408772.086:236): prog-id=75 
op=UNLOAD
[  610.956964] audit: type=1334 audit(1771408772.086:237): prog-id=76 
op=LOAD
[  610.956970] audit: type=1334 audit(1771408772.086:238): prog-id=76 
op=UNLOAD
#109     exe_ctx:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED


./test_progs -t timer_interrupt
[  730.106678] kauditd_printk_skb: 6 callbacks suppressed
[  730.106685] audit: type=1334 audit(1771408891.236:245): prog-id=80 
op=LOAD
[  730.106700] audit: type=1334 audit(1771408891.236:246): prog-id=80 
op=UNLOAD
[  730.106787] audit: type=1334 audit(1771408891.236:247): prog-id=81 
op=LOAD
[  730.106794] audit: type=1334 audit(1771408891.236:248): prog-id=81 
op=UNLOAD
[  730.136150] audit: type=1334 audit(1771408891.266:249): prog-id=82 
op=LOAD
[  730.136158] audit: type=1334 audit(1771408891.266:250): prog-id=82 
op=UNLOAD
[  730.151245] audit: type=1334 audit(1771408891.286:251): prog-id=83 
op=LOAD
[  730.151252] audit: type=1334 audit(1771408891.286:252): prog-id=83 
op=UNLOAD
[  730.151572] audit: type=1334 audit(1771408891.286:253): prog-id=84 
op=LOAD
[  730.151578] audit: type=1334 audit(1771408891.286:254): prog-id=84 
op=UNLOAD
#490     timer_interrupt:OK
Summary: 1/0 PASSED, 0 SKIPPED, 0 FAILED


Regards,

Venkat.

> ---
> Changes since v1:
> * Updated the comments to include powerpc for the APIs.
>
> v1: https://lore.kernel.org/bpf/20260129054035.168078-1-skb99@linux.ibm.com/
> ---
>   tools/testing/selftests/bpf/bpf_experimental.h | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/tools/testing/selftests/bpf/bpf_experimental.h b/tools/testing/selftests/bpf/bpf_experimental.h
> index 4b7210c318dd..9df77e59d4f5 100644
> --- a/tools/testing/selftests/bpf/bpf_experimental.h
> +++ b/tools/testing/selftests/bpf/bpf_experimental.h
> @@ -645,6 +645,8 @@ static inline int get_preempt_count(void)
>   			bpf_this_cpu_ptr(&pcpu_hot))->preempt_count;
>   #elif defined(bpf_target_arm64)
>   	return bpf_get_current_task_btf()->thread_info.preempt.count;
> +#elif defined(bpf_target_powerpc)
> +	return bpf_get_current_task_btf()->thread_info.preempt_count;
>   #endif
>   	return 0;
>   }
> @@ -653,6 +655,7 @@ static inline int get_preempt_count(void)
>    *	Report whether it is in interrupt context. Only works on the following archs:
>    *	* x86
>    *	* arm64
> + *	* powerpc64
>    */
>   static inline int bpf_in_interrupt(void)
>   {
> @@ -672,6 +675,7 @@ static inline int bpf_in_interrupt(void)
>    *	Report whether it is in NMI context. Only works on the following archs:
>    *	* x86
>    *	* arm64
> + *	* powerpc64
>    */
>   static inline int bpf_in_nmi(void)
>   {
> @@ -682,6 +686,7 @@ static inline int bpf_in_nmi(void)
>    *	Report whether it is in hard IRQ context. Only works on the following archs:
>    *	* x86
>    *	* arm64
> + *	* powerpc64
>    */
>   static inline int bpf_in_hardirq(void)
>   {
> @@ -692,6 +697,7 @@ static inline int bpf_in_hardirq(void)
>    *	Report whether it is in softirq context. Only works on the following archs:
>    *	* x86
>    *	* arm64
> + *	* powerpc64
>    */
>   static inline int bpf_in_serving_softirq(void)
>   {
> @@ -710,6 +716,7 @@ static inline int bpf_in_serving_softirq(void)
>    *	Report whether it is in task context. Only works on the following archs:
>    *	* x86
>    *	* arm64
> + *	* powerpc64
>    */
>   static inline int bpf_in_task(void)
>   {

