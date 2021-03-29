Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD6F34D0A9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 14:58:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F8CLX2K7Mz301g
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 23:58:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jIMlPhrn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::833;
 helo=mail-qt1-x833.google.com; envelope-from=unixbhaskar@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jIMlPhrn; dkim-atps=neutral
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com
 [IPv6:2607:f8b0:4864:20::833])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F8CL45B5Sz2yTR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 23:58:03 +1100 (AEDT)
Received: by mail-qt1-x833.google.com with SMTP id l13so9162647qtu.9
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 05:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=pXwScAbp9Oc9UUM+Y5MFv/NyYb1m2Ax9bkESJHn7OoM=;
 b=jIMlPhrnPxBkc1eIt0loxmUFn7wXXfPXYhzlXGaYPnegO6aUyr7PCPcsU1Q/nPx2fP
 z9dSO77ODJpoGbIqBdLPzf7Hmx+na9zXd2cZJ4qd9BBfUIDW2OzJWYE465wjBIWAuRrr
 NWCMehNEk3cJZY3zjwb6ZOQi1NkbEq5fCcB0n+UlGn7E/x8I9ZccVrQAOLQEjvvAhPgW
 gyvGu7fxdumQ9rlYgMvh+Gznzjnn6Qsqul2TwzNQVb6EA6ue+DdlAwS1sDkE02lS2xyR
 3n4LD+Mz6IiTzqnrhisHrhIHhSDc4vM/80A7UAKxL/KmVUJHzyawP00LVXC3wRmxEBMs
 lnow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=pXwScAbp9Oc9UUM+Y5MFv/NyYb1m2Ax9bkESJHn7OoM=;
 b=e3CSUW0Tr1dEYWwowgL76wAuPFCUA+fix5IxkxOuiWpiiO/bNOppbQCziFr4LV7fz3
 SCRQkzwk/hD5h206LGYeVtHMxPM5IPzCQFZUCyjbcItO2aaX5e9LHpblj5iP3H8CgUKV
 Ui/Lqkt9LfQpBYORcz99PlZri9usfeUwxlpKqtOEfGyPIN4Qjx3Rumjyf5TjUwIrNtRS
 bPiJZs7lt5oiGBFL4j3kBVJPQXrRhb71ybhAUR1xvUKYJ8pffctFhMWX5n64nFVQ9rGi
 x30TTyvOc16EEvQZ3/PN6ji+FyaOld1L7lF0BPAZZFCyP4ONLV25Br/S6e6+NoewXnrj
 7HHg==
X-Gm-Message-State: AOAM53195TSzl7Lw4NkWxLMt2oqPC5t3O7lpDZWK6SQwisbzxGu7LFaz
 Ol2TlDAUPzOpz5t0cGfZVpk=
X-Google-Smtp-Source: ABdhPJzGuB5bAHBNMyTzE3y0baxdhpY1BDoada/eHGqWehXn5kNmFoyZ95oSsGX4Gf6P46twv8R/cA==
X-Received: by 2002:aed:2ea4:: with SMTP id k33mr22317560qtd.169.1617022681256; 
 Mon, 29 Mar 2021 05:58:01 -0700 (PDT)
Received: from Gentoo ([37.19.198.130])
 by smtp.gmail.com with ESMTPSA id y1sm13368206qki.9.2021.03.29.05.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Mar 2021 05:58:00 -0700 (PDT)
Date: Mon, 29 Mar 2021 18:27:43 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 00/30] DMA: Mundane typo fixes
Message-ID: <YGHOxwiqwhGAs819@Gentoo>
Mail-Followup-To: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>,
 Christoph Hellwig <hch@lst.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 dmaengine@vger.kernel.org, dri-devel@lists.freedesktop.org,
 iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 dave.jiang@intel.com, dan.j.williams@intel.com,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org
References: <cover.1616971780.git.unixbhaskar@gmail.com>
 <20210329052910.GB26495@lst.de> <YGFrvwX8QngvwPbA@Gentoo>
 <YGG+l1EfRuWp0J3A@kroah.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5zclouQno4veQbB1"
Content-Disposition: inline
In-Reply-To: <YGG+l1EfRuWp0J3A@kroah.com>
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
Cc: dave.jiang@intel.com, Linus Torvalds <torvalds@linux-foundation.org>,
 rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
 dmaengine@vger.kernel.org, dan.j.williams@intel.com,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--5zclouQno4veQbB1
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On 13:48 Mon 29 Mar 2021, Greg KH wrote:
>On Mon, Mar 29, 2021 at 11:25:11AM +0530, Bhaskar Chowdhury wrote:
>> On 07:29 Mon 29 Mar 2021, Christoph Hellwig wrote:
>> > I really don't think these typo patchbomb are that useful.  I'm all
>> > for fixing typos when working with a subsystem, but I'm not sure these
>> > patchbombs help anything.
>> >
>> I am sure you are holding the wrong end of the wand and grossly failing to
>> understand.
>
>Please stop statements like this, it is not helpful and is doing nothing
>but ensure that your patches will not be looked at in the future.
>
Greg, don't you think you are bit harsh and have an one sided view? People can
say in better way if they don't like some work. I Have always try to get
along.
>> Anyway, I hope I give a heads up ...find "your way" to fix those damn
>> thing...it's glaring....
>
>There is no requirement that anyone accept patches that are sent to
>them.  When you complain when receiving comments on them, that
>shows you do not wish to work with others.
>
Unfortunate you are only seeing my complains...I don't know why you are so
blindfolded.
>Sorry, but you are now on my local blacklist for a while, and I
>encourage other maintainers to just ignore these patches as well.
>
I can not overrule that ...I know my pathes are trivial ..but it seems some
other problems are looming large.

NOT good Greg....not good seriously.
>thanks,
>
>greg k-h

--5zclouQno4veQbB1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAmBhzsAACgkQsjqdtxFL
KRW2qwf+LpIRIiK3vSyhfOkc5KEs6+JY1kuwY5zK8zNexJI+BFNVlKy2fiJDI5OJ
ohAkhZ7u6VPXdYX4JVipyUMEVaBJRI36ebb2fl5JhhjKdp+xaw+1pP+AMIXET/SS
mxlbUWkBiwZvlebkm26R/LDfJ6BMh8uOTth09mP9SEzfLvL41TJotFlJnCZ7+Akq
RtQfuF4c4a6g4rkBMbKz9GFP35UIl8xrQB9roiynNg8abT7mP0mfBYEa+yofDdA5
dmOmw22RwwuXueZhidrSifQYP4F0h/3zrUTetKYa4MZYUVnIR/Lvpa9K6U6xjuIb
rHZf1I6RXTsmUcErV7E2MR4mZEjStg==
=YLCg
-----END PGP SIGNATURE-----

--5zclouQno4veQbB1--
