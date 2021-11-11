Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A3044D05F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 04:24:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqRsY4h3Qz2yNw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 14:24:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=GFs1PIWa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.15.19; helo=mout.gmx.net; envelope-from=efault@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=GFs1PIWa; 
 dkim-atps=neutral
X-Greylist: delayed 350 seconds by postgrey-1.36 at boromir;
 Thu, 11 Nov 2021 14:23:57 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqRrs4G2sz2xD4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 14:23:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636601026;
 bh=YnlTNGIxb0TctMcI3romfUmhYM4cIj46dGXd8nNdiFA=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=GFs1PIWaoPFvfJuMkNDqxLiHysbQY7Cvh+RoX1AUe9hLmuN5+gNV8r4/wlSu3cuwA
 EcN5Wjg/lRiqcAAHFMzHj3B/4bVSnE4NYaDgcb2Dm/RyEJrqc7yr0uOtoGAxE1HkuW
 cOTjoyaXqx8FEQ9qA63qlfmzJq8C6bb+zAjeP7wg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([212.114.172.107]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MNswE-1n4sv12HCy-00OFiG; Thu, 11
 Nov 2021 04:17:03 +0100
Message-ID: <a7c704c2ae77e430d7f0657c5db664f877263830.camel@gmx.de>
Subject: Re: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
From: Mike Galbraith <efault@gmx.de>
To: Valentin Schneider <valentin.schneider@arm.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Date: Thu, 11 Nov 2021 04:16:58 +0100
In-Reply-To: <20211110202448.4054153-3-valentin.schneider@arm.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-3-valentin.schneider@arm.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:qdKVFo3qUd8POKOz+yc+x/4T44OcjnJV/MAWTG4EkF4hhUSRvqQ
 mUzoLUU1fEtSpidfUhv0y/XvxJ05PaVaIwghabR3cN0QZU3PllhBeGse5gsbZgORgHk0G65
 0YJqU3vKLoBpBV4AOyPaB7kj4As5svKEGAxE1eDJ/pETDTeSYlv4D6x0KqsCLgCRqrsRB1M
 cPmkHNhgrsUG08c9itIpA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:+xPP1Sj2YFQ=:eWs1GGdYK2j+HQaBQjoXBU
 rf/delMG0YupqzC2CLszXMgdLzETGClyJM8+8T9dXqzW6KfE2AsikdyW6pmbL60n22RFN+YY0
 ckyY31NxQfXa20bUILKXLOUslcaqrak5pVPrx6ZurUwN7hzNj1EG/C9Cvgu/NLf2Vq6LEqfJ2
 C0BofSs3Npd4Ggsf6kKJBxjFyqdtC9RkWlEGSsUnHsVeOgadwiqnhz1vpIB4I7kbq8neCGa/q
 kq7V60TxwuaSPaqlIeSfu1SkD98LQqwSI8WGAZGaH25oOOi29hdaGEjLEqsqiP5OAwFy0lVm+
 FWvkYrpE9jSzikxgI4XlQdxFQ+d5WyoI9V7nwcBA0JwSIdOJd03aoW7jQjz8mGOT35AOK0U8W
 g0mWUk1WPht7A8lVSRsUOgmmks86xPa8U0QSZwv2VPl1FQMmjPG8Rtf7R2wTcAYXGx+RQA1Z7
 sjfuSgOJkKIMtmUX9vpynhR82pDbim6OAbrQrLzYyaVTHLWR9oqeQZQHmR2Dd2HPf4gfY87Mq
 LV1DNT/Rc0HUxtsuU16uNn6mGBEF4lRiuMXGzUu3BZ1aMqOWdbo2zjrqM0vfJffY2RBgkpcs4
 qb8dcnzGbWY3b9SmYyTr4rDZjpAf7ntLivMzUFEXp3y4B7YFsPngxRPl2DXwmoS1Vb5UQaLOR
 3Pk+G1Xsh800xGAKAexcD7TaUrFEb3OQbxXiSwit9WUxyjusP92V/IZHbRi/YjsASNGo2M7Py
 +1suOROHnmwWp74ASFwoRd2QpFqSeQ3Z4O3rVwUTefr8aaG7ftDP5nAnDkhCnp5TQUxQHENdc
 JPqLbTITf0ynSgb32qwh0dKpMf84GgOnPLU30zVJaWZfAIo+GzZa5Tt7OeuxsnKp9Z20SbAvl
 vFm2fSONnErnNY3Pmm80/pI9v33a0HcF+rvjpsQrF9TG7/yNwAeq9Im/V67cjbNZRymx/MmX6
 eqAod80sAC85RpijZMQFEdjBItAGcUNUKxiot14ZJBFXzAi7liOPvK2IU1ydOTKxRpAQpXpof
 0RwlA6xu3QizS6irwlh7Xvsd5J6gqNBd6YwnHoQ7kUKVc3A4sG4ApNRAgXAMP/pZn8UV9ckgb
 DlW7OLqM24piiE=
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
Cc: Marco Elver <elver@google.com>, Michal Marek <michal.lkml@markovi.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Paul Mackerras <paulus@samba.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2021-11-10 at 20:24 +0000, Valentin Schneider wrote:
>
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 5f8db54226af..0640d5622496 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -2073,6 +2073,22 @@ static inline void cond_resched_rcu(void)
> =C2=A0#endif
> =C2=A0}
> =C2=A0
> +#ifdef CONFIG_PREEMPT_DYNAMIC
> +
> +extern bool is_preempt_none(void);
> +extern bool is_preempt_voluntary(void);
> +extern bool is_preempt_full(void);
> +
> +#else
> +
> +#define is_preempt_none() IS_ENABLED(CONFIG_PREEMPT_NONE)
> +#define is_preempt_voluntary() IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)
> +#define is_preempt_full() IS_ENABLED(CONFIG_PREEMPT)

I think that should be IS_ENABLED(CONFIG_PREEMPTION), see c1a280b68d4e.

Noticed while applying the series to an RT tree, where tglx
has done that replacement to the powerpc spot your next patch diddles.

	-Mike
