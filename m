Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AEA41ACA43
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 17:33:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4933CF18ZSzDr6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Apr 2020 01:33:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d43;
 helo=mail-io1-xd43.google.com; envelope-from=noloader@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UAQxFCOu; dkim-atps=neutral
Received: from mail-io1-xd43.google.com (mail-io1-xd43.google.com
 [IPv6:2607:f8b0:4864:20::d43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4932yh0kfPzDrfS
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 01:22:14 +1000 (AEST)
Received: by mail-io1-xd43.google.com with SMTP id u11so5860678iow.4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 08:22:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=afYWrqA88mrip3QSImFNIDtSBq4hgCooB2bEshcSTUU=;
 b=UAQxFCOuT9ZgYVUtPMmapK6yW42AWEzeecRfdoqYQgAMlYT7IccuoWIFd79UZS9vr0
 49BJtxFN032qD2wg+LQGYcGpyBVWmPOo7ndyULtUu1YksGq3Q/fsOqcJxaUWkEIgJzsf
 TrLnXpxk1qW5eVUKZrK1lzo3FjrH/7SLO3KAm9PlazV189HhcYHerShPdDxcqGGMReUE
 M/qdviq4LJN2hl/blsrvRQlz2VLTCKZCdjJBDPqcYm97sKWWqEx5u7m/qgngzYV9G4Qe
 +Mx84LxMdTSsj9Tc3YPemzrdXGbvxDUpFxfGNBx6aFhGUtX+vzuat8Ap9Pm6DR79OuQR
 HGmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=afYWrqA88mrip3QSImFNIDtSBq4hgCooB2bEshcSTUU=;
 b=H4R6WEU3/E1K7v2TGgvr0G9qrUMmCfPDpcdvKUalv7/wYm2oE9uWNFM08UGsXmPFx8
 WCsjQw+Oq0U+kKYiqfd+8H8jZJ8UzSxtRtURWxHDT1GyQzxvOQ0XH8lfauB+mmTho9hy
 08paikjj0cb/f6Q8/3TM9RfWcsdCNBLgDCI+m2vmvQL/xBTnMD8K9txGi5vxdutqfgWp
 dLmWTN6Mmf1mQgcxqA56KuwotjSGoOO8GrvKYfJUiBZscv2oKU5NISPm2nn/9pys76Il
 OrdyUNH+BYuQw8WhisVy7rDKlVD1XCStBSVnCiFQHohix85swCR8lB41SQipGRd7rb2r
 3Jkg==
X-Gm-Message-State: AGi0PuZvNc2LemFNY8lszRmOXss5O1QgCbqub4hDe3WqQmdDC6+UkG00
 vvWLjNKpnVFjC18vUwRRYn5Ujo3V42P2y1pUa0c=
X-Google-Smtp-Source: APiQypJUIhVkThLxveROFDaNJzF1F6H0SxF4p1b4jiq/KAWUdQRgChQRLh3E7aB3e3zkhDSizJovVvQtFX0qWwawXhQ=
X-Received: by 2002:a5e:db4d:: with SMTP id r13mr31582305iop.28.1587050530903; 
 Thu, 16 Apr 2020 08:22:10 -0700 (PDT)
MIME-Version: 1.0
References: <1586931450.ub4c8cq8dj.astroid@bobo.none>
 <20200415225539.GL11469@brightrain.aerifal.cx>
 <1586994952.nnxigedbu2.astroid@bobo.none>
In-Reply-To: <1586994952.nnxigedbu2.astroid@bobo.none>
From: Jeffrey Walton <noloader@gmail.com>
Date: Thu, 16 Apr 2020 11:21:56 -0400
Message-ID: <CAH8yC8k7dJdVS1LJRrGkxhbeVeXeGX2CWfC6sT--aso69Ksp6Q@mail.gmail.com>
Subject: Re: [musl] Powerpc Linux 'scv' system call ABI proposal take 2
To: musl@lists.openwall.com
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
Reply-To: noloader@gmail.com
Cc: libc-dev@lists.llvm.org, libc-alpha@sourceware.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 15, 2020 at 8:17 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Excerpts from Rich Felker's message of April 16, 2020 8:55 am:
> > On Thu, Apr 16, 2020 at 07:45:09AM +1000, Nicholas Piggin wrote:
> >> I would like to enable Linux support for the powerpc 'scv' instruction,
> >> as a faster system call instruction.
> >>
> >> This requires two things to be defined: Firstly a way to advertise to
> >> userspace that kernel supports scv, and a way to allocate and advertise
> >> support for individual scv vectors. Secondly, a calling convention ABI
> >> for this new instruction.
> >> ...
> > Note that any libc that actually makes use of the new functionality is
> > not going to be able to make clobbers conditional on support for it;
> > branching around different clobbers is going to defeat any gains vs
> > always just treating anything clobbered by either method as clobbered.
>
> Well it would have to test HWCAP and patch in or branch to two
> completely different sequences including register save/restores yes.
> You could have the same asm and matching clobbers to put the sequence
> inline and then you could patch the one sc/scv instruction I suppose.

Could GCC function multiversioning work here?
https://gcc.gnu.org/wiki/FunctionMultiVersioning

It seems like selecting a runtime version of a function is the sort of
thing you are trying to do.

Jeff
