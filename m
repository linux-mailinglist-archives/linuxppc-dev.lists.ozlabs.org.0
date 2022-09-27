Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11CAB5EB7D3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 04:40:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mc3lH0Fv3z3cB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Sep 2022 12:40:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MRYnGiyG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=takahiro.akashi@linaro.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MRYnGiyG;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mc3kc2c3jz2xy4
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Sep 2022 12:40:05 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id z20so1003601plb.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Sep 2022 19:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date;
        bh=V8M4eGg3gaCQZE6o72RB5TOdPiGCPoyqG6tJ9FqxFAs=;
        b=MRYnGiyGQzAlQYCTGUTcEAcktEcLJHH7qTRBTxWQAbCpG3ywr6mwuBCNXi9xbv61Qp
         T5efRWUQRkpxvfkxyDtfKKxy2R41uCAHqVvSK3vNqoRUwVqVUywP3p0k61kxKKM2DznB
         fi3D5K9hrECwmWmAPj232bfprA2GiCcfznZ9dnioj0HGAi/5gbEJRd5EPaFolfVw4krz
         GpGKeczFd65BMaKa33nKHpfzkBsaoL0QnLjxOge4vLRzLbBo5XSzEcajxxgMLexMZ4ad
         qt0jW7DRonlwaOsj1cMyFyMNCWybcVliKgdJNUQLp90VyFThq1qVRPqwAPF5/xPtySgO
         qi1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=V8M4eGg3gaCQZE6o72RB5TOdPiGCPoyqG6tJ9FqxFAs=;
        b=m70xnpTskFQ77+Um8xMtaN/OqBp9Z1rovspP8Hayu4xknBJYSC6JawtMDilHLmD8kF
         vSkmiDiJwiLolbRy0OHu07vgc07lVeLehsOSEEbp56qH4GWN/CaS63EdS6kb+LNNMAq0
         tEtwK+lxok8IUIrCwWG6r7UVw5Vca7RELs128K+KTGlTUTPVJ8Sua/keak8Uqfi2riPQ
         ikaA+Iw2l0CuIUHg0XdOE6TSxJMjZuIHBX8iZOsSiMTUhpcBatbYcnntHFOyaIFgpvEj
         lhVJKbvm2IWXfafxWPsRLVmGwvzSHVxNvNV031gfa46avbFwxjveVgCLBaj2RoxyMLZI
         ikFg==
X-Gm-Message-State: ACrzQf03lzUQvjo/HskoWGiPuTFMfEhBgjtQZLA4Yk/wjO4lDiGywq1q
	/f+O52t624DPC0kWKexEvMXv8Q==
X-Google-Smtp-Source: AMsMyM6sitMgi6yITxtgKf/FIi6qTHBWgbXvjfJeLHcB7uXBXtwNqJ3kNZYPd9pZHeK4TfymUUh2rA==
X-Received: by 2002:a17:902:f688:b0:179:e82e:2dec with SMTP id l8-20020a170902f68800b00179e82e2decmr1943916plg.25.1664246403786;
        Mon, 26 Sep 2022 19:40:03 -0700 (PDT)
Received: from laputa ([2400:4050:c3e1:100:835a:afba:269b:b6fb])
        by smtp.gmail.com with ESMTPSA id w11-20020aa79a0b000000b0052d4b0d0c74sm245374pfj.70.2022.09.26.19.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Sep 2022 19:40:02 -0700 (PDT)
Date: Tue, 27 Sep 2022 11:39:52 +0900
From: AKASHI Takahiro <takahiro.akashi@linaro.org>
To: Michal Such??nek <msuchanek@suse.de>
Subject: Re: [PATCH 5.15 0/6] arm64: kexec_file: use more system keyrings to
 verify kernel image signature + dependencies
Message-ID: <20220927023952.GB34139@laputa>
Mail-Followup-To: AKASHI Takahiro <takahiro.akashi@linaro.org>,
	Michal Such??nek <msuchanek@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Philipp Rudo <prudo@redhat.com>, Sasha Levin <sashal@kernel.org>,
	Baoquan He <bhe@redhat.com>,
	Alexander Egorenkov <egorenar@linux.ibm.com>,
	"open list:S390" <linux-s390@vger.kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Eric Biederman <ebiederm@xmission.com>,
	Mimi Zohar <zohar@linux.ibm.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"moderated list:ARM64 PORT (AARCH64 ARCHITECTURE)" <linux-arm-kernel@lists.infradead.org>,
	"open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)" <linuxppc-dev@lists.ozlabs.org>,
	"open list:KEXEC" <kexec@lists.infradead.org>,
	Coiby Xu <coxu@redhat.com>, keyrings@vger.kernel.org,
	linux-security-module@vger.kernel.org,
	James Morse <james.morse@arm.com>
References: <cover.1663951201.git.msuchanek@suse.de>
 <Yy7Ll1QJ+u+nkic9@kroah.com>
 <20220924094521.GY28810@kitsune.suse.cz>
 <Yy7YTnJKkv1UtvWF@kroah.com>
 <20220924115523.GZ28810@kitsune.suse.cz>
 <YzFLBJukjDy7uNVl@kroah.com>
 <20220926074024.GD28810@kitsune.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220926074024.GD28810@kitsune.suse.cz>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Alexander Egorenkov <egorenar@linux.ibm.com>, keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Sasha Levin <sashal@kernel.org>, "open list:S390" <linux-s390@vger.kernel.org>, Coiby Xu <coxu@redhat.com>, Baoquan He <bhe@redhat.com>, "maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\)" <x86@kernel.org>, Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>, "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Eric Biederman <ebiederm@xmission.com>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, Mimi Zohar <zohar@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)" <linux-arm-kernel@lists.infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org
 >, "open list:KEXEC" <kexec@lists.infradead.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, linux-security-module@vger.kernel.org, James Morse <james.morse@arm.com>, Sven Schnelle <svens@linux.ibm.com>, Philipp Rudo <prudo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 26, 2022 at 09:40:25AM +0200, Michal Such??nek wrote:
> On Mon, Sep 26, 2022 at 08:47:32AM +0200, Greg Kroah-Hartman wrote:
> > On Sat, Sep 24, 2022 at 01:55:23PM +0200, Michal Suchánek wrote:
> > > On Sat, Sep 24, 2022 at 12:13:34PM +0200, Greg Kroah-Hartman wrote:
> > > > On Sat, Sep 24, 2022 at 11:45:21AM +0200, Michal Suchánek wrote:
> > > > > On Sat, Sep 24, 2022 at 11:19:19AM +0200, Greg Kroah-Hartman wrote:
> > > > > > On Fri, Sep 23, 2022 at 07:10:28PM +0200, Michal Suchanek wrote:
> > > > > > > Hello,
> > > > > > > 
> > > > > > > this is backport of commit 0d519cadf751
> > > > > > > ("arm64: kexec_file: use more system keyrings to verify kernel image signature")
> > > > > > > to table 5.15 tree including the preparatory patches.
> > > > > > 
> > > > > > This feels to me like a new feature for arm64, one that has never worked
> > > > > > before and you are just making it feature-parity with x86, right?
> > > > > > 
> > > > > > Or is this a regression fix somewhere?  Why is this needed in 5.15.y and
> > > > > > why can't people who need this new feature just use a newer kernel
> > > > > > version (5.19?)
> > > > > 
> > > > > It's half-broken implementation of the kexec kernel verification. At the time
> > > > > it was implemented for arm64 we had the platform and secondary keyrings
> > > > > and x86 was using them but on arm64 the initial implementation ignores
> > > > > them.
> > > > 
> > > > Ok, so it's something that never worked.  Adding support to get it to
> > > > work doesn't really fall into the stable kernel rules, right?
> > > 
> > > Not sure. It was defective, not using the facilities available at the
> > > time correctly. Which translates to kernels that can be kexec'd on x86
> > > failing to kexec on arm64 without any explanation (signed with same key,
> > > built for the appropriate arch).
> > 
> > Feature parity across architectures is not a "regression", but rather a
> > "this feature is not implemented for this architecture yet" type of
> > thing.
> 
> That depends on the view - before kexec verification you could boot any
> kernel, now you can boot some kernels signed with a valid key, but not
> others - the initial implementation is buggy, probably because it
> is based on an old version of the x86 code.

Buggy?
The feature of supporting platform ring had been slipped in just before
I submitted the latest patch series which was eventually merged.
(I should have noticed it though.)

Looking at changes in the commit 278311e417be ("kexec, KEYS: Make use of platform
keyring for signature verify"), it seems to be obvious that it is a new feature
because it introduced a new Kconfig option, CONFIG_INTEGRITY_PLATFORM_KEYRING,
which allows for enabling/disabling platform ring support.

-Takahiro Akashi

> > 
> > > > Again, what's wrong with 5.19 for anyone who wants this?  Who does want
> > > > this?
> > > 
> > > Not sure, really.
> > > 
> > > The final patch was repeatedly backported to stable and failed to build
> > > because the prerequisites were missing.
> > 
> > That's because it was tagged, but now that you show the full set of
> > requirements, it's pretty obvious to me that this is not relevant for
> > going this far back.
> 
> That also works.
> 
> Thanks
> 
> Michal

