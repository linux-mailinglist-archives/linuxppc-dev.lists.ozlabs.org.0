Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC067787C5F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 02:05:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NZRmeKsA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RX0ZX3dXcz3cBC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Aug 2023 10:05:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2607:7c80:54:3::133; helo=bombadil.infradead.org; envelope-from=rdunlap@infradead.org; receiver=lists.ozlabs.org)
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:3::133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RX0YV1M0Wz2yw0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Aug 2023 10:04:11 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=vmLNsvDlbkyIYpEkO8eNcxoQJchqhoHOSemi0JGSdvc=; b=NZRmeKsAfkmgAA6LpunC8rC5Dc
	6TMSKwMSi9DIBtwAzrZChPIPgpzg2Qu1o7mmwg+gO61ze0Wdv/Yb/RdjCPLaMcWBOS5iX2MvgYBpy
	AZe8Y7MRVMO2tuVm64QfKEmy2CgUQ1KNk/oxulmE7B9tP+D/TEuDM09pN8zO7x04G0HWkhM50K14O
	oE++tlkqDVIVJwwqmxqut6MrPcMvArkX49RuaV/dMvFulx+2JQEYazuuTQN0YrMRu7j8aby1dAdj7
	XbAkwelcoGM6/fSREBI/linqqEd4CVW/VQEAa6il6B3j+vSldg3Aq16jPWpAYkNn4ICmSZmwTIWRd
	koqOHYpw==;
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qZKJ2-0040rp-0h;
	Fri, 25 Aug 2023 00:04:04 +0000
Message-ID: <21193a52-0425-f5ae-90f0-10e4c578ae90@infradead.org>
Date: Thu, 24 Aug 2023 17:04:02 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] kbuild: Show Kconfig fragments in "help"
Content-Language: en-US
To: Kees Cook <keescook@chromium.org>, Masahiro Yamada <masahiroy@kernel.org>
References: <20230824223606.never.762-kees@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230824223606.never.762-kees@kernel.org>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-s390@vger.kernel.org, linux-kbuild@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Kees,

On 8/24/23 15:36, Kees Cook wrote:
> Doing a "make help" would show only hard-coded Kconfig targets and
> depended on the archhelp target to include ".config" targets. There was
> nothing showing global kernel/configs/ targets. Solve this by walking
> the wildcard list and include them in the output, using the first comment
> line as the help text.
> 
> Update all Kconfig fragments to include help text and adjust archhelp
> targets to avoid redundancy.
> 
> Adds the following section to "help" target output:
> 
> Configuration fragment targets (for enabling various Kconfig items):
>   debug.config         - Debugging for CI systems and finding regressions
>   kvm_guest.config     - Bootable as a KVM guest
>   nopm.config          - Disable Power Management
>   rust.config          - Enable Rust
>   tiny-base.config     - Minimal options for tiny systems
>   tiny.config          - Smallest possible kernel image
>   x86_debug.config     - Debugging options for tip tree testing
>   xen.config           - Bootable as a Xen guest
>   tiny.config          - x86-specific options for a small kernel image
>   xen.config           - x86-specific options for a Xen virtualization guest

ISTM that you are missing the "why" part of this change in the commit
description.

"make tinyconfig" is the real target here.  The other (tiny.) files are just
implementation details.
We can't put all implementation details into help messages and it's not
difficult to find that the (tiny.) config files are merged to make the
final .config file.

So what is it that you are trying to solve?

-- 
~Randy
