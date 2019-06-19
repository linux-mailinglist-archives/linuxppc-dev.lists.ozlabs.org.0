Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1C54B2F5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 09:17:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TGW12qrwzDqlf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 17:17:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="rjbVsfxt"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TGT515J9zDqRp
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 17:16:08 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id bh12so6817151plb.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 00:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=sNH3esuo89MvVnkmn0pBqZBXKoLraPEAQm1KehvPJ+A=;
 b=rjbVsfxt9ERQsJXWee+b5RBgj6pFFU/IJp7Cj3eX9eC9jBjMnzteAgKHvn/24xy9f6
 h2XDU1eS1RkeOKM2zMnm/xgaQUmlejdoNBZTTqRlo2HE5WsNSGX/D3N9d4mKF8po7WDr
 t8PwQEUIOrTHiychpBhRpTl39fhcgOxxfcUBtNFoeMWJDD4fwMLToYaB6q5FOBlceNVy
 xNlcGaULm9R1xKuigoLTcQWwDk06EpI+L6fBwkzUeMbqh2C5giP0oYmUBenJt1gM9pRD
 MvwgUIjaWr/EMSKV5b4KYssnIXwkzKRgtDKnwfA85/mCnBYmvVicnXxj/CcAyfwBFbDK
 3TmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=sNH3esuo89MvVnkmn0pBqZBXKoLraPEAQm1KehvPJ+A=;
 b=o6rox7sNkS8EJiTS/ltiY7Mmd8zQWxK80e5i7GfhRGJhm01nevDiPtpI7+IsP+JHMM
 21RpVzp6Wavh5oXGVFhUN4XHR2X1a55gi9tE4jBQoXPpvNvgvQHfaOIjVtKK1GELCWyR
 dl+WEJn0t7oBdSzWw6T2cu62Qh3YUufL2uYGFQpC/qMYN8PGqjHXhXWuBcIWTVhamipQ
 7uFvuYJSomsycAz7q8lGl6YeiDsjTMbnMqdOW3NjzX3N+gg2oE9ja1b6v8f4JIOPw9R6
 0RWKEvxo4Fsv3bVTBHNHqIzWNzc37DCJtQtaWAoyvipgjsQDu+zyyn5Z6xgVD0hYQcNc
 4pvQ==
X-Gm-Message-State: APjAAAU/E2NVc1uzLOHYQYRePi1Fuq4epyXpZ1fJXg2hEQ/4M71FNrfp
 D2lmN4Jwau+RYoNzvMMDX8Q=
X-Google-Smtp-Source: APXvYqznH/Lv//49vNUEP8+M16EK9CA4iLmPTEN5+8c+5GM5h3VHXyjcSWO57rMh5hqlHbGTuV64MA==
X-Received: by 2002:a17:902:e082:: with SMTP id
 cb2mr266867plb.274.1560928565577; 
 Wed, 19 Jun 2019 00:16:05 -0700 (PDT)
Received: from localhost (193-116-92-108.tpgi.com.au. [193.116.92.108])
 by smtp.gmail.com with ESMTPSA id x5sm885939pjp.21.2019.06.19.00.16.03
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 19 Jun 2019 00:16:04 -0700 (PDT)
Date: Wed, 19 Jun 2019 17:10:52 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/7] powerpc/ftrace: Additionally nop out the preceding
 mflr with -mprofile-kernel
To: Masami Hiramatsu <mhiramat@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, "Naveen N. Rao"
 <naveen.n.rao@linux.vnet.ibm.com>, Steven Rostedt <rostedt@goodmis.org>
References: <cover.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <72492bc769cd6f40a536e689fc3195570d07fd5c.1560868106.git.naveen.n.rao@linux.vnet.ibm.com>
 <877e9idum7.fsf@concordia.ellerman.id.au>
In-Reply-To: <877e9idum7.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/0.14.0 (https://github.com/astroidmail/astroid)
Message-Id: <1560927184.kqsg9x9bd1.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman's on June 19, 2019 3:14 pm:
> Hi Naveen,
>=20
> Sorry I meant to reply to this earlier .. :/
>=20
> "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com> writes:
>> With -mprofile-kernel, gcc emits 'mflr r0', followed by 'bl _mcount' to
>> enable function tracing and profiling. So far, with dynamic ftrace, we
>> used to only patch out the branch to _mcount(). However, mflr is
>> executed by the branch unit that can only execute one per cycle on
>> POWER9 and shared with branches, so it would be nice to avoid it where
>> possible.
>>
>> We cannot simply nop out the mflr either. When enabling function
>> tracing, there can be a race if tracing is enabled when some thread was
>> interrupted after executing a nop'ed out mflr. In this case, the thread
>> would execute the now-patched-in branch to _mcount() without having
>> executed the preceding mflr.
>>
>> To solve this, we now enable function tracing in 2 steps: patch in the
>> mflr instruction, use synchronize_rcu_tasks() to ensure all existing
>> threads make progress, and then patch in the branch to _mcount(). We
>> override ftrace_replace_code() with a powerpc64 variant for this
>> purpose.
>=20
> According to the ISA we're not allowed to patch mflr at runtime. See the
> section on "CMODX".

According to "quasi patch class" engineering note, we can patch
anything with a preferred nop. But that's written as an optional
facility, which we don't have a feature to test for.

>=20
> I'm also not convinced the ordering between the two patches is
> guaranteed by the ISA, given that there's possibly no isync on the other
> CPU.

Will they go through a context synchronizing event?

synchronize_rcu_tasks() should ensure a thread is scheduled away, but
I'm not actually sure it guarantees CSI if it's kernel->kernel. Could
do a smp_call_function to do the isync on each CPU to be sure.

Thanks,
Nick

=
