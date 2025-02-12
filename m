Return-Path: <linuxppc-dev+bounces-6128-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7344A32A84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Feb 2025 16:49:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YtN6F455Wz30Pl;
	Thu, 13 Feb 2025 02:49:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=91.218.175.186
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739375365;
	cv=none; b=Tpz/Q8bd0dFcFVUMoPrFnIpnynm/RK4EngQ5o/+HQBnkSCUYnQFkQCzhBlxzFokrasI+EtelUC+tvzLFIacAMMfGB287xWVdewSU7HTAVANp/D7pDSTZNxyrWHpGAE0HOOukc6ijgoYKFFASORvBXubgrpQzFUmIBiQfW0UCnjbwlhwtu0DcBWKdXCrkCAI2baNQXgMjMuRE+iAiq+ltyIHgA8g61ghntuHLykBFgANGwQR0YzbpXRpmM2R7wNN/ufZwmniH6iqoh8gr/CSEOs8uh+gd/CRkkjmiFcgqLpoVEeu1vsQz1VDxw8XRd8WnC/LpNr3xyTiZHr90lHtpWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739375365; c=relaxed/relaxed;
	bh=Vmg0L/g3+q0yTaB9LWuHIF8QkwBzZd4h117MfIen5LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jHyFuA/UXaQQJTKHMSxC2AIVEkkwLu/ww3FBgxxPIJGbg1/vz9XnCwmaqfSOW2wyUDC1uFi7TiYezup51CsAu+l2Kjr3R0YgnzwiqaEUp5pzZ72yF21dOOMOgC/JIOm6t7yA9ZWxkuJny+KyN21VBSgsxagfIQAu+8x9byE00yb8oHkZ1h2Y63NNeayUO2OS0YZZ5FHJ/cPcAmeY4yuwDOnyTcNjxQg0mw32q6JTPCATcwW4RsZ0lkw7L59eGF466zyo9MY0yLi2nHxS7FB3bXaupbl67jSPrRIheNaMcCE+/MGSqvumayqC3yW2BbIrBP2fyDNGFQ5Qj9iXGJPTwA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev; dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c/OgCsn7; dkim-atps=neutral; spf=pass (client-ip=91.218.175.186; helo=out-186.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org) smtp.mailfrom=linux.dev
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=c/OgCsn7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.186; helo=out-186.mta0.migadu.com; envelope-from=andrew.jones@linux.dev; receiver=lists.ozlabs.org)
Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YtN6831Xmz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Feb 2025 02:49:19 +1100 (AEDT)
Date: Wed, 12 Feb 2025 16:48:47 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1739375333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Vmg0L/g3+q0yTaB9LWuHIF8QkwBzZd4h117MfIen5LQ=;
	b=c/OgCsn7kQs98DTIPDKyRY9IWuczp96fsZXGkUJNCxyBQ3Vuz6s8GWJ62djGUbxKpC1yWk
	I7zWfhyo8zlAy4AiQFrkZVib9LGSyoTypCUCRw8hliUvQPNi40nHB0vTSXQqKFW9IEIjL8
	Z5yFO3yLd2b9eklxpPjom4HHbQciLf4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alexandru Elisei <alexandru.elisei@arm.com>
Cc: eric.auger@redhat.com, lvivier@redhat.com, thuth@redhat.com, 
	frankja@linux.ibm.com, imbrenda@linux.ibm.com, nrb@linux.ibm.com, david@redhat.com, 
	pbonzini@redhat.com, kvm@vger.kernel.org, kvmarm@lists.linux.dev, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	will@kernel.org, julien.thierry.kdev@gmail.com, maz@kernel.org, 
	oliver.upton@linux.dev, suzuki.poulose@arm.com, yuzenghui@huawei.com, joey.gouly@arm.com, 
	andre.przywara@arm.com
Subject: Re: [kvm-unit-tests PATCH v2 04/18] run_tests: Introduce unittest
 parameter 'qemu_params'
Message-ID: <20250212-8427334ce25d709f70c4053c@orel>
References: <20250120164316.31473-1-alexandru.elisei@arm.com>
 <20250120164316.31473-5-alexandru.elisei@arm.com>
 <20250121-82874afe4e52c828d21e7da2@orel>
 <Z6yk48JpsYKHwFye@arm.com>
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
In-Reply-To: <Z6yk48JpsYKHwFye@arm.com>
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Feb 12, 2025 at 01:40:51PM +0000, Alexandru Elisei wrote:
...
> > > @@ -80,7 +80,7 @@ function run()
> > >      local groups="$2"
> > >      local smp="$3"
> > >      local kernel="$4"
> > > -    local opts="$5"
> > > +    local qemu_opts="$5"
> > >      local arch="$6"
> > >      local machine="$7"
> > >      local check="${CHECK:-$8}"
> > > @@ -179,9 +179,9 @@ function run()
> > >          echo $cmdline
> > >      fi
> > >  
> > > -    # extra_params in the config file may contain backticks that need to be
> > > -    # expanded, so use eval to start qemu.  Use "> >(foo)" instead of a pipe to
> > > -    # preserve the exit status.
> > > +    # qemu_params/extra_params in the config file may contain backticks that
> > > +    # need to be expanded, so use eval to start qemu.  Use "> >(foo)" instead of
> > > +    # a pipe to preserve the exit status.
> > >      summary=$(eval "$cmdline" 2> >(RUNTIME_log_stderr $testname) \
> > >                               > >(tee >(RUNTIME_log_stdout $testname $kernel) | extract_summary))
> > >      ret=$?
> > > -- 
> > > 2.47.1
> > >
> > 
> > Hmm, I'll keep reading the series, but it seems like we should be choosing
> > generic names like 'extra_params' and 'opts' that we plan to use for both
> > QEMU and kvmtool since they both have the concepts of "options" and "extra
> > params".
> 
> I'm afraid I don't follow you. 'qemu_params' was chosen because it uses
> qemu-specific syntax. Same for 'kvmtool_params', introduced later in the
> series. Are you referring to unittests.cfg or to something else?
>

I didn't like the renaming of opts to qemu_opts since both kvmtool and
qemu have "options", so it seems like we should be generalizing variable
names rather than making them more specific. I see later how there may
be a need for qemu_options, kvmtool_options, and unit test
cmdline_options in the unittests.cfg, though. However, here, it seems
like we could still use 'opts' for the variable and just use another
variable to determine if we parse qemu_options or kvmtool_options, since
there shouldn't be a need to parse both.

Thanks,
drew

