Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BE6032DAD1A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 13:27:50 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwHb62FsrzDqJ5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Dec 2020 23:27:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwFs83gYyzDqBs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Dec 2020 22:09:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=R6NAfSEY; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CwFs73L0lz9s0b;
 Tue, 15 Dec 2020 22:09:47 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608030587;
 bh=iDC1JIT52pO2aTQmLPAZjGi2o8oGYwovwLLPEX6BLfc=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=R6NAfSEYK/sox3otBUza4Y0704f0zrvZyl50J9yZynC62DlAQoJIxumNqTh5VUuj4
 wYtBm/SOZ1s2xm8VqvQ+PgUWmt49NeYvI8NgdYoCYz8kik7R+4JacALwuKv8s4ZNDu
 tF3kCIiEEFVuRNzATpHipQ95QoFnlR4Ag1pM+RAjZq7AHoN0cAqnLfcO2RlHtG+9h7
 1Rg2mLap3Q1sJlooQnntqVhHL6tDRd8Ja+5A2MCURiJCD43A4kALtSYxHCZZrM2+c0
 z2OBz4Psj/xqG5r6cYRN+PsHm0mcbaCUm+wahvSz0uyZTUy1VaZEDz7aXw67be6ihl
 V7TE7I28BdPkg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Michael Ellerman <patch-notifications@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH] powerpc/book3s64/kuap: Improve error reporting with KUAP
In-Reply-To: <160756607519.1313423.7828205073526616704.b4-ty@ellerman.id.au>
References: <20201208031539.84878-1-aneesh.kumar@linux.ibm.com>
 <160756607519.1313423.7828205073526616704.b4-ty@ellerman.id.au>
Date: Tue, 15 Dec 2020 22:09:46 +1100
Message-ID: <873607z5ol.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <patch-notifications@ellerman.id.au> writes:
> On Tue, 8 Dec 2020 08:45:39 +0530, Aneesh Kumar K.V wrote:
>> This partially reverts commit eb232b162446 ("powerpc/book3s64/kuap: Improve
>> error reporting with KUAP") and update the fault handler to print
>> 
>> [   55.022514] Kernel attempted to access user page (7e6725b70000) - exploit attempt? (uid: 0)
>> [   55.022528] BUG: Unable to handle kernel data access on read at 0x7e6725b70000
>> [   55.022533] Faulting instruction address: 0xc000000000e8b9bc
>> [   55.022540] Oops: Kernel access of bad area, sig: 11 [#1]
>> ....
>> 
>> [...]
>
> Applied to powerpc/next.
>
> [1/1] powerpc/book3s64/kuap: Improve error reporting with KUAP
>       https://git.kernel.org/powerpc/c/eb232b1624462752dc916d9015b31ecdac0a01f1

This is wrong, the script was confused by two patches with the exact
same subject. See the other mail.

cheers
