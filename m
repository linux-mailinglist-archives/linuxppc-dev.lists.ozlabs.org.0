Return-Path: <linuxppc-dev+bounces-9619-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D824AE30DD
	for <lists+linuxppc-dev@lfdr.de>; Sun, 22 Jun 2025 18:52:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQHML426tz30Vr;
	Mon, 23 Jun 2025 02:52:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::329"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750611166;
	cv=none; b=L/G3SY7LY3kNzP9VE0jKhDcsjtg+EiKlsaoOVPljxib2r9X9Od1iWjCShNTuYWWufmb/sxWhrAPayzDuDbw3HFE1bnsYWJbZrIpV9oiUKN0ibR0wizCpnqGtI5lu+lZYlDaMME27Gs85pXDFcug03R26g6HytU8hGUQdJ8Bhw+dZLVuUEAr0WBCyTM3m/cERJFjip4bBqVJllaHKDdzwc3G+K6vsEeZNZJTcHAbG5woXwQLuVZeCn9yT7YZwllYL7DTNmlfBH00SThoAtW1F9FdlUfUg5G7WsAYQz3UMTPpJOQc8scnUQ0GgzzKqovIzaPwf14sSTFHRPdtioV39kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750611166; c=relaxed/relaxed;
	bh=FngSn3FLzaGg6vnTK1EcbPv7loXCwwNpO2CdpOQR/gM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X7pXMc1WcZ6HQgzKumh3zWHnR0YQmiwKRgfuMVrlOBYiI/F7sCXHrOI5+cWHNx+499SjeARpYVJZrXKBmgKyQZvU4PftP8A5xgDzJLYUCpccZ0NPJwZd2WERMotaMgflmoO1H+dfb3SBE223L+SO6C30E+3Ev678L2g7pYNWPj0yIP6nToDIcqsufH/yGOD/j4RDAQ/cGKIdbwr36hD+Gy8ioWvB69/C5sSL/nGtUtKbDuO/cKl3AOB0mWhseZ4QCrj+rwywgA8D98GZU4mbdFmPiUYc8vJV+hXZ7DTij5sO7JFCjVC111oWcHlF+5ap7ktjL66GcPz9VUiHXxHnwQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Of1DbO5E; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Of1DbO5E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::329; helo=mail-wm1-x329.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQHMK1jXnz30VR
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 02:52:43 +1000 (AEST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-450cfb790f7so24759885e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 22 Jun 2025 09:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750611161; x=1751215961; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FngSn3FLzaGg6vnTK1EcbPv7loXCwwNpO2CdpOQR/gM=;
        b=Of1DbO5EcVXUKD7dMHMT0xzZGZi2k0ZT+rqezNZo8xW05Lt59Bn4eCBxunb7n4+QwG
         kpOcyRiJXVqq6MEGSm3WNXUVO7fRoiFp+YojC+325bQiE9hRyEOR54c7z9bN9SVCCoVG
         stMPATRvXgvziYfnuC80pbtlW52rkMOv7aSPqybMgjUPlTr0dtYMETsge3Ra5BpJ6eGr
         LktrXlBDB+5umqv2ll9wVNX/YrEAL0dcg3YHbBU3vIpRLC+eG9YHU9WRqRWKNC10Oiyl
         Gd+xd4dmFlbY5/X+nIh7Hwk2jcH4g0tElM5nkEKN8/TQFBRtqOq9yB2DgXMaQ5vVS6J9
         KwOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750611161; x=1751215961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FngSn3FLzaGg6vnTK1EcbPv7loXCwwNpO2CdpOQR/gM=;
        b=QuR3Mq3Mpa0PIIzlUM/Zdntalr4QkluGIeqozvQOoe43ixTrU9FBHLDlr1VlsuKeIi
         S6xhSwLUnt43rji23f/dKV+GZ6q3z3EfeoNvKxFPmtquOkEBErUEhUiArHeM/i2/tLdE
         32alB/qaUvB/gWZYEJltv8tLhbso6c2O7/ozlhsuUalMj4EL0jDSfwbYqAbxXuIXb2Py
         0bKKxwbR1zxzdjMvjrWMacUjGSckfIO3S4cl3BPAVzgObn6zRj7p9fjjV2UfkH+WATFM
         xdC5TKA5SsbK1PumBc39AyV7aRiNPF8X5pXFt1JrS7ABWN3+2IJpdFrIGB749ayBfqSF
         t1rQ==
X-Forwarded-Encrypted: i=1; AJvYcCU2NnzBPemi9gYCYf2+Psn38q0bTOcUGMlFRuvL6ToKa2dGLjzPUh8MQ5xGv1tTn0DV2aGoVpsa7G9l22g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yx9Orm2yOlgq8s4KwaWoTnihno0dnjTdRDEoVbJDcVlKuxGC3kY
	JQSbX7FYhXBaFmECR3Z+LcjUq/L1MJjcXI7djB83TO6jj1IU0CSA5QaK
X-Gm-Gg: ASbGnctkUOyuF8MPScSYNf1WqA2hVvUHasjVrmFb3QrQIrRX1IjODmO2Xt0l66je9jG
	1vsRmO/iDZ9gN3DCReJkDcSOJbO+EsKlaKts2A1go7QkjCMwE9SGGu/c13JyOvi4xWMrc3KSTiF
	6cqr1ubvtanSExqIwH635EdEMwKawp2D5pw02UeMUAM+vi7dZv5aGXs0di9mY6ljLkztgoSQDNn
	+KSh+zUljCCBsuWZkCyr8NQ/Iy3gG+vj8TL5Qp1HBhCI34jz2fxUQR6Z+OiRfra5ivRpzpJoziw
	wzNva4zkbaLUlpLe9JVgljYstLKikhPwG72DdmHSq6mDRh5oRbitCfll2i98E+p+D0rUk/P6C2U
	rvkzESjJeg6tfrc7dTvMD7teM
X-Google-Smtp-Source: AGHT+IGYZ2I7yF8X3Gjleg6T1l+ayP9shmcGOvVNUsuDSBZtK92zgW1wfdx37nTuwhWT/HBaaKSFPg==
X-Received: by 2002:a5d:64ce:0:b0:3a4:f513:7f03 with SMTP id ffacd0b85a97d-3a6d1303b0fmr7534708f8f.44.1750611160377;
        Sun, 22 Jun 2025 09:52:40 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646d7d8fsm83430075e9.15.2025.06.22.09.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 09:52:40 -0700 (PDT)
Date: Sun, 22 Jun 2025 17:52:38 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
 <npiggin@gmail.com>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Thomas Gleixner
 <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, Davidlohr Bueso
 <dave@stgolabs.net>, "Andre Almeida" <andrealmeid@igalia.com>, Andrew
 Morton <akpm@linux-foundation.org>, Dave Hansen
 <dave.hansen@linux.intel.com>, Linus Torvalds
 <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org
Subject: Re: [PATCH 2/5] uaccess: Add speculation barrier to
 copy_from_user_iter()
Message-ID: <20250622175238.642d02bf@pumpkin>
In-Reply-To: <f4b2a32853b5daba7aeac9e9b96ec1ab88981589.1750585239.git.christophe.leroy@csgroup.eu>
References: <cover.1750585239.git.christophe.leroy@csgroup.eu>
	<f4b2a32853b5daba7aeac9e9b96ec1ab88981589.1750585239.git.christophe.leroy@csgroup.eu>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, 22 Jun 2025 11:52:40 +0200
Christophe Leroy <christophe.leroy@csgroup.eu> wrote:

> The results of "access_ok()" can be mis-speculated.  The result is that
> you can end speculatively:
> 
> 	if (access_ok(from, size))
> 		// Right here
> 
> For the same reason as done in copy_from_user() by
> commit 74e19ef0ff80 ("uaccess: Add speculation barrier to
> copy_from_user()"), add a speculation barrier to copy_from_user_iter().

I'm sure I sent a patch to change this code to used the 'masked' functions.
Probably ought to be done at the same time.
Would have been early feb, about the time I suggested:

+#ifdef masked_user_access_begin
+#define masked_user_read_access_begin(from, size) \
+	((*(from) = masked_user_access_begin(*(from))), 1)
+#define masked_user_write_access_begin(from, size) \
+	((*(from) = masked_user_access_begin(*(from))), 1)
+#else
+#define masked_user_read_access_begin(from, size) \
+	user_read_access_begin(*(from), size)
+#define masked_user_write_access_begin(from, size) \
+	user_write_access_begin(*(from), size)
+#endif

allowing:
-		if (!user_read_access_begin(from, sizeof(*from)))
+		if (!masked_user_read_access_begin(&from, sizeof(*from)))

	David


> 
> See commit 74e19ef0ff80 ("uaccess: Add speculation barrier to
> copy_from_user()") for more details.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  lib/iov_iter.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/lib/iov_iter.c b/lib/iov_iter.c
> index f9193f952f49..ebf524a37907 100644
> --- a/lib/iov_iter.c
> +++ b/lib/iov_iter.c
> @@ -50,6 +50,13 @@ size_t copy_from_user_iter(void __user *iter_from, size_t progress,
>  	if (should_fail_usercopy())
>  		return len;
>  	if (access_ok(iter_from, len)) {
> +		/*
> +		 * Ensure that bad access_ok() speculation will not
> +		 * lead to nasty side effects *after* the copy is
> +		 * finished:
> +		 */
> +		barrier_nospec();
> +
>  		to += progress;
>  		instrument_copy_from_user_before(to, iter_from, len);
>  		res = raw_copy_from_user(to, iter_from, len);


