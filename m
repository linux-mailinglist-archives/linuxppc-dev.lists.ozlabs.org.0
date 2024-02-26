Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 487A7866BCC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 09:10:57 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F4FubF80;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjtbg0fygz3fNd
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 19:10:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F4FubF80;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjtZw4hjgz3btm
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 19:10:15 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1dc139ed11fso17063585ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 00:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708935012; x=1709539812; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=40CoeWlqXJhcfzeZ8GLVER1J3s3pk7Hsd4Z6LBpACw4=;
        b=F4FubF80joPEdk5VHdqaHgnJDJZtClOYMy/ztnMrIL0S5W7IUHph4GUmeaUjUxcrt+
         OfhXUbPkmdMPWx3u6FNbCsETGeR8PuWzhpAPg1sayOfldU3fbEFe+no83PW/uSSIrv5i
         OOVNUyA3O438NdkbEC+aZh6U3JALVVoN5RsmwBh58iSC2gu7nYBVamoN8OnUSOl+/TU0
         2tW0HRhO9xVnlriP8bLHuW1/hGZ4TZpr6GpzIkj4lga8/jmQEdOc4Kq/dCDC01DJ6ORk
         6FZuDHw/zPkk4huX9fWHOsg0xJjyLWn6VYG9ElPvuS2L3En6AZPyeIMaKqlY62pnHyps
         e+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708935012; x=1709539812;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=40CoeWlqXJhcfzeZ8GLVER1J3s3pk7Hsd4Z6LBpACw4=;
        b=KBEVRQ5x19MSBqud1cdO1uSL19B94mNh0YeIsBXccGAj+mu2ZAg/r8Pp/qhY5V9rnL
         1guyqz9Dpvm7AZ1bCUqq2PATWt7eaLmZPm7BxRDKaCtwDiIugZNP+5/ry+j4W3jJkllf
         2sM0Yt52HwwxW2AfXNfWawSEAoqlvNnWem9yzhFderqkIOOy7lIaLpRgwJmisqkSAUeD
         eKswPUodU/a01JsflmpFi6Jv3v2W34zB3b2lIlRIyb9Is0XdSQQ7ZZ28JjM7WNqcWpWz
         gFGrJlnzBmLCPGwQNWMrz7yFmEbOWYIqhPOcKgcercnx+5g28Xc8MUT6u+IMAh0mVKnm
         l/NA==
X-Forwarded-Encrypted: i=1; AJvYcCVuCz7K+AdeWtH881uRXpcohPbBHr0K0WDSiNrwfRAjjLKfmawXiLvuK5QjRKAjV/pqGRPTTu5PxRkm14XoLNOXYH2egNTR4L5fBpT6eA==
X-Gm-Message-State: AOJu0Yw7RncbN+96WjWs7ZBejuNG2EDEVW+OeQ/UezmYgcWKrJFfN3rm
	To88xhwGxXutrFalLb5/gU96bRvaTFROxcXrK3QAktN7FtyuKYKQ
X-Google-Smtp-Source: AGHT+IGjewnhiknpGMm5HU4N8i6SJvrGSCvXNkP65jhcUFNHjZ9u6URsa8lY6wCVKeLBowpA/NdmVA==
X-Received: by 2002:a17:902:e5c7:b0:1db:fc18:2da5 with SMTP id u7-20020a170902e5c700b001dbfc182da5mr8456349plf.30.1708935012131;
        Mon, 26 Feb 2024 00:10:12 -0800 (PST)
Received: from localhost ([1.146.74.212])
        by smtp.gmail.com with ESMTPSA id mm12-20020a1709030a0c00b001d8d1a2e5fesm3348276plb.196.2024.02.26.00.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Feb 2024 00:10:11 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Feb 2024 18:10:02 +1000
Message-Id: <CZEUWE22JA80.3S73L9F5A04RK@wheely>
To: "Thomas Huth" <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v5 0/8] Multi-migration support
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.15.2
References: <20240221032757.454524-1-npiggin@gmail.com>
 <5383a1b2-20ca-4d07-9729-e9d5115948dc@redhat.com>
In-Reply-To: <5383a1b2-20ca-4d07-9729-e9d5115948dc@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin
 Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Feb 23, 2024 at 5:06 PM AEST, Thomas Huth wrote:
> On 21/02/2024 04.27, Nicholas Piggin wrote:
> > Now that strange arm64 hang is found to be QEMU bug, I'll repost.
> > Since arm64 requires Thomas's uart patch and it is worse affected
> > by the QEMU bug, I will just not build it on arm. The QEMU bug
> > still affects powerpc (and presumably s390x) but it's not causing
> > so much trouble for this test case.
> >=20
> > I have another test case that can hit it reliably and doesn't
> > cause crashes but that takes some harness and common lib work so
> > I'll send that another time.
> >=20
> > Since v4:
> > - Don't build selftest-migration on arm.
> > - Reduce selftest-migration iterations from 100 to 30 to make the
> >    test run faster (it's ~0.5s per migration).
>
> Thanks, I think the series is ready to go now ... we just have to wait fo=
r=20
> your QEMU TCG migration fix to get merged first. Or should we maybe mark =
the=20
> selftest-migration with "accel =3D kvm" for now and remove that line late=
r=20
> once QEMU has been fixed?

Could we merge it? I'm juggling a bunch of different things and prone to
lose track of something :\ I'll need to drum up a bit of interest to
review the QEMU fixes from those who know the code too, so that may take
some time.

I left it out of arm unittests.cfg entirely, and s390 and powerpc seems
to work by luck enough to be useful for gitlab CI so I don't think there
is a chnage needed really unless you're paranoid.

I do have a later patch that adds a memory tester that does trigger it
right away on powerpc. I'll send that out after this series is merged...
but we do still have the issue that the gitlab CI image has the old QEMU
don't we? Until we update distro.

Thanks,
Nick

