Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 43DBA94945C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 17:20:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Di4rrBHM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdcSC1LdJz3ck2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 01:20:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=Di4rrBHM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3az-yzgykdiy2okxtmqyyqvo.mywvsx47zzm-no5vs232.y9vkl2.y1q@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdcRW3JZtz3bVG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 01:19:34 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id d9443c01a7336-1fc47634e3dso6913865ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Aug 2024 08:19:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1722957572; x=1723562372; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zfDlFqosrXLKfrNosA2JBe6CUch6c/VqYqOk4CYX594=;
        b=Di4rrBHMyo0lJe+Wmi/obarekVo6VmKKejaxPVtlKmu22PjJbWYbL6hLIYZ27sxIVn
         gPeIFnS+bVvUMxj/8f69aB2TEY5gNMbGvoIAPBABLflQu3IgATTAX2ku0bw8lS05m2oU
         Ls/lBTLDN9y+kkWn0V7Gq+LBLkxrWSvBWvGtKlfyGf+qSr6K0dG7PcJodpOtKFYfqdSf
         95JXFpTiioPEb6SMlI1Nq5JGDXThfl3RDsaSeGMczWOZicIcgZhlteG2st8gDyJ2gdsP
         R1ccDQIJFweyytknwJ/6Gt7XFnEYzRf8bIakqtYn/Lvc80YhvyOUmEKQDKgEHVNu3b25
         NTng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722957572; x=1723562372;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zfDlFqosrXLKfrNosA2JBe6CUch6c/VqYqOk4CYX594=;
        b=pTgAQXmpsFuhB1YGlwYpjidimww7Cz0t9qiuB7o9c+UN7NFuR9ZzmWg3W8TOUCbyTQ
         nb9BnCbCg9czKAK/DZKpIIFXoZRlfUxXT0l499oILmQ6FeNytqGMGDW9qJVg7U2Q+8Io
         abhj0WS9tg+NL02yjUC/VNvVzCXd1o/Fx1lGXR3jnZkHiaUDdvzyrGHQF6KsafzLL56Z
         0asQNfqzNZrQ5IS6MKYPCFQIt2uqlHyyGTGRpKac31VRzM96WYL1YPdGl1cURo7udLLA
         cz36Kctb5+aFFuESMKnV0ToPbR1VXQoJchFM7+lA7l/x19sy91pTXeDntBsYMr3BZTrH
         Zsxw==
X-Forwarded-Encrypted: i=1; AJvYcCWggrV4BMCo6XBX43oK8WkGsnGVrwDftrulVDcI3fje4kCVIhWXOLp7HtSomBKfLrOpEVDGl/jaIFALHVBH7zRlrhm83QvqYHo6EJ90LA==
X-Gm-Message-State: AOJu0Yzx6HMY4I78zCjNHlfhzL7HpJiahgP9XClBExGzTgIbDprSpnIk
	9luCLwnhxXX+inz5qGoSuqwFLJR6r1xKQNSGuC5G5enajZ6hqHfyqc/UqM22PtWc6tnAyIRe7Wc
	SQg==
X-Google-Smtp-Source: AGHT+IG+kq4xSCmsszhC87T6ezpGfclhL8SLo9v6dzemvAwTfI9EBqVt37Vs+G2GK8dBxj5hzSimY+F6XI8=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:e743:b0:1fb:54d9:ebb3 with SMTP id
 d9443c01a7336-1ff57309939mr9499665ad.6.1722957571476; Tue, 06 Aug 2024
 08:19:31 -0700 (PDT)
Date: Tue, 6 Aug 2024 08:19:29 -0700
In-Reply-To: <86ikwe2fph.wl-maz@kernel.org>
Mime-Version: 1.0
References: <20240726235234.228822-1-seanjc@google.com> <20240726235234.228822-55-seanjc@google.com>
 <ZrFfgzRbiqT-Zi2O@linux.dev> <ZrFfvjy_-Tyx4xUV@linux.dev> <86ikwe2fph.wl-maz@kernel.org>
Message-ID: <ZrI_AdLhWZqNKC4z@google.com>
Subject: Re: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns
 accessed/dirty before dropping mmu_lock
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Huacai Chen <chenhuacai@kernel.org>, Fuad Tabba <tabba@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Anup Patel <anup@brainfault.org>, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 06, 2024, Marc Zyngier wrote:
> On Tue, 06 Aug 2024 00:26:54 +0100,
> Oliver Upton <oliver.upton@linux.dev> wrote:
> > 
> > On Mon, Aug 05, 2024 at 11:26:03PM +0000, Oliver Upton wrote:
> > > [+cc Fuad]
> > 
> > Take 2!
> > 
> > > Fuad, you mentioned in commit 9c30fc615daa ("KVM: arm64: Move setting
> > > the page as dirty out of the critical section") that restructuring
> > > around the MMU lock was helpful for reuse (presumably for pKVM), but I
> > > lack the context there.
> > > 
> > > On Fri, Jul 26, 2024 at 04:52:03PM -0700, Sean Christopherson wrote:
> > > > Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
> > > > page/folio dirty after it has been written back can make some filesystems
> > > > unhappy (backing KVM guests will such filesystem files is uncommon, and
> > > 
> > > typo: s/will/with/
> > > 
> > > > the race is minuscule, hence the lack of complaints).  See the link below
> > > > for details.
> 
> Should we consider reverting 9c30fc615daa then?

Aha!  After thinking through things more, I don't think a revert is necessary.
I _think_ the worst case scenario is that KVM would trigger this WARN in
filemap_unaccount_folio():

	/*
	 * At this point folio must be either written or cleaned by
	 * truncate.  Dirty folio here signals a bug and loss of
	 * unwritten data - on ordinary filesystems.
	 *
	 * But it's harmless on in-memory filesystems like tmpfs; and can
	 * occur when a driver which did get_user_pages() sets page dirty
	 * before putting it, while the inode is being finally evicted.
	 *
	 * Below fixes dirty accounting after removing the folio entirely
	 * but leaves the dirty flag set: it has no effect for truncated
	 * folio and anyway will be cleared before returning folio to
	 * buddy allocator.
	 */
	if (WARN_ON_ONCE(folio_test_dirty(folio) &&
			 mapping_can_writeback(mapping)))
		folio_account_cleaned(folio, inode_to_wb(mapping->host));

KVM won't actually write memory because the stage-2 mappings are protected by the
mmu_notifier, i.e. there is no risk of loss of data, even if the VM were backed
by memory that needs writeback.

And FWIW, given that multiple other KVM architectures mark folios dirty outside
of mmu_notifier protection and have never tripped over this, I think it's highly
unlikely the WARN will ever be triggered by a sane virtualization setup.

I can add something to that effect to the changelog, e.g. to document that this
isn't super urgent.  
