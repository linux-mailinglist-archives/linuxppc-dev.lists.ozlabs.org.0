Return-Path: <linuxppc-dev+bounces-3499-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A908A9D5BCC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Nov 2024 10:21:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XvqMv1pFjz2yTs;
	Fri, 22 Nov 2024 20:20:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732267259;
	cv=none; b=gOxGsokoXrTTFpq4BJV75tlHzOmmon2WqAb2p963x0+VI2/B/hRDCuY6BMR/Pap985+QJBK87gA5VOVy/AnNcngdPvLJpLvC/WkMytCIPMtFnb28Il2tyKjfjzXL863yXknMEBfAMPFulNxiBrg8O6y6ayitsrlXcpSqLw5kukPfECT/YRGmyTeOTsizAZoQp58Dq1Yuz37955MNJdodZV8vYtTLMz2mgmughMM2zMe+9mGIS++5+iNfSQKOhPzblxtqqI7RK82XKy7QOqv531BGv4XWyJRW+zSXNwFP7tSzriSfamFeG1zhHEh1mWlLH3UGMOmLH5ubm6LQY/q0GA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732267259; c=relaxed/relaxed;
	bh=WGz6qZnrmx/E/29pes1Yra1DcW9TNQ0QX0vTwoMD3nA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gm4uyLdaSn5qiu5tjmXFRVRPBY3x6vc1MGKXbmYV9mPu2QD8cHOBVff+Sk/z4RwQt7w27IHVU3a4MGhk3b8O9fOqvPbx0ma8MzVRe44F8h0V/wdWjNZCe/aP8BDpyyWAbwBXREy3vGJEIIvk0oLIMe3vOohZV3MuoSVT1SHAK635YFhJLiI51AdPgi8IAsJrkmKCzLoiIR/clm4gztnPAGHHNoJUj1nbR7wvhtWs4wndV1356Pg+RYbhJvAhQyQvqCsjgazWQNAJVXJfBL4uhExZXR6AKQrFekqU7zr7EkGgIdgyP3UMHTWz7Vs+yRCkHCTh5oxDMB0f+BNk6Mkb4w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XvqMs30MPz2yDS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Nov 2024 20:20:56 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XvqMl6brKz9t5k;
	Fri, 22 Nov 2024 10:20:51 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r2i_z8DfN7FK; Fri, 22 Nov 2024 10:20:51 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Xvq375lFyz9slL;
	Fri, 22 Nov 2024 10:06:27 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id AFD418B798;
	Fri, 22 Nov 2024 10:06:27 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id frw1EeMvWf76; Fri, 22 Nov 2024 10:06:27 +0100 (CET)
Received: from [192.168.233.136] (unknown [192.168.233.136])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id E2FF98B7C5;
	Fri, 22 Nov 2024 10:06:26 +0100 (CET)
Message-ID: <ab5cdb9b-227b-473b-ae39-6b4969506a5e@csgroup.eu>
Date: Fri, 22 Nov 2024 10:06:26 +0100
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
Subject: Re: [PATCH v3 2/6] x86/uaccess: Avoid barrier_nospec() in 64-bit
 __get_user()
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Josh Poimboeuf <jpoimboe@kernel.org>
Cc: David Laight <David.Laight@aculab.com>, "x86@kernel.org"
 <x86@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, Peter Zijlstra <peterz@infradead.org>,
 Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
 Waiman Long <longman@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Mark Rutland <mark.rutland@arm.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>
References: <cover.1730166635.git.jpoimboe@kernel.org>
 <82cbb9983fef5ecf6f1cb33661e977172d40a7e6.1730166635.git.jpoimboe@kernel.org>
 <20241029032735.pw3bg64bpneqnfhk@treble.attlocal.net>
 <76bb85ceeb854e3ab68d87f846515306@AcuMS.aculab.com>
 <20241115230653.hfvzyf3aqqntgp63@jpoimboe>
 <CAHk-=wgLCzEwa=S4hZFGeOPjix-1_fDrsqR-QLaBcDM-fgkvhw@mail.gmail.com>
 <20241121214011.iiup2fdwsys7hhts@jpoimboe>
 <CAHk-=wigHm2J4LkUL1=y_H8zGwM0JsK2CrWyLNbz9fvXfbaBQA@mail.gmail.com>
 <20241122001223.t4uywacusrplpefq@jpoimboe>
 <CAHk-=whm4fEYrzrrRrqEhELLFz2xNCMT9be+J0uiR_EwXwa0DA@mail.gmail.com>
 <20241122031115.5aasuktqrp2sidfj@jpoimboe>
 <CAHk-=wjJt49tgtmYv42bXU3h0Txb+mQZEOHseahA4EcK6s=BxA@mail.gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <CAHk-=wjJt49tgtmYv42bXU3h0Txb+mQZEOHseahA4EcK6s=BxA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 22/11/2024 à 04:57, Linus Torvalds a écrit :
> 
> I'm not loving the "if (0)" with the labels inside of it. But it's the
> only way I can see to make a statement expression like this work,
> since you can't have a "return"  inside of it.
> 

On powerpc for this kind of stuff I have been using do { } while (0); 
with a break; in the middle, see for instance __put_user() or 
__get_user_size_allowed() in arch/powerpc/include/asm/uaccess.h

Christophe

