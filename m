Return-Path: <linuxppc-dev+bounces-9118-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E0612ACCEA4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Jun 2025 23:07:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bBjwF4JLxz2yZS;
	Wed,  4 Jun 2025 07:07:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:638:a000:1025::14"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748984861;
	cv=none; b=oLmNmQVPYoHT1MaVHEVSKjndZlfXViUm0NmUatN0DweFRH9m4rXyyC+jXCmSTX9RtU9bhOFDpWWI4nxFo8GiKbdyAMICn6FBlXuYx6FX9Ha+F+R3sAgJBjgXaUaYEHgHVkupwf8I6t0JrVfU0HdLZeowEeuTJcPl2GMX9yEL+wsc4VEh5IOmQKU+dK/rh1XHOhH7Q/5ZJsF7GFVeiqei4/p//t3Js/3hszhgcByVhUs7NwENOLTBtiUb155SEn+knB6hs12l44aBHrr9e0Jt6GVefJj0H14l0m3utG5Er2b/go/k8/0XPErvErNTURPaPaE8HEuij9EoREAaD/r7Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748984861; c=relaxed/relaxed;
	bh=14iBWL0wepR+/NLmlKQ5GYaXgIUdICdBtkY2wCSNDec=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=G8PUmGQArHMVoIJ0NDH1c/ZayBw74bV0BbQOe92H8xSFM3kU4DR6IRDVo0iNTckhVjDW+QACzCcXQ8kZ++X3UqZ7BOr8k4Xr7IuuEW5GcQ3OKLKG4XAK/fYowSZyJg+g55/wBg9dnkN8xp8M1ptQ98j+DDgWDf2sHysRHJJopQA0K/XJEHCfFJ9j/CxMdy8jrJVLfUkyHqyBwwdahp+CK6r+8oo+oFzjXWkbv3WGhbzvnRvr4bcv/SnlhSZaJlJLK34ndUmYdAg/TkOuOSUwLwkYbHjbs2zTkQ7zXCbHXfOneqv+AlBF25HAKzm4C1e6za/+f/xZqWfWoaP7QpmAwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de; dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=IBFvhYON; dkim-atps=neutral; spf=pass (client-ip=2001:638:a000:1025::14; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org) smtp.mailfrom=fau.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=fau.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=fau.de header.i=@fau.de header.a=rsa-sha256 header.s=fau-2021 header.b=IBFvhYON;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=fau.de (client-ip=2001:638:a000:1025::14; helo=mx-rz-1.rrze.uni-erlangen.de; envelope-from=luis.gerhorst@fau.de; receiver=lists.ozlabs.org)
Received: from mx-rz-1.rrze.uni-erlangen.de (mx-rz-1.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::14])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bBjwD6HXyz2yZ6
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Jun 2025 07:07:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fau.de; s=fau-2021;
	t=1748984854; bh=14iBWL0wepR+/NLmlKQ5GYaXgIUdICdBtkY2wCSNDec=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From:To:CC:
	 Subject;
	b=IBFvhYONv1CxQ8hzdbccA0do1pDzSADmtjNUFlQU2JzbsM12pPTYhLqvp37pahvoE
	 rrSrdmfNp3Nt5YGuMGnGjDGzELq5uRsNqxzq59EQ9Y+oEFk/5LUgAmyLeW3lTt8liJ
	 PlK98jVBngVNcPhrktkxboft4I+BIC2odUZKVqEsSrdJKgB98QfpDecgaq8hYROMWk
	 rqSxwb0QPnb1QogbfEmhDL03tC4gSOK4xXbwLWMwnOZLdU7sIjNK2N2/70zNkTHzr5
	 Ick8KcekAT4d/emYkOsQucPmA6u70cGX/m+ebNbKfXlTQlmQzIjB+icu8wvzfzGkSX
	 sHL3W5JZwzsBA==
Received: from mx-rz-smart.rrze.uni-erlangen.de (mx-rz-smart.rrze.uni-erlangen.de [IPv6:2001:638:a000:1025::1e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-rz-1.rrze.uni-erlangen.de (Postfix) with ESMTPS id 4bBjw63sNsz8swQ;
	Tue,  3 Jun 2025 23:07:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at boeck1.rrze.uni-erlangen.de (RRZE)
X-RRZE-Flag: Not-Spam
X-RRZE-Submit-IP: 2001:9e8:3639:fe00:a21f:4ce4:8495:5578
Received: from localhost (unknown [IPv6:2001:9e8:3639:fe00:a21f:4ce4:8495:5578])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: U2FsdGVkX19rrgm+35nUwSoCdL9l4H5ISQMck9KR3zw=)
	by smtp-auth.uni-erlangen.de (Postfix) with ESMTPSA id 4bBjw24t9Nz8shV;
	Tue,  3 Jun 2025 23:07:30 +0200 (CEST)
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
Subject: Re: [PATCH bpf-next v3 10/11] bpf: Allow nospec-protected
 var-offset stack access
In-Reply-To: <CAP01T76HZ+s5h+_REqRFkRjjoKwnZZn9YswpSVinGicah1pGJw@mail.gmail.com>
	(Kumar Kartikeya Dwivedi's message of "Fri, 2 May 2025 02:03:12 +0200")
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
	<20250501073603.1402960-11-luis.gerhorst@fau.de>
	<CAP01T76HZ+s5h+_REqRFkRjjoKwnZZn9YswpSVinGicah1pGJw@mail.gmail.com>
User-Agent: mu4e 1.12.8; emacs 30.1
Date: Tue, 03 Jun 2025 23:07:30 +0200
Message-ID: <874iwwlejx.fsf@fau.de>
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

> Hmm, while reading related code, I noticed that sanitize_check_bounds
> returns 0 in case the type is not map_value or stack.
> It seems like it should be returning an error, cannot check right now
> but I'm pretty sure these are not the two pointer types unprivileged
> programs can access?
> So smells like a bug?

I now looked into this and as suspected it does not appear to be a bug
but only misleading code, I have sent a patch with a detailed
explanation and an assert:
https://lore.kernel.org/bpf/20250603204557.332447-1-luis.gerhorst@fau.de/T/#u

