Return-Path: <linuxppc-dev+bounces-500-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8C695EA7E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2024 09:32:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wsj7n0C3cz2yGX;
	Mon, 26 Aug 2024 17:32:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724657573;
	cv=none; b=TjlSJ+x7MNBgpqNnO3SRTdQMUtRxjeeyk9atNgmJe9aW3Rue4TX611z7TGdCyTKTdhSKH3xXyuHnnrDILXsW3cx1gLeU+aOEmEPvHN5/B3HAx6CS0x08OOUq30ai8rEgSk2R7NjYtrOdVeeRKNBUAEyEyAneVI8Lf22zDBKgUpIWGh9B41zVnesNp4Ikm6Oa2vkB2+UN3wdPOEkoW2/OwRtMCY3gUX/1QyW1CcTEjIGcfTG0XoJH4rt8buKA3JJSc+/DwlIXp6IxcbnokKFoI/hw7308x/6M9qaSBXPfDjcW2+kpxMZSSr7eJGSsp4I1FzuRLOIHxtFSKieWREDDMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724657573; c=relaxed/relaxed;
	bh=Z8Owwa95G/E6DZIZ0DnKnIa3YcdQc/wFAXIGY1Nw2HE=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=BPk7f9Mhu6dSCGVqe1Dnpv3wA79nTf+0Amfv3EPh4Viabe13tmUqOAOgdCadI6HStmIkNxnpAfTf0Tb49v+fCOsUzLiAqMSgy/YAH3LOcfmm+l1A0Z3Qz6DU+TUBbd1cd+4ohhK9jklXtufqwVs7XEFi9UIpJ2aqFCeE0rw/mo0EWEJUI4eumFkpfiZhJwelrUVzubBGb0O8CmNdMYes1HJeAJxuiTd+MS13yTffRd2xrk9wJgSDYzSJkEoq/YOH3ndRoQ8SKmHwWSsAorY5mjbiJ7vVz4myjtNiDhM+B7WXP7NFz9pGt/mRVGFTcsqWgy5ipAc8kUF5yIeLyZuS4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wsj7m4zhnz2yF6
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Aug 2024 17:32:51 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Wsj7f1sMnz9sRr;
	Mon, 26 Aug 2024 09:32:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zJY02ESYjtRG; Mon, 26 Aug 2024 09:32:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Wsj7f0yXmz9sRk;
	Mon, 26 Aug 2024 09:32:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 0EC928B76C;
	Mon, 26 Aug 2024 09:32:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id bh1CtcFXx0CH; Mon, 26 Aug 2024 09:32:45 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id B745C8B763;
	Mon, 26 Aug 2024 09:32:45 +0200 (CEST)
Message-ID: <a8b4c72d-07bd-4d14-aaa9-44fa332fd13e@csgroup.eu>
Date: Mon, 26 Aug 2024 09:32:45 +0200
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
Subject: Re: [PATCH v2 01/17] asm-generic/unaligned.h: Extract common header
 for vDSO
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
 Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, Shuah Khan
 <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-mm@kvack.org,
 linux-trace-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <a583352e8ae8f6a9a08f9b84a2c543fe43ef94db.1724309198.git.christophe.leroy@csgroup.eu>
 <Zsws0AkFnFDYo5p6@zx2c4.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <Zsws0AkFnFDYo5p6@zx2c4.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 26/08/2024 à 09:20, Jason A. Donenfeld a écrit :
> On Thu, Aug 22, 2024 at 09:13:09AM +0200, Christophe Leroy wrote:
>>   include/asm-generic/unaligned.h | 11 +----------
>>   include/vdso/unaligned.h        | 15 +++++++++++++++
>>   2 files changed, 16 insertions(+), 10 deletions(-)
>>   create mode 100644 include/vdso/unaligned.h
> 
> Do you need to also adjust the `#include <asm/unaligned.h>` inside of
> lib/vdso/getrandom.c to instead read `#include <vdso/unaligned.h>`?

Yes, all adjustments to lib/vdso/getrandom.c are in patch 2.

Christophe

