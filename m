Return-Path: <linuxppc-dev+bounces-1921-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E129A997DE9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 08:57:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPLCx62Dfz3blR;
	Thu, 10 Oct 2024 17:57:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::133"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728543437;
	cv=none; b=aMplCL+FHh0ZntC49xe5RTGoO8mW6JfJgsY9I9ZruThh8W646VcMRAs5KXIZP+ES3TI4hMhKmCMNF5GD5CI4MCiQjSd1/HkKZRHzy9s08wtrDZP6bm6DaD6Kl2UkuqCskxwwzxMxp0H9TTdl1id/7H2gymA7W1l0dDAoxdCU0h0cSdZg4SAd+M6Mb1gGjq5FpCMn0Htjx/5+HsAa5cw7iWJSt4191g5c1z+IDqZlsHDUvV+36w7OVYYAQogMl0fw+ZD3iPa72UKIZH+mMIMWojWLZZSa0hbvw8zY9c9jTWxV09RfvmvhWZcjfzptAB/iL+4jNBQvW+1899vLjUIneg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728543437; c=relaxed/relaxed;
	bh=053yPSqgX+xVLoacqjtpWuCBNx3Ew/0eqSAR54be0Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqSfkhwmVnEn+U2eAMWH4LmmZf1EkmKKuQrmaVl6+z0Ddne++iDwPMKOWrUxz6QKUdT18Gq+5rEMdk7zUqd8+fXKjM6k165dLnczV6iWG8Zf/6ynjflJ/9MuRC1m9k8hjlNeOIdntjkGfDM64ViXWHcA/iMipMOuiMAFzYA7WbcScCtihOmaiZx1LtoTbqyZlMgj6YTnHUJnY/auSGuPqjN47btgz4VQZLiIngu3OwDAUqHOa7Bx5giXrdq7neISkLyyshpT1GrMndMRXCFKCr/tJbYQqgonnDPpwxp9PDZkpOba7QvwNZvSLZXNgcClpDnn9XQ+yxPEPnFSfStS/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QWjL/ef7; dkim-atps=neutral; spf=none (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+13eeef5fd6cafc46e7de+7718+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=bombadil.srs.infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=QWjL/ef7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=bombadil.srs.infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=batv+13eeef5fd6cafc46e7de+7718+infradead.org+hch@bombadil.srs.infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPLCx0ZCNz3bhC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 17:57:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
	:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=053yPSqgX+xVLoacqjtpWuCBNx3Ew/0eqSAR54be0Yo=; b=QWjL/ef7t4NfdHQ7+ikpJ84WE6
	Tv3JStjrA26fGK50QoFCrOZKD8MPCk2cUy19aXnEhRSMGgdtvuO05QCRtCngoHhMQ33YSkxggcwcl
	/8eTdvS/gyJ8yjj4OHnjgnxJVDyZl/cUu24C1a7S1zejQqboASikt51Fh9Ntt0Smk3Slk9O/RzO4P
	HtOuCDb4Jbeh3HIGDy01x3nuah1xCKNQHjX2IUCo/yxp53VfhvoZC4lQtEWvsXnxm0vcujiphLfuA
	brUDkf5ycgRwkSBfRJX0/yVyYdmNgNWOH3sLEAXvaVdG+AQFXKlL23ma1MPX2I8m8b13OCjrlebZS
	vz4QzXyA==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98 #2 (Red Hat Linux))
	id 1syn6b-0000000Bl2f-08gV;
	Thu, 10 Oct 2024 06:57:01 +0000
Date: Wed, 9 Oct 2024 23:57:00 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Andreas Larsson <andreas@gaisler.com>,
	Andy Lutomirski <luto@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Borislav Petkov <bp@alien8.de>,
	Brian Cain <bcain@quicinc.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christoph Hellwig <hch@infradead.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Guo Ren <guoren@kernel.org>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Matt Turner <mattst88@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Michal Simek <monstr@monstr.eu>, Oleg Nesterov <oleg@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Richard Weinberger <richard@nod.at>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Stafford Horne <shorne@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vineet Gupta <vgupta@kernel.org>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org, linux-hexagon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v5 6/8] x86/module: perpare module loading for ROX
 allocations of text
Message-ID: <Zwd6vH0rz0PVedLI@infradead.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-7-rppt@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009180816.83591-7-rppt@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Status: No, score=-2.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

> +extern void apply_alternatives(struct alt_instr *start, struct alt_instr *end,
> +			       struct module *mod);
> +extern void apply_retpolines(s32 *start, s32 *end, struct module *mod);
> +extern void apply_returns(s32 *start, s32 *end, struct module *mod);
> +extern void apply_seal_endbr(s32 *start, s32 *end, struct module *mod);
>  extern void apply_fineibt(s32 *start_retpoline, s32 *end_retpoine,
> -			  s32 *start_cfi, s32 *end_cfi);
> -
> -struct module;
> +			  s32 *start_cfi, s32 *end_cfi, struct module *mod);

Please drop all the pointless externs while you're at it.

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>

