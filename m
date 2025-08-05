Return-Path: <linuxppc-dev+bounces-10629-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57403B1AD3D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Aug 2025 06:49:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bx1Dm3j1Nz3bh6;
	Tue,  5 Aug 2025 14:49:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a02:c206:3008:6895::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754369384;
	cv=none; b=lM6/412cuYVituLWCM/cxpYUSL+1oY6c0YWVvPO0z/MqnlJc9zIA+/a7Q+VgwbnMST7yuueHczrdmCrJojl1BI9ALE31WwNuDmLWyOlMZQHrwLllUWUdlwUJAqFPcIzmGv5yW9p5uJib/4t8U6CAeIGu0+h6gG3G91qr5xGwDYm/a/7IdJBkXk1JwNiq73fVONAsAeV/yqvW37DezK9I4tdv+l0KFNGyxxIczlzRaXL02VcagmE+EWockfcYGQL6HClV/fyxxgmjsuEkm63tByYMmiaPo7MpfMP1RLkec7ZqrhNIDOcjFIhNb6a0QLGo2oUXysIZU49x+qXWW8bHPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754369384; c=relaxed/relaxed;
	bh=xQmQNawCVfEboJUANW5lD+Mh2Nvp/d8uj1ElIiEakAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SLA5E1htoMBPSNL2Kphdpb1zKLSxesjsUm4FIXniaFfsI3NO1LeoxvCC/4QRXgDr+tVkOQbfUNeo+aksZWv2lxeI2jZwl/b6byenlmkHkhOZz/+SwyGXYHwlECu7lNxpFfU6Hxw2Fv/ntuerAxEPSqrQgmRxZgiduV/5LcAUCuHt2r7NQCuYJXMWh99PkSt6eAtZ4c4QCJFhtj2y+/EK6citrCfjCYWYGX9L1U940ywQqQUd//ZeJacgbXcXm1AjTSkkHkaC9K/WAwwJ5EE7nhd9J9t/c9ghwQAOp7DBRr8TCDo/s07ETISBiaKY2cBmzBix18/rEO9NToTh0/kD6w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de; spf=pass (client-ip=2a02:c206:3008:6895::1; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org) smtp.mailfrom=hogyros.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=hogyros.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=hogyros.de (client-ip=2a02:c206:3008:6895::1; helo=psionic.psi5.com; envelope-from=simon.richter@hogyros.de; receiver=lists.ozlabs.org)
Received: from psionic.psi5.com (psionic.psi5.com [IPv6:2a02:c206:3008:6895::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bx1Dl4B7Kz2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 14:49:41 +1000 (AEST)
Received: from [IPV6:2400:2410:b120:f200:a1f3:73da:3a04:160d] (unknown [IPv6:2400:2410:b120:f200:a1f3:73da:3a04:160d])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by psionic.psi5.com (Postfix) with ESMTPSA id 8DD1B3F1DF;
	Tue,  5 Aug 2025 06:49:34 +0200 (CEST)
Message-ID: <913e23f9-d039-4de1-a0d3-d1067dcda8ac@hogyros.de>
Date: Tue, 5 Aug 2025 13:49:31 +0900
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
User-Agent: Mozilla Thunderbird
Subject: Crypto use cases (was: Remove PowerPC optimized MD5 code)
To: Eric Biggers <ebiggers@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org,
 Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
References: <20250803204433.75703-1-ebiggers@kernel.org>
 <20250803204433.75703-4-ebiggers@kernel.org>
 <593b6997-9da4-439c-ba82-84e8bb2ed980@csgroup.eu>
 <20250804180923.GA54248@google.com>
 <187412bd-3ae0-4fe8-b526-f96af6bea6dc@csgroup.eu>
 <20250804225901.GC54248@google.com>
Content-Language: en-US
From: Simon Richter <Simon.Richter@hogyros.de>
In-Reply-To: <20250804225901.GC54248@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=2.3 required=3.0 tests=SPF_HELO_NONE,SPF_PASS,
	TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On 8/5/25 07:59, Eric Biggers wrote:

>> md5sum uses the kernel's MD5 code:

> What?  That's crazy.  Userspace MD5 code would be faster and more
> reliable.  No need to make syscalls, transfer data to and from the
> kernel, have an external dependency, etc.  Is this the coreutils md5sum?
> We need to get this reported and fixed.

The userspace API allows zero-copy transfers from userspace, and AFAIK 
also directly operating on files without ever transferring the data to 
userspace (so we save one copy).

Userspace requests are also where the asynchronous hardware offload 
units get to chomp on large blocks of data while the CPU is doing 
something else:

$ time dd if=test.bin of=/dev/zero bs=1G     # warm up caches
real    0m1.541s
user    0m0.000s
sys     0m0.732s

$ time gzip -9 <test.bin >test.bin.gz        # compress with the CPU
real    2m57.789s
user    2m55.986s
sys     0m1.508s

$ time ./gzfht_test test.bin                 # compress with NEST unit
real    0m3.207s
user    0m0.584s
sys     0m2.487s

$ time gzip -d <test.bin.nx.gz >test.bin.nx  # decompress with CPU
real    1m0.103s
user    0m57.990s
sys     0m1.878s

$ time ./gunz_test test.bin.gz               # decompress with NEST unit
real    0m2.722s
user    0m0.200s
sys     0m1.872s

That's why I'm objecting to measuring the general usefulness of hardware 
crypto units by the standards of fscrypt, which has an artificial 
limitation of never submitting blocks larger than 4kB: there are other 
use cases that don't have that limitation, and where the overhead is 
negligible because it is incurred only once for a few gigabytes of data.

That's why I suggested changing from a priority field to "speed" and 
"overhead" fields, and calculate priority for each application as 
(size/speed+overhead) -- smallest number wins, size is what the 
application expects to use as the typical request size (which for 
fscrypt and IPsec is on the small side, so it would always select the 
CPU unless there was a low-overhead offload engine available)

This probably needs some adjustment to allow selecting a low-power 
implementation (e.g. on mobile, I'd want to use offloading for fscrypt 
even if it is slower), and model request batching which reduces the 
overhead in a busy system, but it should be a good start.

    Simon

