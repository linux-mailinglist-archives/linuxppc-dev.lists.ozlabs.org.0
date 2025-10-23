Return-Path: <linuxppc-dev+bounces-13193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BF530BFFEC8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Oct 2025 10:29:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4csfMg2yXhz3bd0;
	Thu, 23 Oct 2025 19:29:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1761208159;
	cv=none; b=I0kgZ2mnqBgpbmptQp3M4EmMeYx5qB5i9eYfBBEF6jjcrb+rY0xBd5uug+QLBOzkFadIkBzf+4ZsK/IG5i3UjaReWglXhQ4zClClDylgEoHXUKwYz+o6zFj04ADvcsree628oDUARorJtBugIir43MG/OHjW2U0bV+dCQ5PVzBguqSnM4vatr56sSlE82rYTYJX7fZwL3D+1Fg625+FwBWs6eEQMFwYcIw8jzeXy8xSUGTdTjmYvIoCVdpFIBtAKYKI0Pj2hxaufGa1viPBteeT1f3BMMSZQNDeCKqVkEp/OHvPCg5XYqmKed41Pl7DICzSI8NH5toA0+uMJARyg1w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1761208159; c=relaxed/relaxed;
	bh=8217/lDsma24nzsoVUl8HcI8eQcrK7yDi+gF+9xDXDs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TGwMIw4iinwtUJ6kORvDsJS7HreJvSdH/sLEG8XGz94iDGjDoIvqeguhzoQQ/mVb9FDzt9H6chGxSw2yz7QCZOBZCL0uKLbd7P/S0zMsEX9VOmiHXNwqBkGEy4SKuzZM4Xo+1JoUMqvad7seYFNrtA+aHnufpaPwTS4eMLbBl4PprglpGAwnQtQXbiBtxa3dB8t9XMIV5IcBfAuOkNReNoDNiZX0Iiu1g698rdI6I4QLnnbk1aXOan6VSL2fhre6DvbTBgpBE2Ftj+yx+DIpa7gKYmDSS9auNRt1AJUrzWuBYcOe5MP1GRNStYp6GAXQU9CRXpQ7LlSgpfbUfPsxeg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D1OG4w9/; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=D1OG4w9/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com; envelope-from=david.laight.linux@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4csfMd6bZxz30RJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 19:29:16 +1100 (AEDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-47495477241so3783375e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Oct 2025 01:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761208153; x=1761812953; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8217/lDsma24nzsoVUl8HcI8eQcrK7yDi+gF+9xDXDs=;
        b=D1OG4w9/ROhHFEClO2vufFiRg3dS81BHYDzVNC3QgukkajLlIKXiN2jW0i/ReybtgC
         w4J/xt8dXzsbvaKrb60qOplDvHosbeaBzTz4xQ9Zk4J3rLgMa2zqrbrHhcasNAv+ovJm
         xCwY0phmXqLQ7ulNXeVZPfqMXnHNxqzNYT7700B2lCcy+oKbSBSL0+3c65lOAmXOfZd7
         GGnXC3i4osnU8cq2l0Ao9M06SpbBQLJMEH3TYnVnaY2m7w7T4HjIhSHuu0c4RN0ng0Ih
         Br1TBJQNLQ69xE+DsPkJ6zFABbubpxxD1H6VQAPp9RZMsTr+Rajr6pZD87jOngDa46I2
         ZVDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761208153; x=1761812953;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8217/lDsma24nzsoVUl8HcI8eQcrK7yDi+gF+9xDXDs=;
        b=s5OVvY13lM03gCxOzSVXM3GhYiUAPZvKokgcahZc2/SC5mRx3XlZwRBTFYfUxjj7CF
         JucJ9F1yALCw4GZr8tZ4g5aaZDMngZGumwqjhvQFUiaKq5se/WfnemJ2ESimk/pOREUF
         ZQnMUGjp2B+onN2QTIo0DfX7+7XMq3PyyJ7d6urtkuOmqTmSblRsDsW/kkpteKjHaUhr
         mVAdbpghT5ejWbT1UqoPwm3kyviqta6q67uVYBcMbNvfNhaLEbqp3LLmyTTPqk4OMcO+
         hRQTDMRIkp1+9AxnFPSK49bplIu/TL2761z75dFwuapjlenessGEUnX8VojithoGG1Fk
         Xqqg==
X-Forwarded-Encrypted: i=1; AJvYcCWtNc/D5AAKZebjKIl1jDzdt/Et8oTo3K3LeuB53TYPoSkNEHKSUdMCtgpQq97BfUkB0Q9t9cvmmT3kp8Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxO2YlJmmkczoGkqHSPuvi0xWQm1LC00JX7vI4YOZpHp5QSq4Sj
	NP/UqmKS3HMPwsWLRWWyiAJI1jwfMeZ32iVPW+WeSSMnH9/g6V8Oqwnz
X-Gm-Gg: ASbGncuQZQeDCJYLGZ8VielTm6QggqD/B3T/tZS/kbUvY2CDmjVYA+ljSFIM2uY0hjW
	zIRIv83wK2W1qhoprHV0dfnyDx9wlxltaa+G3wk+MW//k82P/X94FMDDwjoHAwol+Z0D80acZbp
	+R6ZLwh8IQSNyYMblannRYsj7hHrj39f2Pw7wi+lY14DkWraJ34K9umSW2Al8JzY4OTEigvCtOQ
	EzWOleUYMRodAxyv8Zp5GFZHT/9ynYnuGFq4mYNz1EF7PNOkjZhA7q/P2n8ZQEbARC4Ouuq2Eff
	j46yfGl/m3k/LtgiuKRJfpYz3HvcYuF8GuJSDqJ14OlCEOMFbWBikyuBj8er+Wkvm+pgZC2ntNI
	rrwzfp2cHdiVywObMfsv7ayI1WGF2PJ7MjnGTFDllr6HErrKBwzwH6NPb+aQz8KC7ovB+P6fHXT
	MNXL4L9O1LdjQHefCjd9bFltfIMi8IESMDwB4ohsxtruZ1/vup3iL/
X-Google-Smtp-Source: AGHT+IHSgtH949jpIYqvryVHE7ahULmbxvweEBq1Xh1WJbPJkG9goEBlMqfaTmrq4Q942DJtzk78Aw==
X-Received: by 2002:a05:600c:8b35:b0:471:1b25:f9ff with SMTP id 5b1f17b1804b1-475cb065415mr10429885e9.39.1761208152472;
        Thu, 23 Oct 2025 01:29:12 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475caf4642fsm23356135e9.17.2025.10.23.01.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 01:29:12 -0700 (PDT)
Date: Thu, 23 Oct 2025 09:29:10 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Kuniyuki Iwashima <kuniyu@google.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Madhavan
 Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, Jens Axboe <axboe@kernel.dk>, Christian
 Brauner <brauner@kernel.org>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Alexandre Ghiti
 <alex@ghiti.fr>, "H. Peter Anvin" <hpa@zytor.com>, Eric Dumazet
 <edumazet@google.com>, Kuniyuki Iwashima <kuni1840@gmail.com>,
 x86@kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] uaccess: Add __user_write_access_begin().
Message-ID: <20251023092910.2ed9cf15@pumpkin>
In-Reply-To: <CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com>
References: <20251023000535.2897002-1-kuniyu@google.com>
	<20251023000535.2897002-2-kuniyu@google.com>
	<CAHk-=wjXGvUnmN5ZL3nhj_J0cbiVfeHsM9Z54A55rgHRUaVOfA@mail.gmail.com>
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

On Wed, 22 Oct 2025 19:37:27 -1000
Linus Torvalds <torvalds@linux-foundation.org> wrote:

> On Wed, 22 Oct 2025 at 14:05, Kuniyuki Iwashima <kuniyu@google.com> wrote:
> >
> > unsafe_put_user() can be used to save a stac/clac pair, but
> > masked_user_access_begin() or user_access_begin() introduces
> > an unnecessary address masking or access_ok().
> >
> > Add a low-level helper for such a use case.  
> 
> I really suspect that you cannot actually measure the cost of the
> extra masking, and would be much happier if you just used a regular
> "user_access_begin()" (perhaps the "user_write_access_begin()"
> variant).

Or wait for scoped_user_write_access() to get committed and then use that.

	David

> 
> The masking is very cheap - literally just a couple of ALU
> instructions. And unless you can actually measure some real advantage
> of avoiding it, let's not add another helper to this area.
> 
> We spent a fair amount of time undoing years of "__get_user()" and
> "__put_user()" cases that didn't actually help, and sometimes only
> made it hard to see where the actual user pointer validation was done.
> 
>                Linus
> 


