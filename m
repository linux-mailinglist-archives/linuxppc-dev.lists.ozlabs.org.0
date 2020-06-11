Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C707D1F70A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 00:52:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jfJf0b6nzDqMW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 08:52:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--ndesaulniers.bounces.google.com
 (client-ip=2607:f8b0:4864:20::a49; helo=mail-vk1-xa49.google.com;
 envelope-from=3rlpixgwkdjsi89n5pgid9mnbjjbg9.7jhgdipskk7-89qgdnon.jug56n.jmb@flex--ndesaulniers.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=hb9eprX/; dkim-atps=neutral
Received: from mail-vk1-xa49.google.com (mail-vk1-xa49.google.com
 [IPv6:2607:f8b0:4864:20::a49])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jfH31NgkzDqBc
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 08:51:25 +1000 (AEST)
Received: by mail-vk1-xa49.google.com with SMTP id r194so2035072vkd.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 15:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:reposting
 :subject:from:to:cc;
 bh=dX94irw1MxHKi/T+Vqgi6+rzlQqYZ5xffMiSd9HTX8E=;
 b=hb9eprX/NQb0NjfXwDdXL4gdHj9VYwDvcKChF8jRYDq7m8pNcKDVi4BvYTjvJMzwmY
 mWcRP+kD4e+nATgojsvBAxrDvKFs5qgnhbwEZ0NMnfmDQrEGPnnSHho/kRuIsVhX1VcV
 DPwHeGLoUxsWV/ZsedpqgcbPMV1kATmxi6IPSZGQjMLI1mzC/3/IFoRpqA8P9ujwFYES
 EwJvYCZ3QLpktmgmSXm9X4uLj5jQCj6Kc20pPQQstMq5FJmxOmJbfHIbJICrkyX3vIM+
 XYvM+jCZkSo/TYEnPX8FFqaDGwdYbdy8AIkZkSfiLUdN3XlhMZEsLZ6FQTmWaMdhcwJ2
 tjtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:reposting:subject:from:to:cc;
 bh=dX94irw1MxHKi/T+Vqgi6+rzlQqYZ5xffMiSd9HTX8E=;
 b=q2FqWm6zvXI2yY013yHqUPqmLbLj9Ad6dkK5DpyrhbDNbBNeowVCXa9bkzIUYWWb91
 IGIEbv0k0/on3/wVmZk8P0BJ49q2gQN2GVrrs5+t5rTH9oKTpRxzEDYGGFVjsnsM3d00
 rSUa6FJsCJK64CW9EOyIygLT1jGeHv5WQy34ZQAgFajUEhJ7NSapEHjcJNsEx4rcT2Lf
 QaLfrLeK/sCPmVx+Isnz6ZX1FVgMj5LCaHms7DPZOXGWXFgtZMjiHgLnOx/khIoTOMWz
 vdsOTxiDCMhciKmkKbvP2kQmgQwre/sAFpYVGrMOABKTLoQQH+Y+yT7FCR9HSII0zk66
 r+zQ==
X-Gm-Message-State: AOAM530U3Ux6hy807yceaKjUW8EWDEwG3aKK0gGkeZloGV6bJ1OuqG9l
 akVTU5cUtWVR4RYtywhwyDesnXPYJgYvoObILzU=
X-Google-Smtp-Source: ABdhPJyY2NiOYl3UkCSFzlcFvpmcgCxaRV0h+Tb87x87GdRsIE9XeLhg1e/k47HkNIscElDe6xwLnQ+yGZCFW6DBAb8=
X-Received: by 2002:ad4:43e3:: with SMTP id f3mr9767525qvu.115.1591915436835; 
 Thu, 11 Jun 2020 15:43:56 -0700 (PDT)
Date: Thu, 11 Jun 2020 15:43:55 -0700
In-Reply-To: <49YBKY13Szz9sT4@ozlabs.org>
Message-Id: <20200611224355.71174-1-ndesaulniers@google.com>
Mime-Version: 1.0
References: <49YBKY13Szz9sT4@ozlabs.org>
Reposting: https://groups.google.com/g/clang-built-linux/c/2dGVKSjE5Es
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
Subject: Re: [PATCH v4 1/2] powerpc/uaccess: Implement unsafe_put_user() using
 'asm goto'
From: Nick Desaulniers <ndesaulniers@google.com>
To: patch-notifications@ellerman.id.au, christophe.leroy@c-s.fr, 
 segher@kernel.crashing.org
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 clang-built-linux@googlegroups.com, paulus@samba.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello! It seems this patch broke our ppc32 builds, and we had to
disable them [0]. :(

From what I can tell, though Michael mentioned this was merged on May
29, but our CI of -next was green for ppc32 until June 4, then mainline
went red June 6. So this patch only got 2 days of soak time before the
merge window opened.

A general issue with the -next workflow seems to be that patches get
different amounts of soak time. For higher risk patches like this one,
can I please ask that they be help back a release if close to the merge
window?

Segher, Cristophe, I suspect Clang is missing support for the %L and %U
output templates [1]. I've implemented support for some of these before
in Clang via the documentation at [2], but these seem to be machine
specific? Can you please point me to documentation/unit tests/source for
these so that I can figure out what they should be doing, and look into
implementing them in Clang?

[0] https://github.com/ClangBuiltLinux/continuous-integration/pull/279
[1] https://bugs.llvm.org/show_bug.cgi?id=46186
[2]
https://gcc.gnu.org/onlinedocs/gccint/Output-Template.html#Output-Template
