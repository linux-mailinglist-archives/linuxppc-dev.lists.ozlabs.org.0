Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D519B90868C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 10:39:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G6pSYL6c;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0t4c45vVz3ckl
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 18:39:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G6pSYL6c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0t3s0B28z2xjJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 18:39:03 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-705c0115192so1717428b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 01:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718354342; x=1718959142; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGy8Qk7vHjHfh3JaIY/2KaWeJmy159LbqRE46FH8bXg=;
        b=G6pSYL6chXzEqNIQN9dDpB7UUUb3l3ywKyrWKO6i95lvGnKwR9A84WM8CORTKfueoq
         d/3+6s7yQNsz0cOzbysqIjCXPLHNK8pMjvfSRG4e3sQSCx6jNB6LhB8Cu0j00jnxGlNK
         IVOusx5ZtU1+EngaftPq4yg0EcT+D+NBFEI9NW8J6Ql6UfCaSmNiGlBrWJHhlO4KlOZU
         iOHd3lEmCgB7nHnRmQcCyIL896xTskAQpJiWZV0bO6UykgZHCgdGzF/tRiJCS1qn35A8
         T1Vc4o82gtUrqwwRBk4u7l8ljeguJ6y+7JG0PIxs4Ryhd9BGYXExLbfQWAM9YiHN/YkO
         cs7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718354342; x=1718959142;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NGy8Qk7vHjHfh3JaIY/2KaWeJmy159LbqRE46FH8bXg=;
        b=tNh7v+jDW+DYXl+Jr6MiMVdSDl683+4yvWJgimrgYljstYFtIpUwl285YQ+ESeRlBB
         ThZXuonhT6r9KBnxKWqYasI8TcXx0pqz+WEBj1HikJk4yccA82LHa3abxqRkT6L/NX5C
         ATniz0GPG1ts9f1KqIKPxQoz7MRrRnPTUstQggS18RhxFGglUVMga50rXJvDM/lZF75n
         okNIJaac+qufc+o3R9j+D8hLD/eVJAWoGoS1FbMOMHheuC/lclmW0sFllOhWcbE4gE+e
         5bg7w3ihhTztiniYkzhpApYhLQgQvd7uwOP9UUCcp7PKQDPaNNvmugLGgzaFM1ga+GPQ
         /Ugw==
X-Forwarded-Encrypted: i=1; AJvYcCUoPGVo/s8V0/TvOyXNtvGPSZX/FUwuy4CCwl5Xu7fBMqaZy6SDDwbURq0XtyCWz2MZTAP9+46oe0mr8c5Oe6abNgfYJtx4BSX/WrKTzQ==
X-Gm-Message-State: AOJu0YzpW9P2HmkSMPsdEOOafRZqGedUMKaqLLyIWRHa/yiFjz8cZoTJ
	hfCHHzkcXRtT7hUp/DqA5CIWkaeE+Ap90fpksPREvTC8u+hqliHY
X-Google-Smtp-Source: AGHT+IE6pXW+ie68+vtXwkMfCghwPmHr4/AQacJLhgnTEyIreahfjP48hPsxIsT9zufhQ8cyfHE9eg==
X-Received: by 2002:a05:6a21:81a9:b0:1b5:69cd:87c with SMTP id adf61e73a8af0-1bae7e88366mr2104777637.27.1718354341640;
        Fri, 14 Jun 2024 01:39:01 -0700 (PDT)
Received: from localhost (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c4a769beb8sm5500935a91.41.2024.06.14.01.38.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jun 2024 01:39:01 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Jun 2024 18:38:54 +1000
Message-Id: <D1ZLRVNGPWTV.5H76A3E8DJCV@gmail.com>
Subject: Re: [kvm-unit-tests PATCH] build: retain intermediate .aux.o
 targets
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Segher Boessenkool" <segher@kernel.crashing.org>
X-Mailer: aerc 0.17.0
References: <20240612044234.212156-1-npiggin@gmail.com>
 <20240612082847.GG19790@gate.crashing.org>
 <D1ZBO021MLHV.3C7E4V3WOHO8V@gmail.com>
 <20240614010856.GK19790@gate.crashing.org>
In-Reply-To: <20240614010856.GK19790@gate.crashing.org>
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
Cc: linux-s390@vger.kernel.org, Thomas Huth <thuth@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Jun 14, 2024 at 11:08 AM AEST, Segher Boessenkool wrote:
> On Fri, Jun 14, 2024 at 10:43:39AM +1000, Nicholas Piggin wrote:
> > On Wed Jun 12, 2024 at 6:28 PM AEST, Segher Boessenkool wrote:
> > > On Wed, Jun 12, 2024 at 02:42:32PM +1000, Nicholas Piggin wrote:
> > > > arm, powerpc, riscv, build .aux.o targets with implicit pattern rul=
es
> > > > in dependency chains that cause them to be made as intermediate fil=
es,
> > > > which get removed when make finishes. This results in unnecessary
> > > > partial rebuilds. If make is run again, this time the .aux.o target=
s
> > > > are not intermediate, possibly due to being made via different
> > > > dependencies.
> > > >=20
> > > > Adding .aux.o files to .PRECIOUS prevents them being removed and so=
lves
> > > > the rebuild problem.
> > > >=20
> > > > s390x does not have the problem because .SECONDARY prevents dependa=
ncies
> > > > from being built as intermediate. However the same change is made f=
or
> > > > s390x, for consistency.
> > >
> > > This is exactly what .SECONDARY is for, as its documentation says,
> > > even.  Wouldn't it be better to just add a .SECONDARY to the other
> > > targets as well?
> >=20
> > Yeah we were debating that and agreed .PRECIOUS may not be the
> > cleanest fix but since we already use that it's okay for a
> > minimal fix.
>
> But why add it to s390x then?  It is not a fix there at all!

Eh, not a big deal. I mentioned that in the changelog it doesn't seem to
pracicaly fix something. And I rather the makefiles converge as much as
possible rather than diverge more.

.SECONDARY was added independently and not to fix this problem in
s390x. And s390x has .SECONDARY slightly wrong AFAIKS. It mentions
.SECONDARY: twice in a way that looks like it was meant to depend on
specific targets, it actually gives it no dependencies and the
resulting semantics are that all intermediate files in the build are
treated as secondary. So somethig there should be cleaned up. If the
.SECONDARY was changed to only depend on the .gobj and .hdr.obj then
suddenly that would break .aux.o if I don't make the change.

So I'm meaning to work out what to do with all that, i.e., whether to
add blanket .SECONDARY for all and trim or remove the .PRECIOUS files,
or remove s390x's secondary, or make it more specific, or something
else. But it takes a while for me to do makefile work.

Thanks,
Nick
