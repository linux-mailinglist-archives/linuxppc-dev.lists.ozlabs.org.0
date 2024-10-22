Return-Path: <linuxppc-dev+bounces-2480-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BE479A972F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Oct 2024 05:40:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XXdGh4Nqcz2xnS;
	Tue, 22 Oct 2024 14:39:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::1029"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729568396;
	cv=none; b=KpCS6OjyVhcGvQHkTfM9vy6nArLPatqT0ayND3bIwccKaaFoRUmP+bBDhtryDNjurG4lxt5mM8ZehSZ3RKrccDLvr+xqdad69P0Z9PTbAFNd21xXtkPKiZpZOZmy97XgUdvdEKODDDjTl0iCLf3JumhUDxWBhZAGrE96bs1eAY90pqiYv+ugiSsbk7JDFS6jvnnqJD9A9Pvesk08eoP/Y+oqRHiB1bD6pLZyohbKvpny1EGzxRNfEfXl4i/DPVEZwfU9WxGremy4W9WVa0Sszyejf6s34Cbk8DYphsGAL8cku3bCroILhccCSCR/+zvZdgj1EJWv5AtKp6EVxJf1nQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729568396; c=relaxed/relaxed;
	bh=spsaMZsKCVaR6klXBbr2ISPdVYP/2QLSe1/E8O7xM2w=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=JQ1jt3+I+wlcpoYAEx276+ltOdKOgUn+/C+P+ClKhzVShzToHIyhhnscDflG48dSs77VzaOrjjaO94XSL9LOgJI3FlodjMVRkM7s7z8QyS7WlhdkyRx+0t4Za3TtaQNC7zC7XlAll3pnWlxfrvzlYWjl5v2Y3Wi3cHzS/uC6CQMIQ0h9h543/yB4YTLe92DPyA/nV18LRXhKjzLv1BEBy9TkBXq9c8CnVPl3zsAz3LgaE/trOe4aqF/53oAZsAQXO7OH1KiRiGuruuQtKh0nqnNFFpIw5LJhQnkoiRuIxNWcIQ6lP3RO9DOsba5yd6mDm2IS9vVYTHvp608gpOmydA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qr4LkvIu; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Qr4LkvIu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1029; helo=mail-pj1-x1029.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XXdGf41wlz2xgQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Oct 2024 14:39:52 +1100 (AEDT)
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so3939969a91.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2024 20:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729568390; x=1730173190; darn=lists.ozlabs.org;
        h=references:message-id:date:in-reply-to:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=spsaMZsKCVaR6klXBbr2ISPdVYP/2QLSe1/E8O7xM2w=;
        b=Qr4LkvIu1I3XuUlAa4Lxk+4DmHh9rT8bX6LX1+fBJWOw4kVMzyE52Euz5nt4D3PRxi
         HBcq0zGBtsH084J2bUGkRk09ZRD9SaQ917oYGf38JbabI+8p5IUGNDygqPMrXC2km48j
         zHBpjo/OXtOfTEkMLxCCQEompJR6CtHljv8REiPdl1utqNNcSs3l4rN4bV0TRZYIo9b6
         zs/wCcAXlUzW7QWNQYcuN8Yo9S6xuesxhBobOd2Wjmluo6iOByIHbP9HQLsOGvGeiCh4
         RkCT4hynDK9BdiRmiUIoXsD5ApCXVxeDMYppKjlN5XTDn4C2kBYgCpASpY0Wjo1WuJhb
         l9ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729568390; x=1730173190;
        h=references:message-id:date:in-reply-to:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=spsaMZsKCVaR6klXBbr2ISPdVYP/2QLSe1/E8O7xM2w=;
        b=r8HanRa9wSh984iMyPbDa+bJokobFwg33F6aJziovptcBNr3agxHIkQ4s18gAV5wCy
         4eYS0cS2yTQ30utOUO/8cz5+ww9N7INFOFmmx1HlFSk497HB+jMWgS06Wfx0DlZ2PjBw
         15j9x26zve5IttyLDma17nDBfKg4LpQ5pAUJn7JLvnPqg02ZubC0AnyXz28B9tRHtfat
         JVrmBvfq3+w0ZzU1BCRrq8hOPqtrFwD+DzTos+wgW2XE8AxyH01KIhS+F4qG0BfmcKwM
         EZKurERxsuXrWd9o8mCiNGd2UpVZjHLDnYPXSBQd42E1/hdueYCTIhdApqTx6dfOtWjv
         AVGg==
X-Forwarded-Encrypted: i=1; AJvYcCXfMxHkRHzlg5g8R++P+b09eU40Jb86Dja+1aRCyBk3QGceqO1mSydND6n8O/0WkRnAkLj/XdSV+tkCRWQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yyh1uWvhVsNrXzoYQsujoNp6Xd5fZxXVTr2hceuT+iU8ne44PdS
	7bcPhxlyMtR233EeIRuMF0vwxCKDIhjMidNhWx7v9QYEP3GBrvSv
X-Google-Smtp-Source: AGHT+IGddUf1mPCsPCWffBNPDtLWSUehvxpbptM8hcCGx+md9aZqciN7QKYEXR3bow3OQyfazrO4aw==
X-Received: by 2002:a17:90a:ac1:b0:2e5:e43a:1413 with SMTP id 98e67ed59e1d1-2e5e43a16dcmr348166a91.9.1729568390362;
        Mon, 21 Oct 2024 20:39:50 -0700 (PDT)
Received: from dw-tp ([171.76.85.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5ad25cb7asm4873339a91.9.2024.10.21.20.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 20:39:49 -0700 (PDT)
From: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Cc: kasan-dev@googlegroups.com, linux-mm@kvack.org, Marco Elver <elver@google.com>, Alexander Potapenko <glider@google.com>, Heiko
 Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Hari Bathini <hbathini@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Donet Tom <donettom@linux.vnet.ibm.com>, Pavithra Prakash <pavrampu@linux.vnet.ibm.com>, LKML <linux-kernel@vger.kernel.org>, Disha Goel <disgoel@linux.ibm.com>
Subject: Re: [PATCH v3 01/12] powerpc: mm/fault: Fix kfence page fault reporting
In-Reply-To: <87plnsoo2y.fsf@mail.lhotse>
Date: Tue, 22 Oct 2024 08:39:05 +0530
Message-ID: <87o73cygtq.fsf@gmail.com>
References: <cover.1729271995.git.ritesh.list@gmail.com> <a411788081d50e3b136c6270471e35aba3dfafa3.1729271995.git.ritesh.list@gmail.com> <87plnsoo2y.fsf@mail.lhotse>
X-Spam-Status: No, score=3.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

> Hi Ritesh,
>
> "Ritesh Harjani (IBM)" <ritesh.list@gmail.com> writes:
>> copy_from_kernel_nofault() can be called when doing read of /proc/kcore.
>> /proc/kcore can have some unmapped kfence objects which when read via
>> copy_from_kernel_nofault() can cause page faults. Since *_nofault()
>> functions define their own fixup table for handling fault, use that
>> instead of asking kfence to handle such faults.
>>
>> Hence we search the exception tables for the nip which generated the
>> fault. If there is an entry then we let the fixup table handler handle the
>> page fault by returning an error from within ___do_page_fault().
>>
>> This can be easily triggered if someone tries to do dd from /proc/kcore.
>> dd if=/proc/kcore of=/dev/null bs=1M
>>
>> <some example false negatives>
>> ===============================
>> BUG: KFENCE: invalid read in copy_from_kernel_nofault+0xb0/0x1c8
>> Invalid read at 0x000000004f749d2e:
>>  copy_from_kernel_nofault+0xb0/0x1c8
>>  0xc0000000057f7950
>>  read_kcore_iter+0x41c/0x9ac
>>  proc_reg_read_iter+0xe4/0x16c
>>  vfs_read+0x2e4/0x3b0
>>  ksys_read+0x88/0x154
>>  system_call_exception+0x124/0x340
>>  system_call_common+0x160/0x2c4
>
> I haven't been able to reproduce this. Can you give some more details on
> the exact machine/kernel-config/setup where you saw this?

w/o this patch I am able to hit this on book3s64 with both Radix and
Hash. I believe these configs should do the job. We should be able to
reproduce it on qemu and/or LPAR or baremetal.

root-> cat .out-ppc/.config |grep -i KFENCE
CONFIG_HAVE_ARCH_KFENCE=y
CONFIG_KFENCE=y
CONFIG_KFENCE_SAMPLE_INTERVAL=100
CONFIG_KFENCE_NUM_OBJECTS=255
# CONFIG_KFENCE_DEFERRABLE is not set
# CONFIG_KFENCE_STATIC_KEYS is not set
CONFIG_KFENCE_STRESS_TEST_FAULTS=0
CONFIG_KFENCE_KUNIT_TEST=y

root-> cat .out-ppc/.config |grep -i KCORE
CONFIG_PROC_KCORE=y

root-> cat .out-ppc/.config |grep -i KUNIT
CONFIG_KFENCE_KUNIT_TEST=y
CONFIG_KUNIT=y
CONFIG_KUNIT_DEFAULT_ENABLED=y


Then doing running dd like below can hit the issue. Maybe let it run for
few mins and see?

~ # dd if=/proc/kcore of=/dev/null bs=1M

Otherwise running this kfence kunit test also can reproduce the same
bug [1]. Above configs have kfence kunit config shown as well which will
run during boot time itself.

[1]: https://lore.kernel.org/linuxppc-dev/210e561f7845697a32de44b643393890f180069f.1729272697.git.ritesh.list@gmail.com/

Note: This was originally reported internally in which the tester was
doing - perf test 'Object code reading'  [2]
[2]: https://github.com/torvalds/linux/blob/master/tools/perf/tests/code-reading.c#L737

Thanks for looking into this. Let me know if this helped.

-ritesh

