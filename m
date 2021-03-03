Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB4F32BBB2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Mar 2021 22:31:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DrRy75g4Wz3d3r
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 08:31:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DrRxp563Mz30Ng
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 08:30:51 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DrRxd2k33z9ttBL;
 Wed,  3 Mar 2021 22:30:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EOp0jFdqMqTs; Wed,  3 Mar 2021 22:30:45 +0100 (CET)
Received: from vm-hermes.si.c-s.fr (vm-hermes.si.c-s.fr [192.168.25.253])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DrRxd0kG9z9ttRk;
 Wed,  3 Mar 2021 22:30:45 +0100 (CET)
Received: by vm-hermes.si.c-s.fr (Postfix, from userid 33)
 id 6B58D65A; Wed,  3 Mar 2021 22:33:58 +0100 (CET)
Received: from 37.173.125.231 ([37.173.125.231]) by messagerie.c-s.fr (Horde
 Framework) with HTTP; Wed, 03 Mar 2021 22:33:58 +0100
Date: Wed, 03 Mar 2021 22:33:58 +0100
Message-ID: <20210303223358.Horde.OAg4JN_IZgwz7hkYuMwiTg3@messagerie.c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: maqiang <maqianga@uniontech.com>
Subject: Re: [PATCH] powerpc: remove redundant space
In-Reply-To: <20210303115710.30886-1-maqianga@uniontech.com>
User-Agent: Internet Messaging Program (IMP) H5 (6.2.3)
Content-Type: text/plain; charset=UTF-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

maqiang <maqianga@uniontech.com> a =C3=A9crit=C2=A0:

> These one line of code don't meet the kernel coding style,
> so remove the redundant space.

There seems to be several other style issues in this function and in=20=20
the=20following one too. You should fix them all at once I think.


>
> Signed-off-by: maqiang <maqianga@uniontech.com>
> ---
>  arch/powerpc/kernel/syscalls.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscall=
s.c
> index 078608ec2e92..9248288752d5 100644
> --- a/arch/powerpc/kernel/syscalls.c
> +++ b/arch/powerpc/kernel/syscalls.c
> @@ -81,7 +81,7 @@ SYSCALL_DEFINE6(mmap, unsigned long, addr, size_t, len,
>  int
>  ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set=20=20
>=20__user *exp, struct __kernel_old_timeval __user *tvp)
>  {
> -	if ( (unsigned long)n >=3D 4096 )
> +	if ((unsigned long)n >=3D 4096)
>  	{
>  		unsigned long __user *buffer =3D (unsigned long __user *)n;
>  		if (!access_ok(buffer, 5*sizeof(unsigned long))
> --
> 2.20.1


