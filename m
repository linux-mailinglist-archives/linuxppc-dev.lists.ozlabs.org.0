Return-Path: <linuxppc-dev+bounces-8587-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B375BAB72D8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 May 2025 19:31:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZyL3Z5L3Jz2ytT;
	Thu, 15 May 2025 03:31:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=131.188.11.20
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1747243866;
	cv=none; b=a79dKt0jwzUOwc63B7xK4H/XPNKGNYrnpvXQldcbrNvAuJpah/LyWultDOUXn0cEh316AFxbFBNYfX/G8HApMY5n9NQeOhR+H3JZmMd9EgeIC7/6G46nje1ejJ2qz4kGiQzHhBO2cd3XyMBGt75rJbmz6u47VVsPEa3qi5Ny6/b4uco0QIRLuLyncX8adjrbMUwnZPwPPEPRlAHtA2+ir9rMr8gmKJKZyg7UXyHQrvgpng6djQQdXjFmuIMbf0Lg+AzA7GZgmyy3WpJ7zh6beF6amK6chZ/yw21Tk4PYIp7n3nUQsCvwwO0gZLM2WGeCm1cR4VCnzckhsIFDhuTTZg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1747243866; c=relaxed/relaxed;
	bh=3e0BofRXBhWdxRuieDvo8KpaPQ4BE/s7KyUPUjxLUy0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=dT0Rl2Vo8HLdU7hHCc3KgZ7o1Jq3AAbuK6kWv/oOh1G/XwKMVzjTBJSVyd1TmGw9zsGv8RI0NyDT6W9uicSMPgJg+oMtpHzN5grGfwfAtLGB2N6n3MbjJuL/jqF4fZ5nY84hB4vjGmm/TT36jdcu/g2c8RocNVrdsj4Nff4RyvAk/NvMU2cPwU+nErKtGvfX0wlUbsMrt0jpXYVRNzGou4KHW5dPCKGtROwWnpA98Gh5sjkJqbphX5YPElJpw4zAnQCiNtXOlGf1qlmFU5C3uJWJMYoYwWWwnWAXAF4H7qSBIkyIPz3HU+mredY2+ujCTg4tl4XPXGQBcrv2EJLb5A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=o/v9xMLo; dkim-atps=neutral; spf=pass (client-ip=131.188.11.20; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=o/v9xMLo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=131.188.11.20; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-1.rrze.uni-erlangen.de (mx-rz-1.rrze.uni-erlangen.de [131.188.11.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZyL3V6n7Nz2yrp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 May 2025 03:31:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1747243854; bh=3e0BofRXBhWdxRuieDvo8KpaPQ4BE/s7KyUPUjxLUy0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=o/v9xMLoLEt+/EY/F/2hiul7G9q9dVfTBoHsfj6PXfkZFOSFMdQQBavF/drmR4rpL
	 DgVdmTvlc6POarsmEEmRDC8f9XB32EUFRahN2mBnDpa7EIkU+No5WrItvRHVwRezCY
	 LhPzBIW1wHkJbx/Km70XS3uu5TohveXjPX5fj4gvBQwxLgO8a1kQjnOafENXDmRuH4
	 q6MPQdadYlu5KmCBX7pTTw8KmkFCqSlRa1WuK/xH9t3y9PqHf/QQiXwkP/9m+FOyWQ
	 l+IW74ia2BZt0gCbP7yqABiYtBCbon1DFCjotNmYpkRQSKuJCi97P1w28X0FIOQtg2
	 BRdIPDkilXjDw==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4ZyL3L0f4Kz8smT;
	Wed, 14 May 2025 19:30:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck2.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3603:f000:9789:61c6:ec86:c048
Received: from localhost (unknown [IPv6:2001:9e8:3603:f000:9789:61c6:ec86:c048])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1/rt5rGkAuQIth1KALZmUps9hhST9T84As=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4ZyL3G4bZ7z8t8S;
	Wed, 14 May 2025 19:30:50 +0200 (CEST)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Martin
 KaFai Lau <martin.lau@linux.dev>,  Eduard Zingerman <eddyz87@gmail.com>,
  Song Liu <song@kernel.org>,  Yonghong Song <yonghong.song@linux.dev>,
  John Fastabend <john.fastabend@gmail.com>,  KP Singh
 <kpsingh@kernel.org>,  Stanislav Fomichev <sdf@fomichev.me>,  Hao Luo
 <haoluo@google.com>,  Jiri Olsa <jolsa@kernel.org>,  Puranjay Mohan
 <puranjay@kernel.org>,  Xu Kuohai <xukuohai@huaweicloud.com>,  Catalin
 Marinas <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>,  Hari
 Bathini <hbathini@linux.ibm.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Naveen N Rao <naveen@kernel.org>,
  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael Ellerman
 <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,  Mykola
 Lysenko <mykolal@fb.com>,  Shuah Khan <shuah@kernel.org>,  Henriette
 Herzog <henriette.herzog@rub.de>,  Saket Kumar Bhaskar
 <skb99@linux.ibm.com>,  Cupertino Miranda <cupertino.miranda@oracle.com>,
  Jiayuan Chen <mrpre@163.com>,  Matan Shachnai <m.shachnai@gmail.com>,
  Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,  Shung-Hsi Yu
 <shung-hsi.yu@suse.com>,  Daniel Xu <dxu@dxuuu.xyz>,  bpf@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-kselftest@vger.kernel.org,
  Maximilian Ott <ott@cs.fau.de>,  Milan Stephan <milan.stephan@fau.de>
Subject: Re: [PATCH bpf-next v3 11/11] bpf: Fall back to nospec for
 sanitization-failures
In-Reply-To: <CAP01T76jeSg3W-OyfBfSbAjpEhBr_h8rbS-Hubk6gDdrkeEj_Q@mail.gmail.com>
	(Kumar Kartikeya Dwivedi's message of "Wed, 14 May 2025 02:47:44 -0400")
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
	<20250501073603.1402960-12-luis.gerhorst@fau.de>
	<CAP01T76jeSg3W-OyfBfSbAjpEhBr_h8rbS-Hubk6gDdrkeEj_Q@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 30.1
Date: Wed, 14 May 2025 19:30:50 +0200
Message-ID: <87ecwr14mt.fsf@fau.de>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Kumar Kartikeya Dwivedi <memxor@gmail.com> writes:

(including relevant part from other message)

> On Thu, 1 May 2025 at 04:00, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
> 
>> +static bool error_recoverable_with_nospec(int err)
>> +{
>> +       /* Should only return true for non-fatal errors that are allowed to
>> +        * occur during speculative verification. For these we can insert a
>> +        * nospec and the program might still be accepted. Do not include
>> +        * something like ENOMEM because it is likely to re-occur for the next
>> +        * architectural path once it has been recovered-from in all speculative
>> +        * paths.
>> +        */
>> +       return err == -EPERM || err == -EACCES || err == -EINVAL;
>> +}
> 
> Why can't we unconditionally do this? So the path with speculation
> that encounters an error (even if EFAULT) is not explored for the
> remaining pushed speculative states. If the error remains regardless
> of speculation normal symbolic execution will encounter it. The
> instructions only explored as part of speculative execution are not
> marked as seen (see: sanitize_mark_insn_seen), so they'll be dead code
> eliminated and the code doesn't reach the JIT, so no "unsafe gadget"
> remains in the program where execution can be steered.
> 
> So the simplest thing (without having to reason about these three
> error codes, I'm sure things will get out of sync or we'll miss
> potential candidates) is probably to just unconditionally mark
> cur_aux(env)->nospec.

[...]

> Hm, now looking at this and thinking more about this, I think
> recoverable error logic is probably ok as is.
> Scratch my earlier suggestion about unconditional handling. I guess
> what would be better would be
> handling everything except fatal ones. In case of fatal ones we should
> really quit verification and return.
> We may make partial changes to verifier state / env and try to bail
> out using -ENOMEM and -EFAULT.
> So unconditional continuation would be problematic as we'd act in a
> partial state never meant to be seen.
>
> The logic otherwise looks ok, so:
>
> Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

Thank you very much for having a look, so then I will leave it as is if
I understand you correctly.

Please let me know if "what would be better would be handling everything
except fatal ones" was meant literally. Such a deny-list approach would
likely be:

  return err != -ENOMEM && err != -EFAULT;

I initially decided to limit it to -EPERM, -EACCES, and -EINVAL as I was
relatively confident all their cases were safe to "catch" and because it
already had the desired effect for most real-world programs. However, if
you find the deny-list approach easier to reason about, I can also do
that. In that case, I will review the remaining errors (besides -EPERM,
-EACCES, and -EINVAL) and make sure they can be caught.

Also, thanks for the pointer regarding sanitize_check_bounds() (sorry
for the delay; the message is still on my to-do list). I will address it
in v4 if it is safe or send a separate fix if it is indeed a bug.

