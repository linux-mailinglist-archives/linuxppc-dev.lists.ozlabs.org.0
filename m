Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9989B46BC27
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Dec 2021 14:06:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J7gY63Q9jz3c8P
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Dec 2021 00:06:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.73; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J7gXf6Ltqz2xXy
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Dec 2021 00:06:10 +1100 (AEDT)
Received: from mail-wr1-f47.google.com ([209.85.221.47]) by
 mrelayeu.kundenserver.de (mreue106 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MVMNF-1n1QH016M3-00SRyH for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Dec
 2021 14:00:57 +0100
Received: by mail-wr1-f47.google.com with SMTP id o13so29246579wrs.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Dec 2021 05:00:56 -0800 (PST)
X-Gm-Message-State: AOAM531Lbg+xCbu8z9/UR/Gp1ECdCO30AQLxfzb14cfaqDPaAN06C/h0
 1p21D1oLdyM0U81utrabrmunvJsddSLDcixMML4=
X-Google-Smtp-Source: ABdhPJxPTZb1NEgHTgiRZ5k7TV56wTLpaTAV0tigTfyAj6yjgVEdlWqbHmbxec81GQE5rsfdo8Evow6Ud4USOVQhzcM=
X-Received: by 2002:a5d:4107:: with SMTP id l7mr50868012wrp.209.1638882056495; 
 Tue, 07 Dec 2021 05:00:56 -0800 (PST)
MIME-Version: 1.0
References: <20211207110228.698956-1-anders.roxell@linaro.org>
In-Reply-To: <20211207110228.698956-1-anders.roxell@linaro.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Dec 2021 14:00:40 +0100
X-Gmail-Original-Message-ID: <CAK8P3a2xJJutbwujzh57QqEAgOUwBz5aT78ZFsSam7TfZuQ_Dg@mail.gmail.com>
Message-ID: <CAK8P3a2xJJutbwujzh57QqEAgOUwBz5aT78ZFsSam7TfZuQ_Dg@mail.gmail.com>
Subject: Re: [PATCH] powerpc: platforms: cell: pervasive: fix clang
 -Wimplicit-fallthrough
To: Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:hEF2dA95KtrAXYgxX9iHiiiPc2TzE9uJKkEfm5eeut2yNnh/fyN
 W5U0AkqB/TTGQbxBqdlCj8D8qN/VwUf74qRQ+fCym3dh3eLoErSjAoH2VQLr31xE16l0WDa
 zaG0WE5Ssm5mp50anLcICBOKWsd9gOIvHMNQTKYuAc6AmfR+ImnXYxJ1aMd8vF4dIRIeyrn
 FqVXBgnNRmZINuIEvrW0g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:MvIe23BErLc=:nP4v4ZXVOlMTfuArqad779
 W7EuFwMD6FUACy67qMatJL/BcwmuoQsLB626UW+uoICxzP/u4MTw8ysbyMAizj+C+++6xXzhT
 WkRRno8cJNS7ykybBlJFhCka5B1R2Kzm8NlsnbnTi1uv/ZJ6mivZMOQ4Z9bqPg/HWrbJX/adf
 OHzloxW1Lrs+eS9RwT3R/uQNiZO6v3tfGZLwyR/qCIXkPAQWfnBtEJqW7lZ1PWHIaw3hiKUx6
 aif2shA5RdfSxPNrXjKmAPt/4TErqkkNZOVuIokWXV0tWpJzrBmSeijIXmi3KEvbcE7d0YRrL
 Kfe1DPCZNSOLB79DM9bnAVfVw4ZZClMGkMBbv4qilI455LeZSUqL5S4+Mkt0wczhLLqDYilUB
 p5y51SRit15gYlQEHFWKrKA9tF9L5JyFDcV9bg5V6JndgMVfXuMmY40313+NFUmJnbnZWCFMO
 9PO+0t0jlb2ZcboOeUFhIlnO1Ey9Wx7e6f/LZRSNY48M/sbgCwrggW/a80P6oQ25mhobVrIqg
 0ns1GeCAvzxIx2BKkkrZnO9xOgCQa0YYG6D6teVLQ9YVAL2L6ypyfLtY0sfWgqzZ1tzk6/Kv2
 UyJKH7KQK60FE7HQ7yFMajcy1JqnJ09AecPq7XI7p24sC9HulTgE+Y/pHyXh21dH3CcD0b3kg
 cr2aUd2lfdT1McXxdaTaNhHb/VNlO2pG1n1RUHeAq+0RKKgmSXFhu8hfz0sOYW0t5Bs0=
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
Cc: Arnd Bergmann <arnd@arndb.de>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Dec 7, 2021 at 12:02 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> Clang warns:
>
> arch/powerpc/platforms/cell/pervasive.c:81:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>         case SRR1_WAKEEE:
>         ^
> arch/powerpc/platforms/cell/pervasive.c:81:2: note: insert 'break;' to avoid fall-through
>         case SRR1_WAKEEE:
>         ^
>         break;
> 1 error generated.
>
> Clang is more pedantic than GCC, which does not warn when failing
> through to a case that is just break or return. Clang's version
> is more in line with the kernel's own stance in deprecated.rst.
> Add athe missing break to silence the warning.
>
> Fixes: 6e83985b0f6e ("powerpc/cbe: Do not process external or decremeter interrupts from sreset")
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>

Thanks for the fix!

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
