Return-Path: <linuxppc-dev+bounces-13948-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A6082C416B3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 20:18:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d383L22Slz2ypY;
	Sat,  8 Nov 2025 06:18:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762543086;
	cv=none; b=IZ/UDJ0h81+4CvPVi3U2c1aRAroVx3X4ERLUaJTptMa4/7v/x7dN0VdojzOFQBHM+ykqkbc3iX+sCe8MQkjpFqXs+kQNTSe5Ta7li/GqWpdfHx49+4onEHXrR/Qki6iv1LTL7DjNquEtIV6HNEAShMWPIZ1Wq/1uxT+lk/h5VbrR5oEyXjauPaPVXGaBSdCWPVgWMzXDPGG2p33whAcDt5PPoWIBL8Lu4+EySoks2jo4UMb2T+/PVboGL6uvwXdF9sGuZX7yEWz+R4UD2x0J21cpJUBquYpbT3+7WXDPZq+LTdPVbOtVJgzsQgfS23qx2RtNI15Yx5v+k853CwWWwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762543086; c=relaxed/relaxed;
	bh=BoyRAxBYJ97KZHdMcvP1wI7gdZM18PW/SDBquVzm/CM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eJjZXkpQ2RFOY5RROSx3THboezoSf3gMWBIC3VbAONKFx9TXkMmyLYD29b/nqO+Fy0a3Xgkzocw6lOrGFvMf9cpwyAWPByroPWOgp39v9w/Fz6I5mNmHur7S57iI5qqUYvZDHMVNcWC9VgfKochGf367vFs7W57E8PV9bgtD+O4YV4HXAaKKaXFrg7vIWezj8soWRTNilxSQVMQWcQwPP9Q1xRPObj0AuHqAUHRGGrM0Ukda+BBEEg9PdueDrFav12Akuu7hc8eeDa2jiqI3BvQ0xVQeAcJE++lCc4M0KuvcaOI4/tIhF3oZO0uEgxGZ7ibzIPVH+heoAYv9dwQ8zQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ddBy2hqk; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ddBy2hqk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d383J3j77z2xQ0
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Nov 2025 06:18:03 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-477442b1de0so7299885e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Nov 2025 11:18:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762543079; x=1763147879; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoyRAxBYJ97KZHdMcvP1wI7gdZM18PW/SDBquVzm/CM=;
        b=ddBy2hqk4zw767WzsHxLW2UeiK3gPLhs/rCYFEVKLFhpPzYeN8yGgTxd+Bt5aibIvR
         1Wc9p/PlcbBZkMXrlMUeflCLykUsL5W0HEDHKAQ6J/q03yT3fFYPy8J1Auj8ilqjECj9
         Ggfq0+kG50KkEQuUcR1xIFbF2Bwl2OUvoCgr7iyHFJig6jkgGH8IdwLtS4gDFDfIvCE7
         scY9b2e6zJuBWbB8T7eENJDz+3Ig4/j6Kf/alWGlYrC4JmqXRhBbzt0IloT1zyOUA3Zc
         XUKrc0YAm5ZH7liPcVx+sbHHrGSoiZCgOcER3mKNK8CiUe86p1G6V+80RJsapejYqyt9
         tMMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762543079; x=1763147879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BoyRAxBYJ97KZHdMcvP1wI7gdZM18PW/SDBquVzm/CM=;
        b=AUvv7o3z8manHafknBK1hjEqlrXfnPCRM5Id7JN/23bX36Xp/5c49eHzF6ETqc2wpt
         YpFN5uxHOc0bCETLBtUc+keqQUFWb7svB1ybYC9B5fgKB+tBN6ThOS9GqfIPP+W1G4+P
         5pvCc6gdmpcOIxiXncrXBMxWO9KBJ4jEuFaGTQ1hNoV/TG/FNCn2qJjSNUmq3iRu69xV
         37md4PAQRHNHIbm9r/DR3+CK2wpubt3j2AtgreXMk3kTtfHHkrLH+63osaDFho/3MqB2
         DY+cgh+ZNpGnhovThuaCwAHy9J4165rTc+DV/pNq33wJpt9mJEhQ8D/kMUHuIc15LS37
         STBg==
X-Forwarded-Encrypted: i=1; AJvYcCW4yPR0iwbt/+1EDdmyHqydnaP2MO7HZCfFxo0xKai6fVI5fqKHaT5PGV/0s821lzNTHHvtZcBA0SPiQ+E=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwW22lqHcjzcwVPCs6duGGnF8a6C7Tk1U5RIl2Yl532eY/62Vzh
	kHzN7zQ3C4CCy51is5cIFfNDK/gE36CjmuhJdjgQYrIyGpRSvgeI7B+s
X-Gm-Gg: ASbGncvx+NyZVyk8XuBOnEK5sXbdSF2I22IHUII0EsdkNIE2Hb8nYI4Ufp3NDNRuULg
	slv/PGKobTtS4bDEZhmm6d16MDiC4sexBMyV7lAIfEa5xBcKIAKXo0beT3cmiZ8ZIpI+r2+tune
	gkHfSN+bOBRYuUQTORuOOOkDr8ncMTOrGjI4sG90j5zHTeqnuafmCe7nAAr6OB05oGS8SlvJ68H
	qSn62OzO/zgjOG7qiFnoNbCohWdJOCm2hr3tbSCnEKcCFRo0l7CUfVzqW9yj04QLVTFR93DR0s4
	1M/OwHaDeFgU4SFcMWEOvhBKYH6trribOREE/bWiQxkOCsg5X9ny0LDuKLs+dXBIb8P0cLX6uRq
	YKdWgoylPzS3hF0I/XwzX39SBEkcpGzqK3fYPdVymVXbcWO03jZW2IsSn7uwD4IHA5aVzjNuDJk
	X8aZlVvUhbnkjQF4j+i2h/wDcSiciKVPXa0mjbh+BWztvQlXL0TU/q
X-Google-Smtp-Source: AGHT+IGwWldiHMKs6o3o24t2zUapUEv2nDiVIW1qgftMpp+s7M3k154xFpb/vMUGopieuIUWMdpZmw==
X-Received: by 2002:a05:600c:45c7:b0:477:55b6:cdd6 with SMTP id 5b1f17b1804b1-4777322f0a4mr1228445e9.10.1762543078570;
        Fri, 07 Nov 2025 11:17:58 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42abe62b23csm6811350f8f.10.2025.11.07.11.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Nov 2025 11:17:58 -0800 (PST)
Date: Fri, 7 Nov 2025 19:17:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Andrew Cooper
 <andrew.cooper3@citrix.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, kernel test robot <lkp@intel.com>, Russell
 King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman
 <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, Paul Walmsley <pjw@kernel.org>, Palmer
 Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, Heiko
 Carstens <hca@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 linux-s390@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>, Nicolas
 Palix <nicolas.palix@imag.fr>, Peter Zijlstra <peterz@infradead.org>,
 Darren Hart <dvhart@infradead.org>, Davidlohr Bueso <dave@stgolabs.net>,
 =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>, Alexander Viro
 <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara
 <jack@suse.cz>, linux-fsdevel@vger.kernel.org
Subject: Re: [patch V5 07/12] uaccess: Provide scoped user access regions
Message-ID: <20251107191753.7433d2dc@pumpkin>
In-Reply-To: <20251027083745.546420421@linutronix.de>
References: <20251027083700.573016505@linutronix.de>
	<20251027083745.546420421@linutronix.de>
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

On Mon, 27 Oct 2025 09:43:55 +0100 (CET)
Thomas Gleixner <tglx@linutronix.de> wrote:

> User space access regions are tedious and require similar code patterns all
> over the place:
...
> There have been issues with using the wrong user_*_access_end() variant in
> the error path and other typical Copy&Pasta problems, e.g. using the wrong
> fault label in the user accessor which ends up using the wrong accesss end
> variant. 
> 
> These patterns beg for scopes with automatic cleanup. The resulting outcome
> is:
>     	scoped_user_read_access(from, Efault)
> 		unsafe_get_user(val, from, Efault);
> 	return 0;
>   Efault:
> 	return -EFAULT;
> 
> The scope guarantees the proper cleanup for the access mode is invoked both
> in the success and the failure (fault) path.
> 
...

The code doesn't work if the 'from' (above) is 'const foo __user *from'.
Due to assigning away constness.

The changes below fix the build, I suspect the code is then correct.

...
> +/* Define RW variant so the below _mode macro expansion works */
> +#define masked_user_rw_access_begin(u)	masked_user_access_begin(u)
> +#define user_rw_access_begin(u, s)	user_access_begin(u, s)
> +#define user_rw_access_end()		user_access_end()
> +
> +/* Scoped user access */
> +#define USER_ACCESS_GUARD(_mode)				\

#define USER_ACCESS_GUARD(_mode, void)
(but change all the void below to a different name...)

> +static __always_inline void __user *				\
> +class_user_##_mode##_begin(void __user *ptr)			\
> +{								\
> +	return ptr;						\
> +}								\
> +								\
> +static __always_inline void					\
> +class_user_##_mode##_end(void __user *ptr)			\
> +{								\
> +	user_##_mode##_access_end();				\
> +}								\
> +								\
> +DEFINE_CLASS(user_ ##_mode## _access, void __user *,		\
> +	     class_user_##_mode##_end(_T),			\
> +	     class_user_##_mode##_begin(ptr), void __user *ptr)	\
> +								\
> +static __always_inline class_user_##_mode##_access_t		\
> +class_user_##_mode##_access_ptr(void __user *scope)		\
> +{								\
> +	return scope;						\
> +}
> +
> +USER_ACCESS_GUARD(read)
> +USER_ACCESS_GUARD(write)
> +USER_ACCESS_GUARD(rw)

USER_ACCESS_GUARD(read, const void)
USER_ACCESS_GUARD(write, void)
USER_ACCESS_GUARD(rw, void)

> +#undef USER_ACCESS_GUARD
...
> +#define __scoped_user_access(mode, uptr, size, elbl)					\
> +for (bool done = false; !done; done = true)						\
> +	for (void __user *_tmpptr = __scoped_user_access_begin(mode, uptr, size, elbl); \

	for (typeof(uptr) _tmpptr = ...

> +	     !done; done = true)							\
> +		for (CLASS(user_##mode##_access, scope)(_tmpptr); !done; done = true)	\
> +			/* Force modified pointer usage within the scope */		\
> +			for (const typeof(uptr) uptr = _tmpptr; !done; done = true)
> +

	David


