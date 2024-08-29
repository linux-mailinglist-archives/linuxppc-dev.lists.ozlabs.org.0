Return-Path: <linuxppc-dev+bounces-765-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC35B964CEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Aug 2024 19:36:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WvpPB3ntFz2ywq;
	Fri, 30 Aug 2024 03:36:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1724953006;
	cv=none; b=ZwO7PsSX3Kq3JYEW2u/+6dypMXUFw5Ia47eO5tDCZfAoOPJctN6srBTqqRLQEorGaC81bjRnifvoGRAd8VVFgA/CMqQNaqaAUGP1WkX7HkLOqKDqJA6LsDfjzXEW4C7o5krcrwWRRb2QX4+gIVOFIkf7gaC/08o2k2F49Dv3ZmxbIrzMVWUFxVh5JCu6w0oUJ5rq3KRsczfU9Piek2uB3LOuooC2x2ND3p8jR+0cjCvx2Ze6dv+HEGP5Vica0BVi1SO77hKakmnRBcuFznNptDlAegDihILbzmjm/IZhYxL8xN6ABHVkvzzUh6h8MIhyQzk2V0VYOIpeY6t+EHBRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1724953006; c=relaxed/relaxed;
	bh=X74M/rCFD1EO310BIUvdnjYyKsRYlFMd2tS/r12qA9k=;
	h=Received:X-Virus-Scanned:Received:Received:Received:
	 X-Virus-Scanned:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding; b=Xjc5oHMCv6DATd+6P/6/RRG45vEdJQ2AO4RkBjC5qZ1Oc0WN6nrU54a91xAog1dpnejQ1YevAV4i6f2ohPoOHm9C9U4jKeE2BQ3JJek+W9ZHbUjimjQpqa02uE4Y6MrQRXmqSWSuyILCkOwHse/9DS6T4TdJ27DRNoDgELYwLPHKS9zWXVDdkT8fZnTm7tapYHK2IMzvOv0xq8+RbdKJwkeuGrBRnU6AxhgXjnluo/sZbuzRZAZnXIAxmXEFyEB2Q3WzWUYhZFQNY7NtBqWhsODoyz24+j8cg8Cw3uOao1pF4oH7+pJ2qYS9UjJAmSIfs7WLD98B3WpBqZ778BWo5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WvpPB1STrz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Aug 2024 03:36:44 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4WvpP538xwz9sS8;
	Thu, 29 Aug 2024 19:36:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 71Z_VYkOft16; Thu, 29 Aug 2024 19:36:41 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4WvpP528mSz9sRs;
	Thu, 29 Aug 2024 19:36:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 317CB8B794;
	Thu, 29 Aug 2024 19:36:41 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id MDymf6ryo8rr; Thu, 29 Aug 2024 19:36:41 +0200 (CEST)
Received: from [192.168.234.66] (unknown [192.168.234.66])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3CA178B764;
	Thu, 29 Aug 2024 19:36:39 +0200 (CEST)
Message-ID: <e5a36d98-c880-4d33-954a-2a05240ef02f@csgroup.eu>
Date: Thu, 29 Aug 2024 19:36:38 +0200
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
Subject: Re: [PATCH v2 05/17] vdso: Avoid call to memset() by getrandom
To: Segher Boessenkool <segher@kernel.crashing.org>,
 Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, "Jason A . Donenfeld" <Jason@zx2c4.com>,
 Eric Biggers <ebiggers@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>,
 Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Theodore Ts'o <tytso@mit.edu>,
 Andrew Morton <akpm@linux-foundation.org>,
 Steven Rostedt <rostedt@goodmis.org>, Masami Hiramatsu
 <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, shuah <shuah@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <cover.1724309198.git.christophe.leroy@csgroup.eu>
 <5deb67090b214f0e6eae96b7c406546d1a16f89b.1724309198.git.christophe.leroy@csgroup.eu>
 <20240827180819.GB2049@sol.localdomain>
 <20240827225330.GC29862@gate.crashing.org> <Zs8HirKLk-SrwTIu@zx2c4.com>
 <fc19bf63-d519-46e2-be70-80202c85ff92@app.fastmail.com>
 <20240828124519.GE29862@gate.crashing.org>
 <CAMj1kXGmDmxy75eP=rf_fzKmg0g_FeKV43jk2G_gibnKZBtVww@mail.gmail.com>
 <20240828162025.GG29862@gate.crashing.org>
 <CAMj1kXHZPfr2Sz78UrgsdX-2uBp0D1sCnznQnz5ZyMdiJq6rAA@mail.gmail.com>
 <20240828172538.GI29862@gate.crashing.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20240828172538.GI29862@gate.crashing.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 28/08/2024 à 19:25, Segher Boessenkool a écrit :
> 
>> Not sure about static binaries, though: do those even use the VDSO?
> 
> With "static binary" people usually mean "a binary not using any DSOs",
> I think the VDSO is a DSO, also in this respect?  As always, -static
> builds are *way* less problematic (and faster and smaller :-) )
> 

AFAIK on powerpc even static binaries use the vDSO, otherwise signals 
don't work.

Christophe

