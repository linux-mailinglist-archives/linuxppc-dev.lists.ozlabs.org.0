Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132D0948BC3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 10:56:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TvyE56tY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WdRx16y6wz2yVP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2024 18:56:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=TvyE56tY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=maz@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WdRwL54gFz2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Aug 2024 18:55:30 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7AB70CE0DA2;
	Tue,  6 Aug 2024 08:55:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADD4C32786;
	Tue,  6 Aug 2024 08:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722934525;
	bh=fNf9KpbqDQ65Rk4oRZ3GXyFRT5bkqehalm3Q1gthkSc=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=TvyE56tYK3MKji+0edYs5FwYHls/3UPSKwVbaoXysQtem6W2x+AET4eygFoJ270tI
	 6is1jeOuW5z+PbS7fnA27BMCC3phJInVGslO8AhaKB9ivP5S2ZBEhteFvegf0sNC07
	 YuYNAYg3Ep0MduJiROIWjoOmIH55ccwgUfSuNAPNx6hoXS8jgGo2ML5Y+EbSKa//H6
	 qXIOM/QqJNB7uUWkG7Of8+R8HbDap7Dq1ryl/W6Vm+HeJRqfR1e4JB09R8xYefspTt
	 olHjIDWbI3frln7WrTDqsLUJrFNhb1Dd1/4PSD3AIjdlmZxoljfb5rTBMMtrJ7t0uu
	 cPa7Eq2CqB8qw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1sbFyV-001J7s-7B;
	Tue, 06 Aug 2024 09:55:23 +0100
Date: Tue, 06 Aug 2024 09:55:22 +0100
Message-ID: <86ikwe2fph.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Oliver Upton <oliver.upton@linux.dev>
Subject: Re: [PATCH v12 54/84] KVM: arm64: Mark "struct page" pfns accessed/dirty before dropping mmu_lock
In-Reply-To: <ZrFfvjy_-Tyx4xUV@linux.dev>
References: <20240726235234.228822-1-seanjc@google.com>
	<20240726235234.228822-55-seanjc@google.com>
	<ZrFfgzRbiqT-Zi2O@linux.dev>
	<ZrFfvjy_-Tyx4xUV@linux.dev>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/29.3
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: oliver.upton@linux.dev, seanjc@google.com, pbonzini@redhat.com, zhaotianrui@loongson.cn, maobibo@loongson.cn, chenhuacai@kernel.org, mpe@ellerman.id.au, anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, borntraeger@linux.ibm.com, frankja@linux.ibm.com, imbrenda@linux.ibm.com, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, loongarch@lists.linux.dev, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, dmatlack@google.com, stevensd@chromium.org, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, David Matlack <dmatlack@google.com>, linux-riscv@lists.infradead.org, Claudio Imbrenda <imbrenda@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, Fuad Tabba <tabba@google.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Sean Christopherson <seanjc@google.com>, linux-mips@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, David Stevens <stevensd@chromium.org>, kvm-riscv@lists.infradead.org, Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 06 Aug 2024 00:26:54 +0100,
Oliver Upton <oliver.upton@linux.dev> wrote:
> 
> On Mon, Aug 05, 2024 at 11:26:03PM +0000, Oliver Upton wrote:
> > [+cc Fuad]
> 
> Take 2!
> 
> > Fuad, you mentioned in commit 9c30fc615daa ("KVM: arm64: Move setting
> > the page as dirty out of the critical section") that restructuring
> > around the MMU lock was helpful for reuse (presumably for pKVM), but I
> > lack the context there.
> > 
> > On Fri, Jul 26, 2024 at 04:52:03PM -0700, Sean Christopherson wrote:
> > > Mark pages/folios accessed+dirty prior to dropping mmu_lock, as marking a
> > > page/folio dirty after it has been written back can make some filesystems
> > > unhappy (backing KVM guests will such filesystem files is uncommon, and
> > 
> > typo: s/will/with/
> > 
> > > the race is minuscule, hence the lack of complaints).  See the link below
> > > for details.

Should we consider reverting 9c30fc615daa then?

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.
