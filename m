Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B2CB320BBEB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:53:14 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49trGw0gWGzDqKM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:53:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=YEN4h/JS; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqtq4xQtzDqfr
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:35:47 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id j1so5176728pfe.4
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=DqOaaV58EjOIY1VepCG+GQtVeu6B1YTzNiLFMCCxxtU=;
 b=YEN4h/JS6rsbM2TA8UohIHdNyG9IbIr7SJGjr/bFVHhrG/Xom9uuW4VVJlxpjCalyc
 VzYDhmbP8IO2Aln4UuRyuqd6Tgy9Qku2VWWKJ3oZdsqEk7RJQDbYUlIcQKhd+fpKbBRk
 cijP8DnapIIWZQIeC0Y6ZFYLszmtMLfDZQXr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DqOaaV58EjOIY1VepCG+GQtVeu6B1YTzNiLFMCCxxtU=;
 b=JEqvgP0e86I0PLOMZ/gewBt8Y1ewhgpFb/vPl9OHXf3/M+13UYz3069Kj+8lmfIWYR
 /XETkHFU0s/LBT3btGJZWVPw2bOo08rOMPdYziCKEgt9c+HntvlOJlVsJgBG5nbYjIok
 0VPXSVi55Lxkco52ZdQSoDF/te/bLhbOWDN4VSVUrS76wulIhpTWZhgyIH02yQYNYUaI
 uEjJrx//CYNy11NoFWR2Ft+r7ix7e29M7yikI+437hsJ4qGfnqNdXrITqGOVTkfu6jQl
 E1vvfwfgn6Fm6zicrQoiXd+XmIrhNWQ3B0YEA0BCtm6qwx+89a3+A2UZFwQOLkZDF5NJ
 Tqbg==
X-Gm-Message-State: AOAM532JHRsxebQ8YJh+Emn0UfSmZ2exipQy6kJ1f8eYsJMeDXohLoOc
 utCxyp+bbITfNEFxtQ4Xtembsg==
X-Google-Smtp-Source: ABdhPJzxc7cz1MJJ6rNuO5CPPtEcoMO4+f1C1i4DCl9wrVYJnO0GAsRDswfDPhhwjkUn/N4AdYEJaA==
X-Received: by 2002:a63:371c:: with SMTP id e28mr692197pga.114.1593207345125; 
 Fri, 26 Jun 2020 14:35:45 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id w135sm7739381pfc.106.2020.06.26.14.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 14:35:43 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:35:43 -0700
From: Kees Cook <keescook@chromium.org>
To: Brendan Higgins <brendanhiggins@google.com>
Subject: Re: [PATCH v5 09/12] kunit: test: add test plan to KUnit TAP format
Message-ID: <202006261434.119AE33DBB@keescook>
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-10-brendanhiggins@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200626210917.358969-10-brendanhiggins@google.com>
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
Cc: linux-doc@vger.kernel.org, catalin.marinas@arm.com, jcmvbkbc@gmail.com,
 will@kernel.org, paulus@samba.org, linux-kselftest@vger.kernel.org,
 frowand.list@gmail.com, anton.ivanov@cambridgegreys.com,
 linux-arch@vger.kernel.org, richard@nod.at, rppt@linux.ibm.com,
 yzaikin@google.com, linux-xtensa@linux-xtensa.org, arnd@arndb.de,
 jdike@addtoit.com, linux-um@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 davidgow@google.com, skhan@linuxfoundation.org,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com,
 chris@zankel.net, monstr@monstr.eu, sboyd@kernel.org,
 gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org,
 alan.maguire@oracle.com, akpm@linux-foundation.org, logang@deltatee.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 26, 2020 at 02:09:14PM -0700, Brendan Higgins wrote:
> TAP 14 allows an optional test plan to be emitted before the start of
> the start of testing[1]; this is valuable because it makes it possible
> for a test harness to detect whether the number of tests run matches the
> number of tests expected to be run, ensuring that no tests silently
> failed.
> 
> Link[1]: https://github.com/isaacs/testanything.github.io/blob/tap14/tap-version-14-specification.md#the-plan
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> Reviewed-by: Stephen Boyd <sboyd@kernel.org>

Look good, except...

> diff --git a/tools/testing/kunit/test_data/test_is_test_passed-all_passed.log b/tools/testing/kunit/test_data/test_is_test_passed-all_passed.log
> index 62ebc0288355c4b122ccc18ae2505f971efa57bc..bc0dc8fe35b760b1feb74ec419818dbfae1adb5c 100644
> GIT binary patch
> delta 28
> jcmbQmGoME|#4$jjEVZaOGe1wk(1goSPtRy09}gP<dC~`u
> 
> delta 23
> ecmbQwGmD2W#4$jjEVZaOGe1wk&}5@94;uhhkp{*9
> 
> diff --git a/tools/testing/kunit/test_data/test_is_test_passed-crash.log b/tools/testing/kunit/test_data/test_is_test_passed-crash.log
> index 0b249870c8be417a5865bd40a24c8597bb7f5ab1..4d97f6708c4a5ad5bb2ac879e12afca6e816d83d 100644
> GIT binary patch
> delta 15
> WcmX>hepY;fFN>j`p3z318g2k9Uj*m?
> 
> delta 10
> RcmX>renNbL@5Z2NZU7lr1S$Xk
> 
> diff --git a/tools/testing/kunit/test_data/test_is_test_passed-failure.log b/tools/testing/kunit/test_data/test_is_test_passed-failure.log
> index 9e89d32d5667a59d137f8adacf3a88fdb7f88baf..7a416497e3bec044eefc1535f7d84ee85703ba97 100644
> GIT binary patch
> delta 28
> jcmZ3&yOLKp#4$jjEVZaOGe1wk(1goSPtRy0-!wJ=eKrU$
> 
> delta 23
> ecmZ3<yM&i7#4$jjEVZaOGe1wk&}5_VG&TTPhX-Z=

What is happening here?? Those logs appear as text to me. Why did git
freak out?

-- 
Kees Cook
