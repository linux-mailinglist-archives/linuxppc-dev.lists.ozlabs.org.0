Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E28E63B9EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 07:46:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLtCt1rHlz3f2x
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Nov 2022 17:46:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jWaoC/8y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=jWaoC/8y;
	dkim-atps=neutral
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLtBv3p8Cz2xsD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Nov 2022 17:45:42 +1100 (AEDT)
Received: by mail-pg1-x532.google.com with SMTP id 6so12131632pgm.6
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 22:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EH9MdMYOJUn7ApAx0G5ypo8BLQDZWBEKr0iPItUeQkA=;
        b=jWaoC/8yq7s2dOiaHfHFM5UKClO9eXJAmAVflBiR4wpr9Zps5uq/9T6CL5uEd87RQ1
         cJAZAtG4Joy4h/fSgmuOWGkh7qaan4pknM2CPFkWaDAYbUFe+cR/4hNs02IGJYQ+lg6q
         3YLuM25QuHpLMNnWbzBvZAqmcRC/dC8MrW0xU3gieUEhghN9Bz9BhcyBo6ymSzKxay++
         M0HpdAVXS9MtLsIPWMaxau/IO1EI6KtbfB5qvc3ZO1Uovboy2Q1GCQT/y5ZBHF5N+pH+
         D87tOrPT4ehQdfwk+pWaMjJXY3oQUV+tJ5L00YrPaChUlXy8i5olwNhxESl3VqD2Itnz
         VQOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EH9MdMYOJUn7ApAx0G5ypo8BLQDZWBEKr0iPItUeQkA=;
        b=cq/PFCclPyHS+YpQ6fxoseNskbqtK7YOshkJkVshWTWRT5dTdUvZz7+5ti5RO2igki
         eubb69AsgQZ23KJWE+rxP2xuhXi6kSDIDzrpFa6ioQ5gPXfFIkVgO6Tc6oqa6/lz3ctQ
         jgAxkgeyKXkOd+u1U6Uk1vA2Lhnn/mpkSrLZ/IKbrbf9oM1XPzSgGQieDf5KGz3huOPN
         Jgx2v5kdePGgvxNkw3+ZADErUacpeTitK+UvXUm+papS7jsiV50yYFeJN2k93MgvwDWd
         +Jx9wQxOQ62GhXSZvx1YjSstXX72NFLRFaA2YqX6x+wlGiBQsFg8myftVc8I6izJpnjb
         /SwA==
X-Gm-Message-State: ANoB5pkz7S68eGus1WWge6RCX6EJojxwsSxfU7JxJ3HTy9Xx0FXGC87Y
	E34VS2k4SI6D9mIg8RFS/QI=
X-Google-Smtp-Source: AA0mqf4ceJESNLxHmZ0FoaSt1FY2zwPNuzgRZOHaEaJD1immW03nMLZODkkWYhwfS9aMgfF2MC0z2Q==
X-Received: by 2002:aa7:998a:0:b0:575:6907:662a with SMTP id k10-20020aa7998a000000b005756907662amr3480533pfh.57.1669704339593;
        Mon, 28 Nov 2022 22:45:39 -0800 (PST)
Received: from localhost ([1.146.90.162])
        by smtp.gmail.com with ESMTPSA id y4-20020a170902b48400b0016d773aae60sm143301plr.19.2022.11.28.22.45.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 22:45:38 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Nov 2022 16:45:32 +1000
Message-Id: <COOKSD5PYV9N.3AHJPTBH1S081@bobo>
Subject: Re: [PATCH 03/13] powerpc/rtas: avoid device tree lookups in
 rtas_os_term()
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Nathan Lynch" <nathanl@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.13.0
References: <20221118150751.469393-1-nathanl@linux.ibm.com>
 <20221118150751.469393-4-nathanl@linux.ibm.com>
 <CONKPQU112NE.1K5YZVFHQ7XU9@bobo> <875yez9bq5.fsf@linux.ibm.com>
In-Reply-To: <875yez9bq5.fsf@linux.ibm.com>
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Nov 29, 2022 at 4:26 AM AEST, Nathan Lynch wrote:
> "Nicholas Piggin" <npiggin@gmail.com> writes:
> > On Sat Nov 19, 2022 at 1:07 AM AEST, Nathan Lynch wrote:
> >> rtas_os_term() is called during panic. Its behavior depends on a
> >> couple of conditions in the /rtas node of the device tree, the
> >> traversal of which entails locking and local IRQ state changes. If the
> >> kernel panics while devtree_lock is held, rtas_os_term() as currently
> >> written could hang.
> >
> > Nice.
> >
> >>
> >> Instead of discovering the relevant characteristics at panic time,
> >> cache them in file-static variables at boot. Note the lookup for
> >> "ibm,extended-os-term" is converted to of_property_read_bool() since
> >> it is a boolean property, not a RTAS function token.
> >
> > Small nit, but you could do that at the query site unless you
> > were going to start using ibm,os-term without the extended
> > capability.
>
> I'm unsure that this is what you're suggesting, but we don't want to use
> of_property_read_bool() in this context either, because it has the same
> undesirable qualities as rtas_token().

I mean rtas_initialize() could do

	if (of_property_read_bool(rtas.dev, "ibm,extended-os-term"))
		ibm_os_term_token =3D rtas_token("ibm,os-term");

Thanks,
Nick
