Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6038A19D311
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 11:03:40 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48tv9j3NLMzDsFQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 20:03:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AkbH0mSN; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48tv5g5QlVzDrqV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Apr 2020 20:00:07 +1100 (AEDT)
Received: by mail-pg1-x542.google.com with SMTP id b1so3205094pgm.8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=nKK8hwBzdqRPdYqqtw4sVeiAXS59kl9l0EExpw8DbCo=;
 b=AkbH0mSNmF2SiIAiW/FapBtN5CotgHcol8/kIc8aAK8XwsdEndJqEoVVR8jd/IlZZF
 EgS7VkvBxpkzTMhk+MtpwrqcQ41FjCUVWLuqIMXF8Hp2/WgDucxKygR+n/aZ2xmxdC1N
 ZKrrONvJPWdBmX4lfShjcZcs6HZj58PmuKM5vf4uO5exAU4RbNMKWF3X+pV7ZKdn1F2/
 m2f+Orn1LlR/kXY1J92apKfOTL/sCtE6caqCgRrY9251FhQELiP2lsX7OKTQJIYtAqac
 gyQzGk+9608ztPACEUSaFErlLnrlIpfihcYYp+kdIP+u1YxisdC7ehlJPZrkmCIbVEkk
 XIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=nKK8hwBzdqRPdYqqtw4sVeiAXS59kl9l0EExpw8DbCo=;
 b=T1KTaRtf0hgSd/FwV3WcoN3Z6VtyOec/lrJwV/RWtTIYCd8NlKBnP46Rf65qyoafvH
 UjWqObmFwkkCTdVdFDA5NWFbEixCdir12djcx6bsdzpsBgZT4dbIiZeCEKReXNpQZxAB
 NuMJVAevNDqHym8Fr6MuQa3A2jOqMZU+OHydbl7rkccBepwFMA6ARMSmSdXuIwP6F98x
 TqDLOppq8MI0uoC2vDzQR1FEi2Gv70t6VkSEfl2005mrQV2mzRGGWmiSQBRE4OyS/e/n
 MLgctRFAMoEWtze6zwcMTMDXCcO9M6eaWe2eUqvgDklRRQwOhUmC02sEzmYVRbOJqHqS
 XyhQ==
X-Gm-Message-State: AGi0Pub5++WSA+h3uj+fEnVQ3+rofTbgqqZPaZuX3OV1auKW9zZjbEzz
 IxnS25QcixmhTY/I6/hBihA=
X-Google-Smtp-Source: APiQypKQVJrY4+g7w02XGtzhQ8BRevluNomV15KEHZCPQ2tQTlounaQlUkNK3bbQ7OKFvc9Wvwi5hQ==
X-Received: by 2002:a65:5249:: with SMTP id q9mr7126298pgp.150.1585904404461; 
 Fri, 03 Apr 2020 02:00:04 -0700 (PDT)
Received: from localhost (60-241-117-97.tpgi.com.au. [60.241.117.97])
 by smtp.gmail.com with ESMTPSA id o15sm4808718pgj.60.2020.04.03.02.00.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Apr 2020 02:00:03 -0700 (PDT)
Date: Fri, 03 Apr 2020 18:59:58 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/4] powerpc/64s: implement probe_kernel_read/write
 without touching AMR
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20200327070240.427074-1-npiggin@gmail.com>
 <d619b378-3a88-f941-b2d5-42b79574e2ab@c-s.fr>
In-Reply-To: <d619b378-3a88-f941-b2d5-42b79574e2ab@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1585904337.b41amzn27o.astroid@bobo.none>
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

Christophe Leroy's on March 27, 2020 5:13 pm:
>=20
>=20
> Le 27/03/2020 =C3=A0 08:02, Nicholas Piggin a =C3=A9crit=C2=A0:
>> There is no need to allow user accesses when probing kernel addresses.
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>   arch/powerpc/include/asm/uaccess.h | 25 ++++++++++-----
>>   arch/powerpc/lib/Makefile          |  2 +-
>>   arch/powerpc/lib/uaccess.c         | 50 ++++++++++++++++++++++++++++++
>>   3 files changed, 68 insertions(+), 9 deletions(-)
>>   create mode 100644 arch/powerpc/lib/uaccess.c
>>=20
>=20
> [...]
>=20
>> diff --git a/arch/powerpc/lib/Makefile b/arch/powerpc/lib/Makefile
>> index b8de3be10eb4..a15060b5008e 100644
>> --- a/arch/powerpc/lib/Makefile
>> +++ b/arch/powerpc/lib/Makefile
>> @@ -36,7 +36,7 @@ extra-$(CONFIG_PPC64)	+=3D crtsavres.o
>>   endif
>>  =20
>>   obj-$(CONFIG_PPC_BOOK3S_64) +=3D copyuser_power7.o copypage_power7.o \
>> -			       memcpy_power7.o
>> +			       memcpy_power7.o uaccess.o
>=20
> Why only book3s/64 ? It applies to the 8xx and book3s/32 as well, I=20
> think it should just be for all powerpc.

Okay I can do that.

>>  =20
>>   obj64-y	+=3D copypage_64.o copyuser_64.o mem_64.o hweight_64.o \
>>   	   memcpy_64.o memcpy_mcsafe_64.o
>> diff --git a/arch/powerpc/lib/uaccess.c b/arch/powerpc/lib/uaccess.c
>> new file mode 100644
>> index 000000000000..0057ab52d6fe
>> --- /dev/null
>> +++ b/arch/powerpc/lib/uaccess.c
>> @@ -0,0 +1,50 @@
>> +#include <linux/mm.h>
>> +#include <linux/uaccess.h>
>> +
>> +static __always_inline long
>> +probe_read_common(void *dst, const void __user *src, size_t size)
>> +{
>> +	long ret;
>> +
>> +	pagefault_disable();
>> +	ret =3D raw_copy_from_user_allowed(dst, src, size);
>> +	pagefault_enable();
>> +
>> +	return ret ? -EFAULT : 0;
>> +}
>> +
>> +static __always_inline long
>> +probe_write_common(void __user *dst, const void *src, size_t size)
>> +{
>> +	long ret;
>> +
>> +	pagefault_disable();
>> +	ret =3D raw_copy_to_user_allowed(dst, src, size);
>> +	pagefault_enable();
>> +
>> +	return ret ? -EFAULT : 0;
>> +}
>> +
>> +long probe_kernel_read(void *dst, const void *src, size_t size)
>> +{
>> +	long ret;
>> +	mm_segment_t old_fs =3D get_fs();
>> +
>> +	set_fs(KERNEL_DS);
>> +	ret =3D probe_read_common(dst, (__force const void __user *)src, size)=
;
>=20
> I think you should squash probe_read_common() here, having it separated=20
> is a lot of lines for no added value. It also may make people believe it=20
> overwrites the generic probe_read_common()

Yeah I'll see how that looks.

Thanks,
Nick
=
