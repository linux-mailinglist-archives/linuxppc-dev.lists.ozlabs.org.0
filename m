Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E21DE35963F
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 09:20:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FGqKJ65Yxz3bxn
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Apr 2021 17:20:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=q+jIWwzI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=q+jIWwzI; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FGqJp3y6rz303f
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Apr 2021 17:19:54 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id w10so3224634pgh.5
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Apr 2021 00:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=3jpQ3lZXMgzXRrsRMytSQQwKCg9AstxjxLrChn5w6cw=;
 b=q+jIWwzIzCXrBiItIjor8RfQsqmwt6DshA3PoZ7NMrJqyNtdyJ0LgUsNWVzl4aOKHg
 GayOOz+5vGt68tGX998K17zkv/pxUanMYMydbCfrUqNlv6zBUtlUOqABluYnslJkSYfj
 ouAymLwFd5ba8qNr2yRQ8Bs74Vjhiz3Dbee28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=3jpQ3lZXMgzXRrsRMytSQQwKCg9AstxjxLrChn5w6cw=;
 b=TFCTXeKpdochpQZGAt2Zi3jQBRr/igrfpk4JgAZ+5dgT7BYdqBsLcm62oV/KjPzBPr
 REVjH1oto50esyNRmOqaGL7qho3A0ATJpkYpGZ7m0UiKsJG+DEarWCnTY96n9xtN4YT7
 hhoMWaP77/nuSItuM/CkikpP5FXgPdhNGlXvdrH6o+16AzmD/jKHtgTRQ5xxVKvf5fva
 mt+B2p5ggPx0PQ/4UsRJip0SP5aLNZPmdij1/NctSDLC0UGxPoq+FcP2Ze4KsmbYdN4L
 /2oeVq9zTlMKZy7pef1vy6E2UsChmzVbzm3W1xe/p/N9CMovUyCY8K4fB4qXb7WT/8EJ
 HUYw==
X-Gm-Message-State: AOAM532n9V6SPgQ+pzvckKYDtQyiABQjff5r5UOaaw58huQfSEWprqSv
 5Wqp8vpRkRmO+PA+iW8xyMCn4g==
X-Google-Smtp-Source: ABdhPJwPfAya/vYfNmH8mZgcEYD6mXq9hmGnG4qDZ1azfbvW7kO+y+hKgSmjhSYDNtCBTNVyuPSGKw==
X-Received: by 2002:a63:1c22:: with SMTP id c34mr5763854pgc.408.1617952791067; 
 Fri, 09 Apr 2021 00:19:51 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-600a-73c5-13c4-f875.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:600a:73c5:13c4:f875])
 by smtp.gmail.com with ESMTPSA id b21sm1357924pji.39.2021.04.09.00.19.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 09 Apr 2021 00:19:50 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au
Subject: Re: [PATCH v2 2/4] powerpc/selftests/perf-hwbreak: Coalesce event
 creation code
In-Reply-To: <20210407054938.312857-3-ravi.bangoria@linux.ibm.com>
References: <20210407054938.312857-1-ravi.bangoria@linux.ibm.com>
 <20210407054938.312857-3-ravi.bangoria@linux.ibm.com>
Date: Fri, 09 Apr 2021 17:19:47 +1000
Message-ID: <87k0pbgc18.fsf@linkitivity.dja.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ravi.bangoria@linux.ibm.com, mikey@neuling.org, shuah@kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ravi,

> perf-hwbreak selftest opens hw-breakpoint event at multiple places for
> which it has same code repeated. Coalesce that code into a function.
>
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>  .../selftests/powerpc/ptrace/perf-hwbreak.c   | 78 +++++++++----------

This doesn't simplify things very much for the code as it stands now,
but I think your next patch adds a bunch of calls to these functions, so
I agree that it makes sense to consolidate them now.

>  1 file changed, 38 insertions(+), 40 deletions(-)
>
> diff --git a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
> index c1f324afdbf3..bde475341c8a 100644
> --- a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
> +++ b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
> @@ -34,28 +34,46 @@
>  
>  #define DAWR_LENGTH_MAX ((0x3f + 1) * 8)
>  
> -static inline int sys_perf_event_open(struct perf_event_attr *attr, pid_t pid,
> -				      int cpu, int group_fd,
> -				      unsigned long flags)
> +static void perf_event_attr_set(struct perf_event_attr *attr,
> +				__u32 type, __u64 addr, __u64 len,
> +				bool exclude_user)
>  {
> -	attr->size = sizeof(*attr);
> -	return syscall(__NR_perf_event_open, attr, pid, cpu, group_fd, flags);
> +	memset(attr, 0, sizeof(struct perf_event_attr));
> +	attr->type           = PERF_TYPE_BREAKPOINT;
> +	attr->size           = sizeof(struct perf_event_attr);
> +	attr->bp_type        = type;
> +	attr->bp_addr        = addr;
> +	attr->bp_len         = len;
> +	attr->exclude_kernel = 1;
> +	attr->exclude_hv     = 1;
> +	attr->exclude_guest  = 1;

Only 1 of the calls to perf sets exclude_{kernel,hv,guest} - I assume
there's no issue with setting them always but I wanted to check.

> +	attr->exclude_user   = exclude_user;
> +	attr->disabled       = 1;
>  }
>  
> -	/* setup counters */
> -	memset(&attr, 0, sizeof(attr));
> -	attr.disabled = 1;
> -	attr.type = PERF_TYPE_BREAKPOINT;
> -	attr.bp_type = readwriteflag;
> -	attr.bp_addr = (__u64)ptr;
> -	attr.bp_len = sizeof(int);
> -	if (arraytest)
> -		attr.bp_len = DAWR_LENGTH_MAX;
> -	attr.exclude_user = exclude_user;
> -	break_fd = sys_perf_event_open(&attr, 0, -1, -1, 0);
> +	break_fd = perf_process_event_open_exclude_user(readwriteflag, (__u64)ptr,
> +				arraytest ? DAWR_LENGTH_MAX : sizeof(int),
> +				exclude_user);

checkpatch doesn't like this very much:

CHECK: Alignment should match open parenthesis
#103: FILE: tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c:115:
+	break_fd = perf_process_event_open_exclude_user(readwriteflag, (__u64)ptr,
+				arraytest ? DAWR_LENGTH_MAX : sizeof(int),

Apart from that, this seems good but I haven't checked in super fine
detail just yet :)

Kind regards,
Daniel
