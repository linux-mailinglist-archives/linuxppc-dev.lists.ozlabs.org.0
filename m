Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DF5DE57590A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 03:18:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LkYQ45LL6z3c9m
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jul 2022 11:18:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V+y8N9Dl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=V+y8N9Dl;
	dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LkYPT3d5sz30Lp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jul 2022 11:17:33 +1000 (AEST)
Received: by mail-pl1-x632.google.com with SMTP id g17so1929235plh.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 18:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=nfJx8szvxpAumqie3qdvyskTXcrkxNNhi3meRmvRgBw=;
        b=V+y8N9DlPLnl0TW0ZrZwkbgn2/Cj1YemToHHvwfycVcrfoJUbQhW49hQAEq833dOI9
         9qp11/n16/3FzuWkDWDiL4iyT7zGCjmrAUkcOcLGpbwyOU7lEHEocOFn6LsfdTc2l8my
         i/1WDcrHHvwDkkCBMrjEwr/0xPTln5U+/KPodb5M/LUtZuftyJBlXTjzKjhDwJNok4Jd
         Tp0iJQHkTMLXARjE/cnK/dXHULbNTJdakmN/dzQA6GaUjoJctM3eZdqL3jNCWF5IKCEJ
         whwRCo6ltTEbuDbudhOb/Ib+lto1og68Ca1CJXAVWKGqeaJIe46CIJHwkin3LbAgvbWE
         Xmtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=nfJx8szvxpAumqie3qdvyskTXcrkxNNhi3meRmvRgBw=;
        b=0YPi7kFyBHOmkazz3QsvUQ33DNIge0rmzjh8u3oEeZu87hHttb/tQtgznqqSlC9vWP
         ay/CpNfwc5L7nm8P6nd5QM0iioWIH2uVF8yFw536YMXEkKVtnpS92J0z7YYNkNL9M3La
         AbeYPjAamolCC89tEf7W/U6g7rVJ29vsjrrDYpOosiogwWxOAq2z+gBiBcd/tAJZKkIQ
         pfY6FR+UhZmW3oc14caudyR9kFNiej3D9dMeskS0GQKPlDfMpJLjHh9hpK0O+Lf3R7pZ
         FzJk1/y45klQRNs/s6RhocmAG9DlUKmLma/tCmuEfkq2O6Bjb6FEgv4ue9XANgyB6MJH
         lxMQ==
X-Gm-Message-State: AJIora+s+Q9s8E3ixVxtg2HNhBrVAvDA+N4zFIFQNkqU1Qs2d3F6Etso
	QjjdEvYos3L6fhJg6deXrZ4=
X-Google-Smtp-Source: AGRyM1sHnFlsaFGqT4bufSjNvAS/0/NjyKSVvuKQBCzgEhsyPjBMyYDDKlpFaifVuzzmtu1WlC9RTQ==
X-Received: by 2002:a17:902:ccc7:b0:16c:484f:4c69 with SMTP id z7-20020a170902ccc700b0016c484f4c69mr11544540ple.118.1657847850565;
        Thu, 14 Jul 2022 18:17:30 -0700 (PDT)
Received: from localhost (61-68-63-70.tpgi.com.au. [61.68.63.70])
        by smtp.gmail.com with ESMTPSA id x9-20020a170902a38900b0016c0c82e85csm2111979pla.75.2022.07.14.18.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 18:17:29 -0700 (PDT)
Date: Fri, 15 Jul 2022 11:17:24 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH Linux] powerpc: add documentation for HWCAPs
To: Florian Weimer <fweimer@redhat.com>, Segher Boessenkool
	<segher@kernel.crashing.org>
References: <20220524093828.505575-1-npiggin@gmail.com>
	<87ee0juukf.fsf@oldenburg.str.redhat.com>
	<20220524183236.GJ25951@gate.crashing.org>
In-Reply-To: <20220524183236.GJ25951@gate.crashing.org>
MIME-Version: 1.0
Message-Id: <1657846871.9qtz2ahf6c.astroid@bobo.none>
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, linuxppc-dev@lists.ozlabs.org, Paul E Murphy <murphyp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Segher Boessenkool's message of May 25, 2022 4:32 am:
> On Tue, May 24, 2022 at 11:52:00AM +0200, Florian Weimer wrote:
>> * Nicholas Piggin:
>>=20
>> > +2. Facilities
>> > +-------------
>> > +The Power ISA uses the term "facility" to describe a class of instruc=
tions,
>> > +registers, interrupts, etc. The presence or absence of a facility ind=
icates
>> > +whether this class is available to be used, but the specifics depend =
on the
>> > +ISA version. For example, if the VSX facility is available, the VSX
>> > +instructions that can be used differ between the v3.0B and v3.1B ISA
>> > +verstions.
>>=20
>> The 2.07 ISA manual also has categories.  ISA 3.0 made a lot of things
>> mandatory.  It may make sense to clarify that feature bits for mandatory
>> aspects of the ISA are still set, to help with backwards compatibility.
>=20
> Linux runs on ISA 1.xx and ISA 2.01 machines still.  "Category" wasn't
> invented for either yet either, but similar concepts did exist of
> course.

Not sure what to say about this. It now also has "Compliancy Subset"
although maybe that's more like a set of features rather than
incompatible features or modes such as some of the category stuff
seems to be. I'll try add something.

Thanks,
Nick
