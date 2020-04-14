Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BF5AB1A81CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 17:15:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491pvW5BBWzDqnp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Apr 2020 01:15:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jbyVR3i6; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491pJP3PnQzDqlh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Apr 2020 00:48:20 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id g6so6088198pgs.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=L6wwBLpMMetY/zxOEci/JVLuRBV/3LI/LldPvH06RfY=;
 b=jbyVR3i63K7T908IixpVArje1gguIVF9o17an2Ju6P4xd56heYoFmO/WcdvYUGOw83
 7DsRgEXQ7GdDOshFt28h6IZryHi6pCoL9TxpwNMwOPQ1WwJTF7JTL9c2RLAhjn11+Qtp
 81zgUeMjSRjvbeaU+lfmouqsrC6Fr6iqJFDEiznZAV1GOr4656U3Wr5nQootJ2ZQFOWS
 HzUhnCiHoZIIV8+m2lFOeHdd0TIJ4MPu25GdxxAiCtY8PSM3nTP3iBUlJWWpsDaARXRV
 7mWxg96+Qw9Kqu5tSPqHXEfSOUh6hwqt5xIdzBQ9ngUs43LWc7bZzpLIK5dfh+q7KRpc
 C80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=L6wwBLpMMetY/zxOEci/JVLuRBV/3LI/LldPvH06RfY=;
 b=VqtBJzlTpWDNxJGLUFzrCYhB/kimRKxlymXRYDnvUKjCrV9KvJCJ3xm+OGub2uD3aP
 zW8GcUqL0Cszrcwh8Q8blmFWUnKhQiewcVCwooQMnRFSpNEjUU9Nvlmklt1aOgqGSowE
 UjcLPac0kRxnxaVOcLtEtFBHsUlFcosfB9pQj9OGCLOyEtuw13141+eGC8ornC2eEJba
 8/UyTvj9DqUnrdZL29BVzQp+I1vhxSC/C7Bw7DZz2bi2J+CFHPvFhLAbQUOsJaarG1jl
 pwmeFxnMVoQQNjE1Zzj6hpi2Mv2bpXwTZyhsAmPNOWBQddWNeP8ZrHXJThE7Mc6S45kA
 VbFQ==
X-Gm-Message-State: AGi0PuaKs5sAL/bwPEzmryT+Oca5JLWxuP9RvrdLH1qUYHBd3M+rnTgp
 n/6swkLVAFS58DyGHep/Nr4=
X-Google-Smtp-Source: APiQypK52jNzLdOIfO1gpMRdMkm3ocgjZEpddsb7bx1IdjG1eoLljeSOsDojocPs+NcHrGI7xJxuPA==
X-Received: by 2002:a65:688c:: with SMTP id e12mr1438881pgt.194.1586875698800; 
 Tue, 14 Apr 2020 07:48:18 -0700 (PDT)
Received: from localhost ([203.18.28.220])
 by smtp.gmail.com with ESMTPSA id k12sm10439963pgj.33.2020.04.14.07.48.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 07:48:17 -0700 (PDT)
Date: Wed, 15 Apr 2020 00:48:13 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 4/4] mm/vmalloc: Hugepage vmalloc mappings
To: Christoph Hellwig <hch@infradead.org>
References: <20200413125303.423864-1-npiggin@gmail.com>
 <20200413125303.423864-5-npiggin@gmail.com>
 <20200414072316.GA5503@infradead.org>
 <1586864403.0qfilei2ft.astroid@bobo.none>
 <20200414130203.GA20867@infradead.org>
In-Reply-To: <20200414130203.GA20867@infradead.org>
MIME-Version: 1.0
Message-Id: <1586875675.f8q1grbltc.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christoph Hellwig's message of April 14, 2020 11:02 pm:
> On Tue, Apr 14, 2020 at 10:13:44PM +1000, Nicholas Piggin wrote:
>> Which case? Usually the answer would be because you don't want to use
>> contiguous physical memory and/or you don't want to use the linear=20
>> mapping.
>=20
> But with huge pages you do by definition already use large contiguous
> areas.  So you want allocations larger than "small" huge pages but not
> using gigantic pages using vmalloc?

Yes.

Thanks,
Nick
