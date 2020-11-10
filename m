Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 872392AD1D8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 09:52:34 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CVhSv6JXzzDqly
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Nov 2020 19:52:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=i3lwd15n; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CVhQ04cKnzDqSr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 19:49:58 +1100 (AEDT)
Received: by mail-pf1-x444.google.com with SMTP id c66so5072738pfa.4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Nov 2020 00:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=jM6DQjFrek/ky2AN+O83fTD18sV5bqwNPZWmE7tg5oQ=;
 b=i3lwd15nDO296Mn08G0ToydMRQfmdQG0hWcyQEbW3M2Zm9jnFAw6CczK0lQjiZM1zE
 FecnSC4Tg/XtNnZlxIprxBHZn9R3lOho4TUWZLf8GFavrb+85DmXhOjahIz9XS0/lR11
 xsVBBGsD+0kw1fkbEbxirqUy+hsVim4TsBjkfdlI9jPCsxDzx4u6JLcbv6tEFjUIZbDw
 ujlX/CMNJBVXaDZwp7LqHz7l0EWzIhHaIs4oWwN2F4Gw9ERv+Vk2h4jLnqOQvUPQe05X
 z0WT8u/UxqmMR6q5pw2Vp4dFz/UheLrxnpaw1RoHq7Z00VusmI4qFL04lpWnNSxs8b0r
 MiEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=jM6DQjFrek/ky2AN+O83fTD18sV5bqwNPZWmE7tg5oQ=;
 b=h0IP2NsYdsjQfGP58wjNJkGb6v5nhZ12L8iYIZa1rXOr2biBiEDkDDGxtVy9txR4he
 SpsDOPXT+xm5mL+ikiT4YfvGmqzi4ItsP5yX+yjP5m0HEcZ4NyXRgv/PkE9oSgK4xUl6
 WELNC+K9DoC++tp14Mr7nhWQJzIIQ5/jU04vzvlw2Qx/HluJZKb8eR54ledI8cZnN1dz
 18eKHdq3V1TfnmWdQxljqqGrdOlpCZoqMKhseBo4EKanD/J5ulVvmlzwNhM+34myaNdr
 xib4f4jFamwb3SImB4E0sBkUVueZc07HJz5wFigakSp0Kq2VpZb8zFCAVF/upTFUYepw
 ZuTQ==
X-Gm-Message-State: AOAM532+fi40g4bijvpwEyLOk4A89vrG2uLjXTIDfMGRT8Pt7iuzXkMo
 6B7ayatCEdpqe2vZ5evm4+NDG3i04Gg=
X-Google-Smtp-Source: ABdhPJyiFOcyTImj2YFHWqoHE8XM7UjX7gh9ni8l3GRRDY70G98neg4IlBK8NsnMrUCONGQ+ntGwXQ==
X-Received: by 2002:a63:221d:: with SMTP id i29mr16305619pgi.69.1604998196797; 
 Tue, 10 Nov 2020 00:49:56 -0800 (PST)
Received: from localhost (27-32-36-31.tpgi.com.au. [27.32.36.31])
 by smtp.gmail.com with ESMTPSA id q8sm947343pjy.3.2020.11.10.00.49.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 00:49:56 -0800 (PST)
Date: Tue, 10 Nov 2020 18:49:50 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 0/9] powerpc/64s: fast interrupt exit
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20201106155929.2246055-1-npiggin@gmail.com>
 <fdde16b8-2bb4-f6a2-3c29-61d0169453cf@csgroup.eu>
In-Reply-To: <fdde16b8-2bb4-f6a2-3c29-61d0169453cf@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1604997971.w6spl33ij0.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of November 7, 2020 8:35 pm:
>=20
>=20
> Le 06/11/2020 =C3=A0 16:59, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This series attempts to improve the speed of interrupts and system calls
>> in two major ways.
>>=20
>> Firstly, the SRR/HSRR registers do not need to be reloaded if they were
>> not used or clobbered fur the duration of the interrupt.
>>=20
>> Secondly, an alternate return location facility is added for soft-masked
>> asynchronous interrupts and then that's used to set everything up for
>> return without having to disable MSR RI or EE.
>>=20
>> After this series, the entire system call / interrupt handler fast path
>> executes no mtsprs and one mtmsrd to enable interrupts initially, and
>> the system call vectored path doesn't even need to do that.
>=20
> Interesting series.
>=20
> Unfortunately, can't be done on PPC32 (at least on non bookE), because it=
 would mean mapping kernel=20
> at 0 instead of 0xC0000000. Not sure libc would like it, and anyway it wo=
uld be an issue for=20
> catching NULL pointer dereferencing, unless we use page tables instead of=
 BATs to map kernel mem,=20
> which would be serious performance cut.

Hmm, why would you have to map at 0?

PPC32 doesn't have soft mask interrupts, but you could still test all=20
MSR[PR]=3D0 interrupts to see if they land inside some region to see if
they hit in the restart table I think?

Could PPC32 skip the SRR reload at least? That's simpler.

Thanks,
Nick
