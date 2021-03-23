Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C94E6345634
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 04:26:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4Gxq5VgMz30DN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 14:26:55 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oQGAnmzY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=oQGAnmzY; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4GxQ38yjz303P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 14:26:34 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F4GxP55GZz9sVS; Tue, 23 Mar 2021 14:26:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1616469993;
 bh=luoYRjEruzGoNTMcHDnAhPGA47xA6Ulc15Avqfk01J8=;
 h=From:To:Cc:Subject:Date:From;
 b=oQGAnmzY0HjM+Q4yXaMXQfsk3RC4ZPFin2EgXr95lgxi+wrLjPn97PQYJbpu8Ab9Y
 tg345G0Tbhd8heplfvrlZoC34djGfgfZXCw53n2Vg2DjM9d8a/FtyOyNMSVMlYiQG5
 2SKfOJLZMtom/ud90FpGnOs4mXOD+ERmvw87XAbkmsJfhOA7AD7RNS80Cxhoj9Pnkh
 WJU7WG9H/Bcj8vMn+yzd7X1QK9mhdmW9HMLcp50E74FLvdnZ39pdc9yHP0FAVP0HDY
 G+X7TbwVRwG86aq+G4yn+9SztyysL4rEk5xM4jjE1HJb0VkKE2ksD2eeM+/9wwAGqA
 5/U162KNPhlug==
From: Michael Ellerman <mpe@ellerman.id.au>
To: rust-for-linux@vger.kernel.org
Subject: [PATCH 0/4] Rust for Linux for ppc64le
Date: Tue, 23 Mar 2021 14:26:20 +1100
Message-Id: <20210323032624.1039422-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi all,

Here's a first attempt at getting the kernel Rust support building on powerpc.

It's powerpc64le only for now, as that's what I can easily test given the
distros I have installed. Though powerpc and powerpc64 are also Tier 2 platforms
so in theory should work. Supporting those would require something more
complicated than just pointing rustc at arch/$(ARCH)/rust/target.json.

This is based on 832575d934a2 from the Rust-for-Linux tree. Anything newer gives
me errors about symbol name lengths. I figured I'd send this anyway, as it seems
like those errors are probably not powerpc specific.

I'm not sure that all the values in target.json are correct, or required (or if
any are missing), but what I have there seems to work. Would be happy for
someone to scrutinise it though.

Example output:

  # uname -r
  5.12.0-rc3-47689-ge4e12dd7cb75
  # uname -m
  ppc64le
  # modprobe rust_example
   Rust Example (init)
   Am I built-in? false
   Parameters:
     my_bool:    true
     my_i32:     42
     my_str:     default str val
     my_usize:   42
     my_array:   [0, 1]
   Value: 10
   Value: 10
   Large array has length: 514
   modprobe (1589) used greatest stack depth: 6800 bytes left
  # modprobe rust_example_2
   [2] Rust Example (init)
   [2] Am I built-in? false
   [2] Parameters:
   [2]   my_bool:    true
   [2]   my_i32:     42
   [2]   my_str:     default str val
   [2]   my_usize:   42
   [2]   my_array:   [0, 1]
   Large array has length: 1028
   modprobe (1593) used greatest stack depth: 3680 bytes left
  # modprobe rust_example_3
   [3] Rust Example (init)
   [3] Am I built-in? false
   [3] Parameters:
   [3]   my_bool:    true
   [3]   my_i32:     42
   [3]   my_str:     default str val
   [3]   my_usize:   42
   [3]   my_array:   [0, 1]
   Large array has length: 1028
  # modprobe rust_example_4
   [4] Rust Example (init)
   [4] Am I built-in? false
   [4] Parameters:
   [4]   my_bool:    true
   [4]   my_i32:     42
   [4]   my_str:     default str val
   [4]   my_usize:   42
   [4]   my_array:   [0, 1]
   Large array has length: 1028

cheers


Michael Ellerman (4):
  rust: Export symbols in initialized data section
  rust: Add powerpc64 as a 64-bit target_arch in c_types.rs
  powerpc/rust: Add target.json for ppc64le
  rust: Enable for ppc64le

 arch/powerpc/rust/target.json | 30 ++++++++++++++++++++++++++++++
 init/Kconfig                  |  2 +-
 rust/Makefile                 |  2 +-
 rust/kernel/c_types.rs        |  2 +-
 4 files changed, 33 insertions(+), 3 deletions(-)
 create mode 100644 arch/powerpc/rust/target.json


base-commit: 832575d934a2bc5e2fd0aa881d8e6b64bf062fd2
-- 
2.25.1

