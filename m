Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B349023F5B0
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 02:56:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNkMG6DGlzDqYh
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 10:56:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::243;
 helo=mail-lj1-x243.google.com; envelope-from=torvalds@linuxfoundation.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org
 header.a=rsa-sha256 header.s=google header.b=Px5eUgng; 
 dkim-atps=neutral
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com
 [IPv6:2a00:1450:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNXq56VqXzDqjh
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 03:46:41 +1000 (AEST)
Received: by mail-lj1-x243.google.com with SMTP id v9so3073244ljk.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Aug 2020 10:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ISeZX+jH/ohq0nP1GZmaFw4IOOa4bJcc6+eX97ifabc=;
 b=Px5eUgng4iJHCoqB/ur25kv5nuKVYdjFZLHwpX5V0XLN9ZaIyhCcZvEXxC96rfU4co
 SKCsuFWKSTdYy9elmaLHMmYgUXIpyS8Blh9LPN51runcTrPMl53xXmf1wZsg9WVvbaXt
 x2cBK1dRVsf3Fi5oq25T+4aFVr0+UpOmHUBKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ISeZX+jH/ohq0nP1GZmaFw4IOOa4bJcc6+eX97ifabc=;
 b=nHSEcaLrZFedfsM9rQA8L/RNT+754HVTJJ9PqDYWfAfg7xy1kd3X61AJp3NCT0H0qg
 HOP5AbNFjumuQ+WG/RowpYw5DyRstl+SSRPHp5BVyWQvEW/BfzJUUq7BrlL95EKULqtU
 kIr8ujQDImI3JjMsCHq+m/rxgPneBl7g7Dy1qNcb51YtPPhUj6pOs+gRSAt2C8YVwGxa
 v2oLNmytsQjv20nlG8CvnKLT4EqyLqFSXMxHKu8Fio6OHOHy2IFue0Dvn0PpKWnfNg8C
 vDAxTJxIHF9sX1is3N+jIAPz55c5lM6UbmyfnNDYqdJ+czIOqjL51lMUjLKLRHsvDprn
 XRHQ==
X-Gm-Message-State: AOAM532e7Ea9eMelfe79zJAfNfYwwgWchOHC7TtvvPUF0j/0JtcpAtvp
 DsBQbOs2odyhVuImJWSuoKCyskuGUEC2JA==
X-Google-Smtp-Source: ABdhPJyI1ZT9sRHv9VZWNa2rKX65wc24ppK3pHM+XY7/qySLdYNCWwZMaGZJvtFOHCQ3kCYtomnuNg==
X-Received: by 2002:a2e:b4e5:: with SMTP id s5mr6442324ljm.153.1596822396163; 
 Fri, 07 Aug 2020 10:46:36 -0700 (PDT)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com.
 [209.85.167.41])
 by smtp.gmail.com with ESMTPSA id l26sm4481178lfj.22.2020.08.07.10.46.31
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Aug 2020 10:46:35 -0700 (PDT)
Received: by mail-lf1-f41.google.com with SMTP id b30so1403125lfj.12
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Aug 2020 10:46:31 -0700 (PDT)
X-Received: by 2002:a05:651c:503:: with SMTP id
 o3mr4669045ljp.312.1596822389653; 
 Fri, 07 Aug 2020 10:46:29 -0700 (PDT)
MIME-Version: 1.0
References: <87h7tey4xq.fsf@mpe.ellerman.id.au>
In-Reply-To: <87h7tey4xq.fsf@mpe.ellerman.id.au>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 7 Aug 2020 10:46:13 -0700
X-Gmail-Original-Message-ID: <CAHk-=wif9A9Y1i1xbie5Qsr7e-YoTpv9O_YSF8NCHWksDPEa2Q@mail.gmail.com>
Message-ID: <CAHk-=wif9A9Y1i1xbie5Qsr7e-YoTpv9O_YSF8NCHWksDPEa2Q@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.9-1 tag
To: Michael Ellerman <mpe@ellerman.id.au>, Al Viro <viro@zeniv.linux.org.uk>, 
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sat, 08 Aug 2020 10:06:32 +1000
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 desnesn@linux.ibm.com, Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 ego@linux.vnet.ibm.com, aik@ozlabs.ru, jniethe5@gmail.com,
 bin.meng@windriver.com, psampat@linux.ibm.com, bala24@linux.ibm.com,
 msuchanek@suse.de, sathnaga@linux.vnet.ibm.com,
 Oliver O'Halloran <oohall@gmail.com>, fthain@telegraphics.com.au,
 Christoph Hellwig <hch@lst.de>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, equinox@diac24.net,
 leobras.c@gmail.com, santosh@fossix.org, maddy@linux.ibm.com,
 Nayna Jain <nayna@linux.ibm.com>, YueHaibing <yuehaibing@huawei.com>,
 mahesh@linux.ibm.com, Peter Zijlstra <peterz@infradead.org>,
 anju@linux.vnet.ibm.com, Geert Uytterhoeven <geert@linux-m68k.org>,
 weiyongjun1@huawei.com, alastair@d-silva.org, harish@linux.ibm.com,
 Waiman Long <longman@redhat.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, dyoung@redhat.com,
 vdronov@redhat.com, nathanl@linux.ibm.com, miltonm@us.ibm.com,
 palmerdabbelt@google.com, ajd@linux.ibm.com, Arnd Bergmann <arnd@arndb.de>,
 lirongqing@baidu.com, sandipan@linux.ibm.com, kjain@linux.ibm.com,
 muriloo@linux.ibm.com, Nick Piggin <npiggin@gmail.com>,
 Nathan Chancellor <natechancellor@gmail.com>, Joe Perches <joe@perches.com>,
 chris.packham@alliedtelesis.co.nz, Vaibhav Jain <vaibhav@linux.ibm.com>,
 felix@linux.ibm.com, hbathini@linux.ibm.com,
 Christophe Leroy <christophe.leroy@c-s.fr>, atrajeev@linux.vnet.ibm.com,
 wenxiong@linux.vnet.ibm.com, sbobroff@linux.ibm.com,
 Randy Dunlap <rdunlap@infradead.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, sourabhjain@linux.ibm.com,
 bharata@linux.ibm.com, Tejun Heo <tj@kernel.org>, miaoqinglang@huawei.com,
 Jeremy Kerr <jk@ozlabs.org>, grandmaster@al2klimov.de, fbarrat@linux.ibm.com,
 huntbag@linux.vnet.ibm.com, kaloz@openwrt.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 7, 2020 at 6:14 AM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Just one minor conflict, in a comment in drivers/misc/ocxl/config.c.

Well, this morning I merged the ptrace ->regset_get() updates from Al,
and that brought in a different conflict.

I _think_ I resolved it correctly, but while the new model is fairly
readable, the old one sure wasn't, and who knows how messed up my
attempt to sort it out was. I don't know the pkey details on powerpc..

So I'd appreciate it if both Al and Aneesh Kumar would check that what
I did to pkey_get() in arch/powerpc/kernel/ptrace/ptrace-view.c makes
sense and works..

Side note - it might have been cleaner to just make it do

        membuf_store(&to, target->thread.amr);
        membuf_store(&to, target->thread.iamr);
        return membuf_store(&to, default_uamor);

instead of doing that membuf_write() for the first two ones and then
the membuf_store() for the uamor field, but I did what I did to keep
the logic as close to what it used to be as possible.

If I messed up, I apologize.

And if you agree that making it three membuf_store() instead of that
odd "depend on the exact order of the thread struct and pick two
consecutive values", I'll leave that to you as a separate cleanup.

                   Linus
