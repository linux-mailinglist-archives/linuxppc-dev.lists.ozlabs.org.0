Return-Path: <linuxppc-dev+bounces-11644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A336B40FFA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Sep 2025 00:22:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cGgGw5j40z2xlM;
	Wed,  3 Sep 2025 08:22:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756825023;
	cv=none; b=ToJOjxi8Ao1/77bUyltbdJmx6qVA+59CXo+gZjXmjI2gyqActaq8vcwo0vMIzNCWJg7FAyRB9pWYsVM3ULTBcRO2Dt4veIrzqjqoAlTwtKsP5KtJbF6k8YPz04ACK3hB5oSItpnVlTFRralEoXlnnqozB6AOv9xldZfiyvjcGso3vwH1ex6p8sCXUVFAT2PxiAEf0kgaz0ZDSvrzAY0L5o7TVLfLSCu7ldBOvjy27lUgrHIErKx0okNu+QbjjYb09ndgcM7K5sATjhcYDk65pWcNr940OK7zYbKa9L3zMBW1WdN/PznoKGdbYZsUMwn9/oh3rXgoaaynDXe6vILu8w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756825023; c=relaxed/relaxed;
	bh=iQAoY+64PekjTVVz5Aci7Us6O8LqMJNZMBqivTa7EXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AUbOUXd01Nqus+i5OnmY1hRQeDh10cxq6pItL+c0hLG0jPGUoYP/9ROiPLzifQZwbbufQqdskElwIY7SeG5YcjyfybZh4YcBGe7A4uMio7zWtePyrwqgPGoj1ZZrmCM+i/zialiIUcRFRQ96ArckfzPMEf07BjjkdX1Uhn3zJB30z4LCVLOMbSKs6mgofLPmgR6XkHZTp+dghQGZv1KbB0dJBEIa70/PudHv0XDdH1Op5OCVFqbAbAIJnneFb6hgqHnb+WVfn5YZ1BrCK6Z34R5lB+cpukyobseZ1JhoG5nzzN7E0Mt1AMW6iH4J8zXEChWk2D6+tPJpE+4ljNc72w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wbinvd.org; dkim=pass (2048-bit key; secure) header.d=wbinvd.org header.i=@wbinvd.org header.a=rsa-sha256 header.s=wbinvd header.b=Qzl8bO33; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=calvin@wbinvd.org; receiver=lists.ozlabs.org) smtp.mailfrom=wbinvd.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=wbinvd.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=wbinvd.org header.i=@wbinvd.org header.a=rsa-sha256 header.s=wbinvd header.b=Qzl8bO33;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=wbinvd.org (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=calvin@wbinvd.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cGTNZ4nNqz30TG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Sep 2025 00:57:01 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-7724cacc32bso1990115b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 02 Sep 2025 07:57:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=wbinvd.org; s=wbinvd; t=1756825019; x=1757429819; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iQAoY+64PekjTVVz5Aci7Us6O8LqMJNZMBqivTa7EXM=;
        b=Qzl8bO335fdyBCm5LUl5F9tRcPfvPW9YuE02HdtEMmFN1xhOLCqb4JejA9nHKFfVwQ
         t1KJmxQ+rm2b8Wqm1nzKKAzJogARSZUiU9ZJOBgOGIwQlrk6/zONZLcZrK59nrpbj6+d
         ZGf/Ik7frD2oW9HG826enUPEtWGlmiiE6eGIfKMbOcnREIfsUpK63eRS+fMbfeWvPO3T
         OxoF/4JUUmivJxNrtQLGB+Owk5QvKAUX8wMdNzimJ3XF3TvtqMgQLa1mfuSxiD8QWPrs
         ltrdxSIG1MzjFzQel9BSbIAm3aByKgpdYHcl/zPD7TWSatGnqwZW1//3w/K2bMMEH0rz
         wP6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756825019; x=1757429819;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iQAoY+64PekjTVVz5Aci7Us6O8LqMJNZMBqivTa7EXM=;
        b=i6MgooLOOUXpkry58XHQKcMMAtJT7jrtNTzdwnua7SFgCPVcQT+6iMWovbJP3aq7ne
         58ODAyd7j6d2bM0fbIFP2MUshtQ9x41k19mQ1Ci88b/7as5rExksiEQh8l+6pd2gcxha
         gjRta2IZ9+speudvxjWuBAWxV1neO1PpxdnVDRfRAKXQsrM/PCXnBHHbv+6pE8LQ9C6r
         zAet8Rp8Y7/clg+ySkPocoZiYKICZRMDzkzGMWHzhTO7TYMcnlmxXFwioMpKPaFRETDE
         0VhDz0kjZ3k8Krw2kY3eX+z4ZtzdpScHeC1tKx5SmM4KilWDHLdoSrBl6wh2RJFkuq1v
         LSEA==
X-Forwarded-Encrypted: i=1; AJvYcCVFzcEfF2mOxRqeJKIpk2Mni2t9Kpc2M6GmMke9lZunwnn2wW/D0ARv2uCkGXTqfS0L7vsGUpxruM+loGQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz9+AZ3PRn07q+oBE1Y+siMg7IXzCPEuiqhwtWhagYLL/lI5bOR
	ZQ2+bBi5zR1taveojrNE+FJs7L16hUDBSajgsvPGAKFEfyHuelaOuQ+Z1arp7v/NghQaAh+FJCk
	WJQVF
X-Gm-Gg: ASbGncu3O6I/GAGvZbMbCUpOCGHv6fDY6gpfge4V8TK6nt8xBFpdmjIxjLM10ROOvAu
	Oj2jsijNT05q4gtI2asaHdSwDlHFbLysEQwhIdePc/dkXUwMlksoAskg9UxPPyEB5LU73SJyrIz
	+vY8JD0pbaHch2zcWpvFHB0KHKxxqtph/3buO8GzcQeDHqxcbRA5YJ0/dBxXm99UFJdM/R8jMTT
	6kZk6JKG8UPSzekKACXzdStxivqtnTk/3vqHVeIVu6tYsB5W7RKFoAwbjuox5MhhOkk920L0SQm
	ob3jn2lT80U3Kv0W+Or/gBTBL+F7+bd6op6ZTpYfMWFbLaHfWS8EZIWKt2/QrNc7nsJE5SvdcKn
	BYN2O5y3m5Wa9e5tjPsjW3QMD
X-Google-Smtp-Source: AGHT+IG4NJOSwfNOiJPCZCADKuS/Hi0VsrUQ00UwdvcAjo/IiTHURdMNRbeFN9pERyT8kiit7L+DiA==
X-Received: by 2002:a05:6a00:1748:b0:76e:7aee:35f1 with SMTP id d2e1a72fcca58-7723e3fcb56mr15007816b3a.29.1756825018957;
        Tue, 02 Sep 2025 07:56:58 -0700 (PDT)
Received: from mozart.vkv.me ([192.184.167.117])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a26bfe2sm14027937b3a.14.2025.09.02.07.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 07:56:58 -0700 (PDT)
Date: Tue, 2 Sep 2025 07:56:58 -0700
From: Calvin Owens <calvin@wbinvd.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: linux-bluetooth@vger.kernel.org,
	open list <linux-kernel@vger.kernel.org>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>, pmenzel@molgen.mpg.de,
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>,
	Ben Copeland <benjamin.copeland@linaro.org>
Subject: Re: next-20250901 drivers bluetooth bpa10x.c:77:33: error: array
 type has incomplete element type 'struct h4_recv_pkt'
Message-ID: <aLcFuqRuB2NFu-ZE@mozart.vkv.me>
References: <CA+G9fYsgiqTo7t3e36P5cysc+jEX5Fub1quTj+fuKGM8jkxbFA@mail.gmail.com>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CA+G9fYsgiqTo7t3e36P5cysc+jEX5Fub1quTj+fuKGM8jkxbFA@mail.gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tuesday 09/02 at 15:00 +0530, Naresh Kamboju wrote:
> The following build warnings / errors are noticed on powerpc ppc6xx_defconfig
> with gcc-13 toolchain running on Linux next-20250901 and next-20250902.
> 
> Regression Analysis:
> - New regression? yes
> - Reproducibility? yes
> 
> First seen on next-20250901
> Bad: next-20250901 and next-20250902
> Good: next-20250829
> 
> Build regression: next-20250901 drivers bluetooth bpa10x.c:77:33:
> error: array type has incomplete element type 'struct h4_recv_pkt'
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Powerpc:
>   build:
>     * gcc-13-ppc6xx_defconfig
>     * gcc-8-ppc6xx_defconfig

Hi Naresh,

This should fix it:
https://lore.kernel.org/all/aLNRvzXE4O9dKZoN@mozart.vkv.me/

Thanks,
Calvin

> Build error:
> drivers/bluetooth/bpa10x.c:77:33: error: array type has incomplete
> element type 'struct h4_recv_pkt'
>    77 | static const struct h4_recv_pkt bpa10x_recv_pkts[] = {
>       |                                 ^~~~~~~~~~~~~~~~
> drivers/bluetooth/bpa10x.c:78:11: error: 'H4_RECV_ACL' undeclared here
> (not in a function)
>    78 |         { H4_RECV_ACL,     .recv = hci_recv_frame },
>       |           ^~~~~~~~~~~
> drivers/bluetooth/bpa10x.c:79:11: error: 'H4_RECV_SCO' undeclared here
> (not in a function)
>    79 |         { H4_RECV_SCO,     .recv = hci_recv_frame },
>       |           ^~~~~~~~~~~
> drivers/bluetooth/bpa10x.c:80:11: error: 'H4_RECV_EVENT' undeclared
> here (not in a function)
>    80 |         { H4_RECV_EVENT,   .recv = hci_recv_frame },
>       |           ^~~~~~~~~~~~~
> drivers/bluetooth/bpa10x.c: In function 'bpa10x_rx_complete':
> drivers/bluetooth/bpa10x.c:99:37: error: implicit declaration of
> function 'h4_recv_buf' [-Werror=implicit-function-declaration]
>    99 |                 data->rx_skb[idx] = h4_recv_buf(hdev, data->rx_skb[idx],
>       |                                     ^~~~~~~~~~~
> In file included from include/linux/array_size.h:5,
>                  from include/linux/kernel.h:16,
>                  from drivers/bluetooth/bpa10x.c:9:
> include/linux/compiler.h:197:82: error: expression in static assertion
> is not an integer
>   197 | #define __BUILD_BUG_ON_ZERO_MSG(e, msg, ...)
> ((int)sizeof(struct {_Static_assert(!(e), msg);}))
>       |
>                   ^
> include/linux/compiler.h:202:33: note: in expansion of macro
> '__BUILD_BUG_ON_ZERO_MSG'
>   202 | #define __must_be_array(a)
> __BUILD_BUG_ON_ZERO_MSG(!__is_array(a), \
>       |                                 ^~~~~~~~~~~~~~~~~~~~~~~
> include/linux/array_size.h:11:59: note: in expansion of macro '__must_be_array'
>    11 | #define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]) +
> __must_be_array(arr))
>       |
> ^~~~~~~~~~~~~~~
> drivers/bluetooth/bpa10x.c:103:49: note: in expansion of macro 'ARRAY_SIZE'
>   103 |
> ARRAY_SIZE(bpa10x_recv_pkts));
>       |                                                 ^~~~~~~~~~
> drivers/bluetooth/bpa10x.c: At top level:
> drivers/bluetooth/bpa10x.c:77:33: warning: 'bpa10x_recv_pkts' defined
> but not used [-Wunused-variable]
>    77 | static const struct h4_recv_pkt bpa10x_recv_pkts[] = {
>       |                                 ^~~~~~~~~~~~~~~~
> cc1: some warnings being treated as errors
> 
> 
> ## Source
> * Kernel version: 6.17.0-rc4
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
> * Git describe: next-20250902
> * Git commit: 3db46a82d467bd23d9ebc473d872a865785299d8
> * Architectures: powerpc
> * Toolchains: gcc-13
> * Kconfigs: ppc6xx_defconfig
> 
> ## Build
> * Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250902/testrun/29725581/suite/build/test/gcc-13-ppc6xx_defconfig/log
> * Build details:
> https://regressions.linaro.org/lkft/linux-next-master/next-20250901/log-parser-build-gcc/gcc-compiler-drivers_bluetooth_bpax_c-error-array-type-has-incomplete-element-type-struct-h_recv_pkt/
> * Build plan: https://tuxapi.tuxsuite.com/v1/groups/linaro/projects/lkft/builds/328DwMMwNOpSAj0qnRpJavgtz9C
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/328DwMMwNOpSAj0qnRpJavgtz9C/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/328DwMMwNOpSAj0qnRpJavgtz9C/config
> 
> --
> Linaro LKFT
> https://lkft.linaro.org

