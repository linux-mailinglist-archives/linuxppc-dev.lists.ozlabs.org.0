Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4977340A1E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 02:25:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H7kdJ0vyvz2ypM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Sep 2021 10:25:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=OyWldn4c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::22c;
 helo=mail-lj1-x22c.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=OyWldn4c; 
 dkim-atps=neutral
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H7kcd0dlHz2xrD
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Sep 2021 10:24:32 +1000 (AEST)
Received: by mail-lj1-x22c.google.com with SMTP id s3so20384592ljp.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 17:24:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ilht7yuGeza7KxnmHTP+E2966EzjBhfJp58VMsQTPTY=;
 b=OyWldn4cRJVLyXq6LgbpKqWBqxTaQjehON/ag/GIf4HbIUXBoHl9V8OzGKT2Ylw04i
 uUG63w1xUjKTcrlLMVBNRKtBukGdfVoxMaymciw4pdsgxR1SflagLJb66lTfifVfnZuV
 nGyWGAvhm/vMudecgclcQqVLBtG8dwi+c08xc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ilht7yuGeza7KxnmHTP+E2966EzjBhfJp58VMsQTPTY=;
 b=5FSFDbuKpVuzwX2RLEYI/QpyNgO0fJn6TPDNfGyewNH5+uGhL6iRIU8fWefuRlblAN
 v1ZLRX1v4Zs4NsHPQgfHzUWaxXSIQpd1ROccTNl3SY9sizD/6dzITjL6ZqcqM6A0cXk0
 Xq3jlMbWfF4eG6KXSh+6TXMcd7AV7RQTRgczWvXdo0MwG0KEfUeRYenEx2YnhdzYBn8y
 kBfS9V6cy74nKrJbZUWHfAmbmbTqAkEk1IINujT5R7W/c6hrdqJhUB4h3S0Qui93kYh8
 UuTO18D0bv2M2JIux+VrtfC8DMgka/fz2wFg76CG4JmeOPrQh/Q3RuJd8+Y4wV0K3U1T
 0y4g==
X-Gm-Message-State: AOAM530u1DFnCUtFv1LuvU6A0L/whtlUo5nmPwiyFmfUPtSKr3kdYjhU
 DP0/8doqO4FxJNkyxXKzfEsfxVWx6w7ZBe+BZ2Q=
X-Google-Smtp-Source: ABdhPJyOZFGSWhR5L/MdO8TqafEbf2MUTC5WZU2Bt0GLBlCgMOVFZoj6yXvcxzzg7NNmyHKAef51RA==
X-Received: by 2002:a2e:804c:: with SMTP id p12mr12855040ljg.118.1631579068262; 
 Mon, 13 Sep 2021 17:24:28 -0700 (PDT)
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com.
 [209.85.167.53])
 by smtp.gmail.com with ESMTPSA id z13sm1150918ljo.37.2021.09.13.17.24.27
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 17:24:27 -0700 (PDT)
Received: by mail-lf1-f53.google.com with SMTP id k4so24766214lfj.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Sep 2021 17:24:27 -0700 (PDT)
X-Received: by 2002:a05:6512:94e:: with SMTP id
 u14mr5107509lft.173.1631579067472; 
 Mon, 13 Sep 2021 17:24:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210914100853.3f502bc9@canb.auug.org.au>
 <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
In-Reply-To: <CAHk-=whOv-LZKxBqQr8yzmhi7sN4zoFG7t8ALNx+2XFhXjGTpA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 13 Sep 2021 17:24:11 -0700
X-Gmail-Original-Message-ID: <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
Message-ID: <CAHk-=whGuEkYmQcJx8WfZ7MFhbKGJDcA6NUZWtrnM6Y6xFqATw@mail.gmail.com>
Subject: Re: linux-next: build failure after merge of the origin tree
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

On Mon, Sep 13, 2021 at 5:19 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> What version of gcc is this? Are you maybe on gcc-4.9 and we just
> didn't check that properly?

Hmm. That version check works for me (tested by just arbitrarily
making min-tool-version return version 15 for gcc ;)

So you got far enough that I don't believe you have gcc-4.

I have no idea why it then complains about removal of the GCC4 macros.

Can somebody hit me with the clue-bat?

            Linus
