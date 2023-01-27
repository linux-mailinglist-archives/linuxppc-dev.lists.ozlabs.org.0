Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E689967F002
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:57:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3VJ263jzz3chK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 07:57:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=E8yJ7N9z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1134; helo=mail-yw1-x1134.google.com; envelope-from=surenb@google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=E8yJ7N9z;
	dkim-atps=neutral
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3VH61qxjz3cfj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 07:56:17 +1100 (AEDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-50aa54cc7c0so55560397b3.8
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 12:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=e+UKvH7+Fs0UBN0fQYs2fra7FelxOXxsOOmTjKmz4Bk=;
        b=E8yJ7N9znM0aToa4LxzQHUBZn3b5x2U1d1NWdDmLWflzMnqSetaFDiht0QQJTSjCnC
         Qo//IGO3iJS8K8gckFQUA70aGC+vZyFuRK7+B8r0GjHNLP4D+jqM1fUl4SekM6in6Nxy
         Z+JZ9RL15W8p9FW0FWiNA2c46yBUvHDyUz7Lhupci++hv++YjjBtACUE1uhQEgZQ0bVj
         rP0UZcpjzu3430SG0pn9W++pmGI1vQhgwerQo1eS6B/AzBF3agvhUSbve89Tno9r4IYs
         LgamG4aw4/mVOctaL0ruQYNGIiV5K8BbfAW0+byriKBV+7Q7dXAHF0FDTt8tkGXljW3C
         h8Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e+UKvH7+Fs0UBN0fQYs2fra7FelxOXxsOOmTjKmz4Bk=;
        b=PRVRiEoeOsSkuSUOSubuknbGC01ykEzr0z/B2aiAXEKxPWOP1NTFCrhbCQ3N3czbuq
         jRcCzKpx7blD1JWz9w3eQ3+guFHaaphYzIrfyRm3Pm0XnKOiRZqST/fD7witp8jiPUIT
         tx+W2wClXbjfwfbQU+Xrx3eVMvoKps+NLPWklZQ81SVdxnxQuk7ZyA5Vn3RyiuaQscOz
         0qEedsqZT/Ub8mL74vchYEFPzDKjBc6ulE8CWYWW7eWazcHaR2LfZz9CY8VrF/cpNsEY
         vsFsvtOr4ESydvUHL8N0ZrXiH4hKvrtDw8/0HJ2aYWvYy45pNEJRuIt2B22ExpGTxsZo
         J/bA==
X-Gm-Message-State: AO0yUKVNRwnXaMx09J6Z/eWsTLvNuE+b5lwr05qcho07LatbcdfPyNhI
	huQhTi5YJJ3c2VW2JveGmX4YDNeF7U9bqtYF5xoYmw==
X-Google-Smtp-Source: AK7set9X+MemZwETKZc4IHg1twC+Il9/CFR1bpn9h2wXhLc2t6gCqLQVfqsQTiQzJwwYAUMtSxNAvjWnDd7kQbg6W74=
X-Received: by 2002:a81:1e46:0:b0:509:115b:a39b with SMTP id
 e67-20020a811e46000000b00509115ba39bmr859277ywe.263.1674852973662; Fri, 27
 Jan 2023 12:56:13 -0800 (PST)
MIME-Version: 1.0
References: <20230126193752.297968-1-surenb@google.com> <20230126193752.297968-4-surenb@google.com>
 <20230127174530.sws4xg3qjsx3agh4@offworld>
In-Reply-To: <20230127174530.sws4xg3qjsx3agh4@offworld>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 27 Jan 2023 12:56:02 -0800
Message-ID: <CAJuCfpGfbP=HcZMRzqvvWSk7+EZEwrQMhE2VhDYXNgX-HRrvLA@mail.gmail.com>
Subject: Re: [PATCH v4 3/7] mm: replace VM_LOCKED_CLEAR_MASK with VM_LOCKED_MASK
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org, michel@lespinasse.org, 
	jglisse@google.com, mhocko@suse.com, vbabka@suse.cz, hannes@cmpxchg.org, 
	mgorman@techsingularity.net, willy@infradead.org, liam.howlett@oracle.com, 
	peterz@infradead.org, ldufour@linux.ibm.com, paulmck@kernel.org, 
	mingo@redhat.com, will@kernel.org, luto@kernel.org, songliubraving@fb.com, 
	peterx@redhat.com, david@redhat.com, dhowells@redhat.com, hughd@google.com, 
	bigeasy@linutronix.de, kent.overstreet@linux.dev, punit.agrawal@bytedance.com, 
	lstoakes@gmail.com, peterjung1337@gmail.com, rientjes@google.com, 
	axelrasmussen@google.com, joelaf@google.com, minchan@google.com, 
	rppt@kernel.org, jannh@google.com, shakeelb@google.com, tatashin@google.com, 
	edumazet@google.com, gthelen@google.com, gurua@google.com, 
	arjunroy@google.com, soheil@google.com, leewalsh@google.com, posk@google.com, 
	linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 27, 2023 at 10:12 AM Davidlohr Bueso <dave@stgolabs.net> wrote:
>
> On Thu, 26 Jan 2023, Suren Baghdasaryan wrote:
>
> >To simplify the usage of VM_LOCKED_CLEAR_MASK in vm_flags_clear(),
> >replace it with VM_LOCKED_MASK bitmask and convert all users.
>
> Might be good to mention explicitly no change in semantics, but
> otherwise lgtm

Thanks! I'll add that if a new version is cut in the future.

>
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
