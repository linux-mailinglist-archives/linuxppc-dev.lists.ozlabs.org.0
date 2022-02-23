Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC8984C0D00
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 08:06:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3RsS2bs3z3bb0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 18:06:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=l2Zv8k2I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=l2Zv8k2I; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3Rrr0Q4tz30DX
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 18:05:45 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id i21so14475473pfd.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 23:05:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=5LC81SARYxdsYS2Ld425RfRTzSP3MtBYAdx/AXz4sZM=;
 b=l2Zv8k2IR8bKgryOWswsYVJfyvzIpg9JDILFsQsVdnumr3PXoK60YCFHT/iy6FHT6w
 UULCuVgqtAAZt/HF8n+5AfVL8BSBZBwA1tgRDxTABeSraNeDsFHI7TcXv1TS3Fj4Z3Lt
 qCsltCVBE7ujUqoZjVm7nmhVrAI/zgyU+wMdMRAalTWMhuD258zjGLbYUm8nIByRTsZb
 mA9/ChHt8BR63t/Tt9Wsc6xxuHkZXQNWfzWRAsxpIAdIg/4KTBxuQRGrJhQkvD7LI0fr
 MbSa1T2UUMdeSHcU3vV8wR1dgOd6Xkc7HR19uWOzEALSstEyAW2x8L2UEDbyP/oIJEMP
 DCaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=5LC81SARYxdsYS2Ld425RfRTzSP3MtBYAdx/AXz4sZM=;
 b=uhy08l24tsapxWOqqSKVHJecROZSGxJtb02V4vEPyNRohSX3qpqC96Uv+fMQyWD/h5
 59u+7b5rnp6WVxPNgJV4tT2S566zVwVQk2qjxuvnWmYLiutTNzZUGWAPkYJu5uo841BG
 CkoLnNduB8X9OSZlSr/Vawq3C0lc07TWjEAnUNDoI8nsVL4b1hPlZVf4GPQ/Klw180hX
 M1RUauu0zxLAV7KcGTaZC09Ic/RmpCTrYmuMhfLKFk/lAG/h153pjDdEj+bnees/FxIp
 Crptlxn6mNP8omZXWn+jzOVkmwVV/noT86hnkczjCVYCclGllUR5BIaogyOKItMkvw0Y
 V2dA==
X-Gm-Message-State: AOAM532Fo0/Sv8B6+WJB1U/p/c2Tzf4gXYm14Bd5/kgqqSW4G/2HzWt9
 Ue2oq9BnNr6fD3dI6L6oNck=
X-Google-Smtp-Source: ABdhPJz2NeO2vXi46SW/nfmFjTJNjakP3E/xWmVk3mLiSdIWAWb1A25FEd/DiSCEA2u9PLbXEnAlUg==
X-Received: by 2002:a63:cc52:0:b0:372:7f35:cf84 with SMTP id
 q18-20020a63cc52000000b003727f35cf84mr22544356pgi.211.1645599943608; 
 Tue, 22 Feb 2022 23:05:43 -0800 (PST)
Received: from localhost (60-240-120-95.tpgi.com.au. [60.240.120.95])
 by smtp.gmail.com with ESMTPSA id
 g21-20020a17090a7d1500b001b968e82819sm1696637pjl.10.2022.02.22.23.05.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 23:05:43 -0800 (PST)
Date: Wed, 23 Feb 2022 17:05:37 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 4/9] powerpc/vas: Return paste instruction failure if
 no active window
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
 <eacf8d7610c4dbc408d76b1ada965eab01b14bd9.camel@linux.ibm.com>
In-Reply-To: <eacf8d7610c4dbc408d76b1ada965eab01b14bd9.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1645599884.mn9fi17enu.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Haren Myneni's message of February 20, 2022 5:58 am:
>=20
> The VAS window may not be active if the system looses credits and
> the NX generates page fault when it receives request on unmap
> paste address.
>=20
> The kernel handles the fault by remap new paste address if the
> window is active again, Otherwise return the paste instruction
> failure if the executed instruction that caused the fault was
> a paste.

Looks good, thanks for fixin the SIGBUS thing, was that my
fault? I vaguely remember writing some of this patch :P

Thanks,
Nick

>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h   |  2 +
>  arch/powerpc/platforms/book3s/vas-api.c | 55 ++++++++++++++++++++++++-
>  2 files changed, 56 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include=
/asm/ppc-opcode.h
> index 9675303b724e..82f1f0041c6f 100644
> --- a/arch/powerpc/include/asm/ppc-opcode.h
> +++ b/arch/powerpc/include/asm/ppc-opcode.h
> @@ -262,6 +262,8 @@
>  #define PPC_INST_MFSPR_PVR		0x7c1f42a6
>  #define PPC_INST_MFSPR_PVR_MASK		0xfc1ffffe
>  #define PPC_INST_MTMSRD			0x7c000164
> +#define PPC_INST_PASTE			0x7c20070d
> +#define PPC_INST_PASTE_MASK		0xfc2007ff
>  #define PPC_INST_POPCNTB		0x7c0000f4
>  #define PPC_INST_POPCNTB_MASK		0xfc0007fe
>  #define PPC_INST_RFEBB			0x4c000124
> diff --git a/arch/powerpc/platforms/book3s/vas-api.c b/arch/powerpc/platf=
orms/book3s/vas-api.c
> index f359e7b2bf90..f3e421511ea6 100644
> --- a/arch/powerpc/platforms/book3s/vas-api.c
> +++ b/arch/powerpc/platforms/book3s/vas-api.c
> @@ -351,6 +351,41 @@ static int coproc_release(struct inode *inode, struc=
t file *fp)
>  	return 0;
>  }
> =20
> +/*
> + * If the executed instruction that caused the fault was a paste, then
> + * clear regs CR0[EQ], advance NIP, and return 0. Else return error code=
.
> + */
> +static int do_fail_paste(void)
> +{
> +	struct pt_regs *regs =3D current->thread.regs;
> +	u32 instword;
> +
> +	if (WARN_ON_ONCE(!regs))
> +		return -EINVAL;
> +
> +	if (WARN_ON_ONCE(!user_mode(regs)))
> +		return -EINVAL;
> +
> +	/*
> +	 * If we couldn't translate the instruction, the driver should
> +	 * return success without handling the fault, it will be retried
> +	 * or the instruction fetch will fault.
> +	 */
> +	if (get_user(instword, (u32 __user *)(regs->nip)))
> +		return -EAGAIN;
> +
> +	/*
> +	 * Not a paste instruction, driver may fail the fault.
> +	 */
> +	if ((instword & PPC_INST_PASTE_MASK) !=3D PPC_INST_PASTE)
> +		return -ENOENT;
> +
> +	regs->ccr &=3D ~0xe0000000;	/* Clear CR0[0-2] to fail paste */
> +	regs_add_return_ip(regs, 4);	/* Emulate the paste */
> +
> +	return 0;
> +}
> +
>  /*
>   * This fault handler is invoked when the core generates page fault on
>   * the paste address. Happens if the kernel closes window in hypervisor
> @@ -408,9 +443,27 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vm=
f)
>  	}
>  	mutex_unlock(&txwin->task_ref.mmap_mutex);
> =20
> -	return VM_FAULT_SIGBUS;
> +	/*
> +	 * Received this fault due to closing the actual window.
> +	 * It can happen during migration or lost credits.
> +	 * Since no mapping, return the paste instruction failure
> +	 * to the user space.
> +	 */
> +	ret =3D do_fail_paste();
> +	/*
> +	 * The user space can retry several times until success (needed
> +	 * for migration) or should fallback to SW compression or
> +	 * manage with the existing open windows if available.
> +	 * Looking at sysfs interface, it can determine whether these
> +	 * failures are coming during migration or core removal:
> +	 * nr_used_credits > nr_total_credits when lost credits
> +	 */
> +	if (!ret || (ret =3D=3D -EAGAIN))
> +		return VM_FAULT_NOPAGE;
> =20
> +	return VM_FAULT_SIGBUS;
>  }
> +
>  static const struct vm_operations_struct vas_vm_ops =3D {
>  	.fault =3D vas_mmap_fault,
>  };
> --=20
> 2.27.0
>=20
>=20
>=20
