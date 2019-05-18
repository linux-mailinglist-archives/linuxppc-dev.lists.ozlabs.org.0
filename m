Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 020362212B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 03:57:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 455SwY005KzDqSk
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 May 2019 11:57:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 455SvF5qQjzDqS4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 11:56:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IUkox/pT"; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 455SvC45f0z8tRv
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 May 2019 11:56:39 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 455SvC3vNtz9s9N; Sat, 18 May 2019 11:56:39 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IUkox/pT"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 455SvB5zgwz9s3q
 for <linuxppc-dev@ozlabs.org>; Sat, 18 May 2019 11:56:37 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id t87so4524270pfa.2
 for <linuxppc-dev@ozlabs.org>; Fri, 17 May 2019 18:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=GjkSI2kp+svDUFAT2A64zlEwVJZs8XYVnmjV0OzUrk4=;
 b=IUkox/pTpTlmy1RUikShP+6yQRf4MY5FyGena73GUJdEeds9YPD0B1/eq9cE8usAv6
 0FZ2EzBogmSOx6Vtugvmm4cMovBYfscL3bvxFWMXg6XgE4u9FmQZILSkXYEik2xTkV8q
 VlKccvjYhUs2iZ7Dd/+HTKHIGGVGacXjShB44AIwoeLgjnfGtKdE5GRxUjbzFuNaQnHH
 aVVnLBP8RbQ1y1dVuD37wmEu6bfYYujzHDBbWt0hKySaDtyYvtNJCKQk1j1sxVz2ebc6
 7ps+O+PBbDQqIInRtuwTYJaczOXCj+o5s/U6HDw9Ebeyp8o5B0EhNtUgTH25Axnd40Er
 Rohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=GjkSI2kp+svDUFAT2A64zlEwVJZs8XYVnmjV0OzUrk4=;
 b=OukTk+C0J6z1zRirjvobHjRWXU7qmybLwGLwDFqs7lALHuzM9DhPM9DLl7d0xLJ+kv
 ke6EkyWMsHErqj3u28DdWiz83Nged1mCXA3GNNyLUMsHHNnEWAMV0jqRJt96X4lgLddY
 UjOw2kjpitGKI932JizCjh5ul3NDwQqwFwak6InyM/Ft1LI4lASuRzqWfMr3RPMhfO5u
 jExfV8olryf0Bjgp3rbI1nXJDFdIAGDC7+cJ7TjZX+k20KFwuBAhezoiI6t7ODXQkl6l
 L/yRbrIMB9pDyU0YwPoAnH4S7EtrLW4abMhPIg9d/q6AZ3DBZlDnC+QjivnVf7gKkxwE
 uWbA==
X-Gm-Message-State: APjAAAXomqGneKVIMaRoaeiH8cuFHoO4oV5jFdblBCYJIKFDbx0EXM2/
 oO15fXMd8YaTbBU7uAHhcl2dVUgM
X-Google-Smtp-Source: APXvYqwSmpxDCyhHfUD75QUk0bAalUKkh4Js4HOoD32cDVeI679r/z/SqG12EG7SpSLrmPnjPI/nbQ==
X-Received: by 2002:a62:1846:: with SMTP id 67mr45671734pfy.33.1558144592706; 
 Fri, 17 May 2019 18:56:32 -0700 (PDT)
Received: from localhost (193-116-98-72.tpgi.com.au. [193.116.98.72])
 by smtp.gmail.com with ESMTPSA id b7sm7862122pgq.71.2019.05.17.18.56.30
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 17 May 2019 18:56:31 -0700 (PDT)
Date: Sat, 18 May 2019 11:56:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc/mm/hash: Fix get_region_id() for invalid
 addresses
To: linuxppc-dev@ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20190517132958.22299-1-mpe@ellerman.id.au>
In-Reply-To: <20190517132958.22299-1-mpe@ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1558144540.o3oxh2ygpu.astroid@bobo.none>
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
Cc: aneesh.kumar@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman's on May 17, 2019 11:29 pm:
> From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
>=20
> Accesses by userspace to random addresses outside the user or kernel
> address range will generate an SLB fault. When we handle that fault we
> classify the effective address into several classes, eg. user, kernel
> linear, kernel virtual etc.
>=20
> For addresses that are completely outside of any valid range, we
> should not insert an SLB entry at all, and instead immediately an
> exception.
>=20
> In the past this was handled in two ways. Firstly we would check the
> top nibble of the address (using REGION_ID(ea)) and that would tell us
> if the address was user (0), kernel linear (c), kernel virtual (d), or
> vmemmap (f). If the address didn't match any of these it was invalid.
>=20
> Then for each type of address we would do a secondary check. For the
> user region we check against H_PGTABLE_RANGE, for kernel linear we
> would mask the top nibble of the address and then check the address
> against MAX_PHYSMEM_BITS.
>=20
> As part of commit 0034d395f89d ("powerpc/mm/hash64: Map all the kernel
> regions in the same 0xc range") we replaced REGION_ID() with
> get_region_id() and changed the masking of the top nibble to only mask
> the top two bits, which introduced a bug.
>=20
> Addresses less than (4 << 60) are still handled correctly, they are
> either less than (1 << 60) in which case they are subject to the
> H_PGTABLE_RANGE check, or they are correctly checked against
> MAX_PHYSMEM_BITS.
>=20
> However addresses from (4 << 60) to ((0xc << 60) - 1), are incorrectly
> treated as kernel linear addresses in get_region_id(). Then the top
> two bits are cleared by EA_MASK in slb_allocate_kernel() and the
> address is checked against MAX_PHYSMEM_BITS, which it passes due to
> the masking. The end result is we incorrectly insert SLB entries for
> those addresses.
>=20
> That is not actually catastrophic, having inserted the SLB entry we
> will then go on to take a page fault for the address and at that point
> we detect the problem and report it as a bad fault.
>=20
> Still we should not be inserting those entries, or treating them as
> kernel linear addresses in the first place. So fix get_region_id() to
> detect addresses in that range and return an invalid region id, which
> we cause use to not insert an SLB entry and directly report an
> exception.
>=20
> Fixes: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in th=
e same 0xc range")
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> [mpe: Drop change to EA_MASK for now, rewrite change log]
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Looks good to me.

> ---
>  arch/powerpc/include/asm/book3s/64/hash.h | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> v2: Drop change to EA_MASK for now, rewrite change log.
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/inc=
lude/asm/book3s/64/hash.h
> index 5486087e64ea..2781ebf6add4 100644
> --- a/arch/powerpc/include/asm/book3s/64/hash.h
> +++ b/arch/powerpc/include/asm/book3s/64/hash.h
> @@ -93,6 +93,7 @@
>  #define VMALLOC_REGION_ID	NON_LINEAR_REGION_ID(H_VMALLOC_START)
>  #define IO_REGION_ID		NON_LINEAR_REGION_ID(H_KERN_IO_START)
>  #define VMEMMAP_REGION_ID	NON_LINEAR_REGION_ID(H_VMEMMAP_START)
> +#define INVALID_REGION_ID	(VMEMMAP_REGION_ID + 1)
> =20
>  /*
>   * Defines the address of the vmemap area, in its own region on
> @@ -119,6 +120,9 @@ static inline int get_region_id(unsigned long ea)
>  	if (id =3D=3D 0)
>  		return USER_REGION_ID;
> =20
> +	if (id !=3D (PAGE_OFFSET >> 60))
> +		return INVALID_REGION_ID;
> +
>  	if (ea < H_KERN_VIRT_START)
>  		return LINEAR_MAP_REGION_ID;
> =20
> --=20
> 2.20.1
>=20
>=20
=
