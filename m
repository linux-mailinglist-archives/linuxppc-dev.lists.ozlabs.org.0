Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CB17F23C095
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Aug 2020 22:12:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BLmC33w96zDqc7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Aug 2020 06:12:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=brendanhiggins@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=GJ9lUIQl; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BLm9G3x92zDqBW
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Aug 2020 06:11:14 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id c6so3165275pje.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Aug 2020 13:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=X2mYBNPQlfulBGUiUF3OgK7lyVU+rDyXfhP91vVVFlg=;
 b=GJ9lUIQlhroAI9Qx0p4xmfgldOZs2AAE7pAVHI5pia4oB28x7V5RY15F/VqXapy6iy
 +vXVYP7NjtUN1l+aR0ZQnHCWlDFuL18tWhTXS/PwSPqoVO3hBNUKm43IZoIJZ/06Ir+M
 zH6FXNGCHY+XcwW1EyKxk9ytILNMg0DKJ+cTJguzuIjlYGvDn4t/3GhtAD/UWaeBYO1v
 K2o4QW831rzwLDp53xjnW/cQLdUOy+++a/SctmAFLEQVtM2BJawtJ1+KySFzPmYfPrLg
 dFKXIFv4DQyGBXPiAZ2QRblRglMrrSdG39E+6Hcr+1HX6L6jjj+vcUfCC2N62nXow1AS
 wMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=X2mYBNPQlfulBGUiUF3OgK7lyVU+rDyXfhP91vVVFlg=;
 b=EMsd3YxhKIRvh6Lk6Bl3pcsYUnYJCbwXVWgcnmVA+of0SyqsH93tJATfC6mzlJaw43
 31JAj25narDV0WPHISX9xBtHTe8aBbxYOSafTDUr0Ui7ABRVz2gW9wbNgBTkG50R97As
 qxLbo6chCICLgPsyDhyhxPvu4EoMPlInWORwI1/X2mEZfXeJgFiszDYYG2zXohi8DvlM
 hWI6D8sahkckaH3A1gtvk6ahwLVzScyWw/yXgMHHUQzTuHr0s2b2PJWApR5OdXpJjGwm
 eGxhn2YiknSdjJKqbeJC7nzx5GmaSPut09lJgEQ8zf+MadxgrQPqRDT4JXOKGIDLdqWF
 nWHw==
X-Gm-Message-State: AOAM531wKjSldhPyqU4C+bouZbq4zMRMMSsP8YBQFUIyk8y+TRnOY5ck
 nCTQVwipCtAfd0PB+tjq8enXmYQtp0WsHv3DlBWlwA==
X-Google-Smtp-Source: ABdhPJxl+Kd8Ihx2ttUsvcGN3ycEyHEQYEvKffflaWl/EyeALM0vmg4FTGKzFLgIPV5XkISHcS2NVNq9x6QlLNDzIrY=
X-Received: by 2002:a17:90a:c593:: with SMTP id
 l19mr6141441pjt.20.1596571870728; 
 Tue, 04 Aug 2020 13:11:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200626210917.358969-1-brendanhiggins@google.com>
 <20200626210917.358969-10-brendanhiggins@google.com>
 <202006261434.119AE33DBB@keescook>
In-Reply-To: <202006261434.119AE33DBB@keescook>
From: Brendan Higgins <brendanhiggins@google.com>
Date: Tue, 4 Aug 2020 13:10:59 -0700
Message-ID: <CAFd5g45HeXUBVNW31ZYgpqhYOOu=1jwK_LKZQUOO_6mGaqtSUA@mail.gmail.com>
Subject: Re: [PATCH v5 09/12] kunit: test: add test plan to KUnit TAP format
To: Kees Cook <keescook@chromium.org>
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 catalin.marinas@arm.com, jcmvbkbc@gmail.com, will@kernel.org,
 Paul Mackerras <paulus@samba.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, rppt@linux.ibm.com,
 Iurii Zaikin <yzaikin@google.com>, linux-xtensa@linux-xtensa.org,
 Arnd Bergmann <arnd@arndb.de>, Jeff Dike <jdike@addtoit.com>,
 linux-um <linux-um@lists.infradead.org>, linuxppc-dev@lists.ozlabs.org,
 David Gow <davidgow@google.com>, Shuah Khan <skhan@linuxfoundation.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 KUnit Development <kunit-dev@googlegroups.com>,
 Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>,
 Stephen Boyd <sboyd@kernel.org>, Greg KH <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Alan Maguire <alan.maguire@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 26, 2020 at 2:35 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Jun 26, 2020 at 02:09:14PM -0700, Brendan Higgins wrote:
> > TAP 14 allows an optional test plan to be emitted before the start of
> > the start of testing[1]; this is valuable because it makes it possible
> > for a test harness to detect whether the number of tests run matches the
> > number of tests expected to be run, ensuring that no tests silently
> > failed.
> >
> > Link[1]: https://github.com/isaacs/testanything.github.io/blob/tap14/tap-version-14-specification.md#the-plan
> > Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> > Reviewed-by: Stephen Boyd <sboyd@kernel.org>
>
> Look good, except...
>
> > diff --git a/tools/testing/kunit/test_data/test_is_test_passed-all_passed.log b/tools/testing/kunit/test_data/test_is_test_passed-all_passed.log
> > index 62ebc0288355c4b122ccc18ae2505f971efa57bc..bc0dc8fe35b760b1feb74ec419818dbfae1adb5c 100644
> > GIT binary patch
> > delta 28
> > jcmbQmGoME|#4$jjEVZaOGe1wk(1goSPtRy09}gP<dC~`u
> >
> > delta 23
> > ecmbQwGmD2W#4$jjEVZaOGe1wk&}5@94;uhhkp{*9
> >
> > diff --git a/tools/testing/kunit/test_data/test_is_test_passed-crash.log b/tools/testing/kunit/test_data/test_is_test_passed-crash.log
> > index 0b249870c8be417a5865bd40a24c8597bb7f5ab1..4d97f6708c4a5ad5bb2ac879e12afca6e816d83d 100644
> > GIT binary patch
> > delta 15
> > WcmX>hepY;fFN>j`p3z318g2k9Uj*m?
> >
> > delta 10
> > RcmX>renNbL@5Z2NZU7lr1S$Xk
> >
> > diff --git a/tools/testing/kunit/test_data/test_is_test_passed-failure.log b/tools/testing/kunit/test_data/test_is_test_passed-failure.log
> > index 9e89d32d5667a59d137f8adacf3a88fdb7f88baf..7a416497e3bec044eefc1535f7d84ee85703ba97 100644
> > GIT binary patch
> > delta 28
> > jcmZ3&yOLKp#4$jjEVZaOGe1wk(1goSPtRy0-!wJ=eKrU$
> >
> > delta 23
> > ecmZ3<yM&i7#4$jjEVZaOGe1wk&}5_VG&TTPhX-Z=
>
> What is happening here?? Those logs appear as text to me. Why did git
> freak out?

That's because this is all test data; it's all plaintext, but out of
necessity some of the test data is kind of munged up and causes
checkpatch to complain, so Shuah asked us to mark it as binary since
it isn't actually code and so checkpatch will stop flagging it.
