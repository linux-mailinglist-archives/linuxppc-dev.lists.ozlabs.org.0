Return-Path: <linuxppc-dev+bounces-16925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id q/uDEEVPlWkVOQIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16925-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 06:33:57 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4613153208
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Feb 2026 06:33:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fG4tn01LPz2yrn;
	Wed, 18 Feb 2026 16:33:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771392832;
	cv=none; b=mAiwCxxOq6njiN5Qlb+UpPgX+o1XVb9ld35BNFV/7pGka7NQQHLIQZqYNnKjNCrAVZbJ4NJ7BHux3PGv9uQXfgOFht3xaqvjYNKsxdPq9jTCSDBP0zzMBHpnuRl3421cfBJ8bvUu95UvJQ3lLoKB6/Ui1LLnx11NJV53vQBMHihC0dhc9u7arV3DcAda3aD7cnMo9jXlbMkpOQH6SU+uyYMNllCE6z3fMrdN3F5uc8vtxoLFWHDgW6M7GNUHWDIYcBFx0ePI+XQdOiepUoFX4zIflDIbz72sOV+s91vQefZeEdndEuGLDHe/FJDatptx1JwZwTnzbdnCsuDPy6aAWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771392832; c=relaxed/relaxed;
	bh=4YHyxwIuOrPZTV9vrytVydrlzxZ/IPOjbmPEUciC71g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MnHx8v6RUwX8ojgAFaqBg6wwrpsp7Bb1tS8tj4D5TDvK5YpRLiULs25fBheIf2czE+mGlzeBLam86FOmES+e1DjkM1MmQwSNITp5RcbW4NT/vkcQxsrkmQQfAcfTIWZRpaGKNWgQ8KcEtmvEoHLJsgRzfHe79T/UTdDHh+fzOVif/cveD8fJ/jhYqDwHfM8DiQmk6Nh8J/h7YFhPp9QPDsYut8oKcV6iWDxTIVnMFnThYFx/YCqkBMy3xlgcZyI9uO+pm4xLWA3SqG1IQeoJ3tjScPvqtv9DC6chuARRLLz0cTQjGSzBE0dSm/ftHNIMniABoFMpf1obNcFo4xaBpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gGCPxQp3; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gGCPxQp3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fG4tl5MRrz2xSG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 16:33:51 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HJH77w3669543;
	Wed, 18 Feb 2026 05:33:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=4YHyxw
	IuOrPZTV9vrytVydrlzxZ/IPOjbmPEUciC71g=; b=gGCPxQp3hzdHz7dH0Mxv9U
	R26NkEqLh7ISzWHXKvOJA5yt1quNtY4arWHvrKdvq/X7IQmbBQyhezYTja4HKxsZ
	/MR9xzSIH13j81f0m6kHyXz7xfqSWnTrD22u+0ESySt2Ocsub2tTMjaRh/S2A3st
	8v6e+GGPhkDmDcPqUNP29gUR1LsERMvtBRYjuW3U0eNZoyy6ShNUa6191nrDdKTs
	SDipaCcHsW60kEYPXBQqsKjZnlxoJILyUlCwBWUv1K2QjZETZHjBI3L8vrYpOd+U
	wrRbwQyfY3H/idDNL7mg+BDgJj8dnwuq857VK67xzqZM4LMIYkd9tY/BXTJK4c6w
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4caj646t7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 05:33:37 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61I2MSMu017761;
	Wed, 18 Feb 2026 05:33:36 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ccb28ekju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Feb 2026 05:33:36 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61I5XYLl43713000
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Feb 2026 05:33:34 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F2FA20040;
	Wed, 18 Feb 2026 05:33:34 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD75620043;
	Wed, 18 Feb 2026 05:33:32 +0000 (GMT)
Received: from [9.43.5.239] (unknown [9.43.5.239])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Feb 2026 05:33:32 +0000 (GMT)
Message-ID: <b9ddf051-f6eb-489a-b199-6d47f5a21395@linux.ibm.com>
Date: Wed, 18 Feb 2026 11:03:31 +0530
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
Subject: Re: [PPC][Tracing] Missing syscalls:* ftrace/perf events on PowerPC
 vs x86
To: "Nassiri, Mohammad" <mnassiri@ciena.com>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Cc: "linux-trace-users@vger.kernel.org" <linux-trace-users@vger.kernel.org>,
        "michael@ellerman.id.au" <michael@ellerman.id.au>,
        "srostedt@redhat.com" <srostedt@redhat.com>,
        "masami.hiramatsu@linaro.org" <masami.hiramatsu@linaro.org>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Nicholas Piggin <npiggin@gmail.com>
References: <CH2PR04MB6821DAF7C6684BB990A0288BC56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
Content-Language: en-US
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <CH2PR04MB6821DAF7C6684BB990A0288BC56DA@CH2PR04MB6821.namprd04.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: ZcZRDNRchZ9o3YcEDqQjNzz-hhxhkouE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE4MDA0MyBTYWx0ZWRfX0O+nc+sVVCxe
 ml3mGq+pnBGxncjT8njk7nXP+aIx32hHPl75NYQbBLb9cAgO6WA5MC7IQ7acwKWGjSWK5NVlvU5
 ugvgupY3e9Rk/JLvGLNN9tD3Z+v7sTKEs1jZhm4QUn+eCdzflfs4g8VRqxQLoyQe1N6bQUIvfdW
 AWb55bqT0F2eB0JnAm+efmXGVGWeT0q5xd1S2OcO6txLw/Otkm4vqLrpQDzmwCBeq+AIA8gh/UY
 FUy8elwKr9XLGXcofX0hVF/OuS/QidSk2+R8Ifnm6jOIb9kwtJmXMoigYL5fzhlbHumvABBxYIP
 tHn0uc/JM7+fMlP70i4Z/gRF+elGMMRvv4AtFjwzijNzqrox6z2Y9r48aTGNYp23z6ovQK0vKTT
 202ed2MQfAybaXYqyPdVASBE+hVyOCt3p8JDZ8HytaEXyZxA9J4wlaqD7SY1nMiUThwoyVqeRTJ
 MMWAmEspBdhrOCzPFrQ==
X-Proofpoint-GUID: Kpmx5zUcTg_pbto6RNvR4YoiCD8Xu3uC
X-Authority-Analysis: v=2.4 cv=U+mfzOru c=1 sm=1 tr=0 ts=69954f31 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=5AoxzEp_LWBq4ObcYV0A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_04,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 bulkscore=0 impostorscore=0 malwarescore=0 spamscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 priorityscore=1501
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602180043
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16925-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:mnassiri@ciena.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-trace-users@vger.kernel.org,m:michael@ellerman.id.au,m:srostedt@redhat.com,m:masami.hiramatsu@linaro.org,m:christophe.leroy@csgroup.eu,m:npiggin@gmail.com,s:lists@lfdr.de];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_SENDER(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ellerman.id.au,redhat.com,linaro.org,csgroup.eu,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[hbathini@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B4613153208
X-Rspamd-Action: no action



On 18/02/26 1:40 am, Nassiri, Mohammad wrote:
> Hello,
> 
> On PPC64 with Yocto Kirkstone and Linux 5.10.x, `CONFIG_FTRACE_SYSCALLS=y` is enabled, but neither `perf list` nor ftrace show per‑syscall events under `/sys/kernel/debug/tracing/events/syscalls`. Only `raw_syscalls:sys_enter` / `raw_syscalls:sys_exit` are available.
> 
> On the same build and kernel version for x86_64, per‑syscall events are visible.
> 
> Configs on PPC include:
> CONFIG_TRACEPOINTS=y
> CONFIG_EVENT_TRACING=y
> CONFIG_FTRACE=y
> CONFIG_FTRACE_SYSCALLS=y
> CONFIG_HAVE_SYSCALL_TRACEPOINTS=y
> 
> Questions:
> 1. Is the absence of per‑syscall tracepoints on PPC in 5.10.x expected behaviour, or am I missing a config option required for these syscalls:* events to be available?
> 2. Or were these events only enabled for PPC after Michael Ellerman’s syscall tracing patch series in v6.1?
>     Link: https://lore.kernel.org/linuxppc-dev/166488988686.779920.13794870102696416283.b4-ty@ellerman.id.au/
> 3. If yes to (2), would a minimal backport of the PPC syscall tracepoint generation code from v6.1 allow 5.10.x to show syscalls:* events in perf/ftrace?

You should see syscall enter/exit tracepoints on v5.10.x without syscall
wrapper patchset referred above. Are you using v5.10.250 ?
Also, would help, if you can share the .config you used.

- Hari

