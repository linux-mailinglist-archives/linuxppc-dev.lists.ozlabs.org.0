Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C20C539B57
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 04:53:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCYcB6d7sz3bl4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 12:53:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m2EycO58;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030; helo=mail-pj1-x1030.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=m2EycO58;
	dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCYbY04g4z2yMj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 12:52:40 +1000 (AEST)
Received: by mail-pj1-x1030.google.com with SMTP id l7-20020a17090aaa8700b001dd1a5b9965so741276pjq.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 May 2022 19:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=U/LdHjgkKQR9c1pFdxPe1+kCYGuz8uBK8l8SqH25EJM=;
        b=m2EycO58iayRzm1kxcDcgLFV/MdZgoflZpYXSA0ZfhwhxpCTavWaM0gh3j2JZV6W1c
         xL7nRq7aVa+GWYj4en6mQdbEpGGWwW3HL+OAkNfymgnaEBpwXBxMN+l+wiphH832r0LT
         LfNyDitFlnCe5AgSF4v6NNNpy8zJKDZa9e3UqlEPgyviQGXWDvwq5/B6/T/WU+w3KhM9
         ygDP/cDK1ftGXwj9naDxci0M6BeWMBw6A4nIc7SXOq5EtlrHrYe2mFhns8PLgjvIAO2W
         iVjBetYLFw9ZDCdG8/clSe3n27+tzSAnWydXMrxy1XiR9gmzfCEQwvysAGvcjR2rRXGJ
         lWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=U/LdHjgkKQR9c1pFdxPe1+kCYGuz8uBK8l8SqH25EJM=;
        b=MOM/nhV7YIwlLfhB45U+xfSEXtJKWmLLBw+z37Ga5LWyxE2CPtAHljWcQMLjgx0mTM
         SGIor+mgu5Vyy+8E5BcSr6lIMup8flC8eoYJAVQ3XUO6Sw21Y7RGBVMjbcITBNdXRW4t
         I0fgNBbwRLGQySmlXVgjrHI6fcgiqExPkQp9chUdTNCJrxaR/XzzTrO8twR08hDsqFaH
         xMoCvWtPF4h9NhgGcNUkdRUhUg9NgptN8fVhpPud268r3uWYRVk1Uf9hLJVb8ypGk6eW
         TJKaJ0lp9sIKMAXv7z8qc4sh2sqgGix97aWGgIKWPJdO0ehT5JDYuAHOUn1S8+77w6kV
         fzMg==
X-Gm-Message-State: AOAM5339rmznkL3EDBwjzNTAhla5Miol4IjGQ2pwMyWZl+xYjdWDE80X
	DdKUahEcx6wLNfd8+Fl0xw0Bofqpg2W/og==
X-Google-Smtp-Source: ABdhPJw5IjFkfq3yuClWAbbZR66c4eyol+5MN1bA/Z6B327STKtSZf99CoUQ1q12TsI/tLvLh5qWOA==
X-Received: by 2002:a17:902:a981:b0:156:229d:6834 with SMTP id bh1-20020a170902a98100b00156229d6834mr62118025plb.128.1654051957670;
        Tue, 31 May 2022 19:52:37 -0700 (PDT)
Received: from localhost (subs03-180-214-233-86.three.co.id. [180.214.233.86])
        by smtp.gmail.com with ESMTPSA id e12-20020a170902ed8c00b0015e8d4eb278sm225762plj.194.2022.05.31.19.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 May 2022 19:52:36 -0700 (PDT)
Date: Wed, 1 Jun 2022 09:52:32 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: outside array bounds error on ppc64_defconfig, GCC 12.1.0
Message-ID: <YpbUcPrm61RLIiZF@debian.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>, Yang Li <yang.lee@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

I'm trying to verify Drop ppc_inst_as_str() patch on [1] by performing
ppc64_defconfig build with powerpc64-unknown-linux-gnu-gcc (GCC 12.1.0).
The patch is applied on top of powerpc tree, next branch.

I got outside array bounds error:

  CC      arch/powerpc/kernel/dbell.o
In function 'do_byte_reverse',
    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
arch/powerpc/lib/sstep.c:286:25: error: array subscript [3, 4] is outside array bounds of 'union <anonymous>[1]' [-Werror=array-bounds]
  286 |                 up[0] = byterev_8(up[3]);
      |                         ^~~~~~~~~~~~~~~~
arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into object 'u' of size 16
  708 |         } u;
      |           ^
In function 'do_byte_reverse',
    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
arch/powerpc/lib/sstep.c:287:23: error: array subscript [3, 4] is outside array bounds of 'union <anonymous>[1]' [-Werror=array-bounds]
  287 |                 up[3] = tmp;
      |                 ~~~~~~^~~~~
arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into object 'u' of size 16
  708 |         } u;
      |           ^
In function 'do_byte_reverse',
    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
arch/powerpc/lib/sstep.c:288:23: error: array subscript 2 is outside array bounds of 'union <anonymous>[1]' [-Werror=array-bounds]
  288 |                 tmp = byterev_8(up[2]);
      |                       ^~~~~~~~~~~~~~~~
arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into object 'u' of size 16
  708 |         } u;
      |           ^
In function 'do_byte_reverse',
    inlined from 'do_vec_store' at arch/powerpc/lib/sstep.c:722:3,
    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3509:9:
arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside array bounds of 'union <anonymous>[1]' [-Werror=array-bounds]
  289 |                 up[2] = byterev_8(up[1]);
      |                 ~~~~~~^~~~~~~~~~~~~~~~~~
arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into object 'u' of size 16
  708 |         } u;
      |           ^
In function 'do_byte_reverse',
    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
arch/powerpc/lib/sstep.c:286:25: error: array subscript [3, 4] is outside array bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=array-bounds]
  286 |                 up[0] = byterev_8(up[3]);
      |                         ^~~~~~~~~~~~~~~~
arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' of size 16
  681 |         } u = {};
      |           ^
arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' of size 16
arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' of size 16
arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' of size 16
arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' of size 16
In function 'do_byte_reverse',
    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
arch/powerpc/lib/sstep.c:287:23: error: array subscript [3, 4] is outside array bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=array-bounds]
  287 |                 up[3] = tmp;
      |                 ~~~~~~^~~~~
arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' of size 16
  681 |         } u = {};
      |           ^
arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' of size 16
arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' of size 16
arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' of size 16
arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into object 'u' of size 16
In function 'do_byte_reverse',
    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
arch/powerpc/lib/sstep.c:288:23: error: array subscript 2 is outside array bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=array-bounds]
  288 |                 tmp = byterev_8(up[2]);
      |                       ^~~~~~~~~~~~~~~~
arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of size 16
  681 |         } u = {};
      |           ^
arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of size 16
arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of size 16
arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of size 16
arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of size 16
In function 'do_byte_reverse',
    inlined from 'do_vec_load' at arch/powerpc/lib/sstep.c:691:3,
    inlined from 'emulate_loadstore' at arch/powerpc/lib/sstep.c:3438:9:
arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside array bounds of 'u8[16]' {aka 'unsigned char[16]'} [-Werror=array-bounds]
  289 |                 up[2] = byterev_8(up[1]);
      |                 ~~~~~~^~~~~~~~~~~~~~~~~~
arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of size 16
  681 |         } u = {};
      |           ^
arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of size 16
arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of size 16
arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of size 16
arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object 'u' of size 16
  CC      arch/powerpc/kernel/jump_label.o
cc1: all warnings being treated as errors
make[2]: *** [scripts/Makefile.build:271: arch/powerpc/lib/sstep.o] Error 1

These errors above are unrelated to the patch.

[1]: https://lore.kernel.org/linuxppc-dev/20220531065936.3674348-1-mpe@ellerman.id.au/

Thanks.

-- 
An old man doll... just what I always wanted! - Clara
