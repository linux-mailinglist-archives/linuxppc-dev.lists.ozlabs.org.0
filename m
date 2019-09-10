Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 044B4AE3D9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 08:37:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46SFh40wzszDqYC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Sep 2019 16:37:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=mingo.kernel.org@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="RT2CZzYf"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46SFf74lFYzDqVv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2019 16:35:40 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id t16so17623758wra.6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2019 23:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=9uC8BSyBqqvpBHr+UBJrMjpTjeLS9eaSkiimfXBOGmI=;
 b=RT2CZzYflWq0hJIviZ1qNiz7T8GR4+WUrisMZXe3m9cauTkqIyyVGGFPULrde7A02W
 tj7FplDkEllE02owPbUYDzEtapP1C48use/4kFc7fZZmFt/DdDZTI55D8qvOaO2r24Ne
 q4FNPrvlkjfx+lYW3lSYcZ69k2e463dcG9Y4rn+PPa/Glpr++eDfgJ8gFO5kdGQ+ZZAk
 nXhnUxrt/DhKZTkCCWYef7FPywkEzNn0z8LUShNXRMIkZZwOG/G3kJoXGIwG7zGeC0aS
 TI+DZ2QVgsA7VVK9EZCvbN7bPdpk9PkNXAPdUVWeWNcFfO4yiY8K5tj2pJUrGvJYeUSW
 9/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=9uC8BSyBqqvpBHr+UBJrMjpTjeLS9eaSkiimfXBOGmI=;
 b=hH7cJmzrb4qxU6y1LKQ/4hyQc+FtYW0iDPD89t1+8+tF0KuK1qx1PDBxD7sRrrAK+K
 23LF3UzjdzJyspa9Nbxdqgkoa1EVbVaNyBWN12VVQBaDbMzESZqPNrPVvgGXdtQ09J7B
 J6tWLiDssJn7acEg4pe1GWhZQZm1Vlowj+9T0SD3l4km77aMpedh9EdZ9ZLc57Dg/jyE
 crzXBJ2S31ZwfDF8WuuleKbDYm9pyOZOpYBxX8O2kwDF96MphIjajHsNlOoqKU4XntXj
 fhkduLfVT7n+nftLsIqjjsV2ZOF9R6P1reUk/gTfs52eJQ+2VP6NcPYtB+52ae/a1XgU
 xDiQ==
X-Gm-Message-State: APjAAAWdGCgjda8P5SGM3unZOnzaMM03MXUC858dtbOgyVRYLZjwx4NY
 1btPrZOpNkQrr6i1MwIWhLE=
X-Google-Smtp-Source: APXvYqw8XHm4leFwnC6sWR8BjhyMsv0e/YjeclMhzrktUUdT/wG1WxzN3IHekSLZEGkf3MnHklk0qA==
X-Received: by 2002:a5d:6b0f:: with SMTP id v15mr22340960wrw.19.1568097336267; 
 Mon, 09 Sep 2019 23:35:36 -0700 (PDT)
Received: from gmail.com (2E8B0CD5.catv.pool.telekom.hu. [46.139.12.213])
 by smtp.gmail.com with ESMTPSA id u22sm32329249wru.72.2019.09.09.23.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2019 23:35:35 -0700 (PDT)
Date: Tue, 10 Sep 2019 08:35:32 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [PATCH v12 11/12] open: openat2(2) syscall
Message-ID: <20190910063532.GB1579@gmail.com>
References: <20190904201933.10736-1-cyphar@cyphar.com>
 <20190904201933.10736-12-cyphar@cyphar.com>
 <7236f382d72130f2afbbe8940e72cc67e5c6dce0.camel@kernel.org>
 <CAHk-=whZx97Nm-gUK0ppofj2RA2LLz2vmaDUTKSSV-+yYB9q_Q@mail.gmail.com>
 <C81D6D29-F6BF-48E6-A15E-3ABCB2C992E5@amacapital.net>
 <CAHk-=whe90Ec_RRrMRLE0=bJOHNS9YmVwcytVxmrfK3oCuZF6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHk-=whe90Ec_RRrMRLE0=bJOHNS9YmVwcytVxmrfK3oCuZF6A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-ia64@vger.kernel.org, Linux-sh list <linux-sh@vger.kernel.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>,
 Linux List Kernel Mailing <linux-kernel@vger.kernel.org>,
 David Howells <dhowells@redhat.com>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 sparclinux@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>, Tycho Andersen <tycho@tycho.ws>,
 Aleksa Sarai <asarai@suse.de>, Jiri Olsa <jolsa@redhat.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 Namhyung Kim <namhyung@kernel.org>, David Drysdale <drysdale@google.com>,
 Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, linux-parisc@vger.kernel.org,
 linux-m68k <linux-m68k@lists.linux-m68k.org>,
 Linux API <linux-api@vger.kernel.org>, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Andy Lutomirski <luto@amacapital.net>, Eric Biederman <ebiederm@xmission.com>,
 alpha <linux-alpha@vger.kernel.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Linux Containers <containers@lists.linux-foundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


* Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Sat, Sep 7, 2019 at 10:42 AM Andy Lutomirski <luto@amacapital.net> wrote:
> >
> > Linus, you rejected resolveat() because you wanted a *nice* API
> 
> No. I rejected resoveat() because it was a completely broken garbage
> API that couldn't do even basic stuff right (like O_CREAT).
> 
> We have a ton of flag space in the new openat2() model, we might as
> well leave the old flags alone that people are (a) used to and (b) we
> have code to support _anyway_.
> 
> Making up a new flag namespace is only going to cause us - and users -
> more work, and more confusion. For no actual advantage. It's not going
> to be "cleaner". It's just going to be worse.

I suspect there is a "add a clean new flags namespace" analogy to the 
classic "add a clean new standard" XKCD:

	https://xkcd.com/927/

Thanks,

	Ingo
