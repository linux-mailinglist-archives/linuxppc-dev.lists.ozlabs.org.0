Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 855B836BBA7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 00:25:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTfbw3NZvz30F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 08:25:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=tessares-net.20150623.gappssmtp.com header.i=@tessares-net.20150623.gappssmtp.com header.a=rsa-sha256 header.s=20150623 header.b=PPOrCQAB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=tessares.net (client-ip=2a00:1450:4864:20::530;
 helo=mail-ed1-x530.google.com; envelope-from=matthieu.baerts@tessares.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=tessares-net.20150623.gappssmtp.com
 header.i=@tessares-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=PPOrCQAB; dkim-atps=neutral
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTZjy2Zc6z2xZt
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 05:30:26 +1000 (AEST)
Received: by mail-ed1-x530.google.com with SMTP id c22so3454094edn.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Apr 2021 12:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tessares-net.20150623.gappssmtp.com; s=20150623;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Dr87k9ZfKSIjKnHclx7DePEImf+rQ7+qp484Yc2GQDI=;
 b=PPOrCQABnsVUARLGHk3k4EHRz5rL54WAC/3DmqIc9Chmcl13vZveHm9YTgPByu9ISi
 BCM/sigWLiv6oopbIxbMFfnPjXDDtLMM7ucX+DRa10VkRS6dPJUiaf2WgASxfslYX16E
 +bppZXEMf+sV9kNORgUP1nYT3q7/2Za5BgRMgLnxUbuBHvygarfczX+R3rRy0AfqqvgH
 Xitwa51T16WbhvkAvSG4cEktOXnr6XxCEyVTfulx1je4TvHzlBJ10ZT2yTfsjgzv6ePw
 Y9LgkJ4yyVK6FRcD7HdvGU04WKY4YtpvKyRVuqndTXJYPUNTtQ3PWYHDR1yWXuDSDmmy
 jROw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Dr87k9ZfKSIjKnHclx7DePEImf+rQ7+qp484Yc2GQDI=;
 b=akmv/+OzLqnXgcr9fFbPvRutvoKyVxWTicpB/UWF9lhXG2Ci5VxS5wr8gYlCU0v5ho
 zzrwtpPFPHmHsXZGow0ZYE2Ogknli9L9P15RUIpqECaj6fmLjWuQhRAIO2CYBEKJvfm4
 HaEb8Sq9ZOOo1TvQgIJCqHiY/O3u6PJJdUIZ1hRVy6wR8CphQ1rX7TdcK/Y8ca+w0bNf
 U4M73OBCvQ26hyfkEezIhRKxRC5XXAwGNP5HmukT34KsV2TTTrXxrLqXQQKmQYe+UYXF
 SxVZ8VfDmCDh02IZP8dJd6SZOJdFjDst3CrZnxHQwOTGOVY76xVnqFysM8MDjQUynGhJ
 BwKQ==
X-Gm-Message-State: AOAM532KwTvuKcm97f+iOiBn8rep2RLtwf3kEG2rhZKMENV7HKEs6wkD
 SWwcwpSaqryeO4xxOHR6GjBTJA==
X-Google-Smtp-Source: ABdhPJwEsGiSPn86sUce28FQhOIkZd9EDC808DnlsPjgtQS2kJzYU55xlwjSXiAaAe8rkGOR/w0UhA==
X-Received: by 2002:a05:6402:3514:: with SMTP id
 b20mr267417edd.348.1619465418825; 
 Mon, 26 Apr 2021 12:30:18 -0700 (PDT)
Received: from tsr-lap-08.nix.tessares.net ([46.166.143.116])
 by smtp.gmail.com with ESMTPSA id r10sm12090371ejd.112.2021.04.26.12.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 12:30:18 -0700 (PDT)
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
References: <20210424114841.394239-1-masahiroy@kernel.org>
From: Matthieu Baerts <matthieu.baerts@tessares.net>
Subject: Re: [PATCH] kbuild: replace LANG=C with LC_ALL=C
Message-ID: <2f8ccc46-16a1-e0fe-7cb0-0912295153ee@tessares.net>
Date: Mon, 26 Apr 2021 21:30:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210424114841.394239-1-masahiroy@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 27 Apr 2021 08:25:07 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Mat Martineau <mathew.j.martineau@linux.intel.com>,
 Matthias Maennich <maennich@google.com>, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, Paul Mackerras <paulus@samba.org>, mptcp@lists.01.org,
 linux-kselftest@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>,
 Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Thank you for the patch!

On 24/04/2021 13:48, Masahiro Yamada wrote:
> LANG gives a weak default to each LC_* in case it is not explicitly
> defined. LC_ALL, if set, overrides all other LC_* variables.
> 
>   LANG  <  LC_CTYPE, LC_COLLATE, LC_MONETARY, LC_NUMERIC, ...  <  LC_ALL
> 
> This is why documentation such as [1] suggests to set LC_ALL in build
> scripts to get the deterministic result.
> 
> LANG=C is not strong enough to override LC_* that may be set by end
> users.
> 
> [1]: https://reproducible-builds.org/docs/locales/
> 
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
> 
>  arch/powerpc/boot/wrapper                          | 2 +-
>  scripts/nsdeps                                     | 2 +-
>  scripts/recordmcount.pl                            | 2 +-
>  scripts/setlocalversion                            | 2 +-
>  scripts/tags.sh                                    | 2 +-
>  tools/testing/selftests/net/mptcp/mptcp_connect.sh | 2 +-

Acked-by: Matthieu Baerts <matthieu.baerts@tessares.net> (mptcp)

Cheers,
Matt
-- 
Tessares | Belgium | Hybrid Access Solutions
www.tessares.net
