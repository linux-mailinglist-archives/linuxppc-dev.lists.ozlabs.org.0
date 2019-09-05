Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13434A99A0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 06:31:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46P77N5DywzDr2F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 14:31:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::641; helo=mail-pl1-x641.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="Q2iQHLeW"; 
 dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46P75Q2pvBzDqwf
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 14:30:02 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id f19so664448plr.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Sep 2019 21:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=sD4hLzz7Xxx8RGfoTOisGG9eVE4QrljmjiNe1di+XMw=;
 b=Q2iQHLeWoukd8BWurWNDTdoI95bNHOVo59qSH4Y11zIeZ/pZNwNtDthp9ol7PyCCrD
 TkQU/+va574ESg3s/TYOtpkvayYNOZ8Y1VPDmD7iRAcP04ev56WvFCHeNd5NyWwa0OHY
 oxyiF805NJ3geyp3HqK66qcQYib69JGYPJa9a0V/2GNbws815OgxzCVyuG+1ULnLtUkF
 mZNvV/OF98SM6Wp/mQUM9H17FDw3X2SR+65wxESAnd1d7m8/cObLfwZeXlEmFsNPymG1
 nJHIxm+pRANv0qQncut34/fNlLM0FHvvB6M1sDTeinPFEIbLUGELqWYitLuQnJWX5R88
 D2xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=sD4hLzz7Xxx8RGfoTOisGG9eVE4QrljmjiNe1di+XMw=;
 b=Ec7rnDWFbJNz2WdZFdFXqn3+gpOwtVuux+jtHSAdfWBlKRXfrRkkwvl3/wrZLnW2Jt
 dC8whVpLgHsoYHTUS58liDTFNgG9W89MGux4xzSVxh/wbniKALS/25QMZKd+S8kgsFZj
 /qWPGXiTeUOjHTj2KR06lSfgjd7/LZDRwLnW1oNbfnY8eCRi9lvVYmvjFYxTjOjW3k/b
 nY7FCqeTdcIDnVEpfI0n2of5vXUYMU+0ZIVBhpIEpl4ijnVOJGwezMHFuvdAb1CitIhZ
 XYPw+WK+ogw/2jjQZZUhb2t+1kydHKbI2ECTduzqOcl9Ux8jIGRzEQKG3eAQaoUgsVBy
 SZYA==
X-Gm-Message-State: APjAAAXK7JnC+0E82EFVVVY8RBQEJCxyhvPH408x0+gtDP3nfNKDAZww
 oFEgaDTbdPilYJpGV2WGpRjbNH6c
X-Google-Smtp-Source: APXvYqw1AMbpPF9HWsICR11Y1QuK6v1XY0sHMP6CxKR/zkAN/eVYDfJR5kN5BsWb+IncZYNYNaD2Yg==
X-Received: by 2002:a17:902:b40c:: with SMTP id
 x12mr1320493plr.236.1567657799116; 
 Wed, 04 Sep 2019 21:29:59 -0700 (PDT)
Received: from localhost ([203.63.189.78])
 by smtp.gmail.com with ESMTPSA id 69sm769732pfb.145.2019.09.04.21.29.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2019 21:29:58 -0700 (PDT)
Date: Thu, 05 Sep 2019 14:29:13 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/64: system call implement the bulk of the
 logic in C
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20190902225835.17354-1-npiggin@gmail.com>
 <875zm7pefl.fsf@mpe.ellerman.id.au>
In-Reply-To: <875zm7pefl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1567657627.xi0syilmvi.astroid@bobo.none>
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

Michael Ellerman's on September 5, 2019 2:14 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> System call entry and particularly exit code is beyond the limit of what
>> is reasonable to implement in asm.
>>
>> This conversion moves all conditional branches out of the asm code,
>> except for the case that all GPRs should be restored at exit.
>>
>> Null syscall test is about 5% faster after this patch, because the exit
>> work is handled under local_irq_disable, and the hard mask and pending
>> interrupt replay is handled after that, which avoids games with MSR.
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>> Since v1:
>> - Fix big endian build (mpe)
>> - Fix order of exit tracing to after the result registers have been set.
>> - Move ->softe store before MSR[EE] is set, fix the now obsolete comment=
.
>> - More #ifdef tidyups and writing the accounting helpers nicer (Christop=
he)
>> - Minor things like move the TM debug store into C
>=20
> This doesn't build in a few configs.
>=20
> It needed:
>=20
> +#else
> +static inline void kuap_check_amr(void) { }
>=20
> In kup-radix.h to fix the KUAP=3Dn build.

Thanks.

>=20
> It still fails to build on ppc64e with:
>=20
>   arch/powerpc/kernel/syscall_64.c:161:2: error: implicit declaration of =
function '__mtmsrd' [-Werror=3Dimplicit-function-declaration]

Ah, no __mtmsrd or RI on BookE, so that will need a new function in
hw_irq.h. I think I also need to do the irq tracing with RI=3D1 now I=20
think about it.

I'll resend a fixed patch.

Thanks,
Nick
=
