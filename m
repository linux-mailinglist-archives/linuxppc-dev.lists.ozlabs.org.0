Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9448E1A7ACD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 14:29:34 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491lDB0nWrzDqcS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 22:29:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::544;
 helo=mail-pg1-x544.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=UTY8X432; dkim-atps=neutral
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491l6v22PxzDqZ1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:24:55 +1000 (AEST)
Received: by mail-pg1-x544.google.com with SMTP id h69so3380858pgc.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 05:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Rb/je2Xt8A81/xIFagwzCqIYQq2/FJP34odIX+hqS1U=;
 b=UTY8X432PCL3xnyTGZfBuHl+0Bru8fmRiTRB3WNI37NEJ7KTMzoFLX2u03Uns6v3uq
 F/zxrSmFmkbGZUSIlNotinDSbHpNioo3BPibPY7Hq3u6abi0GiJHTsb44JDJWQtNBlCL
 vWKBwbGGopau7TdSdq4RHW5AYBcXX3ugO1gg/D9VurF5nr9DU9//Hc3tebF+AEXw7p23
 IjjZGeRtC+Y+5OKiYdSGb61HJWL626shxWK/InsgIDK/s0OVVuqFs8+Mx/Y7v6OWCPfA
 Y3tBiSH2mMbAHzyhVjdorRuJ5pwhgLWdYVX8ynemqDENLjjuLIWBi7zBSb9Y2MMRVhXc
 niCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Rb/je2Xt8A81/xIFagwzCqIYQq2/FJP34odIX+hqS1U=;
 b=NK0aUHnOTwhMur8uRvqM0tWO5678KPr29GBZTwBKH4xETqbpRNqXUROHPdJyZWzIt1
 1VABWCaj17FBFUKWmsqNJROk8L0w3D8vUAZwdbYBZjzAGlp3ptPz04SEfSeHunRUTGuI
 cg71XfWqOu61AzSxlJKGR3qhKM4B5nIM+46hVX8SQ7U35+cmxNShe0u499SPd8irZj4c
 kgXQnSSX8EOWN7rBLljaSaP0jIDXb5pYlDvwvV4pbaFoccbJyeoyd55Q862q6vTFqrIO
 M1rfbsfeprTdtt/xiwxTq5r0W16PZdSuSnsa2YoOjB4e4SbAe+iGR9pfuRT9xjpo75bs
 yDjg==
X-Gm-Message-State: AGi0PubI0PGVuepPLpPVaJOQHZ/6SMRRfzjgRKJC90edOIT2P/wsv8vv
 8IBC8TLb+gTDVrr1nfyKvk0=
X-Google-Smtp-Source: APiQypKChJa2JAz01cF35C6aERv1vm8eZC5rnffnL1LIrhvrzG/AI0EVc0p0VH0u8Wat3QrbLfmOYQ==
X-Received: by 2002:a62:5e86:: with SMTP id
 s128mr23700777pfb.157.1586867092854; 
 Tue, 14 Apr 2020 05:24:52 -0700 (PDT)
Received: from localhost ([203.18.28.220])
 by smtp.gmail.com with ESMTPSA id p19sm1389150pfn.19.2020.04.14.05.24.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Apr 2020 05:24:52 -0700 (PDT)
Date: Tue, 14 Apr 2020 22:23:11 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 0/4] huge vmalloc mappings
To: David Rientjes <rientjes@google.com>
References: <20200413125303.423864-1-npiggin@gmail.com>
 <alpine.DEB.2.21.2004131727150.260270@chino.kir.corp.google.com>
In-Reply-To: <alpine.DEB.2.21.2004131727150.260270@chino.kir.corp.google.com>
MIME-Version: 1.0
Message-Id: <1586866432.g0r7udmtjr.astroid@bobo.none>
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

Excerpts from David Rientjes's message of April 14, 2020 10:27 am:
> On Mon, 13 Apr 2020, Nicholas Piggin wrote:
>=20
>> We can get a significant win with larger mappings for some of the big
>> global hashes.
>>=20
>> Since RFC, relevant architectures have added p?d_leaf accessors so no
>> real arch changes required, and I changed it not to allocate huge
>> mappings for modules and a bunch of other fixes.
>>=20
>=20
> Hi Nicholas,
>=20
> Any performance numbers to share besides the git diff in the last patch i=
n=20
> the series?  I'm wondering if anything from mmtests or lkp-tests makes=20
> sense to try?

Hey, no I don't have any other tests I've run. Some of the networking
hashes do make use of it as well though, and might see a few % in
the right kind of workload. There's probably a bunch of other stuff
where it could help a little bit, looking through the tree, I just don't
have anything specific.

Thanks,
Nick
