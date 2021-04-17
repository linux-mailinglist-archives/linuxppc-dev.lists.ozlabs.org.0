Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B71A9363230
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 22:18:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FN4Cn2LJgz3bTH
	for <lists+linuxppc-dev@lfdr.de>; Sun, 18 Apr 2021 06:18:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=GZSLEoK2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=rdunlap@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=desiato.20200630 header.b=GZSLEoK2; 
 dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FN4CL00d3z2xy1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 18 Apr 2021 06:18:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
 :MIME-Version:Date:Message-ID:Subject:From:Cc:To:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=8Uc7dhzIc/p5Iji54e1aRZ450Xs9Pb7y+6pkjxagzLA=; b=GZSLEoK2gynTCSRjWeTnq3bQeh
 Yh9OLJ4OibIw5oCLBjvsehNiN+S80FKnpFxPhpvu6I12wCe/TM8nob8DjN4oRtEcyQNbBO6hPH7u6
 tO2w/FdELtV770/4v7wwXZES+VALvUOfS4rtbGQ2evjkviQQVgkwWX5tCydtVazMZvRuxfeYvBzkM
 lT/vQjJYKxuBB4L8QEJMdnxsVSScogvk0g2tTny+Zxhp8Y59osuxdDtXnTacrKdSje1zmq8OQ8WSu
 zH72KWE5G4gVLxC4aZQ/XPyOTQTLzt6+CscuugQD39URHof95HKR1iXmFaBrERiSboZ+Y0MeCU5+3
 Y0QAjbYQ==;
Received: from [2601:1c0:6280:3f0::df68]
 by desiato.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
 id 1lXrOG-006AUO-5D; Sat, 17 Apr 2021 20:18:04 +0000
To: PowerPC <linuxppc-dev@lists.ozlabs.org>
From: Randy Dunlap <rdunlap@infradead.org>
Subject: PPC_FPU, ALTIVEC: enable_kernel_fp, put_vr, get_vr
Message-ID: <7107fcae-5c7a-ac94-8d89-326f2cd4cd33@infradead.org>
Date: Sat, 17 Apr 2021 13:17:59 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

kernel test robot reports:

>> drivers/cpufreq/pmac32-cpufreq.c:262:2: error: implicit declaration of function 'enable_kernel_fp' [-Werror,-Wimplicit-function-declaration]
           enable_kernel_fp();
           ^

when
# CONFIG_PPC_FPU is not set
CONFIG_ALTIVEC=y

I see at least one other place that does not handle that
combination well, here:

../arch/powerpc/lib/sstep.c: In function 'do_vec_load':
../arch/powerpc/lib/sstep.c:637:3: error: implicit declaration of function 'put_vr' [-Werror=implicit-function-declaration]
  637 |   put_vr(rn, &u.v);
      |   ^~~~~~
../arch/powerpc/lib/sstep.c: In function 'do_vec_store':
../arch/powerpc/lib/sstep.c:660:3: error: implicit declaration of function 'get_vr'; did you mean 'get_oc'? [-Werror=implicit-function-declaration]
  660 |   get_vr(rn, &u.v);
      |   ^~~~~~


Should the code + Kconfigs/Makefiles handle that kind of
kernel config or should ALTIVEC always mean PPC_FPU as well?

I have patches to fix the build errors with the config as
reported but I don't know if that's the right thing to do...

thanks.
-- 
~Randy

