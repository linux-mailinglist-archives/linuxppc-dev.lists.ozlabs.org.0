Return-Path: <linuxppc-dev+bounces-5303-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E407A12A7D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jan 2025 19:10:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YYDYx5bByz305P;
	Thu, 16 Jan 2025 05:10:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736964629;
	cv=none; b=GPKiGWd2bndHhataFDWEmfdNeaexwJyWe0KWXyIbi6udVlQsmHBk8m3e8843KKVh2it0Ga0v7mDOxBm1Jkuwv7BTtogsGqIJ4pie+u4XUIu2U5o2UrFFgTBjJiKFOn3uF9qwRAhmNbdTCsyMlMsJcZKVYeNbYW9MBQQuQBiYREGy2k24c95oof+F8Wlqkw5j3ZQEEsj2FZ9yCDv0cP4dt5LfyOKRZJ/BsOlPGLWFpAecanT2WSZD8k3vwCAg7mKSgQFE3XLRsjedsZH42SbwiN8EixDUnWYtPR1OA/a57fp8CCD1oKv4nJZXuXiQ9FiZY1TR6Hpb7Dpk93A7vmUDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736964629; c=relaxed/relaxed;
	bh=Np7pSsxaw2iUiB/sIQw22hWaNnI9by8bAfVe0S6KgrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gLi/jPY424kISVcUJsnhgPmH/hUkUJn62jEhZTFJuxFOJ1uEBMwH3C6ryc1fiYzrFjZDY7ibiufbh7trXJ+DtSBzCFng49+06shKdRzOJ4E/BWFEg4+2J5X9UAkku0wabG1hfGblnxt4soIXoRZ2B265ogtn3t1Oanxok44ME12AOCGnVgGQ+uDBzTr+1Es4pGjWRHYA346kAt28dY8xh3aPw4B7apyHkhECH83qeGaTZA5c3YF1KalkjHiD4VW30GZupaAY5k39u738SAzvB6ifjnpR1PNKbLS5coEJIlUaQTKgLK0MXWt/Zm+y72VzDCo5xgRAsaPgHnWWkU5zyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XuV1yODz; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XuV1yODz; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XuV1yODz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=XuV1yODz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=joe.lawrence@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YYDYw54Yxz2ysB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2025 05:10:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736964623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Np7pSsxaw2iUiB/sIQw22hWaNnI9by8bAfVe0S6KgrQ=;
	b=XuV1yODzfRpVFmjp44r8TQIQVdcX9h1G1Wf6jGyRakyjHODG6Bo9c31cx9MHTMw83MFpx7
	oy4DN+0UVYMs81nYfen9oweghjPcupeJZHQO7FrAvUDzeMTtsxJuRVwWvZYC0a09LZIFe/
	+5jJ0PKGPIe2/IcC3XWmxjJzPzssChc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1736964623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Np7pSsxaw2iUiB/sIQw22hWaNnI9by8bAfVe0S6KgrQ=;
	b=XuV1yODzfRpVFmjp44r8TQIQVdcX9h1G1Wf6jGyRakyjHODG6Bo9c31cx9MHTMw83MFpx7
	oy4DN+0UVYMs81nYfen9oweghjPcupeJZHQO7FrAvUDzeMTtsxJuRVwWvZYC0a09LZIFe/
	+5jJ0PKGPIe2/IcC3XWmxjJzPzssChc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-279-cfTrX9eZNAu5ZcVcw0aX2w-1; Wed,
 15 Jan 2025 13:10:17 -0500
X-MC-Unique: cfTrX9eZNAu5ZcVcw0aX2w-1
X-Mimecast-MFC-AGG-ID: cfTrX9eZNAu5ZcVcw0aX2w
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 278E71956055;
	Wed, 15 Jan 2025 18:10:15 +0000 (UTC)
Received: from redhat.com (unknown [10.22.81.40])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 151E719560AB;
	Wed, 15 Jan 2025 18:10:11 +0000 (UTC)
Date: Wed, 15 Jan 2025 13:10:09 -0500
From: Joe Lawrence <joe.lawrence@redhat.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: jikos@kernel.org, mbenes@suse.cz, pmladek@suse.com, shuah@kernel.org,
	mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
	naveen@kernel.org, live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] selftests: livepatch: handle PRINTK_CALLER in
 check_result()
Message-ID: <Z4f6AbC7pQLIWuX+@redhat.com>
References: <20250114143144.164250-1-maddy@linux.ibm.com>
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
In-Reply-To: <20250114143144.164250-1-maddy@linux.ibm.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Jan 14, 2025 at 08:01:44PM +0530, Madhavan Srinivasan wrote:
> Some arch configs (like ppc64) enable CONFIG_PRINTK_CALLER, which
> adds the caller id as part of the dmesg. Due to this, even though
> the expected vs observed are same, end testcase results are failed.
> 
>  -% insmod test_modules/test_klp_livepatch.ko
>  -livepatch: enabling patch 'test_klp_livepatch'
>  -livepatch: 'test_klp_livepatch': initializing patching transition
>  -livepatch: 'test_klp_livepatch': starting patching transition
>  -livepatch: 'test_klp_livepatch': completing patching transition
>  -livepatch: 'test_klp_livepatch': patching complete
>  -% echo 0 > /sys/kernel/livepatch/test_klp_livepatch/enabled
>  -livepatch: 'test_klp_livepatch': initializing unpatching transition
>  -livepatch: 'test_klp_livepatch': starting unpatching transition
>  -livepatch: 'test_klp_livepatch': completing unpatching transition
>  -livepatch: 'test_klp_livepatch': unpatching complete
>  -% rmmod test_klp_livepatch
>  +[   T3659] % insmod test_modules/test_klp_livepatch.ko
>  +[   T3682] livepatch: enabling patch 'test_klp_livepatch'
>  +[   T3682] livepatch: 'test_klp_livepatch': initializing patching transition
>  +[   T3682] livepatch: 'test_klp_livepatch': starting patching transition
>  +[    T826] livepatch: 'test_klp_livepatch': completing patching transition
>  +[    T826] livepatch: 'test_klp_livepatch': patching complete
>  +[   T3659] % echo 0 > /sys/kernel/livepatch/test_klp_livepatch/enabled
>  +[   T3659] livepatch: 'test_klp_livepatch': initializing unpatching transition
>  +[   T3659] livepatch: 'test_klp_livepatch': starting unpatching transition
>  +[    T789] livepatch: 'test_klp_livepatch': completing unpatching transition
>  +[    T789] livepatch: 'test_klp_livepatch': unpatching complete
>  +[   T3659] % rmmod test_klp_livepatch
> 
>   ERROR: livepatch kselftest(s) failed
>  not ok 1 selftests: livepatch: test-livepatch.sh # exit=1
> 
> Currently the check_result() handles the "[time]" removal from
> the dmesg. Enhance the check to handle removal of "[Tid]" also.
> 
> Signed-off-by: Madhavan Srinivasan <maddy@linux.ibm.com>
> ---
>  tools/testing/selftests/livepatch/functions.sh | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/livepatch/functions.sh b/tools/testing/selftests/livepatch/functions.sh
> index e5d06fb40233..a1730c1864a4 100644
> --- a/tools/testing/selftests/livepatch/functions.sh
> +++ b/tools/testing/selftests/livepatch/functions.sh
> @@ -306,7 +306,8 @@ function check_result {
>  	result=$(dmesg | awk -v last_dmesg="$LAST_DMESG" 'p; $0 == last_dmesg { p=1 }' | \
>  		 grep -e 'livepatch:' -e 'test_klp' | \
>  		 grep -v '\(tainting\|taints\) kernel' | \
> -		 sed 's/^\[[ 0-9.]*\] //')
> +		 sed 's/^\[[ 0-9.]*\] //' | \
> +		 sed 's/^\[[ ]*T[0-9]*\] //')

Thanks for adding this to the filter.

If I read the PRINTK_CALLER docs correctly, there is a potential CPU
identifier as well.  Are there any instances where the livepatching code
will use the "[C$processor_id]" (out of task context) prefix?  Or would
it hurt to future proof with [CT][0-9]?

Acked-by: Joe Lawrence <joe.lawrence@redhat.com>

--
Joe

>  
>  	if [[ "$expect" == "$result" ]] ; then
>  		echo "ok"
> -- 
> 2.47.0
> 


