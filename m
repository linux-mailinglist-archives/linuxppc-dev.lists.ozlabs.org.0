Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1518B3B0AB1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 18:52:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8XWn5n62z309T
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Jun 2021 02:52:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PaGmhVjn;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PaGmhVjn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=PaGmhVjn; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=PaGmhVjn; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8XWK3Kt9z2xgN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Jun 2021 02:52:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624380735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4P1PfITd6m9CRCYryDXbjzGuOd03lvZO6GwMrQOOd8k=;
 b=PaGmhVjnMmR7KsW0LVJyuFL62EUcIP7TXELQiLg/KG8xtUV7b3feYBsgF8F30LPMvU3p+m
 FwvuMCIAJVKpeZwrVxpgKdwd2JvH2aTi9ZmTEbT3UkcWyARTwDDA6liN+44fQoRlFXZIxo
 G1dxZytNv3rqNXWx1ISsybAUmi+3hkM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624380735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4P1PfITd6m9CRCYryDXbjzGuOd03lvZO6GwMrQOOd8k=;
 b=PaGmhVjnMmR7KsW0LVJyuFL62EUcIP7TXELQiLg/KG8xtUV7b3feYBsgF8F30LPMvU3p+m
 FwvuMCIAJVKpeZwrVxpgKdwd2JvH2aTi9ZmTEbT3UkcWyARTwDDA6liN+44fQoRlFXZIxo
 G1dxZytNv3rqNXWx1ISsybAUmi+3hkM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-7-gPuSonJMMaS2CEhR4O1eew-1; Tue, 22 Jun 2021 12:52:12 -0400
X-MC-Unique: gPuSonJMMaS2CEhR4O1eew-1
Received: by mail-wr1-f71.google.com with SMTP id
 h104-20020adf90710000b029010de8455a3aso9978544wrh.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 09:52:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4P1PfITd6m9CRCYryDXbjzGuOd03lvZO6GwMrQOOd8k=;
 b=iKqVRMFZ+n4g+fy1+md7kkIklmDaUC/ztsLTC4VvIa1QeS3g/YhlvCEXBFpsX+9xMt
 ZUEO/glIlWhZVK0JtJWG8PmftgUmLrQumgPZdw9FitCXZB/6+43cYJmMPAVHDX2RQ9Ck
 6iKW7DVRYQEXoH29wvckBfsPSaYydhclFj89wjWiuoUifQNsF0ZctFa0+GjVEujVCmW2
 fxcFGPUYBvSlik1o+s6UrAReF18QJyh/9FNf/Juf2WYU5PSLevA5umeytrM4M+8zRXgt
 uYsmbZlq7gQRtUSGN4+0R3Yu84zAqQg0iVSDjJapbykAoVqRUkpWZmjpEfsGaKZjlYje
 8XVQ==
X-Gm-Message-State: AOAM53074LsH9q/FhYLgR2ydI9BQyGTdCUm+mYQcaCo72MKA5eAJkQKv
 RUH0NppVCNF3l/efpoQCu3X4y/OdFto4viuxKco9BqKwg02ekrneRdRb+hH9PZq5TUlOzT/nzL7
 SYNGzP6JsFUEGg5SSmTlhKBZbbA==
X-Received: by 2002:a5d:4904:: with SMTP id x4mr5939008wrq.202.1624380731269; 
 Tue, 22 Jun 2021 09:52:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHwvAETSGbesb6gzKh+dnovh/8/FzEzs9O+mu8f0VjdUXRziEiWzP7ITmfJWkfwxeiQrPAIQ==
X-Received: by 2002:a5d:4904:: with SMTP id x4mr5938982wrq.202.1624380731048; 
 Tue, 22 Jun 2021 09:52:11 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n18sm3132025wmq.41.2021.06.22.09.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 09:52:10 -0700 (PDT)
Subject: Re: linux-next: manual merge of the kvm tree with the powerpc tree
To: Michael Ellerman <mpe@ellerman.id.au>,
 Stephen Rothwell <sfr@canb.auug.org.au>, KVM <kvm@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
References: <20210622152544.74e01567@canb.auug.org.au>
 <9c2dbe56-4c64-0032-0acb-2e2925c7a2ab@redhat.com>
 <871r8u2bqp.fsf@mpe.ellerman.id.au>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <479d2898-07d6-9a40-70e5-f33c91943d52@redhat.com>
Date: Tue, 22 Jun 2021 18:52:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <871r8u2bqp.fsf@mpe.ellerman.id.au>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
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

On 22/06/21 16:51, Michael Ellerman wrote:
>> Please drop the patches at
>> https://www.spinics.net/lists/kvm-ppc/msg18666.html  from the powerpc
>> tree, and merge them through either the kvm-powerpc or kvm trees.
> The kvm-ppc tree is not taking patches at the moment.

If so, let's remove the "T" entry from MAINTAINERS and add an entry for 
the kvm@vger.kernel.org mailing list.

>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git/log/?h=topic/ppc-kvm
> 
> The commit Stephen mentioned has been rebased since to squash in a fix.
> But what is in the topic branch is now final, I won't rebase what's
> there.

Thanks, I pulled it.  Anyway, if the workflow is not the one indicated 
by MAINTAINERS it's never a bad idea to Cc more people when applying 
patches.

Paolo

