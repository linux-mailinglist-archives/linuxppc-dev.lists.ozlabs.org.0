Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 86545271709
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 20:22:17 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BvbWq060wzDqH1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 04:22:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=kucharsk@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=j4uRAT2E; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BvXGv6QkVzDqgV
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Sep 2020 01:55:47 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id o5so12373204qke.12
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 08:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=wK83tl6Aps7O/Nyle+fjor+3BT0ZPHQ73i72gH6haeo=;
 b=j4uRAT2E8fdr2YaqrsiSPOPm8SjiSJMcVFWHVJQhudY7AjMagOuTaPaUrJZNB/DBxT
 RsSoXPsH0OZD1fdr6pAc+sedSbMtOJwM9dBbGX8EN9WBkRUekzOQnQi4yezBjIKvjoxp
 4pTmIYXjTwfM8Ld7eN31Snn3HDl+xaBbxHqYulOMGjuIpzvi82ZxqqNXiPf1uBPbl0mW
 R3NIOxISkFL7B3tRSyYt+xnjnX4aUHUa0CKdIWEe71XW1d+175gN1d4Ezj+1k468etjw
 /p5aXBL9ieWXzE65cwKlIMBtQsaHBRTVaj0KGV3HN1O35ptGSjHCYh1Za9qlu8Ia58/F
 0ILw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=wK83tl6Aps7O/Nyle+fjor+3BT0ZPHQ73i72gH6haeo=;
 b=DHYQuQ9LgFnoYvJ3ieEByQRre8zOrGkf6hL7q16hf9v614beyvG/uP7VxcWpTyJHLm
 AhP6uxQxKsEikxomSaaN+LBekVMqEHroi6qQo4qAW28Wgy+n1aCff9aEx2gYVAzcCgqO
 kp3RoXulUY/qQ5+OhhghzQ6LHYRe1J9r0qCtq9aXyqVK7/exbSzAq+GPWC47mrZmjd9y
 +e2S/F8iTafvnEceO8NDfolWtcAVIfm5n1xLYuTN/5L/4fdIiJJYqm8Q/bDIr66F6tXw
 LgdELQLXYBMSKMPKf7Tj6nDoyT+Mxln23FzBYCzEmEqBCyxrtBWR8LGHYRXnNDAIi4Id
 SwDQ==
X-Gm-Message-State: AOAM533/Lk5eu6fP7n2KgFGkwHRRBpxngPBoNkCyF3InfVySgvvKTF8E
 qe5Hom4b1IJh+PiwRhDojrY=
X-Google-Smtp-Source: ABdhPJy0BhskiTDfvD8MBwip85dcX1wIsXPWtdth0juyqPe/DUqb3tBX97TvqdwX16zuipDqY5+Gyg==
X-Received: by 2002:a05:620a:c10:: with SMTP id
 l16mr40194491qki.245.1600617343577; 
 Sun, 20 Sep 2020 08:55:43 -0700 (PDT)
Received: from localhost.localdomain ([65.140.37.34])
 by smtp.gmail.com with ESMTPSA id v30sm7605819qtj.52.2020.09.20.08.55.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 20 Sep 2020 08:55:42 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: William Kucharski <kucharsk@gmail.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
Date: Sun, 20 Sep 2020 09:55:40 -0600
Message-Id: <76A432F3-4532-42A4-900E-16C0AC2D21D8@gmail.com>
References: <20200920151510.GS32101@casper.infradead.org>
In-Reply-To: <20200920151510.GS32101@casper.infradead.org>
To: Matthew Wilcox <willy@infradead.org>
X-Mailer: iPhone Mail (18B5052h)
X-Mailman-Approved-At: Mon, 21 Sep 2020 04:19:54 +1000
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
Cc: linux-aio@kvack.org, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-block@vger.kernel.org,
 Alexander Viro <viro@zeniv.linux.org.uk>, io-uring@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jens Axboe <axboe@kernel.dk>,
 linux-parisc@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

I really like that as it=E2=80=99s self-documenting and anyone debugging it c=
an see what is actually being used at a glance.

> On Sep 20, 2020, at 09:15, Matthew Wilcox <willy@infradead.org> wrote:
>=20
> =EF=BB=BFOn Fri, Sep 18, 2020 at 02:45:25PM +0200, Christoph Hellwig wrote=
:
>> Add a flag to force processing a syscall as a compat syscall.  This is
>> required so that in_compat_syscall() works for I/O submitted by io_uring
>> helper threads on behalf of compat syscalls.
>=20
> Al doesn't like this much, but my suggestion is to introduce two new
> opcodes -- IORING_OP_READV32 and IORING_OP_WRITEV32.  The compat code
> can translate IORING_OP_READV to IORING_OP_READV32 and then the core
> code can know what that user pointer is pointing to.
