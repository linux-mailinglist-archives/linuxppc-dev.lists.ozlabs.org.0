Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 094E76D07E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 16:53:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qHFS1WWZzDqHY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 00:53:32 +1000 (AEST)
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
 header.b="BvozhdyN"; dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qH7X1zyfzDqCX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 00:48:20 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id r9so27632791ljg.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rasmusvillemoes.dk; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qOzcTnaZtrCxVZ+wrCV9j1v3ZSJaRvDDDE3Ip4m8PX4=;
 b=BvozhdyNjQm5IKs1TT9YoWn3Ui6wySHrveALu6p1t7AtDp7QFxBLfHh88f5ww+lLJn
 uwy3k971xxqR/HSbz4pAOIhSLMVdxGZ//qhiRBmEGbP5iSimOi3DrF8NmakZGMPtS2dX
 7klk9Axk//12MJN1Z1lHBXwZgwDxdfLj6taYs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qOzcTnaZtrCxVZ+wrCV9j1v3ZSJaRvDDDE3Ip4m8PX4=;
 b=aZl7lSoxbjckW+KKUKM/Ax+tuq+UcBP79c7i+ZpPEw9BZWeINM9Ho5o3TaCmj8bGQK
 UjnDSuLXwU3wSKH1aBpzA2MIEsZrLxZNgWoTiSMo+e2gaitzFOUAqODA0VuSLRFA7/Vu
 0A0XJ3ITzFd2n/qvMpZZ5GZEhNTs8lFxwQ3LqgnULfY1wmPSiN0LVtvtCv1nRzyWI2GO
 4U83xPVGXsH9tRZQFOL5NJ5H0diMfS92DhDMTn3ULcBWC/cC1LT/C9s37DLfns1OO5Lp
 AJufH3Dd9c8QD+4891pnFlHkE6UxNEsZ4ebQGP2FPgexUHadn8CK4b48A6xRaqUimN6e
 PutA==
X-Gm-Message-State: APjAAAUFC7mKry4tY3Sn8ckn1bDNmAyPaj3A2SwOfjsUNoKIcbs2JSeo
 ott5swcZabJGHH5mT/hfOZg=
X-Google-Smtp-Source: APXvYqxmTPpUAHG/iv/MbFly8EXHSdBuBHGZ2qYmzwo/cj6avvxhzmR7eZRDDVHxMRGQ2XfudRkVGQ==
X-Received: by 2002:a05:651c:d1:: with SMTP id
 17mr24822389ljr.174.1563461295757; 
 Thu, 18 Jul 2019 07:48:15 -0700 (PDT)
Received: from [172.16.11.28] ([81.216.59.226])
 by smtp.gmail.com with ESMTPSA id t4sm5672901ljh.9.2019.07.18.07.48.13
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Jul 2019 07:48:15 -0700 (PDT)
Subject: Re: [PATCH v9 08/10] open: openat2(2) syscall
To: Aleksa Sarai <cyphar@cyphar.com>, Al Viro <viro@zeniv.linux.org.uk>,
 Jeff Layton <jlayton@kernel.org>, "J. Bruce Fields" <bfields@fieldses.org>,
 Arnd Bergmann <arnd@arndb.de>, David Howells <dhowells@redhat.com>,
 Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>
References: <20190706145737.5299-1-cyphar@cyphar.com>
 <20190706145737.5299-9-cyphar@cyphar.com>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Message-ID: <845e4364-685f-343b-46fb-c418766dce3e@rasmusvillemoes.dk>
Date: Thu, 18 Jul 2019 16:48:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190706145737.5299-9-cyphar@cyphar.com>
Content-Type: text/plain; charset=windows-1252
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
 Alexei Starovoitov <ast@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
 linux-kselftest@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, Aleksa Sarai <asarai@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, linuxppc-dev@lists.ozlabs.org,
 linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>,
 David Drysdale <drysdale@google.com>, Christian Brauner <christian@brauner.io>,
 linux-parisc@vger.kernel.org, linux-api@vger.kernel.org,
 Chanho Min <chanho.min@lge.com>, linux-kernel@vger.kernel.org,
 Eric Biederman <ebiederm@xmission.com>, linux-alpha@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 containers@lists.linux-foundation.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 06/07/2019 16.57, Aleksa Sarai wrote:
> 
> --- a/fs/open.c
> +++ b/fs/open.c
> @@ -928,24 +928,32 @@ struct file *open_with_fake_path(const struct path *path, int flags,
>  }
>  EXPORT_SYMBOL(open_with_fake_path);
>  
> -static inline int build_open_flags(int flags, umode_t mode, struct open_flags *op)
> +static inline int build_open_flags(struct open_how how, struct open_flags *op)
>  {

How does passing such a huge struct by value affect code generation?
Does gcc actually inline the function (and does it even inline the old
one given that it's already non-trivial and has more than one caller).

>  	int lookup_flags = 0;
> -	int acc_mode = ACC_MODE(flags);
> +	int opath_mask = 0;
> +	int acc_mode = ACC_MODE(how.flags);
> +
> +	if (how.resolve & ~VALID_RESOLVE_FLAGS)
> +		return -EINVAL;
> +	if (!(how.flags & (O_PATH | O_CREAT | __O_TMPFILE)) && how.mode != 0)
> +		return -EINVAL;
> +	if (memchr_inv(how.reserved, 0, sizeof(how.reserved)))
> +		return -EINVAL;

How about passing how by const reference, and copy the few fields you
need to local variables. That would at least simplify this patch by
eliminating a lot of the

> -	flags &= VALID_OPEN_FLAGS;
> +	how.flags &= VALID_OPEN_FLAGS;
>  
> -	if (flags & (O_CREAT | __O_TMPFILE))
> -		op->mode = (mode & S_IALLUGO) | S_IFREG;
> +	if (how.flags & (O_CREAT | __O_TMPFILE))
> +		op->mode = (how.mode & S_IALLUGO) | S_IFREG;

churn.

>  
> diff --git a/include/linux/fcntl.h b/include/linux/fcntl.h
> index 2868ae6c8fc1..e59917292213 100644
> --- a/include/linux/fcntl.h
> +++ b/include/linux/fcntl.h
> @@ -4,13 +4,26 @@
>  
>  #include <uapi/linux/fcntl.h>
>  
> -/* list of all valid flags for the open/openat flags argument: */
> +/* Should open_how.mode be set for older syscalls wrappers? */
> +#define OPENHOW_MODE(flags, mode) \
> +	(((flags) | (O_CREAT | __O_TMPFILE)) ? (mode) : 0)
> +

Typo: (((flags) & (O_CREAT | __O_TMPFILE)) ? (mode) : 0)

> +/**
> + * Arguments for how openat2(2) should open the target path. If @extra is zero,
> + * then openat2(2) is identical to openat(2).
> + *
> + * @flags: O_* flags (unknown flags ignored).
> + * @mode: O_CREAT file mode (ignored otherwise).

should probably say "O_CREAT/O_TMPFILE file mode".

> + * @upgrade_mask: restrict how the O_PATH may be re-opened (ignored otherwise).
> + * @resolve: RESOLVE_* flags (-EINVAL on unknown flags).
> + * @reserved: reserved for future extensions, must be zeroed.
> + */
> +struct open_how {
> +	__u32 flags;
> +	union {
> +		__u16 mode;
> +		__u16 upgrade_mask;
> +	};
> +	__u16 resolve;

So mode and upgrade_mask are naturally u16 aka mode_t. And yes, they
probably never need to be used together, so the union works. That then
makes the next member 2-byte aligned, so using a u16 for the resolve
flags brings us to an 8-byte boundary, and 11 unused flag bits should be
enough for a while. But it seems a bit artificial to cram all this
together and then add 56 bytes of reserved space.

Rasmus
