Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 472CD6C9600
	for <lists+linuxppc-dev@lfdr.de>; Sun, 26 Mar 2023 17:09:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pkzrf0dXBz3fJt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 02:09:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f/B9byCh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=f/B9byCh;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pkzqd6QQtz3cLC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 02:09:01 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4267860EE1;
	Sun, 26 Mar 2023 15:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A27E9C433D2;
	Sun, 26 Mar 2023 15:08:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679843336;
	bh=UuAkJgrrMzOljvaJjRW718aSixBHPPc3IjEWtYC7A9Y=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=f/B9byChMZTmaJJP9ijbaTO+ce49FfvP8GvPeoZzw2odAmf5v4dRtpNLc6JRv5N0v
	 VNKfvvmgW4aBmSCQVEDZ2fYIzPVT1qAVw5OBLHyAUhAytElRHCoZzYv4PabwY8jSpO
	 1HZYTVuqleb4aDmFkzZ88dk3gG/EUtcU2gNnTWHk60NuA/JuQtIgd6ocVkYhjO1zGU
	 gLSFp+rbGVTgX/l6nL4Dgth4jmeX1SUyfbqrDED3QANfP8Rh3bgmliLHqzy3Dy596F
	 HjvBQsJaX6hGlcLf3aBSUKbWmXOPm41PvjU+5ENduTTr7RL1T9eQWAXELLPaBK2c+y
	 jCWVBFCH+pm2w==
Received: by paulmck-ThinkPad-P72.home (Postfix, from userid 1000)
	id 347D11540431; Sun, 26 Mar 2023 08:08:56 -0700 (PDT)
Date: Sun, 26 Mar 2023 08:08:56 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: zhouzhouyi@gmail.com
Subject: Re: [PATCH] rcu: torture: ppc: Remove duplicated argument
 --enable-kvm
Message-ID: <7286a0ab-c8a3-407f-b242-7e823fc39814@paulmck-laptop>
References: <1679790274-1309-1-git-send-email-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1679790274-1309-1-git-send-email-zhouzhouyi@gmail.com>
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
Reply-To: paulmck@kernel.org
Cc: rcu@vger.kernel.org, lance@osuosl.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Mar 26, 2023 at 08:24:34AM +0800, zhouzhouyi@gmail.com wrote:
> From: Zhouyi Zhou <zhouzhouyi@gmail.com>
> 
> The argument --enable-kvm is duplicated because qemu_args
> in kvm-test-1-run.sh has already give this.
>           
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>

Good catch!  Applied, thank you!

							Thanx, Paul

> ---
> Dear RCU and PPC developers
> 
> I discover this possible minor flaw when I am performing RCU torture
> test in PPC VM of of Open Source Lab of Oregon State University.
> 
> But I can't test my patch because I am in a VM.
> 
> Thanks for your time
> 
> Cheers ;-)
> Zhouyi                                           
> --    
>  tools/testing/selftests/rcutorture/bin/functions.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/rcutorture/bin/functions.sh b/tools/testing/selftests/rcutorture/bin/functions.sh
> index b52d5069563c..48b9147e8c91 100644
> --- a/tools/testing/selftests/rcutorture/bin/functions.sh
> +++ b/tools/testing/selftests/rcutorture/bin/functions.sh
> @@ -250,7 +250,7 @@ identify_qemu_args () {
>  		echo -machine virt,gic-version=host -cpu host
>  		;;
>  	qemu-system-ppc64)
> -		echo -enable-kvm -M pseries -nodefaults
> +		echo -M pseries -nodefaults
>  		echo -device spapr-vscsi
>  		if test -n "$TORTURE_QEMU_INTERACTIVE" -a -n "$TORTURE_QEMU_MAC"
>  		then
> -- 
> 2.34.1
> 
