Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 20B8227468D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 18:24:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwmqG3NB0zDqXR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 02:24:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=vkrTbtOH; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwmkF308xzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 02:20:16 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id o25so7424788pgm.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 09:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=OuYZ36WnxwIp9b6camA1INonBCd7PS5F7n5lbvDtQoE=;
 b=vkrTbtOH4vHnR/84aYqVDHrQ5AGvI5gJZ+epaaRbPDginNWZ7IQOaHp0KiQGLoRIqK
 lCtpCBfEppwh5xdm5Fg2E09yGBsQ1omUh0FsVnB0AGbc0KabsZevsMs5kdugIv8CVE5/
 WA4g4A2X6yhuybhLsZ26G3b/9jK9koGpq3H8xumPWJXJrnSzbLUYbfDR++IgN0bKoBQq
 n0DG/oDelKPnE35WpGCvEELD66Jz17cs7lC56sr6mITihQA1DVJ1mt9BGhniHUyWF6Lh
 zzYPOu4uBf4nQ34xtWqSlA6XpnJ8NFviCNNpjE2H0nhrpatshwJ5hPmeTiRqtrX3VMpc
 QmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=OuYZ36WnxwIp9b6camA1INonBCd7PS5F7n5lbvDtQoE=;
 b=rkWYaLex2PBCiJkWNZ/TQQ433hpqxw/iy1UwdgZiycLs/i9o5JHpNEEglomBHR9wee
 b3mvc4Vq6hCvuPy9LiGR6puOPDvV3vQcmA60bujCtNPujDu3NHoXUHf7UHkw2wO/CE2s
 DtfGH40BYR3srpk5AEtxmJPralNYEXksUOmT+5DaOQDtl9n3L0C1yUFPCYn3QfyxGeL2
 EmOthA8mC6RerJhgaThZl48thZQrxQqNrd0/gkkiUrgSQmNfwez5PcgujBIaH4OEWqFR
 RQFO1QDqrvJyhz1LWVA2IxfU1hb0r1RxfYyyhNlu6hvFD37YrDP8lWhdgcGkXdVvrKHy
 ppIA==
X-Gm-Message-State: AOAM531epeXYG2arc62hkED66M655wAn/3zCbjrM44R0sxfz3d74fcHI
 H1nqIF0TCXZAVHM7RFqvIHc+cA==
X-Google-Smtp-Source: ABdhPJzVdW+N5Ufbpna8vjsXyt2h2YPelrT15cDlhJa791IGnC+04vroQZTdEBrKNKjccVmTF6OthA==
X-Received: by 2002:a17:902:fe88:b029:d2:2a16:254 with SMTP id
 x8-20020a170902fe88b02900d22a160254mr5598643plm.23.1600791613205; 
 Tue, 22 Sep 2020 09:20:13 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:c200:1ef2:f4bd:fe2:85ed:ea92])
 by smtp.gmail.com with ESMTPSA id
 gk14sm2982522pjb.41.2020.09.22.09.20.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Sep 2020 09:20:12 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
Date: Tue, 22 Sep 2020 09:20:07 -0700
Message-Id: <446566DF-ECBC-449C-92A1-A7D5AEBE9935@amacapital.net>
References: <CAK8P3a39jN+t2hhLg0oKZnbYATQXmYE2-Z1JkmFyc1EPdg1HXw@mail.gmail.com>
In-Reply-To: <CAK8P3a39jN+t2hhLg0oKZnbYATQXmYE2-Z1JkmFyc1EPdg1HXw@mail.gmail.com>
To: Arnd Bergmann <arnd@arndb.de>
X-Mailer: iPhone Mail (18A373)
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
Cc: linux-aio <linux-aio@kvack.org>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 David Howells <dhowells@redhat.com>, Linux-MM <linux-mm@kvack.org>,
 keyrings@vger.kernel.org, sparclinux <sparclinux@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arch <linux-arch@vger.kernel.org>,
 linux-s390 <linux-s390@vger.kernel.org>,
 Linux SCSI List <linux-scsi@vger.kernel.org>, X86 ML <x86@kernel.org>,
 linux-block <linux-block@vger.kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, io-uring@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Jens Axboe <axboe@kernel.dk>, Parisc List <linux-parisc@vger.kernel.org>,
 Network Development <netdev@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 LSM List <linux-security-module@vger.kernel.org>,
 Linux FS Devel <linux-fsdevel@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Pavel Begunkov <asml.silence@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Sep 22, 2020, at 2:01 AM, Arnd Bergmann <arnd@arndb.de> wrote:
>=20
> =EF=BB=BFOn Tue, Sep 22, 2020 at 9:59 AM Pavel Begunkov <asml.silence@gmai=
l.com> wrote:
>>> On 22/09/2020 10:23, Arnd Bergmann wrote:
>>> On Tue, Sep 22, 2020 at 8:32 AM Pavel Begunkov <asml.silence@gmail.com> w=
rote:
>>>> On 22/09/2020 03:58, Andy Lutomirski wrote:
>>>>> On Mon, Sep 21, 2020 at 5:24 PM Pavel Begunkov <asml.silence@gmail.com=
> wrote:
>>>>> I may be looking at a different kernel than you, but aren't you
>>>>> preventing creating an io_uring regardless of whether SQPOLL is
>>>>> requested?
>>>>=20
>>>> I diffed a not-saved file on a sleepy head, thanks for noticing.
>>>> As you said, there should be an SQPOLL check.
>>>>=20
>>>> ...
>>>> if (ctx->compat && (p->flags & IORING_SETUP_SQPOLL))
>>>>        goto err;
>>>=20
>>> Wouldn't that mean that now 32-bit containers behave differently
>>> between compat and native execution?
>>>=20
>>> I think if you want to prevent 32-bit applications from using SQPOLL,
>>> it needs to be done the same way on both to be consistent:
>>=20
>> The intention was to disable only compat not native 32-bit.
>=20
> I'm not following why that would be considered a valid option,
> as that clearly breaks existing users that update from a 32-bit
> kernel to a 64-bit one.
>=20
> Taking away the features from users that are still on 32-bit kernels
> already seems questionable to me, but being inconsistent
> about it seems much worse, in particular when the regression
> is on the upgrade path.
>=20
>>> Can we expect all existing and future user space to have a sane
>>> fallback when IORING_SETUP_SQPOLL fails?
>>=20
>> SQPOLL has a few differences with non-SQPOLL modes, but it's easy
>> to convert between them. Anyway, SQPOLL is a privileged special
>> case that's here for performance/latency reasons, I don't think
>> there will be any non-accidental users of it.
>=20
> Ok, so the behavior of 32-bit tasks would be the same as running
> the same application as unprivileged 64-bit tasks, with applications
> already having to implement that fallback, right?
>=20
>=20

I don=E2=80=99t have any real preference wrt SQPOLL, and it may be that we h=
ave a problem even without SQPOLL when IO gets punted without one of the fix=
es discussed.

But banning the mismatched io_uring and io_uring_enter seems like it may be w=
orthwhile regardless.=
