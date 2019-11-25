Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 951761085FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 01:37:33 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Lp5k5qGMzDqXC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Nov 2019 11:37:30 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Lp3w0yc5zDqHG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Nov 2019 11:35:55 +1100 (AEDT)
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1iZ2LF-0003Zh-4M; Mon, 25 Nov 2019 00:35:01 +0000
Date: Mon, 25 Nov 2019 00:35:01 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v17 10/13] namei: LOOKUP_{IN_ROOT,BENEATH}: permit
 limited ".." resolution
Message-ID: <20191125003501.GF4203@ZenIV.linux.org.uk>
References: <20191117011713.13032-1-cyphar@cyphar.com>
 <20191117011713.13032-11-cyphar@cyphar.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191117011713.13032-11-cyphar@cyphar.com>
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

On Sun, Nov 17, 2019 at 12:17:10PM +1100, Aleksa Sarai wrote:
> +		if (unlikely(nd->flags & LOOKUP_IS_SCOPED)) {
> +			/*
> +			 * If there was a racing rename or mount along our
> +			 * path, then we can't be sure that ".." hasn't jumped
> +			 * above nd->root (and so userspace should retry or use
> +			 * some fallback).
> +			 */
> +			if (unlikely(read_seqretry(&mount_lock, nd->m_seq)))
> +				return -EAGAIN;
> +			if (unlikely(read_seqretry(&rename_lock, nd->r_seq)))
> +				return -EAGAIN;
> +		}

Looks like excessive barriers to me - it's
	rmb
	check mount_lock.sequence
	rmb
	check rename_lock.sequence

> @@ -2266,6 +2274,10 @@ static const char *path_init(struct nameidata *nd, unsigned flags)
>  	nd->last_type = LAST_ROOT; /* if there are only slashes... */
>  	nd->flags = flags | LOOKUP_JUMPED | LOOKUP_PARENT;
>  	nd->depth = 0;
> +
> +	nd->m_seq = read_seqbegin(&mount_lock);
> +	nd->r_seq = read_seqbegin(&rename_lock);

Same here, pretty much (fetch/rmb/fetch/rmb)
