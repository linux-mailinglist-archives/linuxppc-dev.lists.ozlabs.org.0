Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3DFD3D9F68
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 10:23:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gb3TP5Ctvz3cX4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 18:23:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=molgen.mpg.de (client-ip=141.14.17.11; helo=mx1.molgen.mpg.de;
 envelope-from=pmenzel@molgen.mpg.de; receiver=<UNKNOWN>)
Received: from mx1.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gb3T00p8xz2ykQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 18:23:31 +1000 (AEST)
Received: from [192.168.0.2] (ip5f5aeda3.dynamic.kabel-deutschland.de
 [95.90.237.163])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: pmenzel)
 by mx.molgen.mpg.de (Postfix) with ESMTPSA id DF02661E64760;
 Thu, 29 Jul 2021 10:23:25 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: clang/ld.lld build fails with `can't create dynamic relocation
 R_PPC64_ADDR64 against local symbol in readonly segment`
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
Message-ID: <b647b710-7ae0-3c7e-6996-92ac974b3b2a@molgen.mpg.de>
Date: Thu, 29 Jul 2021 10:23:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Derek Parker <parkerderek86@gmail.com>, Dmitrii Okunev <xaionaro@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dear Linux folks,


I just wanted to make you aware that building Linux for ppc64le with 
clang/lld.ld fails with [1]:

     ld.lld: error: can't create dynamic relocation R_PPC64_ADDR64 
against symbol: empty_zero_page in readonly segment; recompile object 
files with -fPIC or pass '-Wl,-z,notext' to allow text relocations in 
the output
     >>> defined in arch/powerpc/kernel/head_64.o
     >>> referenced by 
arch/powerpc/kernel/head_64.o:(___ksymtab+empty_zero_page+0x0)

The patch below from one of the comments [2] fixes it.

--- i/arch/powerpc/Makefile
+++ w/arch/powerpc/Makefile
@@ -122,7 +122,7 @@ cflags-$(CONFIG_STACKPROTECTOR)     += 
-mstack-protector-guard-reg=r2
  endif

  LDFLAGS_vmlinux-y := -Bstatic
-LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
+LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie -z notext
  LDFLAGS_vmlinux        := $(LDFLAGS_vmlinux-y)
  LDFLAGS_vmlinux += $(call ld-option,--orphan-handling=warn)


Kind regards,

Paul


[1]: https://github.com/ClangBuiltLinux/linux/issues/811
[2]: 
https://github.com/ClangBuiltLinux/linux/issues/811#issuecomment-568316320
