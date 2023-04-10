Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 203B46DC6BF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Apr 2023 14:26:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pw7WS5T5Vz3f5W
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Apr 2023 22:26:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O0SyOusV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=masahiroy@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O0SyOusV;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pw7Vc3xJWz3cDt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Apr 2023 22:26:00 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8961961238
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Apr 2023 12:25:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECAEC433EF
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Apr 2023 12:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681129556;
	bh=R51FWEIp18MYl85q3yXscMHpWLTqVf59xo43B5BTt5E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=O0SyOusVQBRKCu7SauLU1y+y0in9KxNntgye6BV+4KjVy6PwS1j1XW9blvPUVLNV+
	 n+aO32Ij0LETQj14DnIIE+brcW1ag2+dqzsu7bgqRXYV2eKFASi0iOzHZkJcQX4gYB
	 BJC6OUWkGzuqV2qSXH19/gcuB7e+1DEALsLhkfv4Tuy6mYcSJLbJouicxWAIdJFk9c
	 V68iTcI/iJZUE/mC4OHPFVmwiexLHY+BWzoKlqwdN2UdyPXCMWTfzoYjSzuaX1DZgw
	 ShHpK1GO+NodW20cOo0/dbyW4M840oCcf8nfB7+FtbcYxtfnKZmzeI17Yujb00rvaG
	 4l4wqN7AEVpXA==
Received: by mail-ot1-f54.google.com with SMTP id 6-20020a9d0106000000b006a177038dfeso15660387otu.7
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Apr 2023 05:25:55 -0700 (PDT)
X-Gm-Message-State: AAQBX9f+wsjOZTUuhoIxp9qJ0T1y9vYQ3E220SRy7LOUW3lriocekCJO
	mhu/NxWSx6ovP5lVEI0zmTgliltjtBPObi4gFZU=
X-Google-Smtp-Source: AKy350bdkwU1ebLGE4JP+fBsICaK+Wcxmukh0nZJBXSPtPXvag5RVEDxxySCY496ivQn3tPbsueq8aLc/K0XaUBOVv8=
X-Received: by 2002:a05:6830:130a:b0:69f:8da4:48d with SMTP id
 p10-20020a056830130a00b0069f8da4048dmr2677577otq.1.1681129555328; Mon, 10 Apr
 2023 05:25:55 -0700 (PDT)
MIME-Version: 1.0
References: <20230406-wundef-thread_shift_booke-v1-1-8deffa4d84f9@kernel.org>
In-Reply-To: <20230406-wundef-thread_shift_booke-v1-1-8deffa4d84f9@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Mon, 10 Apr 2023 21:25:19 +0900
X-Gmail-Original-Message-ID: <CAK7LNATPTw58VfMNQYG1dNvoggS3pa7gVdGDb8W0fgb0XahRZw@mail.gmail.com>
Message-ID: <CAK7LNATPTw58VfMNQYG1dNvoggS3pa7gVdGDb8W0fgb0XahRZw@mail.gmail.com>
Subject: Re: [PATCH] powerpc/32: Include thread_info.h in head_booke.h
To: Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: kernel test robot <lkp@intel.com>, patches@lists.linux.dev, npiggin@gmail.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Apr 7, 2023 at 2:51=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> When building with W=3D1 after commit 80b6093b55e3 ("kbuild: add -Wundef
> to KBUILD_CPPFLAGS for W=3D1 builds"), the following warning occurs.
>
>   In file included from arch/powerpc/kvm/bookehv_interrupts.S:26:
>   arch/powerpc/kvm/../kernel/head_booke.h:20:6: warning: "THREAD_SHIFT" i=
s not defined, evaluates to 0 [-Wundef]
>      20 | #if (THREAD_SHIFT < 15)
>         |      ^~~~~~~~~~~~
>
> THREAD_SHIFT is defined in thread_info.h but it is not directly included
> in head_booke.h, so it is possible for THREAD_SHIFT to be undefined. Add
> the include to ensure that THREAD_SHIFT is always defined.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Link: https://lore.kernel.org/202304050954.yskLdczH-lkp@intel.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---


Reviewed-by: Masahiro Yamada <masahiroy@kernel.org>

Thanks.











>  arch/powerpc/kernel/head_booke.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_=
booke.h
> index 37d43c172676..b6b5b01a173c 100644
> --- a/arch/powerpc/kernel/head_booke.h
> +++ b/arch/powerpc/kernel/head_booke.h
> @@ -5,6 +5,7 @@
>  #include <asm/ptrace.h>        /* for STACK_FRAME_REGS_MARKER */
>  #include <asm/kvm_asm.h>
>  #include <asm/kvm_booke_hv_asm.h>
> +#include <asm/thread_info.h>   /* for THREAD_SHIFT */
>
>  #ifdef __ASSEMBLY__
>
>
> ---
> base-commit: b0bbe5a2915201e3231e788d716d39dc54493b03
> change-id: 20230406-wundef-thread_shift_booke-e08d806ed656
>
> Best regards,
> --
> Nathan Chancellor <nathan@kernel.org>
>







--=20
Best Regards
Masahiro Yamada
