Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C57AF719052
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 04:03:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QWqCv2MYrz3dtR
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 12:03:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iVM+pWfO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QWqC3031tz30QQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Jun 2023 12:02:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=iVM+pWfO;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QWqBz5Fkpz4x42;
	Thu,  1 Jun 2023 12:02:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1685584941;
	bh=EKqPUa5BbsNp2IS+PVeURMLivGy9/PqofQB8JVPKzHk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=iVM+pWfOIbhHL9f9DmsNTYSYsnsKADtZjQT9IBkW+solKs/5jaM7HmHXujPBPR3sR
	 wMMXiW8q5QUIc2tF+b7pContzFBOjsvsrQZp+PB993f8ACrE562bCVTAPxc4nHPlVT
	 1JaDyr37YE8RGysSYBHCWpx6blwoqIhVENU7L02HS4t35C05grIv/jnerzHXtBFxkr
	 LlFZ4pTbtpMi1kzvCtW/E0KSPxtdyhZedudAUHM4yCfBKpWkN+tj7x/zD6gocR2QVp
	 hI0nknDZgWcSY2pAmQYBBAJ+nUybSxOQcns2PjvlZPakzmphOIgWmf3ANOTX/gtTkW
	 24NljidWcxz/Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Maninder Singh
 <maninder1.s@samsung.com>
Subject: Re: [PATCH 2/2] powerpc/xmon: use KSYM_NAME_LEN in array size
In-Reply-To: <CANiq72=QeTgtZL4k9=4CJP6C_Hv=rh3fsn3B9S3KFoPXkyWk3w@mail.gmail.com>
References: <CGME20230529111404epcas5p2d540d726dcf3e21aae2a6a0958e2eea5@epcas5p2.samsung.com>
 <20230529111337.352990-1-maninder1.s@samsung.com>
 <20230529111337.352990-2-maninder1.s@samsung.com>
 <CANiq72=QeTgtZL4k9=4CJP6C_Hv=rh3fsn3B9S3KFoPXkyWk3w@mail.gmail.com>
Date: Thu, 01 Jun 2023 12:02:16 +1000
Message-ID: <87ilc8ym6v.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: nathanl@linux.ibm.com, bcain@quicinc.com, keescook@chromium.org, gary@garyguo.net, pmladek@suse.com, linux-hexagon@vger.kernel.org, ustavoars@kernel.org, linux-kernel@vger.kernel.org, Onkarnath <onkarnath.1@samsung.com>, wedsonaf@google.com, npiggin@gmail.com, alex.gaynor@gmail.com, ojeda@kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:
> On Mon, May 29, 2023 at 1:14=E2=80=AFPM Maninder Singh <maninder1.s@samsu=
ng.com> wrote:
>>
>> +static char tmpstr[KSYM_NAME_LEN];
>
> Reviewed-by: Miguel Ojeda <ojeda@kernel.org>
>
> Side-note: in `get_function_bounds()`, I see `kallsyms_lookup()` being
> used, but the name seems discarded? Can
> `kallsyms_lookup_size_offset()` be used instead, thus avoiding the
> usage of the buffer there to begin with?

A few lines below it uses the modname, and AFAICS there's no (easy) way
to lookup the modname without also looking up the name.

> Side-note 2: in `scanhex()`, I see a loop `i<63` using `tmpstr` which
> then is used to do a `kallsyms_lookup_name()`, so I guess symbols
> larger than 64 couldn't be found. I have no idea about what are the
> external constraints here, but perhaps it is possible to increase the
> `line` buffer etc. to then allow for bigger symbols to be found.

Yeah that looks wrong. I don't see any symbols that long in current
kernels, but we should fix it.

Thanks for looking.

cheers
