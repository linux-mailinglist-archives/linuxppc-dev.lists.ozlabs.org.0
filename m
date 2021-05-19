Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5AFE3889A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 10:43:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlRGX4f84z3086
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 18:43:16 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=bMvtBjab;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=bMvtBjab; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlRG263Dnz2xv9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 18:42:49 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id
 h20-20020a17090aa894b029015db8f3969eso2430922pjq.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 01:42:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=65fGzdiHYqhXvVbJhIHcIGq1TKdRRhD4v1EI2Qzj/O4=;
 b=bMvtBjabQN3eFsv0N5aOWD4yHdxmHSz2tAvyzebsOfh42lhs0YRzuE9fo2BurrzTy6
 yE5sELMIWjVjxjQQs2IJMy0NtS5JIGMhRdD2QH5zMLH9zFLizEk0zYOVUGxPh64DK/EW
 GAXkCixB0SU3IT3ZoAewXekanzhYWrppbBoDexfyImyL5OqufZhfib3Vz01Wahn3qhBg
 Qv0q0ciR0zlzUorAXTYP2NxVaO/pA5CMWffAMXfu+EIXuQNBI3sGyaLBDPQ/NH5fieVv
 SN0u/0X540RAlmL4nbnFbrD27mY2+Tw/CJhoM1yNFp2y99/0EzrGO3cyUOCea1rlvXZU
 E8uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=65fGzdiHYqhXvVbJhIHcIGq1TKdRRhD4v1EI2Qzj/O4=;
 b=apwVn2bUN2//B7yKtNlASPxcNBcWKn/WuPK1KDr1e2mxbbhsWauDsXbVp/x+50Fiur
 Zm+0vwCzlOcJuYaHs9e0ZDRNmms3hye6eNugs5Dlq5N7hUrEPYZGPFOQKPNj5u+eChrs
 qhd6CAiNX+5EAP0hov06rqiQjibreP+/jzPiKRnXCnpaQ60t5jAq2z5dpzReIEkKzb9a
 5SgVmUQh0YlI0rIzRKcqUraFNbcfYfFf9fZDC2wY2XjGSE72XDv0XWHHGvrRv4ntDQlL
 AEsVu4Re7hVEmAb9rzhDknBfqI7stYPRnmNkvRhHGBEvJ5bLPu2sTQvZGb9zIrBfEpuY
 SnJg==
X-Gm-Message-State: AOAM532S+nflFdYMVxkBIBs4J1EKZwfgwF6GpuBbdJka7DgFW9ugY8yX
 UKqTh21r8ZG7enxpNPrzOzk=
X-Google-Smtp-Source: ABdhPJyzdFSda9iEveEfmRNG4skSZvA4vZ1nhegSlYSuhYx5bmD0VkIKrMZjt/hRsVyA5O6u7V3nmA==
X-Received: by 2002:a17:902:8d83:b029:ef:9dd8:4d9 with SMTP id
 v3-20020a1709028d83b02900ef9dd804d9mr9794872plo.40.1621413766014; 
 Wed, 19 May 2021 01:42:46 -0700 (PDT)
Received: from localhost (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id z24sm7310002pfk.150.2021.05.19.01.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 01:42:45 -0700 (PDT)
Date: Wed, 19 May 2021 18:42:40 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
To: Joakim Tjernlund <Joakim.Tjernlund@infinera.com>, "ldv@altlinux.org"
 <ldv@altlinux.org>, "mpe@ellerman.id.au" <mpe@ellerman.id.au>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <9b5ea7059c5a5d4e9ccccd7d73ce2c66b2203f52.camel@infinera.com>
 <1621410291.c7si38sa9q.astroid@bobo.none>
 <fb9b6a6099855bd00efc6ffe540ccad14dd9a365.camel@infinera.com>
In-Reply-To: <fb9b6a6099855bd00efc6ffe540ccad14dd9a365.camel@infinera.com>
MIME-Version: 1.0
Message-Id: <1621413143.oec64jaci5.astroid@bobo.none>
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
Cc: "libc-dev@lists.llvm.org" <libc-dev@lists.llvm.org>,
 "musl@lists.openwall.com" <musl@lists.openwall.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Joakim Tjernlund's message of May 19, 2021 6:08 pm:
> On Wed, 2021-05-19 at 17:55 +1000, Nicholas Piggin wrote:
>> Excerpts from Joakim Tjernlund's message of May 19, 2021 5:33 pm:
>> > On Wed, 2021-05-19 at 02:13 +0300, Dmitry V. Levin wrote:
>> > > Hi,
>> > >=20
>> > > On Thu, Jun 11, 2020 at 06:12:01PM +1000, Nicholas Piggin wrote:
>> > > [...]
>> > > > - Error handling: The consensus among kernel, glibc, and musl is t=
o move to
>> > > > =C2=A0=C2=A0using negative return values in r3 rather than CR0[SO]=
=3D1 to indicate error,
>> > > > =C2=A0=C2=A0which matches most other architectures, and is closer =
to a function call.
>> >=20
>> > What about syscalls like times(2) which can return -1 without it being=
 an error?
>>=20
>> They do become errors / indistinguishable and have to be dealt with by=20
>> libc or userspace. Which does follow what most architectures do (all=20
>> except ia64, mips, sparc, and powerpc actually).
>>=20
>> Interesting question though, it should have been noted.
>>=20
>> Thanks,
>> Nick
>=20
> I always figured the ppc way was superior. It begs the question if not th=
e other archs should
> change instead?

It is superior in some ways, not enough to be worth being different.

Other archs are unlikely to change because it would be painful for
not much benefit. New system calls just should be made to not return
error numbers. If we ever had a big new version of syscall ABI in
Linux, we can always use another scv vector number for it.

Thanks,
Nick
