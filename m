Return-Path: <linuxppc-dev+bounces-8137-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 731E6AA0628
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Apr 2025 10:50:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmvCz0Qkkz2xHW;
	Tue, 29 Apr 2025 18:50:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1745916638;
	cv=none; b=FsmBWGLAz6xFuUfK78ZfyE6VJeo1tyxkdXtbAeOs0oVbUJHk00VCT8g3In7UNeuZhVhH5o9q3LaViJFv3qDbm7e99eTgvG2cuSnRAvQ0CHSpeNwT9MjDKTVwRSE1Gnc0EvCbdykOg7PqOCY2URJpBNeLKuq5HbxpDreBH0zCdCsmML8YpZZqnmHgdhvYfqjc+n21z5nhjicf4JLE2B+oT4qkV7pXP4mEWNi1S1tIiQdxIzNpAEl2RwWgS5QmzHJfV4rFR1spokLV7lmdENVl+sCO/ULsm8oPriXt4J14Erm4VIawYHh3rJpV6IxboQhVvOl5IM86NWJFRVfmn56CRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1745916638; c=relaxed/relaxed;
	bh=zVzvuTyUjtH9weZSKpqwQ00wwpcaPEX3nD3RgOSp8jo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LDQ9aHqfDwby7z6ar8E5M8n09SrlV0fXKt4F+/HM8ReZhwBRqJABJIJBYB2Iz4oPNryGK1LXNYgJBqF+Q5xf9fUqohPaqcvn6FJA3TggPXABSNdfjhQDA7LSsUA6CtDvNeO8PORDZ4CzuY8wO3GVu0tuVl8GjIgptmNyX75gTxPlz68uzHdErXCnm5lzDaRIpdfasMlFzUQz05FECynrt+cjwl7IT/maRutrIpdkKH2PH5z7WIT5YSyxZM2648sfixdV+h1u4ZCtjeQAQD/TcRWnYSoOHW7qFo2jpkT/z7chf0YbzHcGw5nutBnix5wtfyvDrv4bCXTcod9Xd9PdpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZmvCy1Bv9z2xGp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Apr 2025 18:50:37 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4ZmtbH6JVvz9sFT;
	Tue, 29 Apr 2025 10:22:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e30qWr8CZO0g; Tue, 29 Apr 2025 10:22:19 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4ZmtbG0699z9sCk;
	Tue, 29 Apr 2025 10:22:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F1CD98B766;
	Tue, 29 Apr 2025 10:22:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 2CpqnVV7VgEF; Tue, 29 Apr 2025 10:22:17 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3E7F68B763;
	Tue, 29 Apr 2025 10:22:17 +0200 (CEST)
Message-ID: <df566157-5320-47cf-ae14-a2e578f68a35@csgroup.eu>
Date: Tue, 29 Apr 2025 10:22:16 +0200
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
Subject: Re: [PATCH v3 02/13] crypto: powerpc - drop redundant dependencies on
 PPC
To: Eric Biggers <ebiggers@kernel.org>, linux-crypto@vger.kernel.org
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, x86@kernel.org,
 "Jason A . Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>
References: <20250422152716.5923-1-ebiggers@kernel.org>
 <20250422152716.5923-3-ebiggers@kernel.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250422152716.5923-3-ebiggers@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 22/04/2025 à 17:27, Eric Biggers a écrit :
> From: Eric Biggers <ebiggers@google.com>
> 
> arch/powerpc/crypto/Kconfig is sourced only when CONFIG_PPC=y, so there
> is no need for the symbols defined inside it to depend on PPC.
> 
> Acked-by: Ard Biesheuvel <ardb@kernel.org>
> Signed-off-by: Eric Biggers <ebiggers@google.com>


Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Note that there are other redundancies in the file, for instance 
CONFIG_VSX already depends on CONFIG_PPC64

Christophe


