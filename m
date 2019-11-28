Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0844E10C484
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 08:47:30 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47NqVQ39LwzDqM6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Nov 2019 18:47:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::244;
 helo=mail-oi1-x244.google.com; envelope-from=natechancellor@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="ak2QGyGq"; 
 dkim-atps=neutral
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47NqRr0bqVzDqyB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Nov 2019 18:45:09 +1100 (AEDT)
Received: by mail-oi1-x244.google.com with SMTP id d22so22521034oic.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Nov 2019 23:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=8kiJRE/B/wxbSXxZog9CBfpnC1pt1UKvSf8bBaqAJYE=;
 b=ak2QGyGqDHCjy7nbxkPXZde6Lx0OpuNAOr4gm0HSsjNPc657oJGqKn6WEwgB4ajJ/I
 Fqb1vZbxmKjobjecJ+hpBwzIVooddcrgVbGa6Y0FWnKkrH8FX9KX9yyahyWSm2hbnQKG
 iSFbL9EeJKB8SPQ8xn1Y3SbzzW6suYeWoTil2XA6Mo3xJKKnOwJFOI13NtgXbcdXUfcF
 w2MQB0nzU2xEV0niOetqUjL7jPw/1XB054wyc8G5L7vOZVnKKnymX9kmjcQCCP5APHbi
 CEkVMlgisgiCZ028mcD+Pvg/P2QGAE/n4zJajeimCa07k6dUcbMNPj7eA2MRd+gTfTxf
 uvSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=8kiJRE/B/wxbSXxZog9CBfpnC1pt1UKvSf8bBaqAJYE=;
 b=O9EvzHBAZe8Bm73j91vTxAgERZiHr+oXpYKxGiMlRX2bRYFtHhnqRD2orP1uAkAl3z
 bLJ5LSnlmlvXW6y+etdNL9fN+o/cyLzlt0fnlxDtVxPYow72h/ge+AZf7Te10EOEjco4
 rprzyj/gsDQaVsZc9zvvoz8TELsxsjE8HWC+dQPrs09TsJ62XOdl95jcr7cdXwra/piA
 nYmPpNtC64fx7DUA76svYhGdFNv0cN8SXuQR9lW3Gt8ABPEAzV3vg1XCGN+a0fhs7UF5
 IXKsg0OEUVdbE8/4Wk+jAY6/fD2s5DIKrfb9EwJCPE85kb+G8tt7Bjg8VeavFVGW8Qfl
 RxWg==
X-Gm-Message-State: APjAAAVE86rbmBk6/iFu0X0fFIW4JZNChTuj/Hubwy3ar/zH2Qbl/YRs
 NbQVTEv81rZHN4sRdC8G5Jk=
X-Google-Smtp-Source: APXvYqzaD4ywu4vxa6MdhVQTJ1iRNw5fZuuhJQbHb3CLlD4zmMqcmTlyzdF1HhQzEf3yeKQW+1/uzw==
X-Received: by 2002:a05:6808:6ce:: with SMTP id
 m14mr4510556oih.27.1574927105893; 
 Wed, 27 Nov 2019 23:45:05 -0800 (PST)
Received: from ubuntu-x2-xlarge-x86 ([2604:1380:4111:8b00::7])
 by smtp.gmail.com with ESMTPSA id w2sm2657096otp.55.2019.11.27.23.45.05
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 27 Nov 2019 23:45:05 -0800 (PST)
Date: Thu, 28 Nov 2019 00:45:03 -0700
From: Nathan Chancellor <natechancellor@gmail.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v5 0/3] LLVM/Clang fixes for a few defconfigs
Message-ID: <20191128074503.GA37339@ubuntu-x2-xlarge-x86>
References: <20191014025101.18567-1-natechancellor@gmail.com>
 <20191119045712.39633-1-natechancellor@gmail.com>
 <CAKwvOd=3Ok8A8V30fccK5UzWFZ7zwG_zvGQV44S2BK4o2akbgw@mail.gmail.com>
 <87v9r4zjdw.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v9r4zjdw.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 LKML <linux-kernel@vger.kernel.org>,
 clang-built-linux <clang-built-linux@googlegroups.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 28, 2019 at 03:59:07PM +1100, Michael Ellerman wrote:
> Nick Desaulniers <ndesaulniers@google.com> writes:
> > Hi Michael,
> > Do you have feedback for Nathan? Rebasing these patches is becoming a
> > nuisance for our CI, and we would like to keep building PPC w/ Clang.
> 
> Sorry just lost in the flood of patches.
> 
> Merged now.
> 
> cheers

Thank you very much for picking them up :)

Cheers,
Nathan
