Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C793E283B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 12:10:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gh1SL0rJvz3dD9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Aug 2021 20:10:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Zctwj8I3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Zctwj8I3; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gh1Rs0tQvz30FD
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Aug 2021 20:09:44 +1000 (AEST)
Received: by mail-pl1-x636.google.com with SMTP id c16so6412184plh.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Aug 2021 03:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Qo8+DXARQmZvi0+oDjqz884CmgevIsmESsdKCqREcgM=;
 b=Zctwj8I3SU5NOmdoMrreDhqJ60J3O8nmSt9U2VRjjHFQ4bsj18C4fT4+h9MOWP8Ra2
 9fRPdwtlloa2tO16VTzdu3d/OD3moBoLGHxMDhD+kCvEli+TVGQnTg1YsE4mkCigBZqk
 OJCZhRKkx2l6KIX70Nykw0D5EX82/6MQ3mzr6aAaerYqmVeIORsV9cMmGN43tMlU7wWB
 vhbkUi9pWgRPCxpwScLLZ8BB1QUNxeq+HjsxKautSEJgTheA83Ivtjm+FtR2z5d2HTX0
 ioFkMb2mXsubwxWW8/2ib1CkkCNaJj+MuqUi+IE4DoCrHJcsHnjGyD7JaGpuPUcocW4g
 9GgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Qo8+DXARQmZvi0+oDjqz884CmgevIsmESsdKCqREcgM=;
 b=MmGIGG9+THtfgWnNb0J2XjAm4+rvpWH2KcaLF7d/rm8EHCJ5HM6SY1gMRpgzDb5fVj
 K24x8mp88cSNpL7o4S/rv6ubwwPLykQKiMD1J81r6LFT3jomhpzuCwYBU9S9iD6E/qHr
 M2To7TkDWi/HKOWR0UolDRJjxZNq/PU/ZzEqe0RhhrYO1Cb1nCHze5kirLM8OyEqwgIL
 HIB3qsSsLsUD8jS/BCX9vReFJfc8bj1sQJK5JAEHIZQpzOQTVEQYkyzhyfSaI+bsVLfd
 pPXtbRxvKd4D7nLqEF2ly4Sh/fydeyYY+uuWn76Z437vhQfniUIJK7WCiPV3T4ZlzZxQ
 bH0g==
X-Gm-Message-State: AOAM531nmHhXRJBkFcgEal0SojN0dWwFOMWQHHn8FwmGo+JPf8qJ81qh
 4cAo9Ot/8zAm+97adQvM0Ts=
X-Google-Smtp-Source: ABdhPJyStiXqC6J8AG8B7CVFAukaNA0o9kcxJ7ETvnfnz+TAJG9bKKV5IkeLeQ4qByJ2NQw34gINNg==
X-Received: by 2002:a17:90b:802:: with SMTP id
 bk2mr9737611pjb.51.1628244576979; 
 Fri, 06 Aug 2021 03:09:36 -0700 (PDT)
Received: from localhost ([118.210.97.79])
 by smtp.gmail.com with ESMTPSA id f5sm8906820pjo.23.2021.08.06.03.09.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 03:09:36 -0700 (PDT)
Date: Fri, 06 Aug 2021 20:09:31 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 1/3] KVM: PPC: Book3S HV: Fix copy_tofrom_guest routines
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
References: <20210805212616.2641017-1-farosas@linux.ibm.com>
 <20210805212616.2641017-2-farosas@linux.ibm.com>
In-Reply-To: <20210805212616.2641017-2-farosas@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1628244553.dbzjakaq9m.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: christophe.leroy@c-s.fr, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Fabiano Rosas's message of August 6, 2021 7:26 am:
> The __kvmhv_copy_tofrom_guest_radix function was introduced along with
> nested HV guest support. It uses the platform's Radix MMU quadrants to
> provide a nested hypervisor with fast access to its nested guests
> memory (H_COPY_TOFROM_GUEST hypercall). It has also since been added
> as a fast path for the kvmppc_ld/st routines which are used during
> instruction emulation.
>=20
> The commit def0bfdbd603 ("powerpc: use probe_user_read() and
> probe_user_write()") changed the low level copy function from
> raw_copy_from_user to probe_user_read, which adds a check to
> access_ok. In powerpc that is:
>=20
>  static inline bool __access_ok(unsigned long addr, unsigned long size)
>  {
>          return addr < TASK_SIZE_MAX && size <=3D TASK_SIZE_MAX - addr;
>  }
>=20
> and TASK_SIZE_MAX is 0x0010000000000000UL for 64-bit, which means that
> setting the two MSBs of the effective address (which correspond to the
> quadrant) now cause access_ok to reject the access.
>=20
> This was not caught earlier because the most common code path via
> kvmppc_ld/st contains a fallback (kvm_read_guest) that is likely to
> succeed for L1 guests. For nested guests there is no fallback.
>=20
> Another issue is that probe_user_read (now __copy_from_user_nofault)
> does not return the number of bytes not copied in case of failure, so
> the destination memory is not being cleared anymore in
> kvmhv_copy_from_guest_radix:
>=20
>  ret =3D kvmhv_copy_tofrom_guest_radix(vcpu, eaddr, to, NULL, n);
>  if (ret > 0)                            <-- always false!
>          memset(to + (n - ret), 0, ret);
>=20
> This patch fixes both issues by skipping access_ok and open-coding the
> low level __copy_to/from_user_inatomic.
>=20
> Fixes: def0bfdbd603 ("powerpc: use probe_user_read() and probe_user_write=
()")

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_64_mmu_radix.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>=20
> diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/bo=
ok3s_64_mmu_radix.c
> index b5905ae4377c..44eb7b1ef289 100644
> --- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
> +++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
> @@ -65,10 +65,12 @@ unsigned long __kvmhv_copy_tofrom_guest_radix(int lpi=
d, int pid,
>  	}
>  	isync();
> =20
> +	pagefault_disable();
>  	if (is_load)
> -		ret =3D copy_from_user_nofault(to, (const void __user *)from, n);
> +		ret =3D __copy_from_user_inatomic(to, (const void __user *)from, n);
>  	else
> -		ret =3D copy_to_user_nofault((void __user *)to, from, n);
> +		ret =3D __copy_to_user_inatomic((void __user *)to, from, n);
> +	pagefault_enable();
> =20
>  	/* switch the pid first to avoid running host with unallocated pid */
>  	if (quadrant =3D=3D 1 && pid !=3D old_pid)
> --=20
> 2.29.2
>=20
>=20
