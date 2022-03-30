Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BEA4EB9A7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 06:27:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KSthJ3D6Rz30LS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Mar 2022 15:27:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iGJDsWQ/;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iGJDsWQ/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jpoimboe@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=iGJDsWQ/; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=iGJDsWQ/; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KStgX6hLpz2xWm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Mar 2022 15:27:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648614416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nKA9pWHMxnbapsXj7AFZXsdri/J+aqlfWUZEkrFaXOs=;
 b=iGJDsWQ/xobzWIE0YWfo60CRuBoGTpKYLMumoqW5OW4K95DNTaO/hvgY7rud2LScJ2Qcxi
 QQwlIJOFy+FaPMs0nM5H0taFjHUVyHsaqeBM4D5ot2+jxHFcMg2yhwdKuKLP3HI3/s9wnC
 SY6HCkDBwsKDcyJLgV4J+A/n81StKW0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648614416;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nKA9pWHMxnbapsXj7AFZXsdri/J+aqlfWUZEkrFaXOs=;
 b=iGJDsWQ/xobzWIE0YWfo60CRuBoGTpKYLMumoqW5OW4K95DNTaO/hvgY7rud2LScJ2Qcxi
 QQwlIJOFy+FaPMs0nM5H0taFjHUVyHsaqeBM4D5ot2+jxHFcMg2yhwdKuKLP3HI3/s9wnC
 SY6HCkDBwsKDcyJLgV4J+A/n81StKW0=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-4ADgKHsiPKm-e4JVZ3NsCg-1; Wed, 30 Mar 2022 00:26:54 -0400
X-MC-Unique: 4ADgKHsiPKm-e4JVZ3NsCg-1
Received: by mail-qt1-f199.google.com with SMTP id
 t19-20020ac86a13000000b002e1fd2c4ce5so16473189qtr.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Mar 2022 21:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=nKA9pWHMxnbapsXj7AFZXsdri/J+aqlfWUZEkrFaXOs=;
 b=HP0N/7JyDkjpFfifDRpfnZFSjAusHZw+DSc4jZ+y8ZaEL6MMJfESIOv2B/u95BiWlo
 3V9yhNhqUazYTcnH01ZEGmA1cNiCbPSM7IKraqBcShrd3u12zjl1FXWt7kyx3bJHivmL
 tUs4Eae637o+69CpKwYYqEYUTSFk0hdBb00nylgqYrSvfrkmzcT2AxiqbomIEGaTDzRY
 lRzG61PW8qM0CtuknlOnfCByOTbeMgw6e6MeuAUqicTP1iJDrM52iLHXJbMqDfdCEjCv
 r5MRvTkp2ZsUQaaTTqRHqXlRkPUazd3GBDZ7+0BU4xfHd/uWL7LUqh4Nfza7x/3LScOk
 k50w==
X-Gm-Message-State: AOAM5339rEOCWMUyOAdeYNk9lpxxFw7l2pZV63yKcshaE859+U3hV584
 bHliiXNUaBVQzC0zm/zv6vvTNZ2dQSTZYn7MLKi0pHmdUvdhLeI5KIcLGx/SyuGQATBCqjgublg
 lyzF/5csClmfDF+bPLdRq10BKIg==
X-Received: by 2002:a05:6214:230a:b0:435:4f89:3c0e with SMTP id
 gc10-20020a056214230a00b004354f893c0emr29007846qvb.92.1648614414344; 
 Tue, 29 Mar 2022 21:26:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwDTTnL5kXiRn6YJo7R0KGe6AX6xPcJu4FBJYFEXOnIiaFh60A0fM3hMylzfAQAXg6eHu8dUQ==
X-Received: by 2002:a05:6214:230a:b0:435:4f89:3c0e with SMTP id
 gc10-20020a056214230a00b004354f893c0emr29007830qvb.92.1648614413978; 
 Tue, 29 Mar 2022 21:26:53 -0700 (PDT)
Received: from treble ([2600:1700:6e32:6c00::15])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05622a048d00b002e1ce0c627csm17321177qtx.58.2022.03.29.21.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 21:26:53 -0700 (PDT)
Date: Tue, 29 Mar 2022 21:26:49 -0700
From: Josh Poimboeuf <jpoimboe@redhat.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH 3/3] objtool/mcount: Add powerpc specific functions
Message-ID: <20220330042649.fj43vxtpxmyxtbnd@treble>
References: <20220318105140.43914-1-sv@linux.ibm.com>
 <20220318105140.43914-4-sv@linux.ibm.com>
 <YjR6kHq4c/rjCTpr@hirez.programming.kicks-ass.net>
 <0b55f122-4760-c1ba-840a-0911cefec2ad@csgroup.eu>
 <20220328195920.dqlfra3lcardko6r@treble>
 <87mth9ezml.fsf@mpe.ellerman.id.au>
 <af262c28-0d73-7ae6-3dd5-2977c9a41f7d@csgroup.eu>
MIME-Version: 1.0
In-Reply-To: <af262c28-0d73-7ae6-3dd5-2977c9a41f7d@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jpoimboe@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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
Cc: Peter Zijlstra <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 29, 2022 at 05:32:18PM +0000, Christophe Leroy wrote:
> 
> 
> Le 29/03/2022 à 14:01, Michael Ellerman a écrit :
> > Josh Poimboeuf <jpoimboe@redhat.com> writes:
> >> On Sun, Mar 27, 2022 at 09:09:20AM +0000, Christophe Leroy wrote:
> >>> Second point is the endianess and 32/64 selection, especially when
> >>> crossbuilding. There is already some stuff regarding endianess based on
> >>> bswap_if_needed() but that's based on constant selection at build time
> >>> and I couldn't find an easy way to set it conditionaly based on the
> >>> target being built.
> >>>
> >>> Regarding 32/64 selection, there is almost nothing, it's based on using
> >>> type 'long' which means that at the time being the target and the build
> >>> platform must both be 32 bits or 64 bits.
> >>>
> >>> For both cases (endianess and 32/64) I think the solution should
> >>> probably be to start with the fileformat of the object file being
> >>> reworked by objtool.
> >>
> >> Do we really need to detect the endianness/bitness at runtime?  Objtool
> >> is built with the kernel, why not just build-in the same target
> >> assumptions as the kernel itself?
> > 
> > I don't think we need runtime detection. But it will need to support
> > basically most combinations of objtool running as 32-bit/64-bit LE/BE
> > while the kernel it's analysing is 32-bit/64-bit LE/BE.
> 
> Exactly, the way it is done today with a constant in 
> objtool/endianness.h is too simple, we need to be able to select it 
> based on kernel's config. Is there a way to get the CONFIG_ macros from 
> the kernel ? If yes then we could use CONFIG_64BIT and 
> CONFIG_CPU_LITTLE_ENDIAN to select the correct options in objtool.

As of now, there's no good way to get CONFIG options from the kernel.
That's pretty much by design, since objtool is meant to be a standalone
tool.  In fact there are people who've used objtool for other projects.

The objtool Makefile does at least have access to HOSTARCH/SRCARCH, but
I guess that doesn't help here.  We could maybe export the endian/bit
details in env variables to the objtool build somehow.

But, I managed to forget that objtool can already be cross-compiled for
a x86-64 target, from a 32-bit x86 LE host or a 64-bit powerpc BE host.
There are some people out there doing x86 kernel builds on such systems
who reported bugs, which were since fixed.  And the fixes were pretty
trivial, IIRC.

Libelf actually does a decent job of abstracting those details from
objtool.  So, forget what I said, it might be ok to just detect
endian/bit (and possibly even arch) at runtime like you originally
suggested.

For example bswap_if_needed() could be reworked to be a runtime check.

-- 
Josh

