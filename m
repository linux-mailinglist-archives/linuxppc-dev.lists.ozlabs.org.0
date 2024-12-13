Return-Path: <linuxppc-dev+bounces-4107-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9DB9F0966
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 11:27:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8ls81pz6z2xG5;
	Fri, 13 Dec 2024 21:27:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734085660;
	cv=none; b=kDphBXqNco2nxPnltnulDXbFvDIiVqoN6JoyjQiJ/QAQSz5xUeVp/ZLzdX9sNUnzCadgu5qVDnv+XNindyk0qjH/fls0JhvKjgQ6J2XPu8MmSjvo+YtHZsDRE2wYwbHS3MRs6qaVKVs+d0cEZ+B9cuqoceq54fooxKkqkYA+GWWbjLupJG0FfCbpU4SL82vFJ1/hwt0byX/VNYQhrYobqWiiLFC4jA4V6q4B1J3LAuyl+Chi/VHPi8uP84xXt3yIvCOWE6hWyXN9REFi81JtiU9NgGFz+1Hdx1ZRxlt2xf+pOEfliik6eOjEBkEWvbs1f+caLmhn6q1E2d/VqvLabg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734085660; c=relaxed/relaxed;
	bh=iRMAjRwvXjPuZ7AsEaMeFU6t+ehle3K6TTXT0PezHyk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XVYFuKfDvwwlzHA1wP8WgdSzTfJi4qOhZbfmt2U0Sgr0h4sMMtPRobqppgn9g5w87fVwSPmiOxUBJEBfKCMz86cS2kBJxacMAOWvU2PRdOlHs82M7nOvDreA6YGQFfbxoJZ2A6dTuSLN2HFmskpb4o7Rc3Atz+bfNcFVBTC1xL6MRhPdn+PbFilpWVGYVE3KP7NR6AARXkdWXCrEERG7b+oKWyadkkH1dVLNs8Gg92MJGae85gbt6LQ/YVme77Sg/ITXUjA4XeNzcpjsyi2bzgWpdd7qOeE+++CwZbebiVcWam9sV5oqawtG3PLgHOVaeGPckG9z5SR1PwQAeLN1cg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8ls64pBgz2xBK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 21:27:38 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Y8ls307LNz9sSd;
	Fri, 13 Dec 2024 11:27:35 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w4LjWUMC-i0O; Fri, 13 Dec 2024 11:27:34 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Y8ls26Grzz9sSH;
	Fri, 13 Dec 2024 11:27:34 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C07B88B773;
	Fri, 13 Dec 2024 11:27:34 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id SmQbPCkQpRec; Fri, 13 Dec 2024 11:27:34 +0100 (CET)
Received: from [192.168.232.97] (unknown [192.168.232.97])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 679968B763;
	Fri, 13 Dec 2024 11:27:33 +0100 (CET)
Message-ID: <3a2fadc3-f594-492f-805a-148043436995@csgroup.eu>
Date: Fri, 13 Dec 2024 11:27:32 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/5] powerpc: kvm: drop 32-bit book3s
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
 kvm@vger.kernel.org
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Huacai Chen <chenhuacai@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Alexander Graf <graf@amazon.com>, Crystal Wood <crwood@redhat.com>,
 Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Sean Christopherson <seanjc@google.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 David Woodhouse <dwmw2@infradead.org>, Paul Durrant <paul@xen.org>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
References: <20241212125516.467123-1-arnd@kernel.org>
 <20241212125516.467123-4-arnd@kernel.org>
 <2809dcce-3405-430e-b43d-d75f35bdb7d5@csgroup.eu>
 <3380464f-5db4-487d-936f-1b5503905793@app.fastmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <3380464f-5db4-487d-936f-1b5503905793@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 13/12/2024 à 11:04, Arnd Bergmann a écrit :
> diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
> index 9cba7dbf58dd..24e89dadc74d 100644
> --- a/arch/powerpc/kernel/head_32.h
> +++ b/arch/powerpc/kernel/head_32.h
> @@ -172,7 +172,6 @@ _ASM_NOKPROBE_SYMBOL(\name\()_virt)
>   #define	START_EXCEPTION(n, label)		\
>   	__HEAD;					\
>   	. = n;					\
> -	DO_KVM n;				\
>   label:
>   
>   #else

Then the complete macro should go away because both versions are now 
identical:

-#ifdef CONFIG_PPC_BOOK3S
-#define	START_EXCEPTION(n, label)		\
-	__HEAD;					\
-	. = n;					\
-label:
-
-#else
  #define	START_EXCEPTION(n, label)		\
  	__HEAD;					\
  	. = n;					\
  label:

-#endif



