Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2109292674
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 16:19:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bwyv4VD6zDqts
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 00:19:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="D9UpJAtA"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BwlP3dWfzDqfp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 00:09:05 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46BwlB45qYz9v0B8;
 Mon, 19 Aug 2019 16:08:54 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=D9UpJAtA; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8kUMQgQRGl4d; Mon, 19 Aug 2019 16:08:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46BwlB2pNCz9v0B6;
 Mon, 19 Aug 2019 16:08:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566223734; bh=1VZ4PKMgRBwn63Tarnn17tA8xLBbqrhGpSViPPzJK0I=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=D9UpJAtAx9VtM10EP87SXkeqhMpV1ifdecxFK22Oeqy7Ad8awxkVFPkbI/FQeQH6f
 qeShL30Gi/dklCcpCvX69xiBb+W58NFO/9NndmFZmFbUr4c/x3cPyx9L4m5EGBiA6t
 xyu/xmfoxwJn1616ekF/KiEBCbxXabNidKJ6Twn8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EC53F8B7BB;
 Mon, 19 Aug 2019 16:08:59 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id fwAM8N0yBjsL; Mon, 19 Aug 2019 16:08:59 +0200 (CEST)
Received: from [172.25.230.101] (po15451.idsi0.si.c-s.fr [172.25.230.101])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BC5048B7B9;
 Mon, 19 Aug 2019 16:08:59 +0200 (CEST)
Subject: Re: [PATCH 3/3] powerpc: use __builtin_trap() in BUG/WARN macros.
To: Segher Boessenkool <segher@kernel.crashing.org>
References: <a6781075192afe0c909ce7d091de7931183a5d93.1566219503.git.christophe.leroy@c-s.fr>
 <20510ce03cc9463f1c9e743c1d93b939de501b53.1566219503.git.christophe.leroy@c-s.fr>
 <20190819132313.GH31406@gate.crashing.org>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <dbafc03a-6eda-d9a3-c451-d242f03b01d9@c-s.fr>
Date: Mon, 19 Aug 2019 16:08:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190819132313.GH31406@gate.crashing.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 19/08/2019 à 15:23, Segher Boessenkool a écrit :
> On Mon, Aug 19, 2019 at 01:06:31PM +0000, Christophe Leroy wrote:
>> Note that we keep using an assembly text using "twi 31, 0, 0" for
>> inconditional traps because GCC drops all code after
>> __builtin_trap() when the condition is always true at build time.
> 
> As I said, it can also do this for conditional traps, if it can prove
> the condition is always true.

But we have another branch for 'always true' and 'always false' using 
__builtin_constant_p(), which don't use __builtin_trap(). Is there 
anything wrong with that ?:

#define BUG_ON(x) do {						\
	if (__builtin_constant_p(x)) {				\
		if (x)						\
			BUG();					\
	} else {						\
		if (x)						\
			__builtin_trap();			\
		BUG_ENTRY("", 0);				\
	}							\
} while (0)

#define WARN_ON(x) ({						\
	int __ret_warn_on = !!(x);				\
	if (__builtin_constant_p(__ret_warn_on)) {		\
		if (__ret_warn_on)				\
			__WARN_TAINT(TAINT_WARN);		\
	} else {						\
		if (__ret_warn_on)				\
			__builtin_trap();			\
		BUG_ENTRY("", BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN));	\
	}							\
	unlikely(__ret_warn_on);				\
})


> 
> Can you put the bug table asm *before* the __builtin_trap maybe?  That
> should make it all work fine...  If you somehow can tell what machine
> instruction is that trap, anyway.

And how can I tell that ?

When I put it *after*, it always points to the trap instruction. When I 
put it *before* it usually points on the first instruction used to 
prepare the registers for the trap condition.

Christophe
