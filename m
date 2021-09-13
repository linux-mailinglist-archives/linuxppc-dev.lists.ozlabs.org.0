Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A13E408883
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 11:48:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7MBJ28l4z2ywZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Sep 2021 19:48:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7M9r3dp2z2yHb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 19:48:29 +1000 (AEST)
Received: from [192.168.0.4] (ip5f5aef84.dynamic.kabel-deutschland.de
 [95.90.239.132])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id 7107561E5FE00;
 Mon, 13 Sep 2021 11:48:21 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: LLVM/clang ias build fails with unsupported arguments '-mpower4' and
 '-many' to option 'Wa,'
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Message-ID: <62cc7e62-d072-7b16-8b6c-006f067b1ed7@molgen.mpg.de>
Date: Mon, 13 Sep 2021 11:48:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Derek Parker <parkerderek86@gmail.com>, llvm@lists.linux.dev,
 Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Dmitrii Okunev <xaionaro@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Linux folks,


Building Linux with LLVM’s integrated assembler fails with the error 
below [1].

```
$ ARCH=powerpc CROSS_COMPILE=powerpc64le-linux-gnu- make LLVM=1 
LLVM_IAS=1 -j72 pseries_defconfig arch/powerpc/kernel/vdso32/gettimeofday.o
...
arch/powerpc/kernel/vdso32/gettimeofday.S:72:8: error: unsupported 
directive '.stabs'
.stabs "_restgpr_31_x:F-1",36,0,0,_restgpr_31_x; .globl _restgpr_31_x; 
_restgpr_31_x:
        ^
arch/powerpc/kernel/vdso32/gettimeofday.S:73:8: error: unsupported 
directive '.stabs'
.stabs "_rest32gpr_31_x:F-1",36,0,0,_rest32gpr_31_x; .globl 
_rest32gpr_31_x; _rest32gpr_31_x:
        ^
```

The LLVM developers are not planning on implementing this, as Stab has 
been succeeded by DWARF [2].


Kind regards,

Paul


[1]: https://github.com/ClangBuiltLinux/linux/issues/1418
[2]: https://bugs.llvm.org/show_bug.cgi?id=31134
