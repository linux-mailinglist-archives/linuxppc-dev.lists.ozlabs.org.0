Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F9CE18F1E2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 10:34:03 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48m8Mp6x4MzDqMy
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 20:33:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::243;
 helo=mail-oi1-x243.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=GCenv/lQ; dkim-atps=neutral
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com
 [IPv6:2607:f8b0:4864:20::243])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48m8Gk1S3lzDrB9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 20:29:34 +1100 (AEDT)
Received: by mail-oi1-x243.google.com with SMTP id q204so6240284oia.13
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Mar 2020 02:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=MutswdInSpZpjBPwJnNTNgNg3J1q8zZ//J/OHQr1kYs=;
 b=GCenv/lQrrkJBSYevb6hGGYdqyjsY5Rd0qEGptyLQKXSj9jacsNIl19ogDQU6NraDL
 wApw3lcV1cpWwB92Gj5aH8e9AYTH8k8zhXlZr8zEgp4m04TQ0cPsqZ2YhbCFPbt63m3w
 ia4a0t3MdWdmjC2u8fY9lR5msUz2ZXQjFmpHEyi4TSDMYIHGQIllrOkDOqsboPvzE9Bn
 zMr67Xt/H1cIjgQ95nefa3lGizOnKj9YmX2wgeEY66yEH79X1Nn8Fhmf+I7SCS3ldWr+
 jlX3hoPauO0NjRxOV+aLsYRdfn+d41ow4OjU2GkjDnX7ex+7dvaht+b3fnMGZ+W2YTJ9
 iKmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MutswdInSpZpjBPwJnNTNgNg3J1q8zZ//J/OHQr1kYs=;
 b=W6UgE5+/dqAJt+Su/xC/6XTAYC6nZaGn6oCprLu/jfOmknjOifUpQRweI0E+SRFQhn
 KBxHtUWGCotgUdnk4GnSAuUN18zNAkUwp4Mts4MT1ULLAmM447xoWCZ/3aV01iIfVptu
 Ovh5/aypK5IR/uKaJKIkjvuJqFISEXIESxJJcoCZ2SH1VLzyzTXozA4t7V+8PB3r08bj
 hNgFXzO01lwioQH/LslwNvMMpTIRBnBjmNedrsE8t7Vh4JPwOMYz+sWHZ7i/0wT3JHk1
 dXImUYpsa1y7rZcqNfcgC7fcqskPFQVkgspmj+1m0Tsp82uxLD6NtFSVmOJozYolrheH
 2N8w==
X-Gm-Message-State: ANhLgQ0VPGquyJTpPqgw9sI5gFD+W3SmPWdSeUid01jf8kdRvxuRYb0r
 Pgfp6MSGNfBaLihXOxtE7zwdqymu5vF19nOSxyhk6KrI
X-Google-Smtp-Source: ADFU+vu+rBLAPJM2IIPcLgOXwYyLmhcDiBRhMc9X2fkkcAKh0UlsC1awNPAcCQ6wr/s9DBP9Ne9cfg1Zsax7o2Vq2I8=
X-Received: by 2002:aca:d68a:: with SMTP id n132mr16961161oig.40.1584955770839; 
 Mon, 23 Mar 2020 02:29:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200320051809.24332-1-jniethe5@gmail.com>
 <20200320051809.24332-5-jniethe5@gmail.com>
 <1584944668.qhbtv64kb2.astroid@bobo.none>
In-Reply-To: <1584944668.qhbtv64kb2.astroid@bobo.none>
From: Jordan Niethe <jniethe5@gmail.com>
Date: Mon, 23 Mar 2020 20:29:19 +1100
Message-ID: <CACzsE9r_=20SXV5XguGsmZFrnj4ADvJ3Fs=sGZfp0sjAKkBoKg@mail.gmail.com>
Subject: Re: [PATCH v4 04/16] powerpc: Use a macro for creating instructions
 from u32s
To: Nicholas Piggin <npiggin@gmail.com>
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
Cc: Alistair Popple <alistair@popple.id.au>,
 Balamuruhan S <bala24@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 23, 2020 at 5:30 PM Nicholas Piggin <npiggin@gmail.com> wrote:
>
> Jordan Niethe's on March 20, 2020 3:17 pm:
> > In preparation for instructions having a more complex data type start
> > using a macro, PPC_INST(), for making an instruction out of a u32.
> > Currently this does nothing, but it will allow for creating a data type
> > that can represent prefixed instructions.
>
> Where is the macro? And, can it be a static inline (and lowercase)
> instead? No big deal if not.
It is in [PATCH v4 03/16] powerpc: Use a datatype for instructions inst.h.
It can be static inline and lower case, I will change that.
>
> Thanks,
> Nick
>
