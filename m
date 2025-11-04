Return-Path: <linuxppc-dev+bounces-13726-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EC5C3076F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 11:20:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d14G21skBz3btL;
	Tue,  4 Nov 2025 21:20:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762251610;
	cv=none; b=RM7CYd8SPPp+ssp3L859khA7qIv0qcb5AHcxY2PwoEUa0IXEA3UnchE2LqfVpftNrqfhmwQqKL0+ILNtPnBK5AZEga+5WEWY7DMxqCbcv1TOrDcD4XeWPEDr/Dt2LGPUvZ0VbozXbEKln3zwWSI528Tv6DsrYYOmr99f6w7H04L7ctZPC7/UbqIMUpcpwz1WjGSwy8Dsacp/c0oaPXQR8mZA18lsrrDdJps2ic4JnG/agzdbQhsQR3kA9DYgQZk1qTCNGUUsYS3Y58xV6f/SFBYJ693vL1dk58A5jHkAgM0B0gxULySgxeygCEypvo4U+tJGrgle1laer3deR5jsYA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762251610; c=relaxed/relaxed;
	bh=GrSEJYaGP9RVivJlgONHXlqu7FdWNUTH62IpXXnp9FE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mNKzk5mWupVm5hc+vyVsvfmVgZkSBPpZaADATE5HawG09fzm58gh8xiVXaDgEC86sLzjeDlTMiDzjtOLPBZULKWerp5CdvIqqatFeZJ7jr9RhBcWiw0cLPsQuIuqRk12uC2fYKUaa0l+o+crsZwPvjrgVmEC4SN/j8mNABh4Z3fZL0b2y+t/5WGSTiXsMYmkLHsaXgiLIDWmb5nwW7EKXVkJ6IDn9LaIdhS75CwOOgQBpMLL7DtYfnTU8s8SoxS8w+7lVhN3g0o1TdhIaX1FiB/+qOJwifmy+uWutDk2EKR9n5ACgoS3tFisiOeF1NzLWxqAfswHPwF6FmDiZOh2nA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d14G154yRz3btC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 21:20:09 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0zBs3R9Fz9sSf;
	Tue,  4 Nov 2025 07:32:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sv0jWyS-5i0P; Tue,  4 Nov 2025 07:32:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0zBs2ZWMz9sSd;
	Tue,  4 Nov 2025 07:32:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3B0AF8B76C;
	Tue,  4 Nov 2025 07:32:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id ZVg7BC0yuWfv; Tue,  4 Nov 2025 07:32:05 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 62AEA8B763;
	Tue,  4 Nov 2025 07:32:03 +0100 (CET)
Message-ID: <db0e0201-0bb5-4096-ad87-f2cd109d07dc@csgroup.eu>
Date: Tue, 4 Nov 2025 07:32:02 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [patch V5 12/12] select: Convert to scoped user access
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org, kernel test robot <lkp@intel.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>, x86@kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, linux-s390@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 David Laight <david.laight.linux@gmail.com>,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
 Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>,
 Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?=
 <andrealmeid@igalia.com>
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.862419776@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027083745.862419776@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 27/10/2025 à 09:44, Thomas Gleixner a écrit :
> From: Thomas Gleixner <tglx@linutronix.de>
> 
> Replace the open coded implementation with the scoped user access guard.
> 
> No functional change intended.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
> Cc: Alexander Viro <viro@zeniv.linux.org.uk>
> Cc: Christian Brauner <brauner@kernel.org>
> Cc: Jan Kara <jack@suse.cz>
> Cc: linux-fsdevel@vger.kernel.org

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> V4: Use read guard - Peterz
>      Rename once more
> V3: Adopt to scope changes
> ---
>   fs/select.c |   12 ++++--------
>   1 file changed, 4 insertions(+), 8 deletions(-)
> ---
> --- a/fs/select.c
> +++ b/fs/select.c
> @@ -776,17 +776,13 @@ static inline int get_sigset_argpack(str
>   {
>   	// the path is hot enough for overhead of copy_from_user() to matter
>   	if (from) {
> -		if (can_do_masked_user_access())
> -			from = masked_user_access_begin(from);
> -		else if (!user_read_access_begin(from, sizeof(*from)))
> -			return -EFAULT;
> -		unsafe_get_user(to->p, &from->p, Efault);
> -		unsafe_get_user(to->size, &from->size, Efault);
> -		user_read_access_end();
> +		scoped_user_read_access(from, Efault) {
> +			unsafe_get_user(to->p, &from->p, Efault);
> +			unsafe_get_user(to->size, &from->size, Efault);
> +		}
>   	}
>   	return 0;
>   Efault:
> -	user_read_access_end();
>   	return -EFAULT;
>   }
>   
> 


