Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F72A59C0A0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 15:32:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBCvk05Bkz3cfL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 23:32:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oAGzPeST;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22e; helo=mail-oi1-x22e.google.com; envelope-from=alexdeucher@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=oAGzPeST;
	dkim-atps=neutral
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBCv82HNrz2ypC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 23:31:46 +1000 (AEST)
Received: by mail-oi1-x22e.google.com with SMTP id bb16so12173920oib.11
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Aug 2022 06:31:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=6WVjOrRJCECWMxjcl8nSD1ItRBPOEa+Itaj/XCvb2go=;
        b=oAGzPeSTZ0vxyJxjypstEFq2wlDSFbqy4W20nT26f4IonPW2btsHWwoI6TFovQKtPH
         OVt0yKLAzY8ARGBubtDDx784QNp0bnfaQ5A7omPby/nVq0RAYC4O2m6qo+sNnDzyV/EF
         ZbMR5HZWcC5IxJ/NHIOlo55BXThBNYjTLXxUuDXCLVm2KCd2vmcIML7uF2CuwVqvMpx5
         PGWBdLdq95Y+GINSqToObZG5MY9yQv9MidDw4sH88GN1vK1y8Mr1pH+EyASoC6hGi6fm
         CkGXP7qMVDbz+MA5+Dt2pVfOiYYxaA6k3Mi6ex+jHIBZeCR9E5Jl7AHHkVhXYpNpVNGB
         nXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6WVjOrRJCECWMxjcl8nSD1ItRBPOEa+Itaj/XCvb2go=;
        b=ckYDKrnck9fwDOPlvwyHGEJT33W49cmC0W3OmvKEpdeulbpDAGkz+wMWH6usAZb28Z
         /UpYkgB4GA1LVXyJjTxd3TuenycxlHVXs8LD7YHyKsQTUX2p4ZH0139wnk5cIVwpFM4e
         q5a3Bb/lP+5cnNiZEhOMIqI72FnAJe1R1RwWm6tRr+yUYTXTHCzPXRn0NvagygKXix6W
         deVVU3PeQqgxQIvADCEEraqZf6Z5ufmPwcYjGe547DNFBw4q6kNoscioRfpGyLF0tBqt
         QEkKHpdhKYRkEVbm7OtSQF85u2jFH1ngYt9jcUs4AAX7olcFU7aR6/Za7ffYvtJMQo98
         UgRg==
X-Gm-Message-State: ACgBeo1P8rhqwi//d8z5Ys8t6Q9h4Qs4sV3TdVcdawhcfRlpPAW6D96q
	dRD7K4s/Oq/1zNda7XM72B0sUKsHEh40+19VydU=
X-Google-Smtp-Source: AA6agR6Cwk55gcuoQgIgnKhgffJRYAliThwIfgR7aCZCIUD7OUGPbbQunhOd6bmeVuKzHCAom2dWtNzACZFk33vO/JA=
X-Received: by 2002:a05:6808:ecb:b0:33a:3b54:37f9 with SMTP id
 q11-20020a0568080ecb00b0033a3b5437f9mr8913358oiv.33.1661175101159; Mon, 22
 Aug 2022 06:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220819210112.7924-1-rdunlap@infradead.org> <87o7wdkkt4.fsf@mpe.ellerman.id.au>
 <YwNovfuf3pDBh2Zk@infradead.org>
In-Reply-To: <YwNovfuf3pDBh2Zk@infradead.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 22 Aug 2022 09:31:30 -0400
Message-ID: <CADnq5_NOedr2TGH0W9wVAPkrJyyJ_+eAkEUORbYvShY4UW90sw@mail.gmail.com>
Subject: Re: [PATCH] powerpc: export cpu_smallcore_map for modules
To: Christoph Hellwig <hch@infradead.org>
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
Cc: "Gautham R . Shenoy" <ego@linux.vnet.ibm.com>, Randy Dunlap <rdunlap@infradead.org>, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>, Lai Jiangshan <jiangshanlai@gmail.com>, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>, Nicholas Piggin <npiggin@gmail.com>, Tejun Heo <tj@kernel.org>, linuxppc-dev@lists.ozlabs.org, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Aug 22, 2022 at 9:16 AM Christoph Hellwig <hch@infradead.org> wrote:
>
> On Mon, Aug 22, 2022 at 01:40:23PM +1000, Michael Ellerman wrote:
> > Randy Dunlap <rdunlap@infradead.org> writes:
> > > drivers/gpu/drm/amd/amdkfd/kfd_device.c calls cpu_smt_mask().
> > > This is an inline function on powerpc which references
> > > cpu_smallcore_map.
> > >
> > > Fixes: 425752c63b6f ("powerpc: Detect the presence of big-cores via "ibm, thread-groups"")
> > > Fixes: 7bc913085765 ("drm/amdkfd: Try to schedule bottom half on same core")
> >
> > That 2nd commit is not in mainline, only linux-next.
> >
> > I don't mind merging this fix preemptively, but is that SHA stable?
>
> I really do not think this has any business being exported at all.
>
> kfd_queue_work is not something that should be done in a driver.
> Something like this belongs into the workqueue core, not in an
> underdocumented helper in a random driver.
>
> Drm guys:  once again, please please work with the maintainers instead
> of just making up random stuff in the drivers.

Discussions are already ongoing with the workqueue folks.  I'll drop
this for now.

Alex
