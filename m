Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EC26F1085F1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 01:30:26 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47LnxW2492zDqZp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 11:30:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=ftp.linux.org.uk (client-ip=195.92.253.2;
 helo=zeniv.linux.org.uk; envelope-from=viro@ftp.linux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=zeniv.linux.org.uk
Received: from ZenIV.linux.org.uk (zeniv.linux.org.uk [195.92.253.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Lnvb0PF4zDqWg
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 11:28:40 +1100 (AEDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1iZ2Ca-0003Ob-Hr; Mon, 25 Nov 2019 00:26:04 +0000
Date: Mon, 25 Nov 2019 00:26:04 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v17 08/13] namei: LOOKUP_BENEATH: O_BENEATH-like scoped
 resolution
Message-ID: <20191125002604.GE4203@ZenIV.linux.org.uk>
References: <20191117011713.13032-1-cyphar@cyphar.com>
 <20191117011713.13032-9-cyphar@cyphar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191117011713.13032-9-cyphar@cyphar.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
Cc: Song Liu <songliubraving@fb.com>, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, containers@lists.linux-foundation.org,
 Christian Brauner <christian.brauner@ubuntu.com>, linux-api@vger.kernel.org,
 Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Tycho Andersen <tycho@tycho.ws>,
 Daniel Borkmann <daniel@iogearbox.net>, Jonathan Corbet <corbet@lwn.net>,
 Jiri Olsa <jolsa@redhat.com>, linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org,
 Yonghong Song <yhs@fb.com>, linux-mips@vger.kernel.org,
 Andrii Nakryiko <andriin@fb.com>, bpf@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linuxppc-dev@lists.ozlabs.org, dev@opencontainers.org,
 linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 "J. Bruce Fields" <bfields@fieldses.org>, libc-alpha@sourceware.org,
 Aleksa Sarai <asarai@suse.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Chanho Min <chanho.min@lge.com>,
 Jeff Layton <jlayton@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Nov 17, 2019 at 12:17:08PM +1100, Aleksa Sarai wrote:

> +	if (unlikely(nd->flags & LOOKUP_IS_SCOPED)) {
> +		/*
> +		 * Do a final check to ensure that the path didn't escape. Note
> +		 * that this should already be guaranteed by all of the other
> +		 * LOOKUP_IS_SCOPED checks (and delaying this check this late
> +		 * does open the door to some possible timing-based attacks).
> +		 */
> +		if (WARN_ON(!path_is_under(&nd->path, &nd->root)))
> +			return -EXDEV;

I don't like that.  What it gives is an ability to race that with
rename(), with user-triggered WARN_ON.  You *can't* promise that result of
lookup is in a subtree, simply because it can get moved just as you've
declared it to be in the clear.

	Anyone who relies upon that is delusional; it really can't be done.
What warranties LOOKUP_IS_SCOPED is really supposed to provide?  That we do not
attempt to walk out of the subtree rooted at the start point?  Fine, but this
is not what this test does.  What are you trying to achieve there?  If it's
"what we'd got was at one point in our subtree", the test is more or less
right, but WARN_ON isn't.
