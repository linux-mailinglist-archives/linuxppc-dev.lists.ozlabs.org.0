Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF52282C806
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jan 2024 00:38:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rkDqJmkl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TBdKC5WXxz3c5q
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jan 2024 10:38:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rkDqJmkl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=yosryahmed@google.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TBdJF5XCvz2xwH
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jan 2024 10:38:04 +1100 (AEDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50eac018059so8712173e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jan 2024 15:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705102678; x=1705707478; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D130Haic3fJ8XBJFw+SdYFyFWmLLHqb4ygQbVbZqeRI=;
        b=rkDqJmklJEzPD9rzOPW9TO59QF5jU23SEPdGzZ+OVbJe5IQrIV5jrc0eWNn/SVfcYJ
         JmUINAfoB15M9TEqS5iTR31buO3EQmkrfVcwtMmVDR2YFd6z40W53prZuHb6TbAvNIRq
         KTMMQ4rsEqi3v7fSD2zHJTRkhsF06+qsX3uhWgLQ3d3ZXa9gwJEfwQGgPL4vSmnwwxGj
         yZAjctSAKkH4whS4jGZakMfG9RrD7Ixwx6w5F2CrFimesZUmFDdxJpa9VDJbzQqQ7fnH
         22aT2aF/XG1kfipxjWy9lZJvKyLxSVwl/ffxIK0RwQ4p6OBldfnjhyG+QMRdLFm+xQpX
         m+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705102678; x=1705707478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D130Haic3fJ8XBJFw+SdYFyFWmLLHqb4ygQbVbZqeRI=;
        b=JDBQEqmUAqPL7O7U46QAKl4De5pHZ384nw4812BcWbwCnrXzTg+MeEfnGr6D0FX25f
         x7RipgCyzXpYBy1ZJ8eEZeILyydG/kAhoBoD/zYdC2cMWGCaUnNQBDn9Qh2iLzGTtx3a
         u+PRUyISfarStVX02xYsotGr5vQ9hMkyLqLrLMnt/UtwFUnlM61g9m2ND8853LFqiqZo
         zIte/ZLopOOfzWU0KgowZwa/+DZXRf5GuCvBvM47w6fBXUTbWdiofN7F8Uc/6bj5W7ZG
         JA7b3G6vW135m1HCzgAcboL4w3t99TfAtsrQnE5pC1d1xFsGyv+4Ud8zLrhyk6NOlzJP
         wY5A==
X-Gm-Message-State: AOJu0YzsRwm+NasMp5Kwju3SoqI3/O+cMFlaHYgruzYgkIbVdg0eaM+9
	x3VycQIyNDOrvWovnJLk9r9Mk5yXssVqtzv1Yvc9NvOVTW6M
X-Google-Smtp-Source: AGHT+IF9VftxTlnm9TW+u2N8M7OK49IFFcQO1e0lX02zmtEMviiex02lbBZwZzubrEoSy0Nk7DdRybqXFNy0lBuXPHY=
X-Received: by 2002:a19:e054:0:b0:50e:bb4d:e502 with SMTP id
 g20-20020a19e054000000b0050ebb4de502mr969238lfj.122.1705102677596; Fri, 12
 Jan 2024 15:37:57 -0800 (PST)
MIME-Version: 1.0
References: <20240112193103.3798287-1-yosryahmed@google.com> <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
In-Reply-To: <CAKEwX=PXfZssERxeMS3FpMP7H0psMzC72C2ga3fqr_Qh88M75A@mail.gmail.com>
From: Yosry Ahmed <yosryahmed@google.com>
Date: Fri, 12 Jan 2024 15:37:18 -0800
Message-ID: <CAJD7tkYqKve5V4eJjbZE8kPZ=-5DU1Xh6jym8OfE1twQz-vbUA@mail.gmail.com>
Subject: Re: [RFC PATCH] mm: z3fold: rename CONFIG_Z3FOLD to CONFIG_Z3FOLD_DEPRECATED
To: Nhat Pham <nphamcs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Miaohe Lin <linmiaohe@huawei.com>, Sergey Senozhatsky <senozhatsky@chromium.org>, Huacai Chen <chenhuacai@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, linux-mm@kvack.org, loongarch@lists.linux.dev, Johannes Weiner <hannes@cmpxchg.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Minchan Kim <minchan@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, WANG Xuerui <kernel@xen0n.name>, Vitaly Wool <vitaly.wool@konsulko.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 12, 2024 at 11:42=E2=80=AFAM Nhat Pham <nphamcs@gmail.com> wrot=
e:
>
> On Fri, Jan 12, 2024 at 11:31=E2=80=AFAM Yosry Ahmed <yosryahmed@google.c=
om> wrote:
> >
> > The z3fold compressed pages allocator is not widely used, most users us=
e
> > zsmalloc. The only disadvantage of zsmalloc in comparison is the
> > dependency on MMU, and zbud is a more common option for !MMU as it was
> > the default zswap allocator for a long time.
>
> Johannes and I were chatting about this the other day. We might be
> able to disable certain zsmalloc behavior in the case of !MMU, making
> it available there too. Once that's happened, we can outright remove
> z3fold and zbud, and have one allocator to rule them all? :)

(Adding Sergey and Minchan for visibility)

I didn't want to bring up the zsmalloc MMU dependency in this thread
to reduce noise, but that's also what I had in mind. Sergey and I were
also chatting about this the other day :)

I thought deprecating z3fold is the low hanging fruit. Then, once we
can sort out the MMU dependency in zsmalloc, we can go after zbud as
well.
