Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C24D10DFAB
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Nov 2019 23:50:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47QRRw0ttvzDqty
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Dec 2019 09:50:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::144;
 helo=mail-lf1-x144.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.b="HVYZEgMZ"; dkim-atps=neutral
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47QRPT6pV6zDqsh
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Dec 2019 09:48:40 +1100 (AEDT)
Received: by mail-lf1-x144.google.com with SMTP id r14so8897061lfm.5
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 14:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DM1WaVRIUGvnQSzfAPiF4yttMdQv5XqK5t8psrz81pM=;
 b=HVYZEgMZkuP4zDHaNbbobY2Dz+xMbjfGWVrxpFaPaoOTTjncL6tHFib/8GEOBxPSuE
 bobVXDofhHspX5FipXsGJeCSgZOh3vVC1d+VZx3MOUIoHrkLzDvgFtBDLiqPgabxkxcs
 jH9TUg0Xn8mfAS8wZ5/5Psk8+LFvcFuRpB8sE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DM1WaVRIUGvnQSzfAPiF4yttMdQv5XqK5t8psrz81pM=;
 b=IzmNRDos8gJfmKPKwdrYrjINkdt+/w4laiCUswwSHNeDzAUDpPBvQmeXnRI/HMWisp
 bN6rdu854tV0S4QDK+yE29N9vWZ64aYkX//5H5G2GZ0kH0c6DD8rFnWetnVnYhKJXn/0
 fjQJcsMgC7vtGlKINYMTtfgUbFDzPL8Rp2CdIkZkyZi9pnzteuqWG2skF9J8bKulPDj9
 tZ+3I1wep5Sawi+oj9j8I4hma6eM+9srB0uvTmkHqd2rYM9mM4W7SqnsmoZZC6RMMp/M
 2rS9Vc39Gv/2L5nxwmtRnnPxgE8za6fcu2X32z1yulsYgKAnG+EK4jeoJGGuUUjPc+Bz
 tABg==
X-Gm-Message-State: APjAAAXvJCm1QnvGCf9wYJn+d93x8DfpuQ9WxhrrYLRPmyDr+mYesTxy
 gFcRmtpAxxT8V1LLZ0kHXrBIWrotTIY=
X-Google-Smtp-Source: APXvYqwEw8HFTHMyUqr0juwPkKNabQZIOZcfsj8xsOQg7An6Ukf/Em90fSkJ3U3qXSxEQVKq47PHzw==
X-Received: by 2002:ac2:51de:: with SMTP id u30mr2164503lfm.69.1575154115114; 
 Sat, 30 Nov 2019 14:48:35 -0800 (PST)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54])
 by smtp.gmail.com with ESMTPSA id n16sm12178102lfh.92.2019.11.30.14.48.34
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Nov 2019 14:48:34 -0800 (PST)
Received: by mail-lf1-f54.google.com with SMTP id y19so25129212lfl.9
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Nov 2019 14:48:34 -0800 (PST)
X-Received: by 2002:ac2:5a08:: with SMTP id q8mr39043729lfn.106.1575153781845; 
 Sat, 30 Nov 2019 14:43:01 -0800 (PST)
MIME-Version: 1.0
References: <877e3hfxyq.fsf@mpe.ellerman.id.au>
In-Reply-To: <877e3hfxyq.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 30 Nov 2019 14:42:45 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj-BW=C8mFr5mWEYyjgngLoq2N6PZ-RKtiL7X-e93poHw@mail.gmail.com>
Message-ID: <CAHk-=wj-BW=C8mFr5mWEYyjgngLoq2N6PZ-RKtiL7X-e93poHw@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.5-1 tag
To: Michael Ellerman <mpe@ellerman.id.au>, Mimi Zohar <zohar@linux.ibm.com>
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
Cc: tyreld@linux.ibm.com, Nayna Jain <nayna@linux.ibm.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 David Hildenbrand <david@redhat.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, yanaijie@huawei.com,
 Oliver O'Halloran <oohall@gmail.com>, Christoph Hellwig <hch@lst.de>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, madalin.bucur@nxp.com,
 YueHaibing <yuehaibing@huawei.com>, krzk@kernel.org, debmc@linux.vnet.ibm.com,
 valentin@longchamp.me, alastair@d-silva.org, harish@linux.ibm.com,
 leonardo@linux.ibm.com, msuchanek@suse.de, nathanl@linux.ibm.com,
 ravi.bangoria@linux.ibm.com, thuth@redhat.com, ajd@linux.ibm.com,
 gwalbon@linux.ibm.com, linuxram@us.ibm.com, Nick Piggin <npiggin@gmail.com>,
 oss@buserror.net, chris.packham@alliedtelesis.co.nz, Qian Cai <cai@lca.pw>,
 clg@kaod.org, Bjorn Helgaas <bhelgaas@google.com>,
 Nathan Chancellor <natechancellor@gmail.com>, hbathini@linux.ibm.com,
 asteinhauser@google.com, Mathieu Malaterre <malat@debian.org>,
 cmr@informatik.wtf, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 sbobroff@linux.ibm.com, chris.smart@humanservices.gov.au,
 vaibhav@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

[ Only tangentially related to the power parts ]

On Sat, Nov 30, 2019 at 2:41 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> There's some changes in security/integrity as part of the secure boot work. They
> were all either written by or acked/reviewed by Mimi.

  -#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390)
  +#if (defined(CONFIG_X86) && defined(CONFIG_EFI)) || defined(CONFIG_S390) \
  + || defined(CONFIG_PPC_SECURE_BOOT)

This clearly should be its own CONFIG variable, and be generated by
having the different architectures just select it.

IOW, IMA should probably have a

   config IMA_SECURE_BOOT

and then s390 would just do the select unconditionally, while x86 and
ppc would do

  select IMA_SECURE_BOOT if EFI

and

  select IMA_SECURE_BOOT if PPC_SECURE_BOOT

respectively.

And then we wouldn't have random architectures adding random "me me me
tooo!!!" type code.

               Linus
