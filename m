Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B23511FF58
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 08:09:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 454LcK2BcSzDqbG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 May 2019 16:09:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::544; helo=mail-pg1-x544.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="hWqus6eQ"; 
 dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 454LZy1rWpzDqYM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 May 2019 16:08:39 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id c13so1020409pgt.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 23:08:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=Z9ZzyHo3v9SXNFTMM4Jkk740EFM8Wz+M7SaxNQ/vRWk=;
 b=hWqus6eQ96t7EgVQdGXCt4mhLJ90ayTUH+UeuPl43p/BY2+KZeM6MeNmUGC3CHR8cx
 zxAG7Jj2fYCsHHXL4OMd47hgbKDEeulBSI7OI2y7AuNDZ5gtBJLheuzqWw/koyIbj3fT
 gNxw0Q60rxixdFhYVB1TapOUseQl1uGz03F3WJSwzNjBgCYxpn67pTbkgbUTXhdsZ9rI
 mPgM7Vtzol3hEAB7skDJIlc7n7JIX7gose6kzSFVag8kwW4cutgSVILZUqHQUOWcpVQh
 olFhgv/tFtl/T5Ic3LjqdAeJC14XIB4Q3rFbYKX+GQ6ra/UsXyd/vjTv/7HUD+srSakh
 VVZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=Z9ZzyHo3v9SXNFTMM4Jkk740EFM8Wz+M7SaxNQ/vRWk=;
 b=qcnPvF5kpdBT3ln5vJ4YfUBf5tKc3/g6OAfysNq5qbyjiV6tzBntVDVp+5I0ggByw2
 AqfpVC3KNUF9evH7ShxH2LUrRR2IGcSH7Wx0H6XehKVZUCscGu88KkZdS77ZmhdowXvJ
 57EoqxzR36MXQgxmum7F/VNxN4svcGRmyTr6yHc4CYZS3yadDZll8ZfAPbLy85yr8vAc
 6EVlxYIR9F/1d5G5pb3dj7NcIuXdEC7PxvyDuZZDDLEy7SwEl52aaI3GZh/H/rbxsFmo
 pHPR1pbtmtKgGlWqW80HIvaMuu+dKsE1Vz+Gg+6ETILL7EKvtCVVeTwoNo9xQOglq9ne
 dKZA==
X-Gm-Message-State: APjAAAXVE3b5QHo2h/HcpUV5z5bOIJUIrukPWFTtWlHwjtWIOD9SRefT
 5fmOoXKGQgk4kW/ZY89bCvA=
X-Google-Smtp-Source: APXvYqx/A23yanSsjADy4m8u6+Dq5EHkcwn4175403fspqnKSmtmRzQCAOF8Gr2CTk5JT7pePSrsRQ==
X-Received: by 2002:a63:1316:: with SMTP id i22mr48334865pgl.274.1557986916224; 
 Wed, 15 May 2019 23:08:36 -0700 (PDT)
Received: from localhost (193-116-124-212.tpgi.com.au. [193.116.124.212])
 by smtp.gmail.com with ESMTPSA id h16sm9162075pfj.114.2019.05.15.23.08.34
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 May 2019 23:08:35 -0700 (PDT)
Date: Thu, 16 May 2019 16:08:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64s: Make boot look nice(r)
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190516020437.11783-1-npiggin@gmail.com>
 <d65ae686-c117-ae1c-1d48-498fdd1ea0eb@c-s.fr>
In-Reply-To: <d65ae686-c117-ae1c-1d48-498fdd1ea0eb@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1557986563.56odablyi5.astroid@bobo.none>
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

Christophe Leroy's on May 16, 2019 2:47 pm:
>=20
>=20
> Le 16/05/2019 =C3=A0 04:04, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Radix boot looks like this:
>>=20
>>   -----------------------------------------------------
>>   phys_mem_size     =3D 0x200000000
>>   dcache_bsize      =3D 0x80
>>   icache_bsize      =3D 0x80
>>   cpu_features      =3D 0x0000c06f8f5fb1a7
>>     possible        =3D 0x0000fbffcf5fb1a7
>>     always          =3D 0x00000003800081a1
>>   cpu_user_features =3D 0xdc0065c2 0xaee00000
>>   mmu_features      =3D 0xbc006041
>>   firmware_features =3D 0x0000000010000000
>>   hash-mmu: ppc64_pft_size    =3D 0x0
>>   hash-mmu: kernel vmalloc start   =3D 0xc008000000000000
>>   hash-mmu: kernel IO start        =3D 0xc00a000000000000
>>   hash-mmu: kernel vmemmap start   =3D 0xc00c000000000000
>>   -----------------------------------------------------
>>=20
>> Fix:
>>=20
>>   -----------------------------------------------------
>>   phys_mem_size     =3D 0x200000000
>>   dcache_bsize      =3D 0x80
>>   icache_bsize      =3D 0x80
>>   cpu_features      =3D 0x0000c06f8f5fb1a7
>>     possible        =3D 0x0000fbffcf5fb1a7
>>     always          =3D 0x00000003800081a1
>>   cpu_user_features =3D 0xdc0065c2 0xaee00000
>>   mmu_features      =3D 0xbc006041
>>   firmware_features =3D 0x0000000010000000
>>   vmalloc start     =3D 0xc008000000000000
>>   IO start          =3D 0xc00a000000000000
>>   vmemmap start     =3D 0xc00c000000000000
>>   -----------------------------------------------------
>>=20
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>=20
> I fear your change defeats most of the purpose of commit=20
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?h=3Dnext-20190515&id=3De4dccf9092ab48a6f902003b9558c0e45d0e849a

I think it's still a significant improvement without introducing
the regression :)

> As far as I understand, the main issue is the "hash-mmu:" prefix ?
> That's due to the following define in top of book3s64/hash_utils.c:
>=20
> #define pr_fmt(fmt) "hash-mmu: " fmt
>=20
> Could we simply undef it just before print_system_hash_info() ?

Little bit fragile I think.

> Or move print_system_hash_info() in another book3s64 specific file which=20
> doesn't set pr_fmt ?

print_system_info() would be okay for me and allow getting rid of
that PPC64 config. Although it also needs to go in a file without
pr_fmt I guess that's not so hard.

Thanks,
Nick

=
