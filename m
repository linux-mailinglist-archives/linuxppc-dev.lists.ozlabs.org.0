Return-Path: <linuxppc-dev+bounces-10905-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 882A7B23FFE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Aug 2025 07:06:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c1xD21Hfvz30Sy;
	Wed, 13 Aug 2025 15:06:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:203:375::aa"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755061570;
	cv=none; b=N0Bwrr3MJqJBOUJOHG8o/AeuhpjMGUdlEqDtTuBn+MKddh/mkjB67Nxo1y8OiFj8yE22dNYs9rTQsUsouztiw1riXbtWY0SzFqaM8pV4H6aFsxe1JbPHenTkmCpqPCqleR664QoDOBcnjh1aLf29wVQYDOxp3L7ETCtOLfD9QSsI5NABX3AtBM1B+CbcLK5PHLHoeOCp2YwX5GYsDZ2mrRX9+u0zxsDaA33aYtoQhGtSYC/aErgFYDEZeOGc0y3Qqa8UCWxW0JSwdfpArYGhiViMl9+BSw4Bce3RCGPrYk94C20iI0HYTQkHLha7NhbR89QX+5w0exJaX8Y0H7fZBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755061570; c=relaxed/relaxed;
	bh=87bLiKw1h579sXw+ErVi2X85NzXrARI80WO5rF5C6xU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Kr/iTK5FtcjLOnuLT6u+a6gHr4VBBra7yPvo6cwQwXP5+XJC/bnVkP1cCiOm6JQEaZMMy9n0z3FXS6l+8r4eV9WrKGeXt+znAQq0Jm7Zgsll3AvccNHq6wiaTZUGtcHAPZoyoTJzLGwpbt4qRR7tlrw/Hwslm+OpsQkYlbyWgJEzWj2J56UV1X30RDaupNVdFWu3lgIQMTqxcaGPr45hW+v98iVs9Poi9dIQBIMmUEk1JM+ECF3TLTezLR+7Sb/LczPkQPTxGMRwXcCu30V7mrivczXL0PFsjOs7hgkH19oNOBVhTsmtH9JE3fIRe5341gnS8T9xmDKlU5jCBg4wzw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=msRgUr3o; dkim-atps=neutral; spf=pass (client-ip=2001:41d0:203:375::aa; helo=out-170.mta1.migadu.com; envelope-from=lance.yang@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=msRgUr3o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:203:375::aa; helo=out-170.mta1.migadu.com; envelope-from=lance.yang@linux.dev; receiver=lists.ozlabs.org)
Received: from out-170.mta1.migadu.com (out-170.mta1.migadu.com [IPv6:2001:41d0:203:375::aa])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c1xCv6J0bz30Qk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Aug 2025 15:06:02 +1000 (AEST)
X-Forwarded-Encrypted: i=1; AJvYcCXi7UJBKfczXFQ9CfgQb4jKkoLvZAq4GdDkjPG49KBW/D3qqjF6OTIxjgmdsu8Mo0MIPxe7Vi6aZmPyb2g=@lists.ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1755061540;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=87bLiKw1h579sXw+ErVi2X85NzXrARI80WO5rF5C6xU=;
	b=msRgUr3ogeYMlMRWj/qJIXsKl/dUZhk/z1d/S1E5lS+oPhdBdtzlTAO0tkgFQ7OU19t+bB
	9EUA/u+9Yom7niRvLR7Nq23sti926ShFf/KLGWf8N96K292943gdMLLHoEZ2+5yPg46+vf
	k2Pkv6pLzyk+pwTyiVWG0SvudTJoC6Q=
X-Gm-Message-State: AOJu0Yysjw1WjXyV6VrclTuwhMqrNhiYD6+2Ins9h7uvhaGpbnhL4vCm
	QHELYkl1ThGJ97BW54ZseEMg1ir6B8wY6tdpN2rvs8fDEphzFto1ap+CcWqwz6M3PrTcfBm08FV
	c5x7WBRe7QoX5U2OcZOL3AtvMut0HB+I=
X-Google-Smtp-Source: AGHT+IGZEPRXKg3wTS4iOnxLeW0VcVJpSHw/Siwyoa1WzS8WxyYOyRd8JzJTNVHXWXH3rQ3YpjAcT1JHiZ4LgeKLzSs=
X-Received: by 2002:a05:6214:246e:b0:709:31f8:fd96 with SMTP id
 6a1803df08f44-709e8865a26mr19274996d6.20.1755061536500; Tue, 12 Aug 2025
 22:05:36 -0700 (PDT)
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
References: <20250811143949.1117439-1-david@redhat.com> <20250811143949.1117439-2-david@redhat.com>
In-Reply-To: <20250811143949.1117439-2-david@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Lance Yang <lance.yang@linux.dev>
Date: Wed, 13 Aug 2025 13:05:22 +0800
X-Gmail-Original-Message-ID: <CABzRoyYU2yOuGQskCAG_gzKiQwR6uM9eAYqOOCoQj+Xv=r163A@mail.gmail.com>
X-Gm-Features: Ac12FXz5RRcASyIjWC2h4OdZEnpLc7e6olfF88c8Jo2nErMh7OQ3VSRS5jfjM-I
Message-ID: <CABzRoyYU2yOuGQskCAG_gzKiQwR6uM9eAYqOOCoQj+Xv=r163A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] mm/migrate: remove MIGRATEPAGE_UNMAP
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, 
	linux-fsdevel@vger.kernel.org, linux-aio@kvack.org, 
	linux-btrfs@vger.kernel.org, jfs-discussion@lists.sourceforge.net, 
	Andrew Morton <akpm@linux-foundation.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	=?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Benjamin LaHaise <bcrl@kvack.org>, Chris Mason <clm@fb.com>, Josef Bacik <josef@toxicpanda.com>, 
	David Sterba <dsterba@suse.com>, Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Dave Kleikamp <shaggy@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, 
	Ying Huang <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>, 
	Minchan Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Aug 11, 2025 at 10:47=E2=80=AFPM David Hildenbrand <david@redhat.co=
m> wrote:
>
[...]
> +++ b/mm/migrate.c
> @@ -1176,16 +1176,6 @@ static int migrate_folio_unmap(new_folio_t get_new=
_folio,
>         bool locked =3D false;
>         bool dst_locked =3D false;
>
> -       if (folio_ref_count(src) =3D=3D 1) {
> -               /* Folio was freed from under us. So we are done. */
> -               folio_clear_active(src);
> -               folio_clear_unevictable(src);
> -               /* free_pages_prepare() will clear PG_isolated. */
> -               list_del(&src->lru);
> -               migrate_folio_done(src, reason);
> -               return MIGRATEPAGE_SUCCESS;
> -       }
> -
>         dst =3D get_new_folio(src, private);
>         if (!dst)
>                 return -ENOMEM;
> @@ -1275,7 +1265,7 @@ static int migrate_folio_unmap(new_folio_t get_new_=
folio,
>
>         if (unlikely(page_has_movable_ops(&src->page))) {
>                 __migrate_folio_record(dst, old_page_state, anon_vma);
> -               return MIGRATEPAGE_UNMAP;
> +               return 0;
>         }
>
>         /*
> @@ -1305,7 +1295,7 @@ static int migrate_folio_unmap(new_folio_t get_new_=
folio,
>
>         if (!folio_mapped(src)) {
>                 __migrate_folio_record(dst, old_page_state, anon_vma);
> -               return MIGRATEPAGE_UNMAP;
> +               return 0;
>         }
>
>  out:
> @@ -1848,14 +1838,28 @@ static int migrate_pages_batch(struct list_head *=
from,
>                                 continue;
>                         }
>
> +                       /*
> +                        * If we are holding the last folio reference, th=
e folio
> +                        * was freed from under us, so just drop our refe=
rence.
> +                        */
> +                       if (likely(!page_has_movable_ops(&folio->page)) &=
&
> +                           folio_ref_count(folio) =3D=3D 1) {
> +                               folio_clear_active(folio);
> +                               folio_clear_unevictable(folio);
> +                               list_del(&folio->lru);
> +                               migrate_folio_done(folio, reason);
> +                               stats->nr_succeeded +=3D nr_pages;
> +                               stats->nr_thp_succeeded +=3D is_thp;
> +                               continue;
> +                       }
> +

It seems the reason parameter is no longer used within migrate_folio_unmap(=
)
after this patch.

Perhaps it could be removed from the function's signature ;)

>                         rc =3D migrate_folio_unmap(get_new_folio, put_new=
_folio,
>                                         private, folio, &dst, mode, reaso=
n,
>                                         ret_folios);

Anyway, just a small thought. Feel free to add:
Reviewed-by: Lance Yang <lance.yang@linux.dev>

Thanks,
Lance

