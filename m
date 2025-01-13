Return-Path: <linuxppc-dev+bounces-5157-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C88DFA0BB52
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Jan 2025 16:12:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWwjn3wF9z2ymQ;
	Tue, 14 Jan 2025 02:12:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:41d0:1004:224b::b6"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736781165;
	cv=none; b=AbOrUrEvYj2gwbJ+DZcAMm6KD5CF+YPS7grNtAgwgX3zQ9HQ/m0D61rY6E8M8VJtWESMLjXAairxpTCzSIHOKQMPNNBWg/OOYNukzMX5vAPuwspETpXxO1cXMtoZS36qLciHAaM2j9VXP/7faN5ybLsB8L9vD9VDBRuklvgr4TxWbsDqh+OLnMFv5tKtHabJrwchdAPkO7zddO3cUPWzaKsAOcDmqqodulfFwPd5CajsfufTnkh+gyEW5BrssknO4HGp5jn4q8tKI2zUoKe3PKhpovUwBX/Dsud7shfcMczGo0q1NhMImgqF+PlHIGGp5Y6ggaS2utwPjNFZd5vraw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736781165; c=relaxed/relaxed;
	bh=KwFSzUI7AdO7FN349dbUBnEYz5JimFOvpyWuoBOACSs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFB6vCAzi/OHY9C2JIi4qILj3j3AFLHVuf6Sf1wuhtkfqxpcvjGpypiQhfuHdMfeXntnAb0edkpKa/9uRbso0cRLL3L7TKLmmM/66cBRqVHhUzzwsckjyimfWxyhXIA/AYioiOxKDOMaStUYIQXOIPGPM4TsdNZwtM8FHnj92N0o3/bKtWDd7W9Jmr112he4Ozv/XJn34Jo7cJHoGRO74ZB1cdGmLBGEIsZOAf0tNTWxQXLrv886QyF4GskfdygQoThfF6+o/OL0WUtI7ax/YJzHsDCdBXv7uixY0ztLsr3wldIHqykxjNxK/DrUEeVoUfs5rAzEhdi7GgigsIHsJA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass (client-ip=2001:41d0:1004:224b::b6; helo=out-182.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=2001:41d0:1004:224b::b6; helo=out-182.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
X-Greylist: delayed 591 seconds by postgrey-1.37 at boromir; Tue, 14 Jan 2025 02:12:38 AEDT
Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [IPv6:2001:41d0:1004:224b::b6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YWwjf37Fwz2xJ8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jan 2025 02:12:36 +1100 (AEDT)
Date: Mon, 13 Jan 2025 16:01:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736780522;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=KwFSzUI7AdO7FN349dbUBnEYz5JimFOvpyWuoBOACSs=;
	b=VgUr5y4bQO1Br7MsgRdM1yCg/KVoRF6a29p+gYXkeY6gfIyCy+x35yMDZCFlI5dFxc3uid
	JtEpJHj3e3C8PLPpr9BNvSyShTJt3K0xoqNMpByq1XfH+tJUKm4mzI5Q+UAPA//+02zQa1
	COW1rZcCyiE9+UKnRWMTecZzncHIwj8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, vladimir.murzin@arm.com
Subject: Re: [kvm-unit-tests PATCH v1 1/5] configure: Document that the
 architecture name 'aarch64' is also supported
Message-ID: <20250113-0fe04c6089726d1d06a254ec@orel>
References: <20250110135848.35465-1-alexandru.elisei@arm.com>
 <20250110135848.35465-2-alexandru.elisei@arm.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250110135848.35465-2-alexandru.elisei@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=0.2 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_PASS,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 10, 2025 at 01:58:44PM +0000, Alexandru Elisei wrote:
> $arch, on arm64, defaults to 'aarch64', and later in the script is replaced
> by 'arm64'. Intentional or not, document that the name 'aarch64' is also
> supported when configuring for the arm64 architecture. This has been the
> case since the initial commit that added support for the arm64
> architecture, commit 39ac3f8494be ("arm64: initial drop").
> 
> The help text for --arch changes from*:
> 
>    --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
>                            arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> 
> to:
> 
>     --arch=ARCH            architecture to compile for (aarch64). ARCH can be one of:
>                            arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> 
> *Worth pointing out that the default architecture is 'aarch64', even though
> the rest of the help text doesn't have it as one of the supported
> architectures.
> 
> Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
> ---
>  configure | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/configure b/configure
> index 86cf1da36467..5b0a2d7f39c0 100755
> --- a/configure
> +++ b/configure
> @@ -47,7 +47,7 @@ usage() {
>  
>  	Options include:
>  	    --arch=ARCH            architecture to compile for ($arch). ARCH can be one of:
> -	                           arm, arm64, i386, ppc64, riscv32, riscv64, s390x, x86_64
> +	                           arm, arm64/aarch64, i386, ppc64, riscv32, riscv64, s390x, x86_64
>  	    --processor=PROCESSOR  processor to compile for ($arch)
>  	    --target=TARGET        target platform that the tests will be running on (qemu or
>  	                           kvmtool, default is qemu) (arm/arm64 only)
> -- 
> 2.47.1
>

I'd prefer to support --arch=aarch64, but then always refer to it as only
arm64 everywhere else. We need to support arch=aarch64 since that's what
'uname -m' returns, but I don't think we need to change the help text for
it. If we don't want to trust our users to figure out arm64==aarch64,
then we can do something like

@@ -216,12 +197,12 @@ while [[ $optno -le $argc ]]; do
            werror=
            ;;
        --help)
-           usage
+           do_help=1
            ;;
        *)
            echo "Unknown option '$opt'"
            echo
-           usage
+           do_help=1
            ;;
     esac
 done

And then only do

 if [ $do_help ]; then
    usage
 fi

after $arch and other variables have had a chance to be converted.

Thanks,
drew

