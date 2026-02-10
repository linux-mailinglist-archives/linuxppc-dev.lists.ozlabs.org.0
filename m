Return-Path: <linuxppc-dev+bounces-16774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENk1DhUli2mTQQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16774-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 13:31:17 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C0BF11ADAB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 13:31:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9LWz4h7Jz2xQ1;
	Tue, 10 Feb 2026 23:31:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770726671;
	cv=none; b=Fk1OsV4AYEKWKwX6DseLxjpgCdLuaHjcTgs/KRTR4E22WwG3X3jQdoJDM1DJcFGfhzr8OElOetb5aqKmkOk/6BnpTnaO4BBp7yn0JFmi1UTbG677O6tYx5go21orUtDrQih+k14ELi5A+pDkihc1jB+HxvakphEJ7CC/qSR0mM21oYCbmCNU51NiddEI5JZQcWWLQpL3h/vDPYsUUkjmHLaSrOCcrAHSuQKFq+9j7bLYKlA8yNihEyn3V0ndbAwMOY+qi1puSPTZ2G9leO9tD0YnEdgSDYj7/ILAz5YtOdfwGhzC+0KhfVG3OsWHImaX4tB4CK8s8M7hta5PFGEPxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770726671; c=relaxed/relaxed;
	bh=gqBbaGIl+/PAnVpCQ4wW31+BLMWwi2YpItoyyhgPEgY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jeKbl2muEmhG9++B2FINVKzFjD7NLjTYdakRQw6x8dfiP1Yrs0nD5egimypHB5oANg5MQPteFWcELIPv/8e35BE6LiJL4deo6B+i9gvmE5IzBEOEZgkzP2j3OSRSVfJynIgOcpgO1eSrIahTEA8zsn5/D+2+wY49tHcbgzCZ30gQFDrdCLmMVqLfKVDvtxBReobGnwSxr09sll2a7k5jlEjr0ZE3+JnxvEqZI97yEGQhytQBEfSjTTqRY/KYaiTcVdvUdh5qt6SrRbeT/f11pnZXXbaI84G/y1EX/wu5TQQImU/SBrNxUO+GeBc1NYURYd1EGnGjmITVrXE55qTW6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U5C2G8ix; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U5C2G8ix;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9LWy31h1z2xKx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 23:31:09 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61AANZfW1198145;
	Tue, 10 Feb 2026 12:30:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=gqBbaG
	Il+/PAnVpCQ4wW31+BLMWwi2YpItoyyhgPEgY=; b=U5C2G8ixKGPMDBC6EVisnZ
	AR7YkR4AR/PjLRjC9vq8Wuv8l0WtWHvU9ILALKhoLSTIdcnsdNEWwl8l7vZ6bY3v
	4OxQrsc9zd7bdCxoTL/KjiwV03I6f5+d2pWGXJhauzQ1H2qjpsJlEdgO0U6FJ4Fm
	PtWESlZELHWFXikcbzfD/BBS8ctxoQ3SdNb8bgjHGAoOCxyDHTQDDZ8B4QirzYau
	iD9ZZa3EUG0plSs8cRKPAnYMyW5qNB5KEmTOlsjid7pCB6PKzTQEz/GGq6eiSWsZ
	M3lx6BXB/UsgWw5pU2a6IRX/QCSGbveJ4M8p4+4tNZuXnykqil80bYVOQmj0Jbow
	==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696ut1te-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 12:30:27 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61A9CHYD008378;
	Tue, 10 Feb 2026 12:30:27 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4c6g3y9aw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Feb 2026 12:30:26 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61ACUMhU37945616
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Feb 2026 12:30:22 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56AB020040;
	Tue, 10 Feb 2026 12:30:22 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 453D52004B;
	Tue, 10 Feb 2026 12:30:08 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Feb 2026 12:30:08 +0000 (GMT)
Message-ID: <50693f0c-c610-4347-86aa-40d50dc681fc@linux.ibm.com>
Date: Tue, 10 Feb 2026 18:00:21 +0530
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
Subject: Re: [PATCH v4 1/3] crash: Exclude crash kernel memory in crash core
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
        catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org,
        kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au,
        npiggin@gmail.com, chleroy@kernel.org, pjw@kernel.org,
        palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
        tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, akpm@linux-foundation.org,
        bhe@redhat.com, vgoyal@redhat.com, dyoung@redhat.com,
        rdunlap@infradead.org, pmladek@suse.com, feng.tang@linux.alibaba.com,
        pawan.kumar.gupta@linux.intel.com, kees@kernel.org, elver@google.com,
        arnd@arndb.de, lirongqing@baidu.com, fvdl@google.com,
        leitao@debian.org, rppt@kernel.org, ardb@kernel.org, jbohac@suse.cz,
        osandov@fb.com, ryan.roberts@arm.com, cfsworks@gmail.com,
        tangyouling@kylinos.cn, ritesh.list@gmail.com, thuth@redhat.com,
        hbathini@linux.ibm.com, eajames@linux.ibm.com, bjorn@rivosinc.com,
        songshuaishuai@tinylab.org, kevin.brodsky@arm.com,
        samuel.holland@sifive.com, vishal.moola@gmail.com,
        junhui.liu@pigmoral.tech, dwmw@amazon.co.uk, pbonzini@redhat.com,
        thomas.lendacky@amd.com, kai.huang@intel.com, ubizjak@gmail.com,
        coxu@redhat.com, liaoyuanhong@vivo.com, fuqiang.wang@easystack.cn,
        brgerst@gmail.com, x86@kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
        linux-riscv@lists.infradead.org, kexec@lists.infradead.org
References: <20260209095931.2813152-1-ruanjinjie@huawei.com>
 <20260209095931.2813152-2-ruanjinjie@huawei.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260209095931.2813152-2-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEwMDEwMyBTYWx0ZWRfX+V6O0aJZtSyS
 sLf1H0lB5ePDOOTVV3yDojDidqTWfypDNjk7+2swa8depV9LVc6Ci4/pX0SVSmSRgZ32/l4YbV3
 P0fOO+zoHDrW6VrxGsOIAfdWc2uahw0JFZWLBbhf5f8xJcihjr4qLw68wGvGJBNDVmwotgpHrcp
 JODUHPSKDNjrVuzlm2MaW8m2Kzmv7SG8OrfwPyjnOtQ5EUwzuWKAAvsFGaqy8I8LTAe54OHdCA1
 vcUJ+etBgYo9jVU8frZPYSu57DP97SCcVFGKiPwqMnFzjM50WjnETPkRdf/EkWdQ7Mpre/WgRTe
 dWHJaTg7oqDLTxkEhcBGQkEgmht5fHKUkXILQFwlONWyBvuSPp0PVhqQvAnK6eFAVtK99cJZ7LB
 OdwGvsgID7K5IQWHpfaDEheaMGAx9khVW9WufLDvrkB4GZn2VGhrLtRrUODqyGHJpx5x/3emTC6
 o0X+C1sb2qu6Ag1rUXQ==
X-Proofpoint-ORIG-GUID: eeKw8mLZBRjpv3fT7fLHiImOUPPHzv0U
X-Proofpoint-GUID: 7aO9lz2FFcGtLMmIBBoD1Ue_Mkhb18vD
X-Authority-Analysis: v=2.4 cv=O+Y0fR9W c=1 sm=1 tr=0 ts=698b24e4 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=i0EeH86SAAAA:8 a=Er6CJE1HOtQne2_zMaUA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-10_01,2026-02-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602100103
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16774-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_TO(0.00)[huawei.com,lwn.net,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,suse.com,linux.alibaba.com,google.com,arndb.de,baidu.com,debian.org,suse.cz,fb.com,kylinos.cn,rivosinc.com,tinylab.org,sifive.com,pigmoral.tech,amazon.co.uk,amd.com,intel.com,vivo.com,easystack.cn,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:corbet@lwn.net,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:rdunlap@infradead.org,m:pmladek@suse.com,m:feng.tang@linux.alibaba.com,m:pawan.kumar.gupta@linux.intel.com,m:kees@kernel.org,m:elver@google.com,m:arnd@arndb.de,m:lirongqing@baidu.com,m:fvdl@google.com,m:leitao@debian.org,m:rppt@kernel.org,m:ardb@kernel.org,m:jbohac@suse.cz,m:osandov@fb.com,m:ryan.roberts@arm.com,m:cfsworks@gmail.com,m:tangyouling@kylinos.cn,m:ritesh.list@gmail.com,m:thuth@redhat.com,m:hbathini@linux.ibm.com,m:eajames@linux.ibm.com,m:bjorn@rivosinc.com,m:songshuaishuai@tinylab
 .org,m:kevin.brodsky@arm.com,m:samuel.holland@sifive.com,m:vishal.moola@gmail.com,m:junhui.liu@pigmoral.tech,m:dwmw@amazon.co.uk,m:pbonzini@redhat.com,m:thomas.lendacky@amd.com,m:kai.huang@intel.com,m:ubizjak@gmail.com,m:coxu@redhat.com,m:liaoyuanhong@vivo.com,m:fuqiang.wang@easystack.cn,m:brgerst@gmail.com,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kexec@lists.infradead.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.ibm.com:mid,huawei.com:email,start:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	RCPT_COUNT_GT_50(0.00)[67];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 9C0BF11ADAB
X-Rspamd-Action: no action

Hello Jinjie,

On 09/02/26 15:29, Jinjie Ruan wrote:
> The exclude of crashk_res, crashk_low_res and crashk_cma memory
> are almost identical across different architectures, handling them
> in the crash core would eliminate a lot of duplication, so do
> them in the common code.
>
> And move the size calculation (and the realloc if needed) into the
> generic crash core so that:
>
> - New CMA regions or future crash-memory types can automatically
>    accounted for in crash core;
>
> - Each architecture no longer has to play whack-a-mole with
>    its private array size.
>
> To achieve the above goal, 4 architecture-specific functions are
> introduced:
>
> - arch_get_system_nr_ranges() and arch_prepare_elf64_ram_headers().
>    The 1st function pre-counts the number of memory ranges, and
>    the 2st function fill the memory ranges into the cmem->ranges[] array,
>    and count the actual number of ranges filled. The default implementation
>    is consistent with arm64 and loongson.
>
> - arch_crash_exclude_mem_range(). Realloc for powerpc. The default
>    implementation is crash_exclude_mem_range(), and use
>    crash_exclude_mem_range_guarded() to implement the arch version
>    for powerpc.
>
> - arch_get_crash_memory_ranges(). Get crash memory ranges for arch and
>    the default implementation is generic across x86, arm64, riscv, and
>    loongson by using the first two arch functions above. powerpc has its
>    own implementation by calling get_crash_memory_ranges().
>
> Tested on x86, arm64 and riscv with QEMU.
>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   arch/arm64/kernel/machine_kexec_file.c     |  47 +--------
>   arch/loongarch/kernel/machine_kexec_file.c |  45 +-------
>   arch/powerpc/include/asm/kexec.h           |  13 +++
>   arch/powerpc/kexec/crash.c                 |  52 ++++++----
>   arch/powerpc/kexec/file_load_64.c          |  17 ++-
>   arch/powerpc/kexec/ranges.c                |  18 +---
>   arch/riscv/include/asm/kexec.h             |  10 ++
>   arch/riscv/kernel/machine_kexec_file.c     |  37 ++-----
>   arch/x86/include/asm/kexec.h               |  10 ++
>   arch/x86/kernel/crash.c                    | 104 ++-----------------
>   include/linux/crash_core.h                 | 114 +++++++++++++++++++--
>   kernel/crash_core.c                        |  71 +++++++++++--
>   12 files changed, 269 insertions(+), 269 deletions(-)
>
> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
> index 410060ebd86d..8a29449e992d 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -39,50 +39,6 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
>   	return kexec_image_post_load_cleanup_default(image);
>   }
>   
> -#ifdef CONFIG_CRASH_DUMP
> -static int prepare_elf_headers(void **addr, unsigned long *sz)
> -{
> -	struct crash_mem *cmem;
> -	unsigned int nr_ranges;
> -	int ret;
> -	u64 i;
> -	phys_addr_t start, end;
> -
> -	nr_ranges = 2; /* for exclusion of crashkernel region */
> -	for_each_mem_range(i, &start, &end)
> -		nr_ranges++;
> -
> -	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
> -	if (!cmem)
> -		return -ENOMEM;
> -
> -	cmem->max_nr_ranges = nr_ranges;
> -	cmem->nr_ranges = 0;
> -	for_each_mem_range(i, &start, &end) {
> -		cmem->ranges[cmem->nr_ranges].start = start;
> -		cmem->ranges[cmem->nr_ranges].end = end - 1;
> -		cmem->nr_ranges++;
> -	}
> -
> -	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> -	if (ret)
> -		goto out;
> -
> -	if (crashk_low_res.end) {
> -		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
> -		if (ret)
> -			goto out;
> -	}
> -
> -	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
> -
> -out:
> -	kfree(cmem);
> -	return ret;
> -}
> -#endif
> -
>   /*
>    * Tries to add the initrd and DTB to the image. If it is not possible to find
>    * valid locations, this function will undo changes to the image and return non
> @@ -109,7 +65,8 @@ int load_other_segments(struct kimage *image,
>   	void *headers;
>   	unsigned long headers_sz;
>   	if (image->type == KEXEC_TYPE_CRASH) {
> -		ret = prepare_elf_headers(&headers, &headers_sz);
> +		ret = crash_prepare_elf64_headers(true, &headers, &headers_sz,
> +						  NULL, NULL, NULL);
>   		if (ret) {
>   			pr_err("Preparing elf core header failed\n");
>   			goto out_err;
> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
> index fb57026f5f25..93555b92bbeb 100644
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c
> @@ -56,48 +56,6 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
>   }
>   
>   #ifdef CONFIG_CRASH_DUMP
> -
> -static int prepare_elf_headers(void **addr, unsigned long *sz)
> -{
> -	int ret, nr_ranges;
> -	uint64_t i;
> -	phys_addr_t start, end;
> -	struct crash_mem *cmem;
> -
> -	nr_ranges = 2; /* for exclusion of crashkernel region */
> -	for_each_mem_range(i, &start, &end)
> -		nr_ranges++;
> -
> -	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
> -	if (!cmem)
> -		return -ENOMEM;
> -
> -	cmem->max_nr_ranges = nr_ranges;
> -	cmem->nr_ranges = 0;
> -	for_each_mem_range(i, &start, &end) {
> -		cmem->ranges[cmem->nr_ranges].start = start;
> -		cmem->ranges[cmem->nr_ranges].end = end - 1;
> -		cmem->nr_ranges++;
> -	}
> -
> -	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> -	if (ret < 0)
> -		goto out;
> -
> -	if (crashk_low_res.end) {
> -		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
> -		if (ret < 0)
> -			goto out;
> -	}
> -
> -	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
> -
> -out:
> -	kfree(cmem);
> -	return ret;
> -}
> -
>   /*
>    * Add the "mem=size@start" command line parameter to command line, indicating the
>    * memory region the new kernel can use to boot into.
> @@ -163,7 +121,8 @@ int load_other_segments(struct kimage *image,
>   		void *headers;
>   		unsigned long headers_sz;
>   
> -		ret = prepare_elf_headers(&headers, &headers_sz);
> +		ret = crash_prepare_elf64_headers(true, &headers, &headers_sz,
> +						  NULL, NULL, NULL);
>   		if (ret < 0) {
>   			pr_err("Preparing elf core header failed\n");
>   			goto out_err;
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/kexec.h
> index bd4a6c42a5f3..ec64c26ca81a 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -123,6 +123,11 @@ static inline void kdump_cma_reserve(void) { }
>   #endif
>   
>   #if defined(CONFIG_CRASH_DUMP)
> +#include <asm/kexec_ranges.h>
> +
> +struct crash_mem;
> +struct memory_notify;
> +
>   /*
>    * This function is responsible for capturing register states if coming
>    * via panic or invoking dump using sysrq-trigger.
> @@ -147,6 +152,14 @@ unsigned int arch_crash_get_elfcorehdr_size(void);
>   #define crash_get_elfcorehdr_size arch_crash_get_elfcorehdr_size
>   #endif /* CONFIG_CRASH_HOTPLUG */
>   
> +int arch_crash_exclude_mem_range(struct crash_mem **mem, unsigned long long mstart,
> +				 unsigned long long mend);
> +#define arch_crash_exclude_mem_range arch_crash_exclude_mem_range
> +
> +int arch_get_crash_memory_ranges(struct crash_mem **cmem, unsigned long *nr_mem_ranges,
> +				 struct kimage *image, struct memory_notify *mn);
> +#define arch_get_crash_memory_ranges arch_get_crash_memory_ranges
> +
>   extern int crashing_cpu;
>   extern void crash_send_ipi(void (*crash_ipi_callback)(struct pt_regs *));
>   extern void crash_ipi_callback(struct pt_regs *regs);
> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
> index a325c1c02f96..5ade9a853fb0 100644
> --- a/arch/powerpc/kexec/crash.c
> +++ b/arch/powerpc/kexec/crash.c
> @@ -419,30 +419,21 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
>   	return sizeof(struct elfhdr) + (phdr_cnt * sizeof(Elf64_Phdr));
>   }
>   
> -/**
> - * update_crash_elfcorehdr() - Recreate the elfcorehdr and replace it with old
> - *			       elfcorehdr in the kexec segment array.
> - * @image: the active struct kimage
> - * @mn: struct memory_notify data handler
> - */
> -static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *mn)
> +int arch_get_crash_memory_ranges(struct crash_mem **cmem, unsigned long *nr_mem_ranges,
> +				 struct kimage *image, struct memory_notify *mn)
>   {
> +	unsigned long base_addr, size;
>   	int ret;
> -	struct crash_mem *cmem = NULL;
> -	struct kexec_segment *ksegment;
> -	void *ptr, *mem, *elfbuf = NULL;
> -	unsigned long elfsz, memsz, base_addr, size;
>   
> -	ksegment = &image->segment[image->elfcorehdr_index];
> -	mem = (void *) ksegment->mem;
> -	memsz = ksegment->memsz;
> -
> -	ret = get_crash_memory_ranges(&cmem);
> +	ret = get_crash_memory_ranges(cmem);
>   	if (ret) {
>   		pr_err("Failed to get crash mem range\n");
> -		return;
> +		return ret;
>   	}
>   
> +	if (!image || !mn)
> +		return 0;
> +
>   	/*
>   	 * The hot unplugged memory is part of crash memory ranges,
>   	 * remove it here.
> @@ -450,14 +441,34 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
>   	if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
>   		base_addr = PFN_PHYS(mn->start_pfn);
>   		size = mn->nr_pages * PAGE_SIZE;
> -		ret = remove_mem_range(&cmem, base_addr, size);
> +		ret = remove_mem_range(cmem, base_addr, size);

I like the overall design for handling crashkernel memory exclusion
in this patch series, especially the way you managed to free the
crash_mem object (mem) in the generic code (crash_prepare_elf64_headers()).

However, the way crash memory is prepared after a memory hotplug
event on powerpc by calling remove_mem_range(), can leave the crash
memory ranges unsorted. This can cause issues in the generic code
when excluding crashkernel memory, because crash_exclude_mem_range()
expects crash_mem to be sorted.

So I wrote a simple patch to cover this scenario. Including the
patch below as the first patch in this series would be helpful.
https://lore.kernel.org/all/20260210120803.433978-1-sourabhjain@linux.ibm.com/

Jinjie, will it be possible for you to include the above patch in this 
patch series?
>   		if (ret) {
>   			pr_err("Failed to remove hot-unplugged memory from crash memory ranges\n");
> -			goto out;
> +			return ret;
>   		}
>   	}
>   
> -	ret = crash_prepare_elf64_headers(cmem, false, &elfbuf, &elfsz);
> +	return 0;
> +}
> +
> +/**
> + * update_crash_elfcorehdr() - Recreate the elfcorehdr and replace it with old
> + *			       elfcorehdr in the kexec segment array.
> + * @image: the active struct kimage
> + * @mn: struct memory_notify data handler
> + */
> +static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *mn)
> +{
> +	void *ptr, *mem, *elfbuf = NULL;
> +	struct kexec_segment *ksegment;
> +	unsigned long elfsz, memsz;
> +	int ret;
> +
> +	ksegment = &image->segment[image->elfcorehdr_index];
> +	mem = (void *) ksegment->mem;
> +	memsz = ksegment->memsz;
> +
> +	ret = crash_prepare_elf64_headers(false, &elfbuf, &elfsz, NULL, image, mn);
>   	if (ret) {
>   		pr_err("Failed to prepare elf header\n");
>   		goto out;
> @@ -486,7 +497,6 @@ static void update_crash_elfcorehdr(struct kimage *image, struct memory_notify *
>   		xchg(&kexec_crash_image, image);
>   	}
>   out:
> -	kvfree(cmem);
>   	kvfree(elfbuf);
>   }
>   
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_load_64.c
> index e7ef8b2a2554..6fe13031236c 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -401,17 +401,17 @@ static void update_backup_region_phdr(struct kimage *image, Elf64_Ehdr *ehdr)
>   	}
>   }
>   
> -static unsigned int kdump_extra_elfcorehdr_size(struct crash_mem *cmem)
> +static unsigned int kdump_extra_elfcorehdr_size(unsigned long nr_mem_ranges)
>   {
>   #if defined(CONFIG_CRASH_HOTPLUG) && defined(CONFIG_MEMORY_HOTPLUG)
>   	unsigned int extra_sz = 0;
>   
>   	if (CONFIG_CRASH_MAX_MEMORY_RANGES > (unsigned int)PN_XNUM)
>   		pr_warn("Number of Phdrs %u exceeds max\n", CONFIG_CRASH_MAX_MEMORY_RANGES);
> -	else if (cmem->nr_ranges >= CONFIG_CRASH_MAX_MEMORY_RANGES)
> +	else if (nr_mem_ranges >= CONFIG_CRASH_MAX_MEMORY_RANGES)
>   		pr_warn("Configured crash mem ranges may not be enough\n");
>   	else
> -		extra_sz = (CONFIG_CRASH_MAX_MEMORY_RANGES - cmem->nr_ranges) * sizeof(Elf64_Phdr);
> +		extra_sz = (CONFIG_CRASH_MAX_MEMORY_RANGES - nr_mem_ranges) * sizeof(Elf64_Phdr);
>   
>   	return extra_sz;
>   #endif
> @@ -428,17 +428,13 @@ static unsigned int kdump_extra_elfcorehdr_size(struct crash_mem *cmem)
>    */
>   static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
>   {
> -	struct crash_mem *cmem = NULL;
> +	unsigned long nr_mem_ranges;
>   	unsigned long headers_sz;
>   	void *headers = NULL;
>   	int ret;
>   
> -	ret = get_crash_memory_ranges(&cmem);
> -	if (ret)
> -		goto out;
> -
>   	/* Setup elfcorehdr segment */
> -	ret = crash_prepare_elf64_headers(cmem, false, &headers, &headers_sz);
> +	ret = crash_prepare_elf64_headers(false, &headers, &headers_sz, &nr_mem_ranges, NULL, NULL);
>   	if (ret) {
>   		pr_err("Failed to prepare elf headers for the core\n");
>   		goto out;
> @@ -450,7 +446,7 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
>   	kbuf->buffer = headers;
>   	kbuf->mem = KEXEC_BUF_MEM_UNKNOWN;
>   	kbuf->bufsz = headers_sz;
> -	kbuf->memsz = headers_sz + kdump_extra_elfcorehdr_size(cmem);
> +	kbuf->memsz = headers_sz + kdump_extra_elfcorehdr_size(nr_mem_ranges);
>   	kbuf->top_down = false;
>   
>   	ret = kexec_add_buffer(kbuf);
> @@ -463,7 +459,6 @@ static int load_elfcorehdr_segment(struct kimage *image, struct kexec_buf *kbuf)
>   	image->elf_headers_sz = headers_sz;
>   	image->elf_headers = headers;
>   out:
> -	kfree(cmem);
>   	return ret;
>   }
>   
> diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
> index 867135560e5c..34e3058ff1d5 100644
> --- a/arch/powerpc/kexec/ranges.c
> +++ b/arch/powerpc/kexec/ranges.c
> @@ -553,9 +553,9 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
>   #endif /* CONFIG_KEXEC_FILE */
>   
>   #ifdef CONFIG_CRASH_DUMP
> -static int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
> -					   unsigned long long mstart,
> -					   unsigned long long mend)
> +int arch_crash_exclude_mem_range(struct crash_mem **mem_ranges,
> +				 unsigned long long mstart,
> +				 unsigned long long mend)
>   {
>   	struct crash_mem *tmem = *mem_ranges;
>   
> @@ -604,18 +604,6 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>   			sort_memory_ranges(*mem_ranges, true);
>   	}
>   
> -	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_res.start, crashk_res.end);
> -	if (ret)
> -		goto out;
> -
> -	for (i = 0; i < crashk_cma_cnt; ++i) {
> -		ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_cma_ranges[i].start,
> -					      crashk_cma_ranges[i].end);
> -		if (ret)
> -			goto out;
> -	}
> -
>   	/*
>   	 * FIXME: For now, stay in parity with kexec-tools but if RTAS/OPAL
>   	 *        regions are exported to save their context at the time of
> diff --git a/arch/riscv/include/asm/kexec.h b/arch/riscv/include/asm/kexec.h
> index b9ee8346cc8c..daee8388a26d 100644
> --- a/arch/riscv/include/asm/kexec.h
> +++ b/arch/riscv/include/asm/kexec.h
> @@ -75,4 +75,14 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
>   			unsigned long cmdline_len);
>   #endif
>   
> +#ifdef CONFIG_CRASH_DUMP
> +struct crash_mem;
> +
> +int arch_get_system_nr_ranges(unsigned int *nr_ranges);
> +#define arch_get_system_nr_ranges arch_get_system_nr_ranges
> +
> +int arch_prepare_elf64_ram_headers(struct crash_mem *cmem);
> +#define arch_prepare_elf64_ram_headers arch_prepare_elf64_ram_headers
> +#endif
> +
>   #endif
> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
> index dd9d92a96517..2f0e7bbeb2f0 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -44,6 +44,13 @@ static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
>   	return 0;
>   }
>   
> +int arch_get_system_nr_ranges(unsigned int *nr_ranges)
> +{
> +	walk_system_ram_res(0, -1, nr_ranges, get_nr_ram_ranges_callback);
> +
> +	return 0;
> +}
> +
>   static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
>   {
>   	struct crash_mem *cmem = arg;
> @@ -55,33 +62,10 @@ static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
>   	return 0;
>   }
>   
> -static int prepare_elf_headers(void **addr, unsigned long *sz)
> +int arch_prepare_elf64_ram_headers(struct crash_mem *cmem)
>   {
> -	struct crash_mem *cmem;
> -	unsigned int nr_ranges;
> -	int ret;
> -
> -	nr_ranges = 1; /* For exclusion of crashkernel region */
> -	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
> -
> -	cmem = kmalloc(struct_size(cmem, ranges, nr_ranges), GFP_KERNEL);
> -	if (!cmem)
> -		return -ENOMEM;
> -
> -	cmem->max_nr_ranges = nr_ranges;
>   	cmem->nr_ranges = 0;
> -	ret = walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
> -	if (ret)
> -		goto out;
> -
> -	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> -	if (!ret)
> -		ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
> -
> -out:
> -	kfree(cmem);
> -	return ret;
> +	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
>   }
>   
>   static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
> @@ -273,7 +257,8 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
>   	if (image->type == KEXEC_TYPE_CRASH) {
>   		void *headers;
>   		unsigned long headers_sz;
> -		ret = prepare_elf_headers(&headers, &headers_sz);
> +
> +		ret = crash_prepare_elf64_headers(true, &headers, &headers_sz, NULL, NULL, NULL);
>   		if (ret) {
>   			pr_err("Preparing elf core header failed\n");
>   			goto out;
> diff --git a/arch/x86/include/asm/kexec.h b/arch/x86/include/asm/kexec.h
> index 5cfb27f26583..9939dd8715df 100644
> --- a/arch/x86/include/asm/kexec.h
> +++ b/arch/x86/include/asm/kexec.h
> @@ -232,6 +232,16 @@ unsigned int arch_crash_get_elfcorehdr_size(void);
>   #define crash_get_elfcorehdr_size arch_crash_get_elfcorehdr_size
>   #endif
>   
> +#ifdef CONFIG_CRASH_DUMP
> +struct crash_mem;
> +
> +int arch_get_system_nr_ranges(unsigned int *nr_ranges);
> +#define arch_get_system_nr_ranges arch_get_system_nr_ranges
> +
> +int arch_prepare_elf64_ram_headers(struct crash_mem *cmem);
> +#define arch_prepare_elf64_ram_headers arch_prepare_elf64_ram_headers
> +#endif
> +
>   #endif /* __ASSEMBLER__ */
>   
>   #endif /* _ASM_X86_KEXEC_H */
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index 335fd2ee9766..3fbbd518604a 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -152,73 +152,15 @@ static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
>   	return 0;
>   }
>   
> -/* Gather all the required information to prepare elf headers for ram regions */
> -static struct crash_mem *fill_up_crash_elf_data(void)
> +int arch_get_system_nr_ranges(unsigned int *nr_ranges)
>   {
> -	unsigned int nr_ranges = 0;
> -	struct crash_mem *cmem;
> +	int ret;
>   
> -	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
> +	ret = walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
>   	if (!nr_ranges)
> -		return NULL;
> -
> -	/*
> -	 * Exclusion of crash region, crashk_low_res and/or crashk_cma_ranges
> -	 * may cause range splits. So add extra slots here.
> -	 *
> -	 * Exclusion of low 1M may not cause another range split, because the
> -	 * range of exclude is [0, 1M] and the condition for splitting a new
> -	 * region is that the start, end parameters are both in a certain
> -	 * existing region in cmem and cannot be equal to existing region's
> -	 * start or end. Obviously, the start of [0, 1M] cannot meet this
> -	 * condition.
> -	 *
> -	 * But in order to lest the low 1M could be changed in the future,
> -	 * (e.g. [start, 1M]), add a extra slot.
> -	 */
> -	nr_ranges += 3 + crashk_cma_cnt;
> -	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
> -	if (!cmem)
> -		return NULL;
> -
> -	cmem->max_nr_ranges = nr_ranges;
> -
> -	return cmem;
> -}
> -
> -/*
> - * Look for any unwanted ranges between mstart, mend and remove them. This
> - * might lead to split and split ranges are put in cmem->ranges[] array
> - */
> -static int elf_header_exclude_ranges(struct crash_mem *cmem)
> -{
> -	int ret = 0;
> -	int i;
> -
> -	/* Exclude the low 1M because it is always reserved */
> -	ret = crash_exclude_mem_range(cmem, 0, SZ_1M - 1);
> -	if (ret)
> -		return ret;
> -
> -	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> -	if (ret)
> -		return ret;
> -
> -	if (crashk_low_res.end)
> -		ret = crash_exclude_mem_range(cmem, crashk_low_res.start,
> -					      crashk_low_res.end);
> -	if (ret)
> -		return ret;
> -
> -	for (i = 0; i < crashk_cma_cnt; ++i) {
> -		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
> -					      crashk_cma_ranges[i].end);
> -		if (ret)
> -			return ret;
> -	}
> +		return -ENOMEM;
>   
> -	return 0;
> +	return ret;
>   }
>   
>   static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
> @@ -232,35 +174,9 @@ static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
>   	return 0;
>   }
>   
> -/* Prepare elf headers. Return addr and size */
> -static int prepare_elf_headers(void **addr, unsigned long *sz,
> -			       unsigned long *nr_mem_ranges)
> +int arch_prepare_elf64_ram_headers(struct crash_mem *cmem)
>   {
> -	struct crash_mem *cmem;
> -	int ret;
> -
> -	cmem = fill_up_crash_elf_data();
> -	if (!cmem)
> -		return -ENOMEM;
> -
> -	ret = walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
> -	if (ret)
> -		goto out;
> -
> -	/* Exclude unwanted mem ranges */
> -	ret = elf_header_exclude_ranges(cmem);
> -	if (ret)
> -		goto out;
> -
> -	/* Return the computed number of memory ranges, for hotplug usage */
> -	*nr_mem_ranges = cmem->nr_ranges;
> -
> -	/* By default prepare 64bit headers */
> -	ret = crash_prepare_elf64_headers(cmem, IS_ENABLED(CONFIG_X86_64), addr, sz);
> -
> -out:
> -	vfree(cmem);
> -	return ret;
> +	return walk_system_ram_res(0, -1, cmem, prepare_elf64_ram_headers_callback);
>   }
>   #endif
>   
> @@ -418,7 +334,8 @@ int crash_load_segments(struct kimage *image)
>   				  .buf_max = ULONG_MAX, .top_down = false };
>   
>   	/* Prepare elf headers and add a segment */
> -	ret = prepare_elf_headers(&kbuf.buffer, &kbuf.bufsz, &pnum);
> +	ret = crash_prepare_elf64_headers(IS_ENABLED(CONFIG_X86_64), &kbuf.buffer,
> +					  &kbuf.bufsz, &pnum, NULL, NULL);
>   	if (ret)
>   		return ret;
>   
> @@ -529,7 +446,8 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>   	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>   	 * memory resources.
>   	 */
> -	if (prepare_elf_headers(&elfbuf, &elfsz, &nr_mem_ranges)) {
> +	if (crash_prepare_elf64_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz,
> +					&nr_mem_ranges, NULL, NULL)) {
>   		pr_err("unable to create new elfcorehdr");
>   		goto out;
>   	}
> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> index d35726d6a415..8d92cd16b625 100644
> --- a/include/linux/crash_core.h
> +++ b/include/linux/crash_core.h
> @@ -2,11 +2,15 @@
>   #ifndef LINUX_CRASH_CORE_H
>   #define LINUX_CRASH_CORE_H
>   
> -#include <linux/linkage.h>
>   #include <linux/elfcore.h>
>   #include <linux/elf.h>
> +#include <linux/kexec.h>
> +#include <linux/linkage.h>
> +#include <linux/memblock.h>
> +#include <linux/vmalloc.h>
>   
>   struct kimage;
> +struct memory_notify;
>   
>   struct crash_mem {
>   	unsigned int max_nr_ranges;
> @@ -54,6 +58,104 @@ static inline int arch_crash_hotplug_support(struct kimage *image, unsigned long
>   }
>   #endif
>   
> +#ifndef arch_get_system_nr_ranges
> +static inline int arch_get_system_nr_ranges(unsigned int *nr_ranges)
> +{
> +	phys_addr_t start, end;
> +	u64 i;
> +
> +	for_each_mem_range(i, &start, &end)
> +		(*nr_ranges)++;
> +
> +	return 0;
> +}
> +#endif
> +
> +#ifndef arch_prepare_elf64_ram_headers
> +static inline int arch_prepare_elf64_ram_headers(struct crash_mem *cmem)
> +{
> +	phys_addr_t start, end;
> +	u64 i;
> +
> +	cmem->nr_ranges = 0;
> +	for_each_mem_range(i, &start, &end) {
> +		cmem->ranges[cmem->nr_ranges].start = start;
> +		cmem->ranges[cmem->nr_ranges].end = end - 1;
> +		cmem->nr_ranges++;
> +	}
> +
> +	for (i = 0; i < crashk_cma_cnt; i++) {
> +		cmem->ranges[cmem->nr_ranges].start = crashk_cma_ranges[i].start;
> +		cmem->ranges[cmem->nr_ranges].end = crashk_cma_ranges[i].end;
> +		cmem->nr_ranges++;
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
> +extern int crash_exclude_mem_range(struct crash_mem *mem,
> +				   unsigned long long mstart,
> +				   unsigned long long mend);
> +
> +#ifndef arch_crash_exclude_mem_range
> +static __always_inline int arch_crash_exclude_mem_range(struct crash_mem **mem_ranges,
> +							unsigned long long mstart,
> +							unsigned long long mend)
> +{
> +	return crash_exclude_mem_range(*mem_ranges, mstart, mend);
> +}
> +#endif
> +
> +#ifndef arch_get_crash_memory_ranges
> +static inline int arch_get_crash_memory_ranges(struct crash_mem **cmem,
> +					       unsigned long *nr_mem_ranges,
> +					       struct kimage *image,
> +					       struct memory_notify *mn)
> +{
> +	unsigned int nr_ranges;
> +	int ret;
> +
> +#if defined(CONFIG_X86_64) || defined(CONFIG_X86_32)
> +	/*
> +	 * Exclusion of crash region, crashk_low_res and/or crashk_cma_ranges
> +	 * may cause range splits. So add extra slots here.
> +	 *
> +	 * Exclusion of low 1M may not cause another range split, because the
> +	 * range of exclude is [0, 1M] and the condition for splitting a new
> +	 * region is that the start, end parameters are both in a certain
> +	 * existing region in cmem and cannot be equal to existing region's
> +	 * start or end. Obviously, the start of [0, 1M] cannot meet this
> +	 * condition.
> +	 *
> +	 * But in order to lest the low 1M could be changed in the future,
> +	 * (e.g. [start, 1M]), add a extra slot.
> +	 */
> +	nr_ranges = 3 + crashk_cma_cnt;
> +#else
> +	/* For exclusion of crashkernel region*/
> +	nr_ranges = 1 + (crashk_low_res.end != 0) + crashk_cma_cnt;
> +#endif
> +
> +	ret = arch_get_system_nr_ranges(&nr_ranges);
> +	if (ret)
> +		return ret;
> +
> +	*cmem = kvzalloc(struct_size(*cmem, ranges, nr_ranges), GFP_KERNEL);
> +	if (!(*cmem))
> +		return -ENOMEM;
> +
> +	(*cmem)->max_nr_ranges = nr_ranges;
> +	ret = arch_prepare_elf64_ram_headers(*cmem);
> +	if (ret) {
> +		kvfree(*cmem);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +#endif
> +
>   #ifndef crash_get_elfcorehdr_size
>   static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
>   #endif
> @@ -61,11 +163,11 @@ static inline unsigned int crash_get_elfcorehdr_size(void) { return 0; }
>   /* Alignment required for elf header segment */
>   #define ELF_CORE_HEADER_ALIGN   4096
>   
> -extern int crash_exclude_mem_range(struct crash_mem *mem,
> -				   unsigned long long mstart,
> -				   unsigned long long mend);
> -extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
> -				       void **addr, unsigned long *sz);
> +extern int crash_prepare_elf64_headers(int need_kernel_map,
> +				       void **addr, unsigned long *sz,
> +				       unsigned long *nr_mem_ranges,
> +				       struct kimage *image,
> +				       struct memory_notify *mn);
>   
>   struct kimage;
>   struct kexec_segment;
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 99dac1aa972a..39048c87d7a2 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -18,6 +18,7 @@
>   #include <linux/memblock.h>
>   #include <linux/kmemleak.h>
>   #include <linux/crash_core.h>
> +#include <linux/crash_reserve.h>
>   #include <linux/reboot.h>
>   #include <linux/btf.h>
>   #include <linux/objtool.h>
> @@ -161,19 +162,66 @@ static inline resource_size_t crash_resource_size(const struct resource *res)
>   	return !res->end ? 0 : resource_size(res);
>   }
>   
> +static int crash_exclude_mem_ranges(struct crash_mem *cmem,
> +				    unsigned long *nr_mem_ranges)
> +{
> +	int ret, i;
> +
> +#if defined(CONFIG_X86_64) || defined(CONFIG_X86_32)
> +	/* Exclude the low 1M because it is always reserved */
> +	ret = crash_exclude_mem_range(cmem, 0, SZ_1M - 1);
> +	if (ret)
> +		return ret;
> +#endif
>   
> +	/* Exclude crashkernel region */
> +	ret = arch_crash_exclude_mem_range(&cmem, crashk_res.start, crashk_res.end);
> +	if (ret)
> +		return ret;
> +
> +	if (crashk_low_res.end) {
> +		ret = arch_crash_exclude_mem_range(&cmem, crashk_low_res.start, crashk_low_res.end);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (i = 0; i < crashk_cma_cnt; ++i) {
> +		ret = arch_crash_exclude_mem_range(&cmem, crashk_cma_ranges[i].start,
> +						   crashk_cma_ranges[i].end);
> +		if (ret)
> +			return ret;
> +	}
>   
> +	/* Return the computed number of memory ranges, for hotplug usage */
> +	if (nr_mem_ranges)
> +		*nr_mem_ranges = cmem->nr_ranges;
>   
> -int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
> -			  void **addr, unsigned long *sz)
> +	return 0;
> +}
> +
> +int crash_prepare_elf64_headers(int need_kernel_map, void **addr,
> +				unsigned long *sz, unsigned long *nr_mem_ranges,
> +				struct kimage *image, struct memory_notify *mn)
>   {
> -	Elf64_Ehdr *ehdr;
> -	Elf64_Phdr *phdr;
>   	unsigned long nr_cpus = num_possible_cpus(), nr_phdr, elf_sz;
> -	unsigned char *buf;
> -	unsigned int cpu, i;
>   	unsigned long long notes_addr;
> +	struct crash_mem *mem = NULL;
>   	unsigned long mstart, mend;
> +	unsigned int cpu, i;
> +	unsigned char *buf;
> +	Elf64_Ehdr *ehdr;
> +	Elf64_Phdr *phdr;
> +	int ret = 0;
> +
> +	ret = arch_get_crash_memory_ranges(&mem, nr_mem_ranges, image, mn);
> +	if (ret)
> +		return ret;
> +
> +	if (mem) {
> +		ret = crash_exclude_mem_ranges(mem, nr_mem_ranges);
> +		if (ret)
> +			goto out;
> +	}
>   
>   	/* extra phdr for vmcoreinfo ELF note */
>   	nr_phdr = nr_cpus + 1;
> @@ -192,8 +240,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>   	elf_sz = ALIGN(elf_sz, ELF_CORE_HEADER_ALIGN);
>   
>   	buf = vzalloc(elf_sz);
> -	if (!buf)
> -		return -ENOMEM;
> +	if (!buf) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
>   
>   	ehdr = (Elf64_Ehdr *)buf;
>   	phdr = (Elf64_Phdr *)(ehdr + 1);
> @@ -262,7 +312,10 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>   
>   	*addr = buf;
>   	*sz = elf_sz;
> -	return 0;
> +
> +out:
> +	kvfree(mem);
> +	return ret;
>   }
>   
>   /**


