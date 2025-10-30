Return-Path: <linuxppc-dev+bounces-13555-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EFEC20433
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Oct 2025 14:36:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cy4rZ1QtXz30V1;
	Fri, 31 Oct 2025 00:36:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761831374;
	cv=none; b=LR0kLQ44V+AXN657rpMDewDiqvXWZQqA3KAw9UvL6qofQyluUyvj3V7x/ZWa72jghymFKtaKsh+DhgxD9tAzR8dWH/TcQHZNBhXyU96zDz5mUMZ8XihGoRnTc6i4Wx9M9EheopckEf6ebKkX/s3a+u9Q9Lq/LjlgDhky7yB7JcO6hNrtWKIzQqj65V5L40rJo/7xAleEYGKKybjuthvAZR8gnCuFtkcqshEYArijF5o4t5x6cmqCGyUmdxRhIYYnTHeESOey9KCE1Es+/5XShaoWPcc3hBPZj7gysLSTs3I6D5cr0/amNAe6apPrMJRSfEA+Rc4D3UaipmAyycdHBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761831374; c=relaxed/relaxed;
	bh=xhRXZRwTf8Wfm4C/x1JXmtSa/La+hRIdRb6fxoCgqmI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BdPqSP+F34L8c7fHwA2l4BoOGfBiTozq/JgxvUv2fE+g/B2PDk8cMzl7aDootby/gEtVPUJ2W9/qkF6VcVmNpK3nTVrxz4VqGHIw+OVlz4cJ06D1/s2LkJdSZcrX0MOeQOjlJ0mfdLHrZLXjyQgZUexi57rCiN9BumP4R/hipYHrZ9jokTLVY23OEAAN//WPkX1kyQnMrDhyyhLfLNH2ef8CEO4jUCeOCQ8YCt67DI8W/xz/nS1j9CqQolfs2lE0kdx5iUsTKBP4k1+ma8uVO/pGD0smP8fGT/5z4UGz8RXKhXAcfF0eBKWtIa2Fk+DVElEfAVMmaNenu2K2X0ofQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mo4w8M+z; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mo4w8M+z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cy4rR0fL6z2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Oct 2025 00:36:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE45445C5C
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:36:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2FF9C4AF09
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 13:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761831364;
	bh=946tCSyfwkcJEZIYbJYPYmAWxgbWBFpGqs507Chemqs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Mo4w8M+zoG7x4VSKBHFBlkcNbJr8yuOPcibcxBBGoKKL/xxYP6SoTzLLo4MNs3B3W
	 LXBRGiqiBcuymn4pvOVdEzE+RhAUAEeSzEzaMVgkWQfQdcCqM8chFRdyPlB8uyQjhI
	 Sy04DC7qmGww/ewmG6nPtqVrjY2mNjujRFnNwL7bqfm0FwXXsFy8N/4MjZzNCTEKM6
	 AH9cxSZFPyaoQjhLwB8gKrOvY8VBqCrViJzhsfAiHRlbe8Pd48ohtXcde5WYc+J+Ks
	 xtnvYufRNIqRkyzqUNQQ8FGGMaRxPzAYxs8fhTOpNjbPwsbTzNyqAjyH/iSW6qfl8l
	 9rr9LsibKVXjw==
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-37a17d470dfso2742861fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Oct 2025 06:36:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUD5Vp2xRmYItJMOv1L97m6EYyt0sm7XxbmI3w4Ld/zDpCOPIboCEBfXj7UK/XiqdZOfQ4oNnryAtwZ97Q=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxRSlVePxIHlvzTGBh2ySwUNXyUGDfBW6JEkc7m8eRsLrAUSHuv
	GucSX+ORWICgdY4zkknYBAsKKBgltN93SWwvXE1av/KwHlFF2n6BSUQlW9hElDQDZbHDtRhLdHd
	Jwzz4lb83+/cVrD2TKmTq3/tKOIyfbG0=
X-Google-Smtp-Source: AGHT+IHPsQ63GACF+WTAXoqOco8sKMg1RRh6aHz0Br4Fnz15qbhOtOELzGrlJEWp65H1oXl/2WnpIpMcc/ndPgk67GM=
X-Received: by 2002:a2e:9e56:0:b0:376:30c5:66ef with SMTP id
 38308e7fff4ca-37a1094a526mr7884761fa.16.1761831362808; Thu, 30 Oct 2025
 06:36:02 -0700 (PDT)
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
References: <20251028004614.393374-1-viro@zeniv.linux.org.uk>
 <20251028004614.393374-23-viro@zeniv.linux.org.uk> <66300d81c5e127e3bca8c6c4d997da386b142004.camel@HansenPartnership.com>
 <20251028174540.GN2441659@ZenIV> <20251028210805.GP2441659@ZenIV>
 <CAMj1kXF6tvg6+CL_1x7h0HK1PoSGtxDjc0LQ1abGQBd5qrbffg@mail.gmail.com>
 <9f079d0c8cffb150c0decb673a12bfe1b835efc9.camel@HansenPartnership.com> <20251029193755.GU2441659@ZenIV>
In-Reply-To: <20251029193755.GU2441659@ZenIV>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 30 Oct 2025 14:35:51 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHnEq97bzt-C=zKJdV3BK3EDJCPz3Pfyk52p2735-4wFA@mail.gmail.com>
X-Gm-Features: AWmQ_bm2LrdVSSm_iuRDZ6ti_gfIvNqTw5CQZuyqzyGspRRRkaM_-X7LCT9AH9Q
Message-ID: <CAMj1kXHnEq97bzt-C=zKJdV3BK3EDJCPz3Pfyk52p2735-4wFA@mail.gmail.com>
Subject: Re: [PATCH v2 22/50] convert efivarfs
To: Al Viro <viro@zeniv.linux.org.uk>, 
	James Bottomley <james.bottomley@hansenpartnership.com>, brauner@kernel.org
Cc: linux-fsdevel@vger.kernel.org, torvalds@linux-foundation.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, paul@paul-moore.com, casey@schaufler-ca.com, 
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com, 
	selinux@vger.kernel.org, borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 29 Oct 2025 at 20:38, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Wed, Oct 29, 2025 at 02:57:51PM -0400, James Bottomley wrote:
>
> > I think this all looks OK.  The reason for the convolution is that
> > simple_start/done_creating() didn't exist when I did the conversion ...
> > although if they had, I'm not sure I'd have thought of reworking
> > efivarfs_create_dentry to use them.  I tried to update some redundant
> > bits, but it wasn't the focus of what I was trying to fix.
> >
> > So I think the cleanup works and looks nice.
> >
> > >
> > > Relying on the -EEXIST return value to detect duplicates, and
> > > combining the two callbacks seem like neat optimizations to me, so
> > >
> > > Acked-by: Ard Biesheuvel <ardb@kernel.org>
> > >
> > > but I have to confess I am slightly out of my depth when it comes to
> > > VFS stuff.
> >
> > Yes, ack too.
>
>         Umm...  FWIW, I've got a few more followups on top of that (see
> #untested.efivarfs, current head at 36051c773015).  Not sure what would
> be the best way to deal with that stuff - I hope to get the main series
> stabilized and merged in the coming window.  Right now I'm collecting
> feedback (acked-by, etc.), and there's a couple of outright bugfixes
> in front of the series, so I'd expect at least a rebase to -rc4...
>

I pulled your code and tried to test it. It works fine for the
ordinary case, but only now I realized that commit

commit 0e4f9483959b785f65a36120bb0e4cf1407e492c
Author: Christian Brauner <brauner@kernel.org>
Date:   Mon Mar 31 14:42:12 2025 +0200

    efivarfs: support freeze/thaw

actually broke James's implementation of the post-resume sync with the
underlying variable store.

So I wonder what the point is of all this complexity if it does not
work for the use case where it is the most important, i.e., resume
from hibernation, where the system goes through an ordinary cold boot
and so the EFI variable store may have gotten out of sync with the
hibernated kernel's view of it.

If no freeze/thaw support in the suspend/resume path is forthcoming,
would it be better to just revert that change? That would badly
conflict with your changes, though, so I'd like to resolve this before
going further down this path.


I did need to apply a fixup to get the revert to compile:

--- a/fs/efivarfs/super.c
+++ b/fs/efivarfs/super.c
@@ -412,8 +412,7 @@
 {
        unsigned long size;
        struct efivarfs_ctx *ectx = container_of(ctx, struct efivarfs_ctx, ctx);
-       struct qstr qstr = { .name = name, .len = len };
-       struct dentry *dentry = d_hash_and_lookup(ectx->sb->s_root, &qstr);
+       struct dentry *dentry = try_lookup_noperm(&QSTR_LEN(name,
len), ectx->sb->s_root);
        struct inode *inode;
        struct efivar_entry *entry;
        int err;

