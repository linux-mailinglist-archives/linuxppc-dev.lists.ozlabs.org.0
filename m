Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BED4238864F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 07:01:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FlLLy5W89z30Cn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 May 2021 15:01:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Nwmr/n+u;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52b;
 helo=mail-pg1-x52b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Nwmr/n+u; dkim-atps=neutral
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FlLLS6VmWz2xvF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 May 2021 15:01:19 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id y32so8575298pga.11
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 22:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=esnhAa6zxT8tZsaixbuTSr+w0I6APKP+rmmO7EtAWv8=;
 b=Nwmr/n+uZ+qIVnNcGfFrwhhAiHAr4FxT9EBnK3cxa7KO+Ne3CBxUItj4lbX/egY6In
 XnT8HOLih6Z0kqPzx6lbFw3AihXuE3g1UUuSEKFoNJucJrfbmVX/QyFJgZU5sVUdUx9f
 GEZ9NV76PX4k+eZpjBlEaZsKCOFK4taOBuCeqQQ8L0q/ey3abVbuWJHFH4I5SKDM9zTP
 ENzgzoSNsmgM+qKso3YNJWneeO8bPLO9AXUno7lxcbEZh06+pel3sxPYwhE+0Es5NUrX
 XnHin1HPVJOv1AKHB0IQFhU5yOuVIwj7Rqok6QD93uCURq2OXAILT22bTLkmb4HJri3P
 hT2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=esnhAa6zxT8tZsaixbuTSr+w0I6APKP+rmmO7EtAWv8=;
 b=DI/eankrj1/qiN5s7Fcb2yEHMpdvSHX2KZsxvZXcstAS5Ib1IQnGPmhfeDdJI9TkxM
 jYRqCJn8At0ogboyNw0Ui8Gro4wD0Uw/56013eC8dVZYajO6Le39lK2IFlc2p6858Acz
 E3nC3rdDPjvFMzQV49BGt+LQjktXEHMN1m4dIofeMKWox5J1b96gNGA79PDYhHN4zzGH
 MtMXQODrtDaJUKd2Xpu7gmM0IGi+Pn3CJevaPnoblSpoLxxZmbUNhBmPccRODUaUg3ns
 IredzhuvbSHNI/VgaQ+7thRxCpl03VaF1WIIVdrWwqGf1gwORMhTKCWNmwmms8yZtdlR
 9QAg==
X-Gm-Message-State: AOAM530Qx+wcThhxA9MwanfvdQhM1tbmXCi5MOQh5EupcL/qd97r9DLq
 vsiVtN+jcxcOpnIBm6gUokw=
X-Google-Smtp-Source: ABdhPJyxD/YfxWVyE3DDoF4YolxhuSLaZtlKUGtlNvp/sulWv5s9PfeXY/SVs3u/C7ewBdu/bBIG1g==
X-Received: by 2002:a63:5641:: with SMTP id g1mr6412836pgm.351.1621400477693; 
 Tue, 18 May 2021 22:01:17 -0700 (PDT)
Received: from localhost (14-201-155-8.tpgi.com.au. [14.201.155.8])
 by smtp.gmail.com with ESMTPSA id i7sm5092172pgv.93.2021.05.18.22.01.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 22:01:17 -0700 (PDT)
Date: Wed, 19 May 2021 15:01:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: Linux powerpc new system call instruction and ABI
To: "Dmitry V. Levin" <ldv@altlinux.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <20200611081203.995112-1-npiggin@gmail.com>
 <20210518231331.GA8464@altlinux.org>
 <1621385544.nttlk5qugb.astroid@bobo.none>
In-Reply-To: <1621385544.nttlk5qugb.astroid@bobo.none>
MIME-Version: 1.0
Message-Id: <1621400263.gf0mbqhkrf.astroid@bobo.none>
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
 linux-api@vger.kernel.org, musl@lists.openwall.com, libc-dev@lists.llvm.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Nicholas Piggin's message of May 19, 2021 12:50 pm:
> Excerpts from Dmitry V. Levin's message of May 19, 2021 9:13 am:
>> Hi,
>>=20
>> On Thu, Jun 11, 2020 at 06:12:01PM +1000, Nicholas Piggin wrote:
>> [...]
>>> - Error handling: The consensus among kernel, glibc, and musl is to mov=
e to
>>>   using negative return values in r3 rather than CR0[SO]=3D1 to indicat=
e error,
>>>   which matches most other architectures, and is closer to a function c=
all.
>>=20
>> Apparently, the patchset merged by commit v5.9-rc1~100^2~164 was
>> incomplete: all functions defined in arch/powerpc/include/asm/ptrace.h a=
nd
>> arch/powerpc/include/asm/syscall.h that use ccr are broken when scv is u=
sed.
>> This includes syscall_get_error() and all its users including
>> PTRACE_GET_SYSCALL_INFO API, which in turn makes strace unusable
>> when scv is used.
>>=20
>> See also https://bugzilla.redhat.com/1929836
>=20
> I see, thanks. Using latest strace from github.com, the attached kernel
> patch makes strace -k check results a lot greener.
>=20
> Some of the remaining failing tests look like this (I didn't look at all
> of them yet):
>=20
> signal(SIGUSR1, 0xfacefeeddeadbeef)     =3D 0 (SIG_DFL)
> write(1, "signal(SIGUSR1, 0xfacefeeddeadbe"..., 50signal(SIGUSR1, 0xfacef=
eeddeadbeef) =3D 0 (SIG_DFL)
> ) =3D 50
> signal(SIGUSR1, SIG_IGN)                =3D 0xfacefeeddeadbeef
> write(2, "errno2name.c:461: unknown errno "..., 41errno2name.c:461: unkno=
wn errno 559038737) =3D 41
> write(2, ": Unknown error 559038737\n", 26: Unknown error 559038737
> ) =3D 26
> exit_group(1)                           =3D ?
>=20
> I think the problem is glibc testing for -ve, but it should be comparing
> against -4095 (+cc Matheus)
>=20
>   #define RET_SCV \
>       cmpdi r3,0; \
>       bgelr+; \
>       neg r3,r3;

This glibc patch at least gets that signal test working. Haven't run the=20
full suite yet because of trouble making it work with a local glibc
install...

Thanks,
Nick

---

diff --git a/sysdeps/powerpc/powerpc64/sysdep.h b/sysdeps/powerpc/powerpc64=
/sysdep.h
index c57bb1c05d..1ea4c3b917 100644
--- a/sysdeps/powerpc/powerpc64/sysdep.h
+++ b/sysdeps/powerpc/powerpc64/sysdep.h
@@ -398,8 +398,9 @@ LT_LABELSUFFIX(name,_name_end): ; \
 #endif
=20
 #define RET_SCV \
-    cmpdi r3,0; \
-    bgelr+; \
+    li r9,-4095; \
+    cmpld r3,r9; \
+    bltlr+; \
     neg r3,r3;
=20
 #define RET_SC \
