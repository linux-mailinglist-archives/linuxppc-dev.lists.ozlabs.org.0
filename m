Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8D34E8A87
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 00:32:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRVvh6p6Xz3c4X
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 09:32:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=K7BQ2fnr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::136;
 helo=mail-lf1-x136.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=K7BQ2fnr; 
 dkim-atps=neutral
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRVv01Wcjz2xBl
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 09:32:10 +1100 (AEDT)
Received: by mail-lf1-x136.google.com with SMTP id bq24so5870238lfb.5
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 15:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yhspFAC09wnm+6Eh2TE7utcbggJMlqMOLI9aX60zVD8=;
 b=K7BQ2fnrxBITIiKXXqYXNEq1mjbFT/RDmtdUZ9GXVaKpGUTN+WKtKNSkpKXwCrAMJy
 78dGOmuOG6vNftRvFPk4qDr4TxLtFm+TI/tQHnTeYhC9GLGkhiiFgovdb3NR/8RzMXdX
 Nl283+wES+W+ntTy8aPqUED24Da2xl0PWQET8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yhspFAC09wnm+6Eh2TE7utcbggJMlqMOLI9aX60zVD8=;
 b=PbwLKW8ncFacG1bMXGC4mVwOr6Hr3ldylQHpskx9ZfBklHa/uvwwdikaWP8gT4LLx9
 d1DfftKCvVwk0+0jrDhSb9Qlfy419JcfmXgEpROgs1xo5KlZzQaKkiiW7MftHd4nfTfO
 vpv/4Bw1GH9DkGrLG3Hq9p3FjZwLKjch1MDg4qKkU1g8TrIz2j/TMpMEM9MD5Ph6JDAY
 1JPau1Kb4Q7AsBYP8t+zahvkHEpoWrHFZk5ZtuUFYwESknSa0F62bv9IeHEdhU5aXpKa
 odw3AfdiMWkFtQzX28gr8qnFJMR5ndVBbz252E8iLjFhBdYup+zBnB0tdRjnaZcVCZii
 re7Q==
X-Gm-Message-State: AOAM533ZA1HxQdKOoSZBTOMtghsd7ZdDEXv8fk9F1SXgQLses5HJpft5
 uA9JXDw25aOJY+C4S527f3MJLD2tB5yU9uKWjUc=
X-Google-Smtp-Source: ABdhPJxlVhrvwV58C0w7tZy8dtUJjKCD/oEaNDfOKs+497JQQwSruwk8paSUfbFKDaODu7ukfQ2nFQ==
X-Received: by 2002:ac2:4f8f:0:b0:448:5ddb:e52c with SMTP id
 z15-20020ac24f8f000000b004485ddbe52cmr16845810lfs.323.1648420325466; 
 Sun, 27 Mar 2022 15:32:05 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45]) by smtp.gmail.com with ESMTPSA id
 d13-20020a056512320d00b0044a34c95fc0sm1462978lfe.289.2022.03.27.15.32.03
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 15:32:04 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id 5so21827118lfp.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 15:32:03 -0700 (PDT)
X-Received: by 2002:ac2:4f92:0:b0:448:7eab:c004 with SMTP id
 z18-20020ac24f92000000b004487eabc004mr17393349lfs.27.1648420323009; Sun, 27
 Mar 2022 15:32:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220328090111.26f8980f@canb.auug.org.au>
 <CAHk-=whGmZrYZ=YdcjeJbpviUTShj0NOiG2q-3d1-RJtz6vBPQ@mail.gmail.com>
In-Reply-To: <CAHk-=whGmZrYZ=YdcjeJbpviUTShj0NOiG2q-3d1-RJtz6vBPQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Mar 2022 15:31:46 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiqZaY0oZ86fJtpZSfCJJ48xqC0jjRC4m6WWrnL7q5Leg@mail.gmail.com>
Message-ID: <CAHk-=wiqZaY0oZ86fJtpZSfCJJ48xqC0jjRC4m6WWrnL7q5Leg@mail.gmail.com>
Subject: Re: linux-next: build failure in Linus' tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

-#endif /* CONFIG_LIVEPATCH */


On Sun, Mar 27, 2022 at 3:23 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> I even *looked* at that code when merging, and convinced myself I had
> gotten the #ifdef/#endif chain right. Apparently I can't count.
>
> What a maroon I am.

Oh, and I see why I screwed up: I even did a "git diff" against the
original powerpc tree, but then I visually matched

  -#define klp_get_ftrace_location klp_get_ftrace_location
   ...
  -#endif /* CONFIG_LIVEPATCH */

as a #ifdef/#endif pair.

Now that I look at it knowing that I screwed up, I go "Duh!".

Time to take my meds,

              Linus
