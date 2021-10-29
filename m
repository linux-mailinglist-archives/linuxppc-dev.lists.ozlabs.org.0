Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED87E4405B4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 01:14:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hgytr6Sgjz3cHP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Oct 2021 10:14:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.219.47; helo=mail-qv1-f47.google.com;
 envelope-from=pku.leo@gmail.com; receiver=<UNKNOWN>)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HgytL2mvBz2ynS
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Oct 2021 10:14:16 +1100 (AEDT)
Received: by mail-qv1-f47.google.com with SMTP id b11so3980280qvm.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 16:14:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=BDRvnZUE4sqi81I5tqAPBqMdjUr4Q5ab25TOPbUu00E=;
 b=KgHuOp9CZSPZjAySf8Id55ysspajfzPHhNxxbBwiIEz1RlxsgSbJBFFW9jtsqiHwoV
 jMAgp6JMFcuGCzFuZiY6DJagCSPWLpnGVPUiow8Uhhgv09Xt3q6zvRWCKxKZv3RXsxQ0
 6b56OqfxVup/ismI4g5di52H7WrgzrsO1ZoVbvazzog2zOBQcIwIfVybPD8l72EgF6lk
 U+QWWFNCoYd8vuKIVbzq4IgycmgqPlacv1p+CnuXjUSbqYsXkD02ZaDnvjjc/u0JvTr0
 +1smr4Id8VP7bi/Ll81hZf1YZs35cyaCHgvU29TK4tlOkD0uSQQIfwFQ6yiAeFI4mEXx
 GGCg==
X-Gm-Message-State: AOAM532y5ERA9pvQhtLH+GHronkBtA69aYJjLbErsQ0SeJVs/hNe2YYv
 pacvgGPmm+5UHRcbmxwUaWqE50hBf+I=
X-Google-Smtp-Source: ABdhPJxGOQTZnMcWCeU5elfg5NE7WQTIS9vVZknsCSgE+J7JGyPU9Mer3e7FFb9dgRYrP2dO68CJzg==
X-Received: by 2002:a0c:d60d:: with SMTP id c13mr13772296qvj.26.1635549253377; 
 Fri, 29 Oct 2021 16:14:13 -0700 (PDT)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com.
 [209.85.160.181])
 by smtp.gmail.com with ESMTPSA id w185sm4916460qkd.30.2021.10.29.16.14.12
 for <linuxppc-dev@lists.ozlabs.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Oct 2021 16:14:13 -0700 (PDT)
Received: by mail-qt1-f181.google.com with SMTP id 19so9036597qtt.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Oct 2021 16:14:12 -0700 (PDT)
X-Received: by 2002:ac8:5706:: with SMTP id 6mr15076793qtw.95.1635549252466;
 Fri, 29 Oct 2021 16:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <MWHPR2201MB152074F47BF142189365627B91879@MWHPR2201MB1520.namprd22.prod.outlook.com>
 <MWHPR2201MB1520D45396628364E91A1FA691879@MWHPR2201MB1520.namprd22.prod.outlook.com>
In-Reply-To: <MWHPR2201MB1520D45396628364E91A1FA691879@MWHPR2201MB1520.namprd22.prod.outlook.com>
From: Li Yang <leoyang.li@nxp.com>
Date: Fri, 29 Oct 2021 18:14:01 -0500
X-Gmail-Original-Message-ID: <CADRPPNSrhiwr8jmBb2h4cFYqHtuDKK8rL0i6Bkg7+xEyXJPATA@mail.gmail.com>
Message-ID: <CADRPPNSrhiwr8jmBb2h4cFYqHtuDKK8rL0i6Bkg7+xEyXJPATA@mail.gmail.com>
Subject: Re: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to
 unrecoverable loop.
To: Eugene Bordenkircher <Eugene_Bordenkircher@selinc.com>
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
Cc: "balbi@kernel.org" <balbi@kernel.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 29, 2021 at 4:27 PM Eugene Bordenkircher
<Eugene_Bordenkircher@selinc.com> wrote:
>
> Typing Greg's email correct this time.  My apologies.
>
> Eugene
>
> -----Original Message-----
> From: Eugene Bordenkircher
> Sent: Friday, October 29, 2021 10:14 AM
> To: linux-usb@vger.kernel.org; linuxppc-dev@lists.ozlabs.org
> Cc: leoyang.li@nxp.com; balbi@kernel.org; gregkh@linuxfoundataion.org
> Subject: bug: usb: gadget: FSL_UDC_CORE Corrupted request list leads to u=
nrecoverable loop.
>
> Hello all,
>
> We've discovered a situation where the FSL udc driver (drivers/usb/gadget=
/udc/fsl_udc_core.c) will enter a loop iterating over the request queue, bu=
t the queue has been corrupted at some point so it loops infinitely.  I bel=
ieve we have narrowed into the offending code, but we are in need of assist=
ance trying to find an appropriate fix for the problem.  The identified cod=
e appears to be in all versions of the Linux kernel the driver exists in.
>
> The problem appears to be when handling a USB_REQ_GET_STATUS request.  Th=
e driver gets this request and then calls the ch9getstatus() function.  In =
this function, it starts a request by "borrowing" the per device status_req=
, filling it in, and then queuing it with a call to list_add_tail() to add =
the request to the endpoint queue.  Right before it exits the function howe=
ver, it's calling ep0_prime_status(), which is filling out that same status=
_req structure and then queuing it with another call to list_add_tail() to =
add the request to the endpoint queue.  This adds two instances of the exac=
t same LIST_HEAD to the endpoint queue, which breaks the list since the pre=
v and next pointers end up pointing to the wrong things.  This ends up caus=
ing a hard loop the next time nuke() gets called, which happens on the next=
 setup IRQ.
>

I agree with you that this looks problematic.  This is probably
introduced by f79a60b8785 "usb: fsl_udc_core: prime status stage once
data stage has primed" that it didn't consider that the status_req has
been re-used for the DATA phase.

I think the proper fix should be having a separate request allocated
for the data phase after the above change.

> I'm not sure what the appropriate fix to this problem is, mostly due to m=
y lack of expertise in USB and this driver stack.  The code has been this w=
ay in the kernel for a very long time, which suggests that it has been work=
ing, unless USB_REQ_GET_STATUS requests are never made.  This further sugge=
sts that there is something else going on that I don't understand.  Deletin=
g the call to ep0_prime_status() and the following ep0stall() call appears,=
 on the surface, to get the device working again, but may have side effects=
 that I'm not seeing.
>
> I'm hopeful someone in the community can help provide some information on=
 what I may be missing or help come up with a solution to the problem.  A b=
ig thank you to anyone who would like to help out.
>
> Eugene
