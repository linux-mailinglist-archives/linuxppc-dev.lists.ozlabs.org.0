Return-Path: <linuxppc-dev+bounces-12644-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A95E9BB58CF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 03 Oct 2025 00:38:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cd6C01bTJz2yw7;
	Fri,  3 Oct 2025 08:38:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759444700;
	cv=none; b=Yk65Xfm1LAnBsMBAZ1aJBQ+oTef9GxtvlAzmiR+NIiXFoq77m1m/PgAnuKx9tXHRC3W54oc0/CiGSMGRWCMxAHH0taX+MhpZxy3iSQYNdMYyQk1ebr/UzmJSRnD+K5IEWUg3bbFPmVQh6V2Ic5gR+RLHiBiUODr5PG+513+Sw6zvDLGgT2pAufFk3nwl2Wbdoydvy1YOmEtYl7+vPLEPjOWnvNOU8aEJPRuzYpfAWeb7UVxCBHU/jBalrI+bUzy1oxxWer2XPQBVvLmYz9B+7L/bw9y0huTLjhkDQ2ZonqngKCQEV+hkw2gKljHchJc0xEpnkU+ThfhoBa1FWOeEHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759444700; c=relaxed/relaxed;
	bh=XC0sO2N0d+uo0Arvt22e4w8FJtUrLDpvY+BPCwyRgx4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Mime-Version; b=jAu/SMA/PK9sun167XgGfQG10XDddCJmPlGk114zGRWzBT1tiebMWix//LR7E4qpKjrQcQO8xuy6F2CWAESXKSh3xBufsycCkuSpst5sIXpe6kcNGiDd3zgx4JL4zWeEgWayzA1BK4VL0WB/JveZzs0CKgv/vcZyI7EEqU25Y4ZWKKFiECL1U6cU5nsf9BKbjmcHD5rKIX6JISuU+5D5q7GQsXkWOjoRPTyBxL2/UGYRPhtAOkwkuPMD3wOahZ6H1zQGnSEEeIZZV1UyxkgHNEYDAfE5g95Cfl4dJ3zjTbXGHs4OU6O0Pm1nb7QVoswGDX4mltEuNlljLY6XEvFhJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us; dkim=pass (2048-bit key; unprotected) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=a9E3oWMk; dkim-atps=neutral; spf=permerror (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=daniel@gimpelevich.san-francisco.ca.us; receiver=lists.ozlabs.org) smtp.mailfrom=gimpelevich.san-francisco.ca.us
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=gimpelevich.san-francisco.ca.us
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.i=@gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=a9E3oWMk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=gimpelevich.san-francisco.ca.us (client-ip=2607:f8b0:4864:20::52f; helo=mail-pg1-x52f.google.com; envelope-from=daniel@gimpelevich.san-francisco.ca.us; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52f.google.com (mail-pg1-x52f.google.com [IPv6:2607:f8b0:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cd6By3dqTz2yrT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Oct 2025 08:38:16 +1000 (AEST)
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-b609a32a9b6so1019587a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 Oct 2025 15:38:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gimpelevich-san-francisco-ca-us.20230601.gappssmtp.com; s=20230601; t=1759444695; x=1760049495; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XC0sO2N0d+uo0Arvt22e4w8FJtUrLDpvY+BPCwyRgx4=;
        b=a9E3oWMk6GKaaHf596iIgUQnHJn8OyKhtgSf12YrQcI+Pzs1FbApfMjpoje5fZ71eq
         R61Ia2MoLSpyQc5YBd4zV5h7S4ezt/1HVL9ZxCiBkAlHsYu9ChN7N0c0cCSQqd12AugA
         jTiZQhIuq7oum1jfR7IbLuMpCGh+k0vq4R28MvOlR0R+NaAZvu/0aLMpavBXnqrqrpPm
         uDCyiuvVfsR/kVDG4uiM2ZJRh/3h8B/la57KTY4uHr2jkLhqGUJc50xosexrL2jPKpJM
         nbdfY+wl//pg4D+AU3XDmNGWuQrCKOouFaa0N0nHB2C5A6r6OCHRyk7T8ntBba2mhC4a
         qshA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759444695; x=1760049495;
        h=content-transfer-encoding:mime-version:disposition-notification-to
         :references:in-reply-to:date:cc:to:from:subject:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XC0sO2N0d+uo0Arvt22e4w8FJtUrLDpvY+BPCwyRgx4=;
        b=N6uI8QkxfmeG6eYGq9RPBUN6SID3Bb9CafRWCWKSmkrfdrScwWq934KMkJuAm1zhLQ
         iGLP2TVkwCucD8GcdVfNnxYPFbkd6PKLbwXkUIJhShFgvn0Aj5clCpAhWx09WymLlnNf
         t2VoNkWD0tMsRJrBGGXLlEeBF6Spzv1znn3P2xVqmM97egsCOov3FMkZJ4mCdABegKwg
         /AU41NCBTYD2lpsWYQ+tyHQnT5b+U8joSaOUbioBwp5/yy210xHwMuHAlwR9wIOAGit2
         eX2vl2hRkp3o/BXxRvYlpiAzAsGfCcFr4pEEI+j4TFd81HYub6cJxKQLBZj7Fr36KFEg
         lKXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWAdpYydqStN1R+h6wwFpjYQazYQi2Ib/9BlxHKti8Dqh1dpPHA5O9l5Cw6KoUtf8SnLamBCB7f7DEZIRU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwCjUUGbkC4cOO6SXaubfRa0P8y+a+N0Oz9zqZ0ICOdY1uYihFu
	LGsGOXE7pwC0nOCSzbbg9x6alihiE1rxTRVMeH7w4VS7SOuFb8EX1X/QmavUdiA9MA==
X-Gm-Gg: ASbGncutaLchuoKVaUOeitmHNeBta+RT3SLchT+5hYp69lkjMwMQrdtSevkZYKolCGO
	nP8zmbA8mXQP6Cea6N/4XJhx0E9TBYDiJPI9qfg2qmJ1dCnONURSNmpiy0YOp7cqv1R7j35ZWKS
	IktX/6zw9cUZPGggLY2qWk6/MuHeixZGA9Mwz279VwINahKgFvJI1sYaBPYfWwIsw9sV35u2vRW
	7gf3bqD2d9B7VUJX0MnkNGbp7yDZS0v/3e+293ecAbdD7uTvbI7j3hXn4w7G/u/qCjUgkrW1SIa
	x1NFMY7vIRNSb7tZToLNEqLugpbqWbL18OYDEcGnBUjqbCfsRQyIZo1KAA0SlQMcZvc7U/kw6v6
	7PeisG/TJgtRSuAy+ZUKndztLb8UZSWyBcbDibEtf01pCGyFFXkGsa9Wfr/DglP651u93dNDApz
	8BHHURu0YGzXT1iMGwOfmvg9Wz9ekuEBPAc+ZtzRhwo6s=
X-Google-Smtp-Source: AGHT+IGEWpLAS0bs92zaBuI97EwGsBxqAWGzNiljhk82StCYnXBLZ6FnmN8hBjn83V3/i2Ef8tUENg==
X-Received: by 2002:a17:902:d544:b0:25c:d4b6:f111 with SMTP id d9443c01a7336-28e9a65258fmr10877855ad.47.1759444694910;
        Thu, 02 Oct 2025 15:38:14 -0700 (PDT)
Received: from ?IPv6:2001:5a8:429d:2100:4825:53c7:1977:212e? ([2001:5a8:429d:2100:4825:53c7:1977:212e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1b9e5asm31046705ad.74.2025.10.02.15.38.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Oct 2025 15:38:14 -0700 (PDT)
Message-ID: <1759444692.24579.8.camel@chimera>
Subject: Re: [PATCH 6/8] CMDLINE: x86: convert to generic builtin command
 line
From: Daniel Gimpelevich <daniel@gimpelevich.san-francisco.ca.us>
To: Dave Hansen <dave.hansen@intel.com>
Cc: "Daniel Walker (danielwa)" <danielwa@cisco.com>, Will Deacon
 <will@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Rob
 Herring <robh@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 Pratyush Brahma <quic_pbrahma@quicinc.com>, Tomas Mudrunka
 <tomas.mudrunka@gmail.com>, Sean Anderson <sean.anderson@seco.com>,
 "x86@kernel.org" <x86@kernel.org>, "linux-mips@vger.kernel.org"
 <linux-mips@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
 <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
 "xe-linux-external(mailer list)" <xe-linux-external@cisco.com>, Ruslan
 Ruslichenko <rruslich@cisco.com>,  Ruslan Bilovol
 <ruslan.bilovol@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Date: Thu, 02 Oct 2025 15:38:12 -0700
In-Reply-To: <a2be781f-96b5-47d1-81fa-b20395ca293a@intel.com>
References: <20231110013817.2378507-1-danielwa@cisco.com>
	 <20231110013817.2378507-7-danielwa@cisco.com>
	 <00c11f75-7400-4b2a-9a5d-10fc62363835@intel.com> <aN7n_5oiPjk-dCyJ@goliath>
	 <c8b65db3-a6cf-479d-9a83-23cbc62db1ef@intel.com> <aN7vKgcUeQgCFglQ@goliath>
	 <a2be781f-96b5-47d1-81fa-b20395ca293a@intel.com>
Disposition-Notification-To: daniel@gimpelevich.san-francisco.ca.us
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
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
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-10-02 at 14:55 -0700, Dave Hansen wrote:
> That's not a bad idea. Or, even if you can pick two amenable
> architectures to start with it will make it really obvious that this is
> useful. Two architectures means a *lot*, IMNHO. Two is a billion times
> better than one.

I think it's a bad idea, if I understand it correctly. The patchset
conceptually patches a mechanism of the kernel as a whole, but one which
just so happens to need to be implemented separately for each arch.
Breaking it down like you suggest creates an embarrassingly high
likelihood of different architectures' implementations of it going out
of sync, a previous situation that this patchset was partly intended to
address. I say keep it atomic. If it breaks on an arch or two but not
others and nobody notices right away, that would be better addressed
with a new patch when someone eventually does notice. Just my 2¢…


