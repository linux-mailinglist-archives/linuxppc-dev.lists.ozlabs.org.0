Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A2413D2D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:59:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDb1B3hzHz3c77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:59:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=shutemov-name.20210112.gappssmtp.com header.i=@shutemov-name.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=uz74/2S9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=shutemov.name
 (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=kirill@shutemov.name; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=shutemov-name.20210112.gappssmtp.com
 header.i=@shutemov-name.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=uz74/2S9; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDb0W4W0bz2xXX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:58:34 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id y28so3625118lfb.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Sep 2021 14:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=shutemov-name.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3LA4/O2mCyOef4VI1WFdoR8n1dGVVw7qzM7cBS6DVhU=;
 b=uz74/2S9fGGuaG1ODTSPcqBPXWYPIeYWZ5doyMS2bRw5AX5Q0Ua+uMdim4ZuJxyrxA
 jJZQO4P96OqxH5cKvegadiVeIhPzNJbdYGDNOj6HudiXM/SjkCNrO1WvHS6o1vufFzsX
 2aSN3AaXAf4xQbbvR+FPssTEArjutFFJ66GH7RUNHyFCNozOqySWjjTExvVocPFb39xr
 6cGXTnJkbxFWnWohqMtGSjOnjJQnu/xNRG5R8l2FsElk/Lpvl66TfQOcwUYfJ1TTZ5xS
 XHIL9Tea6doFMlP16r8MNgBnWMAMa0JaH2OsWma5jit+qxznz4qqyPPj9R612HR9czFp
 8TyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3LA4/O2mCyOef4VI1WFdoR8n1dGVVw7qzM7cBS6DVhU=;
 b=y+LXfmzP5sndkqt4m1560ccwsEOPDP/Lj1pOxt4jpcU2zfvZqjIi2K067H9x1RsOKb
 +C/rSIV0sD4fOx+GWN3UHuxP3NGCk8CuPFGJFZJego4fb+4L6NBu46sBxVroNM2iJyAX
 aGfGMv/E5D1SI6JWd1nXB+0jL2mkGdrUks1a1KN0jKLEbeBxpYmfeUxhkd1dKE8oLAE7
 edUAt4sGabEuT6jxnT1wTskX/epUmz6yoR4rXNPwYaIBSwYZZyTjKnQ++m4dFOMQeNxC
 pGR9pwdg7LOi+riaBs42iQrOz+n+FKK/+PtuPxtaZkzC1QhXhnlNdc/P3prufzVEDmZw
 5O9g==
X-Gm-Message-State: AOAM530VCZOSNhIDpNt30sot7fdMekLRTVm5uJeu/nl/n7lPOG+tZidb
 IHXmDDPvcvabXCTFPwempjT6jJSFh49SXXxgh6A=
X-Google-Smtp-Source: ABdhPJwDR/A8UmkVQG/A20LQ6G5BoWJFTrnWNencwdMb7p0WPRY497q9Nuc+l8sjchxpIRdzv87pHg==
X-Received: by 2002:a2e:86ce:: with SMTP id n14mr11214294ljj.211.1632261509754; 
 Tue, 21 Sep 2021 14:58:29 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
 by smtp.gmail.com with ESMTPSA id q7sm16555ljg.137.2021.09.21.14.58.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 14:58:29 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
 id 5DF1710305C; Wed, 22 Sep 2021 00:58:30 +0300 (+03)
Date: Wed, 22 Sep 2021 00:58:30 +0300
From: "Kirill A. Shutemov" <kirill@shutemov.name>
To: Tom Lendacky <thomas.lendacky@amd.com>
Subject: Re: [PATCH v3 5/8] x86/sme: Replace occurrences of sme_active() with
 cc_platform_has()
Message-ID: <20210921215830.vqxd75r4eyau6cxy@box.shutemov.name>
References: <cover.1631141919.git.thomas.lendacky@amd.com>
 <367624d43d35d61d5c97a8b289d9ddae223636e9.1631141919.git.thomas.lendacky@amd.com>
 <20210920192341.maue7db4lcbdn46x@box.shutemov.name>
 <77df37e1-0496-aed5-fd1d-302180f1edeb@amd.com>
 <YUoao0LlqQ6+uBrq@zn.tnic>
 <20210921212059.wwlytlmxoft4cdth@box.shutemov.name>
 <YUpONYwM4dQXAOJr@zn.tnic>
 <20210921213401.i2pzaotgjvn4efgg@box.shutemov.name>
 <00f52bf8-cbc6-3721-f40e-2f51744751b0@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00f52bf8-cbc6-3721-f40e-2f51744751b0@amd.com>
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
 linux-graphics-maintainer@vmware.com, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 21, 2021 at 04:43:59PM -0500, Tom Lendacky wrote:
> On 9/21/21 4:34 PM, Kirill A. Shutemov wrote:
> > On Tue, Sep 21, 2021 at 11:27:17PM +0200, Borislav Petkov wrote:
> > > On Wed, Sep 22, 2021 at 12:20:59AM +0300, Kirill A. Shutemov wrote:
> > > > I still believe calling cc_platform_has() from __startup_64() is totally
> > > > broken as it lacks proper wrapping while accessing global variables.
> > > 
> > > Well, one of the issues on the AMD side was using boot_cpu_data too
> > > early and the Intel side uses it too. Can you replace those checks with
> > > is_tdx_guest() or whatever was the helper's name which would check
> > > whether the the kernel is running as a TDX guest, and see if that helps?
> > 
> > There's no need in Intel check this early. Only AMD need it. Maybe just
> > opencode them?
> 
> Any way you can put a gzipped/bzipped copy of your vmlinux file somewhere I
> can grab it from and take a look at it?

You can find broken vmlinux and bzImage here:

https://drive.google.com/drive/folders/1n74vUQHOGebnF70Im32qLFY8iS3wvjIs?usp=sharing

Let me know when I can remove it.

-- 
 Kirill A. Shutemov
