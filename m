Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E51FE9F8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 01:59:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47FH0j4wcCzF7t3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Nov 2019 11:59:01 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47FGZG61bQzF7nJ
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Nov 2019 11:39:32 +1100 (AEDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1iVm5G-00041D-QH; Sat, 16 Nov 2019 00:37:02 +0000
Date: Sat, 16 Nov 2019 00:37:02 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v16 02/12] namei: allow nd_jump_link() to produce errors
Message-ID: <20191116003702.GX26530@ZenIV.linux.org.uk>
References: <20191116002802.6663-1-cyphar@cyphar.com>
 <20191116002802.6663-3-cyphar@cyphar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191116002802.6663-3-cyphar@cyphar.com>
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
 linux-sh@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Alexei Starovoitov <ast@kernel.org>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, containers@lists.linux-foundation.org,
 linux-api@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Daniel Borkmann <daniel@iogearbox.net>,
 Jiri Olsa <jolsa@redhat.com>,
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

On Sat, Nov 16, 2019 at 11:27:52AM +1100, Aleksa Sarai wrote:
> +	error = nd_jump_link(&path);
> +	if (error)
> +		path_put(&path);

> +	error = nd_jump_link(&ns_path);
> +	if (error)
> +		path_put(&ns_path);

> +	error = nd_jump_link(&path);
> +	if (error)
> +		path_put(&path);

3 calls.  Exact same boilerplate in each to handle a failure case.
Which spells "wrong calling conventions"; it's absolutely clear
that we want that path_put() inside nd_jump_link().

The rule should be this: reference that used to be held in
*path is consumed in any case.  On success it goes into
nd->path, on error it's just dropped, but in any case, the
caller has the same refcounting environment to deal with.

If you need the same boilerplate cleanup on failure again and again,
the calling conventions are wrong and need to be fixed.

And I'm not sure that int is the right return type here, to be honest.
void * might be better - return ERR_PTR() or NULL, so that the value
could be used as return value of ->get_link() that calls that thing.
