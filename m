Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED4C19F200
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 11:03:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wl2P3xyNzDqdh
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 19:03:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d44;
 helo=mail-io1-xd44.google.com; envelope-from=oohall@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=RO6bTnl9; dkim-atps=neutral
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com
 [IPv6:2607:f8b0:4864:20::d44])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wl0N52rPzDqN2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 19:01:55 +1000 (AEST)
Received: by mail-io1-xd44.google.com with SMTP id o3so14987997ioh.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 02:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=pPm6etZ3DUUwdeDCq5weBWVRzrJKUcDMh1m6LaRUmg0=;
 b=RO6bTnl9ZO8chRFxwBeCgpSPjiaXGSo/VIogGReccYaReJrAqlGbeuPXi1/pb4+D//
 8TT4Lv9F13EkLo1Gwk60cf0zhFjSrwuT6Ul+RFDalmwEh5ktCIw1nTvXsuLpMcrx2nGg
 CIbYnUxlAtzBZ1ZjFl3/iLVRzXV0p27M19WUsjeJn29dtx1eNTXiDnapuGtguKXqBW0r
 4S8aYm8e1cLhhM9agl0Z7zlIiq4GkfmWD+QWL/js/9UrbZ+Rnrhunypu3uGV7EB2oSN5
 Vg3wtiIIjMH+vQOajOslPnZDUii4fDuMSTIzExnmx3lbfIYqMFIyRIS4LxBIsYwoaBVR
 iaWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pPm6etZ3DUUwdeDCq5weBWVRzrJKUcDMh1m6LaRUmg0=;
 b=ftE1etmNfGpHdVX9AB/XVWrIr+KexbrA1l6RKzEJerSLYbHM6qKqWm6kCefVl+DZFX
 WbSp93vU0KF6ahJLVeEYhiOD9I3JNCnQ+X/gLjBPclv3/rExu6sr0Z8ulI+xkg0ysmC0
 pG5Yl/CE3IjwEnL/4ZPQOHGe6mNHpgY2gdtVV7YHMwz24jKuSMF+Qm24tJokRMTNkWWX
 PLCzScQ3wW7DmfeEvLi5AT9xWLPfefZonT/aw5qpvcM8fe0ICRlssanbSzlSbUfbXmL4
 E30+e7vzOVkFNhF9iB6cltg4w50/i+LiGhBh0JXI9K3AWH7AygPwSo6R0ACsgaBItAzb
 rMfw==
X-Gm-Message-State: AGi0PubcPw34eJN+jMiK7spCGcbKfS/6IojByGluoPMRqHEG1nQ3ELDa
 7Ju8Ml21CA4DGgaoZj6/OujOlymMF3jfQjUH9d8=
X-Google-Smtp-Source: APiQypLku0LYgnaIgBugI+M3YhMRY6xZpLQ6kvGHLYNz1gKDqsMI0LsZRNJJvk7btsnOIpyZBTM50rTOlldIgmCnN5A=
X-Received: by 2002:a02:390b:: with SMTP id l11mr19599417jaa.111.1586163712467; 
 Mon, 06 Apr 2020 02:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <d4a96597-6704-3030-b936-6282f0994f09@web.de>
 <CAJRQjofnnhzOp4yis=sL85ESDvNApXHL3dpv6T1NJL-Wh0OOfA@mail.gmail.com>
In-Reply-To: <CAJRQjofnnhzOp4yis=sL85ESDvNApXHL3dpv6T1NJL-Wh0OOfA@mail.gmail.com>
From: "Oliver O'Halloran" <oohall@gmail.com>
Date: Mon, 6 Apr 2020 19:01:41 +1000
Message-ID: <CAOSf1CGLZ5H1cUsv6atZ7hNpQ+PDyyAjp6dzJjXMwC5XoUOVQQ@mail.gmail.com>
Subject: Re: [PATCH v3] powerpc/powernv: add NULL check after kzalloc in
 opal_add_one_export
To: Qiujun Huang <hqjagain@gmail.com>
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
Cc: Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Markus Elfring <Markus.Elfring@web.de>, LKML <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 6, 2020 at 11:15 AM Qiujun Huang <hqjagain@gmail.com> wrote:
>
> On Mon, Apr 6, 2020 at 3:06 AM Markus Elfring <Markus.Elfring@web.de> wro=
te:
> >
> > > Here needs a NULL check.
> quite obvious?
> >
> > I find this change description questionable
> > (despite of a reasonable patch subject).
> >
> >
> > > Issue found by coccinelle.
> >
> > Would an information like =E2=80=9CGenerated by: scripts/coccinelle/nul=
l/kmerr.cocci=E2=80=9D
> > be nicer?
> Yeah, but I think It was enough.

I didn't know we had that script in the kernel tree so I think it's a
good to mention that you used it. It might even help idiots like me
who write this sort of bug.

> > Will a patch change log be helpful here?
> I realized I should write some change log, and the change log was meaning=
less.
> So I left it blank.

The changelog is fine IMO. The point of a changelog is to tell a
reader doing git archeology why a change happened and this is
sufficent for that.

Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
