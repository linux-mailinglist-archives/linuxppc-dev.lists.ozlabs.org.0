Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0197E1E8AB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 08:55:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 453lgm493SzDqVC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 May 2019 16:55:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.160.194; helo=mail-qt1-f194.google.com;
 envelope-from=arndbergmann@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arndb.de
Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com
 [209.85.160.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 453lcx4xVKzDqCY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 May 2019 16:53:21 +1000 (AEST)
Received: by mail-qt1-f194.google.com with SMTP id m32so2107124qtf.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 23:53:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=R4MU58D5iAxx8dZmBy7pxRNzyYT0opcEi8NKuCcjlcM=;
 b=gmgSt3yAFzZ7iP5irUPF+rBc5v68ENl9OExfnmJwoZRRrOPlHtNYHTpBMsniyot2Mw
 XznGNIl8J+oYaaGO78pbkEcbN8xQfvvzs+0Ey6LA+bWax/amRvPFLPC6XZO5HFwtbkzu
 ufXOaX94rz30RzGU8a6y+2UZpbloMuxJ/xNDFaVu5dJL3N+WOP7ksUrp/Dzq6zl7w8lT
 O2/S/39P2bqvDjew9FwPMSmXkxkM/5eYtQHvP/+/B/Kz03Pqb7Z9DM+DHi9ZiRJuzx7P
 ozhtI4IpQhr0OG+j6cVwgTJTmZNsnS5qYNqD6FmCXaGDe+JrjMEZF6dy8tkM3kF+qNH8
 MQnA==
X-Gm-Message-State: APjAAAWazE1KGilwI7TKdrzoxjfyOeRXbcTMuLAHRblOA7qORo5x4lw3
 XCh45k2PdcRgC7RlWwhDt7ScnSjXpldQ4F7F0GU=
X-Google-Smtp-Source: APXvYqy6lq7ldPMqvDA0jFj1FyDcQoLbsSggEPflcVw3ETtRuzRL5VVqc75BtYm29kQBzy5UWOObnG+TCbdkh5zktGA=
X-Received: by 2002:a05:6214:10c8:: with SMTP id
 r8mr32745217qvs.161.1557903198321; 
 Tue, 14 May 2019 23:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190412143538.11780-1-hch@lst.de>
 <CAK8P3a2bg9YkbNpAb9uZkXLFZ3juCmmbF7cRw+Dm9ZiLFno2OQ@mail.gmail.com>
 <fd59e6e22594f740eaf86abad76ee04d@mailhost.ics.forth.gr>
 <CACT4Y+aKGKm9Wbc1owBr51adkbesHP_Z81pBAoZ5HmJ+uZdsaw@mail.gmail.com>
 <CAK8P3a3xRBZrgv16sSigJhY0vGmb=qF9o=6dC_5DqAJtW3qPGQ@mail.gmail.com>
 <CACT4Y+ad5z6z0Dweh5hGwYcUUebPEtqsznmX9enPvYB20J16aA@mail.gmail.com>
 <87woiutwq4.fsf@concordia.ellerman.id.au>
 <CACT4Y+YT52wGuARxe9RqUsMYGNZTwaBowWWUUawyqTBq4G1NDg@mail.gmail.com>
 <20190513120435.GB22993@lst.de>
In-Reply-To: <20190513120435.GB22993@lst.de>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 15 May 2019 08:53:02 +0200
Message-ID: <CAK8P3a2EF5ujv8S-PzYYBtNLEda+a_Wc6xhMign32QFnW4q1Ew@mail.gmail.com>
Subject: Re: [PATCH, RFC] byteorder: sanity check toolchain vs kernel endianess
To: Christoph Hellwig <hch@lst.de>
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
Cc: linux-arch <linux-arch@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Andrew Donnellan <andrew.donnellan@au1.ibm.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Andrew Morton <akpm@linux-foundation.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, May 13, 2019 at 2:04 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, May 13, 2019 at 01:50:19PM +0200, Dmitry Vyukov wrote:
> > > We did have some bugs in the past (~1-2 y/ago) but AFAIK they are all
> > > fixed now. These days I build most of my kernels with a bi-endian 64-bit
> > > toolchain, and switching endian without running `make clean` also works.
> >
> > For the record, yes, it turn out to be a problem in our code (a latent
> > bug). We actually used host (x86) gcc to build as-if ppc code that can
> > run on the host, so it defined neither LE no BE macros. It just
> > happened to work in the past :)
>
> So Nick was right and these checks actually are useful..

Yes, definitely. I wonder if we should also bring back the word size check
from include/asm-generic/bitsperlong.h, which was disabled right
after I originally added that.

      Arnd
