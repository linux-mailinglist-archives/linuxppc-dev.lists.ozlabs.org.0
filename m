Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C8696A0C39
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 15:52:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMwx03X9hz3cMt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 01:52:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kEJxBS9j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=42.hyeyoo@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kEJxBS9j;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMww464xLz3bWw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 01:51:46 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id nw10-20020a17090b254a00b00233d7314c1cso13285420pjb.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 06:51:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AEUVY9QBnLvwF98etOxaJbhE4h++5n3g+trhyX9ajRk=;
        b=kEJxBS9j71RwghpfwM+h/k5OW36kiC6Bau1D0zJJ3QwxCosQAEaUK7j8tlK41kc372
         jK1AADV4wurJ2USeEy3Qb3IoZYz7jy9ouXXwQiZPIOzN/hnHXnim+gNwkN6josRZPdKE
         zaRfSn3NnFGwiQk0EwXuHH+jFcCZgi9GSxH2IKqeJi43ijz+Inv/1bUpQb2rA+Gu9ZnD
         BdNhk1Rrg4YRto9XmYSTecFdDBjr+OkX2yPagOmgcXXAMVOBd7ja+dnDxpopcXvHVdyn
         uL/uyIVnexBrmXjc7Z4tOC4UdFSmA1l7Ga/SePzc4wptHfBfo+xOUElBSfukEMRbQAOn
         wWtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AEUVY9QBnLvwF98etOxaJbhE4h++5n3g+trhyX9ajRk=;
        b=l5UHSmAlfTREWYohWt0+gqOCDsedI2szBaV9Q1UFtqPyaJOr3Z7+dPTENPGmbfGeSZ
         Ld71Ef6Egf+ckshi6p1zfoj7IFoksSJLyqmCCQg/hFu2jBMOEto/7XGP3npSkGvPURuY
         kRRG71GcvclIKz9R7ZCjIps1o5IiGnT3EdFPag7N+0J6ZqVd5sMdyIIylHvkOFZbG7Zv
         TGY+CjEdtKij4+vpgNhaWsPtMZHoIYYxTZngjw30A8ep7vo4XyPl3fwJy1Sij9dbwbHy
         iWf/pvTMMRxvfxeDXB0FIMLFz58yh6SK7z4edT57iN3hV2FL1zVw9s9BwMatNvNfcz9m
         xqpQ==
X-Gm-Message-State: AO0yUKUVxTmRCpzSKW90axV8Tl/WUM821LoBuMMJA/moABXAJR5icHOe
	NObU5xehhnBx+bI+GPcSS/M=
X-Google-Smtp-Source: AK7set+AXrDvurkmZHBIHkoQR4SlgO4/MpxUgUaKT4owdS7TPv/KoAYY+Ao1bQkwjxAqSPbEXm7qnQ==
X-Received: by 2002:a17:902:c408:b0:19a:b869:f2ef with SMTP id k8-20020a170902c40800b0019ab869f2efmr16382793plk.15.1677163901908;
        Thu, 23 Feb 2023 06:51:41 -0800 (PST)
Received: from localhost ([2400:8902::f03c:93ff:fe27:642a])
        by smtp.gmail.com with ESMTPSA id iz1-20020a170902ef8100b00195f0fb0c18sm966230plb.31.2023.02.23.06.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Feb 2023 06:51:40 -0800 (PST)
Date: Thu, 23 Feb 2023 14:51:27 +0000
From: Hyeonggon Yoo <42.hyeyoo@gmail.com>
To: Suren Baghdasaryan <surenb@google.com>
Subject: Re: [PATCH v3 16/35] mm/mmap: write-lock VMAs before merging,
 splitting or expanding them
Message-ID: <Y/d9b5Ev6vAEzzVO@localhost>
References: <20230216051750.3125598-1-surenb@google.com>
 <20230216051750.3125598-17-surenb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230216051750.3125598-17-surenb@google.com>
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, akpm@linux-foundati
 on.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 15, 2023 at 09:17:31PM -0800, Suren Baghdasaryan wrote:
> Decisions about whether VMAs can be merged, split or expanded must be
> made while VMAs are protected from the changes which can affect that
> decision. For example, merge_vma uses vma->anon_vma in its decision

Did you mean vma_merge()?

> whether the VMA can be merged. Meanwhile, page fault handler changes
> vma->anon_vma during COW operation.
> Write-lock all VMAs which might be affected by a merge or split operation
> before making decision how such operations should be performed.
>

It doesn't make sense (to me) to update vma->anon_vma during COW fault.

AFAIK children's vma->anon_vma is allocated during fork() and
page->anon_vma is updated on COW to reduce rmap walking because it's now
unshared, no?

As patch 26 just falls back to mmap_lock if no anon_vma is set,
I think we can assume nothing updates vma->anon_vma (and its interval
tree) if we are holding mmap_lock in write mode.

Or am I missing something?

--
Regards,
Hyeonggon
