Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D51734B4071
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 04:42:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jxqlw36NCz3bVd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 14:42:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=GjevHNLw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1032;
 helo=mail-pj1-x1032.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=GjevHNLw; dkim-atps=neutral
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com
 [IPv6:2607:f8b0:4864:20::1032])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JxqlK1mXbz2xBk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Feb 2022 14:41:32 +1100 (AEDT)
Received: by mail-pj1-x1032.google.com with SMTP id v4so13308827pjh.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 13 Feb 2022 19:41:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=CeGNBUmoFn8AdjaLCcvFk8kLLafcJYd0ylBOL1LVt3w=;
 b=GjevHNLwMIgNQgQYRoZHaZWmy8I9a6MHtB8oMmRgrfk/t1XB9ZIKbf0lvYhiuPgRzW
 ThM6T8J7nRa9eAlYbDM7R5QyVodlGuHOKYZ1QjNDC6tO0zBY1NJZ3lqAYIQuIZhSefxp
 JTda3E1/i8CpCdgkSztvRfenZkUKyMaLAzHV2ZjVZ5d5SszjUzXqHcKVloLW534UHryI
 AYz9GbNt9NqLcKXNPLyJOaF2EL00M1vg4s6UGfRSJXEK0gPOJfpU7Q4r/3nv/0vmyekS
 71VDrZUt3ua6IIGSp2k1krDZts+YTIPti5dvdBSOPbuwpkyOMJnNB420hqoS4wL2hpex
 S+NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=CeGNBUmoFn8AdjaLCcvFk8kLLafcJYd0ylBOL1LVt3w=;
 b=BsuyasvXrhRTl0f+7loxmRQt/FrCEJo2UWpoL8o4RnmGM/MjKEzlg3w27c1h1ritU3
 NzHeC6HWFFQRiVxpLdfSqDKU7ji/CAfte2JcYa5izIxqmSl3ZaZUhtW+Sg06Ur781zX7
 aBebdxsfSEYtgFS0wIj9GEeI+ovJbx+/I47H3kQvkvrockbwekBZr/T7L82Fybfova/+
 n71upwWWG2kQDzBFn+jdHUk2gCjFuGoDdCaiO2bNAYEPP5lEhiMGFdab1apINc8nl5Mk
 InZ8s+TkD94eFmlEYngePDP7FfFEhJhrBYo9XBuiZR9R5ymDNxVUS2mDau+3xAWuuleW
 F+XQ==
X-Gm-Message-State: AOAM530aynTnYzBpoHSXGUV0B429bBe12s5BM+chjuJKMqvIsfKFHjBR
 +wKRKemkhoS/bgnXviX6/Vo=
X-Google-Smtp-Source: ABdhPJyJPdAjDEPz3erc1VkBp5/KvOiZhza4TzdrySBCzJlRUSME1qK3RghQjXpMFmslaO30AyU6Eg==
X-Received: by 2002:a17:90a:8409:: with SMTP id
 j9mr12694837pjn.101.1644810090375; 
 Sun, 13 Feb 2022 19:41:30 -0800 (PST)
Received: from localhost (27-33-251-132.static.tpgi.com.au. [27.33.251.132])
 by smtp.gmail.com with ESMTPSA id d13sm14041652pfj.205.2022.02.13.19.41.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Feb 2022 19:41:30 -0800 (PST)
Date: Mon, 14 Feb 2022 13:41:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 08/10] powerpc/vas: Return paste instruction failure if
 no active window
To: Haren Myneni <haren@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
References: <7d175313528ea7aae20d9141f0efa2e57f44c9f4.camel@linux.ibm.com>
 <854cd12884080c6ac0d21f24502fffed0fae4e8e.camel@linux.ibm.com>
In-Reply-To: <854cd12884080c6ac0d21f24502fffed0fae4e8e.camel@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1644809992.wf4i5w12rf.astroid@bobo.none>
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

Excerpts from Haren Myneni's message of January 22, 2022 5:59 am:
>=20
> The VAS window may not be active if the system looses credits and
> the NX generates page fault when it receives request on unmap
> paste address.
>=20
> The kernel handles the fault by remap new paste address if the
> window is active again, Otherwise return the paste instruction
> failure if the executed instruction that caused the fault was
> a paste.
>=20
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/ppc-opcode.h   |  2 ++
>  arch/powerpc/platforms/book3s/vas-api.c | 47 ++++++++++++++++++++++++-
>  2 files changed, 48 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/powerpc/include/asm/ppc-opcode.h b/arch/powerpc/include=
/asm/ppc-opcode.h
> index efad07081cc0..fe2a69206588 100644
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
> index 5ceba75c13eb..2ffd34bc4032 100644
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

We say this, and yet the caller seems to SIGBUS us on this return
value.

> +
> +	/*
> +	 * Not a paste instruction, driver may fail the fault.
> +	 */
> +	if ((instword & PPC_INST_PASTE_MASK) !=3D PPC_INST_PASTE)
> +		return -ENOENT;
> +
> +	regs->ccr &=3D ~0xe0000000;	/* Clear CR0[0-2] to fail paste */
> +	regs_add_return_ip(regs, 4);	/* Skip the paste */

Maybe instead of 'Skip the paste' the comment should be 'Emulated the=20
paste'.

> +
> +	return 0;
> +}
> +
>  /*
>   * This fault handler is invoked when the VAS/NX generates page fault on
>   * the paste address. Happens if the kernel closes window in hypervisor
> @@ -403,9 +438,19 @@ static vm_fault_t vas_mmap_fault(struct vm_fault *vm=
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
> +	if (!ret)
> +		return VM_FAULT_NOPAGE;

  if (!ret || ret =3D=3D -EAGAIN)

  ?

Thanks,
Nick

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
