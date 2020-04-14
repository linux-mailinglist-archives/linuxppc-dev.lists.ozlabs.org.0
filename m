Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 203D41A794F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 13:21:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491jj43BsFzDqVq
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 21:20:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.208.65; helo=mail-ed1-f65.google.com;
 envelope-from=k.kozlowski.k@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ed1-f65.google.com (mail-ed1-f65.google.com
 [209.85.208.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491jg41tWdzDqTP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 21:19:09 +1000 (AEST)
Received: by mail-ed1-f65.google.com with SMTP id s10so8415947edy.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 04:19:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=kLr1otCrFIODbPMjYkvy3aKgept10MpBYq6j6d3c97s=;
 b=MpH1hUKfv4ln8mx5F7Cm70UUf5bkTiArHARzlZ38XuJYRZuVCTc/FhLpK34w74MNT4
 hM9yXazkIrzte5Nr9+ZWoiQTENxQ/D8VH2N3Lgi/dJmw0GoJvYvU0TaMpVa2W2/kYS1Q
 o0lR8jdcjpewyt+2kfOb1hU8vU002BpWKl3IqgXj7AoME+6fBcfA295JFyEr2ryuM3PC
 ml6vJFwYhi1VKihZ5qGOrTT/0mi20izgJYJl2Itc0dGTvp90UrRTdazyOfyk1YYMum0W
 dsUJuxapvkKVzkysBpbW8EsI8lR8PSOZ3o+5RsvCBso0pjL25RtP5jYEQI5y3jEvqJti
 z0YQ==
X-Gm-Message-State: AGi0PuZr5WVee1SVcB7Uv9sINQASQHxq4RCDc0c5CYVu4QPckzn2W5s3
 yyE6mTUaVK6UJf4HX/drv6A=
X-Google-Smtp-Source: APiQypI+e8NhZbH4s6s1t6e787WWdZVnlyyo3DThuzngTxyATZQvoEtvVJUA6KnpSKeyc8xiorGa1Q==
X-Received: by 2002:a17:906:7e19:: with SMTP id
 e25mr20500556ejr.358.1586863146621; 
 Tue, 14 Apr 2020 04:19:06 -0700 (PDT)
Received: from kozik-lap ([194.230.155.125])
 by smtp.googlemail.com with ESMTPSA id j5sm1662117edh.4.2020.04.14.04.19.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Apr 2020 04:19:05 -0700 (PDT)
Date: Tue, 14 Apr 2020 13:19:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: Build regressions/improvements in v5.7-rc1
Message-ID: <20200414111903.GA1895@kozik-lap>
References: <20200413093100.24470-1-geert@linux-m68k.org>
 <alpine.DEB.2.21.2004131232220.32713@ramsan.of.borg>
 <877dyijrh7.fsf@mpe.ellerman.id.au>
 <20200414110627.GA1373@kozik-lap>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200414110627.GA1373@kozik-lap>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux-foundation.org,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 01:06:27PM +0200, Krzysztof Kozlowski wrote:
> On Tue, Apr 14, 2020 at 08:23:32PM +1000, Michael Ellerman wrote:
 > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable-4k.h: error: expected ')' before '!=' token:  => 58:40
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable-4k.h: error: expected ')' before '==' token:  => 57:37
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable-4k.h: error: expected identifier or '(' before '!' token:  => 56:25
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected ')' before '!=' token:  => 163:40
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected ')' before '==' token:  => 333:50
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected ')' before '^' token:  => 333:36
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected identifier or '(' before '!' token:  => 146:27, 144:24, 160:25, 161:24, 143:25
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/64/pgtable.h: error: expected identifier or '(' before 'struct':  => 77:21
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/pgtable.h: error: redefinition of 'pgd_huge':  => 291:19
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/pte-book3e.h: error: redefinition of 'pte_mkprivileged':  => 108:26
> > >>  + /kisskb/src/arch/powerpc/include/asm/nohash/pte-book3e.h: error: redefinition of 'pte_mkuser':  => 115:20
> > >>  + /kisskb/src/arch/powerpc/kvm/book3s_64_vio_hv.c: error: 'struct kvm_arch' has no member named 'spapr_tce_tables':  => 68:46, 68:2
> > >
> > > ppc64_book3e_allmodconfig
> > 
> > Caused by:
> > 
> > e93a1695d7fb ("iommu: Enable compile testing for some of drivers")
> > 
> > Which did:
> > 
> >  config SPAPR_TCE_IOMMU
> >  	bool "sPAPR TCE IOMMU Support"
> > -	depends on PPC_POWERNV || PPC_PSERIES
> > +	depends on PPC_POWERNV || PPC_PSERIES || (PPC && COMPILE_TEST)
> > 
> > 
> > Which is just ... not right, the dependencies on the correct platform
> > are important, otherwise the build breaks.
> 
> The SPAPR_TCE_IOMMU should compile fine.  The actual trouble here is
> that KVM_BOOK3S_64 selects SPAPR_TCE_IOMMU which is a user-visible
> symbol.  This is generally discouraged because of exactly this error -
> select ignores any dependencies.
> 
> I can revert the COMPILE_TEST for SPAPR_TCE_IOMMU or change
> select->depends in KVM_BOOK3S_64.  I think the latter is the proper
> change here.

Eh, not really, it looks more complex because there are more
dependencies (the book3s_64_vio_hv is pulled by KVM Makefile if
SPAPR_TCE_IOMMU is set).

I guess the revert of this part makes most sense.

Best regards,
Krzysztof

