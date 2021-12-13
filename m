Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3574732F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 18:31:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCT7p37RRz3c7g
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 04:31:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=kHQfPRtJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=seanjc@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20210112 header.b=kHQfPRtJ; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCT79065xz2yLd
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 04:30:43 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id gt5so12375426pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Dec 2021 09:30:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=JLl9NBjWhC8ycFWNbwA1xe7cz0lo/vfYPVBrYSBn0zQ=;
 b=kHQfPRtJy95Q3BTzS0nITHh7PKHGRCYTW7MbSbqmRtJPWWv96ES5/2t3Nyx6lMjnL1
 NmKrHkpIG5YHkWb+py2doU5OzOS1Pjt1xdAKGaKT4KeEOfDq1koiO6J+/g7iIDe8tfy/
 Morf2+k56PdVNWRQA0ipFSu8z5LiVfu8tdNebySj/Osc0f5rVwqOmeBJFq1p2R5OgKIb
 +Gg9VdpL3GfYrozJQWFPRlavhlmhZ1BetwAuuXB74BS6rvqTCsGp6gNUf+cU70gQZYW+
 MbU/B7aNM+8fzfBFVyE3S5s1IMFd9HZW5PfsUxOrxYlKNFLOxjebCWfHS+QCsn46vfjd
 DT0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JLl9NBjWhC8ycFWNbwA1xe7cz0lo/vfYPVBrYSBn0zQ=;
 b=1qlmc15eXqxPWUQ/omar7NhZmvM5FUMJ7a0aOFgR3On3Zqa9qxComToZhqQOGacbIH
 w+mRnVqHNz5mfd9WYKEsa2NLOarrcc9BPSjWj/l/ZmMBYyzJmK+3i2FoKiVImqlbn+Mz
 TY+n8i/cTrLGsZZ1iE6/Kf2jGVuJa8bQUuah6dpkRvHGbxMQt54yK8bXVq11SMdAYL+o
 OMTMVeC2oD5/bMTTP6CgGymKwe58hGhVxIw4/zvfCgPUbnZX16153geA5usUpuLr4Pyp
 J0M9i96PujHaDSXgrYjAvEiEcVlUXyorn0jc46kO/F3WBZXFCNL6Q/laj/oLrNaVaapQ
 89yA==
X-Gm-Message-State: AOAM5317DrsYllIaz/iIdL/ju8GIJc4EARlgTa9ZQVNVVtmYqGf3sAow
 qzz87rpf0KhpGeN/9KJIk2sjxA==
X-Google-Smtp-Source: ABdhPJyB2C91wLSzzIMpfR+iEbCKqIGvUxk0irgmd2CZCEZjmCAgPiOl9dvAamgDlWeyfWdcv2KWvw==
X-Received: by 2002:a17:90b:4c03:: with SMTP id
 na3mr45572990pjb.62.1639416640628; 
 Mon, 13 Dec 2021 09:30:40 -0800 (PST)
Received: from google.com (157.214.185.35.bc.googleusercontent.com.
 [35.185.214.157])
 by smtp.gmail.com with ESMTPSA id h8sm14368696pfh.10.2021.12.13.09.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 09:30:40 -0800 (PST)
Date: Mon, 13 Dec 2021 17:30:36 +0000
From: Sean Christopherson <seanjc@google.com>
To: Sachin Sant <sachinp@linux.vnet.ibm.com>
Subject: Re: [next-20211210] Build break powerpc/kvm: unknown member wait
Message-ID: <YbeDPEx2/DgmZExK@google.com>
References: <496ECBB3-36F3-4F07-83B2-875F683BC446@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <496ECBB3-36F3-4F07-83B2-875F683BC446@linux.vnet.ibm.com>
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
Cc: linux-next@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Dec 11, 2021, Sachin Sant wrote:
> next-20211210 ( commit ea922272cbe547) powerpc build fails due to following error:
> 
> arch/powerpc/kvm/book3s_hv.c: In function 'kvmhv_run_single_vcpu':
> arch/powerpc/kvm/book3s_hv.c:4591:27: error: 'struct kvm_vcpu' has no member named 'wait'
>    prepare_to_rcuwait(&vcpu->wait);
>                            ^~
> arch/powerpc/kvm/book3s_hv.c:4608:23: error: 'struct kvm_vcpu' has no member named 'wait'
>    finish_rcuwait(&vcpu->wait);
>                        ^~ 
> 
> commit 510958e997217: KVM: Force PPC to define its own rcuwait object 
> introduced the error. 

This is a silent merge conflict between the above commit in the KVM tree and
commit ecb6a7207f92 ("KVM: PPC: Book3S HV P9: Remove most of the vcore logic")
in the PPC tree.

I'll send a patch for the PPC tree that is resolves the issue and is a standalone
cleanup.
