Return-Path: <linuxppc-dev+bounces-17394-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SLzKOgCuoWk3vgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17394-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 15:45:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BAE1B92A3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 15:45:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMrhs4LlBz3c8s;
	Sat, 28 Feb 2026 01:45:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772203517;
	cv=none; b=M06I8Sb2k5BiwlJsOhCJtgOD1R6+u5/xRBNNIBddAPU5PAXZ1BlFgTOMcn2UqVOdEWTV4afEQNpqQT/SzRF+dlV4iyVPH4UkYqKLB412//IWHsvCmo8+2wCkZlX/52YUWg5/fiZiUAcPqqCgxUFHeeF/y8DwnKotNhFeC49bOviKee2un/3IOWcOCy7CEaKF+VG0FlWNHm0xb4dPHBhYIBcQfpE69vRUEcxYfWlGPCk2VoXnT+cX7vyLfI3p3oTjt0tE1D5kKW5Ph/o04n4g5VR14tTE2kVf86suR4mEe7ICF+xPWYLVYikrkyjJUUJYS983u+dzF3MILE8yRucnzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772203517; c=relaxed/relaxed;
	bh=vv6I0ky+vPPs0At65EIiqJlz5ngSThX4t8eVUQua22s=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=G+K6voIj/e2ce80bqpg1E2XbqbBTiAZ7XzfCNnOYxlV88oNwQKy7mcUTuSERzswGFkeskCJK7zsC0Qpa2eOx3tofapIBOuP7cjGiOV7CHUZVPkbos3cavST5GKwuwkOzWbw8ZoiaB2xVT35rJ+w0jjKieYxva+P3XxeoBpn2IzRyXiw7FbqpBchxlmEf5Qh/uo9KusP0ssLoNB0mAhRBqFi5O6lbXyEiMRI145PV9K1PdZsZ3MSL5iA9VnkYn7k8YKYXjOr1rxqXUVmQBzqIm2h4OU14D/WuSuu2wNcKJjOjbSR/359dTRMGialuFp/CiUEwPBUwfh6Oqslm8AFQ2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pkitHSgw; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pkitHSgw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMrhr3sJzz3c8f
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 01:45:16 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61RCCXLK2582842;
	Fri, 27 Feb 2026 14:44:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=vv6I0k
	y+vPPs0At65EIiqJlz5ngSThX4t8eVUQua22s=; b=pkitHSgwPEC4BLFFExJyoN
	frl47XfH3xBEp9RlR6L9JmpQyI0aTZKXwXaYirvFpzvhJONWIjBryT8H3DL/KKUT
	I9wpjg//ptjJ8eeL0zwKUAXTwZcTycm9mkNH5Nf3Dr+45kbYM5xrogfyzjRwuPYx
	/jvOxj9+yxZUyVHcL7/336/x2EKtEIGgaciXWCpYqbdJ9xU4Z2/gNvcWo83SOUNL
	fYXzL7vIMiAqlthTKV+NTKYv9vhmb2qWVkuIA28obOVMZTHAWki/4VPl0WCjQ14D
	7cKVMuY8dLVfR33+XEbVkptJphb1HZolSmeMl+GlMoayC0f6Xrun8wGqtcWSohxw
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4cf24gvchh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 14:44:20 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 61RB1Y5V030414;
	Fri, 27 Feb 2026 14:44:19 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4cfrhktjbb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Feb 2026 14:44:18 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 61REiErm40894766
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Feb 2026 14:44:15 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CE00B20043;
	Fri, 27 Feb 2026 14:44:14 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F9C520040;
	Fri, 27 Feb 2026 14:43:57 +0000 (GMT)
Received: from [9.124.211.61] (unknown [9.124.211.61])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Feb 2026 14:43:57 +0000 (GMT)
Message-ID: <19cf18b5-362d-4ff2-8b85-e2e72809250c@linux.ibm.com>
Date: Fri, 27 Feb 2026 20:13:56 +0530
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
Subject: Re: [PATCH v7 3/5] crash: Use crash_exclude_core_ranges() on powerpc
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net,
        skhan@linuxfoundation.org, catalin.marinas@arm.com, will@kernel.org,
        chenhuacai@kernel.org, kernel@xen0n.name, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, chleroy@kernel.org,
        pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
        alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, hpa@zytor.com, robh@kernel.org,
        saravanak@kernel.org, akpm@linux-foundation.org, bhe@redhat.com,
        vgoyal@redhat.com, dyoung@redhat.com, pmladek@suse.com,
        rdunlap@infradead.org, dapeng1.mi@linux.intel.com, kees@kernel.org,
        paulmck@kernel.org, lirongqing@baidu.com, arnd@arndb.de,
        rppt@kernel.org, ardb@kernel.org, leitao@debian.org, jbohac@suse.cz,
        cfsworks@gmail.com, ryan.roberts@arm.com, tangyouling@kylinos.cn,
        ritesh.list@gmail.com, hbathini@linux.ibm.com, eajames@linux.ibm.com,
        songshuaishuai@tinylab.org, samuel.holland@sifive.com,
        kevin.brodsky@arm.com, vishal.moola@gmail.com,
        junhui.liu@pigmoral.tech, coxu@redhat.com, liaoyuanhong@vivo.com,
        brgerst@gmail.com, fuqiang.wang@easystack.cn, x86@kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, kexec@lists.infradead.org
References: <20260226130437.1867658-1-ruanjinjie@huawei.com>
 <20260226130437.1867658-4-ruanjinjie@huawei.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20260226130437.1867658-4-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Authority-Analysis: v=2.4 cv=TNRIilla c=1 sm=1 tr=0 ts=69a1adc4 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=i0EeH86SAAAA:8 a=FCicKRf1_97IgsoL-ogA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: udSiOUEwTIGg3568z9G18Y-U7dmzZ22v
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDEzMCBTYWx0ZWRfX+rwqwLNyDm+7
 Kajbzb/4AHH4a0DSb/UEdBx/rv6XBUQzSiid96euM8aA0Q6jzFDbCjQS4cfoJG/lcTutc53Mwb8
 J1Yn/mbs+LpLsBVigvCFaUEB9UelGkME6/WqhQahftj0wGt8YxBmcWeNiTuwUzZ7m/dhUdzCdkP
 jJlr6L/ZKn+tNqQ8wy32A8WWTz0FKbZJhOgWkkfCwa0eZhHM7zbnX7NTxrAReQR1OEYFtMyX8fS
 4mNzZB9aItG7Ksf1TukqcucNtKxQKiED5xIA5TMIce+USq1bXaJjT9y9zUtR5UCZbexVNoTt1fd
 yDQjKAFfSMEaNjD74DlnFHPvy5L5dSXcfaPBuMQdrpKq7JW1HnWvIrE0uDcQHj5xsLRezCSwIzm
 hiaRXveMvDdCSFq6eMKazmG6c8NOSzaWZFJtbzLan6djpFtrVRINIHqqiG7kScpI+m+rrUi38pC
 HpLRaUjj93ZBhUOqE0g==
X-Proofpoint-ORIG-GUID: RLOZoEp-Mbkrhtnbi26juVMkAhb1FcWs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_02,2026-02-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1011 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602270130
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ibm.com,none];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[ibm.com:s=pp1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17394-lists,linuxppc-dev=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns,linux.ibm.com:mid];
	FREEMAIL_TO(0.00)[huawei.com,lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,suse.com,infradead.org,baidu.com,arndb.de,debian.org,suse.cz,kylinos.cn,tinylab.org,sifive.com,pigmoral.tech,vivo.com,easystack.cn,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:robh@kernel.org,m:saravanak@kernel.org,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:pmladek@suse.com,m:rdunlap@infradead.org,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:paulmck@kernel.org,m:lirongqing@baidu.com,m:arnd@arndb.de,m:rppt@kernel.org,m:ardb@kernel.org,m:leitao@debian.org,m:jbohac@suse.cz,m:cfsworks@gmail.com,m:ryan.roberts@arm.com,m:tangyouling@kylinos.cn,m:ritesh.list@gmail.com,m:hbathini@linux.ibm.com,m:eajames@linux.ibm.com,m:songshuaishuai@tinylab.org,m:samuel.holland@sifive.com,m:kevin.
 brodsky@arm.com,m:vishal.moola@gmail.com,m:junhui.liu@pigmoral.tech,m:coxu@redhat.com,m:liaoyuanhong@vivo.com,m:brgerst@gmail.com,m:fuqiang.wang@easystack.cn,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:devicetree@vger.kernel.org,m:kexec@lists.infradead.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ibm.com:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[sourabhjain@linux.ibm.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[61];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 14BAE1B92A3
X-Rspamd-Action: no action



On 26/02/26 18:34, Jinjie Ruan wrote:
> The crash memory exclude of crashk_res and crashk_cma memory on powerpc
> are almost identical to the generic crash_exclude_core_ranges().
>
> By introducing the architecture-specific arch_crash_exclude_mem_range()
> function with a default implementation of crash_exclude_mem_range(),
> and using crash_exclude_mem_range_guarded as powerpc's separate
> implementation, the generic crash_exclude_core_ranges() helper function
> can be reused.
>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>   arch/powerpc/kexec/ranges.c | 16 ++++------------
>   include/linux/crash_core.h  |  4 ++++
>   kernel/crash_core.c         | 19 +++++++++++++------
>   3 files changed, 21 insertions(+), 18 deletions(-)
>
> diff --git a/arch/powerpc/kexec/ranges.c b/arch/powerpc/kexec/ranges.c
> index 6c58bcc3e130..e5fea23b191b 100644
> --- a/arch/powerpc/kexec/ranges.c
> +++ b/arch/powerpc/kexec/ranges.c
> @@ -553,9 +553,9 @@ int get_usable_memory_ranges(struct crash_mem **mem_ranges)
>   #endif /* CONFIG_KEXEC_FILE */
>   
>   #ifdef CONFIG_CRASH_DUMP
> -int crash_exclude_mem_range_guarded(struct crash_mem **mem_ranges,
> -					   unsigned long long mstart,
> -					   unsigned long long mend)
> +int arch_crash_exclude_mem_range(struct crash_mem **mem_ranges,
> +				 unsigned long long mstart,
> +				 unsigned long long mend)
>   {
>   	struct crash_mem *tmem = *mem_ranges;

update_crash_elfcorehdr() in arch/powerpc/kexec/crash.c still calls
crash_exclude_mem_range_guarded(), causing a build failure. ld: 
arch/powerpc/kexec/crash.o: in function `update_crash_elfcorehdr': 
/root/linux/arch/powerpc/kexec/crash.c:454: undefined reference to 
`crash_exclude_mem_range_guarded' To fix this: diff --git 
a/arch/powerpc/kexec/crash.c b/arch/powerpc/kexec/crash.c index 
898742a5205c..e59e909c369d 100644 --- a/arch/powerpc/kexec/crash.c +++ 
b/arch/powerpc/kexec/crash.c @@ -451,7 +451,7 @@ static void 
update_crash_elfcorehdr(struct kimage *image, struct memory_notify * 
base_addr = PFN_PHYS(mn->start_pfn); size = mn->nr_pages * PAGE_SIZE; 
end = base_addr + size - 1; - ret = 
crash_exclude_mem_range_guarded(&cmem, base_addr, end); + ret = 
arch_crash_exclude_mem_range(&cmem, base_addr, end); if (ret) { 
pr_err("Failed to remove hot-unplugged memory from crash memory 
ranges\n"); goto out; With the above change included, things are working 
fine on powerpc.


>   
> @@ -604,18 +604,10 @@ int get_crash_memory_ranges(struct crash_mem **mem_ranges)
>   			sort_memory_ranges(*mem_ranges, true);
>   	}
>   
> -	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range_guarded(mem_ranges, crashk_res.start, crashk_res.end);
> +	ret = crash_exclude_core_ranges(mem_ranges);
>   	if (ret)
>   		goto out;
>   
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
> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> index 033b20204aca..dbec826dc53b 100644
> --- a/include/linux/crash_core.h
> +++ b/include/linux/crash_core.h
> @@ -68,6 +68,7 @@ extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_ma
>   				       void **addr, unsigned long *sz);
>   extern int crash_prepare_headers(int need_kernel_map, void **addr,
>   				 unsigned long *sz, unsigned long *nr_mem_ranges);
> +extern int crash_exclude_core_ranges(struct crash_mem **cmem);
>   
>   struct kimage;
>   struct kexec_segment;
> @@ -88,6 +89,9 @@ extern int kimage_crash_copy_vmcoreinfo(struct kimage *image);
>   extern unsigned int arch_get_system_nr_ranges(void);
>   extern int arch_crash_populate_cmem(struct crash_mem *cmem);
>   extern int arch_crash_exclude_ranges(struct crash_mem *cmem);
> +extern int arch_crash_exclude_mem_range(struct crash_mem **mem,
> +					unsigned long long mstart,
> +					unsigned long long mend);
>   
>   #else /* !CONFIG_CRASH_DUMP*/
>   struct pt_regs;
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 96a96e511f5a..300d44ad5471 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -287,24 +287,31 @@ unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
>   int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
>   int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
>   
> -static int crash_exclude_core_ranges(struct crash_mem *cmem)
> +int __weak arch_crash_exclude_mem_range(struct crash_mem **mem,
> +					unsigned long long mstart,
> +					unsigned long long mend)
> +{
> +	return crash_exclude_mem_range(*mem, mstart, mend);
> +}
> +
> +int crash_exclude_core_ranges(struct crash_mem **cmem)
>   {
>   	int ret, i;
>   
>   	/* Exclude crashkernel region */
> -	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> +	ret = arch_crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
>   	if (ret)
>   		return ret;
>   
>   	if (crashk_low_res.end) {
> -		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
> +		ret = arch_crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
>   		if (ret)
>   			return ret;
>   	}
>   
>   	for (i = 0; i < crashk_cma_cnt; ++i) {
> -		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
> -					      crashk_cma_ranges[i].end);
> +		ret = arch_crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
> +						   crashk_cma_ranges[i].end);
>   		if (ret)
>   			return ret;
>   	}
> @@ -331,7 +338,7 @@ int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
>   	if (ret)
>   		goto out;
>   
> -	ret = crash_exclude_core_ranges(cmem);
> +	ret = crash_exclude_core_ranges(&cmem);
>   	if (ret)
>   		goto out;
>   


