Return-Path: <linuxppc-dev+bounces-12790-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C1FBD1C22
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 09:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clTK30h7jz2xQ5;
	Mon, 13 Oct 2025 18:20:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760340038;
	cv=none; b=FespkhKVCF9K0WLeu/ljg/MQ6LNmLq83v29cUkU+OJXUHr/bsBIQ8pCEQauOPsigaRvfacjSX7d5+HSYu8XjNxHAu9qjHY5tRHqwT/0kd1dM+bijMcn9nkBhWVCaDFFiI4GA76WbKIqrPLGfnkTqgiBsxLrIlsyphuolxwcUJJo1VHKAKQW9UuA3YyMkoHTBr5gxUmsQ2hb6uPsg2YwfCE6p6rcbgS6uFqosTrztUcQHIxK8Ua/6MPyj5lBPhahildOrGyfQsL02YR0ezIds/hZTdI7bw6iMOBa36TkrndeK2DjJyIgvsnuRbfXZXLno3ohZ+mbUNkb7JebGmGCt1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760340038; c=relaxed/relaxed;
	bh=f9jmxUUcHjm39xdb4Jx1lfpClrd5YCX1tZKKh7nvLTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=gqwiCC7xCrKcHknWxPC0Z1tzXyhl9IrcGK1B8ajXC7IraH/N2VLeckjT7JEY3jyKOgp7BuSliSIfCLVBp0OeLPbGxWac487j4ikZpaiADygMwzo7Z8gBuPZ+8K1BECyZy7m/iQ/SvbrojE7GKWr+9fiKq8vdl9P4fmCKsosazLDPqkH688YYxb6630B187AiXvIk1xG8AN5oR/z51psvZuWVy1VpRMdzd6v0BCkN+3jaDm7H63We7Nsg5Z7uB7+80E9MWdYDbXG8g72ErR/gx/of/Quj8Pihk12M0cwfQiXFVajatLuA/zfxONXef/AZImRgXTHQ7lafVecZUSp67g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clTK159h2z2xMV
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 18:20:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4clSZ12DFtz9sSY;
	Mon, 13 Oct 2025 08:46:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CKvQlxgPN3Yl; Mon, 13 Oct 2025 08:46:49 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4clSZ11Rk0z9sSV;
	Mon, 13 Oct 2025 08:46:49 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2137E8B766;
	Mon, 13 Oct 2025 08:46:49 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id HicaaMKJ6VtM; Mon, 13 Oct 2025 08:46:49 +0200 (CEST)
Received: from [10.25.207.160] (unknown [10.25.207.160])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EAD858B763;
	Mon, 13 Oct 2025 08:46:48 +0200 (CEST)
Message-ID: <2b4a3215-1620-40c9-a00c-ca833ebbb7b6@csgroup.eu>
Date: Mon, 13 Oct 2025 08:46:48 +0200
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
Subject: Re: [PATCH] arch/powerpc: Remove .interp section in vmlinux
To: Vishal Chourasia <vishalc@linux.ibm.com>, christophe.leroy@csgroup.eu,
 maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 Nathan Chancellor <nathan@kernel.org>
References: <eeaf8fd6628a75d19872ab31cf7e7179e2baef5e.1751366959.git.christophe.leroy@csgroup.eu>
 <20251013040148.560439-1-vishalc@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251013040148.560439-1-vishalc@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

+CLANG ppl

Hi,

Le 13/10/2025 à 06:01, Vishal Chourasia a écrit :
> While debugging a ppc64le QEMU guest on an x86_64 host, I observed GDB crashes
> when attempting to attach to the remote target:
> 
> (gdb) target remote :1234
> 
> Investigation revealed that cross-compiling the Linux kernel for ppc64le on an
> x86_64 host using Clang produces a vmlinux binary containing an empty .interp
> section. This empty .interp section is responsible for the GDB crashes.

Which version of CLANG is it ?

> 
> This issue does not occur when:
> - Building for ppc64le target using GCC on x86_64 host
> - Building for ppc64le target using Clang on ppc64le host

Is it the same CLANG version ?

> - Building for ppc64le target using GCC on ppc64le host
> 
> For details refer [1]
> 
> [1] https://sourceware.org/bugzilla/show_bug.cgi?id=33481

Christophe

