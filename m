Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E00C30960F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Jan 2021 15:53:59 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DScfX4YtvzDqhY
	for <lists+linuxppc-dev@lfdr.de>; Sun, 31 Jan 2021 01:53:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b;
 helo=mail-pj1-x102b.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rs4FBn3E; dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DSb695NDNzDrBs
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 31 Jan 2021 00:44:16 +1100 (AEDT)
Received: by mail-pj1-x102b.google.com with SMTP id p15so7254205pjv.3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Jan 2021 05:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=UAboT/GabEbo58MyOirSfbzov9bh7nr57h/tHqkGk8U=;
 b=rs4FBn3EUx1wIYVYZQ9ush/iT+FTVOOlG6vvNLY3M8gx7HSiTvUODmVnGoXX5UIu0+
 P65UQcQVoXjAcJUn137qumMHAlS3qUxKfjRf/cqHi4UJhcbJJmI/hKc5OztcSw/JibK3
 iAhhAhQzjyi2G9C0Z6tTpLxpYvMyAzCpxtX3s9jJ2Xz3Mx2pjHfWRPpcwSTAi2mtmbhm
 MMy66+mUYywqPK8xL1MrKsUaBUi3lUqUq3twZDIN1Qj6Sbnl1Ef+eKgGjY/1ejqSrrIx
 Q2BkBYlKIY8ELfIqpDNzc0WEhIVsFGpvMRVEHzJtwdXq0cXFU7GfH+Li/8taXlVUB1zw
 3sGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=UAboT/GabEbo58MyOirSfbzov9bh7nr57h/tHqkGk8U=;
 b=guI29K0Bq62Jh5fe7UfZneELGGIAhQ6mpuk+UzLUuAK1W3I8ae/i6AFSuj9KxYirl2
 4tOLGQqvxI5GdlCgENIU9FU+yWCITEcLNK/YU33nC352SUiXzMAQa4tyakcHSzSx0PGY
 8tvWc0eOWT52DDF70jtAvQCC6QQmJ+Iq1YIDjcAbrs/0kGhf0tJ9HhLUEK7scHNZOj4Y
 g/LtfkPoj7X8Dl0GnsrLGp/1e/j0pYtrBweVpskyukJjnyBtbXUo8vEq4wk9Oy0kljG7
 k2C2Z2zOD1n07dqmFa7g870pnfSqvTZEyFY+U31Yy33YGU/usoAThKspj5I2q87YKuKo
 Gmzw==
X-Gm-Message-State: AOAM531jajT8wZOZjKbQjS30Y0fgo1C0eoSCSt8dYsx/jZ3KeFJBGfFT
 YMcS4QKHxKFwVJVqrtPwHpX14nYudp8=
X-Google-Smtp-Source: ABdhPJwN/WNjbO6P+Z62Ysst7yLF1sarutUc7hheAmQxTcJzNvs5UEavRjtorzraCFhAnF2D+VqyZA==
X-Received: by 2002:a17:902:b7cc:b029:de:4450:ef9e with SMTP id
 v12-20020a170902b7ccb02900de4450ef9emr9689436plz.23.1612014254436; 
 Sat, 30 Jan 2021 05:44:14 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id k31sm12678720pgi.5.2021.01.30.05.44.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jan 2021 05:44:14 -0800 (PST)
Date: Sat, 30 Jan 2021 23:44:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc64/idle: Fix SP offsets when saving GPRs
To: "Christopher M. Riedl" <cmr@codefail.de>, linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210130030430.11369-1-cmr@codefail.de>
 <87o8h6d5jg.fsf@mpe.ellerman.id.au>
In-Reply-To: <87o8h6d5jg.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Message-Id: <1612014056.e1qcnzac7c.astroid@bobo.none>
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

Excerpts from Michael Ellerman's message of January 30, 2021 9:32 pm:
> "Christopher M. Riedl" <cmr@codefail.de> writes:
>> The idle entry/exit code saves/restores GPRs in the stack "red zone"
>> (Protected Zone according to PowerPC64 ELF ABI v2). However, the offset
>> used for the first GPR is incorrect and overwrites the back chain - the
>> Protected Zone actually starts below the current SP. In practice this is
>> probably not an issue, but it's still incorrect so fix it.
>=20
> Nice catch.
>=20
> Corrupting the back chain means you can't backtrace from there, which
> could be confusing for debugging one day.

Yeah, we seem to have got away without noticing because the CPU will=20
wake up and return out of here before it tries to unwind the stack,
but if you tried to walk it by hand if the CPU got stuck in idle or=20
something, then we'd get confused.

> It does make me wonder why we don't just create a stack frame and use
> the normal macros? It would use a bit more stack space, but we shouldn't
> be short of stack space when going idle.
>=20
> Nick, was there a particular reason for using the red zone?

I don't recall a particular reason, I think a normal stack frame is=20
probably a good idea.

Thanks,
Nick

