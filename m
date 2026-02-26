Return-Path: <linuxppc-dev+bounces-17268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8JvcCu89oGmrhAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17268-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 13:34:55 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FA31A5BDA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 13:34:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM9h22ZhDz2yLH;
	Thu, 26 Feb 2026 23:27:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772098203;
	cv=none; b=C5YHRHldMKdF2FcmpH/vGMkPikpO7XsPUPYQw0vu3i1D3n4YjdxmNVzqPVqvR1mTKR9yH0AKRsupXOADa+49NqzEzBQhQWIYFVqyXf+Kjsd83/J96Ivc8GjoLvT9Dgc8Dn+vv80NOA3bfK6+YoXQQau6kcIg1j71fvYKg12TIjQJpjYzvG/LzZQxidOf3dFdX40+sD1UjLBhm5ZicYSPNB303qDr/sVBw5b0LQfHzPh0FRdO+QDDbPUptwgrA4OwAFSh57EhofVly068GKbiIWQWNrDbtlKizeV2EI5MX/D8zWGo26bJCXrAsHqRQn5CARooFmJLPYDbtILd8qYFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772098203; c=relaxed/relaxed;
	bh=+I+poEL35iYy1mghbWB0U8uu1TkaRyrjnf+pURuPgI4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Bhjz8pMhw3zJtDeziChabx6ytH+QHv2byFxixDmuKCK4f066DmXzglqKvC2OrgDGRSMebLEXAq5P564Xnwdo2X6N6f6y8aUuHVfdTmKw8uK/6lc5V2DBUjknzqwzM3NWFuvIzKkMsqNYzbWTYS3KmjcQeZ+GoUlcqIgHAlRq8gFaZU/Pzqy+dwPndZ6i0t5cek1DLq25q9q13O1GSU5oQeldxQ5zMoyQlbHLfsYMu+bCkwRMcVJ46q2Ji0iEVfJz58hYat0NfY0Jts9gJr6jMdFKpAUPB8Zai35Hxgtqzv5bh+xSj3PTWsnRr7J6ZqLP+ZOT0FCgyvC3jtIQq/mVog==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A+CYHjPf; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A+CYHjPf; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A+CYHjPf;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=A+CYHjPf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM5lZ1LLJz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 20:30:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772098197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+I+poEL35iYy1mghbWB0U8uu1TkaRyrjnf+pURuPgI4=;
	b=A+CYHjPfRd8V4yTTvvU83gmmWfV3x5EUnvO9+ASiF8qBn7PXjqswEXQLoqDGNpyp9hDGnj
	DfhBhu6BQdwvSnt7+I+iKQYTRPcwjtRlxtRFkmN3bQlNtQRtUNzoIHa/Cajq6rN2GtJCGn
	VaSDqM/gFAqAZEBnciIHpIoTL21jVVE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772098197;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+I+poEL35iYy1mghbWB0U8uu1TkaRyrjnf+pURuPgI4=;
	b=A+CYHjPfRd8V4yTTvvU83gmmWfV3x5EUnvO9+ASiF8qBn7PXjqswEXQLoqDGNpyp9hDGnj
	DfhBhu6BQdwvSnt7+I+iKQYTRPcwjtRlxtRFkmN3bQlNtQRtUNzoIHa/Cajq6rN2GtJCGn
	VaSDqM/gFAqAZEBnciIHpIoTL21jVVE=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-114-yvMo5ZMuMEuMU7_rForQMA-1; Thu,
 26 Feb 2026 04:29:52 -0500
X-MC-Unique: yvMo5ZMuMEuMU7_rForQMA-1
X-Mimecast-MFC-AGG-ID: yvMo5ZMuMEuMU7_rForQMA_1772098186
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C03861956089;
	Thu, 26 Feb 2026 09:29:42 +0000 (UTC)
Received: from localhost (unknown [10.72.112.101])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 816C61800465;
	Thu, 26 Feb 2026 09:29:37 +0000 (UTC)
Date: Thu, 26 Feb 2026 17:29:26 +0800
From: Baoquan He <bhe@redhat.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, catalin.marinas@arm.com,
	will@kernel.org, chenhuacai@kernel.org, kernel@xen0n.name,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, alex@ghiti.fr, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	hpa@zytor.com, akpm@linux-foundation.org, vgoyal@redhat.com,
	dyoung@redhat.com, rdunlap@infradead.org, pmladek@suse.com,
	dapeng1.mi@linux.intel.com, kees@kernel.org, paulmck@kernel.org,
	lirongqing@baidu.com, arnd@arndb.de, ardb@kernel.org,
	leitao@debian.org, rppt@kernel.org, cfsworks@gmail.com,
	ryan.roberts@arm.com, sourabhjain@linux.ibm.com,
	tangyouling@kylinos.cn, eajames@linux.ibm.com,
	hbathini@linux.ibm.com, ritesh.list@gmail.com,
	songshuaishuai@tinylab.org, samuel.holland@sifive.com,
	kevin.brodsky@arm.com, vishal.moola@gmail.com,
	junhui.liu@pigmoral.tech, coxu@redhat.com, liaoyuanhong@vivo.com,
	fuqiang.wang@easystack.cn, jbohac@suse.cz, brgerst@gmail.com,
	x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Subject: Re: [PATCH v6 2/5] crash: Exclude crash kernel memory in crash core
Message-ID: <aaASdtAQk6ZvIK-M@MiWiFi-R3L-srv>
References: <20260224085342.387996-1-ruanjinjie@huawei.com>
 <20260224085342.387996-3-ruanjinjie@huawei.com>
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
In-Reply-To: <20260224085342.387996-3-ruanjinjie@huawei.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: evtUy_do98x3CGPAOlfFdPnSVNSh_KfjSBtB7j48yIM_1772098186
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Flag: YES
X-Spam-Status: Yes, score=3.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,RCVD_IN_SBL_CSS,SPF_HELO_PASS,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Report: 
	* -0.0 SPF_PASS SPF: sender matches SPF record
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
	*      envelope-from domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
	*       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  3.6 RCVD_IN_SBL_CSS RBL: Received via a relay in Spamhaus SBL-CSS
	*      [54.186.198.63 listed in zen.spamhaus.org]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/, no
	*      trust
	*      [170.10.133.124 listed in list.dnswl.org]
	*  0.0 RCVD_IN_MSPIKE_H5 RBL: Excellent reputation (+5)
	*      [170.10.133.124 listed in wl.mailspike.net]
	*  0.0 RCVD_IN_MSPIKE_WL Mailspike good senders
	* -0.0 DKIMWL_WL_HIGH DKIMwl.org - High trust sender
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [4.79 / 15.00];
	SPAM_FLAG(5.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17268-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:rdunlap@infradead.org,m:pmladek@suse.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:paulmck@kernel.org,m:lirongqing@baidu.com,m:arnd@arndb.de,m:ardb@kernel.org,m:leitao@debian.org,m:rppt@kernel.org,m:cfsworks@gmail.com,m:ryan.roberts@arm.com,m:sourabhjain@linux.ibm.com,m:tangyouling@kylinos.cn,m:eajames@linux.ibm.com,m:hbathini@linux.ibm.com,m:ritesh.list@gmail.com,m:songshuaishuai@tinylab.org,m:samuel.holland@sifive.com,m:kevin.brodsky@arm.com,m:vishal.moola@gmail.com,m:junh
 ui.liu@pigmoral.tech,m:coxu@redhat.com,m:liaoyuanhong@vivo.com,m:fuqiang.wang@easystack.cn,m:jbohac@suse.cz,m:brgerst@gmail.com,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kexec@lists.infradead.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	GREYLIST(0.00)[pass,body];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[bhe@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[58];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[bhe@redhat.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FREEMAIL_CC(0.00)[lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,suse.com,baidu.com,arndb.de,debian.org,kylinos.cn,tinylab.org,sifive.com,pigmoral.tech,vivo.com,easystack.cn,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	NEURAL_SPAM(0.00)[0.990];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: C6FA31A5BDA
X-Rspamd-Action: no action

On 02/24/26 at 04:53pm, Jinjie Ruan wrote:
> The crash memory alloc, and the exclude of crashk_res, crashk_low_res
> and crashk_cma memory are almost identical across different architectures,
> handling them in the crash core would eliminate a lot of duplication, so
> do them in the common code.
> 
> To achieve the above goal, three architecture-specific functions are
> introduced:
> 
> - arch_get_system_nr_ranges(). Pre-counts the max number of memory ranges.
> 
> - arch_crash_populate_cmem(). Collects the memory ranges and fills them
>   into cmem.
> 
> - arch_crash_exclude_ranges(). Architecture's additional crash memory
>   ranges exclusion, defaulting to empty.
> 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  arch/arm64/kernel/machine_kexec_file.c     | 39 +++-------
>  arch/loongarch/kernel/machine_kexec_file.c | 39 +++-------
>  arch/riscv/kernel/machine_kexec_file.c     | 38 +++------
>  arch/x86/kernel/crash.c                    | 89 +++-------------------
>  include/linux/crash_core.h                 |  5 ++
>  kernel/crash_core.c                        | 82 +++++++++++++++++++-
>  6 files changed, 132 insertions(+), 160 deletions(-)

LGTM,

Acked-by: Baoquan He <bhe@redhat.com>

> 
> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
> index fba260ad87a9..c338506a580b 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -40,23 +40,23 @@ int arch_kimage_file_post_load_cleanup(struct kimage *image)
>  }
>  
>  #ifdef CONFIG_CRASH_DUMP
> -static int prepare_elf_headers(void **addr, unsigned long *sz)
> +unsigned int arch_get_system_nr_ranges(void)
>  {
> -	struct crash_mem *cmem;
> -	unsigned int nr_ranges;
> -	int ret;
> -	u64 i;
> +	unsigned int nr_ranges = 2; /* for exclusion of crashkernel region */
>  	phys_addr_t start, end;
> +	u64 i;
>  
> -	nr_ranges = 2; /* for exclusion of crashkernel region */
>  	for_each_mem_range(i, &start, &end)
>  		nr_ranges++;
>  
> -	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
> -	if (!cmem)
> -		return -ENOMEM;
> +	return nr_ranges;
> +}
> +
> +int arch_crash_populate_cmem(struct crash_mem *cmem)
> +{
> +	phys_addr_t start, end;
> +	u64 i;
>  
> -	cmem->max_nr_ranges = nr_ranges;
>  	cmem->nr_ranges = 0;
>  	for_each_mem_range(i, &start, &end) {
>  		cmem->ranges[cmem->nr_ranges].start = start;
> @@ -64,22 +64,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>  		cmem->nr_ranges++;
>  	}
>  
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
> +	return 0;
>  }
>  #endif
>  
> @@ -109,7 +94,7 @@ int load_other_segments(struct kimage *image,
>  	void *headers;
>  	unsigned long headers_sz;
>  	if (image->type == KEXEC_TYPE_CRASH) {
> -		ret = prepare_elf_headers(&headers, &headers_sz);
> +		ret = crash_prepare_headers(true, &headers, &headers_sz, NULL);
>  		if (ret) {
>  			pr_err("Preparing elf core header failed\n");
>  			goto out_err;
> diff --git a/arch/loongarch/kernel/machine_kexec_file.c b/arch/loongarch/kernel/machine_kexec_file.c
> index 5584b798ba46..4b318a94b564 100644
> --- a/arch/loongarch/kernel/machine_kexec_file.c
> +++ b/arch/loongarch/kernel/machine_kexec_file.c
> @@ -56,23 +56,23 @@ static void cmdline_add_initrd(struct kimage *image, unsigned long *cmdline_tmpl
>  }
>  
>  #ifdef CONFIG_CRASH_DUMP
> -
> -static int prepare_elf_headers(void **addr, unsigned long *sz)
> +unsigned int arch_get_system_nr_ranges(void)
>  {
> -	int ret, nr_ranges;
> -	uint64_t i;
> +	int nr_ranges = 2; /* for exclusion of crashkernel region */
>  	phys_addr_t start, end;
> -	struct crash_mem *cmem;
> +	uint64_t i;
>  
> -	nr_ranges = 2; /* for exclusion of crashkernel region */
>  	for_each_mem_range(i, &start, &end)
>  		nr_ranges++;
>  
> -	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
> -	if (!cmem)
> -		return -ENOMEM;
> +	return nr_ranges;
> +}
> +
> +int arch_crash_populate_cmem(struct crash_mem *cmem)
> +{
> +	phys_addr_t start, end;
> +	uint64_t i;
>  
> -	cmem->max_nr_ranges = nr_ranges;
>  	cmem->nr_ranges = 0;
>  	for_each_mem_range(i, &start, &end) {
>  		cmem->ranges[cmem->nr_ranges].start = start;
> @@ -80,22 +80,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>  		cmem->nr_ranges++;
>  	}
>  
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
> +	return 0;
>  }
>  
>  /*
> @@ -163,7 +148,7 @@ int load_other_segments(struct kimage *image,
>  		void *headers;
>  		unsigned long headers_sz;
>  
> -		ret = prepare_elf_headers(&headers, &headers_sz);
> +		ret = crash_prepare_headers(true, &headers, &headers_sz, NULL);
>  		if (ret < 0) {
>  			pr_err("Preparing elf core header failed\n");
>  			goto out_err;
> diff --git a/arch/riscv/kernel/machine_kexec_file.c b/arch/riscv/kernel/machine_kexec_file.c
> index 54e2d9552e93..d0e331d87155 100644
> --- a/arch/riscv/kernel/machine_kexec_file.c
> +++ b/arch/riscv/kernel/machine_kexec_file.c
> @@ -44,6 +44,15 @@ static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
>  	return 0;
>  }
>  
> +unsigned int arch_get_system_nr_ranges(void)
> +{
> +	unsigned int nr_ranges = 1; /* For exclusion of crashkernel region */
> +
> +	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
> +
> +	return nr_ranges;
> +}
> +
>  static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
>  {
>  	struct crash_mem *cmem = arg;
> @@ -55,33 +64,10 @@ static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
>  	return 0;
>  }
>  
> -static int prepare_elf_headers(void **addr, unsigned long *sz)
> +int arch_crash_populate_cmem(struct crash_mem *cmem)
>  {
> -	struct crash_mem *cmem;
> -	unsigned int nr_ranges;
> -	int ret;
> -
> -	nr_ranges = 1; /* For exclusion of crashkernel region */
> -	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
> -
> -	cmem = kmalloc_flex(*cmem, ranges, nr_ranges);
> -	if (!cmem)
> -		return -ENOMEM;
> -
> -	cmem->max_nr_ranges = nr_ranges;
>  	cmem->nr_ranges = 0;
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
>  }
>  
>  static char *setup_kdump_cmdline(struct kimage *image, char *cmdline,
> @@ -273,7 +259,7 @@ int load_extra_segments(struct kimage *image, unsigned long kernel_start,
>  	if (image->type == KEXEC_TYPE_CRASH) {
>  		void *headers;
>  		unsigned long headers_sz;
> -		ret = prepare_elf_headers(&headers, &headers_sz);
> +		ret = crash_prepare_headers(true, &headers, &headers_sz, NULL);
>  		if (ret) {
>  			pr_err("Preparing elf core header failed\n");
>  			goto out;
> diff --git a/arch/x86/kernel/crash.c b/arch/x86/kernel/crash.c
> index 335fd2ee9766..3ad3f8b758a4 100644
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -152,16 +152,8 @@ static int get_nr_ram_ranges_callback(struct resource *res, void *arg)
>  	return 0;
>  }
>  
> -/* Gather all the required information to prepare elf headers for ram regions */
> -static struct crash_mem *fill_up_crash_elf_data(void)
> +unsigned int arch_get_system_nr_ranges(void)
>  {
> -	unsigned int nr_ranges = 0;
> -	struct crash_mem *cmem;
> -
> -	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
> -	if (!nr_ranges)
> -		return NULL;
> -
>  	/*
>  	 * Exclusion of crash region, crashk_low_res and/or crashk_cma_ranges
>  	 * may cause range splits. So add extra slots here.
> @@ -176,49 +168,16 @@ static struct crash_mem *fill_up_crash_elf_data(void)
>  	 * But in order to lest the low 1M could be changed in the future,
>  	 * (e.g. [start, 1M]), add a extra slot.
>  	 */
> -	nr_ranges += 3 + crashk_cma_cnt;
> -	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
> -	if (!cmem)
> -		return NULL;
> -
> -	cmem->max_nr_ranges = nr_ranges;
> +	unsigned int nr_ranges = 3 + crashk_cma_cnt;
>  
> -	return cmem;
> +	walk_system_ram_res(0, -1, &nr_ranges, get_nr_ram_ranges_callback);
> +	return nr_ranges;
>  }
>  
> -/*
> - * Look for any unwanted ranges between mstart, mend and remove them. This
> - * might lead to split and split ranges are put in cmem->ranges[] array
> - */
> -static int elf_header_exclude_ranges(struct crash_mem *cmem)
> +int arch_crash_exclude_ranges(struct crash_mem *cmem)
>  {
> -	int ret = 0;
> -	int i;
> -
>  	/* Exclude the low 1M because it is always reserved */
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
> -
> -	return 0;
> +	return crash_exclude_mem_range(cmem, 0, SZ_1M - 1);
>  }
>  
>  static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
> @@ -232,35 +191,9 @@ static int prepare_elf64_ram_headers_callback(struct resource *res, void *arg)
>  	return 0;
>  }
>  
> -/* Prepare elf headers. Return addr and size */
> -static int prepare_elf_headers(void **addr, unsigned long *sz,
> -			       unsigned long *nr_mem_ranges)
> +int arch_crash_populate_cmem(struct crash_mem *cmem)
>  {
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
>  }
>  #endif
>  
> @@ -418,7 +351,8 @@ int crash_load_segments(struct kimage *image)
>  				  .buf_max = ULONG_MAX, .top_down = false };
>  
>  	/* Prepare elf headers and add a segment */
> -	ret = prepare_elf_headers(&kbuf.buffer, &kbuf.bufsz, &pnum);
> +	ret = crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &kbuf.buffer,
> +				    &kbuf.bufsz, &pnum);
>  	if (ret)
>  		return ret;
>  
> @@ -529,7 +463,8 @@ void arch_crash_handle_hotplug_event(struct kimage *image, void *arg)
>  	 * Create the new elfcorehdr reflecting the changes to CPU and/or
>  	 * memory resources.
>  	 */
> -	if (prepare_elf_headers(&elfbuf, &elfsz, &nr_mem_ranges)) {
> +	if (crash_prepare_headers(IS_ENABLED(CONFIG_X86_64), &elfbuf, &elfsz,
> +				  &nr_mem_ranges)) {
>  		pr_err("unable to create new elfcorehdr");
>  		goto out;
>  	}
> diff --git a/include/linux/crash_core.h b/include/linux/crash_core.h
> index d35726d6a415..033b20204aca 100644
> --- a/include/linux/crash_core.h
> +++ b/include/linux/crash_core.h
> @@ -66,6 +66,8 @@ extern int crash_exclude_mem_range(struct crash_mem *mem,
>  				   unsigned long long mend);
>  extern int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>  				       void **addr, unsigned long *sz);
> +extern int crash_prepare_headers(int need_kernel_map, void **addr,
> +				 unsigned long *sz, unsigned long *nr_mem_ranges);
>  
>  struct kimage;
>  struct kexec_segment;
> @@ -83,6 +85,9 @@ int kexec_should_crash(struct task_struct *p);
>  int kexec_crash_loaded(void);
>  void crash_save_cpu(struct pt_regs *regs, int cpu);
>  extern int kimage_crash_copy_vmcoreinfo(struct kimage *image);
> +extern unsigned int arch_get_system_nr_ranges(void);
> +extern int arch_crash_populate_cmem(struct crash_mem *cmem);
> +extern int arch_crash_exclude_ranges(struct crash_mem *cmem);
>  
>  #else /* !CONFIG_CRASH_DUMP*/
>  struct pt_regs;
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 2c1a3791e410..96a96e511f5a 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -170,9 +170,6 @@ static inline resource_size_t crash_resource_size(const struct resource *res)
>  	return !res->end ? 0 : resource_size(res);
>  }
>  
> -
> -
> -
>  int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>  			  void **addr, unsigned long *sz)
>  {
> @@ -274,6 +271,85 @@ int crash_prepare_elf64_headers(struct crash_mem *mem, int need_kernel_map,
>  	return 0;
>  }
>  
> +static struct crash_mem *alloc_cmem(unsigned int nr_ranges)
> +{
> +	struct crash_mem *cmem;
> +
> +	cmem = kvzalloc_flex(*cmem, ranges, nr_ranges);
> +	if (!cmem)
> +		return NULL;
> +
> +	cmem->max_nr_ranges = nr_ranges;
> +	return cmem;
> +}
> +
> +unsigned int __weak arch_get_system_nr_ranges(void) { return 0; }
> +int __weak arch_crash_populate_cmem(struct crash_mem *cmem) { return -1; }
> +int __weak arch_crash_exclude_ranges(struct crash_mem *cmem) { return 0; }
> +
> +static int crash_exclude_core_ranges(struct crash_mem *cmem)
> +{
> +	int ret, i;
> +
> +	/* Exclude crashkernel region */
> +	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
> +	if (ret)
> +		return ret;
> +
> +	if (crashk_low_res.end) {
> +		ret = crash_exclude_mem_range(cmem, crashk_low_res.start, crashk_low_res.end);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (i = 0; i < crashk_cma_cnt; ++i) {
> +		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
> +					      crashk_cma_ranges[i].end);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +int crash_prepare_headers(int need_kernel_map, void **addr, unsigned long *sz,
> +			  unsigned long *nr_mem_ranges)
> +{
> +	unsigned int max_nr_ranges;
> +	struct crash_mem *cmem;
> +	int ret;
> +
> +	max_nr_ranges = arch_get_system_nr_ranges();
> +	if (!max_nr_ranges)
> +		return -ENOMEM;
> +
> +	cmem = alloc_cmem(max_nr_ranges);
> +	if (!cmem)
> +		return -ENOMEM;
> +
> +	ret = arch_crash_populate_cmem(cmem);
> +	if (ret)
> +		goto out;
> +
> +	ret = crash_exclude_core_ranges(cmem);
> +	if (ret)
> +		goto out;
> +
> +	ret = arch_crash_exclude_ranges(cmem);
> +	if (ret)
> +		goto out;
> +
> +	/* Return the computed number of memory ranges, for hotplug usage */
> +	if (nr_mem_ranges)
> +		*nr_mem_ranges = cmem->nr_ranges;
> +
> +	ret = crash_prepare_elf64_headers(cmem, need_kernel_map, addr, sz);
> +
> +out:
> +	kvfree(cmem);
> +	return ret;
> +}
> +
>  /**
>   * crash_exclude_mem_range - exclude a mem range for existing ranges
>   * @mem: mem->range contains an array of ranges sorted in ascending order
> -- 
> 2.34.1
> 


