Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9561C2853
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 23:09:19 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49F1vc0w3szDrBn
	for <lists+linuxppc-dev@lfdr.de>; Sun,  3 May 2020 07:09:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=zx2c4.com (client-ip=192.95.5.64; helo=mail.zx2c4.com;
 envelope-from=jason@zx2c4.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=zx2c4.com header.i=@zx2c4.com header.a=rsa-sha1
 header.s=mail header.b=yoDjO/be; dkim-atps=neutral
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49F1qz4kh8zDr73
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  3 May 2020 07:06:05 +1000 (AEST)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2305b5ca
 for <linuxppc-dev@lists.ozlabs.org>;
 Sat, 2 May 2020 20:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=OMy6OqY10ehs479MElnvca/O1bE=; b=yoDjO/
 be+oyUCShp4ZVLh4bPBUDlMzJ381RWsGyzIpE1hzbTBjllfAwEuYsCABvqau8hbi
 5dmW11+dq0k4bAMiLm5uczDpn89mVsWbU2NXf3odIashJvLoOIqKrnP39XRaAKax
 NN0am5x4sJ6S+u6pbvSy5o/r6zW6XAT40WtD6sfTDZ/iUybbrewr2AymtptJg8XI
 DbjQ+pe05O1q2SKWDoAPP/IJ8K8V+DSWFKiiIc3x/2GhsFb1s5i73SssFvHdmHKw
 9fpK7wPbHaB2N4pENA7n6CaqbU4UEsHiopaTqAfnodmoTFZPI5c5U4yLq87FSD74
 VW+NkN3yOcyPQ92w==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5f5c9560
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <linuxppc-dev@lists.ozlabs.org>;
 Sat, 2 May 2020 20:53:47 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id b18so7652523ilf.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 May 2020 14:05:58 -0700 (PDT)
X-Gm-Message-State: AGi0PuZPuNL7bcmnXhQ38nBSpfEptiYr1/0RdggSxAOeg0PBtxQVVJPh
 zPNUl7cvewZ/2tuu7Gecze8A5Nql51Ha+3nghH0=
X-Google-Smtp-Source: APiQypKSzW4iIdGBa55HbjRTCDEbI2+eoByi/qgW5rc/uPvsaHpDBAI1P1dPctYeyAYkAyWYUinKdqXT86JVKoxUnpE=
X-Received: by 2002:a92:5c82:: with SMTP id d2mr9968866ilg.231.1588453557814; 
 Sat, 02 May 2020 14:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200502182427.104383-1-ebiggers@kernel.org>
In-Reply-To: <20200502182427.104383-1-ebiggers@kernel.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 2 May 2020 15:05:46 -0600
X-Gmail-Original-Message-ID: <CAHmME9oPqWfTwTtawM-29Lqck-N-kYo4nGr1-4hCW975DhB0Uw@mail.gmail.com>
Message-ID: <CAHmME9oPqWfTwTtawM-29Lqck-N-kYo4nGr1-4hCW975DhB0Uw@mail.gmail.com>
Subject: Re: [PATCH 0/7] sha1 library cleanup
To: Eric Biggers <ebiggers@kernel.org>
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
Cc: linux-s390@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linuxppc-dev@lists.ozlabs.org, LKML <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>,
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, mptcp@lists.01.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks for this series. I like the general idea. I think it might make
sense, though, to separate things out into sha1.h and sha256.h. That
will be nice preparation work for when we eventually move obsolete
primitives into some <crypto/dangerous/> subdirectory.
