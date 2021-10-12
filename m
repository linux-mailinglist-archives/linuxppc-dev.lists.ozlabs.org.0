Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D91FB429EBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 09:35:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HT6sP2vMzz2ymb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Oct 2021 18:35:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Qiq8iA5U;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::533;
 helo=mail-ed1-x533.google.com; envelope-from=naresh.kamboju@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=Qiq8iA5U; dkim-atps=neutral
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HT6rj1Skjz2yPG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 18:35:14 +1100 (AEDT)
Received: by mail-ed1-x533.google.com with SMTP id d3so49914927edp.3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Oct 2021 00:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0LdgTQXaIMFK90MNm2LnmaoXjv7Xz1qZCtdN0PVVc54=;
 b=Qiq8iA5ULEqujdzoJDRiufJoirupCSn8sZCgDe767gWHWs0sgPrEVPSs6Qg2ThZQzw
 ditUsjX+68E/QYrCxf1k6wkDf4vIBlcWKBbTkz0Mefc9MVMXlQ/euRUbR7ashmrrxrvr
 tggvc0sIY9OUkq1N1QoaWRKBFs5m+XerdEjwnlqgrTnYaA3ImTDG6vnrKY7AbaNgeDCo
 nnP424+10CuNHb7Rp7Q8q8bPFBbjBCUHEWkhIh5sCUj+FYEYoeWXtIqg6i2VX++knvCg
 YC0h09cOVwdX1QBAcjRHmW2dLsGI+e+6JhlJdu8hoIwKjd3CLzpO5fSp9kWh5bDHankt
 MAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0LdgTQXaIMFK90MNm2LnmaoXjv7Xz1qZCtdN0PVVc54=;
 b=tovk5JCiJUBb0lsfwpwsgUeAqi8isWwW+hK2b+qXr3WUhAyFk/JOxv6SB4fbTpIzXk
 8spVfchhGtzi3YDS03jLPg9tZeIxZwfyJverHqZqsLDYMA9L2AHzDJ/ohUG6xx5Hitp5
 vg6kKLje+vWLEJsnHhFLT/wnCIw3N5gYAGDi29t+bjI1MlchXEmv4HiD2b61PseKaWc9
 7TuUWTmp8AYI/mKvd5acFgXWHAPnMxOv3eJb43NRR1ccAzmW+7v4Do41lztapPl+9AiK
 ayPH1Q1aKNeWKndTXR/JM5uEp0dpGWHhGDRcs0P7SsiSACc10nhEK1Yot3cz3Tlf1cWH
 f/Cw==
X-Gm-Message-State: AOAM530lv3JYnkpLnujTG1ZLR5pI91S+TCP3WQ6+TtIXdphqREUQDLq4
 X68XhsWlk980qVLA2o2H5NzklF9bvrpxTFJ5RNRNiw==
X-Google-Smtp-Source: ABdhPJwCt53XHpRv0O60+/zV2VTB2O0ZJQiUr07Ip2Ze2mcCpt8//Lsk0vB2lrIScioA4EveNy3rJQRIEtb4pBNUe50=
X-Received: by 2002:a17:906:c302:: with SMTP id
 s2mr30057500ejz.499.1634024105733; 
 Tue, 12 Oct 2021 00:35:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211012064436.577746139@linuxfoundation.org>
In-Reply-To: <20211012064436.577746139@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 12 Oct 2021 13:04:54 +0530
Message-ID: <CA+G9fYt3vmhvuoFJ6p49DHiFE60oBeWUwuSLrh7vXwr=8_rpfg@mail.gmail.com>
Subject: Re: [PATCH 5.4 00/52] 5.4.153-rc2 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Song Liu <songliubraving@fb.com>, Florian Fainelli <f.fainelli@gmail.com>,
 bpf <bpf@vger.kernel.org>, Johan Almbladh <johan.almbladh@anyfinetworks.com>,
 Pavel Machek <pavel@denx.de>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Jon Hunter <jonathanh@nvidia.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 linux-stable <stable@vger.kernel.org>, patches@kernelci.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 12 Oct 2021 at 12:16, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 5.4.153 release.
> There are 52 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 14 Oct 2021 06:44:25 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-5.4.153-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-5.4.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

stable rc 5.4.153-rc2 Powerpc build failed.

In file included from arch/powerpc/net/bpf_jit64.h:11,
                 from arch/powerpc/net/bpf_jit_comp64.c:19:
arch/powerpc/net/bpf_jit_comp64.c: In function 'bpf_jit_build_body':
arch/powerpc/net/bpf_jit.h:32:9: error: expected expression before 'do'
   32 |         do { if (d) { (d)[idx] = instr; } idx++; } while (0)
      |         ^~
arch/powerpc/net/bpf_jit.h:33:33: note: in expansion of macro 'PLANT_INSTR'
   33 | #define EMIT(instr)             PLANT_INSTR(image, ctx->idx, instr)
      |                                 ^~~~~~~~~~~
arch/powerpc/net/bpf_jit_comp64.c:415:41: note: in expansion of macro 'EMIT'
  415 |                                         EMIT(PPC_LI(dst_reg, 0));
      |                                         ^~~~
arch/powerpc/net/bpf_jit.h:33:33: note: in expansion of macro 'PLANT_INSTR'
   33 | #define EMIT(instr)             PLANT_INSTR(image, ctx->idx, instr)
      |                                 ^~~~~~~~~~~
arch/powerpc/net/bpf_jit.h:41:33: note: in expansion of macro 'EMIT'
   41 | #define PPC_ADDI(d, a, i)       EMIT(PPC_INST_ADDI |
___PPC_RT(d) |           \
      |                                 ^~~~
arch/powerpc/net/bpf_jit.h:44:33: note: in expansion of macro 'PPC_ADDI'
   44 | #define PPC_LI(r, i)            PPC_ADDI(r, 0, i)
      |                                 ^~~~~~~~
arch/powerpc/net/bpf_jit_comp64.c:415:46: note: in expansion of macro 'PPC_LI'
  415 |                                         EMIT(PPC_LI(dst_reg, 0));
      |                                              ^~~~~~
make[3]: *** [scripts/Makefile.build:262:
arch/powerpc/net/bpf_jit_comp64.o] Error 1
make[3]: Target '__build' not remade because of errors.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

-- 
Linaro LKFT
https://lkft.linaro.org
