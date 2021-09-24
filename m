Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 85724416F3F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 11:42:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HG6WX2gV6z3bbx
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Sep 2021 19:42:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=shutemov-name.20210112.gappssmtp.com header.i=@shutemov-name.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=a94RXEUJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20210112.gappssmtp.com
 header.i=@shutemov-name.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=a94RXEUJ; dkim-atps=neutral
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HG6Vn71Fdz2ynX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 19:41:36 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id u8so37175159lff.9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Sep 2021 02:41:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7QWYmDDdQ14wxTTMWtNorG+4hnmrm04qfz4ZOujDnZs=;
 b=a94RXEUJuMmQvxSDKok9kJbMV98Mo28f1Csi4Z4iwvW7+MkRyX5SrQhnYAAaonglNs
 TqzSbC141ptsWvvzM0S2r5099PgvSLUTd+llMs5cQH1O/KYv2VKwA3rHbEQ17XEUoJiN
 b88sf+8/Kq6CN5gKqNMDbt0WofHePWjCWhJfrHH/URopiQYKQJViZtb5wMUubTQfdu6m
 e490qkHKD0Pb0R4D5rMx+0JuhhDDbQUkFWETXBCjCVPYNSZnkKFRM+sk+iiLVm+sara7
 E1aPac0dVliF4TZMk0iL6yousngzwZf3UFxxtnempLUEnPswt9hwLB+6ECQ/gPgJLFvg
 u+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7QWYmDDdQ14wxTTMWtNorG+4hnmrm04qfz4ZOujDnZs=;
 b=ejRo644Q3XBqM8EWg3x3sr3bbaXw5RSRbOd7zutKKSNVmId0vmdAb3/wamUdtLnn8C
 KsR2MqW7/es+5TlrZr222475ojdTE3iPRpRGsYyHRo3CyR8kBwkezvh/N18+Jddj9jnt
 KbmFoiY4kMeMtuBo38di+V1d9lPwi3CRMjvKb0gQxbLhPeyXbveukoCXHJxJFjg/ZOQV
 Aatc+SQyHEYypGczb03Qnn/P++OYlE0NYu521hzvH7RBGxGM5Yiw+s9OnYXKS6G5V1c8
 gmsz3vatwruzF6ou6Met+uNX4Qmro84xC7A2aNvXxaljiDSiZoS9YeLIjV4KCOd+6zsZ
 dXXg==
X-Gm-Message-State: AOAM531OAlBev2IPX8dRfsgphKKtTGNQSjxkLWKr4OFDZlVSnwXS7C69
 JPpTA326gklS51jbGDyYz9EWkQ==
X-Google-Smtp-Source: ABdhPJz+tcQG7FGy3FlEBQPrN+mpMikLwlc4Lo7J+ey+pIvMNuRrMxCLd7yfmXFIncsb4Qxt6AJb6g==
X-Received: by 2002:a2e:804c:: with SMTP id p12mr10420673ljg.344.1632476490492; 
 Fri, 24 Sep 2021 02:41:30 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id k21sm952544lji.81.2021.09.24.02.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 02:41:29 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 84289103068; Fri, 24 Sep 2021 12:41:32 +0300 (+03)
Date: Fri, 24 Sep 2021 12:41:32 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 5/8] x86/sme: Replace occurrences of sme_active() with
 cc_platform_has()
Message-ID: <20210924094132.gxyqp4z3qdk5w4j6@box.shutemov.name>
References: <20210921212059.wwlytlmxoft4cdth@box.shutemov.name>
 <YUpONYwM4dQXAOJr@zn.tnic>
 <20210921213401.i2pzaotgjvn4efgg@box.shutemov.name>
 <00f52bf8-cbc6-3721-f40e-2f51744751b0@amd.com>
 <20210921215830.vqxd75r4eyau6cxy@box.shutemov.name>
 <01891f59-7ec3-cf62-a8fc-79f79ca76587@amd.com>
 <20210922143015.vvxvh6ec73lffvkf@box.shutemov.name>
 <YUuJZ2qOgbdpfk6N@zn.tnic>
 <20210922210558.itofvu3725dap5xx@box.shutemov.name>
 <YUzFj+yH79XRc3F3@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUzFj+yH79XRc3F3@zn.tnic>
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
Cc: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>,
 linux-efi@vger.kernel.org, Brijesh Singh <brijesh.singh@amd.com>,
 kvm@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Will Deacon <will@kernel.org>,
 linux-s390@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 Joerg Roedel <joro@8bytes.org>, x86@kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 linux-graphics-maintainer@vmware.com, Tom Lendacky <thomas.lendacky@amd.com>,
 Tianyu Lan <Tianyu.Lan@microsoft.com>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 23, 2021 at 08:21:03PM +0200, Borislav Petkov wrote:
> On Thu, Sep 23, 2021 at 12:05:58AM +0300, Kirill A. Shutemov wrote:
> > Unless we find other way to guarantee RIP-relative access, we must use
> > fixup_pointer() to access any global variables.
> 
> Yah, I've asked compiler folks about any guarantees we have wrt
> rip-relative addresses but it doesn't look good. Worst case, we'd have
> to do the fixup_pointer() thing.
> 
> In the meantime, Tom and I did some more poking at this and here's a
> diff ontop.
> 
> The direction being that we'll stick both the AMD and Intel
> *cc_platform_has() call into cc_platform.c for which instrumentation
> will be disabled so no issues with that.
> 
> And that will keep all that querying all together in a single file.

And still do cc_platform_has() calls in __startup_64() codepath?

It's broken.

Intel detection in cc_platform_has() relies on boot_cpu_data.x86_vendor
which is not initialized until early_cpu_init() in setup_arch(). Given
that X86_VENDOR_INTEL is 0 it leads to false-positive.

I think opencode these two calls is the way forward. Maybe also move the
check from sme_encrypt_kernel() to __startup_64().

-- 
 Kirill A. Shutemov
