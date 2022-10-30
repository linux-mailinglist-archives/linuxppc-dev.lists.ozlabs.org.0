Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE81612BB1
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Oct 2022 18:04:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N0jLP2Nn6z3cHh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 04:04:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nefkom.net (client-ip=212.18.0.9; helo=mail-out.m-online.net; envelope-from=whitebox@nefkom.net; receiver=<UNKNOWN>)
X-Greylist: delayed 5364 seconds by postgrey-1.36 at boromir; Mon, 31 Oct 2022 04:03:42 AEDT
Received: from mail-out.m-online.net (mail-out.m-online.net [212.18.0.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N0jKp1z8Pz2yR9
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 04:03:40 +1100 (AEDT)
Received: from frontend03.mail.m-online.net (unknown [192.168.6.182])
	by mail-out.m-online.net (Postfix) with ESMTP id 4N0jKg61XYz1r1fY;
	Sun, 30 Oct 2022 18:03:35 +0100 (CET)
Received: from localhost (dynscan3.mnet-online.de [192.168.6.84])
	by mail.m-online.net (Postfix) with ESMTP id 4N0jKg5fHPz1qqlR;
	Sun, 30 Oct 2022 18:03:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
	by localhost (dynscan3.mail.m-online.net [192.168.6.84]) (amavisd-new, port 10024)
	with ESMTP id ZN5KiYZUMw8E; Sun, 30 Oct 2022 18:03:35 +0100 (CET)
X-Auth-Info: JoKxX75W+C5HOESzkd84gZ5+tP4QpO6ib6kXPjlKygZHF6EVPq0pOVuGAKX90SND
Received: from igel.home (aftr-82-135-86-167.dynamic.mnet-online.de [82.135.86.167])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.mnet-online.de (Postfix) with ESMTPSA;
	Sun, 30 Oct 2022 18:03:35 +0100 (CET)
Received: by igel.home (Postfix, from userid 1000)
	id E492E2C358A; Sun, 30 Oct 2022 18:03:34 +0100 (CET)
From: Andreas Schwab <schwab@linux-m68k.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/32: fix syscall wrappers with 64-bit
 arguments of unaligned register-pairs
References: <20221012035335.866440-1-npiggin@gmail.com>
X-Yow: ..Are we having FUN yet...?
Date: Sun, 30 Oct 2022 18:03:34 +0100
In-Reply-To: <20221012035335.866440-1-npiggin@gmail.com> (Nicholas Piggin's
	message of "Wed, 12 Oct 2022 13:53:34 +1000")
Message-ID: <878rkxgs61.fsf@igel.home>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Okt 12 2022, Nicholas Piggin wrote:

> diff --git a/arch/powerpc/kernel/syscalls/syscall.tbl b/arch/powerpc/kernel/syscalls/syscall.tbl
> index 2bca64f96164..e9e0df4f9a61 100644
> --- a/arch/powerpc/kernel/syscalls/syscall.tbl
> +++ b/arch/powerpc/kernel/syscalls/syscall.tbl
> @@ -228,8 +228,10 @@
>  176	64	rt_sigtimedwait			sys_rt_sigtimedwait
>  177	nospu 	rt_sigqueueinfo			sys_rt_sigqueueinfo		compat_sys_rt_sigqueueinfo
>  178	nospu 	rt_sigsuspend			sys_rt_sigsuspend		compat_sys_rt_sigsuspend
> -179	common	pread64				sys_pread64			compat_sys_ppc_pread64
> -180	common	pwrite64			sys_pwrite64			compat_sys_ppc_pwrite64
> +179	32	pread64				sys_ppc_pread64			compat_sys_ppc_pread64
> +179	64	pread64				sys_pread64
> +180	32	pwrite64			sys_ppc_pwrite64		compat_sys_ppc_pwrite64
> +180	64	pwrite64			sys_pwrite64

Doesn't that lack entries for SPU?  Likewise for all other former common
syscalls in this patch.

-- 
Andreas Schwab, schwab@linux-m68k.org
GPG Key fingerprint = 7578 EB47 D4E5 4D69 2510  2552 DF73 E780 A9DA AEC1
"And now for something completely different."
