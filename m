Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52270852C60
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 10:36:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=pJ73C4Oi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYx6m73Tjz3dTS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 20:36:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=marliere.net header.i=@marliere.net header.a=rsa-sha256 header.s=2024 header.b=pJ73C4Oi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2001:4860:4864:20::36; helo=mail-oa1-x36.google.com; envelope-from=rbmarliere@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYx5y5cLzz3bsX
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 20:36:05 +1100 (AEDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-2193ccbb885so1585256fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 01:36:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707816962; x=1708421762;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from
         :dkim-signature:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV0A0nmKsy8PYCSYjFf9mPfVvhSNUYlYMjymmNOi59E=;
        b=Gn1A054J0iieqrQDYjW92Wch9mieHOPMB29tsrpKamXCDgBERiv8uVwUVXz1fIp7ef
         p19taqVwiHXGwxsl464Tn1LRUvo4uXnlW7U712sY2nKNbxqGVXAVyLtm1d8oFqss7wWn
         HvfMKA3H04RPBXyv3b77tm0pIZQiXOXpBJ5pcdpyxVqFJHmirQTkkI/2IAXKkWFVSJ+p
         GTC1O/zOcopyEt8NiEGm8cLyX2PBKYYomZVtZqtBVGB9Gmo+yypXZ37lrm3TfGFBwi5Z
         aSURoE1y5JO+XdBxG7V7hxI3nP6jqeYl603ityDtUjtaQR48l3MSniYdou/PAbArORas
         bIUw==
X-Forwarded-Encrypted: i=1; AJvYcCVhymcN4rehdofOXmEMcdL/REYmEBx8XYdwduQghrevrW92opoa/F2mr3o/+URYIKS/AGq/fSHqTShMTbEWrkwXXfnR+cVlTXGNIKAirw==
X-Gm-Message-State: AOJu0YzJ1STb3E1d0eX5M/5EQrWp2vhl9VSTyxr9sz1ZVB9dldo+2s0z
	ZlZxFcu/Dxc83YgLLOGJfB9ZWByMduID52nhw45KfEQW/+ktoQIM
X-Google-Smtp-Source: AGHT+IEV0juLyM72w0UTnpWw30aYu6RizsUl1I3jQAYodBCs15ZM0PcZkyrB9zcbfuSWzeJAe2rFKA==
X-Received: by 2002:a05:6870:f151:b0:214:dc31:a7b7 with SMTP id l17-20020a056870f15100b00214dc31a7b7mr9928943oac.53.1707816961694;
        Tue, 13 Feb 2024 01:36:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0i4xtDncFjiaK7ebXWKtgp4ly9pKcF9fdePIPWgOogcoPEm2clZQ0NtfYqe4a8vffssieCSQ8RvoDAONhD6sSlwTxuKxAU8ldG4JrYR95dwjogEOz+b2C3EADwJW3y+kRVcPvxltcouBB5yV+/u4xWt9UVwSAVR7Rew0Ai9hcL1+YD1yIdG9AkZDT7mVB6MZ/sDs1VNxi/7HtJfMHRAIpKqvhW2c9GtRA9QD683CDPjcdFB4mk3N9jVMSucsE/88/1ZKnsxd1nXOZmoVYgpU=
Received: from mail.marliere.net ([24.199.118.162])
        by smtp.gmail.com with ESMTPSA id 75-20020a63004e000000b005cd835182c5sm1900121pga.79.2024.02.13.01.36.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 01:36:01 -0800 (PST)
Date: Tue, 13 Feb 2024 06:36:32 -0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marliere.net;
	s=2024; t=1707816959;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yV0A0nmKsy8PYCSYjFf9mPfVvhSNUYlYMjymmNOi59E=;
	b=pJ73C4OixTpldSUovTEuAHoBhghosBc1RxXObdohFcUEXsZzdeug1EOAqXziyMfbmqfK3k
	5PZxFCWzoIphrEHAe0vFzIB2aVyaBtWYBgHAiRXRxMdirgLSdJxN9oLRVGTmhCYTolPHxj
	HxkfzdQ3x0v2ve+pDbt4/ounJ48m76fv+X5drcqoVgh4YenV585mcYLPIV+W8WMS4UIy1p
	m+B4mZIHGhNk/MKo4kPnN/1KZjwH2yRkBf6i7XrUk+sAIE0AhpmTREGlg4sdR7ZcNK5wzf
	m3tu0bq1uzX7DUIsHQdD+wONmsWHm81pBj0LYpOuZ9VA1xaDQbqm0siKHvhCxA==
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=ricardo@marliere.net smtp.mailfrom=ricardo@marliere.net
From: "Ricardo B. Marliere" <ricardo@marliere.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2 0/5] powerpc: struct bus_type cleanup
Message-ID: <h5f4bo5awkidvp75yusn4fkjybdrxdaz3d366zhd4xsu45cska@nxm362wm33g3>
References: <20240212-bus_cleanup-powerpc2-v2-0-8441b3f77827@marliere.net>
 <417a6531-b298-4d5c-aa4d-755bcef2f414@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <417a6531-b298-4d5c-aa4d-755bcef2f414@csgroup.eu>
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On 13 Feb 08:05, Christophe Leroy wrote:
> Hi
> 
> Le 12/02/2024 à 21:04, Ricardo B. Marliere a écrit :
> > This series is part of an effort to cleanup the users of the driver
> > core, as can be seen in many recent patches authored by Greg across the
> > tree (e.g. [1]). Patch 1/5 is a prerequisite to 2/5, but the others have
> > no dependency. They were built using bootlin's without warnings using
> > powerpc64le-power8--glibc--stable-2023.11-1 toolchain.
> > 
> > ---
> > [1]: https://lore.kernel.org/lkml/?q=f%3Agregkh%40linuxfoundation.org+s%3A%22make%22+and+s%3A%22const%22
> > 
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>
> > 
> > ---
> > Changes in v2:
> > - Added a new patch to make macio_bus_type const.
> > - Improved changelogs to remove the word "Now".
> > - Fixed a build error: https://lore.kernel.org/oe-kbuild-all/202402102142.uphiKeqw-lkp@intel.com/
> > - Link to v1: https://lore.kernel.org/r/20240209-bus_cleanup-powerpc2-v1-0-79a56dcaebb1@marliere.net
> 
> I see another series with the same name, does this v2 also superseeds it 
> ? https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=393570

Yes, please disregard the other one!

Thank you,
-	Ricardo.


> 
> Christophe
> 
> > 
> > ---
> > Ricardo B. Marliere (5):
> >        powerpc: vio: move device attributes into a new ifdef
> >        powerpc: vio: make vio_bus_type const
> >        powerpc: mpic: make mpic_subsys const
> >        powerpc: pmac: make macio_bus_type const
> >        powerpc: ibmebus: make ibmebus_bus_type const
> > 
> >   arch/powerpc/include/asm/ibmebus.h       |  2 +-
> >   arch/powerpc/include/asm/macio.h         |  2 +-
> >   arch/powerpc/include/asm/mpic.h          |  2 +-
> >   arch/powerpc/include/asm/vio.h           |  2 +-
> >   arch/powerpc/platforms/pseries/ibmebus.c |  4 +--
> >   arch/powerpc/platforms/pseries/vio.c     | 61 ++++++++++++++++++--------------
> >   arch/powerpc/sysdev/mpic.c               |  2 +-
> >   drivers/macintosh/macio_asic.c           |  2 +-
> >   8 files changed, 43 insertions(+), 34 deletions(-)
> > ---
> > base-commit: 41bccc98fb7931d63d03f326a746ac4d429c1dd3
> > change-id: 20240209-bus_cleanup-powerpc2-498426fccb98
> > 
> > Best regards,
