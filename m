Return-Path: <linuxppc-dev+bounces-13715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E3241C2F94D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 04 Nov 2025 08:21:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d10J14Cfrz3bf3;
	Tue,  4 Nov 2025 18:21:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762240897;
	cv=none; b=FW4z7VZmrfHgMXItI+1sft9Nfgmp1+ciTqKd63daQApiRE68UdAJFRAaNkdO200ljXy0R3pkc8KqN7wPyEwUZl1PLKNESWYK/J7aTSIoh1ih+eEMRzClBY2G3+xe2+MLIs4ooMXqp9I0Wgusr9GQqI7Lk3fW8itsP28wCgG2qXF2w259ZSbTtVaX1OUzdT8PuK4c1UAAMLKqAja4D+K85TPOFt9a7zhwdDjMHeOVeZiyzW/O4C8GeyHnKCjI7ZQoX8eg3PHYtQpHKb1NBSVmsId7tzXKqi2rJ0dPAJBiTTqRAq52HNg++2oSgoZi+CQYOqkc/KZQcb6tNCaud5GAxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762240897; c=relaxed/relaxed;
	bh=JmPc4Gs4TkGWZ+ozrMfPezgUqCk9uHTE/K4Xkvo4w1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EBtY6AtuuW0MAdAM8U1x0nGyJUIcQXBuuSrCfHeifW4Cep/O+im8cvSKH9+tbqK8aTmtlGJ2okHZJtLjuCykm2Mit2WOfZcFQHT9JuRpyoL3WzGOCuCyDyGOqEdJ8uJp0AaFV7v1xA35B1akV4L8RpPxLr5eKz0KSyME52yHLM7EP/S41oL1XBk3PmsUUAGjuHChtqwzyGAAlmvDygra4ogfHQ03ZPaYRRSXPR177FgH0zY7HgPVgXa3UTv1gBn85PLQcx5NCD/xwaryzQADWGSn1MFPDz45bdXoFNT27BrYuMU9R/Xe1AC/KR32aRO1f7mgIz/XmcQhmjijxkl0Dw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d10J05lZ6z2xQD
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 Nov 2025 18:21:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d0z970xwrz9sSY;
	Tue,  4 Nov 2025 07:30:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8o3eFqSyCr4H; Tue,  4 Nov 2025 07:30:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d0z966mmTz9sSV;
	Tue,  4 Nov 2025 07:30:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CA6B28B76C;
	Tue,  4 Nov 2025 07:30:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id GLvucgCkTsyh; Tue,  4 Nov 2025 07:30:34 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C05318B763;
	Tue,  4 Nov 2025 07:30:32 +0100 (CET)
Message-ID: <fc087f38-2e14-41d1-8044-c054eb41ad19@csgroup.eu>
Date: Tue, 4 Nov 2025 07:30:32 +0100
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
Subject: Re: [patch V5 08/12] uaccess: Provide put/get_user_inline()
To: Thomas Gleixner <tglx@linutronix.de>, LKML <linux-kernel@vger.kernel.org>
Cc: kernel test robot <lkp@intel.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
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
 <andrealmeid@igalia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 linux-fsdevel@vger.kernel.org
References: <20251027083700.573016505@linutronix.de>
 <20251027083745.609031602@linutronix.de>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251027083745.609031602@linutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 27/10/2025 à 09:43, Thomas Gleixner a écrit :
> Provide conveniance wrappers around scoped user access similiar to
> put/get_user(), which reduce the usage sites to:
> 
>         if (!get_user_inline(val, ptr))
>         		return -EFAULT;
> 
> Should only be used if there is a demonstrable performance benefit.
> 
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
> V5: Rename to inline
> V4: Rename to scoped
> ---
>   include/linux/uaccess.h |   50 ++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 50 insertions(+)
> 
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -825,6 +825,56 @@ for (bool done = false; !done; done = tr
>   #define scoped_user_rw_access(uptr, elbl)				\
>   	scoped_user_rw_access_size(uptr, sizeof(*(uptr)), elbl)
>   
> +/**
> + * get_user_inline - Read user data inlined
> + * @val:	The variable to store the value read from user memory
> + * @usrc:	Pointer to the user space memory to read from
> + *
> + * Return: 0 if successful, -EFAULT when faulted
> + *
> + * Inlined variant of get_user(). Only use when there is a demonstrable
> + * performance reason.
> + */
> +#define get_user_inline(val, usrc)				\
> +({								\
> +	__label__ efault;					\
> +	typeof(usrc) _tmpsrc = usrc;				\
> +	int _ret = 0;						\
> +								\
> +	scoped_user_read_access(_tmpsrc, efault)		\
> +		unsafe_get_user(val, _tmpsrc, efault);		\
> +	if (0) {						\
> +	efault:							\
> +		_ret = -EFAULT;					\
> +	}							\
> +	_ret;							\
> +})
> +
> +/**
> + * put_user_inline - Write to user memory inlined
> + * @val:	The value to write
> + * @udst:	Pointer to the user space memory to write to
> + *
> + * Return: 0 if successful, -EFAULT when faulted
> + *
> + * Inlined variant of put_user(). Only use when there is a demonstrable
> + * performance reason.
> + */
> +#define put_user_inline(val, udst)				\
> +({								\
> +	__label__ efault;					\
> +	typeof(udst) _tmpdst = udst;				\
> +	int _ret = 0;						\
> +								\
> +	scoped_user_write_access(_tmpdst, efault)		\
> +		unsafe_put_user(val, _tmpdst, efault);		\
> +	if (0) {						\
> +	efault:							\
> +		_ret = -EFAULT;					\
> +	}							\
> +	_ret;							\
> +})
> +
>   #ifdef CONFIG_HARDENED_USERCOPY
>   void __noreturn usercopy_abort(const char *name, const char *detail,
>   			       bool to_user, unsigned long offset,
> 


