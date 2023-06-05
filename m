Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CDA57231FB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Jun 2023 23:12:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZmXH1clLz3f0V
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 07:12:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HQ7E4KTQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035; helo=mail-pj1-x1035.google.com; envelope-from=nadav.amit@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=HQ7E4KTQ;
	dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com [IPv6:2607:f8b0:4864:20::1035])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZmWN5DBgz3f0P
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 07:11:43 +1000 (AEST)
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-256e1d87998so4553235a91.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Jun 2023 14:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685999501; x=1688591501;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zh4jJxTAKzbJ9SX27hDt/5kPD49tOPRL7suMPY4/khA=;
        b=HQ7E4KTQocAnFq6ymEbiyQe+71wz1QqkMTqstF6yByE1aQ/3L9xGlsoHE2ty/KmNGx
         kkEIZdBdUpFN5pBuGWGPof3JHvwTsAFbFOBh8LvcbfvZDQcWxan7GhR3qRzMUhCbsynv
         VMO/o8hLS0MUfiw6kmRJdp5TDSqJf1Z98tzNg0TBILGUxmterYeS+YBt+Dmye8jo/cGp
         xxgae6ukPX27OAi5ZxAJI04J0vRi0aYxFh2wrhremSn2C6an+j6jLOUDoZZnWpJAGoFM
         QcM8CesR+0JfQo9SpvdWxAM1li3oZzB0tJjW4MpOn6edHy3LBmjFeUMOqWOY59vgg4DJ
         JYag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685999501; x=1688591501;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zh4jJxTAKzbJ9SX27hDt/5kPD49tOPRL7suMPY4/khA=;
        b=Q/QtJdROSFQFu/l43L7Nz5S0IXbyQDNpxMtl7nJnOuftO2Cb1ytd9448bq00OqLTD6
         9D4X/CwqZz39D4obbea4wy8Q/BMVPbP1tzSNw4AvYdDRmbzy9WWvV4lxF7rT0NQYDiah
         SPcTJz4BmoktmPmYCe4KZSx19wwz36WuL56wgjbkZE4YJj2n2PE64WF4wYwfWdDnF99d
         PQ2Br5FxIustFxde+rkK0s2xGNkwL2F2sDpfKz8zL7FBTJqPfhBZfg9t8jl/TCwpVHN9
         fCcdJhEeWCFqkatAyXC+JOtOVT/9CBvCJUIouJY/xyZS8LjgevIT0sZWg0hU6eEY2WuX
         d3FA==
X-Gm-Message-State: AC+VfDySkxKv0xGlIYDqktO1tcKwk+vWLrDCeq1SoctkvsxnuLwYZjgq
	yDHHeYZmVh8WJcPVR7OcrZE=
X-Google-Smtp-Source: ACHHUZ7ezCBLFh/r5MtsTw99vS986tpwZwM/H7CRc906oLC1p2PgTYZQRvrDYW2mCxZli0+0MYt3BQ==
X-Received: by 2002:a17:90b:1c06:b0:258:9180:1999 with SMTP id oc6-20020a17090b1c0600b0025891801999mr8816659pjb.32.1685999500386;
        Mon, 05 Jun 2023 14:11:40 -0700 (PDT)
Received: from smtpclient.apple (c-24-6-216-183.hsd1.ca.comcast.net. [24.6.216.183])
        by smtp.gmail.com with ESMTPSA id gz18-20020a17090b0ed200b00246f9725ffcsm6255974pjb.33.2023.06.05.14.11.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Jun 2023 14:11:39 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: [PATCH 12/13] x86/jitalloc: prepare to allocate exectuatble
 memory as ROX
From: Nadav Amit <nadav.amit@gmail.com>
In-Reply-To: <88a62f834688ed77d08c778e1e427014cf7d3c1b.camel@intel.com>
Date: Mon, 5 Jun 2023 14:11:26 -0700
Content-Transfer-Encoding: quoted-printable
Message-Id: <B021EE82-9741-4B41-8FF7-91A9336EDD7C@gmail.com>
References: <20230601101257.530867-1-rppt@kernel.org>
 <20230601101257.530867-13-rppt@kernel.org>
 <0f50ac52a5280d924beeb131e6e4717b6ad9fdf7.camel@intel.com>
 <ZHjcr26YskTm+0EF@moria.home.lan>
 <a51c041b61e2916d2b91c990349aabc6cb9836aa.camel@intel.com>
 <ZHjljJfQjhVV/jNS@moria.home.lan>
 <68b8160454518387c53508717ba5ed5545ff0283.camel@intel.com>
 <50D768D7-15BF-43B8-A5FD-220B25595336@gmail.com>
 <20230604225244.65be9103@rorschach.local.home>
 <20230605081143.GA3460@kernel.org>
 <88a62f834688ed77d08c778e1e427014cf7d3c1b.camel@intel.com>
To: "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>
X-Mailer: Apple Mail (2.3731.600.7)
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
Cc: "chenhuacai@kernel.org" <chenhuacai@kernel.org>, "catalin.marinas@arm.com" <catalin.marinas@arm.com>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "song@kernel.org" <song@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, "deller@gmx.de" <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>, "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>, "hca@linux.ibm.com" <hca@linux.ibm.com>, "rostedt@goodmis.org" <rostedt@goodmis.org>, "loongarch@lists.linux.dev" <loongarch@lists.linux.dev>, Thomas Gleixner <tglx@linutronix.de>, Andrew Morton <akpm@linux-foundation.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "tsbogend@alpha.franken.
 de" <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>, "netdev@vger.kernel.org" <netdev@vger.kernel.org>, "kent.overstreet@linux.dev" <kent.overstreet@linux.dev>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dinguyen@kernel.org" <dinguyen@kernel.org>, "mcgrof@kernel.org" <mcgrof@kernel.org>, "palmer@dabbelt.com" <palmer@dabbelt.com>, "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>, "bpf@vger.kernel.org" <bpf@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "davem@davemloft.net" <davem@davemloft.net>, "rppt@kernel.org" <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On Jun 5, 2023, at 9:10 AM, Edgecombe, Rick P =
<rick.p.edgecombe@intel.com> wrote:
>=20
> On Mon, 2023-06-05 at 11:11 +0300, Mike Rapoport wrote:
>> On Sun, Jun 04, 2023 at 10:52:44PM -0400, Steven Rostedt wrote:
>>> On Thu, 1 Jun 2023 16:54:36 -0700
>>> Nadav Amit <nadav.amit@gmail.com> wrote:
>>>=20
>>>>> The way text_poke() is used here, it is creating a new writable
>>>>> alias
>>>>> and flushing it for *each* write to the module (like for each
>>>>> write of
>>>>> an individual relocation, etc). I was just thinking it might
>>>>> warrant
>>>>> some batching or something. =20
>>=20
>>>> I am not advocating to do so, but if you want to have many
>>>> efficient
>>>> writes, perhaps you can just disable CR0.WP. Just saying that if
>>>> you
>>>> are about to write all over the memory, text_poke() does not
>>>> provide
>>>> too much security for the poking thread.
>>=20
>> Heh, this is definitely and easier hack to implement :)
>=20
> I don't know the details, but previously there was some strong dislike
> of CR0.WP toggling. And now there is also the problem of CET. Setting
> CR0.WP=3D0 will #GP if CR4.CET is 1 (as it currently is for kernel =
IBT).
> I guess you might get away with toggling them both in some controlled
> situation, but it might be a lot easier to hack up then to be made
> fully acceptable. It does sound much more efficient though.

Thanks for highlighting this issue. I understand the limitations of
CR0.WP. There is also always the concerns that without CET or other
control flow integrity mechanism, someone would abuse (using ROP/JOP)
functions that clear CR0.WP=E2=80=A6

