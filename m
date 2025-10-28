Return-Path: <linuxppc-dev+bounces-13468-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA0AC1708E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Oct 2025 22:35:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cx3Z44wGCz2yGM;
	Wed, 29 Oct 2025 08:35:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761687308;
	cv=none; b=kU81K1fMVyk3ZfAo+LxS1Ta2SXHmYm11lNn8KEONbHiwMgzSTSl9rfJCh301FHB6VaArPnSxsR5oHRrktvh6RlzZju3kZiGdsUutcL8KMZCa4locu8QE/BOcbfvId4YvppDDgfg7gkQqvzSRIQxQEfNg62R6G9HXTeL6BvLXRy1/DG/OksNTI1pGEY8sEVWCWpSB5590CJWM1PsRq0uUJqKoHc4bJ4gx6Vm2fPt066RzMUPmosGXEfZTbAmjQbuw/KBr3+Vya+PHKZvvxjymEsZ85sgIZEyHj27g7dF8qvYQxOXksjjwdmCTKP6/S5/1FiTPT/3vc/3bS3mlKqV64A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761687308; c=relaxed/relaxed;
	bh=LDsqZFSQoDFk6Jgv3OgSzqGmp9ygmJ1z30XLWqHxNxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDhxupCzf3J9cKvrBGVmFtYv0kLo/GyyEDiQ4iw4qKfe413SvSlvihChtoDD2el2KcZL4t5OMwqZvRcGbs/T2rEb5D/Ldppxez1yUE7SATp62wWGJK0L8rNLqzmTZLhDOUJBj0dGfNmMPM3P8+P8MdwGOFHB+XrdhA03CvBFnk4EEG/Oz2A+t4goRVaZsMmzbJ1m43QBhJdUvMuHRFD8LuZtfB5dWnEb8KNxb6Jlz9bU8TTBaJnipfSIpKJyFHkrralvSk34Jg+uk5XB2dKgr5K/5SwZAAEwe60kY+uIQclmTppl3JEU5/db6y8ed40NIpT6yNT4JWgdaTnxXjak8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r93s37by; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r93s37by;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=ardb@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cx3Z33zbFz2yFw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Oct 2025 08:35:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7339549164
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 21:35:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB8AC2BC87
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 21:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761687305;
	bh=R2i31H9vGUKt8c9pEDO8kNOSs2JZfSsFlvxECOPAMbQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=r93s37byBu5Kqu2QNWAApFRsKMEiKn+rnGBu28Yh213bmXlXtpGYHy6Md1GZVj5bM
	 s5vnSo0yrYRMDPmHpEUorqNbrzfUbLmxqipY4eXZSatd2x/wYVLZWkfxLbVUyrJnqB
	 qzzqP0cqOIMCM1+yieYa4Jpw8ExK8yVQ10CoTtDy/YpQpSoWeYoXUNtfhEmCx16Hlx
	 hAutjjpMeCNc9SkrGfI4cOnOn4oU/nFvmIHsnMpTitKiMXtsQmuipZbmLKSEJQNkuU
	 lggI9QCrsvI59YWcEgE4fHKT+JxK/C1s0+GH6Knmt4VFXcIEFUXIvCxgclL3uQke9v
	 P+fvzMKknG1XA==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-378cffe5e1aso68880941fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Oct 2025 14:35:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXsLRsEU/n/kTt59EQ46LfZJ539r8O0gfRLj/L8WC0J2OEPlAF1f5h2EwjlRh6gX2HIl9eFyTNGnO1mjeM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy5msB+pUVGbKl0HYZnIuVaAKCzuiMW834JWqBhI5bz1pdDplla
	iG/Up7w7M7eKbPFBQzRlPCJRSoj0JQ7PPIAEUmXU933epsuakBWPj8SmgztC2tDgkPViKlADrkv
	5solP1JJePYUoh3Uwz6CCpJcqUbz6BkY=
X-Google-Smtp-Source: AGHT+IEUgTLUAIKN7pUG+BuUf5d2rQVkYmo1LrGvDv+SiZ+/7mc0PZPnIKuDcBIJFaSVmyoUk9OgmOBn+4n7FgjOtLw=
X-Received: by 2002:a05:6512:3b0c:b0:592:fce6:9054 with SMTP id
 2adb3069b0e04-594128c4f37mr242551e87.52.1761687303564; Tue, 28 Oct 2025
 14:35:03 -0700 (PDT)
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
In-Reply-To: <20251028210805.GP2441659@ZenIV>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 28 Oct 2025 22:34:51 +0100
X-Gmail-Original-Message-ID: <CAMj1kXF6tvg6+CL_1x7h0HK1PoSGtxDjc0LQ1abGQBd5qrbffg@mail.gmail.com>
X-Gm-Features: AWmQ_bkR_zy3h447gWqfy_yWS54Z8UsgWDqAQbawTspKnXeI6tlX292HDo0fyss
Message-ID: <CAMj1kXF6tvg6+CL_1x7h0HK1PoSGtxDjc0LQ1abGQBd5qrbffg@mail.gmail.com>
Subject: Re: [PATCH v2 22/50] convert efivarfs
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: James Bottomley <James.Bottomley@hansenpartnership.com>, linux-fsdevel@vger.kernel.org, 
	torvalds@linux-foundation.org, brauner@kernel.org, jack@suse.cz, 
	raven@themaw.net, miklos@szeredi.hu, neil@brown.name, a.hindborg@kernel.org, 
	linux-mm@kvack.org, linux-efi@vger.kernel.org, ocfs2-devel@lists.linux.dev, 
	kees@kernel.org, rostedt@goodmis.org, gregkh@linuxfoundation.org, 
	linux-usb@vger.kernel.org, paul@paul-moore.com, casey@schaufler-ca.com, 
	linuxppc-dev@lists.ozlabs.org, john.johansen@canonical.com, 
	selinux@vger.kernel.org, borntraeger@linux.ibm.com, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 28 Oct 2025 at 22:08, Al Viro <viro@zeniv.linux.org.uk> wrote:
>
> On Tue, Oct 28, 2025 at 05:45:40PM +0000, Al Viro wrote:
>
> > FWIW, having a special path for "we are in foofs_fill_super(), fuck
> > the locking - nobody's going to access it anyway" is not a great
> > idea, simply because the helpers tend to get reused on codepaths
> > where we can't cut corners that way.
>
>         BTW, looking through efivarfs codebase now... *both* callers
> of efivarfs_create_dentry() end up doing dcache lookups, with variously
> convoluted call chains.  Look: efivarfs_check_missing() has an explicit
> try_lookup_noperm() before the call of efivarfs_create_dentry().
> efivarfs_callback() doesn't, but it's called via
>         efivar_init(efivarfs_callback, sb, true)
> and with the last argument being true efivar_init() will precede the call
> of the callback with efivarfs_variable_is_present().  Guess what does that
> thing (never used anywhere else) do?  Right, the call of try_lookup_noperm().
>
> Why do we bother with that?  What's wrong with having efivarfs_create_dentry()
> returning -EEXIST in case of dentry already being there and turning the
> chunk in efivar_init() into
>                         err = func(variable_name, vendor_guid,
>                                    variable_name_size, data);
>                         if (err == -EEXIST) {
>                                 if (duplicate_check)
>                                         dup_variable_bug(variable_name,
>                                                          &vendor_guid,
>                                                          variable_name_size);
>                                 else
>                                         err = 0;
>                         }
>                         if (err)
>                                 status = EFI_NOT_FOUND;
> Note that both possible callbacks become almost identical and I wouldn't
> be surprised if that "almost" is actually "completely"...  <checks> yep.
>

I'll let James respond to the specifics of your suggestion, but I'll
just note that this code has a rather convoluted history, as we used
to have two separate pseudo-filesystem drivers, up until a few years
ago: the sysfs based 'efivars' and this efivarfs driver. Given that
modifications in one needed to be visible in the other, they shared a
linked list that shadowed the state of the underlying variable store.
'efivars' was removed years ago, but it was only recently that James
replaced the linked list in this driver with the dentry cache as the
shadow mechanism.

Relying on the -EEXIST return value to detect duplicates, and
combining the two callbacks seem like neat optimizations to me, so

Acked-by: Ard Biesheuvel <ardb@kernel.org>

but I have to confess I am slightly out of my depth when it comes to VFS stuff.

