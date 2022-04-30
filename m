Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8456C515BAA
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 11:05:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kr3N12Qjrz3bgC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Apr 2022 19:05:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=landley-net.20210112.gappssmtp.com header.i=@landley-net.20210112.gappssmtp.com header.a=rsa-sha256 header.s=20210112 header.b=aKmbtB/b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=landley.net
 (client-ip=2607:f8b0:4864:20::233; helo=mail-oi1-x233.google.com;
 envelope-from=rob@landley.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=landley-net.20210112.gappssmtp.com
 header.i=@landley-net.20210112.gappssmtp.com header.a=rsa-sha256
 header.s=20210112 header.b=aKmbtB/b; dkim-atps=neutral
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kr3MG5pqQz2y8R
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 19:04:24 +1000 (AEST)
Received: by mail-oi1-x233.google.com with SMTP id l203so10886940oif.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Apr 2022 02:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Uc+1sYtF8CXIRvCHG1B9IVWbrrZUdnCicgDQEyuz/Uo=;
 b=aKmbtB/bDOfGpCMxgrmIhL9X+78qOYrjTTK6UlgYxvK2j9haxvrp/u761PCzlaSy64
 fKbcpIjT/HxT9+vFYw4HOM0g9p9Pa+KssasdQkuEE25OEu7PnEgN8KzMIGxKwmjG2cWy
 JTHGUsGIInlt8QSbiwA7lNa9zZn6ZdJxzcTHgfok+duw9h2bPq3c/rw4Lle45g2H37M0
 DTqr6XWx9y51DzCMaIKe2S/h9rz1DYa0Y2t+OnAH2FKhibkhBdx+fPE+fvH03gdAcg+g
 sZGAExhEOxCii8SvM221qYFY7mRbpg0b4bm9k6fbfQsShtvMF/5uCiYu0QyvePfsqSP+
 CRyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Uc+1sYtF8CXIRvCHG1B9IVWbrrZUdnCicgDQEyuz/Uo=;
 b=YQwJ2EopYlzY4CjUF6GV3pFqgVsMqK4uqikK4Kyg3UOTZC+CLJeX1ymJ2R1iZKWDKo
 DVanXX0NYEjpmdgD7ndEKzBGVq/wXpXjyImJIg1wLdHDhWyYjA4dGwI2eR/fINcCJBvw
 hstPdw3Yr0JQdRex+KX2YoQ9U/zXspgosZ2yIDkuBREV8KEdcEpo23TEWibaRuU0Or8H
 zEXAmgv+9IuMEAi5r8pwUyWEesQRB17KLtrAHRoHZzpL9kn6OcsWrLPsGZMMrTa8pcy8
 MToZTY4sml9BCdFlXSe0mlAU7a6hLIRj4gULBiQ2+TmG50Zpx5lX9wRYcovCvIUiOA+y
 gp5g==
X-Gm-Message-State: AOAM533OShn5K97Jwd7+USDvptytw4ycwI37RaI4g/+HIKPPKVLtY+ro
 H5WWo6VTttA0r6rCxqNKNRvLIA==
X-Google-Smtp-Source: ABdhPJx+VbnYCQjuqbh1CFR5fdHKTR8zdvo2bs6rrDjUdzrHa20vk7zsfbpdP3+GdF0N36CbhtvXDw==
X-Received: by 2002:a05:6808:188d:b0:325:b575:2508 with SMTP id
 bi13-20020a056808188d00b00325b5752508mr1521419oib.129.1651309461015; 
 Sat, 30 Apr 2022 02:04:21 -0700 (PDT)
Received: from [192.168.86.188] ([136.62.4.88])
 by smtp.gmail.com with ESMTPSA id
 m63-20020aca5842000000b00325cda1ff9esm540038oib.29.2022.04.30.02.04.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 30 Apr 2022 02:04:20 -0700 (PDT)
Message-ID: <aedeaa1d-9431-646c-fa24-f37f48a9fe01@landley.net>
Date: Sat, 30 Apr 2022 04:08:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: serial hang in qemu-system-ppc64 -M pseries
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <74b9755a-4b5d-56b1-86f5-0c5c7688845a@landley.net>
 <8558c117-75a0-dc73-9b1a-be128e04056c@redhat.com>
 <ba41f9ab-bce4-b377-e99c-caa0d8240308@landley.net>
 <87bkwjtvkn.fsf@linux.ibm.com>
From: Rob Landley <rob@landley.net>
In-Reply-To: <87bkwjtvkn.fsf@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, qemu-ppc@nongnu.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/29/22 16:43, Fabiano Rosas wrote:
> Rob Landley <rob@landley.net> writes:
>> Then paste something longer than 16 characters at the eventual command prompt
>> once the kernel finishes booting.
> 
> I suspect this is due to how the tty driver (n_tty.c) interacts with
> the console (hvc_console.c) driver's buffer size.
> 
> This is the stack:
> 
> #0 hvc_push          <-- calls into KVM/QEMU to write up to 16 bytes
> #1 hvc_write
> #2 tty_put_char
> #3 do_output_char
> #4 __process_echoes          <-- writes up to tty_write_room() chars
> #5 flush_echoes              <-- returns early if ~ECHO && ~ECHONL
> #6 n_tty_receive_buf_common  <-- buffers more than 16 bytes
> #7 tty_ldisc_receive_buf
> #8 tty_port_default_receive_buf
> #9 receive_buf
> #10 process_one_work
> 
> In my busybox instance which does not have this issue I can see that
> termios.c_lflag = 0x447, so in the stack above #4 is not called (ECHO
> is 0x8, ECHONL is 0x10).
> 
> In the bug scenario: termios.c_lflag = 0x5cf, so we go into #4 which
> is supposed to write (say) 17 bytes, but ends up writing only 16
> because that is what tty_write_room() returns.

I think my init script left the terminal wherever the hardware defaults
initialized it to?

(I note that sh4 also has a variant of this problem, but instead of the
stutter-and-flush behavior it just hard discards everything after the first 16
characters of a paste. Large pastes seemsto work without issue on all the other
targets I've tried so far, I.E. x86, arm, mips, powerpc -M g3beige, s390x, and
m68k. And by "large" I mean I've fed half a megabyte of uuencode output into
uudecode as a single paste.)

> What I think is causing this issue is that the hvc_vio.c driver is
> configured with hp->outbuf_size = 16. That number comes from the
> H_PUT_TERM_CHAR hypercall spec which reads two registers at a
> time. However, the hvc_write function supports writes larger than 16
> bytes so it seems we're needlessly propagating the 16 byte limitation
> to the upper layer.

Looks like the call is:

  hp = hvc_alloc(termno, vdev->irq, ops, MAX_VIO_PUT_CHARS);

MAX_VIO_PUT_CHARS implies it's the maximum allowed write size. Understandable if
writes bigger than that didn't get a lot of testing. (There's an identical call
in hvc_opal.c, by the way.)

> The driver is also not buffering the write, so if it gets called to
> write one char at a time (like __process_echoes does) there should be no
> limit to how much it can write.
> 
> I think if we increase hp->outbuf_size to a value that is larger than
> N_TTY_BUF_SIZE=4096 the echo buffer would drain before reaching this new
> hvc driver limit.

How is this handled on any of the architectures where it works? (Or do their tty
flags just start at different defaults so I don't see it there?)

> I tested that and it seems to work, but I'm not sure if it's the right
> fix, there are some things I couldn't figure out:

Let me know if I can help, although this sounds like it's moved a bit beyond
areas I'm familiar with.

Thanks,

Rob
