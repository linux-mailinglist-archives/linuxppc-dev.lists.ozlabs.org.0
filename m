Return-Path: <linuxppc-dev+bounces-11616-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A3451B3FE09
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Sep 2025 13:45:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGP755GSGz2y06;
	Tue,  2 Sep 2025 21:45:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=94.231.106.210
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756813505;
	cv=none; b=fNNQKr7O6bw5CrBNs9uYs8zyoLMOKf5atAFdIwcRbImkFbKmIwuPwyZqCuRUghelB0pk3Ksach16YpR1F7xqZcWmRUWs3/rv1wk4B2mZ2UoKNQ+NirfFUVmBLUAthhrJ/tojs1xU+kLkE60iGQDLtfoERwgEHUWhgLsQYHs+H+lOEu2al00FOtMMVtlg20jHf94o6lfL4xLWoCas3kql8G/KqcXAz3FgHIOktwKJ++r7FUL/BUaoy93sSiOCoKMzoINbqUd5tWG5iF10Iqo8g8MqRXKHL3YwIfBhsWyLqAPTS2v+/kWRwfpTqba4c1Qjd/47Puzgm10YtvBFJb4+MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756813505; c=relaxed/relaxed;
	bh=voGobjfJ+JDIyxPuu8fGQb2u9QP7Z513vboXRHjWrpI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AQdOYqyMvZibScSpJw1N6QOVRQnNdtGYkOZF+gdovJaYd7fYBWiPxEplsSgL5gVn5yW9vbvxi30w9TmBE2lh6c26/YCBbe4Fg/TbBfvQw3fOdKuOK2xNPgfVc1JDfzefVzE7w0g/JkgXINoB3Zon6V/9gaayBMbKsF2EVWnpJY+7j4ZJRsZRGktcSoLj9Mq5brhX6B7l9okxn4T1ReWI7y9GXlnATRe96h0wmr5RD5AdjkPWE1shLe4j5XTsTTSAFRI+4KXRfRfTDxQcsyYRy25lNLKqP+RGUIj7CckbsDvjM0BZaL8kF7CEg2myO6hHZ4u4Bc6qONBIsQlU7RASLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com; dkim=fail header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=jXmzEnXa reason="key not found in DNS"; dkim-atps=neutral; spf=pass (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org) smtp.mailfrom=gaisler.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gaisler.com
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="key not found in DNS" header.d=gaisler.com header.i=@gaisler.com header.a=rsa-sha256 header.s=simplycom2 header.b=jXmzEnXa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gaisler.com (client-ip=94.231.106.210; helo=smtp-out3.simply.com; envelope-from=andreas@gaisler.com; receiver=lists.ozlabs.org)
Received: from smtp-out3.simply.com (smtp-out3.simply.com [94.231.106.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGP734qm4z2xQ5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Sep 2025 21:45:02 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp.simply.com (Simply.com) with ESMTP id 4cGP6x6Rpwz1FZPJ;
	Tue,  2 Sep 2025 13:44:57 +0200 (CEST)
Received: from [192.168.0.25] (h-98-128-223-123.NA.cust.bahnhof.se [98.128.223.123])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(Client did not present a certificate)
	by smtp.simply.com (Simply.com) with ESMTPSA id 4cGP6w5mgsz1FXjD;
	Tue,  2 Sep 2025 13:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gaisler.com;
	s=simplycom2; t=1756813497;
	bh=voGobjfJ+JDIyxPuu8fGQb2u9QP7Z513vboXRHjWrpI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=jXmzEnXapdgWj3k2C76LGG7k/5mt1kwvMqAYSfMFYlJ0dMOQ80Oj2YE0pnZAtNJ4t
	 tXQk/LzaZA57Nv160y42KGcSc12HLtx5zDkXLTwO001yujBIUCUp0jXWbSqOup1wEK
	 caelEQWo/j1aiLxV7BPWjSbstlue7ClkuM93YSG2cSzlCJSLWryT6cSw2EEQcr+aVF
	 FTt0lGn6fnMuHg7U0U6sd3U2Ku9tEiPKwlVMzDHUsOHxPUryMAOV1qAvelOgjen0aR
	 RoDQinmHdiIG1eCVLztKOXDNMYphrSPAPE4G8u5ceaF4FDq1DzCH6UTTJUx5w29cc0
	 vZYTj+Lq2QLjQ==
Message-ID: <92bace9a-b5c4-4ea1-a1f7-4742c15a64a0@gaisler.com>
Date: Tue, 2 Sep 2025 13:44:56 +0200
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
Subject: Re: [PATCH v2 3/4] arch: copy_thread: pass clone_flags as u64
To: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Arnd Bergmann <arnd@arndb.de>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-perf-users@vger.kernel.org, apparmor@lists.ubuntu.com,
 selinux@vger.kernel.org, linux-alpha@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-openrisc@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 linux-sh@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org
References: <20250901-nios2-implement-clone3-v2-0-53fcf5577d57@siemens-energy.com>
 <20250901-nios2-implement-clone3-v2-3-53fcf5577d57@siemens-energy.com>
 <f2371539-cd4e-4d70-9576-4bb1c677104c@gaisler.com>
 <11a4d0a953e3a9405177d67f287c69379a2b2f8f.camel@physik.fu-berlin.de>
Content-Language: en-US
From: Andreas Larsson <andreas@gaisler.com>
In-Reply-To: <11a4d0a953e3a9405177d67f287c69379a2b2f8f.camel@physik.fu-berlin.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 2025-09-02 09:15, John Paul Adrian Glaubitz wrote:
>> Thanks for this and for the whole series! Needed foundation for a
>> sparc32 clone3 implementation as well.
> 
> Can you implement clone3 for sparc64 as well?

(heavily pairing down the to list)

We'll take a look at that as well.

Cheers,
Andreas


