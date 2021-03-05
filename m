Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC3832E0D8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 05:45:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsFXw5z2Nz3dC0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 15:45:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=Ofh1Hisz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::436;
 helo=mail-pf1-x436.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=Ofh1Hisz; dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsFXV67gNz3cbK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 15:45:12 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id w18so1155418pfu.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 20:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=dvhZCW02cSrw6wLow/cEYL9mfdL94hp8q7KDEYz2Ow8=;
 b=Ofh1HiszzfsRjiIh19nlP00q27z2AjN9ixQ5PbTck4BoMfICPe24qzyw4hxz7BN4iy
 4HgKR218h/CLUDMdxb+E1qzYlqOK4uhnZbmWKbe6KMQvxj5VzRzWBlrntxgdhkITFCub
 IJlomiPVLta7MItAWR9IsnBEdvt69yW/Z3ry0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=dvhZCW02cSrw6wLow/cEYL9mfdL94hp8q7KDEYz2Ow8=;
 b=iQxeUlu07vhLjlqO4BbHHSKKtbn60T17uQnX0WPjjpKUslgmR1jWSL4ZkHeT7SVwVj
 C0jFAWJkO/mvpjOdn1GSv1eZ9+9FbcCDJzct98qQif/xZ8m4ub3S/8NWvBVXoi/TZZWA
 qZ9Y7oF6QkXtnvkamwXZAVt7QX6VSy6DZOr1Xac5eCzASojZ3lr9cmEvXJ7/upPJsQfR
 2Okqf+2x4q202r6mVFplatPgtVDjco98BFyzfNvqCJOoK0JhdBcKAFD8UuJfurPzbQ3R
 krcNzig4/hxQgRvH5GcjqnWIugwbKzFo+jT6EepPeVRlj8DdbmnT2lVFE2E7h/RW4XGT
 S94Q==
X-Gm-Message-State: AOAM532vDt7S3EGFYFo0blroNQDE1hi/9R3m4A6KVtBxrHE20/9EV31e
 pw0X9NCIQfdnpb3f/bXC1+WPUA==
X-Google-Smtp-Source: ABdhPJzOnn++HWmEOHHjEvLODI9XCRbZBmiVKcug1fqDhp74nCyoW8Wrn+8XCSllNEy+VlP3GElKMw==
X-Received: by 2002:a63:4f56:: with SMTP id p22mr6844756pgl.224.1614919508812; 
 Thu, 04 Mar 2021 20:45:08 -0800 (PST)
Received: from localhost
 (2001-44b8-1113-6700-7ad2-5bb3-4fd4-d737.static.ipv6.internode.on.net.
 [2001:44b8:1113:6700:7ad2:5bb3:4fd4:d737])
 by smtp.gmail.com with ESMTPSA id f19sm885685pgl.49.2021.03.04.20.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Mar 2021 20:45:08 -0800 (PST)
From: Daniel Axtens <dja@axtens.net>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v2 01/37] KVM: PPC: Book3S 64: remove unused
 kvmppc_h_protect argument
In-Reply-To: <1614383256.cikqwycx8o.astroid@bobo.none>
References: <20210225134652.2127648-1-npiggin@gmail.com>
 <20210225134652.2127648-2-npiggin@gmail.com>
 <878s7ba0cm.fsf@linkitivity.dja.id.au>
 <1614383256.cikqwycx8o.astroid@bobo.none>
Date: Fri, 05 Mar 2021 15:45:05 +1100
Message-ID: <87wnum8azy.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick,

>> ERROR: code indent should use tabs where possible
>> #25: FILE: arch/powerpc/include/asm/kvm_ppc.h:770:
>> +                      unsigned long pte_index, unsigned long avpn);$
>> 
>> WARNING: please, no spaces at the start of a line
>> #25: FILE: arch/powerpc/include/asm/kvm_ppc.h:770:
>> +                      unsigned long pte_index, unsigned long avpn);$
>
> All the declarations are using the same style in this file so I think
> I'll leave it for someone to do a cleanup patch on. Okay?

Huh, right you are. In that case:
Reviewed-by: Daniel Axtens <dja@axtens.net>

Kind regards,
Daniel
