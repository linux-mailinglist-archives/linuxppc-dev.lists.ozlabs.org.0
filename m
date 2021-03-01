Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9763275A5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 01:47:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DphSN3wxhz3cPS
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Mar 2021 11:47:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=MAzvGp6l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432;
 helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=MAzvGp6l; dkim-atps=neutral
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DphRx3tRpz30Ll
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Mar 2021 11:47:24 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id m6so10365747pfk.1
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Feb 2021 16:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=yv1f7JvzuY4iaeAXcL/DD3nC6c6jzIMPPaqgYIuWWes=;
 b=MAzvGp6lbeKZpon8Wd4LKsyk2/UvhKKRXkBENdqKRLK66XcBCJL8PWiOduFsvidKHW
 60DD8YW5FgE1aoaDooYXqocSIdOak8t90q6sIHH6IQGg+m6fDitg/IGy8hp3kYjUagCH
 7hSPERVUYxKxE2k4/R8zV/1kojl+/H4NJr08tbyN4Rr84EQy+x6gBY5dnFoAf6QWCAuU
 w5FG1+b56+Nwu7yVm+P0+WhntDIb1WjKwGAlIF+kJUXEc/Jg1YAbCN3E/ODb/LSvcSjF
 rmvBJGCfjIoS1y0owXGLwgPFhqCMyrBbc/LdvBaTardp6+FnyA9JddUihpkIH1/uj7gi
 OPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=yv1f7JvzuY4iaeAXcL/DD3nC6c6jzIMPPaqgYIuWWes=;
 b=HMgHG2X2hV7cb8Q0CWvkY2IVCOfHVEkwDVkOXDJ0Augafo13F3BdWjmPb/3ERJncpm
 54Xo3UUetvoLBw5lUzfYtLDJVPJ4Som7iAOUIRTFCFLFdBctPO/Oy56oOhu9tfgMiBVv
 bRKa5XC/6F80/xkaVyyjZM6voPcTQZ9dIIniUh1QmePmL+E+qccMNDjKMseOWDvBWtHG
 kl+7EYHP6Xcma2kX2QonwB7UGiAL3JW7/g6nzHtG9i020W4OpNOU68QiKHEBpoSpZsdH
 6umnLC/50eridGWcPYbgzc7nvXgbR+OWHPFfm7nXRjto97E8GwkTT8Y2+XFOJUihdxj6
 1XEA==
X-Gm-Message-State: AOAM533jZb4/5d92xpiGVLAqv7gPCVS7IrSzvJ54l4W0mMq8NQ2rQRCy
 lEqCVK5oX7aAlL93LKEGOK4=
X-Google-Smtp-Source: ABdhPJz9vAw22UgRBQ3YqfGl9KQVJvPimFZO/yeeIb0kidNCkPf5p/TOZeEK950KKQeQPv/4HWBJGw==
X-Received: by 2002:aa7:80c6:0:b029:1b6:92ae:a199 with SMTP id
 a6-20020aa780c60000b02901b692aea199mr12499600pfn.71.1614559638835; 
 Sun, 28 Feb 2021 16:47:18 -0800 (PST)
Received: from localhost (58-6-239-121.tpgi.com.au. [58.6.239.121])
 by smtp.gmail.com with ESMTPSA id a23sm15414654pfk.80.2021.02.28.16.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 16:47:17 -0800 (PST)
Date: Mon, 01 Mar 2021 10:47:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 28/32] powerpc/64s: interrupt implement exit logic in C
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 linuxppc-dev@lists.ozlabs.org
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-29-npiggin@gmail.com>
 <bc4ec2c0-28e5-4004-d1eb-54058a699af4@csgroup.eu>
In-Reply-To: <bc4ec2c0-28e5-4004-d1eb-54058a699af4@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1614559348.1mt70y0fhi.astroid@bobo.none>
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
Cc: Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 27, 2021 8:07 pm:
>=20
>=20
> Le 25/02/2020 =C3=A0 18:35, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Implement the bulk of interrupt return logic in C. The asm return code
>> must handle a few cases: restoring full GPRs, and emulating stack store.
>>=20
>> The stack store emulation is significantly simplfied, rather than creati=
ng
>> a new return frame and switching to that before performing the store, it
>> uses the PACA to keep a scratch register around to perform thestore.
>>=20
>> The asm return code is moved into 64e for now. The new logic has made
>> allowance for 64e, but I don't have a full environment that works well
>> to test it, and even booting in emulated qemu is not great for stress
>> testing. 64e shouldn't be too far off working with this, given a bit
>> more testing and auditing of the logic.
>>=20
>> This is slightly faster on a POWER9 (page fault speed increases about
>> 1.1%), probably due to reduced mtmsrd.
>=20
>=20
> This series, and especially this patch has added a awfull number of BUG_O=
N() traps.
>=20
> We have an issue open at https://github.com/linuxppc/issues/issues/88 sin=
ce 2017 for reducing the=20
> number of BUG_ON()s
>=20
> And the kernel Documentation is explicit on the willingness to deprecate =
BUG_ON(), see=20
> https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=
=3Dbug_on :
>=20
> BUG() and BUG_ON()
> Use WARN() and WARN_ON() instead, and handle the =E2=80=9Cimpossible=E2=
=80=9D error condition as gracefully as=20
> possible. While the BUG()-family of APIs were originally designed to act =
as an =E2=80=9Cimpossible=20
> situation=E2=80=9D assert and to kill a kernel thread =E2=80=9Csafely=E2=
=80=9D, they turn out to just be too risky. (e.g.=20
> =E2=80=9CIn what order do locks need to be released? Have various states =
been restored?=E2=80=9D) Very commonly,=20
> using BUG() will destabilize a system or entirely break it, which makes i=
t impossible to debug or=20
> even get viable crash reports. Linus has very strong feelings about this.
>=20
> So ... can we do something cleaner with all the BUG_ON()s recently added =
?

Yeah you're right. Some of it is probably overkill due to paranoia when=20
developing the series.

Now we have a bit more confidence we could probably look at cutting down=20
on these.

I do get a bit concerned about detecting a problem in some code like=20
this and attempting to just continue, it usually means the system is=20
going to crash pretty badly anyway (and the WARN_ON trap interrupt is
probably going to finish you off anyway). So I think removing the more
obvious checks entirely (maybe with a PPC DEBUG config option) is the
right way to go.

Thanks,
Nick
