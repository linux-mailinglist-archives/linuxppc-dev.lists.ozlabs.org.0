Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 629D044D07B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 04:43:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqSGp1nqyz2ynQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 14:42:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=FCiuetgn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.de
 (client-ip=212.227.17.20; helo=mout.gmx.net; envelope-from=efault@gmx.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=FCiuetgn; 
 dkim-atps=neutral
X-Greylist: delayed 344 seconds by postgrey-1.36 at boromir;
 Thu, 11 Nov 2021 14:42:20 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqSG44drWz2yLd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 14:42:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1636602131;
 bh=+K8Pws57ECthHaz3IU9isSEu+78rlyPTi2Ia/AIqnIU=;
 h=X-UI-Sender-Class:Subject:From:To:Cc:Date:In-Reply-To:References;
 b=FCiuetgnLa/x7DM4vjWBavRjUDvC3jyL6gH632P/g6igd3MeraG2UHEwe8F/BMObq
 uzh8Li+kLd8983P3hjTT5loRxyFQfPTNCFuqkc+aaWpsRG7kRSK5fJsEWy5qtbarsg
 ejxnme3kXXhP3vNQjo++uM9YvH+E3KR8EI2kLGt0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from homer.fritz.box ([212.114.172.107]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MV67y-1nAxUc3DDa-00S6B4; Thu, 11
 Nov 2021 04:35:44 +0100
Message-ID: <803a905890530ea1b86db6ac45bd1fd940cf0ac3.camel@gmx.de>
Subject: Re: [PATCH v2 2/5] preempt/dynamic: Introduce preempt mode accessors
From: Mike Galbraith <efault@gmx.de>
To: Valentin Schneider <valentin.schneider@arm.com>, 
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
 linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Date: Thu, 11 Nov 2021 04:35:39 +0100
In-Reply-To: <a7c704c2ae77e430d7f0657c5db664f877263830.camel@gmx.de>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-3-valentin.schneider@arm.com>
 <a7c704c2ae77e430d7f0657c5db664f877263830.camel@gmx.de>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.0 
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m5Cbra52DdXMAE7H+VG8AT7kX3qlvfgdfpx6gGyNLbPdqVV0j9i
 pqzgjniLDEtfh+GNR7V7YSZ1CReg05G3m1fkgnm9KcORv5LF22UU7ZiSxoWjxnlG4T3f68i
 XuDCvFG+2//qny6q6ZpXwZsJrPVLYHdDi/3SO9LVn3FgF7eJmr1NNUTbMSzhK4R5tO9M4Az
 tNyjyk0ii+TyMFksaQtAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6RhPmCEBFAE=:X1rxfzt21njscpLPt4/dzj
 3MSb4cxGTjXFNzurzQx8Jbg5p5ZF0s93KAI0OtwH8X9oXOChTv3TIOucFbSv/dfJZuOfcLGdL
 JCKJEqUWEHU2evoq7dt7Z1rSCUI9M9L62q6oxjO42Gg+KTyhLrGBcyOlWVKtg+etv/zQFk4j1
 bNcS7IpoIbtLgKJ8dCHC0YNIIte2NpqmS5NaX4CRfZTEzwNObLCUv3fwe16D91X2bBHuYDkDU
 iTNYp+f0IMG4sWrT4oPJ7HOSbYdqZtx/YHNw08vCmtNPRX+hAZ631ytQ8+O/QNzzUc1CAsqSU
 saiyASNozQhe8AO96rzwmd7YintFc+bAbvgjxXyfYpwrZJaj+Pkflk42pLpL2OEFMwnDukPTy
 zdB4+t4j6ID5HbcMiL1Md4PsFJceTGPA/ktZz7u7vt7ZyPfc6jYwQ/OnuwlKNURiZ1NT9yixW
 7uXj1SLuo1tCkaNby7SuX1ai+p6xXmpVCxDn4GodvsfjrlU0+JjgMP91lUvka+2O2McMFsd7V
 F978o9frPrITzD6okvz1qPgwfpzd2J+76waT2sW7FOBLO0+zZaNdgcTes0xsEP7vAvs08aNqZ
 cflFHQhde3nU6OfejtJAhJY05A3qZtT7cKvGVgocG9rjyiI5Lr5T+3b6mz4JvbMQbLgM6MXNo
 B5rxQWcf3A9Oq6nuuHFYtE4js5JIn5TZROQpLzqMMeCUsx4QuPPha30AFdaEaImrrBXAWQlFR
 BQAdxdv+1cU3He4KK/1gEpCv8igMJkWxXprimZQrqilQZUiq3HMMyoti7CLr98zrtb/ilFuX7
 F93HSUfeGr5J4HUuzyLSH/neRUNeY7bbILuJl6DnjAGAg3IoAksHHNt09i97ttBtbPDqmuhAV
 I47rnXVKGlkhpdYp+K1YE7NUfzEpBXubvyAEmtdnumeMjK3dT+hrC1suOmTuzWeGSZbakPqDE
 q1mG9L3nF1U797FG4OI2UVGY5ZIpIegg/apTX3Oa/6LDfgrbhMHWAKxbDv34GASquiu49pVMV
 R921TgULFvJEsP+dQ5Op0MoIvvMRSPOyQY2dKZTMHRGl28xNn8yAg05Fg/G2U2wLgGZImvtN0
 ULbaqMOcll2EB4=
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

On Thu, 2021-11-11 at 04:16 +0100, Mike Galbraith wrote:
> On Wed, 2021-11-10 at 20:24 +0000, Valentin Schneider wrote:
> >
> > diff --git a/include/linux/sched.h b/include/linux/sched.h
> > index 5f8db54226af..0640d5622496 100644
> > --- a/include/linux/sched.h
> > +++ b/include/linux/sched.h
> > @@ -2073,6 +2073,22 @@ static inline void cond_resched_rcu(void)
> > =C2=A0#endif
> > =C2=A0}
> > =C2=A0
> > +#ifdef CONFIG_PREEMPT_DYNAMIC
> > +
> > +extern bool is_preempt_none(void);
> > +extern bool is_preempt_voluntary(void);
> > +extern bool is_preempt_full(void);
> > +
> > +#else
> > +
> > +#define is_preempt_none() IS_ENABLED(CONFIG_PREEMPT_NONE)
> > +#define is_preempt_voluntary()
> > IS_ENABLED(CONFIG_PREEMPT_VOLUNTARY)
> > +#define is_preempt_full() IS_ENABLED(CONFIG_PREEMPT)
>
> I think that should be IS_ENABLED(CONFIG_PREEMPTION), see
> c1a280b68d4e.
>
> Noticed while applying the series to an RT tree, where tglx
> has done that replacement to the powerpc spot your next patch
> diddles.

Damn, then comes patch 5 properly differentiating PREEMPT/PREEMPT_RT.

	-Mike

