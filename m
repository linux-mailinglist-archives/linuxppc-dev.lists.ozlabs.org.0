Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 054BC2B7197
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 23:30:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CbLHj3L1wzDqW9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Nov 2020 09:30:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=ndesaulniers@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=oxyyGnn2; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CbLFk32bXzDqQw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Nov 2020 09:28:57 +1100 (AEDT)
Received: by mail-pj1-x1042.google.com with SMTP id f12so1261470pjp.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 14:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=l+l6bPNdAyGzxXdbN4WyqDuDuPAZPzRdy+08/xBki4g=;
 b=oxyyGnn2pbqzNcAh7Ro5v/5q+r5L0/p8tgKM5bY5Amc103WXnHI72zTmNIl9EKzGUP
 hx+MTwWTcvuW+rL3rnEp3nVYrbexUS+150D5tGwQ7D80hcO9gUlWErWSaBGVadR7zLv7
 WEN+YlkXUTrpAr8XzzyDVMXB68lyehw2wG25TORvlwowlCEIbqmEalhfueDvU6V4t8xQ
 3F0PhD/cM5Y2wpMOOwp68iwtNEfMy7WD8y3fh9XUK9zFP1R82KM7z8aRDE/zDmieqzLF
 2CR9WVPP7zoYKtH/jT86zIJKogoA6Y755rDX953a0ITuhls5qVkiVB7fPVgjYXcvmrn+
 k2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=l+l6bPNdAyGzxXdbN4WyqDuDuPAZPzRdy+08/xBki4g=;
 b=PBt3Gg0zk8oxyZ7AwX+Lji225r/dineb63xkv+NLiGuQQyu7pqfxDU5CdMnHjq8wNV
 G7vsry/0NDjU9N4JX5RwdWmSnyRbWLrQpZAuRyQidiFt4Jgh0mMW2gkscFr0rtOdtZhx
 Sdn6qfDTK8tC20KJjC0F/VyYj8ba0kvld/qX/dI8WH30I0mI1/sSp+74VljKKhlsw/NN
 rH9MQ+9vfNrHEVhvKZrkOo+7RcDH6bY9UbwnAHvZpRuu6bUa2seSOk8A2YlHhsNa9x93
 PSQrckClKiXzRpMEsPtZKPfbIHsP0Fvdw0QGIdaYjBBvCkcmSHIH9DRY1ywceH0L6XPE
 xJTg==
X-Gm-Message-State: AOAM533GuG13ZE1Rmtbp+8oNst1D62rhdMhBZM+fD80wDb8mHQT3vvgz
 dYAC9smkUsBEdSLz9733vKGmC1AycwnVgO0+YNJFcw==
X-Google-Smtp-Source: ABdhPJxWXioFAPozNpXYIDJ3H6sf8MNf9Tby1TCVJwkV7fzb9RpugKiB0p81VLrblJcCJB4KyhP3+HCdilQdR+vYEIM=
X-Received: by 2002:a17:902:e901:b029:d8:e727:2595 with SMTP id
 k1-20020a170902e901b02900d8e7272595mr1537952pld.56.1605652134074; Tue, 17 Nov
 2020 14:28:54 -0800 (PST)
MIME-Version: 1.0
References: <20201116043532.4032932-1-ndesaulniers@google.com>
 <20201116043532.4032932-3-ndesaulniers@google.com>
 <20201117030214.GB1340689@ubuntu-m3-large-x86>
 <CAKwvOdk_sphJGQarEWJLzGZWkdzO9dqmcRmys3Retw3vn2Fwag@mail.gmail.com>
 <20201117221629.GA4679@embeddedor>
In-Reply-To: <20201117221629.GA4679@embeddedor>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 17 Nov 2020 14:28:43 -0800
Message-ID: <CAKwvOdmNW3iynqi_+2c1P-6Prq1a8iVufoaZh2NAbsaBLeZZ4Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] Revert "lib: Revert use of fallthrough pseudo-keyword
 in lib/"
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
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
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 Nathan Chancellor <natechancellor@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 17, 2020 at 2:16 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:
>
> I'm happy to take this series in my tree.  I'm planing to send a
> pull-request for -rc5 with more related changes. So, I can include
> this in the same PR.
>
> In the meantime I'll add this to my testing tree, so it can be
> build-tested by the 0-day folks. :)

SGTM, and thank you.  I'm sure you saw the existing warning about
indentation.  Do we want to modify the revert patch, or put another
patch on top?

-- 
Thanks,
~Nick Desaulniers
