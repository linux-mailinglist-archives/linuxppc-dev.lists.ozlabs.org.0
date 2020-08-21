Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B39F724D2F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 12:41:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXykV6QNLzDr6T
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 20:41:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZfZ2d783; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BXyh40W4jzDr6W
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 20:39:47 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id q1so651112pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 03:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Skacs7EXPHqa2+iszJrJANOJ0qE5l/8OmxgUeJzvuFY=;
 b=ZfZ2d783cAo/vy9wrAfQVsV1+q70NFpvLIJ3BoYZINr9O786s+tQmwNqHeMpm5O7zn
 OeHng3P+2eSSdKHvQGdxM7DrC0azCxER5jh3PrvGpqN7Y23q1rOPKa4kl+cS+exGEQ+Z
 rneOhz224LM3Js++bPwmJxjiWKyl/+mUR0QxcWkYT53uwjOJQPi76kdkmmmfql4q2yMY
 5YUESktvVqAOCKRFnyPxqZGjYlLBfiOpHGto3CNlAoCjHAG/xfT8PjUzoNr4Ksmu9UB0
 xGlraVIm+bqntt9AYH09O9yJ7x/D67O5a06kMj6rouCJlv6ZT6YIlINaq/EDTR8J0FN5
 /kLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Skacs7EXPHqa2+iszJrJANOJ0qE5l/8OmxgUeJzvuFY=;
 b=YSkyh3nNuAZ31xVlsBw/JZ+YRBTZdEBKxekLUNSQ7vtXBvSeI3b7q9J2CjCB0TB5jq
 3ytQhCWgukcESG1AG/YXUpweTixQcxa+MPNQEBgfY73D9jMfQzyZ4m+kvWZcwSrQB/h3
 w1JeKyhZyItkPiawzRZ+RdIxkyiAhpg0Mooa+FZTG0Dlq30Tj5usDSn40Gx5husLAVyE
 utarAdwUt2J0LmhRgdTjnkYUBrOOAvqZYOmTztorTcjMPairq+FucqrRi5tPflmjtpOV
 U3weVqagM5fViuuCD/+Q4XW8OkLFSV6a3lzq6OltFTZGp4w0iPysgy4TbSr2zhSC03zg
 Ierg==
X-Gm-Message-State: AOAM531HDq/w5R+BUSO2nZ5yh7QYZsc54VcfCXuZolGewldS09WfPAMl
 vyG4IZrvIeyO06zKqhRvt9JDAMS9ZXM=
X-Google-Smtp-Source: ABdhPJzIJef66nd1vfnY7XWT91zvftzIW9FTEQh30rfVNzjQ0tbfwAFB3N+KRw14E+4Hqn6/KGT2Yw==
X-Received: by 2002:a17:90a:fa92:: with SMTP id
 cu18mr1837292pjb.215.1598006385206; 
 Fri, 21 Aug 2020 03:39:45 -0700 (PDT)
Received: from localhost (61-68-212-105.tpgi.com.au. [61.68.212.105])
 by smtp.gmail.com with ESMTPSA id 193sm2120352pfu.169.2020.08.21.03.39.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:39:44 -0700 (PDT)
Date: Fri, 21 Aug 2020 20:39:39 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 5/8] mm: HUGE_VMAP arch support cleanup
To: Andrew Morton <akpm@linux-foundation.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linux-mm@kvack.org
References: <20200821044427.736424-1-npiggin@gmail.com>
 <20200821044427.736424-6-npiggin@gmail.com>
 <9b67b892-9482-15dc-0c1e-c5d5a93a3c91@csgroup.eu>
In-Reply-To: <9b67b892-9482-15dc-0c1e-c5d5a93a3c91@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1598006254.vcbwyiiw9l.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Zefan Li <lizefan@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Jonathan Cameron <Jonathan.Cameron@Huawei.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of August 21, 2020 3:40 pm:
>=20
>=20
> Le 21/08/2020 =C3=A0 06:44, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This changes the awkward approach where architectures provide init
>> functions to determine which levels they can provide large mappings for,
>> to one where the arch is queried for each call.
>>=20
>> This removes code and indirection, and allows constant-folding of dead
>> code for unsupported levels.
>=20
> I think that in order to allow constant-folding of dead code for=20
> unsupported levels, you must define arch_vmap_xxx_supported() as static=20
> inline in a .h
>=20
> If you have them in .c files, you'll get calls to tiny functions that=20
> will always return false, but will still be called and dead code won't=20
> be eliminated. And performance wise, that's probably not optimal either.

Yeah that's true actually, I think I didn't find a good place to add
the prototypes in the arch code but I'll have another look and either
rewrite the changelog or remove it. Although this does get a step closer
at least.

Thanks,
Nick
