Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 78DC921306A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 02:17:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49ybBP3NDfzDrC0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jul 2020 10:17:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1044;
 helo=mail-pj1-x1044.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=LSEdiF8O; dkim-atps=neutral
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com
 [IPv6:2607:f8b0:4864:20::1044])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yb8d126zzDr8t
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jul 2020 10:15:44 +1000 (AEST)
Received: by mail-pj1-x1044.google.com with SMTP id o22so8142684pjw.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Jul 2020 17:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=nuJRvdB0NXvVZz7pZcV4N1oDW2dnoBAuVAW0OAoXK2w=;
 b=LSEdiF8O8c0k36FJz+J/p1Xm+032fT22eON16GPFoOrZL6GDx9jPsHusIL7FEU0XAV
 lLDoHY9NSZfpcd5oNSgz7AXGqRLd1dfAW9ad86/buGeCa4uTE/vU9OPIKwfaZyBXfnsJ
 uG05dXYdVlfndLY83LDfB7lzK6ZqRQP5RvYyTLEoAscx9LtDbk1kTfrj/Cwbbvqz6uxW
 IUIYgXT0pd0DwhOqvL6wEv82lwldnFjq8WUAnvh0BthjGb+v++4h6R72lTgxl5Ir5SPV
 KaijBTzwUbf0D6ex6rU/rFRlvvyVHMSFetaS1LKZRTYt3D1mhdMNSiJCFStkUNFQKfnS
 w0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=nuJRvdB0NXvVZz7pZcV4N1oDW2dnoBAuVAW0OAoXK2w=;
 b=jbRu74ao4ABf15u0rUqmgrJVqgAjSopRFwbBodPZNJxEocZ1tWSA+ukHXQaZlXDfyH
 JLNgHRCwokHhN6daQoVU3w90kTOaOx/5wJ1Cmj0RL67XRVcnGh6LzVVWC63dEcmiiSeB
 LjUUPZNZayxUkI2HoyV8mJm36682rH+U6prbv8AWuDXrlmyt0exlilZDV85iIEqgc0Wk
 grHW67f0clQuTA3kciFvaFajhM6DQCZXKO/+ImDMGufrTkkqO3eHxFwqCnwtRCEPH/bN
 Y9zVDbl8I/cJXh2ODUuyGjOoFRQfsHD0ML3AFiXpWI92YhZtJNkczCb+0x2JdQqzDBt5
 ZQOQ==
X-Gm-Message-State: AOAM5314Aopbq0aa6ho8nF9KHH0o0ru4by8Rpy+rpIuG41DOfLqB+fuL
 obWMvLid0QoAZtoGadGZ9Yk=
X-Google-Smtp-Source: ABdhPJzVARbnUoiUECgH/rt6gF7oxr/jO/Or3UFnEeEEE5zO8Q2uC+eAackVR4Z456AOo0TJ+H99Rw==
X-Received: by 2002:a17:902:b78a:: with SMTP id
 e10mr28875186pls.34.1593735341316; 
 Thu, 02 Jul 2020 17:15:41 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id b11sm10202251pfr.179.2020.07.02.17.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jul 2020 17:15:40 -0700 (PDT)
Date: Fri, 03 Jul 2020 10:15:34 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/4] mm/vmalloc: Hugepage vmalloc mappings
To: linux-mm@kvack.org, Zefan Li <lizefan@huawei.com>
References: <20200413125303.423864-1-npiggin@gmail.com>
 <20200413125303.423864-5-npiggin@gmail.com>
 <d148f86c-b27b-63fb-31d2-35b8f52ec540@huawei.com>
In-Reply-To: <d148f86c-b27b-63fb-31d2-35b8f52ec540@huawei.com>
MIME-Version: 1.0
Message-Id: <1593735251.svr5r5cxle.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>,
 =?iso-8859-1?q?Borislav=0A?= Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>,
 =?iso-8859-1?q?Thomas=0A?= Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Zefan Li's message of July 1, 2020 5:10 pm:
>>  static void *__vmalloc_node(unsigned long size, unsigned long align,
>> -			    gfp_t gfp_mask, pgprot_t prot,
>> -			    int node, const void *caller);
>> +			gfp_t gfp_mask, pgprot_t prot, unsigned long vm_flags,
>> +			int node, const void *caller);
>>  static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mask=
,
>> -				 pgprot_t prot, int node)
>> +				 pgprot_t prot, unsigned int page_shift,
>> +				 int node)
>>  {
>>  	struct page **pages;
>> +	unsigned long addr =3D (unsigned long)area->addr;
>> +	unsigned long size =3D get_vm_area_size(area);
>> +	unsigned int page_order =3D page_shift - PAGE_SHIFT;
>>  	unsigned int nr_pages, array_size, i;
>>  	const gfp_t nested_gfp =3D (gfp_mask & GFP_RECLAIM_MASK) | __GFP_ZERO;
>>  	const gfp_t alloc_mask =3D gfp_mask | __GFP_NOWARN;
>>  	const gfp_t highmem_mask =3D (gfp_mask & (GFP_DMA | GFP_DMA32)) ?
>> -					0 :
>> -					__GFP_HIGHMEM;
>> +					0 : __GFP_HIGHMEM;
>> =20
>> -	nr_pages =3D get_vm_area_size(area) >> PAGE_SHIFT;
>> +	nr_pages =3D size >> page_shift;
>=20
> while try out this patchset, we encountered a BUG_ON in account_kernel_st=
ack()
> in kernel/fork.c.
>=20
> BUG_ON(vm->nr_pages !=3D THREAD_SIZE / PAGE_SIZE);
>=20
> which obviously should be updated accordingly.

Thanks for finding that. We may have to change this around a bit so=20
nr_pages still appears to be in PAGE_SIZE units for anybody looking.

Thanks,
Nick
