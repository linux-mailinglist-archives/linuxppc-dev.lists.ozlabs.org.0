Return-Path: <linuxppc-dev+bounces-16825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +GaaON1vjWma2gAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16825-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 07:14:53 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5A212A8BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Feb 2026 07:14:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fBQ4k6fq3z2yLH;
	Thu, 12 Feb 2026 17:14:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770876886;
	cv=none; b=M3UrbbtcBhPoBQphinIgQTZWGPAFg3mg0E4zK29hJ60QsBLx9xNzXKE2hYFOx6cwPN8PQNxAGwdr/NeEahtRFb7dfcfONmmNhQwYvh/ozGrt9DgAvfS3wnmASkWn6Uam+CnLvuqz2TFcKmh0XJx9h0EWkfxxa9zJFIbgbyQZ0qI9J40FbeJGYB4fGHtiir6fcVjxUCBLqOP5R1J3JsOTlOCdcsxJvcPiRdUaoL/+sFOJZdS2iRvjbsYZF0cftcwQVFyU5YtbwKVxieYuRZIieQDrANgLHFixV9HwDp2kKGTEPwZpBc9iczTUbkbMd1fiVlc3wUczhWW+whDYiCX1jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770876886; c=relaxed/relaxed;
	bh=ojMHV+TxP6e3FLHmg8fIJfthetl5cVOWSrR8HU/Rc/I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=XelAtxZM4jZjJDgo3zOEqT4ShA7GOE6MMGtIsPFf3X8wFqCp+yXxZIXf+VWf3KYlMC1AjV9TyHkjm/gBJsBQwAa/qRp2jwnA2c3TgARqYOVpaGeSKbTJ8d7/c7zK01wunQQoFa/DUu8Z//oLs6hZtRTbHIdv4PkX+uP42NL3qxvuZWzzlmb7BTuizIEvTNX3yoEuLGFy7m8CQPeaaS1KPVLjT2nIlVS6kdJpDlZB7ADArxf0tFK1p9qzMXRRRFEkIu4dVUOjQOs4O0s8l6NV1shePp3kERRaggRt2+UrAzGrSy8ktYSb3FIQKaPH1IcSjefNmvDkbjl7xZxhKUkWhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ey17cf9b; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Ey17cf9b;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fBQ4j6HJyz2xN5
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Feb 2026 17:14:45 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61BFYKsD369791;
	Thu, 12 Feb 2026 06:11:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=ojMHV+
	TxP6e3FLHmg8fIJfthetl5cVOWSrR8HU/Rc/I=; b=Ey17cf9bfbIHupEH0Z0c42
	ETQ1EmhdoqHoKSr9VFi0UrrqyZJS6bAF0Ir9TUvG4I2MJJMtmzkjctMQjbdkcxws
	E+SUFXx7PkDLaXOQ1yRFQ+7fLoKS3ohJUR2mBqinTC77OsPjA/BlEl+GIE08CQzf
	GCEht20jhHb8NRTGtPBaGMuu1yrIpfjlqp+EfLOZfibFIA+OZ/NUKonPzXKlPZI9
	jtwtCW67v7u9qijheZq0SnfyIwG6aIv9iqOzd0hnzpKrD+G3xTpqneMut937gnyt
	EmfYF/wl62aU6LwgfCrISp3z8VAgHQOnCgBQ80+0+FFjLUdz32zQculJmDG5uS2A
	==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4c696x24ge-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 06:11:26 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61C4ZFKh019251;
	Thu, 12 Feb 2026 06:11:24 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4c6hxk8y2q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Feb 2026 06:11:24 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61C6BKpV15008004
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 12 Feb 2026 06:11:21 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C3C1D2004D;
	Thu, 12 Feb 2026 06:11:20 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9437220040;
	Thu, 12 Feb 2026 06:11:01 +0000 (GMT)
Received: from [9.39.27.166] (unknown [9.39.27.166])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 12 Feb 2026 06:11:01 +0000 (GMT)
Message-ID: <5b6f4093-3ddd-477d-ade4-fe31429cf3cd@linux.ibm.com>
Date: Thu, 12 Feb 2026 11:41:00 +0530
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
 <50693f0c-c610-4347-86aa-40d50dc681fc@linux.ibm.com>
 <31c2ae53-cbb7-bfad-9b8f-f9e1a254491e@huawei.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <31c2ae53-cbb7-bfad-9b8f-f9e1a254491e@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=WZYBqkhX c=1 sm=1 tr=0 ts=698d6f0e cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=VnNF1IyMAAAA:8 a=i0EeH86SAAAA:8 a=B_ciY6P1UxUjS-fdd_UA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: pPQWyo0dBerxEXBQvX-fWAqozUfKAgMU
X-Proofpoint-ORIG-GUID: NJnrqqmFwVChV0NJpqnRbaDGJlc_JaK5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEyMDAzOSBTYWx0ZWRfX3ttwUOBSfW6t
 I/8Hz+DYXVvSSlj/G1NDONhkkFRDOcWcVU8ZWOdCaeQiSqDBoTdIv6+Tc99oUe5HVGftG7lRYeC
 51L9B6eK/zNvaD/TOWeehy7QYHzeOiC8KMMJKPPTR3Xt2B9vcK5BU+o/qLnzLcsSVlo9cZKimqz
 ulVMaPptKVRdY0bjVlTsSHPmhipS7GGPPQoUCKIsYkLSiKIsscPzVZcXkXBlJu93n5DUvZoJgFa
 eO2d6xI6jWJjuPHEG3c3eWKO5rkBYYfOhsQsl9iZouncmrOlkxuxUDiENFvM/CV/MmDZRRhmJfY
 dzsY0+TnQ9Et6vmgImq7ts8pYMkZlJvhVf9ksKIhh6xagoBwd+qGyH+7OQxKgLGqkPIp27VeuSs
 IHivRppL66tOv1wzzSnPdFaTvaoVdda7zpGiTmfzC6304JgPWIwVr5IoU/c2X9EH91PGbdFawpf
 cKNP0JormcRl9vWEjdw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-12_01,2026-02-11_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602120039
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16825-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_TO(0.00)[huawei.com,lwn.net,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,suse.com,linux.alibaba.com,google.com,arndb.de,baidu.com,debian.org,suse.cz,fb.com,kylinos.cn,rivosinc.com,tinylab.org,sifive.com,pigmoral.tech,amazon.co.uk,amd.com,intel.com,vivo.com,easystack.cn,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:corbet@lwn.net,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:rdunlap@infradead.org,m:pmladek@suse.com,m:feng.tang@linux.alibaba.com,m:pawan.kumar.gupta@linux.intel.com,m:kees@kernel.org,m:elver@google.com,m:arnd@arndb.de,m:lirongqing@baidu.com,m:fvdl@google.com,m:leitao@debian.org,m:rppt@kernel.org,m:ardb@kernel.org,m:jbohac@suse.cz,m:osandov@fb.com,m:ryan.roberts@arm.com,m:cfsworks@gmail.com,m:tangyouling@kylinos.cn,m:ritesh.list@gmail.com,m:thuth@redhat.com,m:hbathini@linux.ibm.com,m:eajames@linux.ibm.com,m:bjorn@rivosinc.com,m:songshuaishuai@tinylab
 .org,m:kevin.brodsky@arm.com,m:samuel.holland@sifive.com,m:vishal.moola@gmail.com,m:junhui.liu@pigmoral.tech,m:dwmw@amazon.co.uk,m:pbonzini@redhat.com,m:thomas.lendacky@amd.com,m:kai.huang@intel.com,m:ubizjak@gmail.com,m:coxu@redhat.com,m:liaoyuanhong@vivo.com,m:fuqiang.wang@easystack.cn,m:brgerst@gmail.com,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kexec@lists.infradead.org,s:lists@lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
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
X-Rspamd-Queue-Id: 9A5A212A8BA
X-Rspamd-Action: no action



On 12/02/26 08:58, Jinjie Ruan wrote:
>
> On 2026/2/10 20:30, Sourabh Jain wrote:
>> Hello Jinjie,
>>
>> On 09/02/26 15:29, Jinjie Ruan wrote:
>>> The exclude of crashk_res, crashk_low_res and crashk_cma memory
>>> are almost identical across different architectures, handling them
>>> in the crash core would eliminate a lot of duplication, so do
>>> them in the common code.
>>>
>>> And move the size calculation (and the realloc if needed) into the
>>> generic crash core so that:
>>>
>>> - New CMA regions or future crash-memory types can automatically
>>>     accounted for in crash core;
>>>
>>> - Each architecture no longer has to play whack-a-mole with
>>>     its private array size.
>>>
>>> To achieve the above goal, 4 architecture-specific functions are
>>> introduced:
>>>
>>> - arch_get_system_nr_ranges() and arch_prepare_elf64_ram_headers().
>>>     The 1st function pre-counts the number of memory ranges, and
>>>     the 2st function fill the memory ranges into the cmem->ranges[] array,
>>>     and count the actual number of ranges filled. The default
>>> implementation
>>>     is consistent with arm64 and loongson.
>>>
>>> - arch_crash_exclude_mem_range(). Realloc for powerpc. The default
>>>     implementation is crash_exclude_mem_range(), and use
>>>     crash_exclude_mem_range_guarded() to implement the arch version
>>>     for powerpc.
>>>
>>> - arch_get_crash_memory_ranges(). Get crash memory ranges for arch and
>>>     the default implementation is generic across x86, arm64, riscv, and
>>>     loongson by using the first two arch functions above. powerpc has its
>>>     own implementation by calling get_crash_memory_ranges().
>>>
>>> Tested on x86, arm64 and riscv with QEMU.
>>>
>>> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
>>> ---
>>>    arch/arm64/kernel/machine_kexec_file.c     |  47 +--------
>>>    arch/loongarch/kernel/machine_kexec_file.c |  45 +-------
>>>    arch/powerpc/include/asm/kexec.h           |  13 +++
>>>    arch/powerpc/kexec/crash.c                 |  52 ++++++----
>>>    arch/powerpc/kexec/file_load_64.c          |  17 ++-
>>>    arch/powerpc/kexec/ranges.c                |  18 +---
>>>    arch/riscv/include/asm/kexec.h             |  10 ++
>>>    arch/riscv/kernel/machine_kexec_file.c     |  37 ++-----
>>>    arch/x86/include/asm/kexec.h               |  10 ++
>>>    arch/x86/kernel/crash.c                    | 104 ++-----------------
>>>    include/linux/crash_core.h                 | 114 +++++++++++++++++++--
>>>    kernel/crash_core.c                        |  71 +++++++++++--
>>>    12 files changed, 269 insertions(+), 269 deletions(-)
>>>
> [...]
>
>>>    extern void crash_ipi_callback(struct pt_regs *regs);
>>> diff --git a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c
>>> index a325c1c02f96..5ade9a853fb0 100644
>>> --- a/arch/powerpc/kexec/crash.c
>>> +++ b/arch/powerpc/kexec/crash.c
>>> @@ -419,30 +419,21 @@ unsigned int arch_crash_get_elfcorehdr_size(void)
>>>        return sizeof(struct elfhdr) + (phdr_cnt * sizeof(Elf64_Phdr));
>>>    }
>>>    -/**
>>> - * update_crash_elfcorehdr() - Recreate the elfcorehdr and replace it
>>> with old
>>> - *                   elfcorehdr in the kexec segment array.
>>> - * @image: the active struct kimage
>>> - * @mn: struct memory_notify data handler
>>> - */
>>> -static void update_crash_elfcorehdr(struct kimage *image, struct
>>> memory_notify *mn)
>>> +int arch_get_crash_memory_ranges(struct crash_mem **cmem, unsigned
>>> long *nr_mem_ranges,
>>> +                 struct kimage *image, struct memory_notify *mn)
>>>    {
>>> +    unsigned long base_addr, size;
>>>        int ret;
>>> -    struct crash_mem *cmem = NULL;
>>> -    struct kexec_segment *ksegment;
>>> -    void *ptr, *mem, *elfbuf = NULL;
>>> -    unsigned long elfsz, memsz, base_addr, size;
>>>    -    ksegment = &image->segment[image->elfcorehdr_index];
>>> -    mem = (void *) ksegment->mem;
>>> -    memsz = ksegment->memsz;
>>> -
>>> -    ret = get_crash_memory_ranges(&cmem);
>>> +    ret = get_crash_memory_ranges(cmem);
>>>        if (ret) {
>>>            pr_err("Failed to get crash mem range\n");
>>> -        return;
>>> +        return ret;
>>>        }
>>>    +    if (!image || !mn)
>>> +        return 0;
>>> +
>>>        /*
>>>         * The hot unplugged memory is part of crash memory ranges,
>>>         * remove it here.
>>> @@ -450,14 +441,34 @@ static void update_crash_elfcorehdr(struct
>>> kimage *image, struct memory_notify *
>>>        if (image->hp_action == KEXEC_CRASH_HP_REMOVE_MEMORY) {
>>>            base_addr = PFN_PHYS(mn->start_pfn);
>>>            size = mn->nr_pages * PAGE_SIZE;
>>> -        ret = remove_mem_range(&cmem, base_addr, size);
>>> +        ret = remove_mem_range(cmem, base_addr, size);
>> I like the overall design for handling crashkernel memory exclusion
>> in this patch series, especially the way you managed to free the
>> crash_mem object (mem) in the generic code (crash_prepare_elf64_headers()).
> Thanks for the review.
>
>> However, the way crash memory is prepared after a memory hotplug
>> event on powerpc by calling remove_mem_range(), can leave the crash
>> memory ranges unsorted. This can cause issues in the generic code
>> when excluding crashkernel memory, because crash_exclude_mem_range()
>> expects crash_mem to be sorted.
> You are absolutely correct.
>
>> So I wrote a simple patch to cover this scenario. Including the
>> patch below as the first patch in this series would be helpful.
>> https://lore.kernel.org/all/20260210120803.433978-1-sourabhjain@linux.ibm.com/
> Thanks for the additional patch. I'll add it as the first patch in the
> next revision to ensure crash_mem remains sorted after memory hotplug
> events on powerpc.

Thanks you.

Please use the latest version (v2) available here:
https://lore.kernel.org/all/20260212060159.733023-1-sourabhjain@linux.ibm.com/

Regards,
Sourabh Jain


