Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 890AD93A790
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 21:07:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FWsaQANQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WT68c3XXmz3cnc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 05:07:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FWsaQANQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=acme@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WT67x5NsXz2xQ7
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 05:06:37 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9767A60E71;
	Tue, 23 Jul 2024 19:06:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5272C4AF0A;
	Tue, 23 Jul 2024 19:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721761593;
	bh=xiYMNWn8JlLWS3DfL01faTKN/kkK4A4D49NBKXMEX0A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FWsaQANQXqgd9H/SEld413kB6v4lV5qlVuVVbYdLU8Mu4l82vIR6V9gkE8eX2RwYt
	 eysRQw27UKGfmZECgtpQHn3d0kHXRwBD30A1di8iMPwjch0J4o8Ie2Ulqp3G8umPcI
	 ZjygMxDx85X0IawV4aMjWd/EpvMMHrLH3BjUErXs4LsKXd5B+WzKo4FV7Edlx7F9Tb
	 li/rxFgdxBjCs9Z9yU1UcOAVstFRbBei6RXXQdg12eDLZiCZivQfjWEyLkYZSMgLSV
	 N/ItHiqka+KMHivM2nciZfChoizjSgxPsczHQhsDW3S08z9OBH7zFrMpQn04rt4iqb
	 IbrMzqvz76FCw==
Date: Tue, 23 Jul 2024 16:06:28 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH V8 03/15] tools/perf: Update TYPE_STATE_MAX_REGS to
 include max of regs in powerpc
Message-ID: <Zp__NN2SrLvqn423@x1>
References: <20240718084358.72242-1-atrajeev@linux.vnet.ibm.com>
 <20240718084358.72242-4-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240718084358.72242-4-atrajeev@linux.vnet.ibm.com>
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
Cc: irogers@google.com, disgoel@linux.vnet.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com, adrian.hunter@intel.com, christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, jolsa@kernel.org, namhyung@kernel.org, akanksha@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2024 at 02:13:46PM +0530, Athira Rajeev wrote:
> TYPE_STATE_MAX_REGS is arch-dependent. Currently this is defined
> to be 16. While checking if reg is valid using has_reg_type,
> max value is checked using TYPE_STATE_MAX_REGS value. Define
> this conditionally for powerpc.

So what would happen if I get a perf.data file on a powerpc system and
then try to do data-type profiling on a x86 system?

I'm processing this now, but please consider fixing this up in some
other fashion, I think we have support for collecting registers in a way
that perf.data has all that is needed for us to print them in a cross
arch way, no?

I see there is the FIXME there, ok.

- Arnaldo
 
> Reviewed-and-tested-by: Kajol Jain <kjain@linux.ibm.com>
> Reviewed-by: Namhyung Kim <namhyung@kernel.org>
> Signed-off-by: Athira Rajeev<atrajeev@linux.vnet.ibm.com>
> ---
>  tools/perf/util/annotate-data.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
> index 6fe8ee8b8410..992b7ce4bd11 100644
> --- a/tools/perf/util/annotate-data.h
> +++ b/tools/perf/util/annotate-data.h
> @@ -189,7 +189,11 @@ struct type_state_stack {
>  };
>  
>  /* FIXME: This should be arch-dependent */
> +#ifdef __powerpc__
> +#define TYPE_STATE_MAX_REGS  32
> +#else
>  #define TYPE_STATE_MAX_REGS  16
> +#endif
>  
>  /*
>   * State table to maintain type info in each register and stack location.
> -- 
> 2.43.0
