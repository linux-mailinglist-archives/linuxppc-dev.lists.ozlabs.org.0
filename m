Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B01B368EA2F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 09:50:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBYc13h6Jz3cfH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Feb 2023 19:50:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c10snEK9;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IOxtEDt1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=cohuck@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=c10snEK9;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IOxtEDt1;
	dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBYb25ZyGz3c8f
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Feb 2023 19:49:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675846170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xhxVetMf39eyBYLaK7+c2bWPPz3BvXeYT/Jkcp+eZuU=;
	b=c10snEK9vF8ECjjRg9e1Iu2URR9jXd6YXDRwgubfArnWgtQAEV0s4AAcPKIvFlFrTTNXSR
	TwCicuQwb5yHnMVIuWpyEk5H7fyg5GKSIvLlEMbPDIfJbwatRHgFUN+NfoGx4NwolV9g1j
	JWdeMskI+0VDik9xS9lHOrCMqlSYHcE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675846171;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xhxVetMf39eyBYLaK7+c2bWPPz3BvXeYT/Jkcp+eZuU=;
	b=IOxtEDt1gz/6atPwjprZXNTFj9TtD2ibbOl4ecYUlg2VKQ/vf2kBiHRGVtazrGbZwA7Un1
	oMAE/DwjQBWOliAo37ZzcMA4h+ghQEMMZ8Z6GrWT8+qyUexVJnS+FbsLqqCYZ7ZMQR7yEI
	K9b7V1pTbP1G4eulZ0GFqDBe1pbIu/E=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-5dvcoJ_qPimOmvke9wf4xA-1; Wed, 08 Feb 2023 03:49:26 -0500
X-MC-Unique: 5dvcoJ_qPimOmvke9wf4xA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C25D61C07581;
	Wed,  8 Feb 2023 08:49:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.252])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1A495C15BAE;
	Wed,  8 Feb 2023 08:49:18 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Gavin Shan <gshan@redhat.com>, Thomas Huth <thuth@redhat.com>,
 kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, Sean
 Christopherson <seanjc@google.com>, Steven Price <steven.price@arm.com>
Subject: Re: [PATCH 6/7] KVM: arm64: Change return type of
 kvm_vm_ioctl_mte_copy_tags() to "int"
In-Reply-To: <d0b3a1e7-0864-f169-cdea-60ad95951b3f@redhat.com>
Organization: Red Hat GmbH
References: <20230203094230.266952-1-thuth@redhat.com>
 <20230203094230.266952-7-thuth@redhat.com>
 <c6e605fe-f251-d8b6-64ed-bd1e17e79512@redhat.com>
 <7b32d58b-846f-b8d7-165b-9f505e5f00f0@redhat.com>
 <d0b3a1e7-0864-f169-cdea-60ad95951b3f@redhat.com>
User-Agent: Notmuch/0.37 (https://notmuchmail.org)
Date: Wed, 08 Feb 2023 09:49:16 +0100
Message-ID: <87zg9oleyb.fsf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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
Cc: Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, Marc Zyngier <maz@kernel.org>, David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org, Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Christian Borntraeger <borntraeger@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Eric Auger <eric.auger@redhat.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 08 2023, Gavin Shan <gshan@redhat.com> wrote:

> On 2/7/23 9:09 PM, Thomas Huth wrote:
>> Oh, drat, I thought I had checked all return statements ... this must have fallen through the cracks, sorry!
>> 
>> Anyway, this is already a problem now: The function is called from kvm_arch_vm_ioctl() (which still returns a long), which in turn is called from kvm_vm_ioctl() in virt/kvm/kvm_main.c. And that functions stores the return value in an "int r" variable. So the upper bits are already lost there.
>> 
>> Also, how is this supposed to work from user space? The normal "ioctl()" libc function just returns an "int" ? Is this ioctl already used in a userspace application somewhere? ... at least in QEMU, I didn't spot it yet...
>> 

We will need it in QEMU to implement migration with MTE (the current
proposal simply adds a migration blocker when MTE is enabled, as there
are various other things that need to be figured out for this to work.)
But maybe other VMMs already use it (and have been lucky because they
always dealt with shorter lengths?)

>
> The ioctl command KVM_ARM_MTE_COPY_TAGS was merged recently and not used
> by QEMU yet. I think struct kvm_arm_copy_mte_tags::length needs to be
> '__u32' instead of '__u64' in order to standardize the return value.
> Something like below. Documentation/virt/kvm/api.rst::section-4.130
> needs update accordingly.
>
>     struct kvm_arm_copy_mte_tags {
>          __u64 guest_ipa;
>          __u32 pad;
>          __u32 length;
>          void __user *addr;
>          __u64 flags;
>          __u64 reserved[2];
>    };

Can we do this in a more compatible way, as we are dealing with an API?
Like returning -EINVAL if length is too big?

