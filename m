Return-Path: <linuxppc-dev+bounces-16788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEYYCuugi2l1XQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 22:19:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFFA711F5C4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Feb 2026 22:19:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f9ZFf22d1z2xJF;
	Wed, 11 Feb 2026 08:19:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip="2a00:1450:4864:20::52b" arc.chain=google.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770758374;
	cv=pass; b=MWXiC0hE2ZfQcgye7dWJVFhLpvpk6jzA5xcV/IRTWVBmAkHfoinr6ffjkFAsijKaEPYji8bndDCbt88qosEvkmYYclLvoVEI4PjwMEF6EhvR2es+5j8dTyX3cb1i0CTjODuVjY9rbbZYvZ56zjQ+vGRPgzs7B0GQlXkV7eQTWHNlxiGrX9I3QF/Xx5hfA4lnvgJWa7COiMvCouEpeuHNwHefdvPPdFCSoqAJoSTmTQn6fM7lxCIWo902DJeii0sWl9ldqpZkzNuLtOuepKthDsPxQdIbEqgAVJf65xbAKy0FPBeAEEcLkv2xMNith+wwQdFbb+lmC9jvRlDM/S07Aw==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770758374; c=relaxed/relaxed;
	bh=7ueb2XLAZgSMqdZ7FzkgHkbOJxEx/nDgdsJxz5kcjsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MiHtSbm2um4KYNxQ0fFKy1xsv61Keg1zUSHLBLoiT/YVkky8fx9mfqIEYg1VVXoc1Aqu3dj6E7HJtA3OX75pWgSszS8eQEnnzeP24dha8kgL4Cj2gRJIePZLPAvbRZ/mqi68OtgSvxYl8PLbhsc5RJ2Ip6jRBbWhwy6VthgKZLYD6ewRBUT1O4S2q3L6NS2i3yEFv/RrLG2NUpqINqbhnuMphztSReA4KsgHRi40Su7dG1v8cj2m59QLeVGB1PqCD2imMo5M9E0anRGj7q6kNJgmVhjcpVxwk0qOE+kiu6DJPc3zQzjaZw0s7q05x5/XhPIZBxF7fPiH+j9j3vCCKw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2D4E1YJs; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=jannh@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=2D4E1YJs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com; envelope-from=jannh@google.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f9ZFc37Q9z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Feb 2026 08:19:32 +1100 (AEDT)
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-65a38c42037so931a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Feb 2026 13:19:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770758364; cv=none;
        d=google.com; s=arc-20240605;
        b=f1bOiCAjq8xWr6JWRzn1aqapVkp8ytiqGqRuZQbigb5m46h3D0vRBdAJ19hVYYtk2S
         VCqBqJVxNXPq7H6g6vuSvfzPLzp6sDEEJLfo3shqZ3tscjABTdUYcuKx7G9GIPCeKQyq
         yl/4N8zsk8TXy3PkMrzMFCEf0z6h3qG8dZC1BWvkFKxMFh83Nt92Ah7jePLoLmf4v98m
         dPl1zQcc9fY0uyb7cFyiByk2SR4FDxg9i5OMkKjG47x5kCWz6lnL7SJsXYol1Kw6aGXx
         ATjGmNzwKqgQQq1zt6LWEs48oYYcZVN4dheuXbsh/nCraWq6V1NfUNW1xfQxgEOQ8SSh
         heMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7ueb2XLAZgSMqdZ7FzkgHkbOJxEx/nDgdsJxz5kcjsQ=;
        fh=gNc02WhhEmllVQCk2NKaVt0T4huc5Q4xRc+IKGtGVkU=;
        b=dKVmyvOkH17+XPEiNgHXcVgCs5I0LjJSiNfI9yvTyijYUdW3ZLlu5lROdItqzy666/
         BhCyp2YHWlgyD7OuSKYBSMe/+hMg3my3KhSvuvfCyZ1nA7VieDlVlSXkiO0DFc+UvuEp
         T5jF48gUY4EESbfswwITw7vELlhHRWkZMnf7/0jybImaeiNT0zh4RduNdevnUth8m3lr
         MnK+9mCsfsD6NWckn0xL+DqZ0Tcq6vpbg17zzQzWk45W26M1BESOK2lrFYZ4MVi953JS
         5VvEBQnXYI8YAVQxKfnDp1gYsk1P+jNi6qWeGFrwibPwN1vL1MJLxFrgrI9T2PeO/R4i
         MYsA==;
        darn=lists.ozlabs.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770758364; x=1771363164; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7ueb2XLAZgSMqdZ7FzkgHkbOJxEx/nDgdsJxz5kcjsQ=;
        b=2D4E1YJs1ZGsqQVuwNn6bBiS6+Fde77h0sESDoCWf/q0vjQ95JM5jiCtpTYTxW4mTG
         SfQaPbbm/dsBXUr8TzUBa4ZLmhGIVO+8JwNjhPKZjtMBXN4kpvFDKXixiifPMWWiygbI
         vgyqd6RfqgOR+6XlyP9ZbNalKpDi46pjcsLOmWYHPD9UdOJ9oV8u+4dCapAB8e5JoNH2
         o7Ild4C65+JYAGdCTCAR374iB/C27FIwJ8RukBhdqp+qUBvkSHG7gAst/z6nMXzmLoGA
         ZICidoIq/+aBj7i4VhuJA6g3BaicW/u+QFHH299zCu3eYXdSk1sCcES9tGer2UGyuIAn
         eV2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770758364; x=1771363164;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7ueb2XLAZgSMqdZ7FzkgHkbOJxEx/nDgdsJxz5kcjsQ=;
        b=wyShC2C8XOd2jR/V+RLOGwlNyilUApFsJmj+1J7w8JQuXmq5cy06NpS62Q1uGki8cn
         mZKuTjlaRuuaWL6yHoKYS+ZR8/ziGWO6iL6/oRVEMME5sk+fHkA2XbyH2/nZHlLhNKHg
         AIN83CiPIDWBX0E1DcmPZ2cdxsBnbJ7gL+rqlZ/V6iwOC5Jnx5BXBm6Kh68J5TYqLJ4K
         UesRdIDaUA4Scy0Lz4xPhh/BDJGrxiiSEamCViPMM/nVHyjpwb5EmbZJrm7XHI2Gq3S5
         ugiCQB9YC5x+LMJjJDUzIwydmIMLxG+XJja72AoGhIV/yPfO1dhE2wQUaYdgAjRhDeQT
         LxJw==
X-Forwarded-Encrypted: i=1; AJvYcCVVPOOWZLMd0Vs+9jIHp+EGp4L/YEj+CKaCsYUPNF+N3GlLnvplURIwP4xgVvIukllgpA2xyj47dt/cBu0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxMTXKBJXzqu2kDUrap9AiCxqnlYdXKwwL1YLcoyTd7iJGHQPN/
	Wijfko8MdgU/knSLz192WVhK+9mGWa8qVki3u6YxEWV2YP1bHowsWSnYmN7kb2E8rtGSyVULV+B
	Pg/jprSjW559OOfRUY+UJxLF+c1cg/2ltiTaC/sb2
X-Gm-Gg: AZuq6aJ8fU+oT7nGvp4alPmWjJDa2ryszsyzb+ypaWFPE9x9OgIZ+73MY9gQhvTHjdV
	ynek/jF8uzdZjVegppMvWT9BnyUQZ0efEYmEaE4FNP4JJelQQBm3us/DZ/Qr4cmm+2D5ie4f/81
	tIR6yX9If/lU3vUJPAz7F7MzImv+fs6JTW+YV7swJ653x5YfVAVA6RW8S4zUpHt90AEIMmCnAil
	/O21a8Q984umv+3j0XqUT0q1UPAB8UZGw1hS8u7yNWknJhuprPtE44EH/Q4irgGpAnazU80w0hz
	12OkbO5B+KF+7H/pFHwYHSF+DQ2xFAIdUZOt
X-Received: by 2002:a05:6402:8cf:b0:659:7696:432c with SMTP id
 4fb4d7f45d1cf-65a390b5a13mr6380a12.16.1770758363456; Tue, 10 Feb 2026
 13:19:23 -0800 (PST)
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
References: <20260209220849.2126486-1-surenb@google.com>
In-Reply-To: <20260209220849.2126486-1-surenb@google.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 10 Feb 2026 22:18:47 +0100
X-Gm-Features: AZwV_Qj1nCcIQNkC6tpOVx93iwKZtT2dbqwR4XsX_m7M7cfMNKnVzbH_C365zC4
Message-ID: <CAG48ez2zFfCO7RKhHKaATFge7DWzaTfO+Yta0y4_HXGHZAtkqw@mail.gmail.com>
Subject: Re: [PATCH 1/1] mm: replace vma_start_write() with vma_start_write_killable()
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, willy@infradead.org, david@kernel.org, 
	ziy@nvidia.com, matthew.brost@intel.com, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, gourry@gourry.net, 
	ying.huang@linux.alibaba.com, apopple@nvidia.com, lorenzo.stoakes@oracle.com, 
	baolin.wang@linux.alibaba.com, Liam.Howlett@oracle.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, baohua@kernel.org, 
	lance.yang@linux.dev, vbabka@suse.cz, rppt@kernel.org, mhocko@suse.com, 
	pfalcato@suse.de, kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com, 
	mpe@ellerman.id.au, chleroy@kernel.org, linux-mm@kvack.org, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-15.7 required=3.0 tests=ARC_SIGNED,ARC_VALID,
	DKIMWL_WL_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=2];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:surenb@google.com,m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jannh@google.com,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[33];
	TAGGED_FROM(0.00)[bounces-16788-lists,linuxppc-dev=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jannh@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linux-foundation.org,infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: AFFA711F5C4
X-Rspamd-Action: no action

On Mon, Feb 9, 2026 at 11:08=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
> Now that we have vma_start_write_killable() we can replace most of the
> vma_start_write() calls with it, improving reaction time to the kill
> signal.
[...]
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index dbd48502ac24..3de7ab4f4cee 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
[...]
> @@ -1808,7 +1817,11 @@ SYSCALL_DEFINE4(set_mempolicy_home_node, unsigned =
long, start, unsigned long, le
>                         break;
>                 }
>
> -               vma_start_write(vma);
> +               if (vma_start_write_killable(vma)) {
> +                       err =3D -EINTR;

Doesn't this need mpol_put(new)? Or less complicated, move the
vma_start_write_killable() up to somewhere above the mpol_dup() call.

> +                       break;
> +               }
> +
>                 new->home_node =3D home_node;
>                 err =3D mbind_range(&vmi, vma, &prev, start, end, new);
>                 mpol_put(new);
[...]
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index a94c401ab2cf..dc9f7a7709c6 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -425,14 +425,13 @@ static inline void process_mm_walk_lock(struct mm_s=
truct *mm,
>                 mmap_assert_write_locked(mm);
>  }
>
> -static inline void process_vma_walk_lock(struct vm_area_struct *vma,
> +static inline int process_vma_walk_lock(struct vm_area_struct *vma,
>                                          enum page_walk_lock walk_lock)
>  {
>  #ifdef CONFIG_PER_VMA_LOCK
>         switch (walk_lock) {
>         case PGWALK_WRLOCK:
> -               vma_start_write(vma);
> -               break;
> +               return vma_start_write_killable(vma);

There are two users of PGWALK_WRLOCK in arch/s390/mm/gmap.c code that
don't check pagewalk return values, have you checked that they are not
negatively affected by this new possible error return?

>         case PGWALK_WRLOCK_VERIFY:
>                 vma_assert_write_locked(vma);
>                 break;
[...]
> diff --git a/mm/vma.c b/mm/vma.c
> index be64f781a3aa..3cfb81b3b7cf 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -540,8 +540,12 @@ __split_vma(struct vma_iterator *vmi, struct vm_area=
_struct *vma,
>         if (new->vm_ops && new->vm_ops->open)
>                 new->vm_ops->open(new);
>
> -       vma_start_write(vma);
> -       vma_start_write(new);
> +       err =3D vma_start_write_killable(vma);
> +       if (err)
> +               goto out_fput;
> +       err =3D vma_start_write_killable(new);
> +       if (err)
> +               goto out_fput;

What about the new->vm_ops->open() call and the anon_vma_clone()
above? I don't think the error path properly undoes either. These
calls should probably be moved further up, so that the point of no
return in this function stays where it was.

>         init_vma_prep(&vp, vma);
>         vp.insert =3D new;
[...]
> @@ -1155,10 +1168,12 @@ int vma_expand(struct vma_merge_struct *vmg)
>         struct vm_area_struct *next =3D vmg->next;
>         bool remove_next =3D false;
>         vm_flags_t sticky_flags;
> -       int ret =3D 0;
> +       int ret;
>
>         mmap_assert_write_locked(vmg->mm);
> -       vma_start_write(target);
> +       ret =3D vma_start_write_killable(target);
> +       if (ret)
> +               return ret;
>
>         if (next && target !=3D next && vmg->end =3D=3D next->vm_end)
>                 remove_next =3D true;
> @@ -1186,17 +1201,19 @@ int vma_expand(struct vma_merge_struct *vmg)
>          * Note that, by convention, callers ignore OOM for this case, so
>          * we don't need to account for vmg->give_up_on_mm here.
>          */
> -       if (remove_next)
> +       if (remove_next) {
> +               ret =3D vma_start_write_killable(next);
> +               if (ret)
> +                       return ret;
>                 ret =3D dup_anon_vma(target, next, &anon_dup);
> +       }
>         if (!ret && vmg->copied_from)
>                 ret =3D dup_anon_vma(target, vmg->copied_from, &anon_dup)=
;
>         if (ret)
>                 return ret;

nit: the control flow here is kinda chaotic, with some "if (ret)
return ret;" mixed with "if (!ret && ...) ret =3D ...;".

>
> -       if (remove_next) {
> -               vma_start_write(next);
> +       if (remove_next)
>                 vmg->__remove_next =3D true;
> -       }
>         if (commit_merge(vmg))
>                 goto nomem;
>
[...]
> @@ -2211,9 +2240,8 @@ int mm_take_all_locks(struct mm_struct *mm)
>          * is reached.
>          */
>         for_each_vma(vmi, vma) {
> -               if (signal_pending(current))
> +               if (vma_start_write_killable(vma))
>                         goto out_unlock;
> -               vma_start_write(vma);

nit: might want to keep the signal_pending() so that this can sort of
be interrupted by non-fatal signals, which seems to be the intention

>         }
>
>         vma_iter_init(&vmi, mm, 0);
> @@ -2549,7 +2577,9 @@ static int __mmap_new_vma(struct mmap_state *map, s=
truct vm_area_struct **vmap)
>  #endif
>
>         /* Lock the VMA since it is modified after insertion into VMA tre=
e */
> -       vma_start_write(vma);
> +       error =3D vma_start_write_killable(vma);
> +       if (error)
> +               goto free_iter_vma;

This seems way past the point of no return, we've already called the
->mmap() handler which I think means removing the VMA again would
require a ->close() call. The VMA should be locked further up if we
want to do it killably.

>         vma_iter_store_new(vmi, vma);
>         map->mm->map_count++;
>         vma_link_file(vma, map->hold_file_rmap_lock);
>

