Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCBB5AFB5E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 06:37:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MMqGl4nYqz3c4B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Sep 2022 14:37:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gkDrDVZd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gkDrDVZd;
	dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MMqG66pBXz2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Sep 2022 14:36:29 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id 65so3192394pfx.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Sep 2022 21:36:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=4FLct00x9EVngCiNgBMX+7R8EGdypSh+ra2sd+aOfyM=;
        b=gkDrDVZdH6aXz+d6SKgjK7/Q4/QTsUEdn8vF9gjtzlxP2KfbIQ+kJ3K8VzyZCykGZc
         ZKhGoojve8uRVTcItuUVUi3o6GuMwyZ+nQNz0AEeF2k4KLulUe70InzBSvwlT0ebU3Kv
         tWlHdnQWx+7AAdlOqwpEoIbNucbq30/1TxYIH4PE05iImqD6qdPx3prvBaRskVmq1rLh
         vYDztG/c0O6zHHkfKjDi1aTV4dSUHKLoDRsjAnh3jHicXwW5bbKw4cq+ceyeJ5Hzicaf
         P+HJxYgEgapri3rY3OvE7OpwqIvjmqEAQmzf4BxrFxSiWxa5AJIcybem6U57n/vAtzN+
         zQJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=4FLct00x9EVngCiNgBMX+7R8EGdypSh+ra2sd+aOfyM=;
        b=30Q+9U0WTXf0D2J7E6ox7DC2oJCc0OHLzjSYfSvgNLJn3Sl+Xje1zbK9b7eZqBd+sa
         E034ESmHXeNuohe+rmsbdcqkFEpJAw08MsgtZ873WrBWhyWjLXyihvCad0x+iiS1d7jn
         iIrzbFfp3PNzluZra4EZxnmVg2DWR1Frfw7mn4nhicx/HAA1kr1lyBezICnxptTJskyW
         mPI7YAfLf5qNNhV78r2G/TO2+6IT4AEGk9sWF0Y+QOV5MiDx3leN22zWZXnoP8A0yxWG
         k1cv8Ua1FDdamDtwCg04yeqhtFiSk2AcB1T7h94SgEtegOjpNa+lCgas4S9mCfmnweIj
         /Jyw==
X-Gm-Message-State: ACgBeo3BpFbehni0WhwalvD5ORHNFMx41Wd0jB6NtEm5JWN79UCUGnAM
	r0ZbCOI/bkQADYus1P7GhjM=
X-Google-Smtp-Source: AA6agR6Jm0cQe2ABQUc01VWMmQwJjt/MdWuFI+yQjS5LCa6WrDV+OQgAwLmx0VFP/tT6C9HJ6vbxCg==
X-Received: by 2002:a63:4c50:0:b0:429:983d:22f1 with SMTP id m16-20020a634c50000000b00429983d22f1mr1814861pgl.213.1662525386216;
        Tue, 06 Sep 2022 21:36:26 -0700 (PDT)
Received: from localhost ([124.170.18.239])
        by smtp.gmail.com with ESMTPSA id r1-20020aa79ec1000000b00536fc93b8c8sm11220239pfq.20.2022.09.06.21.36.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 21:36:25 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 07 Sep 2022 14:36:21 +1000
Message-Id: <CMPW28H38HE0.W6BB976O6ULP@bobo>
Subject: Re: [PATCH v2] powerpc/vdso: link with -z noexecstack
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.11.0
References: <b95f2e3216a574837dd61208444e9515c3423da4.1662132312.git.christophe.leroy@csgroup.eu>
In-Reply-To: <b95f2e3216a574837dd61208444e9515c3423da4.1662132312.git.christophe.leroy@csgroup.eu>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat Sep 3, 2022 at 1:25 AM AEST, Christophe Leroy wrote:
> With recent binutils, the following warning appears:
>
>   VDSO32L arch/powerpc/kernel/vdso/vdso32.so.dbg
> /opt/gcc-12.2.0-nolibc/powerpc64-linux/bin/../lib/gcc/powerpc64-linux/12.=
2.0/../../../../powerpc64-linux/bin/ld: warning: arch/powerpc/kernel/vdso/g=
etcpu-32.o: missing .note.GNU-stack section implies executable stack
> /opt/gcc-12.2.0-nolibc/powerpc64-linux/bin/../lib/gcc/powerpc64-linux/12.=
2.0/../../../../powerpc64-linux/bin/ld: NOTE: This behaviour is deprecated =
and will be removed in a future version of the linker
>
> To avoid that, explicitely tell the linker we don't
> want executable stack.
>
> For more explanations, see commit ffcf9c5700e4 ("x86: link vdso
> and boot with -z noexecstack --no-warn-rwx-segments")
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Removed unrelated change in arch/powerpc/kernel/Makefile

Seems okay. Here too, commit 0d362be5b1420 ("Makefile: link with -z
noexecstack --no-warn-rwx-segments"). Core and x86 are using
no-warn-rwx-segments as well, should we have that just to match
too?

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  arch/powerpc/kernel/vdso/Makefile | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kernel/vdso/Makefile b/arch/powerpc/kernel/vdso=
/Makefile
> index 096b0bf1335f..a2e7b0ce5b19 100644
> --- a/arch/powerpc/kernel/vdso/Makefile
> +++ b/arch/powerpc/kernel/vdso/Makefile
> @@ -92,13 +92,13 @@ include/generated/vdso64-offsets.h: $(obj)/vdso64.so.=
dbg FORCE
> =20
>  # actual build commands
>  quiet_cmd_vdso32ld_and_check =3D VDSO32L $@
> -      cmd_vdso32ld_and_check =3D $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@=
 -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) ; $(cmd_vdso_check)
> +      cmd_vdso32ld_and_check =3D $(VDSOCC) $(c_flags) $(CC32FLAGS) -o $@=
 -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_chec=
k)
>  quiet_cmd_vdso32as =3D VDSO32A $@
>        cmd_vdso32as =3D $(VDSOCC) $(a_flags) $(CC32FLAGS) $(AS32FLAGS) -c=
 -o $@ $<
>  quiet_cmd_vdso32cc =3D VDSO32C $@
>        cmd_vdso32cc =3D $(VDSOCC) $(c_flags) $(CC32FLAGS) -c -o $@ $<
> =20
>  quiet_cmd_vdso64ld_and_check =3D VDSO64L $@
> -      cmd_vdso64ld_and_check =3D $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@=
 -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) ; $(cmd_vdso_check)
> +      cmd_vdso64ld_and_check =3D $(VDSOCC) $(c_flags) $(CC64FLAGS) -o $@=
 -Wl,-T$(filter %.lds,$^) $(filter %.o,$^) -z noexecstack ; $(cmd_vdso_chec=
k)
>  quiet_cmd_vdso64as =3D VDSO64A $@
>        cmd_vdso64as =3D $(VDSOCC) $(a_flags) $(CC64FLAGS) $(AS64FLAGS) -c=
 -o $@ $<
> --=20
> 2.37.1

