Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D05D302467
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 12:45:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPShs41GszDqD2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 22:45:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PRxDsTPh; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPSXp5F2lzDqjJ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 22:38:02 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id a20so5245934pjs.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 03:38:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=CBrHQKk5DvtYtXFMx7JHsz2HY0JbIqsMSQ627Jqzbg0=;
 b=PRxDsTPh2FldKGc70iTUj4qglzDKO0qs6Qrmtz9nWUW0G2hpthnnxypWfr84D2WeMa
 Krc3wzNvT/3ii5sBuYmNfQrWflVuWynwmJwoFwhvv6AvchI04U2A6+JJ2fMIUsjU8BCr
 dFoqppbT2ZBi81L2VP56iwpJZpN1WBTx35NxkALzuDAdDjAkQq3hSuTCueb87JS15wm/
 y/d27urmgdFZTFqKkZesmbSPZuJMOmP+2VG+lFlfxxRFhK/zN45p6qWh+trHcYOPh2Kw
 FFdhOysCLsthaiRYeCD/MtbGzR+d/XKjFoszlBuwUWq7DcGqxHJhqqRKloH/UCg1qMeG
 Uxpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=CBrHQKk5DvtYtXFMx7JHsz2HY0JbIqsMSQ627Jqzbg0=;
 b=nIi5g430noXB1S4nVlG6ARO/yoXw8VLKPvLzJwzatXCtSHBTmHVU9gKHW4j5ISsmc1
 l/TFvhaCKkBChtrIjHH5faX/gvZMX+mz3pDjfempSh5RQsg65M20fTpzl/vVEfJOkd+M
 UdeLtau7WZj2ul13ITASpn8n9pg/OIbCEA1XFqM+spEspY0+2tKj/RJ3e4bRStROM1uK
 SYrr8zgRu8GJIKVDrPEvg5kPvDQFZXNneHUOAZfO4zKsTIcrVBb0hsyZ6Ji54ZF09rd9
 noQKfw4d7UGi9yZyYvpmOK84Jwai29hlEA7UDx1crlzfdnZoFxSVj06AW6snX6Tk9u5l
 32IQ==
X-Gm-Message-State: AOAM532EE1AFT1Fqod4tn8USdqPzMPK5Pq8w2IBYtoq0D6MzIR0gb6/L
 ElVo0dUm5OBidiBtWtzDYuQ=
X-Google-Smtp-Source: ABdhPJxXWrMejFLDmmv7hyok62+Wn7mCMPpibp85dMuQrVAJKCpKVn5AUVERujtZvv9rEWglZ2Pt+A==
X-Received: by 2002:a17:90a:708b:: with SMTP id
 g11mr949801pjk.23.1611574678976; 
 Mon, 25 Jan 2021 03:37:58 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id 78sm12724280pfx.127.2021.01.25.03.37.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 03:37:58 -0800 (PST)
Date: Mon, 25 Jan 2021 21:37:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v10 11/12] mm/vmalloc: Hugepage vmalloc mappings
To: Andrew Morton <akpm@linux-foundation.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linux-mm@kvack.org
References: <20210124082230.2118861-1-npiggin@gmail.com>
 <20210124082230.2118861-12-npiggin@gmail.com>
 <933352bd-dcf3-c483-4d7a-07afe1116cf1@csgroup.eu>
In-Reply-To: <933352bd-dcf3-c483-4d7a-07afe1116cf1@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1611574637.k9njsi2um5.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of January 25, 2021 7:14 pm:
>=20
>=20
> Le 24/01/2021 =C3=A0 09:22, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Support huge page vmalloc mappings. Config option HAVE_ARCH_HUGE_VMALLOC
>> enables support on architectures that define HAVE_ARCH_HUGE_VMAP and
>> supports PMD sized vmap mappings.
>>=20
>> vmalloc will attempt to allocate PMD-sized pages if allocating PMD size
>> or larger, and fall back to small pages if that was unsuccessful.
>>=20
>> Architectures must ensure that any arch specific vmalloc allocations
>> that require PAGE_SIZE mappings (e.g., module allocations vs strict
>> module rwx) use the VM_NOHUGE flag to inhibit larger mappings.
>>=20
>> When hugepage vmalloc mappings are enabled in the next patch, this
>> reduces TLB misses by nearly 30x on a `git diff` workload on a 2-node
>> POWER9 (59,800 -> 2,100) and reduces CPU cycles by 0.54%.
>>=20
>> This can result in more internal fragmentation and memory overhead for a
>> given allocation, an option nohugevmalloc is added to disable at boot.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/Kconfig            |  10 +++
>>   include/linux/vmalloc.h |  18 ++++
>>   mm/page_alloc.c         |   5 +-
>>   mm/vmalloc.c            | 192 ++++++++++++++++++++++++++++++----------
>>   4 files changed, 177 insertions(+), 48 deletions(-)
>>=20
>=20
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 0377e1d059e5..eef61e0f5170 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>=20
>> @@ -2691,15 +2746,18 @@ EXPORT_SYMBOL_GPL(vmap_pfn);
>>   #endif /* CONFIG_VMAP_PFN */
>>  =20
>>   static void *__vmalloc_area_node(struct vm_struct *area, gfp_t gfp_mas=
k,
>> -				 pgprot_t prot, int node)
>> +				 pgprot_t prot, unsigned int page_shift,
>> +				 int node)
>>   {
>>   	const gfp_t nested_gfp =3D (gfp_mask & GFP_RECLAIM_MASK) | __GFP_ZERO=
;
>> -	unsigned int nr_pages =3D get_vm_area_size(area) >> PAGE_SHIFT;
>> -	unsigned long array_size;
>> -	unsigned int i;
>> +	unsigned int page_order =3D page_shift - PAGE_SHIFT;
>> +	unsigned long addr =3D (unsigned long)area->addr;
>> +	unsigned long size =3D get_vm_area_size(area);
>> +	unsigned int nr_small_pages =3D size >> PAGE_SHIFT;
>>   	struct page **pages;
>> +	unsigned int i;
>>  =20
>> -	array_size =3D (unsigned long)nr_pages * sizeof(struct page *);
>> +	array_size =3D (unsigned long)nr_small_pages * sizeof(struct page *);
>=20
> array_size() is a function in include/linux/overflow.h
>=20
> For some reason, it breaks the build with your series.

What config? I haven't seen it.

Thanks,
Nick
