Return-Path: <linuxppc-dev+bounces-17633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF8cA19Jp2m8gQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:49:35 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7495D1F6F09
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 21:49:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fQSb94sByz3bf8;
	Wed, 04 Mar 2026 07:49:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2607:f8b0:4864:20::132e" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772570965;
	cv=pass; b=XaIlhBB+iFqKdt0xgZ0+AZZukzL0cuafVBXkDGK2E4tSQg9j2HuKUc8DwlNKjrtAYf9FYhApu3C41qylD5yrVK5PVf090bI2Uko3jLequSy47KQ0iywNabpZDOYuYjry7rwlnjqh8h/WgW51rxAjdbFCz9PYcpNNrQUrA6NOF+5/Z6XceHHzRxJxzREFwtOEP1YJ3Tn80p6nMA5lDWpt3WRODe9bOIo18S5x4ErbGMiAB+R2HOZgtjW1SMqh80ogTECzH8bZ/8Rm0tz2xceYXKr/lV3Xt7hPZUujydoxJan1VOxDlvMsnLyEQqAnPoeE49lxsYjwda26gmlcp6ubLg==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772570965; c=relaxed/relaxed;
	bh=z5K9TC0MkEO8By22h3GqX8xxcKLeF0UtxgZ/D1gjfh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mPrgMskmNkvUz8MJTPyhdi3nMYPvDTs166o+yMcZD3vx0jsa0wjc982/6CnONKlkbrNiEh50GOyH+BrWTUkAWI/TNijVkZt25A4ldh0m62uSaQt+wKa/9UUlcXliiTdGPn+Jc6sP0sPYs8Os6b9PFiGyKC2q90X5QzM7yteLKlMjflLlquaPx7FLT+Gcb1tG4Tmzh5NDfn3ojw/V+M1hDfw/MRu1gmYBkzmmvzEDJep+675F+qifb3P9G80iANLMpkyOIw4NOfzYCGQnyroinkE0EjsKJ7J+bH6M3AWSURYRB0hNPLZwttQqrO9CfbA8eF50f9+o0zIYEcEeqIV1aA==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i63FFcTI; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::132e; helo=mail-dy1-x132e.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=i63FFcTI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::132e; helo=mail-dy1-x132e.google.com; envelope-from=miguel.ojeda.sandonis@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x132e.google.com (mail-dy1-x132e.google.com [IPv6:2607:f8b0:4864:20::132e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fQSb81Lvsz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Mar 2026 07:49:23 +1100 (AEDT)
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2bda3b4318dso570472eec.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 12:49:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772570960; cv=none;
        d=google.com; s=arc-20240605;
        b=blLaw8oE3N0kEc0cVfdwUpDKM9BPxqUELu12P+PpnTv/faGqcc6XR6cnlRMGw72R2x
         iaq3NNc1FiZFWEbPhuDH/cT9U2cKYiVkQskjLfkkCkXSt2MGvJA47KgoaiLRHmQBlv1v
         r1WWp6t0oTXiNAm10f9y0AgRiC2cZBmIzXpHxdZh8PhtuMP1BwCzrr5Y119YC/s8xrbL
         uDhX7UmbK56cOibdl2am8Ck0p+C+qh1Kmnuq2NgLdi5bOamuCdGYu0cDuDFFDTtx9bJu
         huYI9x9hjJCVOPZ7AFl1bEuLOfCpZmsgFiOswWKtMLJ7TJXDgxPIYkwvZR3LNyqsKqsG
         OU2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z5K9TC0MkEO8By22h3GqX8xxcKLeF0UtxgZ/D1gjfh8=;
        fh=khQVTGYy2Skv2EAIZaucjSXVED4WjT89tL6FFHgHlX4=;
        b=EPvI7v5Kj6/1CKWayjmHVYNFcWRY254NPn9Ac49vP5wsyEJ1FT5lSNPUfWFrf6zjLU
         ObHXtL+y4ks4EVs7dcFDdFg9ExLxk5SbMY2qbFQT2u9djJI0soDRxH3VptccuM301R9k
         nXNQYL9krBIkDkYao9oKVqAEgYqzCrgRa+1mCUxKtziPdxWV+J3fvbHBv8Q1Pmj9MHEt
         Xj5mt94S5fqZ6hbifXYdP9IjnpFwl84sxwnsMjGCzFHWQwAbuPaCLtBRzdoNTKDMEeOS
         9j9563v9DhwkB3QLYZPE+DWA07VlAgHQGDMbxw/Wq2PC1eGDm9mQHs+gXBvNOqjuQjVA
         u8uQ==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772570960; x=1773175760; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z5K9TC0MkEO8By22h3GqX8xxcKLeF0UtxgZ/D1gjfh8=;
        b=i63FFcTIPQs6WSCsglhYhWqaI0XdaHiRx0L6cNSR8HWlQ3UR2js8igt++RCc7PkR0c
         5VHoHOb+SD3HLU4sAEPBuKSxvKmLTDb6S9chFLhBAOIH8x7k2hMm9VgG5SCaUd3QjYRc
         ewI30xm+ePIx7/768rXOmrXhHFmxYvSG8Lm3HrGGuXxwjp7zXuK4r0PEzPdpEB80n9W9
         8D4g9t7UquWMdnw/zFADlFD4hruvwIf//oAIqdAbduL4zuVswi9YdcVNfucVxO/1XeyU
         ZQcklHIOtJJCMy6/ZcYa1qniK+3JHJWBXPRq10PS0VgfzHzbD1BISA5L0XuAQ18ISQUh
         KlXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772570960; x=1773175760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=z5K9TC0MkEO8By22h3GqX8xxcKLeF0UtxgZ/D1gjfh8=;
        b=GtFeeZk0lHXKBVj1swy7SkQ1vB6si+sI/ygwzi3bUxbCPEsxsW9KqlBYgHeRp4UC1J
         fEWYbZRRijwYY8nHYGcK0CDwbfoIZT9Qi44Lz8K9Pq2MUYLiyPc34kdyDS0qwMGLmaoI
         sVJLvSZbXeWumkHSLL0JiFQVpBxDJi+v8Kx319vmN7O49+cL5ib31IqbDXdts50t8MHv
         H7n+67OyyVssRKxOqcjBq09ZU5CPvPBRqWj6eYo9+qWMOt5Yumwv88arGd3anGgfWUT7
         nBXPafHq8Kwopbo+FLUvchkVSKA6tIbPvizIeylUOEIlCjmwrHF8NVngG2HIuHa8a1uW
         Fctg==
X-Forwarded-Encrypted: i=1; AJvYcCXJLD98gZQSUbYT49TAfVHyBB92QciOkL7LqM7sCyxIqJnFHO0umu0zSzrVRdz3HeyLLhxUfORRID0u4TA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzprNXB0rsL3ecW2nkVBVppLSvasBbd+1xIWxppVRnS/CGuJea/
	B7W8Sj7B19ihYRpjDck3r0l3qekv58UFRNHP1PVmAvZEV1epi35bjlHIDoxK02u9Tqgp6TC07v5
	bUavL+4lILvf92Vl79MssGqo4ILcMTjk=
X-Gm-Gg: ATEYQzzUBVTfjnXet+DHLEo5u5TXXCHw6cCGd+cFvuXDhDs1R7ybypRjGn1yzzpKxbK
	Htfg17B4//KcDG90CvNVXb7RUdthSCdu8e84uZJa1Ep9Y0xp+isKkyagf31397wQWv2tjFon1E8
	Sx2P1KkKsaTpxc3c3IAVCOBGFJCNZPVwkmy1HBDtJD1vJ0h/wJm2dir+/jDURVQlBzsOBtULsCs
	R7lnaKhNLfI0QcTJn14nL+K8Z9CbqLRNgALHLxnAYg5aTYWAa2R9xd7heSwAx0VwruxT+9iznMD
	vEHycHozTxc2rA9ovwpUq/ISI4p7GceN9Y/u92I5uBkEIZDM2aL3yM3MOzw5PpYdNmIgynDuS5H
	J3bKLjA+jBCCV0SknwgNHXl+M
X-Received: by 2002:a05:7300:231e:b0:2b7:103a:7697 with SMTP id
 5a478bee46e88-2bde1d4bc79mr3350396eec.5.1772570960234; Tue, 03 Mar 2026
 12:49:20 -0800 (PST)
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
References: <20260227200848.114019-1-david@kernel.org> <20260227200848.114019-3-david@kernel.org>
 <aaLh2BxSgC9Jl5iS@google.com> <8a27e9ac-2025-4724-a46d-0a7c90894ba7@kernel.org>
 <aaVf5gv4XjV6Ddt-@google.com> <f2f3a8a1-3dbf-4ef9-a89a-a6ec20791d1c@kernel.org>
 <aaVnifbdxKhBddQp@google.com> <5f8dcb7f-9e4f-4484-b160-3a9ce541d63c@kernel.org>
 <aaWvtn48X8UizaaN@google.com>
In-Reply-To: <aaWvtn48X8UizaaN@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 3 Mar 2026 21:49:06 +0100
X-Gm-Features: AaiRm50lUTXkxHRxiLsKpWNGF1HIgeoo2SkrDpQfQSxM22wzlSiellk8rvn7q80
Message-ID: <CANiq72nK8P1rUYw=y3fMzWZR3f_mW2v0_LSLWR1i0dQTtOqu2w@mail.gmail.com>
Subject: Re: [PATCH v1 02/16] mm/memory: remove "zap_details" parameter from zap_page_range_single()
To: Alice Ryhl <aliceryhl@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, linux-kernel@vger.kernel.org, 
	"linux-mm @ kvack . org" <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jann Horn <jannh@google.com>, 
	Pedro Falcato <pfalcato@suse.de>, David Rientjes <rientjes@google.com>, 
	Shakeel Butt <shakeel.butt@linux.dev>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, 
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, 
	Vasily Gorbik <gor@linux.ibm.com>, Jarkko Sakkinen <jarkko@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, Ian Abbott <abbotti@mev.co.uk>, 
	H Hartley Sweeten <hsweeten@visionengravers.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>, 
	Dimitri Sivanich <dimitri.sivanich@hpe.com>, Arnd Bergmann <arnd@arndb.de>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, Andy Lutomirski <luto@kernel.org>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Eric Dumazet <edumazet@google.com>, 
	Neal Cardwell <ncardwell@google.com>, "David S. Miller" <davem@davemloft.net>, 
	David Ahern <dsahern@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-sgx@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 7495D1F6F09
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17633-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,kvack.org,linux-foundation.org,oracle.com,google.com,suse.com,suse.de,linux.dev,infradead.org,linux.ibm.com,ellerman.id.au,redhat.com,alien8.de,linuxfoundation.org,android.com,mev.co.uk,visionengravers.com,linux.intel.com,intel.com,ursulin.net,gmail.com,ffwll.ch,ziepe.ca,hpe.com,arndb.de,iogearbox.net,arm.com,davemloft.net,lists.ozlabs.org,lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:david@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:rientjes@google.com,m:shakeel.butt@linux.dev,m:willy@infradead.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:agordeev@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:jarkko@kernel.org,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:gregkh@linuxfoundation.org,m:arve@android.com,m:tkjos@android.com,m:brauner@kernel.org,m:cmllamas@google.com,m:abbotti@mev.co.uk,m:hsweeten@visionengravers.com,m:jani.nikula@linux.intel.com,m:joonas.lahtinen@linux.intel.com,m:rodrigo.vivi@intel.com,m:tursulin@ursulin.net,m:airlied@gmail.com,m:simona@ffwll.ch,m:jgg@ziepe.
 ca,m:leon@kernel.org,m:dimitri.sivanich@hpe.com,m:arnd@arndb.de,m:ast@kernel.org,m:daniel@iogearbox.net,m:andrii@kernel.org,m:peterz@infradead.org,m:acme@kernel.org,m:namhyung@kernel.org,m:luto@kernel.org,m:vincenzo.frascino@arm.com,m:edumazet@google.com,m:ncardwell@google.com,m:davem@davemloft.net,m:dsahern@kernel.org,m:kuba@kernel.org,m:pabeni@redhat.com,m:ojeda@kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linux-sgx@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:linux-rdma@vger.kernel.org,m:bpf@vger.kernel.org,m:linux-perf-users@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:netdev@vger.kernel.org,m:rust-for-linux@vger.kernel.org,m:x86@kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[74];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[miguelojedasandonis@gmail.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid]
X-Rspamd-Action: no action

On Mon, Mar 2, 2026 at 4:41=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> It's not relevant in this patch, but another thing that may be useful is
> to add CLIPPY=3D1 to the make invocation when building normally. This
> causes additional warnings to be checked using a tool called clippy.

Yes, please do use `CLIPPY=3D1` -- the build should be Clippy clean
modulo exceptional cases that may slip through (and soon linux-next
will probably start reporting those warnings too).

Thanks!

Cheers,
Miguel

