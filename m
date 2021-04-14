Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC7935EB9D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 06:02:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKpj5596Fz3bw6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 14:02:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=m+Gr+O/r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::834;
 helo=mail-qt1-x834.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m+Gr+O/r; dkim-atps=neutral
Received: from mail-qt1-x834.google.com (mail-qt1-x834.google.com
 [IPv6:2607:f8b0:4864:20::834])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKphf1rD8z2xdP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 14:02:24 +1000 (AEST)
Received: by mail-qt1-x834.google.com with SMTP id u8so14491923qtq.12
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Apr 2021 21:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :organization:user-agent:mime-version:content-transfer-encoding;
 bh=POVwkCrg6yix+UmIZ+YtP6huYIADITFECEn16EjiHKI=;
 b=m+Gr+O/rIbQNOpN9GP+Y//FW4roiSNrON74CR2WbHFdtFsJzBTakulrFEOhMwJd4gT
 /8N7Gok3/qye41FOoznjdURNoKawLMKUgHK1SvSs2IfLzVxyILDTk3Y5C8OOHWmIvWPy
 r5uwGzWeU/oyoTFuwTD+AGYRAnifox62W0RaIrMtveDCkIfpYDE9vSmYxthHrbM+af3P
 XCvIdJ12V3EO9JDzdg1W1R6hWbWmqBIKAYhywmT/NVHUR1N7iAw0VVVLVuXv9N+sT8y/
 olUEbETH35TYNM0rQRauStSiqsTERkpWxqjoMHWVfd20PblGaXiNszWf+rY26PJbwU13
 ocfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=POVwkCrg6yix+UmIZ+YtP6huYIADITFECEn16EjiHKI=;
 b=ViVmiRpv8+tRcAW3dsvoem9JzLJ2EMetqNTSPtbQAa/QWIb8fqy+wb9UBbESuG3veZ
 q8BAOjmTKsSjitBinFjgYDesqNSCcdvZ03o6qOC6/BMhZXj3KbbQnHvF55wKyg6tI8n7
 KF/GIo/QSVHNorX+LaHM8e6y3DlMca0xeRD0tTJjS+aQp/t743O5ENaGlGOwSPwzfn8y
 W/4YfYmlbrT5M304v0ErnKbn294NCIdavVNvje1ErKh3FqPwWHoH6d9VYluRKKLAEMD6
 kXiV2fHxTicFF+MsWsetLXh2u5TebaCpsp92zsGvC/xRVak/w3tfXZZjNfi9v+IUPCe0
 eh0Q==
X-Gm-Message-State: AOAM533JYiB30bVIhliqUgHoN4qm6ZxBWYUhPby2MsTWOjS6VQmDVV48
 Em/bkGP3mYsEWHgITH2aiHg=
X-Google-Smtp-Source: ABdhPJw7+oho2tIdly9x+CNsOmb1yUSLoNxEA949gbbvAWqfCWgYNojOQ2J7Qy+xdSyWxbzUqD+Nkg==
X-Received: by 2002:a05:622a:454:: with SMTP id
 o20mr33104235qtx.292.1618372941326; 
 Tue, 13 Apr 2021 21:02:21 -0700 (PDT)
Received: from li-908e0a4c-2250-11b2-a85c-f027e903211b.ibm.com
 ([2804:14c:482:7b04::1000])
 by smtp.gmail.com with ESMTPSA id n143sm4176295qke.45.2021.04.13.21.02.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 21:02:20 -0700 (PDT)
Message-ID: <fd20f4fae3d4bc1de0e62a25cead4db00bdd8dbd.camel@gmail.com>
Subject: Re: [PATCH v2 1/1] powerpc/iommu: Enable remaining IOMMU Pagesizes
 present in LoPAR
From: Leonardo Bras <leobras.c@gmail.com>
To: Segher Boessenkool <segher@kernel.crashing.org>, Alexey Kardashevskiy
 <aik@ozlabs.ru>
Date: Wed, 14 Apr 2021 01:02:16 -0300
In-Reply-To: <20210412222143.GO26583@gate.crashing.org>
References: <20210407195613.131140-1-leobras.c@gmail.com>
 <87im4xe3pk.fsf@mpe.ellerman.id.au>
 <8e1ce7e9-415b-92ea-0437-a4331ed3c7f9@ozlabs.ru>
 <87ft01du50.fsf@mpe.ellerman.id.au>
 <21407a96-5b20-3fae-f1c8-895973b655ef@ozlabs.ru>
 <20210412222143.GO26583@gate.crashing.org>
Organization: IBM
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 brking@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2021-04-12 at 17:21 -0500, Segher Boessenkool wrote:
> On Fri, Apr 09, 2021 at 02:36:16PM +1000, Alexey Kardashevskiy wrote:
> > On 08/04/2021 19:04, Michael Ellerman wrote:
> > > > > > +#define QUERY_DDW_PGSIZE_4K	0x01
> > > > > > +#define QUERY_DDW_PGSIZE_64K	0x02
> > > > > > +#define QUERY_DDW_PGSIZE_16M	0x04
> > > > > > +#define QUERY_DDW_PGSIZE_32M	0x08
> > > > > > +#define QUERY_DDW_PGSIZE_64M	0x10
> > > > > > +#define QUERY_DDW_PGSIZE_128M	0x20
> > > > > > +#define QUERY_DDW_PGSIZE_256M	0x40
> > > > > > +#define QUERY_DDW_PGSIZE_16G	0x80
> > > > > 
> > > > > I'm not sure the #defines really gain us much vs just putting the
> > > > > literal values in the array below?
> > > > 
> > > > Then someone says "uuuuu magic values" :) I do not mind either way. 
> > > > Thanks,
> > > 
> > > Yeah that's true. But #defining them doesn't make them less magic, if
> > > you only use them in one place :)
> > 
> > Defining them with "QUERY_DDW" in the names kinda tells where they are 
> > from. Can also grep QEMU using these to see how the other side handles 
> > it. Dunno.
> 
> And *not* defining anything reduces the mental load a lot.  You can add
> a comment at the single spot you use them, explaining what this is, in a
> much better way!
> 
> Comments are *good*.
> 
> 
> Segher

Thanks for the feedback Alexey, Michael and Segher!

I have sent a v3 for this patch. 
http://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210408201915.174217-1-leobras.c@gmail.com/

Please let me know of your feedback in it.

Best regards,
Leonardo Bras

