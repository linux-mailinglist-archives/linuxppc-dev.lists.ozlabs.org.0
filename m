Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D9004508033
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 06:38:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kjnx86Jlxz3dyC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Apr 2022 14:38:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WXhD4tb8;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WXhD4tb8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=mlevitsk@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=WXhD4tb8; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=WXhD4tb8; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KjnvY1D8zz3dQj
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Apr 2022 14:37:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650429429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQOHNPZTUOaysYmSTDrA55i6Fl6EOOvTznA+1gLQJg4=;
 b=WXhD4tb80H0eMZuv5IAHidJjMt9pvIONDRRkFvAgcdEM/HtDJQQcufu6UNW5wziCUzBQiW
 S687C/VYLkZq66t4JSWbDmwJdHr0rrUlGMZh0uDMiurPRRS9jgP/0Rr5/Z5V+3Yti8ppLp
 DHpujgEVzVV9FK34w2dGPRdhpC/yB0c=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650429429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mQOHNPZTUOaysYmSTDrA55i6Fl6EOOvTznA+1gLQJg4=;
 b=WXhD4tb80H0eMZuv5IAHidJjMt9pvIONDRRkFvAgcdEM/HtDJQQcufu6UNW5wziCUzBQiW
 S687C/VYLkZq66t4JSWbDmwJdHr0rrUlGMZh0uDMiurPRRS9jgP/0Rr5/Z5V+3Yti8ppLp
 DHpujgEVzVV9FK34w2dGPRdhpC/yB0c=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-57-QZo87eu1MGGvqboxyXWg5g-1; Wed, 20 Apr 2022 00:37:05 -0400
X-MC-Unique: QZo87eu1MGGvqboxyXWg5g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 109D3800B28;
 Wed, 20 Apr 2022 04:37:04 +0000 (UTC)
Received: from starship (unknown [10.40.194.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB67214583EE;
 Wed, 20 Apr 2022 04:36:58 +0000 (UTC)
Message-ID: <ad0023fd2ea0297e7bfb8a6a9535b2b8b8f56093.camel@redhat.com>
Subject: Re: [PATCH 3/3] KVM: Add helpers to wrap vcpu->srcu_idx and yell if
 it's abused
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Sean Christopherson <seanjc@google.com>
Date: Wed, 20 Apr 2022 07:36:57 +0300
In-Reply-To: <Yl7ZMJ/takmHh7tY@google.com>
References: <20220415004343.2203171-1-seanjc@google.com>
 <20220415004343.2203171-4-seanjc@google.com>
 <5b561bf1a0bbf140ea09d516f946a4e8fee8dd2d.camel@redhat.com>
 <Yl7ZMJ/takmHh7tY@google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Wanpeng Li <wanpengli@tencent.com>,
 Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org,
 David Hildenbrand <david@redhat.com>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>, Anup Patel <anup@brainfault.org>,
 Joerg Roedel <joro@8bytes.org>, Atish Patra <atishp@atishpatra.org>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2022-04-19 at 15:45 +0000, Sean Christopherson wrote:
> On Tue, Apr 19, 2022, Maxim Levitsky wrote:
> > On Fri, 2022-04-15 at 00:43 +0000, Sean Christopherson wrote:
> > > Add wrappers to acquire/release KVM's SRCU lock when stashing the index
> > > in vcpu->src_idx, along with rudimentary detection of illegal usage,
> > > e.g. re-acquiring SRCU and thus overwriting vcpu->src_idx.  Because the
> > > SRCU index is (currently) either 0 or 1, illegal nesting bugs can go
> > > unnoticed for quite some time and only cause problems when the nested
> > > lock happens to get a different index.
> > > 
> > > Wrap the WARNs in PROVE_RCU=y, and make them ONCE, otherwise KVM will
> > > likely yell so loudly that it will bring the kernel to its knees.
> > > 
> > > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > > ---
> 
> ...
> 
> > Looks good to me overall.
> > 
> > Note that there are still places that acquire the lock and store the idx into
> > a local variable, for example kvm_xen_vcpu_set_attr and such.
> > I didn't check yet if these should be converted as well.
> 
> Using a local variable is ok, even desirable.  Nested/multiple readers is not an
> issue, the bug fixed by patch 1 is purely that kvm_vcpu.srcu_idx gets corrupted.

Makes sense. I still recal *that* bug in AVIC inhibition where that srcu lock was
a major PITA, but now I remember that it was not due to nesting of the lock,
but rather fact that we attempted to call syncronize_srcu or something like that
with it held.


> 
> In an ideal world, KVM would _only_ track the SRCU index in local variables, but
> that would require plumbing the local variable down into vcpu_enter_guest() and
> kvm_vcpu_block() so that SRCU can be unlocked prior to entering the guest or
> scheduling out the vCPU.
> 
It all makes sense now - thanks.

Best regards,
	Maxim Levistky

