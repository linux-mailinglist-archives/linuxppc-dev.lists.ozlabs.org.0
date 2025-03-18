Return-Path: <linuxppc-dev+bounces-7169-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DC3A66D11
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Mar 2025 08:59:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZH44f00YZz2yr1;
	Tue, 18 Mar 2025 18:59:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:638:a000:1025::16"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742284785;
	cv=none; b=jqBvLtwUpYXqfqQt/cG8H5mKqDgCBxiVQuch9X42T9/VowAbVl4KZ8jel6yNYukpSKREA3hcbgme+LcO7SZuSZNFshUYEVE1MgOKsmWHnB/vgFehRmcIxGTvdNyMt8rZTbtNdrx8mRtWXaWZHCxIjkFGFg3Yq4SuEKiBlYme8GETYwfRgjVqsFqAlDmpQNhjGA1ZCeiE/3mAFRNZBh8abKQJWMwcqQffymqsA0wtVwQU6lxVIryl+WqqjCMNz/MVL6NLqSZ/i4bKSBSs5wRNTE5OgM8f07ODxwy64nddmSUBvVKt2HQvoGvSb6H32/U4lhXmoRMDlKcxmhuG7AMCRg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742284785; c=relaxed/relaxed;
	bh=T8g3BGN/mHpuPfK1H4SEVNvXxea99G16e6oOkBugydQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=YGCwBJ9kEueoV6wxR+wfeikGF7LeZa65skfAdZglxiPXnijmxbfYe122LU5nQntvv+qWmiyfQyhy0HAco9BEtiHNl8Kv//8rqoZi3g/rqJRXuOgN5tmPecLLpOdJP1yzfTyaCVvXeg9p8bH5Zo44EX06XBPMAJtICCUpa0tZMySt0DYtDob8lXptN8E4Sxv+bSKKxQds7xldaAeIQAwtC8ghO21Qn9S523ZLKjAYBDM0vWwl2SBr/DkW29Z0fBkDmj4GQ5gCMx3yG44eHne7M6WRf5m9tRI1/niFK9NRp3KvfBjjDhQpeJPqJGirtKwMjMssvklAS2doMeI3dK43Vw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=keevS7Wo; dkim-atps=neutral; spf=pass (client-ip=2001:638:a000:1025::16; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=keevS7Wo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=2001:638:a000:1025::16; helo=mx-rz-3.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-3.rrze.uni-erlangen.de (mx-rz-3.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::16])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZH44Z2PM3z2yfS
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 18:59:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1742284770; bh=T8g3BGN/mHpuPfK1H4SEVNvXxea99G16e6oOkBugydQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=keevS7WotUTlE4uv/uI0BB9M4xxOkfuah7+yI24TqsIPktTPJvCGGObVIIW6jeZKP
	 w/bt5U30Oj42lmLjgCWzHND/darszlQnzkm2TfzKKC+5r8+zbw9gW/2+jMj1r8WoJN
	 GWRd9JqWh62APoSyejo2Ue2ELzZ0R2JZChH0j3j5Gac6QGaEneNPA6B1S4KPi+9Ymt
	 yq1OYftJSwHLFuepJ7+09KW9dPLsPrN4xGbBORAPBGx98UMms/frWVgz3oxRkMuf8t
	 uCDu2K54M6rBVztc9Rrz/SOMocwXb+IlFyT1Lw80YIgT51+KovX1JWNEK+/fOk+RjO
	 cQLLlEgHw199w==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-3.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4ZH44K5yb4z1xqh;
	Tue, 18 Mar 2025 08:59:29 +0100 (CET)
X-Virus-Scanned: amavisd-new at boeck4.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2a02:8071:7900:bc0:c583:a400:7f8d:5e80
Received: from localhost (unknown [IPv6:2a02:8071:7900:bc0:c583:a400:7f8d:5e80])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX1/njMYOnHzLTANywgVWOWsVTWqW358Unx4=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4ZH44G1Xjqz1yjk;
	Tue, 18 Mar 2025 08:59:26 +0100 (CET)
From: Luis Gerhorst <luis.gerhorst@fau.de>
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,  Daniel Borkmann
 <daniel@iogearbox.net>,  Andrii Nakryiko <andrii@kernel.org>,  Martin
 KaFai Lau <martin.lau@linux.dev>,  Song Liu <song@kernel.org>,  Yonghong
 Song <yonghong.song@linux.dev>,  John Fastabend
 <john.fastabend@gmail.com>,  KP Singh <kpsingh@kernel.org>,  Stanislav
 Fomichev <sdf@fomichev.me>,  Hao Luo <haoluo@google.com>,  Jiri Olsa
 <jolsa@kernel.org>,  Puranjay Mohan <puranjay@kernel.org>,  Xu Kuohai
 <xukuohai@huaweicloud.com>,  Catalin Marinas <catalin.marinas@arm.com>,
  Will Deacon <will@kernel.org>,  Hari Bathini <hbathini@linux.ibm.com>,
  Christophe Leroy <christophe.leroy@csgroup.eu>,  Naveen N Rao
 <naveen@kernel.org>,  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael
 Ellerman <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,
  Mykola Lysenko <mykolal@fb.com>,  Shuah Khan <shuah@kernel.org>,
  Henriette Herzog <henriette.herzog@rub.de>,  Cupertino Miranda
 <cupertino.miranda@oracle.com>,  Matan Shachnai <m.shachnai@gmail.com>,
  Dimitar Kanaliev <dimitar.kanaliev@siteground.com>,  Shung-Hsi Yu
 <shung-hsi.yu@suse.com>,  Daniel Xu <dxu@dxuuu.xyz>,  bpf@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  linux-kselftest@vger.kernel.org,  George
 Guo <guodongtai@kylinos.cn>,  WANG Xuerui <git@xen0n.name>,  Tiezhu Yang
 <yangtiezhu@loongson.cn>,  Maximilian Ott <ott@cs.fau.de>,  Milan Stephan
 <milan.stephan@fau.de>
Subject: Re: [PATCH bpf-next 09/11] bpf: Return PTR_ERR from push_stack()
In-Reply-To: <9083b52fd4a2d7a5a0473e858042c277c883f8b0.camel@gmail.com>
	(Eduard Zingerman's message of "Mon, 17 Mar 2025 02:19:08 -0700")
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
	<20250313174149.1113165-1-luis.gerhorst@fau.de>
	<20250313174149.1113165-4-luis.gerhorst@fau.de>
	<9083b52fd4a2d7a5a0473e858042c277c883f8b0.camel@gmail.com>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Tue, 18 Mar 2025 08:59:24 +0100
Message-ID: <87r02uu5ur.fsf@fau.de>
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
Content-Type: text/plain
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Eduard Zingerman <eddyz87@gmail.com> writes:

> Could you please point me to a location, where exact error code
> returned by updated push_stack() matters?
> I checked push_stack() callgraph (in the attachment), but can't find
> anything.

Only with the final patch 11 ("bpf: Fall back to nospec for spec path
verification") applied, the error code should matter. Then, the error
code either matches `state->speculative &&
error_recoverable_with_nospec(err)` in do_check() if it was EINVAL (in
this case we heuristically avoided nested speculative path verification
but have to add a nospec), or we continue to raise the error (e.g.,
ENOMEM) from do_check().

Or is your question on this part from the commit message of patch 9?

  This changes the sanitization-case to returning -ENOMEM. However, this
  is more fitting as -EFAULT would indicate a verifier-internal bug.

This was referring to the sanitize_speculative_path() calls in
check_cond_jmp_op(). For that case, the error should also only be used
in do_check() with patch 11 applied. However, regarding this, EFAULT and
ENOMEM are treated the same (they both don't satisfy
error_recoverable_with_nospec()), therefore this change is primarily
made to not complicate the code.

I just became aware that there is some special handling of EFAULT as
discussed in c7a897843224 ("bpf: don't leave partial mangled prog in
jit_subprogs error path"). I will have look into this in detail to make
sure changing push_stack() from EFAULT to ENOMEM is OK.

Hope this answers your question.

Adding some of these details to v2 won't hurt I guess.

