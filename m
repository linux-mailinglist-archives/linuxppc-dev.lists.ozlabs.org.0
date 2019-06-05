Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34627359C8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 11:43:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45JkNy3BjqzDqbf
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jun 2019 19:42:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=redhat.com
 (client-ip=209.85.167.43; helo=mail-lf1-f43.google.com;
 envelope-from=bhsharma@redhat.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45JkMQ14BVzDqWp
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jun 2019 19:41:37 +1000 (AEST)
Received: by mail-lf1-f43.google.com with SMTP id a9so17170989lff.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jun 2019 02:41:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mD5POnGi96vhsSTDzK5VPlMWzvJ6ZNYJN2YLUROjSiE=;
 b=LyzJxanptng6ggVkHri7iO4euQeqwbBgRlAX+53WsISd842MRSBE+FdbXWDCkVvHrV
 k+Aunbf6/2cniwJ8qQWPenB18HHnr6YHxAuTy0qFExVhW3Pztw2omiKI8Or81QQnxQxi
 Kgk+PGaiR9GK1E8CQAJtg0Rgtm/8ojvOf3mH0rCzvpQN92yoctncrYza9bRUSSkwiRsz
 X2za9xfsm2QvIqEtxi7J56XpNZn4JTLvuhWsDd9MMc5j8xbRHiVJmmYK95hMoE0daW01
 VYkGewi9lgKUxpFa2UgDokhhT1NKY0FY8yT5J+wv6UfDjob8AOy54R1fQmHgpK7epXd7
 2Svw==
X-Gm-Message-State: APjAAAXgKq9vKj/QCr51RUxUS6YDCntGuNAGevqogpnKZ3dRs29xwvCi
 6o+Pwr1DwaYFTkE2ToGHnUg8E3NTiqtJZ0wsLzTU3A==
X-Google-Smtp-Source: APXvYqzwcglkITd7H0Ft0gMprdTFjTSYUv+hAGVBAfXR4UQk7GiuIytvLKV7ZVoazrmJaPI65LZkXlelTZSIlO32llE=
X-Received: by 2002:ac2:46ef:: with SMTP id q15mr19765640lfo.63.1559727693337; 
 Wed, 05 Jun 2019 02:41:33 -0700 (PDT)
MIME-Version: 1.0
References: <1559212177-7072-1-git-send-email-bhsharma@redhat.com>
 <87v9xsnlu9.fsf@concordia.ellerman.id.au>
 <CACi5LpM9v1YC_6HhA-uKghawzkEu=TTPVkomMmv2i-LGi8X7+g@mail.gmail.com>
 <20190530081358.650930ad@lwn.net> <87ef4eodwf.fsf@concordia.ellerman.id.au>
In-Reply-To: <87ef4eodwf.fsf@concordia.ellerman.id.au>
From: Bhupesh Sharma <bhsharma@redhat.com>
Date: Wed, 5 Jun 2019 15:11:20 +0530
Message-ID: <CACi5LpMTSu0PuZhLDnQv_bFD42vFnX_LMQvse4ERPfFiquSriw@mail.gmail.com>
Subject: Re: [PATCH] Documentation/stackprotector: powerpc supports stack
 protector
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Bhupesh SHARMA <bhupesh.linux@gmail.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Jonathan,

On Fri, May 31, 2019 at 8:44 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Jonathan Corbet <corbet@lwn.net> writes:
> > On Thu, 30 May 2019 18:37:46 +0530
> > Bhupesh Sharma <bhsharma@redhat.com> wrote:
> >
> >> > This should probably go via the documentation tree?
> >> >
> >> > Acked-by: Michael Ellerman <mpe@ellerman.id.au>
> >>
> >> Thanks for the review Michael.
> >> I am ok with this going through the documentation tree as well.
> >
> > Works for me too, but I don't seem to find the actual patch anywhere I
> > look.  Can you send me a copy?
>
> You can get it from lore:
>
>   https://lore.kernel.org/linuxppc-dev/1559212177-7072-1-git-send-email-bhsharma@redhat.com/raw
>
> Or patchwork (automatically adds my ack):
>
>   https://patchwork.ozlabs.org/patch/1107706/mbox/
>
> Or Bhupesh can send it to you :)

Please let me know if I should send out the patch again, this time
Cc'ing you and the doc-list.

Thanks,
Bhupesh
