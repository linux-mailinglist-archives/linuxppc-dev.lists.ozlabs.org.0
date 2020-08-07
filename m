Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4B4F23F5BB
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 03:04:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BNkXM3vsfzDqv2
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Aug 2020 11:04:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BNhNn234NzDqkR
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Aug 2020 09:27:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=COUM3KPG; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BNhNX0MTvz9sRN;
 Sat,  8 Aug 2020 09:27:39 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1596842872;
 bh=sbxkF+VKFF/wO9VEM5oBYdUK08TAotAXJlTLlkjIyjY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=COUM3KPGhHElW8wRaPjf8ITC5/NSOFIkknz5YnX0JINvQmYOGRSI/uzGzq7ro5P2w
 T86B2S/FZXWhBO68L9PIdGWh2OloqUxd3MRtnNqHBrX+zBjxU/vIWNV/YanQfT5fPk
 myKzGDsh5ay5lglhAILiykyJ2fJMfmNsf9qsfS+8/+ZoPJeNvYl+ho3RSy6Be/7gWF
 RTPN6kaJ78qUG3CDx7gqchnOVI3QwZEY4FJ8oDCzZ0c/2jyWne5UbKUAS0AIzxHe8U
 X2CQ76Z+4RZjRWXfSDTbHxJa/ZPKwfxX/+akoFXVfrN7R570jC6Vw6a8VhS7eO8G5y
 yoQlb+HBwfHdw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Linus Torvalds <torvalds@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-5.9-1 tag
In-Reply-To: <CAHk-=wif9A9Y1i1xbie5Qsr7e-YoTpv9O_YSF8NCHWksDPEa2Q@mail.gmail.com>
References: <87h7tey4xq.fsf@mpe.ellerman.id.au>
 <CAHk-=wif9A9Y1i1xbie5Qsr7e-YoTpv9O_YSF8NCHWksDPEa2Q@mail.gmail.com>
Date: Sat, 08 Aug 2020 09:27:36 +1000
Message-ID: <87eeoixcif.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
 Waiman Long <longman@redhat.com>, "Naveen N.
 Rao" <naveen.n.rao@linux.vnet.ibm.com>, dyoung@redhat.com, vdronov@redhat.com,
 nathanl@linux.ibm.com, miltonm@us.ibm.com, palmerdabbelt@google.com,
 ajd@linux.ibm.com, Arnd Bergmann <arnd@arndb.de>, lirongqing@baidu.com,
 sandipan@linux.ibm.com, kjain@linux.ibm.com, muriloo@linux.ibm.com,
 Nick Piggin <npiggin@gmail.com>, Nathan Chancellor <natechancellor@gmail.com>,
 Joe Perches <joe@perches.com>, chris.packham@alliedtelesis.co.nz,
 Vaibhav Jain <vaibhav@linux.ibm.com>, felix@linux.ibm.com,
 hbathini@linux.ibm.com, Christophe Leroy <christophe.leroy@c-s.fr>,
 atrajeev@linux.vnet.ibm.com, wenxiong@linux.vnet.ibm.com,
 sbobroff@linux.ibm.com, Randy Dunlap <rdunlap@infradead.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, sourabhjain@linux.ibm.com,
 bharata@linux.ibm.com, Tejun Heo <tj@kernel.org>, miaoqinglang@huawei.com,
 Jeremy Kerr <jk@ozlabs.org>, grandmaster@al2klimov.de, fbarrat@linux.ibm.com,
 huntbag@linux.vnet.ibm.com, kaloz@openwrt.org,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Linus Torvalds <torvalds@linux-foundation.org> writes:
> On Fri, Aug 7, 2020 at 6:14 AM Michael Ellerman <mpe@ellerman.id.au> wrot=
e:
>>
>> Just one minor conflict, in a comment in drivers/misc/ocxl/config.c.
>
> Well, this morning I merged the ptrace ->regset_get() updates from Al,
> and that brought in a different conflict.

Ah fooey.

> I _think_ I resolved it correctly, but while the new model is fairly
> readable, the old one sure wasn't, and who knows how messed up my
> attempt to sort it out was. I don't know the pkey details on powerpc..

The old API was horrible, nice to see it gone.

> So I'd appreciate it if both Al and Aneesh Kumar would check that what
> I did to pkey_get() in arch/powerpc/kernel/ptrace/ptrace-view.c makes
> sense and works..

It looks right to me, except it doesn't build due to ret now being unused:

  /linux/arch/powerpc/kernel/ptrace/ptrace-view.c: In function =E2=80=98pke=
y_get=E2=80=99:
  /linux/arch/powerpc/kernel/ptrace/ptrace-view.c:473:6: error: unused vari=
able =E2=80=98ret=E2=80=99 [-Werror=3Dunused-variable]
    473 |  int ret;


Patch below, do you mind taking it directly?

With that fixed our pkey selftests pass and show the expected values in
those regs.

> Side note - it might have been cleaner to just make it do
>
>         membuf_store(&to, target->thread.amr);
>         membuf_store(&to, target->thread.iamr);
>         return membuf_store(&to, default_uamor);
>
> instead of doing that membuf_write() for the first two ones and then
> the membuf_store() for the uamor field, but I did what I did to keep
> the logic as close to what it used to be as possible.

Yep fair enough.

> If I messed up, I apologize.
>
> And if you agree that making it three membuf_store() instead of that
> odd "depend on the exact order of the thread struct and pick two
> consecutive values", I'll leave that to you as a separate cleanup.

Will do.

cheers


From a280ae69f248a0f87b36170a94c5665ef5353f51 Mon Sep 17 00:00:00 2001
From: Michael Ellerman <mpe@ellerman.id.au>
Date: Sat, 8 Aug 2020 09:12:03 +1000
Subject: [PATCH] powerpc/ptrace: Fix build error in pkey_get()
MIME-Version: 1.0
Content-Type: text/plain; charset=3DUTF-8
Content-Transfer-Encoding: 8bit

The merge resolution in commit 25d8d4eecace left ret no longer used,
leading to:

  /linux/arch/powerpc/kernel/ptrace/ptrace-view.c: In function =E2=80=98pke=
y_get=E2=80=99:
  /linux/arch/powerpc/kernel/ptrace/ptrace-view.c:473:6: error: unused vari=
able =E2=80=98ret=E2=80=99
    473 |  int ret;

Fix it by removing ret.

Fixes: 25d8d4eecace ("Merge tag 'powerpc-5.9-1' of git://git.kernel.org/pub=
/scm/linux/kernel/git/powerpc/linux")
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/kernel/ptrace/ptrace-view.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel=
/ptrace/ptrace-view.c
index 19823a250aa0..7e6478e7ed07 100644
--- a/arch/powerpc/kernel/ptrace/ptrace-view.c
+++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
@@ -470,8 +470,6 @@ static int pkey_active(struct task_struct *target, cons=
t struct user_regset *reg
 static int pkey_get(struct task_struct *target, const struct user_regset *=
regset,
 		    struct membuf to)
 {
-	int ret;
-
 	BUILD_BUG_ON(TSO(amr) + sizeof(unsigned long) !=3D TSO(iamr));
=20
 	if (!arch_pkeys_enabled())
--=20
2.25.1

