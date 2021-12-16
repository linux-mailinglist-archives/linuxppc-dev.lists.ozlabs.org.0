Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8BC47804B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 00:05:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JFSQF48VLz3cN3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Dec 2021 10:05:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=paul-moore-com.20210112.gappssmtp.com header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=Z63xJiB3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=paul-moore.com
 (client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=paul@paul-moore.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=paul-moore-com.20210112.gappssmtp.com
 header.i=@paul-moore-com.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=Z63xJiB3; dkim-atps=neutral
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JFSPX5YGxz2yNY
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Dec 2021 10:05:03 +1100 (AEDT)
Received: by mail-ed1-x52e.google.com with SMTP id t5so1305862edd.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 15:05:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paul-moore-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=GJ64TcgksQc3C6D3xtvHzgt3iSOg6McffYMs3O8prrE=;
 b=Z63xJiB3Ei8LRcpyHm+qEbadN02vR/u6ZMgg4wLoJE0RBSk+pzm39iXdJq7Pkoaym3
 MMbyLdHN9fgCKEgRW4gBwD50fE8DWWE5hHjRyN0UQFAaVIVWqcxkIU5nQIJ9R0LC/A3/
 8DMJt3Z7EQE/YKXLzc4ymVMUg1kH6LZ7B4bfgPC0zRoszkE1AdnT06n7mcKaFMsVpf7m
 wOkbgLJOmEd3n4TDlCDbofS10/+OnLap04+VhPnPjJlTRGFXqUIzrGNVVnayQAcTLbqy
 0tIGF7c19QMMGwLX8zMSbau5pEABlonMGEkPVmBSNiw9spvZiECzEoTvVPc/vToSHvw0
 lTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=GJ64TcgksQc3C6D3xtvHzgt3iSOg6McffYMs3O8prrE=;
 b=TWPA/fahrgltM+IKPS8pEAattzUTOy98XjXLY8iBs2wuxpfHgqkRjWKHk0N7kJhCkY
 ck65U4ODhFez5GAvGNK8iQ7Z8Ign15IXrwtUpxp3TqP75WKsHxoL0zWrTufFp2wo8Xyy
 j5W7kPqnww33SIgEFY49/0R8TIwALjcU1CVuKHJLu7i9GkyB9ZIQ/Y1YkP2VhbT+oCv7
 tligxWz3vWD0LZAzVfiKl5TRlXaRgrHLGCWNsg+8Tc5DPYytf5m97wnVkwPjP5HQgLe8
 6PxXzndrnHtWZ6Ap0O7GpY5LzuSrT5NZt3c6ZmElmlUCdaE0/MTnVYTmYNMYsORAC3om
 KsbQ==
X-Gm-Message-State: AOAM5321apQHeeidlPGRmI+NEWlAi8U0le+w1WNM3I0hsZFrxYbdLtHC
 7C9MsPHei1Z9+r6rXFLEKd1Tz2cpLS0VifyuqvcI
X-Google-Smtp-Source: ABdhPJx3SFGGswhmmu2r1dzkr+eLURRkoUYw4sDxRVomPchgoioBKl7e14g/fwAEf2396aEHS44SLD69T09wvRp1j0Y=
X-Received: by 2002:a17:907:e8e:: with SMTP id
 ho14mr268357ejc.12.1639695898735; 
 Thu, 16 Dec 2021 15:04:58 -0800 (PST)
MIME-Version: 1.0
References: <20211026133147.35d19e00@canb.auug.org.au>
 <87k0i0awdl.fsf@mpe.ellerman.id.au>
 <CAHC9VhTj7gn3iAOYctVRKvv_Bk1iQMrmkA8FVJtYzdvBjqFmvg@mail.gmail.com>
 <87tuh2aepp.fsf@mpe.ellerman.id.au>
 <2012df5e-62ec-06fb-9f4d-e27dde184a3f@csgroup.eu>
 <CAHC9VhRHs8Lx8+v+LHmJByxO_m330sfLWRsGDsFtQxyQ1860eg@mail.gmail.com>
 <dc5705cf-d47a-57b0-65da-2a2af8d71b19@csgroup.eu>
 <CAHC9VhQPizVLkr2+sqRCS0gS4+ZSw-AMkJM5V64-ku8AQe+QQg@mail.gmail.com>
 <1a78709f-162e-0d78-0550-4e9ef213f9c6@csgroup.eu>
 <102e59ba-fcf0-dd85-9338-75b7ce5fbd83@kaod.org>
 <5f83d1fe-4e6e-1d08-b0c2-aec8ee852065@csgroup.eu>
In-Reply-To: <5f83d1fe-4e6e-1d08-b0c2-aec8ee852065@csgroup.eu>
From: Paul Moore <paul@paul-moore.com>
Date: Thu, 16 Dec 2021 18:04:47 -0500
Message-ID: <CAHC9VhTcV6jn4z7uGXZb=RZ5k7W4KW1vnoAUMHN6Zhkxsw1Xpg@mail.gmail.com>
Subject: Re: linux-next: manual merge of the audit tree with the powerpc tree
To: Christophe Leroy <christophe.leroy@csgroup.eu>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Richard Guy Briggs <rgb@redhat.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Dec 16, 2021 at 4:08 AM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
> Thanks C=C3=A9dric, I've now been able to install debian PPC32 port of DE=
BIAN
> 11 on QEMU and run the tests.
>
> I followed instructions in file README.md provided in the test suite.
> I also modified tests/Makefile to force MODE :=3D 32
>
> I've got a lot of failures, am I missing some options in the kernel or
> something ?
>
> Running as   user    root
>          with context root:::
>          on   system

While SELinux is not required for audit, I don't think I've ever run
it on system without SELinux.  In theory the audit-testsuite shouldn't
rely on SELinux being present (other than the SELinux specific tests
of course), but I'm not confident enough to say that the test suite
will run without problem without SELinux.

If it isn't too difficult, I would suggest enabling SELinux in your
kernel build and ensuring the necessary userspace, policy, etc. is
installed.  You don't need to worry about getting it all running
correctly; the audit-testsuite should pass with SELinux in permissive
mode.

If you're still seeing all these failures after trying that let us know.

> # Test 3 got: "256" (backlog_wait_time_actual_reset/test at line 151)
> #   Expected: "0"
> #  backlog_wait_time_actual_reset/test line 151 is: ok( $result, 0 );
>   # Was an event found?

...

--=20
paul moore
www.paul-moore.com
