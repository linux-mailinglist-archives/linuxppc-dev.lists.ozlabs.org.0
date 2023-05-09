Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C81996FBD00
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 04:17:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFhcj4KWdz3fLk
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 12:17:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VYfEuEAo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=VYfEuEAo;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFhbv11YPz3bgX
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 12:16:25 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-64115e652eeso39183645b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 19:16:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683598584; x=1686190584;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JrciljIyz71kHIIt3ni7d8UGSXxYGwHmmEbinHQCdu8=;
        b=VYfEuEAoVwmpv3yHNMlZNPCM5xp8AWohzY8Gho10klcu2+qfp1mm1F+z/iddH9dAYP
         0rMkDD4ekZMX61D4OjDGydjThPmu6X0VAGIF8qNY77zZsLXmHxByz/LGydXIk5Zi7oKU
         j7EyEV636Mk9LFdBXuA9xaJJi77nDNzTKSetV13uvZNb5LFvlHEkiuspv71w8OiJ043Z
         g3YVU02q5fhsMwdM4HLDd7UGuKh1uU8tam6eHW4A8ruvZ1XqD0qS4Itq6prmhapl+Haw
         gfsZFHzCivSvrlCtNo2l3hGRhisgfETXl5ZnYrpDaOara2NoiiJ/KxLZighOS2d8nUV6
         B+Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683598584; x=1686190584;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JrciljIyz71kHIIt3ni7d8UGSXxYGwHmmEbinHQCdu8=;
        b=NkbB7nuPyBHSWIb40yXOIt9YlaBDpIJkj/upHF9eXIOD74kAthZVYE3qm6MDzCQzFL
         y/A+IRxzvrDDo0KkbhFvVMaBEEDXCkgoQcj7DANns564atbbZBiRzfBdUb/0kjXBpLIG
         L5rOUVB+DpU4JJNPE0uABkZY+KiRgxfivwoKwNx5yD5AhtZbyjjVj6ygj7Vu4P7RVT0U
         v6nckz/2/JL5CqEAQSLOJUTnLa/TZj1AYSNu1S9MGR99216jn1XXfC6/RbGAxWL1cFqm
         /Y7QdVOnr01Wp7FLhQi0HEXk+VLmdySA12YWe/IcnPzMEOR04rx2WSKBRtVvehhSPZu8
         icVw==
X-Gm-Message-State: AC+VfDwp+O5e49AFp5L1A7fHqPPJC8cNDJEdUgJhEmYsH8Pv1q6p8TC1
	z6lGQTgjPqC1UYFDVxIOJK0=
X-Google-Smtp-Source: ACHHUZ4lwIGm8rrMvBw7rjxD0jgyfE+5H/13BjoSCtd0M/OR4RE0CAPh+U/eeyJI1yVnARKP5O3Ryg==
X-Received: by 2002:a17:902:cecd:b0:1a2:a904:c42e with SMTP id d13-20020a170902cecd00b001a2a904c42emr15315535plg.24.1683598583724;
        Mon, 08 May 2023 19:16:23 -0700 (PDT)
Received: from localhost (58-6-235-78.tpgi.com.au. [58.6.235.78])
        by smtp.gmail.com with ESMTPSA id x11-20020a170902fe8b00b001ac45598b59sm167741plm.163.2023.05.08.19.16.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 May 2023 19:16:23 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 May 2023 12:16:15 +1000
Message-Id: <CSHDVW72NM2A.1BWXOP7LW4J2B@wheely>
Subject: Re: [PATCH 04/12] asm-generic/mmiowb: Mark accesses to fix KCSAN
 warnings
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Rohan McLure" <rmclure@linux.ibm.com>, <linuxppc-dev@lists.ozlabs.org>
X-Mailer: aerc 0.14.0
References: <20230508020120.218494-1-rmclure@linux.ibm.com>
 <20230508020120.218494-5-rmclure@linux.ibm.com>
In-Reply-To: <20230508020120.218494-5-rmclure@linux.ibm.com>
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
Cc: arnd@arndb.de, Gautam Menghani <gautammenghani201@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon May 8, 2023 at 12:01 PM AEST, Rohan McLure wrote:
> Prior to this patch, data races are detectable by KCSAN of the following
> forms:
>
> [1] Asynchronous calls to mmiowb_set_pending() from an interrupt context
>     or otherwise outside of a critical section
> [2] Interrupted critical sections, where the interrupt will itself
>     acquire a lock
>
> In case [1], calling context does not need an mmiowb() call to be
> issued, otherwise it would do so itself. Such calls to
> mmiowb_set_pending() are either idempotent or no-ops.
>
> In case [2], irrespective of when the interrupt occurs, the interrupt
> will acquire and release its locks prior to its return, nesting_count
> will continue balanced. In the worst case, the interrupted critical
> section during a mmiowb_spin_unlock() call observes an mmiowb to be
> pending and afterward is interrupted, leading to an extraneous call to
> mmiowb(). This data race is clearly innocuous.
>
> Mark all potentially asynchronous memory accesses with READ_ONCE or
> WRITE_ONCE, including increments and decrements to nesting_count. This
> has the effect of removing KCSAN warnings at consumer's callsites.
>
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> Reported-by: Michael Ellerman <mpe@ellerman.id.au>
> Reported-by: Gautam Menghani <gautammenghani201@gmail.com>
> ---
>  include/asm-generic/mmiowb.h | 17 +++++++++++------
>  1 file changed, 11 insertions(+), 6 deletions(-)
>
> diff --git a/include/asm-generic/mmiowb.h b/include/asm-generic/mmiowb.h
> index 5698fca3bf56..0b8b794150db 100644
> --- a/include/asm-generic/mmiowb.h
> +++ b/include/asm-generic/mmiowb.h
> @@ -35,27 +35,32 @@ DECLARE_PER_CPU(struct mmiowb_state, __mmiowb_state);
>  static inline void mmiowb_set_pending(void)
>  {
>  	struct mmiowb_state *ms =3D __mmiowb_state();
> +	u16 nesting_count =3D READ_ONCE(ms->nesting_count);

The nesting_count is invariant from the point of view of this context,
so READ_ONCE shouldn't be required AFAIKS? It's sort of not even a
data race.

mmiowb_pending is a data race. I think we could get away without using
READ/WRITE_ONCE, but maybe a bit subtle to bother doing that and
explaining why it's okay.

Thanks,
Nick
