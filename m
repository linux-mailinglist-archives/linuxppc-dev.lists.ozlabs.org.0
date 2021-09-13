Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BECD9409C09
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 20:22:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7ZZX4LR9z2yQ6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 04:22:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=I8oAss5K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::532;
 helo=mail-pg1-x532.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=I8oAss5K; dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7ZYq3zZBz2yKR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 04:21:33 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id k24so10227502pgh.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 11:21:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6++MUHqyHKCB5FgpZ/mPI8mWFFcZJMAIOAPJiYxj2J8=;
 b=I8oAss5KvNOxSzhenZXmIesL1MTLaeyUnk6Q8EYJv5KLYqd1LxYtn/ptQxgv3SD+T9
 PsQ3lmeYGUOmkmNBEchDt3vbOWf9cDZ90nOdyyxe+PJxS6IItldgrzQgOojUBQJ9bxR0
 MyBt75NYyvzrKbm2331lHF5jPUnLM/Z4/K+PyuyXMBjivWPXQ5CUE0HDc1dRbLaZYOKY
 BxXw50eAQgSRSTQ7ePnQPyXCKvYAlFcNZ3SQ6pgwqdpfVP7+nhLYaOvgheq0lrdxWlWB
 3bBhDAN6CcQfyLsrTyRTzGqroPXLKVttcyRR7ITwmfGoVYHHNY4Xpa/Dj/oY2lcBFm/W
 hDMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6++MUHqyHKCB5FgpZ/mPI8mWFFcZJMAIOAPJiYxj2J8=;
 b=aVvwo8eeNfn4pRewQdp7uPPgjxVFYFpN0P4yZYLvkc5gg7M8L2qO/LZS7Yur47BXRg
 oLb6ZSenF4j645Jvb8/f0sfgbo4FTk1+jdgqi3uF43zClbhWVT7OwyxTuVe4cSMiu6oF
 WzGhfX/ROHrpXHaurqKydqyW9n7IrrXshCyoIEv1iMYGUH9IXajwzdW8x6Fk5Tdb8LoV
 6O3iNdYXVjW3dhl0CSVjXanuks+Huy5GykB/X8K5x3TojYpY6nfZvO0k+Qs3HwlI81//
 BW63uTJzdp5oUDvcrFJyplXoT+xqRo6/zK1jvcc7gnL8r/5tTGdFfN0/32Iga96xfprn
 Gx8Q==
X-Gm-Message-State: AOAM532T13pGJm0DnSmhfJwaEFUiruGrjF7SiPlJfOctEaWCC/AZyP0H
 9yI9wglbYi/nZzD0Hqg60f/rlQ==
X-Google-Smtp-Source: ABdhPJzgg07OWjq2bQtnbrD/FW+0dCRqz+/2tJpzVzU6KzTpUZG3HRY1sfxYtkNoWAuSpFfjZ/hUlw==
X-Received: by 2002:a05:6a00:1a10:b0:412:448c:89ca with SMTP id
 g16-20020a056a001a1000b00412448c89camr811832pfv.86.1631557289837; 
 Mon, 13 Sep 2021 11:21:29 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id x13sm4547221pfp.133.2021.09.13.11.21.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 11:21:29 -0700 (PDT)
Date: Mon, 13 Sep 2021 18:21:25 +0000
From: Sean Christopherson <seanjc@google.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Subject: Re: [PATCH 2/2] kvm: rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS
Message-ID: <YT+WpdnGodZE9krY@google.com>
References: <20210913135745.13944-1-jgross@suse.com>
 <20210913135745.13944-3-jgross@suse.com>
 <YT97K7yXyCrphyCt@google.com>
 <CAOpTY_pyeOo2Kh-r1cEFk2XL4g8A1mxQpP1y62thWk2mh6XUUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOpTY_pyeOo2Kh-r1cEFk2XL4g8A1mxQpP1y62thWk2mh6XUUg@mail.gmail.com>
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

On Mon, Sep 13, 2021, Eduardo Habkost wrote:
> On Mon, Sep 13, 2021 at 12:24 PM Sean Christopherson <seanjc@google.com> wrote:
> >
> > On Mon, Sep 13, 2021, Juergen Gross wrote:
> > > KVM_MAX_VCPU_ID is not specifying the highest allowed vcpu-id, but the
> > > number of allowed vcpu-ids. This has already led to confusion, so
> > > rename KVM_MAX_VCPU_ID to KVM_MAX_VCPU_IDS to make its semantics more
> > > clear
> >
> > My hesitation with this rename is that the max _number_ of IDs is not the same
> > thing as the max allowed ID.  E.g. on x86, given a capability that enumerates the
> > max number of IDs, I would expect to be able to create vCPUs with arbitrary 32-bit
> > x2APIC IDs so long as the total number of IDs is below the max.
> >
> 
> What name would you suggest instead? KVM_VCPU_ID_LIMIT, maybe?
> 
> I'm assuming we are not going to redefine KVM_MAX_VCPU_ID to be an
> inclusive limit.

Heh, I haven't been able to come up with one, which is why I suggested the route
of making it an inclusive value internally within KVM.
