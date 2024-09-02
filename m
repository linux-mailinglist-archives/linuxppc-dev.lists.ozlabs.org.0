Return-Path: <linuxppc-dev+bounces-879-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E33EA9689E0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Sep 2024 16:27:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WyB0j6M9fz2yGF;
	Tue,  3 Sep 2024 00:27:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725287237;
	cv=none; b=oH3vBMMG+BnxWzXPYW8clEWNbEBz1S/ZHP9VhDLiB5Qdo1zMVXKpl37mK64PHrOlXvg1bN+FJe6o7GUxID+IwlX5W6+EIutiwqs7eDwszumCzIO5g5pqKR4ibhQPPz7kpn4k5ZD23jb9s2HEHiQqiVbuNDrUsIZf06/xn9HgWESQ8Q97FTnwZz5kJXNu/2vgAfyzGPnFsEkMjk0Bu9Ki0PHQwVZRxdI+8Jt5HSpxG/Byub75urkV5kUfJCACem7Swo+UWbrvvWYc6W0RWlCt1O9t93dYbXhw6E+qZXA1N/tK8dF71LrFsovZyg8tj0SI7nUCDUFZdi2Ba9NaLm3mRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725287237; c=relaxed/relaxed;
	bh=D/G9bNo3IpKDItlWrgY5ZqQTM/WhRfaaLxxF7qwCXo8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O52yRbMHoTQKMKSSno8jsEOetraqt6JkFmb6FpXKcU7mLvKwHAel+yqP4WGv4Zz7/yBZB6tiuikENTbhsmbFFxyjiY38Smqf0pIYfFDMIXy87JCfJUi4cft5d55GrCtjBAOgqNVowmCy6cGsdTx5bFP7JpjMlfDRzXo3EKcDH5PecY2NaPECUYUlHgNDxKkPXsTUCw4n2qHG/AW45mdayOcIz1I9MHnWu4e1o8WG08TFGmAWRRnAhS4LvcLVBSkq+TcyuDfGSNMJFghk9+NaOuklq8Aqg1rcqyKJBEoaykwyalrm/LXwDttVQ4l9fyL7wX+pVqG0hRT1YYRMaX8YDg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WyB0j4BPvz2xKQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Sep 2024 00:27:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WyB0d6QXrz9sSN;
	Mon,  2 Sep 2024 16:27:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AL8egIazKnXh; Mon,  2 Sep 2024 16:27:13 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WyB0d5ZcCz9sRy;
	Mon,  2 Sep 2024 16:27:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ADBF68B770;
	Mon,  2 Sep 2024 16:27:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Y7uy6imdDGV5; Mon,  2 Sep 2024 16:27:13 +0200 (CEST)
Received: from [192.168.234.167] (unknown [192.168.234.167])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C76C28B76E;
	Mon,  2 Sep 2024 16:27:12 +0200 (CEST)
Message-ID: <dac37bce-9616-450c-8c1e-aa24dcbfb882@csgroup.eu>
Date: Mon, 2 Sep 2024 16:27:12 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/5] powerpc/vdso: Wire up getrandom() vDSO
 implementation on PPC64
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Michael Ellerman <mpe@ellerman.id.au>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org,
 llvm@lists.linux.dev, linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>,
 Xi Ruoyao <xry111@xry111.site>
References: <cover.1725278148.git.christophe.leroy@csgroup.eu>
 <27de70dcc356e56754a03a2887a97597f5e840a4.1725278148.git.christophe.leroy@csgroup.eu>
 <ZtWyeuCfzZ66fVsg@zx2c4.com>
 <bdf1a515-b3d0-471d-89ee-989ae0d63202@csgroup.eu>
 <ZtXE-AISB4w9U9Yc@zx2c4.com>
 <c411b0c6-1806-4e4d-8bcf-51f0747fcd19@csgroup.eu>
 <ZtXJfiA1lU55JLMM@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <ZtXJfiA1lU55JLMM@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Jason, hi Michael,

Le 02/09/2024 à 16:19, Jason A. Donenfeld a écrit :
> On Mon, Sep 02, 2024 at 04:16:48PM +0200, Christophe Leroy wrote:
>> Can do that, but there will still be a problem with chacha selftests if
>> I don't opt-out the entire function content when it is ppc64. It will
>> build properly but if someone runs it on a ppc64 it will likely crash
>> because only the low 32 bits of registers will be saved.
> 
> What if you don't wire up the selftests _at all_ until the ppc64 commit?
> Then there'll be no risk.
> 
> (And I think I would prefer to see the 32-bit code all in the 32-bit
> commit; that'd make it more straight forward to review too.)

I'd be fine with that but I'd like feedback from Michael on it: Is there 
a risk to only get PPC32 part merged as a first step or will both PPC32 
and PPC64 go together anyway ?

I would prefer not to delay PPC32 because someone doesn't feel confident 
with PPC64.

Christophe

