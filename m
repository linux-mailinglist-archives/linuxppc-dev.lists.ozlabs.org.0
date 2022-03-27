Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C264E8A7E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 00:24:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KRVk33BfMz3c34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Mar 2022 09:24:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=QNN1i2WI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::229;
 helo=mail-lj1-x229.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=QNN1i2WI; 
 dkim-atps=neutral
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KRVjL0Cctz2yNF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Mar 2022 09:23:47 +1100 (AEDT)
Received: by mail-lj1-x229.google.com with SMTP id b43so12364463ljr.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 15:23:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Qdphx0B9HnveSZQ4eZgylUI7GQmjcDDsYT6PZjX3jZk=;
 b=QNN1i2WIBH6Hu63QF8GMULZ+aSMQa/oLj2pbk2VgTMnx1yqkwNXGLDJmqXjZxs2Hz0
 ZmkqXhrpXmFDBHDx4HraU1BJNogt311CP4JUKQrr5J/e2bEEJ7ZY8MIlpuwZvBDHN1mM
 zlwtVtd3jxs/gxCz/r2kOEc3G9s5FcpJNIcJs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Qdphx0B9HnveSZQ4eZgylUI7GQmjcDDsYT6PZjX3jZk=;
 b=MWY4LCx7DZuWc7hkXLhwiGrnnLJ5sDuqZXlRLWdf34lGz9NlIk2T0CblQY/BdO6cJ2
 KgYZpIc+gbmJOEyc2zpYU2vWlnB+cLxkGzrgfJMH8aSVU/8Evut1D489PaFAc1TrdVkl
 Wbbqf51+jtaJTL/N3pHi3bPGuDYAKnXezXSDjMur3McO3EcF62/izOb0wKGkhzXq57CL
 ws7ZYH3O1ZvMKwG9zuDN3uH0LQ8uD6tUdHtg4lDmLLRoT/pTBMnSIkUQVDtIwGake0Um
 e0/y4+OgLR6hafQ1wE/qvtGoNtCqMyIDSaLqYCuepQ5h7suxEJsL8wdYoUBDndoLvJPZ
 GAEw==
X-Gm-Message-State: AOAM533quALyA3HlTFEjhdWIJJ5cD7RZkaGsiWbC5b1EenlXu56mUQCz
 QXFjhd6H8DM6NI6o4XkSl/82DpKlQaqpb8uHtxY=
X-Google-Smtp-Source: ABdhPJzXANi4k6xYGk+WnioW05VuteGxZltUToJMAKhBvnrBtwMN/cJS23dgknOBQFRB+rT1LclrvQ==
X-Received: by 2002:a2e:96c7:0:b0:249:7c4d:a152 with SMTP id
 d7-20020a2e96c7000000b002497c4da152mr17393427ljj.510.1648419822328; 
 Sun, 27 Mar 2022 15:23:42 -0700 (PDT)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com.
 [209.85.208.175]) by smtp.gmail.com with ESMTPSA id
 m22-20020a197116000000b0044a0dbba162sm1464849lfc.235.2022.03.27.15.23.40
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 15:23:41 -0700 (PDT)
Received: by mail-lj1-f175.google.com with SMTP id q5so16873298ljb.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Mar 2022 15:23:40 -0700 (PDT)
X-Received: by 2002:a2e:9b10:0:b0:247:f28c:ffd3 with SMTP id
 u16-20020a2e9b10000000b00247f28cffd3mr17214178lji.152.1648419820604; Sun, 27
 Mar 2022 15:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220328090111.26f8980f@canb.auug.org.au>
In-Reply-To: <20220328090111.26f8980f@canb.auug.org.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 27 Mar 2022 15:23:24 -0700
X-Gmail-Original-Message-ID: <CAHk-=whGmZrYZ=YdcjeJbpviUTShj0NOiG2q-3d1-RJtz6vBPQ@mail.gmail.com>
Message-ID: <CAHk-=whGmZrYZ=YdcjeJbpviUTShj0NOiG2q-3d1-RJtz6vBPQ@mail.gmail.com>
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

On Sun, Mar 27, 2022 at 3:01 PM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Building LInus' tree, today's linux-next build (powerpc
> ppc64_defconfig) failed like this:

Gaah.

I even *looked* at that code when merging, and convinced myself I had
gotten the #ifdef/#endif chain right. Apparently I can't count.

What a maroon I am.

Will apply that patch asap.

Thanks,
                Linus
