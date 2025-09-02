Return-Path: <linuxppc-dev+bounces-11609-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 776F6B3FA66
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 11:30:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGL7v1DdFz2yrg;
	Tue,  2 Sep 2025 19:30:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756805435;
	cv=none; b=As6t49IIBFf5zy/q3JT+ezVey1ZTm/J4b8hOUv6B01zz5MROi9Bf7dV+Sjku/bOOFjSwwDjHCr5WzwrRa9R+QR2Pisvq/5xzHN0RbJ+NucVhOOx1lP1hoihzH9dUK2uyZBTlL+4dMLRfjXrXqXLO/VVIon9V/xyJE8eo59KI2X+4yHowqjrme3aQLxesw7MxpzsiusoVRUxQW9vVAcJ3xSxP2TQRQ7tHGuStG/gQ3e+fUjGhvluVBXnpQ7F8ylfUMQzlD2fTSBkq3rOS2Y2EJeCEHQWu0WvwWez9jTBDbhFxjNLTi5Ze4XcZL4eR+yrKu1rDo99Il4o6vATNuOSjjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756805435; c=relaxed/relaxed;
	bh=D7OKt9F9u3JGw8Hji9kO63gaBin4yVJprAEpigams7g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=otVbLVys5n0dJQhWgiOl33lbtSoeHbGaH5diQ5y4ha15yTxDGZtcChh7Xa48jdk5Xe1ZI3XfI3XUGf9AxmkSlfV546GuTgVXJwZMG9cJ5zu+ZYrAJv+KqbMk2ef2vpdKMnwA02fBXHrdpvr9ftL8RM0On3owfvk/DMN7dhv/e3Bom/8GMJTcqEGtwOT3ufxfTEFWhIiRAfFefnXweNeTU/1qUHLcGb2oXAIw5AMh9Tznd/geVMcF/lLWYlr1Xg7FgjGPKOA8ejEGsnuiEf4c5JsFO3YDcdwe3V75g8iWRPtC6WJrHl84q9cl0d2cgJv8DcHSCZ+O4wZ+11kL6GAKqA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aOyXlH8i; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aOyXlH8i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=naresh.kamboju@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGL7s54Ryz2y06
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 19:30:33 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76e4fc419a9so4988203b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Sep 2025 02:30:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756805431; x=1757410231; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D7OKt9F9u3JGw8Hji9kO63gaBin4yVJprAEpigams7g=;
        b=aOyXlH8if8+fzRnXzVkfw6LuZexSVSFIkTnp3EneAyPDPvsnf4jxGQjYgvIb5Gz9zF
         kCJx+20/GWhKGbVUQZ1KUvCbrmXMNWK7rhEY+fn4+H/WYb0NddbXeLv1m+c8ja2eZ5q+
         V18fXEkniM51J+VLZQunxB/9gmlen82nvhSeb52Y5DjNBCXVSy84td8aGBYEPOlgIf9t
         LjXinUpTpUyrrfaItZXTl5iQ7pmW1eI1uI8+/82H96t5IRxyipMsYwq4W5oIfrwmO3JD
         Eyzlbp1G6vTHIvyEwjfSfWIMDvHe891VFpc2UfMT58dLm23lwkFYd4+yQ/A6GnsZ1Mtc
         OvaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756805431; x=1757410231;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D7OKt9F9u3JGw8Hji9kO63gaBin4yVJprAEpigams7g=;
        b=D2mgu/KOcYgKB24zWEymembrZhdPEiD57t9p7U0v7JDEyIORJ0TxU+4AmWorCw8w5u
         AqnoT6hnS9YgqiTEB/jc3JOV14PlmzcSuk6YP9aaCkA5Hs2P5d4PjXpejfxMLu0ndphK
         1qClAeIkWmgUSMDxirSE+8cGKLQu7mgXINsZLPD2IA6HbCziJtwv2RbWm/hOIvywdkK8
         KqjkEvozPatDlSoif8n8oNMdqyT63Qp1/HdMgoSbi+WM+r/naiu0CCQJJENz64Wtekxy
         OHIwvUSvBn/EyjtyKSv5ql1KbE1V9NlLUS6tE7vBHygs5U7suHFpTukfIp4x78Bp94Yp
         fFDA==
X-Forwarded-Encrypted: i=1; AJvYcCUEZP4+yPqVk7kHg72o3QBZEbIk4q+WOVpwXskGXmtjgTeVHD/i8zK+/U9PODHQQyIDog18V9/dDO3lvZo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxsUwx+p/a2bWyvPDDNSp1ySKckrQNIbw4gVBNXVxlZxTFrwqZW
	I5IzQwAoIatCVH9oh68arYYQtbT46HoBkWTHBQ3OR3SHxRY61bmGAEylZsUv3BnLFWGD9bYU/UV
	iuo1YamyowuKo26hoWJcDqgzme3k5cztfkNEe9HmouQ==
X-Gm-Gg: ASbGncu0osXnK14Wmf0ADMWwtf1acmKg9dfAAjOZt8hvfJBYBtNR3AUGqbyZqYJ6OAh
	88aTaRUSv4p5/nXitpCXhXDVsftdkHXXgBDh8NqbgpHItHM8HDXZzez7YbHO/aZnnOPtqje2wns
	bRZ2eu6a5+pNuXE6Y+trX0Txmefu5rBftpKqqqL2v64wDJcwagMrTeBjLo67IteDvqBc09uz3mh
	ZTS3IwVhHwrxvaH7qH/p6UenCAsWprxcsvxeDNq
X-Google-Smtp-Source: AGHT+IE8Yrx7PIEHWr7GBuT6CR6OOXizH5auPXW+y/+V0FBm3oCtap+/O+brH9ArwbKXJtHKdi5XLNVxxZpQhJ6oyCI=
X-Received: by 2002:a05:6a20:1595:b0:243:d26c:4802 with SMTP id
 adf61e73a8af0-243d6e00a3cmr14965979637.16.1756805430855; Tue, 02 Sep 2025
 02:30:30 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 2 Sep 2025 15:00:19 +0530
X-Gm-Features: Ac12FXx1zyo6Or4T4_OK4vkNL4SKnoNS4plyRwcQt4YbOf4Pp4VblMYRHeLcvTI
Message-ID: <CA+G9fYsgiqTo7t3e36P5cysc+jEX5Fub1quTj+fuKGM8jkxbFA@mail.gmail.com>
Subject: next-20250901 drivers bluetooth bpa10x.c:77:33: error: array type has
 incomplete element type 'struct h4_recv_pkt'
To: linux-bluetooth@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Marcel Holtmann <marcel@holtmann.org>, 
	Calvin Owens <calvin@wbinvd.org>, pmenzel@molgen.mpg.de, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Ben Copeland <benjamin.copeland@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The following build warnings / errors are noticed on powerpc ppc6xx_defconfig
with gcc-13 toolchain running on Linux next-20250901 and next-20250902.

Regression Analysis:
- New regression? yes
- Reproducibility? yes

First seen on next-20250901
Bad: next-20250901 and next-20250902
Good: next-20250829

Build regression: next-20250901 drivers bluetooth bpa10x.c:77:33:
error: array type has incomplete element type 'struct h4_recv_pkt'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Powerpc:
  build:
    * gcc-13-ppc6xx_defconfig
    * gcc-8-ppc6xx_defconfig

Build error:
drivers/bluetooth/bpa10x.c:77:33: error: array type has incomplete
element type 'struct h4_recv_pkt'
   77 | static const struct h4_recv_pkt bpa10x_recv_pkts[] = {
      |                                 ^~~~~~~~~~~~~~~~
drivers/bluetooth/bpa10x.c:78:11: error: 'H4_RECV_ACL' undeclared here
(not in a function)
   78 |         { H4_RECV_ACL,     .recv = hci_recv_frame },
      |           ^~~~~~~~~~~
drivers/bluetooth/bpa10x.c:79:11: error: 'H4_RECV_SCO' undeclared here
(not in a function)
   79 |         { H4_RECV_SCO,     .recv = hci_recv_frame },
      |           ^~~~~~~~~~~
drivers/bluetooth/bpa10x.c:80:11: error: 'H4_RECV_EVENT' undeclared
here (not in a function)
   80 |         { H4_RECV_EVENT,   .recv = hci_recv_frame },
      |           ^~~~~~~~~~~~~
drivers/bluetooth/bpa10x.c: In function 'bpa10x_rx_complete':
drivers/bluetooth/bpa10x.c:99:37: error: implicit declaration of
function 'h4_recv_buf' [-Werror=implicit-function-declaration]
   99 |                 data->rx_skb[idx] = h4_recv_buf(hdev, data->rx_skb[idx],
      |                                     ^~~~~~~~~~~
In file included from include/linux/array_size.h:5,
                 from include/linux/kernel.h:16,
                 from drivers/bluetooth/bpa10x.c:9:
include/linux/compiler.h:197:82: error: expression in static assertion
is not an integer
  197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...)
((int)sizeof(struct {_Static_assert(!(e), msg);}))
      |
                  ^
include/linux/compiler.h:202:33: note: in expansion of macro
'__BUILD_BUG_ON_ZERO_MSG'
  202 | #define __must_be_array(a)
__BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
      |                                 ^~~~~~~~~~~~~~~~~~~~~~~
include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
   11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) +
__must_be_array(arr))
      |
^~~~~~~~~~~~~~~
drivers/bluetooth/bpa10x.c:103:49: note: in expansion of macro 'ARRAY_SIZE'
  103 |
ARRAY_SIZE(bpa10x_recv_pkts));
      |                                                 ^~~~~~~~~~
drivers/bluetooth/bpa10x.c: At top level:
drivers/bluetooth/bpa10x.c:77:33: warning: 'bpa10x_recv_pkts' defined
but not used [-Wunused-variable]
   77 | static const struct h4_recv_pkt bpa10x_recv_pkts[] = {
      |                                 ^~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors


## Source
* Kernel version: 6.17.0-rc4
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git describe: next-20250902
* Git commit: 3db46a82d467bd23d9ebc473d872a865785299d8
* Architectures: powerpc
* Toolchains: gcc-13
* Kconfigs: ppc6xx_defconfig

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250902/testrun/29725581/suite/build/test/gcc-13-ppc6xx_defconfig/log
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250901/log-parser-build-gcc/gcc-compiler-drivers_bluetooth_bpax_c-error-array-type-has-incomplete-element-type-struct-h_recv_pkt/
* Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/328DwMMwNOpSAj0qnRpJavgtz9C
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/328DwMMwNOpSAj0qnRpJavgtz9C/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/328DwMMwNOpSAj0qnRpJavgtz9C/config

--
Linaro LKFT
https://lkft.linaro.org

