Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 76393116E12
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 14:40:01 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Wkp64lwjzDqQt
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 00:39:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47WkjD0YdQzDq8B
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 00:35:42 +1100 (AEDT)
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1ieJCF-0008Qz-Iv; Mon, 09 Dec 2019 14:35:31 +0100
Date: Mon, 9 Dec 2019 14:35:31 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Frank Rowand <frowand.list@gmail.com>
Subject: Re: [RFC] Efficiency of the phandle_cache on ppc64/SLOF
Message-ID: <20191209133531.ykkknqmeeb36rv7l@linutronix.de>
References: <20191129151056.o5c44lm5lb4wsr4r@linutronix.de>
 <e1f232f5-3847-a519-5cce-95a26512e82b@gmail.com>
 <87tv6idp37.fsf@mpe.ellerman.id.au>
 <67e1da87-7f5a-3972-bc16-28bae2350c12@gmail.com>
 <CAL_JsqKieG5=teL7gABPKbJOQfvoS9s-ZPF-=R0yEE_LUoy-Kw@mail.gmail.com>
 <20191205163538.mzunfrpox7jbrssl@linutronix.de>
 <084ed924-eaed-5232-a9f6-fe60128fe11a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <084ed924-eaed-5232-a9f6-fe60128fe11a@gmail.com>
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2019-12-05 20:01:41 [-0600], Frank Rowand wrote:
> Is there a memory usage issue for the systems that led to this thread?

No, no memory issue led to this thread. I was just testing my patch and
I assumed that I did something wrong in the counting/lock drop/lock
acquire/allocate path because the array was hardly used. So I started to
look deeper=E2=80=A6
Once I figured out everything was fine, I was curious if everyone is
aware of the different phandle creation by dtc vs POWER. And I posted
the mail in the thread.
Once you confirmed that everything is "known / not an issue" I was ready
to take off [0].

Later more replies came in such as one mail [1] from Rob describing the
original reason with 814 phandles. _Here_ I was just surprised that 1024
were used over 64 entries for a benefit of 60ms. I understand that this
is low concern for you because that memory is released if modules are
not enabled. I usually see that module support is left enabled.

However, Rob suggested / asked about the fixed size array (this is how I
understood it):
|And yes, as mentioned earlier I don't like the complexity. I didn't
|from the start and I'm  I'm still of the opinion we should have a
|fixed or 1 time sized true cache (i.e. smaller than total # of
|phandles). That would solve the RT memory allocation and locking issue
|too.

so I attempted to ask if we should have the fixed size array maybe
with the hash_32() instead the mask. This would make my other patch
obsolete because the fixed size array should not have a RT issue. The
hash_32() part here would address the POWER issue where the cache is
currently not used efficiently.

If you want instead to keep things as-is then this is okay from my side.
If you want to keep this cache off on POWER then I could contribute a
patch doing so.

[0] https://lore.kernel.org/linux-devicetree/20191202110732.4dvzrro5o6zrlpa=
x@linutronix.de/
[1] https://lore.kernel.org/linux-devicetree/CAL_JsqKieG5=3DteL7gABPKbJOQfv=
oS9s-ZPF-=3DR0yEE_LUoy-Kw@mail.gmail.com/
> -Frank

Sebastian
