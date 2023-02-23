Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB8E96A057C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 10:57:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMpNC52WCz3cP6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 20:57:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lhXwyf5R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=lhXwyf5R;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMpLT6jy1z3ccs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 20:55:45 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0C6AC61645;
	Thu, 23 Feb 2023 09:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FBB2C433EF;
	Thu, 23 Feb 2023 09:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1677146142;
	bh=6jNYtTBdruuYIQ1Msq7XzYvT2vPLWW4RkHsct7FIAhg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lhXwyf5R/buYCiLzNae3C9JyeO6vcP+U/Vevm1E0LKVE0AKb01fv2cNv8vKpT02l0
	 kgkXp04vgF7H7pqsUMiHvnm2i87QwVvTSEZOzZx3djIeQew1z2LQKUZyDFmmd21AJ8
	 uU/cIgStWrPzZGNZCvhV0ZYolwkUaMcjTFaKhg6M=
Date: Thu, 23 Feb 2023 10:55:39 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Tom Saeger <tom.saeger@oracle.com>
Subject: Re: [PATCH 5.15 v2 0/5] Fix Build ID on arm64 if CONFIG_MODVERSIONS=y
Message-ID: <Y/c4G34O0B8zqobt@kroah.com>
References: <20230210-tsaeger-upstream-linux-stable-5-15-v2-0-6c68622745e9@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230210-tsaeger-upstream-linux-stable-5-15-v2-0-6c68622745e9@oracle.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, linux-riscv@lists.infradead.org, Christoph Hellwig <hch@lst.de>, Sasha Levin <sashal@kernel.org>, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Dennis Gilmore <dennis@ausil.us>, Naresh Kamboju <naresh.kamboju@linaro.org>, Ard Biesheuvel <ardb@kernel.org>, linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, Heiko Carstens <hca@linux.ibm.com>, Nathan Chancellor <nathan@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Masahiro Yamada <masahiroy@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 10, 2023 at 01:18:39PM -0700, Tom Saeger wrote:
> Build ID is missing for arm64 with CONFIG_MODVERSIONS=y using ld >= 2.36
> on 5.4, 5.10, and 5.15
> 
> Backport BuildID fixes.

I do not understand why you are applying patches from 6.2 that "fix"
something that is not in this kernel (or the older ones).  Please
document that really well on your next set of submissions.

I've taken the 6.1.y series only and dropped all the others.

thanks,

greg k-h
