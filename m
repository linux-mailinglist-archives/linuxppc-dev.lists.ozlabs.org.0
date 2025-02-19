Return-Path: <linuxppc-dev+bounces-6358-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 757AEA3CA73
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2025 21:55:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YypZ26hgZz30TQ;
	Thu, 20 Feb 2025 07:55:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=140.211.166.183
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739974504;
	cv=none; b=QJ0TcrYvvn/nr3efZr+ii8DMXGGVd5jH29Bk0zS34tijHVQOnRkYUt4VZZwZ7MwBl/Szj7LZbeTRoS5JdEb/5YLZpTtcTSQlF4mvqtbGncbAkquELdw7ElcLihVnNRUP9XjCYwYp+q/0j7Of6tjMCn2Vtjz2P4Vg2Yof0x7ToC7Gf0MWQu24Q/yEXyMgn2iAhhzp+zx/Pf18SHMbAGDhzxsvRdIBDYw2PFaWlLodZb723Aa1ipd6qjC68HEbpPyXHZTnTYn+zaPd13sIaMnPTPGVGu06M+l1jfeVVywSBI7yEi6OLxb463Xc1O+vcbm9ieCmPSHEEPeALezBW0Z0WQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739974504; c=relaxed/relaxed;
	bh=CIMKBpM/otj/+4OgQScDBpEp7jJhRHbiXbYzvPVbUbQ=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:MIME-Version:
	 Content-Type; b=ep6thB8AhkOK/BCMaVVBgWde6MzTLXj4v74xvZ1syu+L0wa7Ew1HL0PE+97txtnmnnoHAgfmpRaByRsxIApRkwRz/NK/eTiEaDFTNklahRcAUEEGgPX7gDDxvwadZfhJFCxrshjt4OqV25jJ2wVhat7BXsgiKovnC1pYdWMsSCZT22bxMhE6sTI1QnkGHWyEs6aJc0val8/O8pLmuMAykT644ogxampH1kww2gm/OBVS721zARByU+TD/UC3os4XKDhBXuYJp6cBnhdkEgtvr8NibiHBwiLPRgfBLUHY9GLF78h609tDnVAvBwwLOO1/FClpKTCAumNcaVdFj/Wleg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass (client-ip=140.211.166.183; helo=smtp.gentoo.org; envelope-from=sam@gentoo.org; receiver=lists.ozlabs.org) smtp.mailfrom=gentoo.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gentoo.org (client-ip=140.211.166.183; helo=smtp.gentoo.org; envelope-from=sam@gentoo.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 487 seconds by postgrey-1.37 at boromir; Thu, 20 Feb 2025 01:15:02 AEDT
Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yydh66h5Wz2ywS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2025 01:15:02 +1100 (AEDT)
Received: from mop.sam.mop (unknown [82.8.138.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sam)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BD261343050;
	Wed, 19 Feb 2025 14:06:42 +0000 (UTC)
From: Sam James <sam@gentoo.org>
To: linmag7@gmail.com
Cc: arnd@arndb.de,chris@zankel.net,dinguyen@kernel.org,glaubitz@physik.fu-berlin.de,ink@unseen.parts,jcmvbkbc@gmail.com,kees@kernel.org,linux-alpha@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-csky@vger.kernel.org,linux-hexagon@vger.kernel.org,linux-kernel@vger.kernel.org,linux-m68k@lists.linux-m68k.org,linux-mips@vger.kernel.org,linux-openrisc@vger.kernel.org,linux-parisc@vger.kernel.org,linux-riscv@lists.infradead.org,linux-s390@vger.kernel.org,linux-sh@vger.kernel.org,linux-snps-arc@lists.infradead.org,linux-um@lists.infradead.org,linuxppc-dev@lists.ozlabs.org,loongarch@lists.linux.dev,mattst88@gmail.com,monstr@monstr.eu,richard.henderson@linaro.org,sparclinux@vger.kernel.org,x86@kernel.org
Subject: Re: [PATCH v2 1/1] mm: pgtable: fix pte_swp_exclusive
In-Reply-To: <20250218175735.19882-2-linmag7@gmail.com>
Organization: Gentoo
User-Agent: mu4e 1.12.7; emacs 31.0.50
Date: Wed, 19 Feb 2025 14:06:40 +0000
Message-ID: <87cyfejafj.fsf@gentoo.org>
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
MIME-Version: 1.0
Content-Type: text/plain
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Lovely cleanup and a great suggestion from Al.

Reviewed-by: Sam James <sam@gentoo.org>

I'd suggest adding a:
Suggested-by: Al Viro <viro@zeniv.linux.org.uk>

thanks,
sam

