Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EDE6919F26C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 11:25:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wlWD6MtKzDqlB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 19:25:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=hqjagain@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vBH/KyGF; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wlTV5nLyzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 19:23:40 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id f3so4936625ioj.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 02:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qFoAcV0zVN3vQ6o7xZAt9SMFc7osLXFVRI1rCfHEWUM=;
 b=vBH/KyGFA+wvslkjWtJfq0ZgdmNm1mkxPQSFGPHQqm4PwZvPJdIWwUH0+STnDfb3aQ
 qZJX0t14vi0s0yKDn6bweipq3CLN0dJCBG1vEQ8C/dbFw56G3CJR1dyg5YbofBDlXXe2
 Fz0KDk0/zL5pCnDrX7X4sGe6AHEiZD0naFgGSedu6+Bz4/4l3R084+wcnzfE1Cqo9/lw
 Xb6jWCan2j/6zn5/2mJxy/ULAv6ld9mnHrEBISgeJJdqnBC3xKqkbceZQeo9KcMhRULq
 a6kEFtRXaAW/YqngtKEQ8+jNdHMVeb2SRMUiVpSgkEcbE/93gzjYkMlGYy3QL23NrVJx
 Q9/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qFoAcV0zVN3vQ6o7xZAt9SMFc7osLXFVRI1rCfHEWUM=;
 b=EfvJcTe5upVjwSAc9wtZCKkTGtrLqnW0KCN+7K22w9u52Tn2FRdahlFhAPhVuf5rXG
 f/ol18J+kFTvPTbSTBmE4aiAlzMqpecTAxiZ4nFG0ONkUiJScqPZxjf+xSvClhswfuoP
 b7if/LbgVGJM0BfpaxXi6Jud/7MRCx3QoFeLP0KJ+hZp+jlnzvTeANuGd4j2ezW/FN0V
 a3abfdnX4suaBvhAXeLJZswPmJcU+dPu73CXXVS0vhG8f4Bl8+6p0L+iNdMl0sMaGGqb
 B7zjBMgRq6794guuSKEoVgtXrgR/1PkL0PSDTjHeTQVHVFm8XGwGskM++1KMyaddSU8T
 uqew==
X-Gm-Message-State: AGi0PuYwn7k6YXoWD+jpqadFZvx+sjI9JrMbpzf7aS7Ag2SZjlN8uPhh
 5lNIdi1CqWBqyXsPIE9SR5KGQtcrkqRWLrpmGW8=
X-Google-Smtp-Source: APiQypJDMK3mHQ9lE0SSHpw0eS1W2DgEmEmxJEks9KfWSK0mJc32QCWdz9JeO82+EFpl7gSQJv+jAa4ocXX3BZKrin0=
X-Received: by 2002:a5d:984b:: with SMTP id p11mr18749986ios.175.1586165017572; 
 Mon, 06 Apr 2020 02:23:37 -0700 (PDT)
MIME-Version: 1.0
References: <d4a96597-6704-3030-b936-6282f0994f09@web.de>
 <CAJRQjofnnhzOp4yis=sL85ESDvNApXHL3dpv6T1NJL-Wh0OOfA@mail.gmail.com>
 <CAOSf1CGLZ5H1cUsv6atZ7hNpQ+PDyyAjp6dzJjXMwC5XoUOVQQ@mail.gmail.com>
In-Reply-To: <CAOSf1CGLZ5H1cUsv6atZ7hNpQ+PDyyAjp6dzJjXMwC5XoUOVQQ@mail.gmail.com>
From: Qiujun Huang <hqjagain@gmail.com>
Date: Mon, 6 Apr 2020 17:23:24 +0800
Message-ID: <CAJRQjofc4f9eyBtP8XyHG0Afp=O7dRVqpCz0eFzCfaGN9zttbQ@mail.gmail.com>
Subject: Re: [PATCH v3] powerpc/powernv: add NULL check after kzalloc in
 opal_add_one_export
To: "Oliver O'Halloran" <oohall@gmail.com>
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

On Mon, Apr 6, 2020 at 5:01 PM Oliver O'Halloran <oohall@gmail.com> wrote:
>
> On Mon, Apr 6, 2020 at 11:15 AM Qiujun Huang <hqjagain@gmail.com> wrote:
> >
> > On Mon, Apr 6, 2020 at 3:06 AM Markus Elfring <Markus.Elfring@web.de> w=
rote:
> > >
> > > > Here needs a NULL check.
> > quite obvious?
> > >
> > > I find this change description questionable
> > > (despite of a reasonable patch subject).
> > >
> > >
> > > > Issue found by coccinelle.
> > >
> > > Would an information like =E2=80=9CGenerated by: scripts/coccinelle/n=
ull/kmerr.cocci=E2=80=9D
> > > be nicer?
> > Yeah, but I think It was enough.
>
> I didn't know we had that script in the kernel tree so I think it's a
> good to mention that you used it. It might even help idiots like me
> who write this sort of bug.

Yes, I will resend the patch. Thanks :-)

>
> > > Will a patch change log be helpful here?
> > I realized I should write some change log, and the change log was meani=
ngless.
> > So I left it blank.
>
> The changelog is fine IMO. The point of a changelog is to tell a
> reader doing git archeology why a change happened and this is
> sufficent for that.

Get that.

>
> Reviewed-by: Oliver O'Halloran <oohall@gmail.com>
