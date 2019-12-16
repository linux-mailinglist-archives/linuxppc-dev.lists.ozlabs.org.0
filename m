Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CBEAA1219E2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2019 20:24:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47cB5y4SMGzDqJM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2019 06:24:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=fweimer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.b="VzfwudNG"; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47cB431465zDqGG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2019 06:22:18 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576524134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VtkF9pHGZsyliJKUJABIfCKJr6vj2FAkM023k13AsQQ=;
 b=VzfwudNGXNhDjc3xietN1UYdtS/OFZdZBohA07Dy0gG5En9CFXkZKwrxNFv+iAZsfvOoEo
 KZCF4Zr9nzA4/ylP8aNSvsMS8/OaAa7rdljWS3udMKhiyw17mDfpXI3zPlZomZDBr4CfZ3
 3j42+7P0lKVQjM+tGdvlFlEMu5Ch3RU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-8M_kp1MVMMiSfRvEFI4Tyw-1; Mon, 16 Dec 2019 14:22:11 -0500
X-MC-Unique: 8M_kp1MVMMiSfRvEFI4Tyw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9666C10054E3;
 Mon, 16 Dec 2019 19:22:05 +0000 (UTC)
Received: from oldenburg2.str.redhat.com (ovpn-116-242.ams2.redhat.com
 [10.36.116.242])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C537960BE0;
 Mon, 16 Dec 2019 19:22:00 +0000 (UTC)
Received: by oldenburg2.str.redhat.com (Postfix, from userid 1000)
 id B9F19832924A; Mon, 16 Dec 2019 20:21:58 +0100 (CET)
References: <20191206141338.23338-1-cyphar@cyphar.com>
 <20191206141338.23338-12-cyphar@cyphar.com>
To: Aleksa Sarai <cyphar@cyphar.com>
Subject: Re: [PATCH v18 11/13] open: introduce openat2(2) syscall
From: Florian Weimer <fweimer@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf8
In-Reply-To: <20191206141338.23338-12-cyphar@cyphar.com> (Aleksa Sarai's
 message of "Sat, 7 Dec 2019 01:13:36 +1100")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Date: Mon, 16 Dec 2019 20:20:17 +0100
Message-Id: <20191216192158.B9F19832924A@oldenburg2.str.redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Content-Transfer-Encoding: quoted-printable
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
 Alexei Starovoitov <ast@kernel.org>, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-kselftest@vger.kernel.org,
 sparclinux@vger.kernel.org, containers@lists.linux-foundation.org,
 Shuah Khan <shuah@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Daniel Borkmann <daniel@iogearbox.net>,
 Jonathan Corbet <corbet@lwn.net>, Jiri Olsa <jolsa@redhat.com>,
 linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Ingo Molnar <mingo@redhat.com>, Yonghong Song <yhs@fb.com>,
 Andrii Nakryiko <andriin@fb.com>, bpf@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Jann Horn <jannh@google.com>,
 linux-alpha@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 dev@opencontainers.org, linux-m68k@lists.linux-m68k.org,
 Al Viro <viro@zeniv.linux.org.uk>, Andy Lutomirski <luto@kernel.org>,
 Shuah Khan <skhan@linuxfoundation.org>, Namhyung Kim <namhyung@kernel.org>,
 David Drysdale <drysdale@google.com>, linux-arm-kernel@lists.infradead.org,
 "J. Bruce Fields" <bfields@fieldses.org>, libc-alpha@sourceware.org,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 Chanho Min <chanho.min@lge.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 Eric Biederman <ebiederm@xmission.com>, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, Martin KaFai Lau <kafai@fb.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Aleksa Sarai:

> diff --git a/include/uapi/linux/fcntl.h b/include/uapi/linux/fcntl.h
> index 1d338357df8a..58c3a0e543c6 100644
> --- a/include/uapi/linux/fcntl.h
> +++ b/include/uapi/linux/fcntl.h
> @@ -93,5 +93,40 @@
> =20
>  #define AT_RECURSIVE		0x8000	/* Apply to the entire subtree */
> =20
> +/*
> + * Arguments for how openat2(2) should open the target path. If @resol=
ve is
> + * zero, then openat2(2) operates very similarly to openat(2).
> + *
> + * However, unlike openat(2), unknown bits in @flags result in -EINVAL=
 rather
> + * than being silently ignored. @mode must be zero unless one of {O_CR=
EAT,
> + * O_TMPFILE} are set.
> + *
> + * @flags: O_* flags.
> + * @mode: O_CREAT/O_TMPFILE file mode.
> + * @resolve: RESOLVE_* flags.
> + */
> +struct open_how {
> +	__aligned_u64 flags;
> +	__u16 mode;
> +	__u16 __padding[3]; /* must be zeroed */
> +	__aligned_u64 resolve;
> +};
> +
> +#define OPEN_HOW_SIZE_VER0	24 /* sizeof first published struct */
> +#define OPEN_HOW_SIZE_LATEST	OPEN_HOW_SIZE_VER0
> +
> +/* how->resolve flags for openat2(2). */
> +#define RESOLVE_NO_XDEV		0x01 /* Block mount-point crossings
> +					(includes bind-mounts). */
> +#define RESOLVE_NO_MAGICLINKS	0x02 /* Block traversal through procfs-s=
tyle
> +					"magic-links". */
> +#define RESOLVE_NO_SYMLINKS	0x04 /* Block traversal through all symlin=
ks
> +					(implies OEXT_NO_MAGICLINKS) */
> +#define RESOLVE_BENEATH		0x08 /* Block "lexical" trickery like
> +					"..", symlinks, and absolute
> +					paths which escape the dirfd. */
> +#define RESOLVE_IN_ROOT		0x10 /* Make all jumps to "/" and ".."
> +					be scoped inside the dirfd
> +					(similar to chroot(2)). */
> =20
>  #endif /* _UAPI_LINUX_FCNTL_H */

Would it be possible to move these to a new UAPI header?

In glibc, we currently do not #include <linux/fcntl.h>.  We need some of
the AT_* constants in POSIX mode, and the header is not necessarily
namespace-clean.  If there was a separate header for openat2 support, we
could use that easily, and we would only have to maintain the baseline
definitions (which never change).

Thanks,
Florian

