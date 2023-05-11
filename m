Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AC66FEEE3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 11:32:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QH69W012Bz3fXk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 19:31:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=BDA3XAW6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=nphamcs@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=BDA3XAW6;
	dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QH68b1LX0z3cCW
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 19:31:09 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-75785057afeso423316385a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 May 2023 02:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683797466; x=1686389466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=44LgLHJDIULJkMBem069KICIq3uxO214CaUgM8dXQT8=;
        b=BDA3XAW6HVHBBCTylbjq0CrSvwep3z/RKHIin6eHkOxIgxSvF9oCpp4JdMxjhKCg8a
         t6De61RAZB8nwhqVhhnd+GwGOl5A9f6x8ta1mhnXQNHIA8XVVWTsZ3z2sLNVKJGzzpnv
         pVJ84YIgNXNe3zzg0Bt2DTwq5JDGQGStI/fGod4pqnCGfyQ7QKofa8hYUqI7j01kYIh5
         pdBpovGUxFwqp+4kZG7VlWddqhNwbB9KXu5x5m7XiaxjuDvLIgeFm1gLHxbutaTsEe0t
         4R0BYZnEDMzRXc8veBcbo5PxiVrNC+0sZriJIWCU7Z1JN7IWfsEaHn66MIjE5tmEuP4w
         GExw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683797466; x=1686389466;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=44LgLHJDIULJkMBem069KICIq3uxO214CaUgM8dXQT8=;
        b=GQvz0vQ+6TQ5hC5lXFA8fhkVn8gzTG1EQCG6Uo89uR3U01EtORCZUHcAN3qNCeJQWF
         862dslxCJClxHoCTlxeeQrtdWAJgFU6YnmVw1P3e4T/JrJuZaKASYe/1ZOAB4DPPl4/a
         lpNrn6LRyv6rwHpu9Pk9MuLn9GHhRbP44TKWLbOqWL1HwIOcLthptek8omH1QXoaRqE9
         Jp6Pbxt9kfo5sylsZIJf6glisUoBGyMw0H5LZcyjiK1uaJ4HnMXxbrLOZt7ukvT+20sP
         zphLEt2xFBwrDN914ZB0oUsDAMMn7dSmRClvB3uYerVsBbkj6SUhUCgMSByagX0KPpOu
         Qc1Q==
X-Gm-Message-State: AC+VfDykwn8nDa7xG5+tOAz1hQZP0nMiqhiuRvoqbMXIdavGYqiqMeA6
	fzm5qaNOK1gfwTj5NK6d+nJJq0fwUcVNauhEuEM=
X-Google-Smtp-Source: ACHHUZ4gCIyUNhd/+bbAhcP9wNcKpLhKmfok0Ws6ilq/cfwGVAdfDhZw6m7PSHSI2kufFJi8oJq2AHQm2PPca7W1ngo=
X-Received: by 2002:ad4:5961:0:b0:621:4551:c6dc with SMTP id
 eq1-20020ad45961000000b006214551c6dcmr7378789qvb.39.1683797465598; Thu, 11
 May 2023 02:31:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230510195806.2902878-1-nphamcs@gmail.com> <0d8e2503-5d4f-4b60-84ff-01a23bcf557f@app.fastmail.com>
In-Reply-To: <0d8e2503-5d4f-4b60-84ff-01a23bcf557f@app.fastmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Thu, 11 May 2023 02:30:54 -0700
Message-ID: <CAKEwX=OFVkc2GL3jmoC-qAuwZvzxfs7v__aWY=8bLY3MeMq9hA@mail.gmail.com>
Subject: Re: [PATCH] cachestat: wire up cachestat for other architectures
To: Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Matt Turner <mattst88@gmail.com>, borntraeger@linux.ibm.com, linux-alpha@vger.kernel.org, gor@linux.ibm.com, Heiko Carstens <hca@linux.ibm.com>, kernel-team@meta.com, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.infradead.org, chris@zankel.net, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer
  <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, linux-api@vger.kernel.org, linux-kernel@vger.kernel.org, Sven Schnelle <svens@linux.ibm.com>, Johannes Weiner <hannes@cmpxchg.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 11, 2023 at 12:05=E2=80=AFAM Arnd Bergmann <arnd@arndb.de> wrot=
e:
>
> On Wed, May 10, 2023, at 21:58, Nhat Pham wrote:
> > cachestat is previously only wired in for x86 (and architectures using
> > the generic unistd.h table):
> >
> > https://lore.kernel.org/lkml/20230503013608.2431726-1-nphamcs@gmail.com=
/
> >
> > This patch wires cachestat in for all the other architectures.
> >
> > Signed-off-by: Nhat Pham <nphamcs@gmail.com>
>
> The changes you did here look good, but you missed one
> file that has never been converted to the syscall.tbl format:
> arch/arm64/include/asm/unistd32.h along with the __NR_compat_syscalls
> definition in arch/arm64/include/asm/unistd.h, please add those
> as well, and then
>
> Reviewed-by: Arnd Bergmann <arnd@arndb.de>

Just sent a follow-up fixlet for this:

https://lore.kernel.org/linux-mm/20230511092843.3896327-1-nphamcs@gmail.com=
/T/#u

Thanks for the suggestion!
