Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3958F19D2DE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:00:03 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tv5W5VgZzDsM9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 19:59:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::643;
 helo=mail-pl1-x643.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kbigYyh7; dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tv3w5nQ2zDrQv
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 19:58:36 +1100 (AEDT)
Received: by mail-pl1-x643.google.com with SMTP id d24so2455092pll.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 01:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=Hv0Wb2n2f67/m6LKBBCJmJwongv5tIYOk3Pp7Hlx/GI=;
 b=kbigYyh7fBliVj1FFnnxc43cs+J6kyYxHqlhgxm0ldkKJqU7j4zQgocVAkx3+VeXRx
 +FNaDARWo7bAvulgt8TcKuba7MDFVrmtvIk/eFz+PGGSK3rlKI7oS251sZxO5kJ3XmuL
 J8Q1+EWhmMhENwQ7StpVi1xdPVpaa/0vkf9+GHKyTb/iAMOTXfUIl4aX2pHmxOm7U7k7
 3V0ui1e1r4/LcVUHeY3B85ArYVkW4Nh8R0jS0O0sVfbIOH/7nEyYWFM4mDYy4qfY7dwL
 36SeT14Iu86gEBDmfGyxa7DHq1bzcqqaz2hU7G0axQPZ6LNq+yHhGxtuoHF6UjZE/6f9
 WkXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Hv0Wb2n2f67/m6LKBBCJmJwongv5tIYOk3Pp7Hlx/GI=;
 b=CoIifiCQOtSv3T5o+TUDD6Vvdo+fVXcv1gDdKaQ2FHUciJvrdg9QcwLrhvKllkHFmN
 emghiSrYM0dE3hZkzQnSNOCiEAKP+Su2ibeVWD/aMP5sP0VaeSFxTpf1XD8qFPbiA6i2
 UL638aOlLuiPKoL1y/czi/x9zC0FQGQqBMpw6Ie3dZKMiONEn2+7pyWc7p6H7dcnEu6/
 f3xat8Haht/ELNRHI6jvVKGAGG1MF9z1KYzS/rg1q2dQ3CAse9WwGTu+pGqiUSgLNmBY
 rMMIIpgkR0Tmp/2YIg0h80JFINK4ZZeIsr9JQmEpCGj9eFx3cDftO8KAuWw4WMk8vj+k
 so6g==
X-Gm-Message-State: AGi0PuanaYfaCV+ScJTtkW3f+wbdINtHzSDNSzg1CyN7FSTbJ6Yu6Ps/
 Q4oRjmrwV2alXkWCUEfdNoY=
X-Google-Smtp-Source: APiQypIdyBRZNZmTY/CEiV2IEp9/G6lZkVRqb/WN6ABfbpzZWVNrsx1y7lRR/TRqFw5NUHfL3TE6FQ==
X-Received: by 2002:a17:902:bd85:: with SMTP id
 q5mr7132677pls.326.1585904313108; 
 Fri, 03 Apr 2020 01:58:33 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id e9sm5399087pfl.179.2020.04.03.01.58.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 01:58:32 -0700 (PDT)
Date: Fri, 03 Apr 2020 18:58:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/4] powerpc/uaccess: evaluate macro arguments once,
 before user access is allowed
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20200327070240.427074-1-npiggin@gmail.com>
 <20200327070240.427074-3-npiggin@gmail.com>
 <633fbf5b-8227-1640-f056-7e5d203895dd@c-s.fr>
In-Reply-To: <633fbf5b-8227-1640-f056-7e5d203895dd@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585904242.5cxbsc2mu6.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on March 27, 2020 5:21 pm:
>=20
>=20
> Le 27/03/2020 =C3=A0 08:02, Nicholas Piggin a =C3=A9crit=C2=A0:
>> get/put_user can be called with nontrivial arguments. fs/proc/page.c
>> has a good example:
>>=20
>>      if (put_user(stable_page_flags(ppage), out)) {
>>=20
>> stable_page_flags is quite a lot of code, including spin locks in the
>> page allocator.
>>=20
>> Ensure these arguments are evaluated before user access is allowed.
>> This improves security by reducing code with access to userspace, but
>> it also fixes a PREEMPT bug with KUAP on powerpc/64s:
>> stable_page_flags is currently called with AMR set to allow writes,
>> it ends up calling spin_unlock(), which can call preempt_schedule. But
>> the task switch code can not be called with AMR set (it relies on
>> interrupts saving the register), so this blows up.
>>=20
>> It's fine if the code inside allow_user_access is preemptible, because
>> a timer or IPI will save the AMR, but it's not okay to explicitly
>> cause a reschedule.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/uaccess.h | 97 ++++++++++++++++++------------
>>   1 file changed, 59 insertions(+), 38 deletions(-)
>>=20
>> diff --git a/arch/powerpc/include/asm/uaccess.h b/arch/powerpc/include/a=
sm/uaccess.h
>> index 670910df3cc7..1cf8595aeef1 100644
>> --- a/arch/powerpc/include/asm/uaccess.h
>> +++ b/arch/powerpc/include/asm/uaccess.h
>> @@ -162,36 +162,48 @@ do {								\
>>   	prevent_write_to_user(ptr, size);			\
>>   } while (0)
>>  =20
>> -#define __put_user_nocheck(x, ptr, size, do_allow)			\
>> +#define __put_user_nocheck(x, ptr, size, do_allow)		\
>=20
> No need to touch this line. Anyway at the end, you still have several \=20
> which are not aligned.
>=20
>>   ({								\
>>   	long __pu_err;						\
>>   	__typeof__(*(ptr)) __user *__pu_addr =3D (ptr);		\
>> +	__typeof__(*(ptr)) __pu_val =3D (x);			\
>> +	__typeof__(size) __pu_size =3D (size);			\
>> +								\
>>   	if (!is_kernel_addr((unsigned long)__pu_addr))		\
>>   		might_fault();					\
>> -	__chk_user_ptr(ptr);					\
>> -	if (do_allow)								\
>=20
> No need to touch that line
>=20
>> -		__put_user_size((x), __pu_addr, (size), __pu_err);		\
>> -	else									\
>=20
> No need to touch that line

Okay fair point I can redo the patch.

Thanks,
Nick
=
