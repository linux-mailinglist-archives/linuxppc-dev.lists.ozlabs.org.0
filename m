Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D753C6989
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 06:47:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GP7Qt4zY3z2yN8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jul 2021 14:47:18 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VVffs6yq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=leobras.c@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VVffs6yq; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GP7QS1Mgqz2y6C
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jul 2021 14:46:55 +1000 (AEST)
Received: by mail-pg1-x52a.google.com with SMTP id y4so18035753pgl.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jul 2021 21:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=B7mN8pUEK+PsN4rxzvtJrI4zu8GDWwyoUDEgkpMIvtA=;
 b=VVffs6yqLFSO1bvmduw1ppr+nUinm5pJGtyzlh798GmQVojwS/GJ7sz2MCFt25r1vL
 UVmf1WUzDXvCROejYS/+Gi9QWqS//uAdYagdqx+5avcUsdfvFJmQSfZ51DSMovpnrBH0
 VM8j5XPHHuL7qM1+wGSHZ+ejX2Lto24pkEJV4ofk4oLXQ6SBrtYh9uD0rh8aapQANiYa
 m77A5SUyUGKB0iNZsPZHnFQX9hlriY7s3/R3twpCzP2r1pEmL4Iw+moMp/0nH3LftI5I
 +nWavHH5DXwvvlMgx/L3G3muL1fuoRedib60p6hMwWAjo8pzEooiMz9uwLJQB1u3Dsa4
 L7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=B7mN8pUEK+PsN4rxzvtJrI4zu8GDWwyoUDEgkpMIvtA=;
 b=b5sgjs/Slh6g0uCc6TyCeXuR0jlWDTVHZuSaTzKZ2/ulBm7lrxhxW+dUCIOGVurycx
 q8Yr6AKxPPe/uZiWZfo5amwlQFtEKMpDRSmupxcXiL81OWxDxL02ZO4vcYihmc7ATQlk
 /+7gXhxa+T6bmHKnB7uhMJ3NFreJ3UGDmXNbS75eD5Qf1/UPtcNr+GZaSJFSnGRJxSD6
 ntgPeeJ0XgDsW2m42Yv8M8lqjYLxZ2I6h2uk293URpt2/MBXxrWMwpPY/uHXgNTyL97/
 v0lZ+X1QCDkNUZ4KXos3XE1I6OwzH8a3NPSJ0LoCFS+DzK/MI+SJOQYJuSjX3zxI03W4
 jtyg==
X-Gm-Message-State: AOAM531Pf5qjcJu4O2rIiRUCUhP8iGDUE5IsKwdWwSkP2GIWOKBLnhco
 P3j7+taW15VxP82eVfYgbbI=
X-Google-Smtp-Source: ABdhPJyrRTHCaLSpZio9zhxWM6op9AhNay+1WmcfGc7NYxmTK7DOaAnze3pJ615zSU9NnVrqgSH8MA==
X-Received: by 2002:a62:8f86:0:b029:32e:33d7:998b with SMTP id
 n128-20020a628f860000b029032e33d7998bmr53564pfd.64.1626151612065; 
 Mon, 12 Jul 2021 21:46:52 -0700 (PDT)
Received: from ?IPv6:2804:14c:482:92eb:ffdf:6b35:b94d:258?
 ([2804:14c:482:92eb:ffdf:6b35:b94d:258])
 by smtp.gmail.com with ESMTPSA id w22sm4477765pfu.50.2021.07.12.21.46.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 21:46:51 -0700 (PDT)
Message-ID: <b25dff0f130b9ab721b8b524e55a3cd4c244a8f3.camel@gmail.com>
Subject: Re: [PATCH v4 07/11] powerpc/pseries/iommu: Reorganize
 iommu_table_setparms*() with new helper
From: Leonardo =?ISO-8859-1?Q?Br=E1s?= <leobras.c@gmail.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, Michael Ellerman
 <mpe@ellerman.id.au>,  Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Joel Stanley <joel@jms.id.au>, 
 Christophe Leroy <christophe.leroy@c-s.fr>, Nicolin Chen
 <nicoleotsuka@gmail.com>, Niklas Schnelle <schnelle@linux.ibm.com>
Date: Tue, 13 Jul 2021 01:47:03 -0300
In-Reply-To: <97626d3883ed207b818760a8239babb08a6b5c59.camel@gmail.com>
References: <20210430163145.146984-1-leobras.c@gmail.com>
 <20210430163145.146984-8-leobras.c@gmail.com>
 <e4984fa0-2afe-a987-4fb8-61b878431b1f@ozlabs.ru>
 <97626d3883ed207b818760a8239babb08a6b5c59.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.2 
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Alexey, 

On Fri, 2021-06-18 at 19:26 -0300, Leonardo Brás wrote:
> > 
> > > +                                        unsigned long liobn,
> > > unsigned long win_addr,
> > > +                                        unsigned long
> > > window_size,
> > > unsigned long page_shift,
> > > +                                        unsigned long base,
> > > struct
> > > iommu_table_ops *table_ops)
> > 
> > 
> > iommu_table_setparms() rather than passing 0 around.
> > 
> > The same comment about "liobn" - set it in
> > iommu_table_setparms_lpar().
> > The reviewer will see what field atters in what situation imho.
> > 
> 
> The idea here was to keep all tbl parameters setting in
> _iommu_table_setparms (or iommu_table_setparms_common).
> 
> I understand the idea that each one of those is optional in the other
> case, but should we keep whatever value is present in the other
> variable (not zeroing the other variable), or do someting like:
> 
> tbl->it_index = 0;
> tbl->it_base = basep;
> (in iommu_table_setparms)
> 
> tbl->it_index = liobn;
> tbl->it_base = 0;
> (in iommu_table_setparms_lpar)
> 

This one is supposed to be a question, but I missed the question mark.
Sorry about that.

I would like to get your opinion in this :)



