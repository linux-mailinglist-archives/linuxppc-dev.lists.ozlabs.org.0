Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 130EA86BFA0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 04:51:40 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LNlBKsQ1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tlcj54wRrz3vcp
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Feb 2024 14:51:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LNlBKsQ1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TlchD18knz3vXt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Feb 2024 14:50:52 +1100 (AEDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1d944e8f367so3820185ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 19:50:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709178649; x=1709783449; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zeWVQkyXgOzOQIs/dHWRu2DNvYw94klE30/Fe7skDjk=;
        b=LNlBKsQ1x0of5CkU3Y1q47JOuwDZ2ANhIczC1VuVflx0x/9a/9TSjfInVGABt2tOGp
         l9vFYqSEwmtOCsttYPckbwXDbzJzIsB5d0UnGIj846QTKBTgNFmusmveR6nxehF9mra3
         AqLWpEhOh0qt32/RzxV3AwHOHGiF/GcGwq2yeZd6QndT3EqSuAhnmWiNY/otLCYwkH0B
         7L0cKNq3FCzbgm1fIO1yil7TDe6NfewFKhVG5tF3ajlIk7dPmZtp+t2XNFytZMLW5u++
         ettlrphrENcmBuJVZDrFW0Ta3FZ1cRBZI4gF1CYzOWM0uAG2AcnRCGjo46RPCV5KQWhE
         KvNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709178649; x=1709783449;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zeWVQkyXgOzOQIs/dHWRu2DNvYw94klE30/Fe7skDjk=;
        b=GCIwYwEj0bvS2u9h37MbXZCmgSC/YCr7eCn/Rhyy9OM5gLy2G6HUfDDa/kkYPLn0Bl
         KKrUKwt0NbfXoCsdmLaI7jedc30/48hFBWkwnWxg+nqxO36aNrBpPmNffs7PkYpKsA43
         aI2Yi7y0YBJw0KGH9apHxoxjJLKGBLpQvD+4Zg0R81oM6jLID2cuwP9+0Gm26y48vJaE
         ZX07F+5MNfayKz02NIYXr7ZNZLrJHn4ugDf6T3t+kqsyRUI9x7DY9xRIHKp4b4pVQKgx
         rhFW7Gp/e5J08rV4aWFbOT/dV0i3YVpYW/5J1WjDYsY5ulOHFtavlk+fjtZ85obfUBM3
         YZgA==
X-Forwarded-Encrypted: i=1; AJvYcCV7GGAyWylsbts5SQD5XljNsZ4vPVT+3kMjJtMaQWNnoE8EyubP2JZNZsBkOWWvahX8F2bQMil/VjBjcduxtkuolzvqFANeJ/TCllHBAQ==
X-Gm-Message-State: AOJu0YynRjGx77DlDxtKxwEyv9xrTQxxV2B6SHpt5RK20RsmcDzrl11O
	3PJPif1nWKRW+F02hoWS/oOK7gEqH8jTn01Muh9TCWXTAHrHmPRC
X-Google-Smtp-Source: AGHT+IFlcd/QXUtF+np1jPBNMucUwhgDNhaD3xRM0rkywhWDhdQXiyxsLumNg+rkxL4B19+Fi+mbdQ==
X-Received: by 2002:a17:902:9a8c:b0:1dc:ceb0:b00c with SMTP id w12-20020a1709029a8c00b001dcceb0b00cmr1125939plp.35.1709178649417;
        Wed, 28 Feb 2024 19:50:49 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id h6-20020a170902680600b001dcd00165a7sm247911plk.38.2024.02.28.19.50.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 19:50:49 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Feb 2024 13:50:43 +1000
Message-Id: <CZH99HE5N56V.2WDSGQQAERND4@wheely>
Subject: Re: [kvm-unit-tests PATCH 04/32] powerpc: interrupt stack
 backtracing
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Jones" <andrew.jones@linux.dev>
X-Mailer: aerc 0.15.2
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-5-npiggin@gmail.com>
 <20240228-9b32ddf7f58dc8f75b24e33c@orel>
In-Reply-To: <20240228-9b32ddf7f58dc8f75b24e33c@orel>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Feb 28, 2024 at 9:46 PM AEST, Andrew Jones wrote:
> On Mon, Feb 26, 2024 at 08:11:50PM +1000, Nicholas Piggin wrote:
> > Add support for backtracing across interrupt stacks, and
> > add interrupt frame backtrace for unhandled interrupts.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  lib/powerpc/processor.c |  4 ++-
> >  lib/ppc64/asm/stack.h   |  3 +++
> >  lib/ppc64/stack.c       | 55 +++++++++++++++++++++++++++++++++++++++++
> >  powerpc/Makefile.ppc64  |  1 +
> >  powerpc/cstart64.S      |  7 ++++--
> >  5 files changed, 67 insertions(+), 3 deletions(-)
> >  create mode 100644 lib/ppc64/stack.c
> >=20
> > diff --git a/lib/powerpc/processor.c b/lib/powerpc/processor.c
> > index ad0d95666..114584024 100644
> > --- a/lib/powerpc/processor.c
> > +++ b/lib/powerpc/processor.c
> > @@ -51,7 +51,9 @@ void do_handle_exception(struct pt_regs *regs)
> >  		return;
> >  	}
> > =20
> > -	printf("unhandled cpu exception %#lx at NIA:0x%016lx MSR:0x%016lx\n",=
 regs->trap, regs->nip, regs->msr);
> > +	printf("Unhandled cpu exception %#lx at NIA:0x%016lx MSR:0x%016lx\n",
> > +			regs->trap, regs->nip, regs->msr);
> > +	dump_frame_stack((void *)regs->nip, (void *)regs->gpr[1]);
> >  	abort();
> >  }
> > =20
> > diff --git a/lib/ppc64/asm/stack.h b/lib/ppc64/asm/stack.h
> > index 9734bbb8f..94fd1021c 100644
> > --- a/lib/ppc64/asm/stack.h
> > +++ b/lib/ppc64/asm/stack.h
> > @@ -5,4 +5,7 @@
> >  #error Do not directly include <asm/stack.h>. Just use <stack.h>.
> >  #endif
> > =20
> > +#define HAVE_ARCH_BACKTRACE
> > +#define HAVE_ARCH_BACKTRACE_FRAME
> > +
> >  #endif
> > diff --git a/lib/ppc64/stack.c b/lib/ppc64/stack.c
> > new file mode 100644
> > index 000000000..fcb7fa860
> > --- /dev/null
> > +++ b/lib/ppc64/stack.c
> > @@ -0,0 +1,55 @@
> > +#include <libcflat.h>
> > +#include <asm/ptrace.h>
> > +#include <stack.h>
> > +
> > +extern char exception_stack_marker[];
> > +
> > +int backtrace_frame(const void *frame, const void **return_addrs, int =
max_depth)
> > +{
> > +	static int walking;
> > +	int depth =3D 0;
> > +	const unsigned long *bp =3D (unsigned long *)frame;
> > +	void *return_addr;
> > +
> > +	asm volatile("" ::: "lr"); /* Force it to save LR */
> > +
> > +	if (walking) {
> > +		printf("RECURSIVE STACK WALK!!!\n");
> > +		return 0;
> > +	}
> > +	walking =3D 1;
> > +
> > +	bp =3D (unsigned long *)bp[0];
> > +	return_addr =3D (void *)bp[2];
> > +
> > +	for (depth =3D 0; bp && depth < max_depth; depth++) {
> > +		return_addrs[depth] =3D return_addr;
> > +		if (return_addrs[depth] =3D=3D 0)
> > +			break;
> > +		if (return_addrs[depth] =3D=3D exception_stack_marker) {
> > +			struct pt_regs *regs;
> > +
> > +			regs =3D (void *)bp + STACK_FRAME_OVERHEAD;
> > +			bp =3D (unsigned long *)bp[0];
> > +			/* Represent interrupt frame with vector number */
> > +			return_addr =3D (void *)regs->trap;
> > +			if (depth + 1 < max_depth) {
> > +				depth++;
> > +				return_addrs[depth] =3D return_addr;
> > +				return_addr =3D (void *)regs->nip;
> > +			}
> > +		} else {
> > +			bp =3D (unsigned long *)bp[0];
> > +			return_addr =3D (void *)bp[2];
> > +		}
> > +	}
> > +
> > +	walking =3D 0;
> > +	return depth;
> > +}
> > +
> > +int backtrace(const void **return_addrs, int max_depth)
> > +{
> > +	return backtrace_frame(__builtin_frame_address(0), return_addrs,
> > +			       max_depth);
> > +}
>
> I'm about to post a series which has a couple treewide tracing changes
> in them. Depending on which series goes first the other will need to
> accommodate.

Yeah that's fine.

Thanks,
Nick
