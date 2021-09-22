Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C17FF41525F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 23:06:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HF9p94s6Gz2ybN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 07:06:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=shutemov-name.20210112.gappssmtp.com header.i=@shutemov-name.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=xEkq7SUZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20210112.gappssmtp.com
 header.i=@shutemov-name.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=xEkq7SUZ; dkim-atps=neutral
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HF9nR51HRz2yZc
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 07:06:01 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id u8so16756307lff.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 14:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=/PcqjgcRCkyIpO5H00bhPWTTbPCMNXWR4nKgirdi3Io=;
 b=xEkq7SUZRewChVZqWhm4cS96l8pPzSSEz+ScgQL56dgjn10FcSw+jLPv0OY9bYezIP
 CYphaUGJXn/snvtDU3KSfg579Nb5Qlk3NtUo6CuASAlclCh3ui7cA33wRO6foyyQk9sK
 Mw3x0Ft59CKVBwMroO3W4lugA/tv5mEWbElbrHB+wIwMc5ZNjOZSS8KT6h+Zon+cf4qv
 JmEltnmffmbEBqUsebTV11v0B5U1mVwBUj3sW1gLZspQ54hm7TrP9j1QPJEblcLAhwI2
 nEggNK9m8gYxewjcBCYSYCHLIhl9iSTZmO6vl1lqR1Tl54TSO4jEGxDT96zBALyLtnLS
 Hi0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=/PcqjgcRCkyIpO5H00bhPWTTbPCMNXWR4nKgirdi3Io=;
 b=nF1ZLAIyu9t2OgKzWfwhc30kA3KwMTx8P9Kg2as1GjqACvwp5x1O8I1C/jdij+I0+T
 3MYoq7245v6Hsl2JuQ8gWMYKXm3N/3YIaBqWK1hMOjUOHo1b7b5NjPdtQfDT8zvqFxEV
 BK1js8KVB6aTc5gBBPL093PtGhGjnwxLY/0mdKh8f99zqsR33FfOJDyICwfEkSogHteg
 Fq471yAlYE9o+J1bxk424stdH+lD/MIb1JewxsllXFJwAjTfmPX311slQgbbt1mDSMkt
 vgDC2mrFpGMNIFtAjiz6PTZVbg7c76IGOG+gBEw0+ONbdBSwB+N66qEB7uSDH2Ym3cYR
 4GRw==
X-Gm-Message-State: AOAM532y2Yypc+MrA44dKCr7trFM+lrzEPLuMWFMk8fO8GMVVc9zuHxT
 OmGxfO5OLMgdFKU8s9p+O8/MfA==
X-Google-Smtp-Source: ABdhPJxFaBhI/uy8npc3Dtax2q52q/CAXrrCmDjvazERLjrealUJSj+rQLNB+0RcTEMnHlaiKFjmmA==
X-Received: by 2002:a05:6512:5c2:: with SMTP id
 o2mr917110lfo.207.1632344757440; 
 Wed, 22 Sep 2021 14:05:57 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id bi33sm370467ljb.89.2021.09.22.14.05.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 14:05:56 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 60F2A10304D; Thu, 23 Sep 2021 00:05:58 +0300 (+03)
Date: Thu, 23 Sep 2021 00:05:58 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Borislav Petkov <bp@alien8.de>
Subject: Re: [PATCH v3 5/8] x86/sme: Replace occurrences of sme_active() with
 cc_platform_has()
Message-ID: <20210922210558.itofvu3725dap5xx@box.shutemov.name>
References: <77df37e1-0496-aed5-fd1d-302180f1edeb@amd.com>
 <YUoao0LlqQ6+uBrq@zn.tnic>
 <20210921212059.wwlytlmxoft4cdth@box.shutemov.name>
 <YUpONYwM4dQXAOJr@zn.tnic>
 <20210921213401.i2pzaotgjvn4efgg@box.shutemov.name>
 <00f52bf8-cbc6-3721-f40e-2f51744751b0@amd.com>
 <20210921215830.vqxd75r4eyau6cxy@box.shutemov.name>
 <01891f59-7ec3-cf62-a8fc-79f79ca76587@amd.com>
 <20210922143015.vvxvh6ec73lffvkf@box.shutemov.name>
 <YUuJZ2qOgbdpfk6N@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUuJZ2qOgbdpfk6N@zn.tnic>
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

On Wed, Sep 22, 2021 at 09:52:07PM +0200, Borislav Petkov wrote:
> On Wed, Sep 22, 2021 at 05:30:15PM +0300, Kirill A. Shutemov wrote:
> > Not fine, but waiting to blowup with random build environment change.
> 
> Why is it not fine?
> 
> Are you suspecting that the compiler might generate something else and
> not a rip-relative access?

Yes. We had it before for __supported_pte_mask and other users of
fixup_pointer().

See for instance 4a09f0210c8b ("x86/boot/64/clang: Use fixup_pointer() to
access '__supported_pte_mask'")

Unless we find other way to guarantee RIP-relative access, we must use
fixup_pointer() to access any global variables.

-- 
 Kirill A. Shutemov
