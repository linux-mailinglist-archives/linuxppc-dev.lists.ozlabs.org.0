Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E8B389CF9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 07:12:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlyY15txlz2ym4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 15:12:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=SjwGtmcD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e;
 helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=SjwGtmcD; dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlyXb2R6xz2yXk
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 15:12:13 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id
 gb21-20020a17090b0615b029015d1a863a91so4793485pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 22:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=06KbBafvZa4BBa7qjQ5t4Am1mOBvJg6DGbGd+FkhvIo=;
 b=SjwGtmcDH9Dh2Wa3o93Ep2jhjm/8TTVH3xfAVFiHA6HLIlQGDOiUOYPoR9swNmwwWw
 g6Du+E+WtmyC+XMX2QeNWcok8I0Bg+de1cR2bGbKemu5W8oMaa01xnJbtDg1MXQWnZ3v
 2aQzsPgctouIxwwx4Dz90xjR/6o+keoZUfdpSP35DZm2/5t1wcfHxHJ31xXPZ3bBwvef
 1fcmkU7ze/3AdnYCLrFQ+whOzHJaugQ5uJjFmc6t+57ikS88hbUFd1I3LlUZpOPYIDEb
 7zJ9OobpoMMi+DZtlZ1Ba5AHdAike7i8YwmeaDk1Y1Vd8KxARwPJbeMHcLSItvDyqRBX
 ptjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=06KbBafvZa4BBa7qjQ5t4Am1mOBvJg6DGbGd+FkhvIo=;
 b=aUEunkIMuWmAtMHuu5TtYXLBhvEqjNpB2MA5D9d9dSpN3TVGDH3y7k7CRcdkdBm0R/
 HTK7+sAloLatYjuRZuNi7fKkEY6BtZ0ppvpA/c5gvMilW+C7h0PNIGNmlA9fD3RAEUHr
 m3o3F0slTCXTqIodgH03Fv9/AZt2M/KZHCef2gUb4GnIdyApLWfKuPPe2dpJWz9C4Id4
 USwWPqfKN2g/W2UIPUgXQpAxJ8boLFthrmUjVxWk6NcR5ic2zkDZyW1JkKNmi2fysa0P
 ATlNyeodeMKPui8R7u3YfA9Aqsfhcn1NGnb+KPY1nN/t20Fhqpgdwbf48Y5++6g3J+Lz
 d2vw==
X-Gm-Message-State: AOAM531pOfOuIVNzzxOTvQl0ZDpwbp3lzuyuwwzAHj+CbQO75IXPgGxd
 nTZsGR0qwMdmQrEn78QPj2I=
X-Google-Smtp-Source: ABdhPJwolGPVF5FlLMl8HVNpTzFe2D2mSODdHbw80a4ZQL7Y9ldFq6/WktutOjh5f6y7+7kfokjoaA==
X-Received: by 2002:a17:902:db0f:b029:f3:e5f4:87f1 with SMTP id
 m15-20020a170902db0fb02900f3e5f487f1mr3699593plx.26.1621487529004; 
 Wed, 19 May 2021 22:12:09 -0700 (PDT)
Received: from localhost (60-241-27-127.tpgi.com.au. [60.241.27.127])
 by smtp.gmail.com with ESMTPSA id y14sm845730pgl.21.2021.05.19.22.12.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 22:12:08 -0700 (PDT)
Date: Thu, 20 May 2021 15:12:03 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
To: "Dmitry V. Levin" <ldv@altlinux.org>
References: <20210519132656.GA17204@altlinux.org>
 <1621464056.o9t21cquw8.astroid@bobo.none>
 <20210519232726.GA24134@altlinux.org>
 <1621478238.xha1ow4ujh.astroid@bobo.none>
 <20210520030611.GB27081@altlinux.org>
In-Reply-To: <20210520030611.GB27081@altlinux.org>
MIME-Version: 1.0
Message-Id: <1621487263.hkgxyf500s.astroid@bobo.none>
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
Cc: libc-alpha@sourceware.org, Matheus Castanho <msc@linux.ibm.com>,
 musl@lists.openwall.com, linux-api@vger.kernel.org, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Dmitry V. Levin's message of May 20, 2021 1:06 pm:
> On Thu, May 20, 2021 at 12:40:36PM +1000, Nicholas Piggin wrote:
> [...]
>> > Looks like struct pt_regs.trap already contains the information that c=
ould
>> > be used to tell 'sc' from 'scv': if (pt_regs.trap & ~0xf) =3D=3D 0x300=
0, then
>> > it's scv.  Is my reading of arch/powerpc/include/asm/ptrace.h correct?
>>=20
>> Hmm, I think it is. Certainly in the kernel regs struct it is, I had in=20
>> my mind that we put it to 0xc00 when populating the user struct for
>> compatibility, but it seems not. So I guess this would work.
>=20
> OK, can we state that (pt_regs.trap & ~0xf) =3D=3D 0x3000 is a part of th=
e scv
> ABI, so it's not going to change and could be relied upon by userspace?
> Could this be documented in Documentation/powerpc/syscall64-abi.rst,
> please?

Yeah I think we can do that. The kernel doesn't care what is put in the
userspace pt_regs.trap too much so if this is your preferred approach
then I will document it in the ABI.

Thanks,
Nick
