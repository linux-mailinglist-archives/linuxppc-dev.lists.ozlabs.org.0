Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 325DF273235
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 20:49:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwD4w3DV7zDqWf
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 04:49:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=intel.com (client-ip=2a00:1450:4864:20::542;
 helo=mail-ed1-x542.google.com; envelope-from=dan.j.williams@intel.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=IoHznwPz; dkim-atps=neutral
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwD345Y1FzDqST
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 04:47:54 +1000 (AEST)
Received: by mail-ed1-x542.google.com with SMTP id b12so13775866edz.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 11:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pyDbIcQAdvsX0pQDLSC3IzwQOFdxADNEZk7v/eXeHTc=;
 b=IoHznwPzHOT1/HK/4KdjNbW3VhuKGXl+P/cFZ5oOS8j7l6omlNvRVY+IX6ljbCmS4u
 Nm7ZCAXl8KTfXvYsSNmXHgC0uian9TgtQxLW+oi0tNX7fNWt89tv2IDtS3IssEV+OiAg
 mDL8abQO6xKee3Gp++DudPOLquaQrWDV+eRi0yhkTY2YNC9KqOtUuvBwDkwQokWnobrA
 ydVOgaXnbtflxVXc5lTvukwzoCJv7t73HFLvd0FWJP7GCnXVDWL4a3zlYb3vAavqu2CW
 tIuGeZj73fNt3triaqANlSDGLTWXI+DgTY2SZXAWF4y1XUb6DBXx4kCdpGDxGZH/LwGh
 4fLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pyDbIcQAdvsX0pQDLSC3IzwQOFdxADNEZk7v/eXeHTc=;
 b=DDclEDLRWzjN9+rpfUC1KyDq9quKz7sd5iLeAnE3KDdUy55Bgpg4qC+dA8QKZdFSXz
 +gjktuhU3cLyCD1qkFnJxuh3Nox5Lo66mtVi8EGEJ0c7lq2fK5gtCN0k4yeN3F/NwrRg
 YO0PZv/SIsUv2lsRNO1aWpuipJP85dGzxBsnNkdaKoW8aKt4PkxcH+aKJOs8Hc//0NIw
 vBoTV6TZarXjHU03urILkm9Ll32liYnnpQFc0k3mf4dIjItdV0OQfVtV/uePJUfmr2Fy
 BGoiKjIY2B3+WiB1Sw0xy8lehmq6AOj+8pMeuy97maynBRQeLjgQgmVNDEiOWeMvuQ8l
 CgHQ==
X-Gm-Message-State: AOAM532xvZBVAZmcwPsUS6jgUBHSgfCccnAWsVax2swBPuK3HEHcXgKu
 zjes7qRvt7gZMC9yS6XYPuY/pAQYOb8Bs9Y0eWRGkQ==
X-Google-Smtp-Source: ABdhPJyr3HoCDSaaSE6/nQdSCDm40TS19EV3SXSzVioIoKdk8F7Y7f0V8JbN08ev9d+bgVmhdVvRbDDZMn9JIW+Dx+I=
X-Received: by 2002:aa7:d04d:: with SMTP id n13mr324028edo.354.1600714069342; 
 Mon, 21 Sep 2020 11:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <CAKwvOdkGd6mPw_OKHwmpVs_xxFW2oqAoXyr7M8hu3PCCwkqCEQ@mail.gmail.com>
In-Reply-To: <CAKwvOdkGd6mPw_OKHwmpVs_xxFW2oqAoXyr7M8hu3PCCwkqCEQ@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Mon, 21 Sep 2020 11:47:38 -0700
Message-ID: <CAPcyv4jZfbuS8zHZXBNqRTi_1HzHLUztkxDmsruMk5PGinGhPg@mail.gmail.com>
Subject: =?UTF-8?B?UmU6IGVycm9yOiByZWRlZmluaXRpb24gb2Yg4oCYZGF4X3N1cHBvcnRlZOKAmQ==?=
To: Nick Desaulniers <ndesaulniers@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Jiang <dave.jiang@intel.com>, "kernelci.org bot" <bot@kernelci.org>,
 linux-nvdimm <linux-nvdimm@lists.01.org>, LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Vishal Verma <vishal.l.verma@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 21, 2020 at 11:35 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Hello DAX maintainers,
> I noticed our PPC64LE builds failing last night:
> https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/388047043
> https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/388047056
> https://travis-ci.com/github/ClangBuiltLinux/continuous-integration/jobs/388047099
> and looking on lore, I see a fresh report from KernelCI against arm:
> https://lore.kernel.org/linux-next/?q=dax_supported
>
> Can you all please take a look?  More concerning is that I see this
> failure on mainline.  It may be interesting to consider how this was
> not spotted on -next.

The failure is fixed with commit 88b67edd7247 ("dax: Fix compilation
for CONFIG_DAX && !CONFIG_FS_DAX"). I rushed the fixes that led to
this regression with insufficient exposure because it was crashing all
users. I thought the 2 kbuild-robot reports I squashed covered all the
config combinations, but there was a straggling report after I sent my
-rc6 pull request.

The baseline process escape for all of this was allowing a unit test
triggerable insta-crash upstream in the first instance necessitating
an urgent fix.
