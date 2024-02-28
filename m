Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FC386AE32
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 12:53:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V2Sp1Fpt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TlCRd3r7tz3vZs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 22:53:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=V2Sp1Fpt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=95.215.58.171; helo=out-171.mta1.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlCQw0cM6z3d2W
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 22:52:55 +1100 (AEDT)
Date: Wed, 28 Feb 2024 12:52:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1709121156;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Of/c4OJ5QqHlfcHd3DqDvmXrLytO4RZYVHjHL4aaXcw=;
	b=V2Sp1FptrbsItKaiOjgH5NmVTBGMfmksj7NpLNxd/w5qi4WZxCSYl0MBhYEzflV8Pyv83v
	MtidTYuuTwhP7E0FRvGtFlhVZtjEnn2F4CtnIVKGCA6LWHxbo1LQjx+Q58mhCJGhSO9F6w
	iuruuVM9V9Iz18vTKBpNYs8Fh/rD53Q=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [kvm-unit-tests PATCH 10/32] scripts: Accommodate powerpc
 powernv machine differences
Message-ID: <20240228-1a4664ebbc59b704b7cfd2a0@orel>
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-11-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240226101218.1472843-11-npiggin@gmail.com>
X-Migadu-Flow: FLOW_OUT
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024 at 08:11:56PM +1000, Nicholas Piggin wrote:
> The QEMU powerpc powernv machine has minor differences that must be
> accommodated for in output parsing:
> 
> - Summary parsing must search more lines of output for the summary
>   line, to accommodate OPAL message on shutdown.
> - Premature failure testing must tolerate case differences in kernel
>   load error message.
> 
> Acked-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  scripts/runtime.bash | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/scripts/runtime.bash b/scripts/runtime.bash
> index 8f9672d0d..bb32c0d10 100644
> --- a/scripts/runtime.bash
> +++ b/scripts/runtime.bash
> @@ -9,7 +9,7 @@ FAIL() { echo -ne "\e[31mFAIL\e[0m"; }
>  extract_summary()
>  {
>      local cr=$'\r'
> -    tail -3 | grep '^SUMMARY: ' | sed 's/^SUMMARY: /(/;s/'"$cr"'\{0,1\}$/)/'
> +    tail -5 | grep '^SUMMARY: ' | sed 's/^SUMMARY: /(/;s/'"$cr"'\{0,1\}$/)/'
>  }
>  
>  # We assume that QEMU is going to work if it tried to load the kernel
> @@ -18,7 +18,7 @@ premature_failure()
>      local log="$(eval "$(get_cmdline _NO_FILE_4Uhere_)" 2>&1)"
>  
>      echo "$log" | grep "_NO_FILE_4Uhere_" |
> -        grep -q -e "could not \(load\|open\) kernel" -e "error loading" &&
> +        grep -q -e "[Cc]ould not \(load\|open\) kernel" -e "error loading" &&
>          return 1
>  
>      RUNTIME_log_stderr <<< "$log"
> -- 
> 2.42.0
>

Acked-by: Andrew Jones <andrew.jones@linux.dev>
