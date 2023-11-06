Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062F7E28F0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Nov 2023 16:44:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kgJoDXVa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPFyR6vkCz3cSd
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 02:44:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=kgJoDXVa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3mgljzqykdamvhdqmfjrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPFxc5DR3z2ytV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 02:43:30 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-5a839b31a0dso94195147b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Nov 2023 07:43:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1699285403; x=1699890203; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ABS8rPoBy1ITQ62kUEvxWovIfmSWeQOAvNCpebOJLoI=;
        b=kgJoDXVaOjpDAuNUOcsSyit47AvHaodq7dcwn4QYtal5Swy4/VqjPbkgxp72Lptdiz
         5tyJt6O7CdcJCbB+kUxXUjt3li3cjUACnr+uoP6HKylKh9wmQobZQNkK4CHpJfNdvfxC
         dloNaGM7aF3UotcKjnMr28YNB3SFQm1QHx903eRK2i1cZ9FfVTvlLMKRYywBUk5auoE6
         K9MJB2F0xQeHeSLDWMYwR6oB0nYxlWzNjZ/CPqR9tY+JopCI4yYLlsdAuKQvEMNP9cjW
         tN+UHHtYGSatKEEv1e7y5gh4nTgz/ZXMCoxk+dh3kG7bQloAo8nJql3BW6lM3artZ5Mt
         p1yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699285403; x=1699890203;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ABS8rPoBy1ITQ62kUEvxWovIfmSWeQOAvNCpebOJLoI=;
        b=tEmsKLwNJHkvYiN1T0P73lcCiBPFwq7ZLzqVfOuvyRrhE+/3komim1pYOH1ZhomPUu
         PNw/QkJayP55dpMmqiIsVkKm/VsmfSXVJOVt2dxMUdj7s+TjdLMEz0J9sNeS9n8diB+X
         D/GYgwmIdIO/nj7FxFs/vLwJ8SfzzFkaOJwMSCLkoIy+8ZsQktiayhFZS1ItMFuskq92
         jgrZtc4O25cMzuqPUiaOM20yhliHd+1TivGhiR5gRs2T8HiBYik8dUdwTyC3pcBn4kKl
         XUi+yWH0Mf9edGiDGwVrTo5T25pWS1CEIfcmP2YCmaLeGvdncRo8Taz10i7p5JgM0qNH
         f6Xg==
X-Gm-Message-State: AOJu0YwM/nKD/lPf4Bp6r1YSAf6zCzcdyc9kZzp3ki7GkxQb0TTDnRld
	OORqcfoanfJy0CQb869P8hpM+nVnMwA=
X-Google-Smtp-Source: AGHT+IFZU6oilNAmMp5GLulg+dwoZ1zspXQbywwTDejvG8kP1K7yDCwH0QkLRrw/RyNVPmFev9uMuH6PQSU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a25:ce94:0:b0:da0:3bea:cdc7 with SMTP id
 x142-20020a25ce94000000b00da03beacdc7mr527390ybe.2.1699285402751; Mon, 06 Nov
 2023 07:43:22 -0800 (PST)
Date: Mon, 6 Nov 2023 07:43:07 -0800
In-Reply-To: <ZUYcb6no9ADYytrx@yilunxu-OptiPlex-7050>
Mime-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUYcb6no9ADYytrx@yilunxu-OptiPlex-7050>
Message-ID: <ZUkJiwp8VHY0ICab@google.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Sean Christopherson <seanjc@google.com>
To: Xu Yilun <yilun.xu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?utf-8?Q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, L
 iam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, David Matlack <dmatlack@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Nov 04, 2023, Xu Yilun wrote:
> > +KVM_SET_USER_MEMORY_REGION2 is an extension to KVM_SET_USER_MEMORY_REGION that
> > +allows mapping guest_memfd memory into a guest.  All fields shared with
> > +KVM_SET_USER_MEMORY_REGION identically.  Userspace can set KVM_MEM_PRIVATE in
> > +flags to have KVM bind the memory region to a given guest_memfd range of
> > +[guest_memfd_offset, guest_memfd_offset + memory_size].  The target guest_memfd
>                                                         ^
> The range end should be exclusive, is it?

Yes, that should be a ')', not a ']'.

> > +static int __kvm_gmem_create(struct kvm *kvm, loff_t size, u64 flags)
> > +{
> > +	const char *anon_name = "[kvm-gmem]";
> > +	struct kvm_gmem *gmem;
> > +	struct inode *inode;
> > +	struct file *file;
> > +	int fd, err;
> > +
> > +	fd = get_unused_fd_flags(0);
> > +	if (fd < 0)
> > +		return fd;
> > +
> > +	gmem = kzalloc(sizeof(*gmem), GFP_KERNEL);
> > +	if (!gmem) {
> > +		err = -ENOMEM;
> > +		goto err_fd;
> > +	}
> > +
> > +	/*
> > +	 * Use the so called "secure" variant, which creates a unique inode
> > +	 * instead of reusing a single inode.  Each guest_memfd instance needs
> > +	 * its own inode to track the size, flags, etc.
> > +	 */
> > +	file = anon_inode_getfile_secure(anon_name, &kvm_gmem_fops, gmem,
> > +					 O_RDWR, NULL);
> > +	if (IS_ERR(file)) {
> > +		err = PTR_ERR(file);
> > +		goto err_gmem;
> > +	}
> > +
> > +	file->f_flags |= O_LARGEFILE;
> > +
> > +	inode = file->f_inode;
> > +	WARN_ON(file->f_mapping != inode->i_mapping);
> 
> Just curious, why should we check the mapping fields which is garanteed in
> other subsystem?

Mostly to document the behavior.  The vast majority of folks that read this code
will be KVM developers, not file systems developers, and will likely have no clue
about the relationship between f_mapping and i_mapping.  And in the extremely
unlikely scenario that anon_inode_getfile_secure() no longer sets f_mapping, a
WARN detects the issue whereas a comment does not.
