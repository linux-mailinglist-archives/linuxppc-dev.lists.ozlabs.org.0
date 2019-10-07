Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 47AF1CDCCC
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2019 10:04:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46mtKf4Mh1zDqMF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Oct 2019 19:04:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::143; helo=mail-lf1-x143.google.com;
 envelope-from=urezki@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YKX80zqK"; 
 dkim-atps=neutral
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46mtHm29DNzDq6l
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Oct 2019 19:02:25 +1100 (AEDT)
Received: by mail-lf1-x143.google.com with SMTP id r2so8535992lfn.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 07 Oct 2019 01:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:date:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=dD+rwXY/nYOWBAq4CYmtKPehya96hW8MC3evJji/Yec=;
 b=YKX80zqK9BnbAJeglBJloTgyzdIqVvyc8qZo+JZ3ztomB/oSL2bR0cdAskjskLkt7W
 V9UDSFbbXRmNPZ33L0D1wU65+1nH2oAp6y8pZPleWLLZCun4eCXakWs8mS4RWb6C/ker
 JW+RSQDoEOrmeywy1usBuMsnExaiprDjukREATWF2vWVXQ4YtCLFHEdtes6ohAKHQKtf
 q+L1AWmRm9SfD1K0Iykdhz4e4rb4yRZA5P2ouhEARMWWMz9rxMUok+sY7y4FKuV75C8t
 0xbcdLUk2/EkgOxlDRwB9q8u6xQVYUzdRCjrlrEYJnWvIf4sPd888A9bqnH++YKjN+jF
 dmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:date:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dD+rwXY/nYOWBAq4CYmtKPehya96hW8MC3evJji/Yec=;
 b=IeVlyWKdPG9TOnkzmKNwXj3k7YvULD2bzYZioqO4cHbg/MYesT+pIHdpG6kdHlG6O8
 adzETf1b03u9uVpRUaA7EqtF74IxfSOgkbOlus7fUlEl0nJ/l/4zelUEYJr/0jgt4Xg4
 Q+6BqG8EUcQLIlkubiqBMeuJWgtddaGVbNjF7dHldzcjKnnIqKvOXRuklGD2xs9Nz2Xt
 9ST2iWoRTnsUsipK1z3LBi1kpWklCbQDMNgG/d0kkBOLmG+7VnDisfpPxLI/eSlRgR84
 Z09cCeWvEIZ7VnpSLfsiUCLdJMj3BiK8zUMI7vWBzGDkaIahFrf6gwjR/4Hd6DsS1Ycm
 ngeg==
X-Gm-Message-State: APjAAAUJf5A1NDFrd3WQYJT7D52Vrl1xdVngSZOeVQ8V3Pcj4Cfy7SFg
 e6EzlHxKNKhSPDBg+/wnI1I=
X-Google-Smtp-Source: APXvYqyYVjjEk4t55bliwrB5kqrPSByuGmBtIo84DXhVvDur8OAwQWGVhoAdoOt78OMFi9yojAsMng==
X-Received: by 2002:ac2:4a8f:: with SMTP id l15mr16241092lfp.21.1570435338163; 
 Mon, 07 Oct 2019 01:02:18 -0700 (PDT)
Received: from pc636 (h5ef52e31.seluork.dyn.perspektivbredband.net.
 [94.245.46.49])
 by smtp.gmail.com with ESMTPSA id f21sm3218392lfm.90.2019.10.07.01.02.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Oct 2019 01:02:17 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 7 Oct 2019 10:02:09 +0200
To: Daniel Axtens <dja@axtens.net>
Subject: Re: [PATCH v8 1/5] kasan: support backing vmalloc space with real
 shadow memory
Message-ID: <20191007080209.GA22997@pc636>
References: <20191001065834.8880-1-dja@axtens.net>
 <20191001065834.8880-2-dja@axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191001065834.8880-2-dja@axtens.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: mark.rutland@arm.com, gor@linux.ibm.com, x86@kernel.org,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org,
 glider@google.com, luto@kernel.org, aryabinin@virtuozzo.com,
 linuxppc-dev@lists.ozlabs.org, dvyukov@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a3c70e275f4e..9fb7a16f42ae 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -690,8 +690,19 @@ merge_or_add_vmap_area(struct vmap_area *va,
>  	struct list_head *next;
>  	struct rb_node **link;
>  	struct rb_node *parent;
> +	unsigned long orig_start, orig_end;
>  	bool merged = false;
>  
> +	/*
> +	 * To manage KASAN vmalloc memory usage, we use this opportunity to
> +	 * clean up the shadow memory allocated to back this allocation.
> +	 * Because a vmalloc shadow page covers several pages, the start or end
> +	 * of an allocation might not align with a shadow page. Use the merging
> +	 * opportunities to try to extend the region we can release.
> +	 */
> +	orig_start = va->va_start;
> +	orig_end = va->va_end;
> +
>  	/*
>  	 * Find a place in the tree where VA potentially will be
>  	 * inserted, unless it is merged with its sibling/siblings.
> @@ -741,6 +752,10 @@ merge_or_add_vmap_area(struct vmap_area *va,
>  		if (sibling->va_end == va->va_start) {
>  			sibling->va_end = va->va_end;
>  
> +			kasan_release_vmalloc(orig_start, orig_end,
> +					      sibling->va_start,
> +					      sibling->va_end);
> +
>  			/* Check and update the tree if needed. */
>  			augment_tree_propagate_from(sibling);
>  
> @@ -754,6 +769,8 @@ merge_or_add_vmap_area(struct vmap_area *va,
>  	}
>  
>  insert:
> +	kasan_release_vmalloc(orig_start, orig_end, va->va_start, va->va_end);
> +
>  	if (!merged) {
>  		link_va(va, root, parent, link, head);
>  		augment_tree_propagate_from(va);
Hello, Daniel.

Looking at it one more, i think above part of code is a bit wrong
and should be separated from merge_or_add_vmap_area() logic. The
reason is to keep it simple and do only what it is supposed to do:
merging or adding.

Also the kasan_release_vmalloc() gets called twice there and looks like
a duplication. Apart of that, merge_or_add_vmap_area() can be called via
recovery path when vmap/vmaps is/are not even setup. See percpu
allocator.

I guess your part could be moved directly to the __purge_vmap_area_lazy()
where all vmaps are lazily freed. To do so, we also need to modify
merge_or_add_vmap_area() to return merged area:

<snip>
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e92ff5f7dd8b..fecde4312d68 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -683,7 +683,7 @@ insert_vmap_area_augment(struct vmap_area *va,
  * free area is inserted. If VA has been merged, it is
  * freed.
  */
-static __always_inline void
+static __always_inline struct vmap_area *
 merge_or_add_vmap_area(struct vmap_area *va,
        struct rb_root *root, struct list_head *head)
 {
@@ -750,7 +750,10 @@ merge_or_add_vmap_area(struct vmap_area *va,
 
                        /* Free vmap_area object. */
                        kmem_cache_free(vmap_area_cachep, va);
-                       return;
+
+                       /* Point to the new merged area. */
+                       va = sibling;
+                       merged = true;
                }
        }
 
@@ -759,6 +762,8 @@ merge_or_add_vmap_area(struct vmap_area *va,
                link_va(va, root, parent, link, head);
                augment_tree_propagate_from(va);
        }
+
+       return va;
 }
 
 static __always_inline bool
@@ -1172,7 +1177,7 @@ static void __free_vmap_area(struct vmap_area *va)
        /*
         * Merge VA with its neighbors, otherwise just add it.
         */
-       merge_or_add_vmap_area(va,
+       (void) merge_or_add_vmap_area(va,
                &free_vmap_area_root, &free_vmap_area_list);
 }
 
@@ -1279,15 +1284,20 @@ static bool __purge_vmap_area_lazy(unsigned long start, unsigned long end)
        spin_lock(&vmap_area_lock);
        llist_for_each_entry_safe(va, n_va, valist, purge_list) {
                unsigned long nr = (va->va_end - va->va_start) >> PAGE_SHIFT;
+               unsigned long orig_start = va->va_start;
+               unsigned long orig_end = va->va_end;
 
                /*
                 * Finally insert or merge lazily-freed area. It is
                 * detached and there is no need to "unlink" it from
                 * anything.
                 */
-               merge_or_add_vmap_area(va,
+               va = merge_or_add_vmap_area(va,
                        &free_vmap_area_root, &free_vmap_area_list);
 
+               kasan_release_vmalloc(orig_start,
+                       orig_end, va->va_start, va->va_end);
+
                atomic_long_sub(nr, &vmap_lazy_nr);
 
                if (atomic_long_read(&vmap_lazy_nr) < resched_threshold)
<snip>

--
Vlad Rezki
