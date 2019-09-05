Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C14AA125
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 13:20:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PJBZ6fWWzDqys
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 21:20:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=rasmusvillemoes.dk
 (client-ip=2a00:1450:4864:20::243; helo=mail-lj1-x243.google.com;
 envelope-from=linux@rasmusvillemoes.dk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=rasmusvillemoes.dk
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=rasmusvillemoes.dk header.i=@rasmusvillemoes.dk
 header.b="TmAHYZxq"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PJ7z6J4kzDqth
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Sep 2019 21:17:50 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id d5so2011882lja.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Sep 2019 04:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=FZQLTiI56V9ejCTERxmKEuoyOsqpXI4ROWUat/u48IQ=;
 b=TmAHYZxqRc6xu2le8iULfxikI7ku0uT9OqruTeiVIjBtHlSUVtr7xfmu4YCFlsjTOs
 Rhq1GYmaO5KwXBXGMlzcAxQ/LcO6e9A60OIH5XcxDVVNn2uwqfJXj5l04xQJTBjas8S+
 rezhJDHHi4QSeAmUuvBdnaXdMHr6k1YEDw8fQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FZQLTiI56V9ejCTERxmKEuoyOsqpXI4ROWUat/u48IQ=;
 b=FVH9XJCBtBySXErK0CYRzQHU6Z1WBBJTQvjZ5MknG/Zi2/bHhOygQqpaFvw/UI5LbG
 RirN9Y6CISDkv1tHWJQWiM9XyV7ZZmjUBvGLYxoka/gSPMhJNREgH44VEpyo/b8SMc2b
 gSgSY0JMCaITWwECNV4+ojcKd9Mtn+hsXuzbRd9pC5RRHVKNJu4iLzG/U6Fplag4e+Ji
 SgNnwRt7NIJxuG6bN9jLGjonPDTSPS/tpIjweVXNJbEcIukz7PPlmOo4qgCICGmAGFW4
 Qyn6VqFDwccZQrsyCIpU4I51HyDYZrapYQ3I69pZhIIzaQqqSyhW6AAeGkN6EDV2+6ad
 1UKQ==
X-Gm-Message-State: APjAAAUkNK2PCSgXrc0ScKwPuaPZWAZNPVnJiPmUjW4/jYt4fEsB8FVd
 Gz/d44TbaO53CVEmd+u26oVGOg==
X-Google-Smtp-Source: APXvYqy+jIyWA4s/Awrv2CCVQWWEoIb0eYt4SAhqVoZ9KSv6Iim6pns0uTxVPV5vb5IsmAlCA9M4vg==
X-Received: by 2002:a2e:5418:: with SMTP id i24mr1705390ljb.126.1567682261376; 
 Thu, 05 Sep 2019 04:17:41 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id l3sm377157lfc.31.2019.09.05.04.17.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 05 Sep 2019 04:17:40 -0700 (PDT)
Subject: Re: [PATCH v12 01/12] lib: introduce copy_struct_{to,from}_user
 helpers
To: Christian Brauner <christian.brauner@ubuntu.com>,
 Aleksa Sarai <cyphar@cyphar.com>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-2-cyphar@cyphar.com>
 <20190905110544.d6c5t7rx25kvywmi@wittgenstein>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <ae415ea8-4442-d81c-3b46-2ae5fb35bbdf@rasmusvillemoes.dk>
Date: Thu, 5 Sep 2019 13:17:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905110544.d6c5t7rx25kvywmi@wittgenstein>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, Alexei Starovoitov <ast@kernel.org>,
 linux-kernel@vger.kernel.org, David Howells <dhowells@redhat.com>,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 Jiri Olsa <jolsa@redhat.com>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, Shuah Khan <shuah@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 linux-mips@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Namhyung Kim <namhyung@kernel.org>, David Drysdale <drysdale@google.com>,
 Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 linux-api@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05/09/2019 13.05, Christian Brauner wrote:
> On Thu, Sep 05, 2019 at 06:19:22AM +1000, Aleksa Sarai wrote:

>> +	if (unlikely(!access_ok(dst, usize)))
>> +		return -EFAULT;
>> +
>> +	/* Deal with trailing bytes. */
>> +	if (usize < ksize) {
>> +		if (memchr_inv(src + size, 0, rest))
>> +			return -EFBIG;
>> +	} else if (usize > ksize) {
>> +		if (__memzero_user(dst + size, rest))
>> +			return -EFAULT;
> 
> Is zeroing that memory really our job? Seems to me we should just check
> it is zeroed.

Of course it is, otherwise you'd require userspace to clear the output
buffer it gives us, which in the majority of cases is wasted work. It's
much easier to reason about if we just say "the kernel populates [uaddr,
uaddr + usize)".

It's completely symmetric to copy_struct_from_user doing a memset() of
the tail of the kernel buffer in case of ksize>usize - you wouldn't want
to require the kernel callers to pass a zeroed buffer to
copy_struct_from_user() - it's just that when we memset(__user*),
there's an error check to do.

Rasmus
