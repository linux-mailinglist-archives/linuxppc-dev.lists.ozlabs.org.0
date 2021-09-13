Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9270840A67D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 08:10:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7tHt2kZ6z2yNS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 16:10:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aGX96/TQ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=aGX96/TQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=ehabkost@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=aGX96/TQ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=aGX96/TQ; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7XhL33VSz2yNS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 02:57:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631552221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g+3cqH6ifdVqKTPD8DSIcY8WRiPrRg0IjI4GufOGc8I=;
 b=aGX96/TQA8WAt0SXeCUxWR69jDYQPzjKdL1pinHWANa9a8N0i1u7ipaKU4f/eLnL2RS47V
 P27krCg97TEybO0ltM/bPUAlb/rJjWfOR8NJFxD0QCPbSkNNITy1obYN+3ESWLlE6qZAts
 dqEruQNUT74b5EgoG54XyoVDG0atTRQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631552221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=g+3cqH6ifdVqKTPD8DSIcY8WRiPrRg0IjI4GufOGc8I=;
 b=aGX96/TQA8WAt0SXeCUxWR69jDYQPzjKdL1pinHWANa9a8N0i1u7ipaKU4f/eLnL2RS47V
 P27krCg97TEybO0ltM/bPUAlb/rJjWfOR8NJFxD0QCPbSkNNITy1obYN+3ESWLlE6qZAts
 dqEruQNUT74b5EgoG54XyoVDG0atTRQ=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-gjgBBk8MOoSG2IsHhN-lfw-1; Mon, 13 Sep 2021 12:56:58 -0400
X-MC-Unique: gjgBBk8MOoSG2IsHhN-lfw-1
Received: by mail-lj1-f198.google.com with SMTP id
 v16-20020a2e7a10000000b001ba9e312de6so4462961ljc.21
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 09:56:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g+3cqH6ifdVqKTPD8DSIcY8WRiPrRg0IjI4GufOGc8I=;
 b=o2Uz99tTkL+VThZYI7d6yxPP3b4OU+ZJE6IaZAC9CUIYfZnyji4NOGKb8DowNbyg6K
 poh/mz03Mi2PUhAMLFXRc5bMuV/VaXWvoLYMdr+hGWp+G2WOWvAeiwWyLV5ZLv43Ef4e
 ZTLwRrkzpFMe/q1dFIVbleJUaf8zZl6/xAW+hbywoOApSb3V7QlmSjOkex2VBJdj0m4u
 WZfgsvaTX4i1IaCFsFTPdEK0Rs7XSIYs1p82GSqiHtnXDNzGjCjuIft06PjgwTYroMLK
 Vx47EGxxyzQrrTjQ8mP5gAqX8Safx2P3s+7LBx6Vh/fIDiPcCYI/dNMsxjcQHSJagR9H
 RScQ==
X-Gm-Message-State: AOAM530VfkqtaPUVfCoWAaNLFl9GzGkpcSGx59+7CsdWFVOgY0ZcKxuF
 y1MBx5kEy3yQYanhlUO13iSYQaiJ8g48kuj/jSwVtQ7SFqo0SViGJjf+6ybn2PLeWJ12ZP+tHfb
 ZUC2ChneoX9ANDYKfTrgJBpKLQ1C5yEG6eNi0Y2qRPg==
X-Received: by 2002:a2e:7304:: with SMTP id o4mr11659540ljc.51.1631552216994; 
 Mon, 13 Sep 2021 09:56:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEsueuL9hseX4+IMXePvu65lhG7CpxBDTW6sDERh7JVYGERNaG5Xeiw6ppL+jq20MLxOXsjghqm8q8r+/BSJY=
X-Received: by 2002:a2e:7304:: with SMTP id o4mr11659504ljc.51.1631552216735; 
 Mon, 13 Sep 2021 09:56:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210913135745.13944-1-jgross@suse.com>
 <20210913135745.13944-3-jgross@suse.com>
 <YT97K7yXyCrphyCt@google.com>
In-Reply-To: <YT97K7yXyCrphyCt@google.com>
From: Eduardo Habkost <ehabkost@redhat.com>
Date: Mon, 13 Sep 2021 12:56:41 -0400
Message-ID: <CAOpTY_pyeOo2Kh-r1cEFk2XL4g8A1mxQpP1y62thWk2mh6XUUg@mail.gmail.com>
Subject: Re: [PATCH 2/2] kvm: rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS
To: Sean Christopherson <seanjc@google.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 14 Sep 2021 16:10:00 +1000
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
Cc: x86@kernel.org, Wanpeng Li <wanpengli@tencent.com>, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, linux-kselftest@vger.kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Shuah Khan <shuah@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Joerg Roedel <joro@8bytes.org>,
 Huacai Chen <chenhuacai@kernel.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Ingo Molnar <mingo@redhat.com>, kvm-ppc@vger.kernel.org,
 Borislav Petkov <bp@alien8.de>, Shuah Khan <skhan@linuxfoundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Jim Mattson <jmattson@google.com>,
 Juergen Gross <jgross@suse.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-mips@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 13, 2021 at 12:24 PM Sean Christopherson <seanjc@google.com> wrote:
>
> On Mon, Sep 13, 2021, Juergen Gross wrote:
> > KVM_MAX_VCPU_ID is not specifying the highest allowed vcpu-id, but the
> > number of allowed vcpu-ids. This has already led to confusion, so
> > rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS to make its semantics more
> > clear
>
> My hesitation with this rename is that the max _number_ of IDs is not the same
> thing as the max allowed ID.  E.g. on x86, given a capability that enumerates the
> max number of IDs, I would expect to be able to create vCPUs with arbitrary 32-bit
> x2APIC IDs so long as the total number of IDs is below the max.
>

What name would you suggest instead? KVM_VCPU_ID_LIMIT, maybe?

I'm assuming we are not going to redefine KVM_MAX_VCPU_ID to be an
inclusive limit.

--
Eduardo

