Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE717A1197
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 01:20:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eDOq5fct;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RmtbQ1NtNz3cRN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Sep 2023 09:20:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=eDOq5fct;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--ackerleytng.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3cjudzqskdg8npxreyrlgattbbtyr.pbzyvahkccp-qriyvfgf.bmynof.bet@flex--ackerleytng.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RmtZT0ccSz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Sep 2023 09:19:43 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-59b5d4a8242so19600947b3.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 16:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1694733577; x=1695338377; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4dPufiPQCtPzWz5WHSfvhHWIcWm8zH/JZg221REQo40=;
        b=eDOq5fctMJiTxFkGiSjrwKTfVkCg+718WZV/5XAYHLv5DagKa5S6FXa3Kq8RT6NvdE
         FM98VAvqpqviSvcGN1S1Ptd3hU1RaRZ3pGaPVLYw1SlNMNcrMcYf/Zl8LmnEjEXeRhlh
         G3K8S8ZZDPBu1GiwSDJ4KjBDM5dGZR28kLPmELXLgQ+tm/OGIQ+FPdyY9iRZljFk6eoM
         njprnfJNS0mHJx7b6NlUW8DDYpPPTj7VLLNdMAnS/AWZ4Ri9AGc/HuA/oAn7gUr1bxl3
         8XHfBVVLaWQo0vnSEqY0pfyibqyTE9Dr2A6BhBsLGrH/TU5I6erbRTzmeyCsJ7j9oPcj
         v1Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694733577; x=1695338377;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4dPufiPQCtPzWz5WHSfvhHWIcWm8zH/JZg221REQo40=;
        b=UNZUMqYmrUPgNpQirF45S5Zm/volI15FMBQUY3MZk6HN66yX6bopJ5iFZcIpt1e2kl
         5qGQKceeBGJakoWpCMAmYbfv2c2MHZQXJzmutDwugBx8KaNHA6xYQnEyrOVA2CThiI0B
         IW+y+Bftz9dfzVBTWUfoZxQ9ZOklPAnooZ5KWTRCKCZUTrkopT/Yaxf9wqhC9hZYGs6d
         nVeyLcNgj/8DxS3N+r7SS4widCoEaZ3N5lqyCuDnJCyqWTQCzqc7tJrvQLI4311BwSjY
         M7wQiWJRjsFljHi9P6ERv5WN2j738uhZA8UyvmTxsWw6pkEw3CSe8Jc1HkYFj+Oel8Og
         afXQ==
X-Gm-Message-State: AOJu0YwfRmaVN9/QjQNSGSENRxVR7FSfadww6YOxxp04QCgWbW7XLVsf
	9pI9cBJS8EeZoOPVCYBt/n6YknTmmvnUArBYdw==
X-Google-Smtp-Source: AGHT+IGXEzZPfzBJslkSHoMTui4zDBSgnXtUGummxt07D80J/zY1rCAlKy2IgGo0zSECxNr/ULgwmLbLuPQoPz0S1A==
X-Received: from ackerleytng-ctop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:13f8])
 (user=ackerleytng job=sendgmr) by 2002:a25:aa83:0:b0:d77:984e:c770 with SMTP
 id t3-20020a25aa83000000b00d77984ec770mr158034ybi.5.1694733576882; Thu, 14
 Sep 2023 16:19:36 -0700 (PDT)
Date: Thu, 14 Sep 2023 23:19:34 +0000
In-Reply-To: <ZQNN2AyDJ8dF0/6D@google.com>
Mime-Version: 1.0
References: <ZOO782YGRY0YMuPu@google.com> <diqzttsiu67n.fsf@ackerleytng-ctop.c.googlers.com>
 <ZQNN2AyDJ8dF0/6D@google.com>
Message-ID: <diqzv8ccjqbd.fsf@ackerleytng-ctop.c.googlers.com>
Subject: Re: [RFC PATCH v11 12/29] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
From: Ackerley Tng <ackerleytng@google.com>
To: Sean Christopherson <seanjc@google.com>
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
Cc: kvm@vger.kernel.org, david@redhat.com, yu.c.zhang@linux.intel.com, linux-kernel@vger.kernel.org, linux-mm@kvack.org, chao.p.peng@linux.intel.com, linux-riscv@lists.infradead.org, isaku.yamahata@gmail.com, paul@paul-moore.com, maz@kernel.org, chenhuacai@kernel.org, jmorris@namei.org, willy@infradead.org, wei.w.wang@intel.com, tabba@google.com, jarkko@kernel.org, serge@hallyn.com, mail@maciej.szmigiero.name, aou@eecs.berkeley.edu, vbabka@suse.cz, michael.roth@amd.com, paul.walmsley@sifive.com, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, qperret@google.com, liam.merwick@oracle.com, linux-mips@vger.kernel.org, oliver.upton@linux.dev, linux-security-module@vger.kernel.org, palmer@dabbelt.com, kvm-riscv@lists.infradead.org, anup@brainfault.org, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org, vannapurve@google.com, linuxppc-dev@lists.ozlabs.org, kirill.shutemov@linux.intel.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Sean Christopherson <seanjc@google.com> writes:

> On Mon, Aug 28, 2023, Ackerley Tng wrote:
>> Sean Christopherson <seanjc@google.com> writes:
>> >> If we track struct kvm with the inode, then I think (a), (b) and (c) can
>> >> be independent of the refcounting method. What do you think?
>> >
>> > No go.  Because again, the inode (physical memory) is coupled to the virtual machine
>> > as a thing, not to a "struct kvm".  Or more concretely, the inode is coupled to an
>> > ASID or an HKID, and there can be multiple "struct kvm" objects associated with a
>> > single ASID.  And at some point in the future, I suspect we'll have multiple KVM
>> > objects per HKID too.
>> >
>> > The current SEV use case is for the migration helper, where two KVM objects share
>> > a single ASID (the "real" VM and the helper).  I suspect TDX will end up with
>> > similar behavior where helper "VMs" can use the HKID of the "real" VM.  For KVM,
>> > that means multiple struct kvm objects being associated with a single HKID.
>> >
>> > To prevent use-after-free, KVM "just" needs to ensure the helper instances can't
>> > outlive the real instance, i.e. can't use the HKID/ASID after the owning virtual
>> > machine has been destroyed.
>> >
>> > To put it differently, "struct kvm" is a KVM software construct that _usually_,
>> > but not always, is associated 1:1 with a virtual machine.
>> >
>> > And FWIW, stashing the pointer without holding a reference would not be a complete
>> > solution, because it couldn't guard against KVM reusing a pointer.  E.g. if a
>> > struct kvm was unbound and then freed, KVM could reuse the same memory for a new
>> > struct kvm, with a different ASID/HKID, and get a false negative on the rebinding
>> > check.
>> 
>> I agree that inode (physical memory) is coupled to the virtual machine
>> as a more generic concept.
>> 
>> I was hoping that in the absence of CC hardware providing a HKID/ASID,
>> the struct kvm pointer could act as a representation of the "virtual
>> machine". You're definitely right that KVM could reuse a pointer and so
>> that idea doesn't stand.
>> 
>> I thought about generating UUIDs to represent "virtual machines" in the
>> absence of CC hardware, and this UUID could be transferred during
>> intra-host migration, but this still doesn't take host userspace out of
>> the TCB. A malicious host VMM could just use the migration ioctl to copy
>> the UUID to a malicious dumper VM, which would then pass checks with a
>> gmem file linked to the malicious dumper VM. This is fine for HKID/ASIDs
>> because the memory is encrypted; with UUIDs there's no memory
>> encryption.
>
> I don't understand what problem you're trying to solve.  I don't see a need to
> provide a single concrete representation/definition of a "virtual machine".  E.g.
> there's no need for a formal definition to securely perform intrahost migration,
> KVM just needs to ensure that the migration doesn't compromise guest security,
> functionality, etc.
>
> That gets a lot more complex if the target KVM instance (module, not "struct kvm")
> is a different KVM, e.g. when migrating to a different host.  Then there needs to
> be a way to attest that the target is trusted and whatnot, but that still doesn't
> require there to be a formal definition of a "virtual machine".
>
>> Circling back to the original topic, was associating the file with
>> struct kvm at gmem file creation time meant to constrain the use of the
>> gmem file to one struct kvm, or one virtual machine, or something else?
>
> It's meant to keep things as simple as possible (relatively speaking).  A 1:1
> association between a KVM instance and a gmem instance means we don't have to
> worry about the edge cases and oddities I pointed out earlier in this thread.
>

I looked through this thread again and re-read the edge cases and
oddities that was pointed out earlier (last paragraph at [1]) and I
think I understand better, and I have just one last clarification.

It was previously mentioned that binding on creation time simplifies the
lifecycle of memory:

"(a) prevent a different VM from *ever* binding to the gmem instance" [1]

Does this actually mean

"prevent a different struct kvm from *ever* binding to this gmem file"

?

If so, then binding on creation

+ Makes the gmem *file* (and just not the bindings xarray) the binding
  between struct kvm and the file.
+ Simplifies the KVM-userspace contract to "this gmem file can only be
  used with this struct kvm"

Binding on creation doesn't offer any way to block the contents of the
inode from being used with another "virtual machine" though, since we
can have more than one gmem file pointing to the same inode, and the
other gmem file is associated with another struct kvm. (And a strut kvm
isn't associated 1:1 with a virtual machine [2])

The point about an inode needing to be coupled to a virtual machine as a
thing [2] led me to try to find a single concrete representation of a
"virtual machine".

Is locking inode contents to a "virtual machine" outside the scope of
gmem? If so, then it is fine to bind on creation time, use a VM ioctl
over a system ioctl, and the method of refcounting in gmem v12 is okay.

[1] https://lore.kernel.org/lkml/ZNKv9ul2I7A4V7IF@google.com/
[2] https://lore.kernel.org/lkml/ZOO782YGRY0YMuPu@google.com/

> <snip>
