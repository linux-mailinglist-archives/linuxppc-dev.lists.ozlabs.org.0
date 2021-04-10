Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C96935AE58
	for <lists+linuxppc-dev@lfdr.de>; Sat, 10 Apr 2021 16:30:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FHcqJ2znhz3c9g
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Apr 2021 00:30:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FHcp43tnnz3bVM
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Apr 2021 00:29:32 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FHcp42Vcbz9sWc; Sun, 11 Apr 2021 00:29:32 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <cover.1615398265.git.christophe.leroy@csgroup.eu>
References: <cover.1615398265.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 00/15] powerpc: Cleanup of uaccess.h and adding asm
 goto for get_user()
Message-Id: <161806493038.1467223.3176738134833493844.b4-ty@ellerman.id.au>
Date: Sun, 11 Apr 2021 00:28:50 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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

On Wed, 10 Mar 2021 17:46:39 +0000 (UTC), Christophe Leroy wrote:
> This series cleans up uaccess.h and adds asm goto for get_user()
> 
> v2:
> - Further clean ups
> - asm goto for get_user()
> - Move a few patches unrelated to put_user/get_user into another misc series.
> 
> [...]

Applied to powerpc/next.

[01/15] powerpc/uaccess: Remove __get_user_allowed() and unsafe_op_wrap()
        https://git.kernel.org/powerpc/c/8cdf748d557f15ae6f9e0d4108cc3ea6e1ee4419
[02/15] powerpc/uaccess: Define ___get_user_instr() for ppc32
        https://git.kernel.org/powerpc/c/9bd68dc5d7463cb959bff9ac4b6c7e578171de35
[03/15] powerpc/align: Convert emulate_spe() to user_access_begin
        https://git.kernel.org/powerpc/c/3fa3db32956d74c0784171ae0334685502bb169a
[04/15] powerpc/uaccess: Remove __get/put_user_inatomic()
        https://git.kernel.org/powerpc/c/bad956b8fe1a8b3b634d596ed2023ec30726cdf1
[05/15] powerpc/uaccess: Move get_user_instr helpers in asm/inst.h
        https://git.kernel.org/powerpc/c/35506a3e2d7c4d93cb564e23471a448cbd98f085
[06/15] powerpc/align: Don't use __get_user_instr() on kernel addresses
        https://git.kernel.org/powerpc/c/111631b5e9dae764754657aad00bd6cd1a805d0d
[07/15] powerpc/uaccess: Call might_fault() inconditionaly
        https://git.kernel.org/powerpc/c/ed0d9c66f97c6865e87fa6e3631bbc3919a31ad6
[08/15] powerpc/uaccess: Remove __unsafe_put_user_goto()
        https://git.kernel.org/powerpc/c/be15a165796598cd3929ca9aac56ba5ec69e41c1
[09/15] powerpc/uaccess: Remove __chk_user_ptr() in __get/put_user
        https://git.kernel.org/powerpc/c/028e15616857add3ba4951f989027675370b0e82
[10/15] powerpc/uaccess: Remove calls to __get_user_bad() and __put_user_bad()
        https://git.kernel.org/powerpc/c/9975f852ce1bf041a1a81bf882e29ee7a3b78ca6
[11/15] powerpc/uaccess: Split out __get_user_nocheck()
        https://git.kernel.org/powerpc/c/f904c22f2a9fb09fe705efdedbe4af9a30bdf633
[12/15] powerpc/uaccess: Rename __get/put_user_check/nocheck
        https://git.kernel.org/powerpc/c/17f8c0bc21bbb7d1fe729c7f656924a6ea72079b
[13/15] powerpc/uaccess: Refactor get/put_user() and __get/put_user()
        https://git.kernel.org/powerpc/c/e72fcdb26cde72985c418b39f72ecaa222e1f4d5
[14/15] powerpc/uaccess: Introduce __get_user_size_goto()
        https://git.kernel.org/powerpc/c/035785ab2826beb43cfa65a2df37d60074915a4d
[15/15] powerpc/uaccess: Use asm goto for get_user when compiler supports it
        https://git.kernel.org/powerpc/c/5cd29b1fd3e8f2b45fe6d011588d832417defe31

cheers
