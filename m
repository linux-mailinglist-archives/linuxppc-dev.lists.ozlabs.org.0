Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B61A302460
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 12:41:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DPScl6N5JzDqDT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 22:41:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::634;
 helo=mail-pl1-x634.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vcl7mmpM; dkim-atps=neutral
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DPSX35xfwzDqfX
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 22:37:20 +1100 (AEDT)
Received: by mail-pl1-x634.google.com with SMTP id t6so7443860plq.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 03:37:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=lyJL5RmrtYo3SR2xmnLNbqSqvpRFTAglsJ8iapGc2cU=;
 b=vcl7mmpM9cZo4dan8q3yYSJT0AyPGuHr3thpLqcrviOPOA41GAV3uo8D9VYuRQpTEp
 NnWoNXgf7XiKyty0VOn5VbeqVuykZioqekTbXVF9PKingcpZ9ZPskR2CmcKT8oTmuwq/
 T7qFyq/23apKBb45YIT2xz4SPpF9AB8Kb3QAjtbIe+yEEWKAQ/ST0g9B4M8UN6ZKWTad
 As/BPdDcOaHyjYZWsaiMuOVWMDVK62za1SQeWu83BrFJQr3s2JJjNNU/VaFp8qR4nLhm
 v5VdwwKX77foe4XldOYA1/2BzkKBNx8Kg36s6ydAN2/eKN6RPp/NsH2Ml6W6IQffgDCG
 ZeAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=lyJL5RmrtYo3SR2xmnLNbqSqvpRFTAglsJ8iapGc2cU=;
 b=E/zFEfnwmnZZ1BZIl7azxQuYX7FY6HEEUElNsCNwCYPSHLplTkGbzFMwfobmga9Xkl
 QCd+OopC7F7hlI3nUlvpAQqwSyEqnT15yuDkEQBNPzjEXfUv1mtu+alsXUB5Yq2Pgjc3
 EbuN3V2BDaNsPz+xsGMeTWu5rfbUaL01bUF+jHPSGrP0+4vrpHbl7K7iDqJkOP634zR0
 dpQMC5xVFYkJwDRmcfVUPnjBSsky6uYfPxUmCRL/I+uMl4hsNdhTztEe+vqsXut+Bq2b
 mPPR51QfVLP3GjEqz4GwYHzQ7ghGpr84eLMrttyMMcePvdZd0vJOUp8DIZHyV5UyDK2W
 TVMg==
X-Gm-Message-State: AOAM533q6b1k1PePBDL2QsFuxQdWhmM1WspK+IYxSd6OUxF49Cl8IOd9
 wi8g07udaFvE19KvGbZDSJg=
X-Google-Smtp-Source: ABdhPJwQaEG7os5ttUkuIQn0Krrn6BcNJkyonQbGJcEmjaCMBQ8fY8SMo+YBjwAoUiTKyR2QsVZxLg==
X-Received: by 2002:a17:902:59c1:b029:df:fd49:f08d with SMTP id
 d1-20020a17090259c1b02900dffd49f08dmr200075plj.76.1611574636100; 
 Mon, 25 Jan 2021 03:37:16 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id x125sm13108821pfd.17.2021.01.25.03.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 03:37:14 -0800 (PST)
Date: Mon, 25 Jan 2021 21:37:08 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v10 06/12] powerpc: inline huge vmap supported functions
To: Andrew Morton <akpm@linux-foundation.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, linux-mm@kvack.org
References: <20210124082230.2118861-1-npiggin@gmail.com>
 <20210124082230.2118861-7-npiggin@gmail.com>
 <c03010a7-a358-0321-d5d4-80a770c2213f@csgroup.eu>
In-Reply-To: <c03010a7-a358-0321-d5d4-80a770c2213f@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1611574452.y64320stks.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Zefan Li <lizefan@huawei.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of January 25, 2021 6:42 pm:
>=20
>=20
> Le 24/01/2021 =C3=A0 09:22, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This allows unsupported levels to be constant folded away, and so
>> p4d_free_pud_page can be removed because it's no longer linked to.
>=20
> Ah, ok, you did it here. Why not squashing this patch into patch 5 direct=
ly ?

To reduce arch code movement in the first patch and split up these arch
patches to get separate acks for them.

Maybe overkill for these changes but doesn't hurt I think.

Thanks,
Nick
