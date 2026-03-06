Return-Path: <linuxppc-dev+bounces-17860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMahAONnq2kfcwEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17860-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 00:48:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 473D6228D73
	for <lists+linuxppc-dev@lfdr.de>; Sat, 07 Mar 2026 00:48:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fSNQk2Ddrz3cB5;
	Sat, 07 Mar 2026 10:48:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:7c80:54:3::136"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772840926;
	cv=none; b=ixcOHy9dBBJrX70ApZeHmNHmvRH5T+C/FIk7KR4q7kgBAyMkweGADOPLDk26ThksY++w+ox90C0z8nAn0WwfcsXT+PZvcj3PsBWOLa1LUZRSb5gqewFMyadeFpYQM6Jrc7Vd5FPpZlfTUJ/O87ZBgcUBos02NWBmbB8un/y5AlC3UcKQ+I7fCoX+uAH5O1A9Geq7/9jl0Rk/zvIO5yXlNvv/izIbFzXP5ej9nyIn/Wts0TZuMqt9Cyk5Xzjgmqjyy60bpYlOpReNLQwLM633VpqnBzq+f8+bA10lQJ7ULiTDMrQy9Zcakn2+aMF4tWFW3ilr6obOBVomISAETa3Izg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772840926; c=relaxed/relaxed;
	bh=+EuyHHVP1ezysh+DOMChYpQ6YLA93nDMuTUQuNAbUKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBiE8kfssWiu+4HLOZH0MM0p7QBfGwKMpxupn2LW9sf8kuCEjZ/LNi2eaj4a2cLNUY9sPMnc6ZCO4cIor1IBSEAhWasxS7iv2SZ9+F2OXhZmXsggHBI6ZLM50VgyODqZySg8evR8i1+fXenGITniaXeMZSWHLHteE3sPCdwthLKYJfNgsuibMZl7JjId6CPrISpmvRnMNwVKcO5D+hXntlLf8VyZuR3JE3RpfCJ7A/aRvwjAoswIlKttxprxSNyAIqGtZZg4Bc83TezzWjm22gKarJFIB7MNCWVtWK8jM9z5Ut8gOjiq8OIRnMukpD0/STissrZ8YATQR5hXJEbCZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com; dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=PioK8n1G; dkim-atps=neutral; spf=pass (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org) smtp.mailfrom=zytor.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=zytor.com header.i=@zytor.com header.a=rsa-sha256 header.s=2026022301 header.b=PioK8n1G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=zytor.com (client-ip=2607:7c80:54:3::136; helo=mail.zytor.com; envelope-from=hpa@zytor.com; receiver=lists.ozlabs.org)
Received: from mail.zytor.com (terminus.zytor.com [IPv6:2607:7c80:54:3::136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fSNQh2Qbgz3c9y
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Mar 2026 10:48:43 +1100 (AEDT)
Received: from [172.27.2.41] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 626NVQj92208026
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 6 Mar 2026 15:31:58 -0800
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 626NVQj92208026
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2026022301; t=1772839922;
	bh=+EuyHHVP1ezysh+DOMChYpQ6YLA93nDMuTUQuNAbUKI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PioK8n1GDOCMylG5Zt2121yBqaQjmuAgAG8ArmoqbSGk+AY2HjiUf0EtOT1DsexRY
	 3XzpMhpcVWr9RPSEgwVE9ESR7uck6X+0Brpr8WoubZ+TlXmlH4lDGa0CVViVEYVOPr
	 a2U1eLnne4Jq8YkGPdE7tatxcJ2Gd+LMg66XDUlWERyyYKh8whYexkpditNEyz4ILx
	 yckiGOkMmhcxGYFKzQD0ff8pydvHcvjyUktvDHaVTIquZDk64YCElixBnK+5hWClOa
	 uRJidGVd5gvOOIeokQ5EcbFwoFLXBWjUIyo+ZDse7szoWgdzIXdm2JW1VkFzyB6i6x
	 eQ3pvQwa4welw==
Message-ID: <75d0ca29-b227-49c1-8204-b305f64b009b@zytor.com>
Date: Fri, 6 Mar 2026 15:31:21 -0800
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
Subject: Re: [PATCH 0/2] kbuild: Switch from '-fms-extensions' to
 '-fms-anonymous-structs' when available
To: Nathan Chancellor <nathan@kernel.org>
Cc: Nicolas Schier <nsc@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
        WANG Xuerui <kernel@xen0n.name>,
        "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
        Helge Deller <deller@gmx.de>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>, Thomas Gleixner <tglx@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Ard Biesheuvel <ardb@kernel.org>,
        Ilias Apalodimas <ilias.apalodimas@linaro.org>,
        Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
        linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        linux-s390@vger.kernel.org, linux-efi@vger.kernel.org,
        llvm@lists.linux.dev
References: <20260223-fms-anonymous-structs-v1-0-8ee406d3c36c@kernel.org>
 <01433066-eb9b-4a96-8d7f-794af941d365@zytor.com>
 <20260306231705.GD2746259@ax162>
Content-Language: en-US, sv-SE
From: "H. Peter Anvin" <hpa@zytor.com>
In-Reply-To: <20260306231705.GD2746259@ax162>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 473D6228D73
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[zytor.com,none];
	R_DKIM_ALLOW(-0.20)[zytor.com:s=2026022301];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17860-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:nathan@kernel.org,m:nsc@kernel.org,m:torvalds@linux-foundation.org,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:James.Bottomley@hansenpartnership.com,m:deller@gmx.de,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:ardb@kernel.org,m:ilias.apalodimas@linaro.org,m:nick.desaulniers+lkml@gmail.com,m:morbo@google.com,m:justinstitt@google.com,m:kees@kernel.org,m:linux-kbuild@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linux-parisc@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:linux-s390@vger.kernel.org,m:linux-efi@vger.kernel.org,m:llvm@lists.linux.dev,m:nickdesaulniers@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hpa@zytor.com,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[38];
	RCVD_COUNT_THREE(0.00)[3];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux-foundation.org,arm.com,xen0n.name,hansenpartnership.com,gmx.de,linux.ibm.com,ellerman.id.au,gmail.com,redhat.com,alien8.de,linux.intel.com,linaro.org,google.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.996];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hpa@zytor.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[zytor.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,lkml];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gnu.org:url,lists.ozlabs.org:rdns,lists.ozlabs.org:helo,zytor.com:dkim,zytor.com:mid,godbolt.org:url]
X-Rspamd-Action: no action

On 2026-03-06 15:17, Nathan Chancellor wrote:
> On Thu, Mar 05, 2026 at 03:43:29PM -0800, H. Peter Anvin wrote:
>> Question: does clang allow this with __extension__, or only if the option is
>> on the command line?  It would be desirable in the long run if both clang and
> 
> It looks like only on the command line:
> 
>   https://godbolt.org/z/zrE766obe
> 
>> gcc would allow this with __extension__, as that would be required to use it
>> in uapi headers (at least without some doable-but-nontrivial preprocessing,
>> which might be worthwhile to do anyway...)
> 
> I agree that would be desirable but wouldn't that change how
> __extension__ works? As far as I can tell from reading GCC's
> documentation [1], __extension__ just supresses warnings from -pedantic
> and such, it does not actually enable a used extension if it conflicts
> with whatever -std= value is passed?
> 
> [1]: https://gcc.gnu.org/onlinedocs/gcc/Alternate-Keywords.html
> 

Maybe it does, but it's explicit purpose is to allow code to be compiled with
a -std= setting lower than the system libraries.

I was a little surprised to see that -std=c90 doesn't actually enforce C90
compatibility; even with -Wall -Wextra it requires -pedantic to issue
warnings; the same seems to apply to -std=c99 for at least some features that
were included in gnu* standards like anonymous structures and unions.

The latter is probably a particular indication about the desirability of this,
since the extension we are talking about is a relatively obvious extension of
the anonymous struct/union construct!

It is an incredibly useful thing in ABI headers, because it lets you avoid the
"copy/macro this entire structure definition into another."

	-hpa






