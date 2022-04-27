Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 503C0511123
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 08:27:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kp8182n50z3bqL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Apr 2022 16:27:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=QZuSSbCz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635;
 helo=mail-pl1-x635.google.com; envelope-from=bagasdotme@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=QZuSSbCz; dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kp80T1Zbnz2xBf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Apr 2022 16:26:31 +1000 (AEST)
Received: by mail-pl1-x635.google.com with SMTP id h12so715955plf.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Apr 2022 23:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition
 :content-transfer-encoding;
 bh=1bS4Q9BDlM4oKoEfSPn3EHiefcBS79HtqoMdoht7vK0=;
 b=QZuSSbCznjyNlIhqARAeg5mud9WOt9skLpAWVkm2UGhfmIC0Li7mfItET7ZriUPIZb
 3c5By4jupRCP7P28/GarVVxiOwDAncJq/1G5mwk+Wke7T3Scd3uyZhOMqk0JYidzr5sQ
 kx1k5yffxCtLdumT4bDi28Y5ofJfkz1ZlnzZ6JWbNTwci6Vc5aEzaAAKgUxNeRdjC2Nd
 dK+JGPQ88DdMEvgbrRwJR3VfJyzMPbIFwxGnLJAzh8Pef7zmBQMo59EUuVTTg5KQAu6U
 lB/PoCofMrWG9oVNQjwLH13SS1x5lJdX+zJdbxnNYoDbNS0heYJb8nRf+dVHWSvUpegp
 PDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition:content-transfer-encoding;
 bh=1bS4Q9BDlM4oKoEfSPn3EHiefcBS79HtqoMdoht7vK0=;
 b=4MzhcyKOV0vCmgj9AWiwwMFJSzclu3StGjflF9iDrZdiX4r2qTZ3QOJ1ij1Z6zlsU0
 stUxgAXmdgZByyBi7iM+ZkapnCIsRJnUE0vBbv5N5ZiBUIr+UjxwpF1SV1XaAMCizWk/
 tBhrgkHav8J0uc2P9D1x4Rn9urbhUGOcDOGsrsBnUNtozA2SeK09IuJfTmvyO4Dpe3d0
 uPCbhZEg6RVK6cHV3DT+G++liyWdX8LWoh+6VIVKzWKwVm1/o0A/dNcyGob5ecxnQza0
 mlH3hSgYz7Zwfat515ucrmV6iLuXcb3rxHHroeGKd4hY8nVdhMafJ0tzgjevMKAw0pF2
 aKJw==
X-Gm-Message-State: AOAM5313J+egHhr6ixoWvRG10tvQdXyKCDHE9kkdV5zVAWv/GaGkFivy
 mrccN1FcsjENlSGbYQhgbCc=
X-Google-Smtp-Source: ABdhPJwWUEiRdSfDzwKl4HWGWj9HdFQ4dMBWskekMIfPKAtY3AcvDCjrsae0Q889quYNnRqAXe9LSQ==
X-Received: by 2002:a17:902:ea0d:b0:15c:eceb:de38 with SMTP id
 s13-20020a170902ea0d00b0015cecebde38mr19572260plg.37.1651040788382; 
 Tue, 26 Apr 2022 23:26:28 -0700 (PDT)
Received: from localhost (subs28-116-206-12-32.three.co.id. [116.206.12.32])
 by smtp.gmail.com with ESMTPSA id
 p2-20020a634202000000b003a0c6ec24d2sm15003667pga.89.2022.04.26.23.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 23:26:27 -0700 (PDT)
Date: Wed, 27 Apr 2022 13:26:25 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Thiago Jung Bauermann <bauerman@linux.vnet.ibm.com>
Subject: ppc64_defconfig Werror: no previous prototype on
 arch/powerpc/kernel/ftrace.c
Message-ID: <YmjiEUxHaQ6OQV30@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Miguel Ojeda <ojeda@kernel.org>,
 linuxppc-dev@lists.ozlabs.org,
 Luc Van Oostenryck <luc.vanoostenryck@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greetings,

I did ppc64_defconfig build (gcc 11.2.0) on current master at commit
46cf2c613f4b10 ("Merge tag 'pinctrl-v5.18-2'
of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl"),
and it errored out early like this:

  CC      arch/powerpc/kernel/trace/ftrace.o
arch/powerpc/kernel/trace/ftrace.c:978:7: error: no previous prototype for ‘arch_ftrace_match_adjust’ [-Werror=missing-prototypes]
  978 | char *arch_ftrace_match_adjust(char *str, const char *search)
      |       ^~~~~~~~~~~~~~~~~~~~~~~~
  CC      init/init_task.o
cc1: all warnings being treated as errors
make[3]: *** [scripts/Makefile.build:288: arch/powerpc/kernel/trace/ftrace.o] Error 1
make[2]: *** [scripts/Makefile.build:550: arch/powerpc/kernel/trace] Error 2
make[1]: *** [scripts/Makefile.build:550: arch/powerpc/kernel] Error 2
make: *** [Makefile:1834: arch/powerpc] Error 2

The code in question is introduced by commit 7132e2d669bd42 ("ftrace:
Match dot symbols when searching functions on ppc64").

Reported-by: Bagas Sanjaya <bagasdotme@gmail.com>

-- 
An old man doll... just what I always wanted! - Clara
