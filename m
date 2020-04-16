Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 714D31AB5EA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 04:36:10 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 492jyb3nZZzDrDF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Apr 2020 12:36:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d41;
 helo=mail-io1-xd41.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=AKvcIeyl; dkim-atps=neutral
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com
 [IPv6:2607:f8b0:4864:20::d41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 492jwW64LFzDqvl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Apr 2020 12:34:19 +1000 (AEST)
Received: by mail-io1-xd41.google.com with SMTP id b12so19439618ion.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 19:34:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=itmXKVVHyhLg4W1YbKAR76og2TJJfG4RTgXOFdOAIfs=;
 b=AKvcIeylaJL4mM38i15Et+R3ijXRnPl6dbtXgWWUNoKE0vNTmaRSqugqfWcTiTv+0+
 /qEqY9utKcuBty9HFel7Hi4tuAN5IvwSP7L+MFKC/VSD9oJO55sT3jNry9EBGV8RSCZV
 fGs/VnbMS8uvOvYY0vB5PSO3qRgkp39khpesAubvBb3DZ+wzFJgkv0Idh6C9eApyd+Qj
 uyRe6UM0URWaoOQ6P6r7SxdyHGwKz/ZG/2NGVXDbS4LIKjG/dbfzBmtsahXrMWmYr2L3
 yWC7GRe3k1aV8M88ZmsdItgmh4GiGGUPNFKdnbM8WNA73VgSd5wtDNKJw0QvvipHkgh9
 Zc1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=itmXKVVHyhLg4W1YbKAR76og2TJJfG4RTgXOFdOAIfs=;
 b=q3E4qgh+XFYZ80psOlsUqgEoalvC0ZHCZLfj/zjMuG2K0oy0Go0U0rHHisYTt6a20n
 Iak5LEkHhKNwcicF9fLHCa/4NjLNHMAF2WnsfVuM+BGyRalRZZtrhwey6RnZ39t1q5mD
 5AKe8t/hveKjeoSTazMbmbVO0gveZy8oHvCWEBHA7ZwvQrWVitXDIPYXlLLN0Lv+N3UL
 UH9e8Ys83pTxopa+Mdyvxs3DAOtCYUo44vGhCatdFAjutaZhf1JcYQmufETne80ARUpF
 7MCJ+0WxX1khErKI4b1PGsa5etYSxCSQVulwFNCkAAllqHybeoFzqX+py76jvUFHCnyu
 HEvQ==
X-Gm-Message-State: AGi0PuZ7FkbJz8T5dOoUNiuhOYrE6mvYx9gf6omvqFOB8zw1BKLIKicT
 0g44GbqP/N7vAmztNQnfCF4zPj0CVhcK/u9Xjik=
X-Google-Smtp-Source: APiQypKUzKRz1ojShZLzll6LlFHpm4yH8NN5p1XpJRJ2u8XiXVRaiRkeYPaOeK2Zy3/dI8zwAu/ZQ4tDDcBpbKHkUDU=
X-Received: by 2002:a05:6602:22c3:: with SMTP id
 e3mr29157327ioe.75.1587004456483; 
 Wed, 15 Apr 2020 19:34:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200323075354.93825-1-aik@ozlabs.ru>
 <b512ac5e-dca5-4c08-8ea1-a636b887c0d0@ozlabs.ru>
 <d5cac37a-8b32-cabf-e247-10e64f0110ab@ozlabs.ru>
In-Reply-To: <d5cac37a-8b32-cabf-e247-10e64f0110ab@ozlabs.ru>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Thu, 16 Apr 2020 12:34:04 +1000
Message-ID: <CAOSf1CGfjX9LGQ1GDSmxrzjnaWOM3mUvBu9_xe-L2umin9n66w@mail.gmail.com>
Subject: Re: [PATCH kernel v2 0/7] powerpc/powenv/ioda: Allow huge DMA window
 at 4GB
To: Alexey Kardashevskiy <aik@ozlabs.ru>
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
Cc: KVM list <kvm@vger.kernel.org>, Fabiano Rosas <farosas@linux.ibm.com>,
 Alistair Popple <alistair@popple.id.au>, kvm-ppc@vger.kernel.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 16, 2020 at 11:27 AM Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>
> Anyone? Is it totally useless or wrong approach? Thanks,

I wouldn't say it's either, but I still hate it.

The 4GB mode being per-PHB makes it difficult to use unless we force
that mode on 100% of the time which I'd prefer not to do. Ideally
devices that actually support 64bit addressing (which is most of them)
should be able to use no-translate mode when possible since a) It's
faster, and b) It frees up room in the TCE cache devices that actually
need them. I know you've done some testing with 100G NICs and found
the overhead was fine, but IMO that's a bad test since it's pretty
much the best-case scenario since all the devices on the PHB are in
the same PE. The PHB's TCE cache only hits when the TCE matches the
DMA bus address and the PE number for the device so in a multi-PE
environment there's a lot of potential for TCE cache trashing. If
there was one or two PEs under that PHB it's probably not going to
matter, but if you have an NVMe rack with 20 drives it starts to look
a bit ugly.

That all said, it might be worth doing this anyway since we probably
want the software infrastructure in place to take advantage of it.
Maybe expand the command line parameters to allow it to be enabled on
a per-PHB basis rather than globally.

Oliver
