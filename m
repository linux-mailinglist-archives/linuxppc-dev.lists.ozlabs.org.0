Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2103AFD0B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 08:24:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8GZD3Jf8z3bt4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 16:24:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vu9UFfAm;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vu9UFfAm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Vu9UFfAm; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=Vu9UFfAm; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8GYj2DGfz303J
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 16:23:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624343010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQqfkvCtBb6g17+HqN0uwZioUK6+vGsvOXTdTvz9LIc=;
 b=Vu9UFfAm8JQGU6xLrkxwpRijh6aNOtMxuPhnsbcpKbGwYuGh+oB/iaovR3iGrVp2XD2YR8
 dfHKmjZd6IPAJbLeQmIWOHRnDYfAhCRm/1X5fClbb6NNfkPMiodYE/qZxqUmzalreNekIg
 oE5f5DRRrZD2qgfK0YAAT+SJe50zV4A=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624343010;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aQqfkvCtBb6g17+HqN0uwZioUK6+vGsvOXTdTvz9LIc=;
 b=Vu9UFfAm8JQGU6xLrkxwpRijh6aNOtMxuPhnsbcpKbGwYuGh+oB/iaovR3iGrVp2XD2YR8
 dfHKmjZd6IPAJbLeQmIWOHRnDYfAhCRm/1X5fClbb6NNfkPMiodYE/qZxqUmzalreNekIg
 oE5f5DRRrZD2qgfK0YAAT+SJe50zV4A=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-djk2ir2gNLW4vCBmH7YI6A-1; Tue, 22 Jun 2021 02:23:28 -0400
X-MC-Unique: djk2ir2gNLW4vCBmH7YI6A-1
Received: by mail-wm1-f71.google.com with SMTP id
 i82-20020a1c22550000b02901d64e84b3c9so905718wmi.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Jun 2021 23:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=aQqfkvCtBb6g17+HqN0uwZioUK6+vGsvOXTdTvz9LIc=;
 b=oDFQklCahJyVmDNgdHqjuwi7F+0FvXl3ldMXgjR3u9J5gF+ylfTltCzRJtvdin4dUk
 bhvMTMSNcFPTAC/VsAN28f7HUlrwiQQCkOETrKJdXpTuH51blWW+IxsvZGWsLbO8+WtX
 JCfioLQME5U+QIj8b6fZXoRkVCP/8yXHbLefB+TpkKU+K6osXdXoYMyXp7QoIAasO6Zh
 WE8gBOqUeIAbCxjJvVtoAmcBwOgy4T8zrerHFvTV8bT6xk3twCnnunfP78e5PtBzYgIW
 3Ua0WgdkSYVQRxDG05q++uqV207p/i5W2iC3teKZITh8ThLkmP4Gh6HkfU401BwLwnh9
 7Xmw==
X-Gm-Message-State: AOAM530qIQgkFKY/OJDNnoNdPIwwm/3I5XyBr7WrtP1sN8hiIzW3k9HA
 laX9XOAbLz2u0d+O1DQYGox2UkQ+OJZ1XAMUPnHNheQI+7iY1HpvJJLjRKGqGyeNnKl1518oStQ
 WARAmaa8SyAdBSLBaNzG/tofs6g==
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr2678885wrr.358.1624343006202; 
 Mon, 21 Jun 2021 23:23:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyH/4w8wmlBb+QUv5p9+m3hdd4Lh4ZTIRS504JjrKAX2ybZM9tGHk+qPRypejrUSPVJj6nMOg==
X-Received: by 2002:a5d:44d2:: with SMTP id z18mr2678861wrr.358.1624343006005; 
 Mon, 21 Jun 2021 23:23:26 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a1sm26072095wra.63.2021.06.21.23.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Jun 2021 23:23:25 -0700 (PDT)
Subject: Re: linux-next: manual merge of the kvm tree with the powerpc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>, KVM <kvm@vger.kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
References: <20210622152544.74e01567@canb.auug.org.au>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <9c2dbe56-4c64-0032-0acb-2e2925c7a2ab@redhat.com>
Date: Tue, 22 Jun 2021 08:23:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210622152544.74e01567@canb.auug.org.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: Ashish Kalra <ashish.kalra@amd.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Sean Christopherson <seanjc@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/06/21 07:25, Stephen Rothwell wrote:
> Hi all,
> 
> Today's linux-next merge of the kvm tree got a conflict in:
> 
>    include/uapi/linux/kvm.h
> 
> between commit:
> 
>    9bb4a6f38fd4 ("KVM: PPC: Book3S HV: Add KVM_CAP_PPC_RPT_INVALIDATE capability")
> 
> from the powerpc tree and commits:
> 
>    644f706719f0 ("KVM: x86: hyper-v: Introduce KVM_CAP_HYPERV_ENFORCE_CPUID")
>    6dba94035203 ("KVM: x86: Introduce KVM_GET_SREGS2 / KVM_SET_SREGS2")
>    0dbb11230437 ("KVM: X86: Introduce KVM_HC_MAP_GPA_RANGE hypercall")
> 
> from the kvm tree.
> 
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
> 

What are the dependencies of these KVM patches on patches from the bare 
metal trees, and can you guys *please* start using topic branches?

I've been asking you for literally years, but this is the first time I 
remember that Linus will have to resolve conflicts in uAPI changes and 
it is *not* acceptable.

Please drop the patches at 
https://www.spinics.net/lists/kvm-ppc/msg18666.html from the powerpc 
tree, and merge them through either the kvm-powerpc or kvm trees.

Paolo

