Return-Path: <linuxppc-dev+bounces-11386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40C54B38821
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Aug 2025 18:59:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cBrNc6Yrsz30Ff;
	Thu, 28 Aug 2025 02:59:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::229"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756313968;
	cv=none; b=Gfh839wvzmWQwLYZvinVcvM89AXeG8U8aHE8zeQ6pPjpeMUa3fOftlFu5H7fYsRgbzubjp0MlYeZNuNC5WNREjbbzSULs/nw5nudx96a3Y7hcxLA2+syZAsrfRDBNJv8mFXloBvnCcAEuqXvuZK/75QK1fCrZv+E5Vc1wfojjY7t/YibHlaBiH3xY5gEzjbyThyilM7ghpzgUM+OxBKG3gSjj3pRFf/VlLhW5pMHdgRSikgv9z+5bO/5qTe5o7dwjd7044z4w3xlriD0AQ3FiZhZNpLGD+0punSvmP2YSHL7YIP3dZf7R/dA9h+oMNaoeVQxWuRac4JO6icv3k8JDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756313968; c=relaxed/relaxed;
	bh=cSz+0Jdl3rsxgIMqjiE4eLITB/Ptqi8xoIkjq9Q3i9w=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Co+8ajcT9xxWh/9So24+R5aNY9FRralSH4LKsyfzO6TpHP/qW3+/lKiH+rqbd6uO5hVIimemhK53WOckbtd/4dvPm3crSpNIswkndbY5o6MMXKbbtAgYUvoEx8R/x7LltXNteUaJJdZ7TjXyZyDLp9LwpjGm6KrHIsqd6wzpnb8E6nJ3jnGiYSux7+aE03e7PnVSmTUb+ZSNwAYjET7Rtb7lwvoYigIs4wQp3SMii4ZnnJY9pfdLFOUZbeHt0afFIJFDjAlO8PbDvCo2bx77XqsXwXJ7rCazHj2jU5JFISuYyGF6ZFDopfPn7QB+beBb7eraBH7eAzO7xAgT+sJcNA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZvlyEe37; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZvlyEe37;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=urezki@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cBrNb21BHz2yPS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 02:59:26 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3366f66a04cso424181fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Aug 2025 09:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756313962; x=1756918762; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cSz+0Jdl3rsxgIMqjiE4eLITB/Ptqi8xoIkjq9Q3i9w=;
        b=ZvlyEe37Jqb0MJppnWNPHj041v3cRAAU/r/lSGaMwGNZhXvyzMnHfF4tBh1zgxrjz3
         01Vd06bHWHARONNLQRzSlUX3KKrdWeaN84wS67nVFN3Gd9a7YtszBM26W83STardMznM
         nYFbgeEU0sHH0qbKjE2zR9zp2Gd1MTu4TN77wZvQ6eRQTnQoYVHbRlN9ngz2OOl0AuJ9
         z7HIGufAU5UjBpxVSGU0JLkVZfL+vKoyzim1tz3hIGkGEw3naqv4vVZbt8/lfIT3pv7g
         rkFpY9G0Qi2uD3UgMVGjI2vdcrSXufXapmvvgtdITc+CB5ZJfRMxoHGhfShuXPhw8bi8
         FHoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756313962; x=1756918762;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSz+0Jdl3rsxgIMqjiE4eLITB/Ptqi8xoIkjq9Q3i9w=;
        b=exujTTB+sFOtZR+FsWdJcqMvNLpGXZx8zf9L4x0Qs1vuTSSD+RDoci24dP24J86Glu
         EHJ4r0pcy62pnOr63Hq8ogTbtbvA3YiyM/pfiiZtHcfcE3YnkmEWayvCQHM63MQDSV1K
         a1kCD5DFHhKgzZVDBJ2m1ZHoPEdx5BRvZbWeSHaupEvAEAiA64JfZ0E5z0OM6WqSwcYb
         28NCAy0Wuo4wNnmUj7ywzJzJx00pO/+GTPWyq5bLuqjMT73UZ7ltXemo5O1nEiaGuxDX
         1LBRvQMDIa9zzoNmoye6J2PaswQqxdhl87AYdr4Cdh5eUQXyfvZQSyk9pgKs4cMHrmyY
         4U9g==
X-Forwarded-Encrypted: i=1; AJvYcCWVfbMI6tsGhI+2lFW/lhAcIEUP2020zm/rHi7X56ZR9Mabj16hs4w9mF50efx+FHcHTyRtM+Y7ZozJR7Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyN9yAUOTLQByBB/qp07TRuxW4RNYxM3NmU/04i9rWS29kB5yVP
	rr2osNLj6Lvd0w7+yj9qc/UgNK03hdOG3/65lGAGV6J2JS4dAVqtXQxC
X-Gm-Gg: ASbGncthNZA6z7j57cJcoMedT42YCKYILZ82mhE0RZRvklaobucq8gTSxSTlrgEhfru
	k23zaoJV4lkHGuHE6hsZ98FBX8/LZgmGahDiuVymlTSd6MIzxtpFf2jwh0iS2DrUXU8ZH8ahGxM
	uWZ/Rk0sb3WVwE/2O/alJR2Y8iXE+dSqGylIiPaYEAtov1c3P6UPtLIRn/2q3w0fxzsTydQmcMA
	jdaD5DHyd4vDTpKZxKY4sDLKTtxObfcwq9o5ziZWF1qjwfRYz8Oi4OH20E0l67vqDbmwEnBJLKd
	cdFz7+bfywnElPWaaNBwfl0rPBZgI4sduMTNhHIg9qMt8PX3DKhUTPCAxhYh6uUFwQsAGxTQpgw
	096lbi3W723r8sUBzhHURyodYTaej6uduMC2+0uiHIwpJ5JKuwPQh
X-Google-Smtp-Source: AGHT+IG4BeCx/VIPO9rnbCc0YcRdZMlua4eVbdX3PpKt/fKDdzrBfr7yiiTFTWfK/4UfPVTpR7vpyQ==
X-Received: by 2002:a2e:be03:0:b0:336:7eed:2f8f with SMTP id 38308e7fff4ca-3367eed3c67mr29987221fa.32.1756313961794;
        Wed, 27 Aug 2025 09:59:21 -0700 (PDT)
Received: from pc636 (host-90-233-205-219.mobileonline.telia.com. [90.233.205.219])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3365e5da244sm27443611fa.58.2025.08.27.09.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 09:59:21 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 27 Aug 2025 18:59:16 +0200
To: Kees Cook <kees@kernel.org>
Cc: Uladzislau Rezki <urezki@gmail.com>, Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-sgx@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	nvdimm@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mm: update core kernel code to use vm_flags_t
 consistently
Message-ID: <aK85ZPVwBIv-sH85@pc636>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
 <d1588e7bb96d1ea3fe7b9df2c699d5b4592d901d.1750274467.git.lorenzo.stoakes@oracle.com>
 <aIgSpAnU8EaIcqd9@hyeyoo>
 <73764aaa-2186-4c8e-8523-55705018d842@lucifer.local>
 <aIkVRTouPqhcxOes@pc636>
 <69860c97-8a76-4ce5-b1d6-9d7c8370d9cd@lucifer.local>
 <aJCRXVP-ZFEPtl1Y@pc636>
 <aJHQ9XCLtibFjt93@kernel.org>
 <aJItxJNfn8B2JBbn@pc636>
 <202508251436.762035B@keescook>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202508251436.762035B@keescook>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 25, 2025 at 02:37:11PM -0700, Kees Cook wrote:
> On Tue, Aug 05, 2025 at 06:13:56PM +0200, Uladzislau Rezki wrote:
> > I agree. Also it can be even moved under vmalloc.c. There is only one
> > user which needs it globally, it is usercopy.c. It uses find_vmap_area()
> > which is wrong. See:
> > 
> > <snip>
> > 	if (is_vmalloc_addr(ptr) && !pagefault_disabled()) {
> > 		struct vmap_area *area = find_vmap_area(addr);
> > 
> > 		if (!area)
> > 			usercopy_abort("vmalloc", "no area", to_user, 0, n);
> > 
> > 		if (n > area->va_end - addr) {
> > 			offset = addr - area->va_start;
> > 			usercopy_abort("vmalloc", NULL, to_user, offset, n);
> > 		}
> > 		return;
> > 	}
> > <snip>
> > 
> > we can add a function which just assign va_start, va_end as input
> > parameters and use them in the usercopy.c. 
> 
> Yes please! I'd must rather use some exported validation routine than
> having it hand-coded in usercopy.c. :)
> 
I will do it :)

--
Uladzislau Rezki

