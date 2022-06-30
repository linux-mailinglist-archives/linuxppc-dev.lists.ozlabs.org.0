Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B56561B2C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 15:21:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LYf9M3T5fz3ch9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jun 2022 23:21:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sPO7S7+b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=sPO7S7+b;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LYf8m6TvMz3bgC
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Jun 2022 23:20:39 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E785461F08;
	Thu, 30 Jun 2022 13:20:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04A5BC34115;
	Thu, 30 Jun 2022 13:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1656595235;
	bh=Gjs1D9vdtTbVIpCgMrFXplqipTLraLCHH4B9AHCpl/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sPO7S7+b+VQXn8XPN0Aw/4Cm1s3T9irr43M+Rxhf7IsLt0Z7FH7ZkueR5Fs8fNffu
	 5O1hEithJbc9BVXJ3XXFkLmP8iLjrMUzyFsVGbxhF+PkRy9C8fKnNqR0MAB8+fsaOH
	 mBKZa/1WC/aN80kxm4eGk7DCzStxPLqGLvLerwlA=
Date: Thu, 30 Jun 2022 15:20:32 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
Subject: Re: [PATCH v4.9] kexec_file: drop weak attribute from
 arch_kexec_apply_relocations[_add]
Message-ID: <Yr2jIISAEVwi+YYH@kroah.com>
References: <20220628154249.204911-3-naveen.n.rao@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220628154249.204911-3-naveen.n.rao@linux.vnet.ibm.com>
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
Cc: kexec@lists.infradead.org, linux-kernel@vger.kernel.org, stable@vger.kernel.org, "Eric W. Biederman" <ebiederm@xmission.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 28, 2022 at 09:12:48PM +0530, Naveen N. Rao wrote:
> commit 3e35142ef99fe6b4fe5d834ad43ee13cca10a2dc upstream.
> 
> Since commit d1bcae833b32f1 ("ELF: Don't generate unused section
> symbols") [1], binutils (v2.36+) started dropping section symbols that
> it thought were unused.  This isn't an issue in general, but with
> kexec_file.c, gcc is placing kexec_arch_apply_relocations[_add] into a
> separate .text.unlikely section and the section symbol ".text.unlikely"
> is being dropped. Due to this, recordmcount is unable to find a non-weak
> symbol in .text.unlikely to generate a relocation record against.
> 
> Address this by dropping the weak attribute from these functions.
> Instead, follow the existing pattern of having architectures #define the
> name of the function they want to override in their headers.
> 
> [1] https://sourceware.org/git/?p=binutils-gdb.git;a=commit;h=d1bcae833b32f1
> 
> [akpm@linux-foundation.org: arch/s390/include/asm/kexec.h needs linux/module.h]
> Link: https://lkml.kernel.org/r/20220519091237.676736-1-naveen.n.rao@linux.vnet.ibm.com
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
> Cc: "Eric W. Biederman" <ebiederm@xmission.com>
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---
>  arch/x86/include/asm/kexec.h |  7 +++++++
>  include/linux/kexec.h        | 26 ++++++++++++++++++++++----
>  kernel/kexec_file.c          | 18 ------------------
>  3 files changed, 29 insertions(+), 22 deletions(-)
> 

All now queued up, thanks.

greg k-h
