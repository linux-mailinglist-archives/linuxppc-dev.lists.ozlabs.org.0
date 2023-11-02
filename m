Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC877DF7A5
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Nov 2023 17:29:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=12CUdRVX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SLq8n66ggz3cZm
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Nov 2023 03:29:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=12CUdRVX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com; envelope-from=dmatlack@google.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SLq7w2wWWz2xdZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Nov 2023 03:28:59 +1100 (AEDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4084e49a5e5so10012355e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Nov 2023 09:28:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1698942533; x=1699547333; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=20owt2l3/cxGLzLA2xbevoL+xSQuNASMB596X3+ow7c=;
        b=12CUdRVXKRJaxSe+5do0ag1e6ErxhrQ7BcBQJZ78xyJnckTqtWEyWZL1Nh3LKsJeOm
         IaHdxY2VeRToMPv+KkNW+1PYk38IUO+zcyPnTLQ5A+IkK9mCIJL16PJ0YP/uqsj5sUIG
         hxtgg83K1O5VqBR7oONrqnjQDuUIP2ED3g0RvYvxrbowcRQM+7r6PvgMl69Byop/Z9rF
         zeO34wAMJZzMr/RXwxirqHX8mA/wh8Z3YdgcvpIwJbE8JAahXWwCKTF2NMxJ1B0Enla5
         WezxoyjrIQi18I9F6pQjziJBvKMVDzIcRCucrwDx9SXdTmZeu/XGz27Ze95gYHD5EEMX
         bUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698942533; x=1699547333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=20owt2l3/cxGLzLA2xbevoL+xSQuNASMB596X3+ow7c=;
        b=nwdWrLnFA4pwDo3xHaQP2qYosFdQT4aqLA1cUMIICZErI8bWVd+db6Eif7oXyUdL2A
         ZvEFxZNYGmkjUe1ny2lG0LAx6BVNpe5/Owi6p7DScWGQE6nm6fAf50wb7jVA5Lj4SpGc
         H4hR8sNJr3KeqLvZ8ziJf+oQpUSAhSDsUdo1Vplzsc4kSaRLl2tQ8ITDTqFWTdE5breI
         Qy3bXtHHfIw753KGgqjS9Vbv81ckZNJIyr2ffQwR8zfR6i5A2qFQo5hQjjaOMKir8yuI
         5Z2Kx8fJH1/XuIp3Q4Yn1vBSk8fbD2cnOtwm3OuZufwAdeMFPLKrhp8yino/i8z7iHY4
         kgLg==
X-Gm-Message-State: AOJu0YyWoo3p6ZKHq5noKmjc5JCgRS2mSMGtOTL461QqXgpg/MZg6IIr
	ZOFscDLM+Jfwn0/zxayU2Qql1dVDPLXoiNSNrNKsVA==
X-Google-Smtp-Source: AGHT+IGzC+UPQWsYSxEKly7WToGYHThIxdsAXI0NVkPIoloyom3O4LGBjzNagfuu2dI4j91jKOVPOWF7c1N4gZ20sPc=
X-Received: by 2002:a5d:4b51:0:b0:32d:8e54:29f6 with SMTP id
 w17-20020a5d4b51000000b0032d8e5429f6mr14415276wrs.47.1698942532901; Thu, 02
 Nov 2023 09:28:52 -0700 (PDT)
MIME-Version: 1.0
References: <20231027182217.3615211-1-seanjc@google.com> <20231027182217.3615211-17-seanjc@google.com>
 <ZUFGRyQEuWj4RJS0@google.com> <ZUFzZf-YmCRYP6qo@google.com>
 <CALzav=d9eXZfK=op7A=UftbpuPpUbxqV6CmkqqxxBNuNsUU4nw@mail.gmail.com>
 <6642c379-1023-4716-904f-4bbf076744c2@redhat.com> <ZUPIXt1XzZrriswG@google.com>
In-Reply-To: <ZUPIXt1XzZrriswG@google.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 2 Nov 2023 09:28:23 -0700
Message-ID: <CALzav=eaVc5rzmHwnQr7aotyTKi9Agdte7NAL0NvBeE+f6zYoA@mail.gmail.com>
Subject: Re: [PATCH v13 16/35] KVM: Add KVM_CREATE_GUEST_MEMFD ioctl() for
 guest-specific backing memory
To: Sean Christopherson <seanjc@google.com>
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
Cc: kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, Chao Peng <chao.p.peng@linux.intel.com>, linux-riscv@lists.infradead.org, Isaku Yamahata <isaku.yamahata@gmail.com>, Marc Zyngier <maz@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Xiaoyao Li <xiaoyao.li@intel.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, Wang <wei.w.wang@intel.com>, Fuad Tabba <tabba@google.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, Albert Ou <aou@eecs.berkeley.edu>, Vlastimil Babka <vbabka@suse.cz>, Michael Roth <michael.roth@amd.com>, Ackerley Tng <ackerleytng@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, =?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, Isaku Yamahata <isaku.yamahata@intel.com>, Christian Brauner <brauner@kernel.org>, Quentin Perret <qperret@google.com>, L
 iam Merwick <liam.merwick@oracle.com>, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Jarkko Sakkinen <jarkko@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, linux-fsdevel@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Vishal Annapurve <vannapurve@google.com>, linuxppc-dev@lists.ozlabs.org, Xu Yilun <yilun.xu@intel.com>, Anish Moorthy <amoorthy@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 2, 2023 at 9:03=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Thu, Nov 02, 2023, Paolo Bonzini wrote:
> > On 10/31/23 23:39, David Matlack wrote:
> > > > > Maybe can you sketch out how you see this proposal being extensib=
le to
> > > > > using guest_memfd for shared mappings?
> > > > For in-place conversions, e.g. pKVM, no additional guest_memfd is n=
eeded.  What's
> > > > missing there is the ability to (safely) mmap() guest_memfd, e.g. K=
VM needs to
> > > > ensure there are no outstanding references when converting back to =
private.
> > > >
> > > > For TDX/SNP, assuming we don't find a performant and robust way to =
do in-place
> > > > conversions, a second fd+offset pair would be needed.
> > > Is there a way to support non-in-place conversions within a single gu=
est_memfd?
> >
> > For TDX/SNP, you could have a hook from KVM_SET_MEMORY_ATTRIBUTES to gu=
est
> > memory.  The hook would invalidate now-private parts if they have a VMA=
,
> > causing a SIGSEGV/EFAULT if the host touches them.
> >
> > It would forbid mappings from multiple gfns to a single offset of the
> > guest_memfd, because then the shared vs. private attribute would be tie=
d to
> > the offset.  This should not be a problem; for example, in the case of =
SNP,
> > the RMP already requires a single mapping from host physical address to
> > guest physical address.
>
> I don't see how this can work.  It's not a M:1 scenario (where M is multi=
ple gfns),
> it's a 1:N scenario (wheren N is multiple offsets).  The *gfn* doesn't ch=
ange on
> a conversion, what needs to change to do non-in-place conversion is the p=
fn, which
> is effectively the guest_memfd+offset pair.
>
> So yes, we *could* support non-in-place conversions within a single guest=
_memfd,
> but it would require a second offset,

Why can't KVM free the existing page at guest_memfd+offset and
allocate a new one when doing non-in-place conversions?

> at which point it makes sense to add a
> second file descriptor as well.  Userspace could still use a single guest=
_memfd
> instance, i.e. pass in the same file descriptor but different offsets.
