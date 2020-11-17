Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D2C2B5583
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 01:05:37 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CZmRf43ydzDq7j
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Nov 2020 11:05:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WFMvI3sQ; dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CZmPg1Nw8zDq5k
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Nov 2020 11:03:50 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id t16so20679373oie.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Nov 2020 16:03:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PougHSO4EOPLktlKOHnGB1BQmyZ8m4tQH+Ll9VVIGds=;
 b=WFMvI3sQtWuoaYmJf5tcmOq5RJiAlM8ZWSm4Pk3rueMIihuSsPikxJlWQcoe30UE2O
 ha7+DHH+8pTZLYvQVotgMiBIdENzmBISY5WUOw6cR+dSVyFPGG8k0ZXczYayBa6Hn1S0
 5GEoRUMr+1aLH0wnjAJNNccjjgY/w4WSdu/WP1rJbOeu1z1mtTjcLcspvsCj49+ICOih
 dMQQ6oyimQcxEVYqKYPdJ7vl7JP7d5merda7p2Aj6dY6J1kVkzTx8BbN2WccbBLyNwj8
 RTIZ9iwIFp92t/1orn2k8WsK/96RgZLrOR9x1apry1qo2jiiPry8XuK3hY734ne3jNFG
 NU1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PougHSO4EOPLktlKOHnGB1BQmyZ8m4tQH+Ll9VVIGds=;
 b=n4pAd84ksv/1ouwM+zOXXQX4qpFsXfi9ZDcCG0sWgKoGnsVTrCmd6naj/pc1TFvI/v
 pALqQVuWdpaAGy+rrQE0TIHm2V7/9JN2C0VOKjyPn4tEthc88vzMBtRawiwusvcYPW1Z
 86CojNBQ4Blo3HFPI8/W8R2JcoSnm/6wcEDKlNMVMSswztCrpLgFI7bzld+B86zPgmaG
 g8L/64PI0ztu5bjJVRI03JStUBjI26ceNxhoo61oXAJK8dHVCoEBrOCNaVJRUXwUx5+e
 aZMMGATNNQfMZOy2iMAFvamJryODf0o8sN/XSiwfm6Q57wsLSKzkpVU0Mm9AvB1CC3w4
 qONA==
X-Gm-Message-State: AOAM53238LHUPepv2ufShxHvLafUDtYqB2z1HgZAHlAb2WTc3KRb3/9Y
 izIZ0Xul/XphMFbyUkHNo8faazzhBJoM7owxu0isYWtAMBqXNg==
X-Google-Smtp-Source: ABdhPJyrhUSIbP2AoV1mMTSlAbFpgho9bgQmOsw6KoG4VsbLsFZ1uhx5pD4J4r7QziMaz8hsC8tj5cFguOgBsrcHjn4=
X-Received: by 2002:aca:61d7:: with SMTP id v206mr789847oib.126.1605571427463; 
 Mon, 16 Nov 2020 16:03:47 -0800 (PST)
MIME-Version: 1.0
References: <20201111055524.2458-1-jniethe5@gmail.com>
 <87blfx4iho.fsf@mpe.ellerman.id.au>
In-Reply-To: <87blfx4iho.fsf@mpe.ellerman.id.au>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Tue, 17 Nov 2020 11:03:36 +1100
Message-ID: <CACzsE9rBCjkDAM69E68yE=9bzxo5M6y6ZZd3dioFvLtiESFE9Q@mail.gmail.com>
Subject: Re: [PATCH] powerpc/powernv/memtrace: Fake non-memblock aligned sized
 traces
To: Michael Ellerman <mpe@ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Michael Neuling <mikey@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 16, 2020 at 11:02 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Jordan Niethe <jniethe5@gmail.com> writes:
> > The hardware trace macros which use the memory provided by memtrace are
> > able to use trace sizes as small as 16MB. Only memblock aligned values
> > can be removed from each NUMA node by writing that value to
> > memtrace/enable in debugfs.  This means setting up, say, a 16MB trace is
> > not possible.  To allow such a trace size, instead align whatever value
> > is written to memtrace/enable to the memblock size for the purpose of
> > removing it from each NUMA node but report the written value from
> > memtrace/enable and memtrace/x/size in debugfs.
>
> Why does it matter if the size that's removed is larger than the size
> that was requested?
>
> Is it about constraining the size of the trace? If so that seems like it
> should be the job of the tracing tools, not the kernel.
Yeah about constraining the size, I'll just do it in the trace tools.
>
> cheers
