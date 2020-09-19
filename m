Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDEB27111A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 00:25:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bv4zD2qcBzDqcw
	for <lists+linuxppc-dev@lfdr.de>; Sun, 20 Sep 2020 08:25:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=amacapital.net (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=luto@amacapital.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=amacapital.net
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=amacapital-net.20150623.gappssmtp.com
 header.i=@amacapital-net.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=JGo5Ok3U; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bv4xC4l5mzDqXW
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 20 Sep 2020 08:23:59 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id k13so5326789pfg.1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Sep 2020 15:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amacapital-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:from:mime-version:subject:date:message-id
 :references:cc:in-reply-to:to;
 bh=Zt+NcwFtW78Ml5fABVrawYmyBt1OY97jVqUspSuSzso=;
 b=JGo5Ok3UQlPkC13DKOsYdJnfzq73atFfYisEM+Hwumxj0suTBGssb+VorpwmGSdeCs
 bcXUpcZN25SMMCskSZLqiZtD4YDbCCmBpaZRkf/XvoBbu4chMl2XKMFhFG1ni8TPjold
 u1MXw/S5l0zIP2gSmcy2WrK2PhaeRtThtZVCQ2dBve9yiyZAijqQYE96b0yFOHC1wqdZ
 7hEKxxWuktu0haCnifIZQak4CZt8BJYl2PwWFDdP87EmsRRAJSorXT5hINrPIcaUrT6Y
 ZGcKD1NJTEIknksw7U+45Z60Vnnj162xs4+yz1Qx9fnmzqSyx2F/YY69FVIp1XlYNq6/
 4JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:from:mime-version
 :subject:date:message-id:references:cc:in-reply-to:to;
 bh=Zt+NcwFtW78Ml5fABVrawYmyBt1OY97jVqUspSuSzso=;
 b=QeeBdbZCRX1TQAbDOZH4G0EVda+LdxWi6GYX1sl6wYjJkfHJqALSRJ8HcOISBXjCnJ
 h2AiUqck/DC55xBE3elyOSL1hvg2NTJRfIf7PYrERiP8R5MHlBQsznfvCh0GoSkANMXO
 PAiZlvxjxN9VreQEYZFlyy/K/8DfJi2CYqUfchPnzHGR24s9OeuZtV+eR+VafhqBQl+X
 wUwXa9VOai+Bn8/zbXTVizdotg1GsFVzhlfsgoWyI4/ubY9GGcNwBx7kuR9rYtpRHp18
 Z232juhZqeIjFBZkZ1C//xCPQGKoajn1n1vWBGFOhMBCe+YaEq+o3gc13mBg79bqiz6k
 LWhg==
X-Gm-Message-State: AOAM532KbFyWfGutwbBFwyo7fv3RcNNenWtSioljR0VM4zY6OcmOp2oj
 FhE0zxuBwzYZKFpEkTNtrhs1Ug==
X-Google-Smtp-Source: ABdhPJzQlxXV5m1vFuZ7oLLvJBaRav6dyPvh+IWASrFhojswDAtpJrULIu1W68E3I7AE9Ae7seCzYQ==
X-Received: by 2002:aa7:9583:0:b029:142:2501:396a with SMTP id
 z3-20020aa795830000b02901422501396amr21664408pfj.47.1600554235950; 
 Sat, 19 Sep 2020 15:23:55 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:c200:1ef2:e9da:b923:b529:3349])
 by smtp.gmail.com with ESMTPSA id gb17sm6607151pjb.15.2020.09.19.15.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 19 Sep 2020 15:23:55 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From: Andy Lutomirski <luto@amacapital.net>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH 1/9] kernel: add a PF_FORCE_COMPAT flag
Date: Sat, 19 Sep 2020 15:23:54 -0700
Message-Id: <AA2CFC7E-E685-4596-84AD-0E314137B93F@amacapital.net>
References: <20200919220920.GI3421308@ZenIV.linux.org.uk>
In-Reply-To: <20200919220920.GI3421308@ZenIV.linux.org.uk>
To: Al Viro <viro@zeniv.linux.org.uk>
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
Cc: linux-aio@kvack.org, linux-mips@vger.kernel.org,
 David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
 keyrings@vger.kernel.org, sparclinux@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, x86@kernel.org,
 Arnd Bergmann <arnd@arndb.de>, linux-block@vger.kernel.org,
 io-uring@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jens Axboe <axboe@kernel.dk>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> On Sep 19, 2020, at 3:09 PM, Al Viro <viro@zeniv.linux.org.uk> wrote:
>=20
> =EF=BB=BFOn Fri, Sep 18, 2020 at 05:16:15PM +0200, Christoph Hellwig wrote=
:
>>> On Fri, Sep 18, 2020 at 02:58:22PM +0100, Al Viro wrote:
>>> Said that, why not provide a variant that would take an explicit
>>> "is it compat" argument and use it there?  And have the normal
>>> one pass in_compat_syscall() to that...
>>=20
>> That would help to not introduce a regression with this series yes.
>> But it wouldn't fix existing bugs when io_uring is used to access
>> read or write methods that use in_compat_syscall().  One example that
>> I recently ran into is drivers/scsi/sg.c.
>=20
> So screw such read/write methods - don't use them with io_uring.
> That, BTW, is one of the reasons I'm sceptical about burying the
> decisions deep into the callchain - we don't _want_ different
> data layouts on read/write depending upon the 32bit vs. 64bit
> caller, let alone the pointer-chasing garbage that is /dev/sg.

Well, we could remove in_compat_syscall(), etc and instead have an implicit p=
arameter in DEFINE_SYSCALL.  Then everything would have to be explicit.  Thi=
s would probably be a win, although it could be quite a bit of work.=
