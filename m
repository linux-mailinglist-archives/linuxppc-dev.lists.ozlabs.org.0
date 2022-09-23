Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 677335E7FBE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 18:27:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYyHG22ykz3cj9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 24 Sep 2022 02:27:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SAiDToSa;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::433; helo=mail-pf1-x433.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=SAiDToSa;
	dkim-atps=neutral
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYyGZ3n0Lz3c7t
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 24 Sep 2022 02:27:01 +1000 (AEST)
Received: by mail-pf1-x433.google.com with SMTP id a29so644590pfk.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 09:27:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date;
        bh=IyPY3jNYz1zmj8hC2XWs0gtCQLKsELDuACeXIEucHZQ=;
        b=SAiDToSaHfqFgiQllB+souznfy9cjE7uiCVxu/+FJGJpgekfLf+2ETQzw13CSxgE4W
         D9ntvAOYdxO6PUNeuaeN40fQ4wwK3Q7qFil1G2HjPAjEl/oDTiogBRI0dFZHgn8DBEYk
         2PqoiKAmgBVn3F2ho+OFCFsKsc3GJ9QLxaBNFeUiOBw0jr7nSGrD8ubD1OaH5K/l9z1H
         rrCK58W+ULROUGDf5NfcudRKbLBDelMEql+ZTk6M7dL6LmEauMKa3/RZBKF8ZxLsAqUF
         kNqQqWZjcPTpikk+isWJ+fFvgC341oYUzHEqI1Bl/AEPU5ZgODtle9ipNJ93iOLux8fe
         4/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date;
        bh=IyPY3jNYz1zmj8hC2XWs0gtCQLKsELDuACeXIEucHZQ=;
        b=hkIlFBnRprJIBt5fKa07wIbWMK5lnrJFpmbMsNnJcuvz7uHknDfv96PeWvji5GyxOD
         jvv+91/VQPYz5MJWfaIR2ONhVmojJKVyRgvFMZ34bOCtiUyPOtiCWHGEYmqYLXQOXz+b
         owhvbk6ThMwZ7YTNqMjIs2Mt3uTaKIEfo6MgWlT8OHXvY0MIlycLzdzhzOOx4LSeM2Ej
         I/oq6nb3rpCJLeI7BULQ+Ki5kJZtN7hSzmGHgHMT6dCuDrr6IuqQZKPMPjWzVUoURcHi
         BHipaPePRO69j3iGXuEghR4AHdOs/5e52xI7uqcyoMK2Xwd2831Izdhd7kXlkbCcfKVL
         VJlw==
X-Gm-Message-State: ACrzQf1tHaqktbw1N5QQn4WIE797EWMcZts6tUPCtPtCFRNirDSungUI
	j7tbkcXdPlqILFehoSnAGq7PA/O2Rxc=
X-Google-Smtp-Source: AMsMyM7rc731dQvjk+iLZLlBI2OutVcUyXEqc0JNp5UQYmHIx7XUmEOD6VBJInYp1uuo4XbQUAajFQ==
X-Received: by 2002:aa7:998f:0:b0:54d:a441:85da with SMTP id k15-20020aa7998f000000b0054da44185damr9782049pfh.20.1663950417459;
        Fri, 23 Sep 2022 09:26:57 -0700 (PDT)
Received: from localhost (27-32-155-116.static.tpgi.com.au. [27.32.155.116])
        by smtp.gmail.com with ESMTPSA id v67-20020a622f46000000b0054ee4b632dasm6537845pfv.169.2022.09.23.09.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 09:26:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Sep 2022 02:26:52 +1000
Message-Id: <CN3X6YN1FRQ3.1Z9BVD6WYQY3M@bobo>
Subject: Re: [PATCH] powerpc/irq: Modernise inline assembly in
 irq_soft_mask_{set,return}
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Segher Boessenkool" <segher@kernel.crashing.org>
X-Mailer: aerc 0.11.0
References: <178f30ff62c0317061f019b3dbbc079073f104c3.1663656058.git.christophe.leroy@csgroup.eu> <CN3LB8F3D9LM.3W1RQRVS64UXU@bobo> <20220923121829.GL25951@gate.crashing.org>
In-Reply-To: <20220923121829.GL25951@gate.crashing.org>
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Sep 23, 2022 at 10:18 PM AEST, Segher Boessenkool wrote:
> On Fri, Sep 23, 2022 at 05:08:13PM +1000, Nicholas Piggin wrote:
> > On Tue Sep 20, 2022 at 4:41 PM AEST, Christophe Leroy wrote:
> > > local_paca is declared as global register asm("r13"), it is therefore
> > > garantied to always ever be r13.
> > >
> > > It is therefore not required to opencode r13 in the assembly, use
> > > a reference to local_paca->irq_soft_mask instead.
>
> > The code matches the changelog AFAIKS. But I don't know where it is
> > guaranteed it will always be r13 in GCC and Clang. I still don't know
> > where in the specification or documentation suggests this.
>
> "Global Register Variables" in the GCC manual.
>
> > There was some assertion it would always be r13, but that can't be a
> > *general* rule. e.g., the following code:
> >=20
> > struct foo {
> > #ifdef BIGDISP
> >         int array[1024*1024];
> > #endif
> >         char bar;
> > };
> >=20
> > register struct foo *foo asm("r13");
> >=20
> > static void setval(char val)
> > {
> >         asm("stb%X0 %1,%0" : "=3Dm" (foo->bar) : "r" (val));
> > }
> >=20
> > int main(void)
> > {
> >         setval(10);
> > }
>
> Just use r13 directly in the asm, if that is what you want!
>
> > With -O0 this generates stb 9,0(10) for me for GCC 12, and with -O2
> > -DBIGDISP it generates stb 10,0(9). So that makes me nervious. GCC
> > does not have some kind of correctness guarantee here, so it must not
> > have this in its regression tests etc., and who knows about clang.
>
> GCC has all kinds of correctness guarantees, here and elsewhere, that is
> 90% of a compiler's job.  But you don't *tell* it what you consider
> "correct" here.

Right, that's what I expect. I think the confusion came from here,

https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-August/247595.html

In any case it is answered now.

> You wrote "foo->bar", and this expression was translated to something
> that derived from r13.  If you made the asm something like
> 	asm("stb%X0 %1,0(%0)" : : "r" (foo), "r" (val) : "memory");
> it would work fine.  It would also work fine if you wrote 13 in the
> template directly.  These things follow the rules, so are guaranteed.
>
> The most important pieces of doc here may be
>    * Accesses to the variable may be optimized as usual and the register
>      remains available for allocation and use in any computations,
>      provided that observable values of the variable are not affected.
>    * If the variable is referenced in inline assembly, the type of
>      access must be provided to the compiler via constraints (*note
>      Constraints::).  Accesses from basic asms are not supported.
> but read the whole "Global Register Variables" chapter?

I still don't see what clauses guarantees asm("%0" ::"r"(foo)) to give
13. It doesn't say access via inline assembly is special, so if
optimized as usual means it could be accessed by any register like
access to a usual variable, then asm could also substitute a different
register for the access by the letter of it AFAIKS.

I think if it was obviously guaranteed then this might be marginally
better than explicit r13 in the asm

       asm volatile(
               "stb %0,%2(%1)"
               :
               : "r" (mask),
	         "r" (local_paca),
                 "i" (offsetof(struct paca_struct, irq_soft_mask))
               : "memory");

But as it is I think we should just stick with explicit r13 base
in the asm.

Thanks,
Nick
