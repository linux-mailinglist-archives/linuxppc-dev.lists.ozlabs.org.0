Return-Path: <linuxppc-dev+bounces-15405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E21D01311
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 07:06:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmvYG43Kkz2yG7;
	Thu, 08 Jan 2026 17:06:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767852386;
	cv=none; b=j/X1gUb4K9kwG8QgruZNGDSsuUYwn5+wZ9nSjpqYju1BeSE+IWoKnNTtlr+dEqXstroWs2uMgccJmZ7d1MwRcob0Mn+jOnldPKVwHh7i01YMpU3c+axkMz1EfDBTe07jT9VeuPqDpXnx26HJjKI2aGQROL2C6o7XTlUlUbTG648Zhc+1ZzzabvwuwEEuW2akAkw9RBW+t/Op7ECiPStucGuxHA5ekzrKMnAUCeGrHZa9/6/5+D+ShshDuNDAxKVe9vawfl78VfdDvWKQp22u1d+jm3WtuEd1lmHmtkSuWhQyfoc6m73akfaT6nxP44NAKk2qqqszpx6dbiMU83UGig==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767852386; c=relaxed/relaxed;
	bh=tm8I0jnfISIwSVXTyL0UaqtwOuuoJWJ7CbnPNZxmDe0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NbUBoCof2OmIosJhyLe/loZnI3tNt6YatfZ62cygjMEKRlInebsqYCMhSB59din8N9w+HYGx7wy8DqFrpX7JdNPnz3lob8cnF8vPqaEf2Bf0YTYDS6pS2uNUECS00St4VmzhSdIYoiAabV+pbnYJm8C5p66CERipStrYn8PmimCY4Q8PRgyJhLTIbR8m4qSXpxTVmMHQUvlADeq0RqiTlylmVWewvEdqyjw2kagj/FCKlhrFD0fWaaGd9twUrlVV4IlyjUCRv4DZMDHj+fsGHOzLZvi49c1jD2g7DPIsB/yw6A68/VvxpOUEOTzNIceIdqpf0hIK27zmDcfQuw5TEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DCviss9a; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=DCviss9a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmvYF4y06z2yF1
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 17:06:25 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4A3F56000A;
	Thu,  8 Jan 2026 06:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 574E2C116C6;
	Thu,  8 Jan 2026 06:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767852353;
	bh=Hps+AALnPVZeA483Uog7NYKfmhvaru1s4Fp0DGXndcU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DCviss9apLvD+bHnOHR+JlAJawx/BSIe3EHDgS+7eryOZxLwTd9otIK9hx0sPfwIr
	 XBybt6iFg1MHEd+UFu7TrfJ/LGP2x57tHIIGE4eK67GemyGsM7ztAauKui7ZFDJd+3
	 cFyMWT+U8tX4uJGLKjeB3Nn/tIsLbIdj8VZzc9qguWGsegZPSYmAEzkYpNgGdmn6O5
	 Q8sCXgBM1HlipIDKzTHwfrAD3XnSs1RZVZhyRyz6oupRQUVgQRmnrVVhG9bPGZNaSB
	 Zn4JFIO2kCtoSYDaYjPO/qXG4p2aAPKpCnY0TFaSqzV26Llhq8mr0M4p8ZPJZNKNHW
	 hhqAqMqEMoN8Q==
Message-ID: <e18ac87b-0034-4297-ae15-0dd0a36abb15@kernel.org>
Date: Thu, 8 Jan 2026 07:05:42 +0100
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
Subject: Re: [PATCH v3 0/8] Generic IRQ entry/exit support for powerpc
To: Venkat <venkat88@linux.ibm.com>,
 Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 oleg@redhat.com, kees@kernel.org, luto@amacapital.net, wad@chromium.org,
 mchauras@linux.ibm.com, thuth@redhat.com,
 Shrikanth Hegde <sshegde@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, macro@orcam.me.uk, deller@gmx.de,
 ldv@strace.io, charlie@rivosinc.com, segher@kernel.crashing.org,
 bigeasy@linutronix.de, namcao@linutronix.de,
 Thomas Gleixner <tglx@linutronix.de>, Kan Liang <kan.liang@linux.intel.com>,
 mark.barnett@arm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 LKML <linux-kernel@vger.kernel.org>
References: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
 <3BBCC728-0BF9-484A-85F9-2760DEFD56BD@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <3BBCC728-0BF9-484A-85F9-2760DEFD56BD@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

Le 08/01/2026 à 06:16, Venkat a écrit :
> With this patch set, build fails.
> 
> Failure logs:
> 
> ld: init/main.o: in function `do_one_initcall':
> /root/linux/init/main.c:1384: undefined reference to `memcpy'

I guess you have KASAN enabled ?

See 
https://lore.kernel.org/all/0947502d-96e3-4179-ae48-603de74dc7b3@kernel.org/

This is because of commit 69d4c0d32186 ("entry, kasan, x86: Disallow 
overriding mem*() functions") which changed the core behaviour in 2023 
without taking care of other architectures than x86 who was the only one 
with CONFIG_GENERIC_ENTRY ?

For powerpc the expected behaviour introduced in 2019 by commit 
26deb04342e3 ("powerpc: prepare string/mem functions for KASAN") needs 
to be modified the same way to fit with the core change.

Christophe

