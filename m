Return-Path: <linuxppc-dev+bounces-17138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIJ7DHZrnmnnVAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17138-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 04:24:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 904551912FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Feb 2026 04:24:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fLKhJ2cTVz3dK7;
	Wed, 25 Feb 2026 14:24:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::102e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771989872;
	cv=none; b=h+VNoOqPl5zFbO/6XTNkK6I7c3zz+Hz92U7GKj2/uQ7Ghv/h72yQqh1YDNI2XGfjxS1xqtUOXyz5A8LJSwjXSgt8VVjNnulLuhVDpwZQdwuUAmk85nTcEosHB0kiBzEpa2HbIZGkZd5WuERSvXCNtC87g6RBWvqQSZJ22CSTjz33r42Y4VAiYo6n249twIzIXDlSzTG2puwuqSHPaTVFGUw5qDEZRe3MstSII6fUzP+vYJPTsuqwmFlPgvzOOfgol6kRRxlWVxb7XcICArkcu4+l/PC62e65Jo6xyTdfR5utzss0Y9gAvL6ylt3xb87BZZVqAzX/+gl/fMHwH2fH5w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771989872; c=relaxed/relaxed;
	bh=2erXaSzxqouJYHAI7iQgk06x1aOTRy7Rez7nS+35Gsk=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References:
	 MIME-Version:Content-Type; b=mG5WkyiZpKhCUhynUqaPbxR6GJI5WKGRJTqtfLvwJd7tUWlwAE/oze5PRDHeeCR6/5zdH3vqFzPN2YZL7gAzV0ZNawsLOjmmLbk3WmgGXCc+sKHkF+jrQ1FtCPDYBIBRX+8YTdMS9Ns1/aPxfrfjhH66kiiHzoC7xJCP3muzuHYTgR7YI7cl3u2aP+DAX1JRWsSbIqJslef2FfHrm1NrfYOf042eneIwmRMX5ygbQ4RF+cL0QArm3Csr6oSBXmlU/O1xMJmo/DcIHO6u5TbnLWXVck9C7uO9x8nb//dwDV8ehZrEIDtLSxvkYJGAF96gATkNihi3UiuDa0Z1y8PMKg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ErQUt0Qn; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ErQUt0Qn;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fLKhH0Lzrz3dJg
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 14:24:30 +1100 (AEDT)
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-3562212b427so2567365a91.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Feb 2026 19:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771989867; x=1772594667; darn=lists.ozlabs.org;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=2erXaSzxqouJYHAI7iQgk06x1aOTRy7Rez7nS+35Gsk=;
        b=ErQUt0QnaSKUH/F+xHu82UYQBjeKhBdx/HgPNjVAVZdCjgpyPOYDtUcAXHJUFaO/UH
         cmtjp6pBLzleFa8Ozr56tu7lzy+9JIgQmEd//gAdSf2riVfnqJg4QfjLIBVfC9rHjXW4
         xX4P085D1rvsOu9IiRZR5wAUsFYBR3KceISDahJZKaoZFBGopu7kXmUyEBespLj0Cdo+
         uM3wQ7dhan807z7aA7oFMcjQWJU+wTbZY9eChQZK0DeWf9AW4z8QEM8qi7VHyg5R4FIl
         8Ua5KR7kt3y0x3SIB0cj+wF86e+UNBIBDwrqslpVYQywIglhye0UMrTgUMhfBgrAfQVw
         HA4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771989867; x=1772594667;
        h=mime-version:references:message-id:date:in-reply-to:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2erXaSzxqouJYHAI7iQgk06x1aOTRy7Rez7nS+35Gsk=;
        b=OjL/ua1KLFTjNgMyBmkzELmiR6fpUpTngbmkHjRZo8QdSb1+1sJcROTGT6keUVWVTE
         zfc+QQyzeBFdu5l/IVuqdqTVKA95URY7P6sKEZtY7L212Ro5mg4qFeX2ZdBvSEH73jMl
         xTX8cBN8s/AU1o+vIWrT3WQ/LLZ6LrgkJYOlTbXxxu5MkUoNFk9z2SteaW+Nb02W6ppE
         h+YTVDOR1t4VIn4a/yZMF+HdoYO1IVKooqtZdIVytGPrP8Tjruyr2wY1/AsaV5NjeFOp
         hrMOq8XKiZaljC7LEhrS4krKtjW/LUnWqcIeTty9eBCu0jH8+4khm3SCKjqfvK4SN7Pt
         5nTQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZeV/uGXPcvxWmEeeugbv4Ffq1rqIL0b6aMy1ACfS0V/dlUBQ7aYfBAlQ2SRA+rFnScRwfLENuSbT/ooM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyXndZDH1uNXxgTLAwT1s+0qfFKP6fNxCj8WqBYtRBozaKr6Mvn
	vCucgkIBA/Jy6RQGKFTk3Wq7sruqH0wXK8wi9f+aiAaklVHSzK1emzY7
X-Gm-Gg: ATEYQzw4NsKsKspowUZAshbRUnKqrq2XTxWbURGoOY/i0lUezkLcgAx343SXuh7zbaT
	8o8SnMq1LKarUBCBxTemWOYtY6N1X8FUxHi0lZfl+iSV1u5sEalDRF2C4jtQX+/kvK/I72IZ+cb
	4cIGBenP8kicwJl0+1HpuAqbiv5Ye5UuLAPQAahhP1jtsueHCsBsZq5X+k8UJduPu1NwE02ENsa
	lCrTUWNUWRPAMrGs9zUjYMbR26bsCcAt5gNgg+kxPHiioL/V2Wn4jyFyjH0oNjlsgIN17m7IA5n
	LrsCASuk7Q4RLkDgaXjQc/1UtFGV7+iDSsKG/19doo+AzayoOSgZ2+StypGE7cTIUOZKaE/19Br
	icm7eY+uDJnq2JL6Ewi3ahMIxlo802j1HRpQnL1wNint2nqM+1KW5wbe0n4yXRh4vjLbNo18l/S
	XsfZea4oECnxaJYNhQig==
X-Received: by 2002:a17:90b:2cc5:b0:356:35a5:4a64 with SMTP id 98e67ed59e1d1-358ae7c5003mr12522694a91.4.1771989867018;
        Tue, 24 Feb 2026 19:24:27 -0800 (PST)
Received: from dw-tp ([203.81.240.195])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359037afe31sm1092824a91.16.2026.02.24.19.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 19:24:26 -0800 (PST)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>, corbet@lwn.net, skhan@linuxfoundation.org, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, tglx@kernel.org, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, hpa@zytor.com, akpm@linux-foundation.org, 
	bhe@redhat.com, vgoyal@redhat.com, dyoung@redhat.com, rdunlap@infradead.org, 
	pmladek@suse.com, dapeng1.mi@linux.intel.com, kees@kernel.org, 
	paulmck@kernel.org, lirongqing@baidu.com, arnd@arndb.de, ardb@kernel.org, 
	leitao@debian.org, rppt@kernel.org, cfsworks@gmail.com, ryan.roberts@arm.com, 
	sourabhjain@linux.ibm.com, tangyouling@kylinos.cn, eajames@linux.ibm.com, 
	hbathini@linux.ibm.com, songshuaishuai@tinylab.org, samuel.holland@sifive.com, 
	kevin.brodsky@arm.com, vishal.moola@gmail.com, junhui.liu@pigmoral.tech, 
	coxu@redhat.com, liaoyuanhong@vivo.com, fuqiang.wang@easystack.cn, 
	jbohac@suse.cz, brgerst@gmail.com, x86@kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	linux-riscv@lists.infradead.org, kexec@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: Re: [PATCH v6 1/5] powerpc/crash: sort crash memory ranges before preparing elfcorehdr
In-Reply-To: <20260224085342.387996-2-ruanjinjie@huawei.com>
Date: Wed, 25 Feb 2026 08:45:56 +0530
Message-ID: <87wm01h5sj.ritesh.list@gmail.com>
References: <20260224085342.387996-1-ruanjinjie@huawei.com> <20260224085342.387996-2-ruanjinjie@huawei.com>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17138-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[huawei.com,lwn.net,linuxfoundation.org,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,gmail.com,dabbelt.com,eecs.berkeley.edu,ghiti.fr,redhat.com,alien8.de,linux.intel.com,zytor.com,linux-foundation.org,infradead.org,suse.com,baidu.com,arndb.de,debian.org,kylinos.cn,tinylab.org,sifive.com,pigmoral.tech,vivo.com,easystack.cn,suse.cz,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_SENDER(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruanjinjie@huawei.com,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:hpa@zytor.com,m:akpm@linux-foundation.org,m:bhe@redhat.com,m:vgoyal@redhat.com,m:dyoung@redhat.com,m:rdunlap@infradead.org,m:pmladek@suse.com,m:dapeng1.mi@linux.intel.com,m:kees@kernel.org,m:paulmck@kernel.org,m:lirongqing@baidu.com,m:arnd@arndb.de,m:ardb@kernel.org,m:leitao@debian.org,m:rppt@kernel.org,m:cfsworks@gmail.com,m:ryan.roberts@arm.com,m:sourabhjain@linux.ibm.com,m:tangyouling@kylinos.cn,m:eajames@linux.ibm.com,m:hbathini@linux.ibm.com,m:songshuaishuai@tinylab.org,m:samuel.holland@sifive.com,m:kevin.brodsky@arm.com,m:vishal.moola@gmail.com,m:junhui.liu@
 pigmoral.tech,m:coxu@redhat.com,m:liaoyuanhong@vivo.com,m:fuqiang.wang@easystack.cn,m:jbohac@suse.cz,m:brgerst@gmail.com,m:x86@kernel.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:kexec@lists.infradead.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MISSING_XM_UA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[59];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[riteshlist@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[huawei.com:email,ellerman.id.au:email]
X-Rspamd-Queue-Id: 904551912FB
X-Rspamd-Action: no action

Jinjie Ruan <ruanjinjie@huawei.com> writes:

> From: Sourabh Jain <sourabhjain@linux.ibm.com>
>
> During a memory hot-remove event, the elfcorehdr is rebuilt to exclude
> the removed memory. While updating the crash memory ranges for this
> operation, the crash memory ranges array can become unsorted. This
> happens because remove_mem_range() may split a memory range into two
> parts and append the higher-address part as a separate range at the end
> of the array.
>
> So far, no issues have been observed due to the unsorted crash memory
> ranges. However, this could lead to problems once crash memory range
> removal is handled by generic code, as introduced in the upcoming
> patches in this series.
>
> Currently, powerpc uses a platform-specific function,
> remove_mem_range(), to exclude hot-removed memory from the crash memory
> ranges. This function performs the same task as the generic
> crash_exclude_mem_range() in crash_core.c. The generic helper also
> ensures that the crash memory ranges remain sorted. So remove the
> redundant powerpc-specific implementation and instead call
> crash_exclude_mem_range_guarded() (which internally calls
> crash_exclude_mem_range()) to exclude the hot-removed memory ranges.
>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Jinjie Ruan <ruanjinjie@huawei.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: linux-kernel@vger.kernel.org
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>


I had gone through the generic implementation v/s the powerpc specific
remove_mem_range() implementation, when it was posted by Sourabh
separately. And it make sense to use the generic implementation in this
case, rather than keeping a duplicate powerpc specific version. So...

LGTM. Please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>


