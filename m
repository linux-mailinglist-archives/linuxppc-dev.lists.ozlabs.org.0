Return-Path: <linuxppc-dev+bounces-9618-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 40702AE30CD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 18:36:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQH065Bsqz30Vr;
	Mon, 23 Jun 2025 02:36:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750610166;
	cv=none; b=NEe8jUucJuFFbiOa89s1h8xu2dsprXHperlJjREtlStIofuJS5pxrLt6mJxlnIvMTApixua2cOaNPRIZbR83s1zXE7NOU6/UPqhccz4AQcQaT3kXPiKeNwJA+s5PP0xTC48n7s1208m3TL8WS71o3FrUoj1/kR0IPQvFu5xI+/DB68/olYa5NiUKdovA7WIAj48yC7l7tw0Z00a95sN0Bz/bq/FL/uvDBs5djldo3lFlTQp/ROheoNdfbNTlBrmCUykVo9ZnjeiL33A8j/TSJx6wa+k1gciCr8m9XBbLJUvhLZ9JlYpHQUWSNO53MZzS31mFzHaBZd/5Sb+NIbcXNw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750610166; c=relaxed/relaxed;
	bh=k1oa4nNQ6OD1xXNiA0TVTj0NDdNUr9/eQINchl8HXO8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aBd7XY86teXr+mZo21TUgd9y3XLEmH/T2NSINukMEv6HYhGBx1T16lXe/bVYgwy/6IOtOyBeK/1Z/TTr/JuaxZ8E9AaoD7wsske3ReIUWiymgdyCGaYRd9YRiQmEXQs7GfdIAXryf9YIheUk4YKha94tjicVr4yViRh0mtLjkw6KrWh0gQmkx9SStKfDB+OWWJMu75to25WJBTMGPt/nigX9rZjGmNgCq8I0cA3tU0rOkfionF5P4Tck6LHvVAxgR+FgWjl5apTMS0lfXiNrsajuRoXhxR0JEumP2rdAn+dmxYubXKdmG4bSZqoNbh3EWjsf8iknfLWmdWgk07otXQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fy55ZCdT; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Fy55ZCdT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQH0123XJz30VR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 02:36:00 +1000 (AEST)
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-45310223677so25683845e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 09:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750610156; x=1751214956; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k1oa4nNQ6OD1xXNiA0TVTj0NDdNUr9/eQINchl8HXO8=;
        b=Fy55ZCdTuT0zN2AQOqEQKCiqmKMRqcUec6LOGr8inohTKN2mQoy/epKpA5uU3Hkqyq
         6XGnoonuHsp0977S3cal7aYS8UvrKPkvXi3zejFSlEibxb3xIrApAdipUy9EvwZ5d43E
         9U1qLIEUKwrT6RK7JEdCkl8m9U4sF6/ZNHHqMwo4gu/N/9YyPLipl5qv84lQxCXM1UKW
         aa4zu/F6+d1e9ngJP71O0DEf6STsJV/yJL6Vg9oMwaTt68K1hmmgLeFv6zzN9naNTxmG
         NFdjyIKoJpyDuL/tXOrlHnOUQEroBfCK9eESJ2zHS7EfTRUToUnaVPErRr8uhiiwIXSu
         yFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750610156; x=1751214956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=k1oa4nNQ6OD1xXNiA0TVTj0NDdNUr9/eQINchl8HXO8=;
        b=YIlgyKBK+/nvfuMdn889IkRvo/gLat91q5CwwnK2sfOVTDJIlhFt6XRoNzdPkG/6JT
         2fX+ZgtHYVzuqqOM8Ip1vB7zt/NBcUMXOI98XkLcN0C0T7banm1sftnjNtHzi9dHRO0F
         CBhJfRhYVfERDW/eDSRsbAIX7mCje21dwY6eglKtjhlPK58elpwZNIy0GCq0Kec8a6qS
         a+eo1QrBgl9uzgsJ5bHt5GcQVKeJOD0FpBW6+0h9Gz9dvNCuZIJpKPb9FVmQpAQDzMSE
         n99XfKkgNQFOy8z4rI803pEOwYu2NX7u/RYC+VQ8JTmf+OvXKx9IDQz3gekR/Q4moprK
         H6Pw==
X-Forwarded-Encrypted: i=1; AJvYcCWjEwlBLDANT9sU23Y0UEbbM/8Gq/VOWThpSGCD7rgEh8f+/nU3thvS2A9PYfnjfz9hjM9IrarhzmAnkIA=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwNkTnUPP5N46Y5uuTNxM2MJybM1+8bO/Y+oZsQO0erb6Y7N1ka
	SYIt0qMiR6x//CHHXXB/MlEvJBsdDP45pSQ/V44jOz/5QHG0OwZqcFhh
X-Gm-Gg: ASbGncuwi5F3hsRQ2iMoWA8SiufqPjNc44l2x34uqDV8P3eZB5Wom1mLLDz4Xzjj6Nz
	3BdtMIortLe6Bxrou8H44bjqLk0471o4VvkI3T+qS9Qta767T5V5TDfIG5xmLQdMy/5FTYgRmCL
	XC5WxtFwr5shU33DEeMXl8r3rvIm37+d87LgQQ5asai0tHJH/GZS/z3tRstwxw9hUwFCw6HpuOY
	ib58rryXC3v8GmxOm4btmEpM0wm/QT0mTpMORmZ1x4rf38+FYEtNRqpfglmPwPJXxrEAisd4bLu
	qJQC/aLCD824AuNrVpRMZRdVDfb7N28nFG5l1M4vfs72JNkTQ2yAbTPW6fjoFcHWf/siP58ZJle
	z0eOx9lJD9oT5RlXRS3SOxUG4
X-Google-Smtp-Source: AGHT+IGIT3mcJ0gknkqPxwnQDk3KNRNpW3ykVb1rF9fBn2/P8z4fr9bdSWKQ+VnywD6VovL+QSHlYw==
X-Received: by 2002:a05:600c:b86:b0:441:b076:fce8 with SMTP id 5b1f17b1804b1-453659c0bb9mr104566595e9.14.1750610156286;
        Sun, 22 Jun 2025 09:35:56 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f186dbsm7175528f8f.26.2025.06.22.09.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 09:35:56 -0700 (PDT)
Date: Sun, 22 Jun 2025 17:35:54 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
 <dave@stgolabs.net>, "Andre Almeida" <andrealmeid@igalia.com>, Andrew
 Morton <akpm@linux-foundation.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 1/5] uaccess: Add masked_user_{read/write}_access_begin
Message-ID: <20250622173554.7f016f96@pumpkin>
In-Reply-To: <6fddae0cf0da15a6521bb847b63324b7a2a067b1.1750585239.git.christophe.leroy@csgroup.eu>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
	<6fddae0cf0da15a6521bb847b63324b7a2a067b1.1750585239.git.christophe.leroy@csgroup.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 22 Jun 2025 11:52:39 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> Allthough masked_user_access_begin() seems to only be used when reading
> data from user at the moment, introduce masked_user_read_access_begin()
> and masked_user_write_access_begin() in order to match
> user_read_access_begin() and user_write_access_begin().
> 
> Have them default to masked_user_access_begin() when they are
> not defined.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  fs/select.c             | 2 +-
>  include/linux/uaccess.h | 8 ++++++++
>  kernel/futex/futex.h    | 4 ++--
>  lib/strncpy_from_user.c | 2 +-
>  lib/strnlen_user.c      | 2 +-
>  5 files changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/select.c b/fs/select.c
> index 9fb650d03d52..d8547bedf5eb 100644
> --- a/fs/select.c
> +++ b/fs/select.c
> @@ -777,7 +777,7 @@ static inline int get_sigset_argpack(struct sigset_argpack *to,
>  	// the path is hot enough for overhead of copy_from_user() to matter
>  	if (from) {
>  		if (can_do_masked_user_access())
> -			from = masked_user_access_begin(from);
> +			from = masked_user_read_access_begin(from);
>  		else if (!user_read_access_begin(from, sizeof(*from)))
>  			return -EFAULT;
>  		unsafe_get_user(to->p, &from->p, Efault);
> diff --git a/include/linux/uaccess.h b/include/linux/uaccess.h
> index 7c06f4795670..682a0cd2fe51 100644
> --- a/include/linux/uaccess.h
> +++ b/include/linux/uaccess.h
> @@ -41,6 +41,14 @@

>  #ifdef masked_user_access_begin
>   #define can_do_masked_user_access() 1
>  #else
>   #define can_do_masked_user_access() 0
>   #define masked_user_access_begin(src) NULL
>   #define mask_user_address(src) (src)
>  #endif
>  
> +#ifndef masked_user_write_access_begin
> +#define masked_user_write_access_begin masked_user_access_begin
> +#endif
> +#ifndef masked_user_read_access_begin
> +#define masked_user_read_access_begin masked_user_access_begin
> +#endif

I think that needs merging with the bit above.
Perhaps generating something like:

#ifdef masked_user_access_begin
#define masked_user_read_access_begin masked_user_access_begin
#define masked_user_write_access_begin masked_user_access_begin
#endif

#ifdef masked_user_read_access_begin
  #define can_do_masked_user_access() 1
#else
  #define can_do_masked_user_access() 0
  #define masked_user_read_access_begin(src) NULL
  #define masked_user_write_access_begin(src) NULL
  #define mask_user_address(src) (src)
#endif

Otherwise you'll have to #define masked_user_access_begin even though
it is never used.

Two more patches could change x86-64 to define both and then remove
the 'then unused' first check - but that has to be for later.

	David



