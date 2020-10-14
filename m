Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A73528E8C3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 00:32:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CBRxf5krGzDqWL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Oct 2020 09:32:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::242;
 helo=mail-lj1-x242.google.com; envelope-from=jannh@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=AoTo3+pY; dkim-atps=neutral
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CBRtx2z3QzDqVD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Oct 2020 09:30:15 +1100 (AEDT)
Received: by mail-lj1-x242.google.com with SMTP id d24so1061389ljg.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Oct 2020 15:30:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jjl4waKkIn07fAHZxpQYfL1cJey++l2ULCvo+NpmtTI=;
 b=AoTo3+pYyDr0w6VWhfEzWtgMAa6u5EqUtIbZQ2wdSG8KrCn9aVrqk/7yhPB35QnD2m
 JalK+SeaQ3hXLo+S8bYDoNpWfnWxpQB/o00c26w91a14/A6mI5fG/jqus5sDeNFJLDuf
 BsNxJpUzCDXQHeObfZmnVJDuNlP1hv7yxDec4f6BOhh0CaTaty/5CVDrrONvhaHafpy3
 WWTj3p+df5fee81/4WgRdKVsueCgR7C+1tyNM57ZEFJuZcNf1kD37XwCnPAbjSh/vXPz
 6/Tp/AIlfr9HFwxC0w941Ocrco7hY/ksvJfhYETS8inE9HqwSVgikBfXguqBqfsPqKay
 3D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jjl4waKkIn07fAHZxpQYfL1cJey++l2ULCvo+NpmtTI=;
 b=ufzcb5N4YcK3owh4wdnrmJoaBeUrZVZl/FCms05yirNocQqaLtvkZsR/+2EloP2URe
 kXGiffesGMT7Fzax+GMv/O8dM6eqr12iaZxb6sQalCbzq5JHI8ccEmfq+Aur930ZWEE4
 +JSTl/Xc5EzY0H/lGs7MV1Y7yEvz5q0V+I48AtOELHLVRgVWK8mjHFxdisDdVsFNilZq
 LS1KoH8fQgJ6eJZzDoaBP8SF1JbGQA1T9dLAcfFZTOOuwr+QE/PwxEp3Kz870SSGecrg
 BvEfDYNYHtidHRxgvS1iBQpaOnCGDToA4aiNlwKL8Pd8JXqcgFGHpnbdgEey+t03RNFm
 urZw==
X-Gm-Message-State: AOAM533FPI4IlTVII2u1w/9/TWt9/YONI+J+x6TGz8peM7oHxgJOu1o2
 T1TqKIpUvQ8QqY00esjFxd3l+fLkxTOLy5CViANUyg==
X-Google-Smtp-Source: ABdhPJzccfdlAK+SRaf7zIcMIaXsyDc7g+LulQbCIaLDti9pJSokw7/xfAWa5vfRRrUMlssMAS3ed5P4pPE1EvYM4fA=
X-Received: by 2002:a2e:9f13:: with SMTP id u19mr119925ljk.160.1602714609293; 
 Wed, 14 Oct 2020 15:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20201007073932.865218-1-jannh@google.com>
 <d5332a7b-c300-6d28-18b9-4b7d4110ef86@oracle.com>
 <20201010110949.GA32545@gaia>
 <af207cf8-3049-85eb-349d-5fed6b9be49c@oracle.com>
 <20201012172218.GE6493@gaia> <20c85633-b559-c299-3e57-ae136b201526@oracle.com>
 <20201013091638.GA10778@gaia>
 <e4c2c56b-3dbe-73dd-ea72-a5378de7de6a@oracle.com>
In-Reply-To: <e4c2c56b-3dbe-73dd-ea72-a5378de7de6a@oracle.com>
From: Jann Horn <jannh@google.com>
Date: Thu, 15 Oct 2020 00:29:42 +0200
Message-ID: <CAG48ez0hoNb+DsMtzanGMXWdU63GwSvpzFCx5CkQa3Xxxo+Abg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mm/mprotect: Call arch_validate_prot under mmap_lock
 and with length
To: Khalid Aziz <khalid.aziz@oracle.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 kernel list <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Linux-MM <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, sparclinux@vger.kernel.org,
 Anthony Yznaga <anthony.yznaga@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 14, 2020 at 11:24 PM Khalid Aziz <khalid.aziz@oracle.com> wrote:
[...]
> current code? What FreeBSD does seems like a reasonable thing to do. Any
> way first thing to do is to update sparc to use arch_validate_flags()
> and update sparc_validate_prot() to not peek into vma without lock. I
> can do that unless Jann wants to rework this 2 patch series with these
> changes.

Ah, if you're willing to take care of that, that'd be nice, please do. :)
