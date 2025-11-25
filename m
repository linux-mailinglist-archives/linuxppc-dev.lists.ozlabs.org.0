Return-Path: <linuxppc-dev+bounces-14480-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E7EC8437E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 10:27:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFy5d24g7z2xqf;
	Tue, 25 Nov 2025 20:27:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41b8:202:deb::311:108"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764062853;
	cv=none; b=YclMKxeLD1IChz1O3RvCqBom4WnqjgMw0JETZv/QD2YNR8q+NSpvd/CCBoW5BRVJOMNqbzJbnZxWDxMv9JFU7ak+Z1wUksEsm6pTHMK5jQH2NN6u0BsFvPRK0dZ4NTEdwZPGok7iUxx7IliDOsIElrWFhFu2L2RLjGgEMlYLaIVs3LOKi3Z8uInLAw9cx8RHBpvAkoaJ2FLWuu1zMSIdLMzvCBQXexR0oH5IyF9bpvI53as+yYct48kV0po5lK6YytB+Ckpy59AbfbRfM0+eHfvSbdY6xbNhBSwlAHwowaPx6JEJssUVgMK/w2JtowqjsdC2BX0TlyHe0MpA26m6Og==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764062853; c=relaxed/relaxed;
	bh=k/+2LtzZDQDT/XIIJmpYRUvrcP2KDj85kUn+MGkQNJM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXPr/j8Gr7o9KvhKNma2pKc+/O0E60to6YqSs6HLDEde6Av7N+8kRlWwPXVkOItwYTzjMXujyDUBX8uk3/tF9GTYw+TIsDjj9oMC9dVc9cleeOuDkbv3+1XccnuZgsZ9bLtGGESY4H68Yfg/t90v77cIt1iXeDvlUXC3BwCqO7BKdzQRtTSYeEUyihQl/+UakoYiMxOAUZ8zuah0E4flOTGIZj80ZvpLFvmUO40Ro/LgjQ1jjcJTyE4WkWMltNOThQHPPRU1LLGt2Hu3Fwxp9W1T1uPZYRRtRp8rdsy8m8m/AZXxO2wvB2t6tejnp4MGrja4KlVcXDzdKkLPvWu2qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; dkim=pass (2048-bit key; secure) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Ujh5Xxgt; dkim-atps=neutral; spf=none (client-ip=2001:41b8:202:deb::311:108; helo=stravinsky.debian.org; envelope-from=leitao@debian.org; receiver=lists.ozlabs.org) smtp.mailfrom=debian.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=Ujh5Xxgt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=debian.org (client-ip=2001:41b8:202:deb::311:108; helo=stravinsky.debian.org; envelope-from=leitao@debian.org; receiver=lists.ozlabs.org)
Received: from stravinsky.debian.org (stravinsky.debian.org [IPv6:2001:41b8:202:deb::311:108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFy5c188tz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 20:27:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k/+2LtzZDQDT/XIIJmpYRUvrcP2KDj85kUn+MGkQNJM=; b=Ujh5XxgtWd8jr9zZcd2oA5syOx
	Cwt9IJjcT2z4O5nC1oTDkZz2phCS+d5yfzIkGRu+3qoqEO2RlWYiUacquZZfBmTVSUBoRbs2suKMb
	tgNMMpisQA++79/GIAH54dlpgo6eDFiYCm+51O/uVjZGIk4WsbQUyxEdYxcDg802H6xhoFfnanQHH
	9ssOiu60VP0hjxpyMc5BSbNgLUL69A3AfZGGp6YTPhBEe6KGim/4BfYTG36omzLqBzqEPxcbwEr1u
	RUnLeqwU2gSJrzxpg6hLMJbWkXHRZJ1RayRA4ZqkwA+pmawb3gg1rEUtggbyAIsM1erOI2idwpGJb
	W3EEC88g==;
Received: from authenticated user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.94.2)
	(envelope-from <leitao@debian.org>)
	id 1vNpKA-003ICO-9j; Tue, 25 Nov 2025 09:27:02 +0000
Date: Tue, 25 Nov 2025 01:26:55 -0800
From: Breno Leitao <leitao@debian.org>
To: Borislav Petkov <bp@alien8.de>, akpm@linux-foundation.org
Cc: tony.luck@intel.com, akpm@linux-foundation.org, 
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev, 
	osandov@osandov.com, xueshuai@linux.alibaba.com, konrad.wilk@oracle.com, 
	linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	kernel-team@meta.com, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, 
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>
Subject: Re: [PATCH RESEND v5] vmcoreinfo: Track and log recoverable hardware
 errors
Message-ID: <zbqtqndpicedldf37c7t74cikasqruzkv2rqt2eh6ufjbj4exb@3p7ajieb6ovr>
References: <20251010-vmcore_hw_error-v5-1-636ede3efe44@debian.org>
 <vpilvvscosdl4o4cvbmtsrrp4btfwr5iidywmuiawfrgtlcwrr@ubtdbxfqyqpu>
 <20251118141002.GEaRx-Oge8ZxtR4Vzi@fat_crate.local>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251118141002.GEaRx-Oge8ZxtR4Vzi@fat_crate.local>
X-Debian-User: leitao
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_NONE,UNPARSEABLE_RELAY autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Andrew,

On Tue, Nov 18, 2025 at 03:10:02PM +0100, Borislav Petkov wrote:
> On Tue, Nov 18, 2025 at 05:01:47AM -0800, Breno Leitao wrote:
> > Do you know what is the right tree for this patch?
> > 
> > I am wondering if it should go through Kdump, x86 or RAS/MCE tree?
> 
> I can take it if akpm wants me to...

Would you prefer to have this patch on your tree, or on Borislav's?

Thanks
--breno

